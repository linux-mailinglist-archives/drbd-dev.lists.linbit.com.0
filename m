Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D695D41A295
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:06:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E247B420962;
	Tue, 28 Sep 2021 00:06:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF81242062B
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tG8cam/XDT2SqSq+KO9LsRJ8EhJRU6E2udZdmJan7KU=;
	b=g0Vd2Ijjj9zsDyU8t7j0CK91EA
	v7BCEM2ruytnp2jd68hUDBrkHzYUY3FLJiWdR8xhFZZkaeqY1HOdu7egCLMLB7p7kYyXv6p85Acog
	7TNHe3KAQFiZiZ/0K/FVkZjLTY+2ZBsi+T6lrceiHDC3iHRvt80jQCCW3AW7YsnLJn03oTON1aVWG
	kzhuOxkyQpLIbiBm5+sWhYj48Ft+5UhMv/bo7DCYeo1d2euLclfrI/WZ5lavETGaWqL0ECP5vtyM6
	4iRrJu/tEJJWS6rz6GSqxbhdRiVCjk+ZlqN4Yw62pdnYMfZOJ74JZjbO9M8Nm9fxKR7EOrTf6brzq
	OQ9rjZGg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygR-004TPS-UF; Mon, 27 Sep 2021 22:01:11 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:02 -0700
Message-Id: <20210927220110.1066271-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 07/15] n64cart: add error handling support for
	add_disk()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/n64cart.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 26798da661bd..35aa5d38f57d 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -117,6 +117,7 @@ static const struct block_device_operations n64cart_fops = {
 static int __init n64cart_probe(struct platform_device *pdev)
 {
 	struct gendisk *disk;
+	int err = -ENOMEM;
 
 	if (!start || !size) {
 		pr_err("start or size not specified\n");
@@ -134,7 +135,7 @@ static int __init n64cart_probe(struct platform_device *pdev)
 
 	disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!disk)
-		return -ENOMEM;
+		goto out;
 
 	disk->first_minor = 0;
 	disk->flags = GENHD_FL_NO_PART_SCAN;
@@ -149,11 +150,18 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	blk_queue_physical_block_size(disk->queue, 4096);
 	blk_queue_logical_block_size(disk->queue, 4096);
 
-	add_disk(disk);
+	err = add_disk(disk);
+	if (err)
+		goto out_cleanup_disk;
 
 	pr_info("n64cart: %u kb disk\n", size / 1024);
 
 	return 0;
+
+out_cleanup_disk:
+	blk_cleanup_disk(disk);
+out:
+	return err;
 }
 
 static struct platform_driver n64cart_driver = {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
