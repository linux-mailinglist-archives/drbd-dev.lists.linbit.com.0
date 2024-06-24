Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 308279143AB
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 09:27:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B0DD742062D;
	Mon, 24 Jun 2024 09:27:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m25467.xmail.ntesmail.com (mail-m25467.xmail.ntesmail.com
	[103.129.254.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C989F4205A6
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 09:27:02 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 094157E06E3
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:23 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 07/11] drbd_transport_rdma: put kref in dtr_remap_tx_desc error
Date: Mon, 24 Jun 2024 13:46:15 +0800
Message-Id: <20240624054619.23212-7-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUxKVkgfTxkZTUhLGU5MGVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c7fbcd022ckunm094157e06e3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Pzo4EjceHAIIGSg6HBpO
	Fi8wC0tVSlVKTEpCSUtMQkNPTk5KVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpOQ0M3Bg++
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

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index c7adc87e3..77ff0055e 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2355,8 +2355,11 @@ static int dtr_repost_tx_desc(struct dtr_cm *old_cm, struct dtr_tx_desc *tx_desc
 			return -ECONNRESET;
 
 		err = dtr_remap_tx_desc(old_cm, cm, tx_desc);
-		if (err)
+		if (err) {
+			pr_err("dtr_remap_tx_desc failed cm : %px\n", cm);
+			kref_put(&cm->kref, dtr_destroy_cm);
 			continue;
+		}
 
 		err = __dtr_post_tx_desc(cm, tx_desc);
 		if (!err) {
-- 
2.27.0

