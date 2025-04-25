Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FCA9CC4A
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Apr 2025 17:04:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A15EE16B844;
	Fri, 25 Apr 2025 17:04:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m1973190.qiye.163.com (mail-m1973190.qiye.163.com
	[220.197.31.90])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C372B160645
	for <drbd-dev@lists.linbit.com>; Fri, 25 Apr 2025 17:04:03 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 8cf02a92;
	Fri, 25 Apr 2025 18:24:22 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] rdma: Fix cm leak
Date: Fri, 25 Apr 2025 18:24:21 +0800
Message-ID: <20250425102421.1673048-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0NOVhpIThkfS0pJHkNJQlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a966c7a14ed0227kunm8cf02a92
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P0k6Myo4ODcUMzAIEVZDMTUu
	HRoaCQlVSlVKTE9OTkxNTU1ISUtOVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUhLSUs3Bg++
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

We found that when all the DRBDs is down, the reference count
of the drbd_transport_rdma module is still 1.

[root@node-4 ~]# drbdadm status
No currently configured DRBD found.
[root@node-4 ~]# lsmod | grep drbd
drbd_transport_rdma   262144  1

Then, we found an unreleas cm structure and discover
that its state is DSB_CONNECT_REQ + DSB_ERROR.

crash> struct dtr_cm ffff57e515da9400
struct dtr_cm {
  kref = {
    refcount = {
      refs = {
        counter = 1
...
state = 9,
...
}

The scenario of this problem should be like this:
dtr_cma_event_handler() get an RDMA_CM_EVENT_CONNECT_REQUEST event,
and call dtr_cma_accept() to alloc a cm. and set cm->state = DSM_CONNECT_REQ,
now the cm->kref count is 2.
then dtr_cma_event_handler() get xxx_CONNECT_ERROR/xxx_UNREACHABLE/xxx_REJECTED
event, and set_bit(DSB_ERROR, &cm->state).
the cm remove from path in dtr_cma_retry_connect, put one ref.
and cm->state dont has DSB_CONNECTING flag, then return 0.
Now, the cm->kref count is 1, and state is DSB_CONNECT_REQ + DSB_ERROR.

Therefore, when we test the DSB_CONNECTING flag,
we should also test the DSB_CONNECT_REQ flag to avoid cm leak.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index be919a926..f24440580 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1307,9 +1307,10 @@ static int dtr_cma_event_handler(struct rdma_cm_id *cm_id, struct rdma_cm_event
 		set_bit(DSB_ERROR, &cm->state);
 
 		dtr_cma_retry_connect(cm->path, cm);
-		if (!test_and_clear_bit(DSB_CONNECTING, &cm->state))
-			return 0; /* keep ref; __dtr_disconnect_path() won */
-		break;
+		if (test_and_clear_bit(DSB_CONNECTING, &cm->state) ||
+			test_and_clear_bit(DSB_CONNECT_REQ, &cm->state))
+			break;
+		return 0; /* keep ref; __dtr_disconnect_path() won */
 
 	case RDMA_CM_EVENT_DISCONNECTED:
 		// pr_info("%s: RDMA_CM_EVENT_DISCONNECTED\n", cm->name);
@@ -2787,7 +2788,8 @@ static void __dtr_disconnect_path(struct dtr_path *path)
 	 * events. Destroy the cm and cm_id to avoid leaking it.
 	 * This is racing with the event delivery, which drops a reference.
 	 */
-	if (test_and_clear_bit(DSB_CONNECTING, &cm->state))
+	if (test_and_clear_bit(DSB_CONNECTING, &cm->state) ||
+		test_and_clear_bit(DSB_CONNECT_REQ, &cm->state))
 		kref_put(&cm->kref, dtr_destroy_cm);
 
 	kref_put(&cm->kref, dtr_destroy_cm);
-- 
2.43.0

