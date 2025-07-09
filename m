Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80203AFDF2F
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Jul 2025 07:22:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0CDCA162287;
	Wed,  9 Jul 2025 07:22:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 4004 seconds by postgrey-1.31 at mail19;
	Wed, 09 Jul 2025 07:22:02 CEST
Received: from mail-m15592.qiye.163.com (mail-m15592.qiye.163.com
	[101.71.155.92])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A24A7160917
	for <drbd-dev@lists.linbit.com>; Wed,  9 Jul 2025 07:22:00 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id cbe5d3f3;
	Wed, 9 Jul 2025 10:55:57 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 3/3] rdma: Get drbd_path->kref when get drbd_path by addr
Date: Wed,  9 Jul 2025 10:55:52 +0800
Message-ID: <20250709025553.694792-3-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
References: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkNNVkkYHhhLGhkZGh1MGlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a97ed1c7ee40227kunm0bf5c36f9d5923
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Dxw6CzdDPgw#UU4UMk0h
	FU4aC0lVSlVKTE5JS0lCTE5DSE1LVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlCQko3Bg++
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

In the dtr_cma_accept() function, after obtain the drbd_path
through peer_addr, without take a reference,
the drbd_path may be released concurrently, leade to a use-after-free.

So when we obtain drbd_path, we add a reference count.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 442dd8e89..68c668f7f 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -969,6 +969,8 @@ static int dtr_cma_accept(struct dtr_listener *listener, struct rdma_cm_id *new_
 
 	spin_lock(&listener->listener.waiters_lock);
 	drbd_path = drbd_find_path_by_addr(&listener->listener, peer_addr);
+	if (drbd_path)
+		kref_get(&drbd_path->kref);
 	spin_unlock(&listener->listener.waiters_lock);
 
 	if (!drbd_path) {
@@ -997,16 +999,13 @@ static int dtr_cma_accept(struct dtr_listener *listener, struct rdma_cm_id *new_
 
 	path = container_of(drbd_path, struct dtr_path, path);
 	cs = &path->cs;
-	if (atomic_read(&cs->passive_state) < PCS_CONNECTING) {
-		rdma_reject(new_cm_id, NULL, 0, IB_CM_REJ_CONSUMER_DEFINED);
-		return -EAGAIN;
-	}
+	if (atomic_read(&cs->passive_state) < PCS_CONNECTING)
+		goto reject;
 
 	cm = dtr_alloc_cm(path);
 	if (!cm) {
 		pr_err("rejecting connecting since -ENOMEM for cm\n");
-		rdma_reject(new_cm_id, NULL, 0, IB_CM_REJ_CONSUMER_DEFINED);
-		return -EAGAIN;
+		goto reject;
 	}
 
 	cm->state = DSM_CONNECT_REQ;
@@ -1024,17 +1023,21 @@ static int dtr_cma_accept(struct dtr_listener *listener, struct rdma_cm_id *new_
 	/* Gifting the initial kref to the path->cm pointer */
 	err = dtr_path_prepare(path, cm, false);
 	if (err) {
-		rdma_reject(new_cm_id, NULL, 0, IB_CM_REJ_CONSUMER_DEFINED);
 		/* Returning the cm via ret_cm and an error causes the caller to put one ref */
-
-		return -EAGAIN;
+		goto reject;
 	}
+	kref_put(&drbd_path->kref, drbd_destroy_path);
 
 	err = rdma_accept(new_cm_id, &dtr_conn_param);
 	if (err)
 		kref_put(&cm->kref, dtr_destroy_cm);
 
 	return err;
+
+reject:
+	rdma_reject(new_cm_id, NULL, 0, IB_CM_REJ_CONSUMER_DEFINED);
+	kref_put(&drbd_path->kref, drbd_destroy_path);
+	return -EAGAIN;
 }
 
 static int dtr_start_try_connect(struct dtr_connect_state *cs)
-- 
2.43.0

