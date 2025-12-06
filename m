Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 99753CAA2AD
	for <lists+drbd-dev@lfdr.de>; Sat, 06 Dec 2025 09:18:28 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0097E163109;
	Sat,  6 Dec 2025 09:18:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Sat, 06 Dec 2025 09:17:37 CET
Received: from mail-m93129.xmail.ntesmail.com (mail-m93129.xmail.ntesmail.com
	[103.126.93.129])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1999D16091C
	for <drbd-dev@lists.linbit.com>; Sat,  6 Dec 2025 09:17:36 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13fe2f035
	for <drbd-dev@lists.linbit.com>;
	Sat, 6 Dec 2025 16:12:29 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 2/4] rdma: Put kref in dtr_remap_tx_desc error
Date: Sat,  6 Dec 2025 16:12:25 +0800
Message-ID: <20251206081227.1237575-2-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
References: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2b834820227kunmdf22d26a1287f81
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGRlIVk4fT0IaTh0aSx1LTFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
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

From: Dongsheng Yang <dongsheng.yang@easystack.cn>

The dtr_select_and_get_cm_for_tx() get a ref, we need put it before
continue.

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 3addb7e42..5a28f58f0 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2391,8 +2391,11 @@ static int dtr_repost_tx_desc(struct dtr_cm *old_cm, struct dtr_tx_desc *tx_desc
 			return -ECONNRESET;
 
 		err = dtr_remap_tx_desc(old_cm, cm, tx_desc);
-		if (err)
+		if (err) {
+			tr_err(&rdma_transport->transport, "dtr_remap_tx_desc failed: %d\n", err);
+			kref_put(&cm->kref, dtr_destroy_cm);
 			continue;
+		}
 
 		err = __dtr_post_tx_desc(cm, tx_desc);
 		if (!err) {
-- 
2.43.0

