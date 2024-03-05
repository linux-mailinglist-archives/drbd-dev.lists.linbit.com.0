Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E72872072
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Mar 2024 14:40:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 827704203DF;
	Tue,  5 Mar 2024 14:40:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8641E420301
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 14:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=f3zgMPRzyEaVBtSoLHLNya392ZrbcPY31mEsET5i7T0=;
	b=s/SuFmhRABlJihe04dU7SVg3al
	liZ5j3moGRX+lOh6f1gdCeUqjBGRciENRlMw1s+7qpjD3jmEABmXHP3BuarEZ28efhJajIrJFnXTA
	r5nZA8GME/Mzic/dbLGtm+ZaK27uy3fIR9+/s3bbWQT52j8QYIdnrQLMm3zI8JOkSg7l0qfK40Yiw
	lMNbXOd7g2LC6Sjqtnag/ILvhDhzDhhe71KPUSiaRAfXbRHaA4+Pq2kqjXUqzRQv794JzkehY1TiF
	81YdFKKP2LT0mP3J4YOlPFEh2KnlKi4WxE6hDvy3ZPkfh0uPaHCq+5ZolFgKKcc6PBNtG28/pjTp3
	mm+gyoWA==;
Received: from [50.219.53.154] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhV2A-0000000Dqwj-3i1T; Tue, 05 Mar 2024 13:40:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/7] drbd: pass the max_hw_sectors limit to blk_alloc_disk
Date: Tue,  5 Mar 2024 06:40:35 -0700
Message-Id: <20240305134041.137006-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305134041.137006-1-hch@lst.de>
References: <20240305134041.137006-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
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

Pass a queue_limits structure with the max_hw_sectors limit to
blk_alloc_disk instead of updating the limit on the allocated gendisk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index cea1e537fd56c1..113b441d4d3670 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2690,6 +2690,14 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	int id;
 	int vnr = adm_ctx->volume;
 	enum drbd_ret_code err = ERR_NOMEM;
+	struct queue_limits lim = {
+		/*
+		 * Setting the max_hw_sectors to an odd value of 8kibyte here.
+		 * This triggers a max_bio_size message upon first attach or
+		 * connect.
+		 */
+		.max_hw_sectors		= DRBD_MAX_BIO_SIZE_SAFE >> 8,
+	};
 
 	device = minor_to_device(minor);
 	if (device)
@@ -2708,7 +2716,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	drbd_init_set_defaults(device);
 
-	disk = blk_alloc_disk(NULL, NUMA_NO_NODE);
+	disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_no_disk;
@@ -2729,9 +2737,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
 	blk_queue_write_cache(disk->queue, true, true);
-	/* Setting the max_hw_sectors to an odd value of 8kibyte here
-	   This triggers a max_bio_size message upon first attach or connect */
-	blk_queue_max_hw_sectors(disk->queue, DRBD_MAX_BIO_SIZE_SAFE >> 8);
 
 	device->md_io.page = alloc_page(GFP_KERNEL);
 	if (!device->md_io.page)
-- 
2.39.2

