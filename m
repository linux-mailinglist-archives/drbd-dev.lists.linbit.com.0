Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0BCA913F3
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Apr 2025 08:23:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F7EA16B8E4;
	Thu, 17 Apr 2025 08:23:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 602 seconds by postgrey-1.31 at mail19;
	Thu, 17 Apr 2025 08:23:33 CEST
Received: from mail-m8367.xmail.ntesmail.com (mail-m8367.xmail.ntesmail.com
	[156.224.83.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2ED7B160919
	for <drbd-dev@lists.linbit.com>; Thu, 17 Apr 2025 08:23:33 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 863032e1;
	Thu, 17 Apr 2025 14:08:20 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] rdma: Fix cm leaks in some abnormal scenarios
Date: Thu, 17 Apr 2025 14:08:19 +0800
Message-ID: <20250417060819.2157347-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQxkaVkwdGU5NTEMeTUwdHVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96425ccdf30227kunm863032e1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzI6Qjo4OTcPCkwaSS0PQwEK
	LyEaCUxVSlVKTE9PQ0xLSktKTk5NVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlPTUM3Bg++
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

In dtr_create_rx_desc() function, if ib_dma_map_single() return an
error, it goes to error code branch, which does not subtract 1
from the reference count of cm.

In dtr_post_tx_desc() function, in the retry code branch, has similar issues.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd-headers          |  2 +-
 drbd/drbd_transport_rdma.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drbd/drbd-headers b/drbd/drbd-headers
index 94f447251..9188ee14f 160000
--- a/drbd/drbd-headers
+++ b/drbd/drbd-headers
@@ -1 +1 @@
-Subproject commit 94f4472513f351efba5788f783feba6ac6efe9fc
+Subproject commit 9188ee14f6de582a493d260c091db0c655b30d50
diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 9ce15a0ce..be919a926 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2080,8 +2080,10 @@ static int dtr_create_rx_desc(struct dtr_flow *flow, gfp_t gfp_mask)
 	rx_desc->sge.addr = ib_dma_map_single(cm->id->device, page_address(page), alloc_size,
 					      DMA_FROM_DEVICE);
 	err = ib_dma_mapping_error(cm->id->device, rx_desc->sge.addr);
-	if (err)
-		goto out;
+	if (err) {
+		tr_err(transport, "ib_dma_map_single() failed %d\n", err);
+		goto out_put;
+	}
 	rx_desc->sge.length = alloc_size;
 
 	atomic_inc(&flow->rx_descs_allocated);
@@ -2094,6 +2096,9 @@ static int dtr_create_rx_desc(struct dtr_flow *flow, gfp_t gfp_mask)
 		dtr_free_rx_desc(rx_desc);
 	}
 	return err;
+
+out_put:
+	kref_put(&cm->kref, dtr_destroy_cm);
 out:
 	kfree(rx_desc);
 	drbd_free_pages(transport, page, 0);
@@ -2396,9 +2401,10 @@ retry:
 		return -EINTR;
 
 	flow = &cm->path->flow[stream];
-	if (atomic_dec_if_positive(&flow->peer_rx_descs) < 0)
+	if (atomic_dec_if_positive(&flow->peer_rx_descs) < 0) {
+		kref_put(&cm->kref, dtr_destroy_cm);
 		goto retry;
-
+	}
 	device = cm->id->device;
 	switch (tx_desc->type) {
 	case SEND_PAGE:
-- 
2.43.0

