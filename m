Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE99A3AFF2
	for <lists+drbd-dev@lfdr.de>; Wed, 19 Feb 2025 04:13:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 650D616B901;
	Wed, 19 Feb 2025 04:13:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Wed, 19 Feb 2025 04:13:11 CET
Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com
	[45.254.49.214])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D6EE16B901
	for <drbd-dev@lists.linbit.com>; Wed, 19 Feb 2025 04:13:09 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e0df5f;
	Wed, 19 Feb 2025 11:08:04 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] rdma: Fix drbd_transport_rdma module reference count exception
Date: Wed, 19 Feb 2025 11:08:04 +0800
Message-ID: <20250219030804.1389397-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR5NVkseT05MTh8dHU0dQ1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a951c2d49920227kunm53e0df5f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mk06Hjo4EzcRPQtIMRxJEQ8u
	TitPCk9VSlVKTEhCQkhPT0NOQ05LVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpITUI3Bg++
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

In testing, we find drbd_transport_rdma module reference count is abnormal:
drbd_transport_rdma 262144 28293

we don't have that many drbd devices.

If the XXX_ADDR_ERROR/XXX_ROUTE_ERROR events occurs
and the DSB_CONNECTING flag bit is not set,
the dtr_cma_event_handler() returns 0 directly.
The cm structure cannot be destroyed,
and the drbd_transport_rdma module reference count is abnormal.

So, for XXX_ADDR_ERROR/XXX_ROUTE_ERROR events,
we do not need to judge the DSB_CONNECTING flag,
and we need to kref_put of cm structure.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index ba4f1baa7..bb59e6501 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1292,6 +1292,11 @@ static int dtr_cma_event_handler(struct rdma_cm_id *cm_id, struct rdma_cm_event
 		// pr_info("%s: RDMA_CM_EVENT_ADDR_ERROR\n", cm->name);
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		// pr_info("%s: RDMA_CM_EVENT_ROUTE_ERROR\n", cm->name);
+		set_bit(DSB_ERROR, &cm->state);
+
+		dtr_cma_retry_connect(cm->path, cm);
+		break;
+
 	case RDMA_CM_EVENT_CONNECT_ERROR:
 		// pr_info("%s: RDMA_CM_EVENT_CONNECT_ERROR\n", cm->name);
 	case RDMA_CM_EVENT_UNREACHABLE:
-- 
2.43.0

