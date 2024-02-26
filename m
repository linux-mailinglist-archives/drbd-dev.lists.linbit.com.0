Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 466658673B5
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:44:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8EAB4420649;
	Mon, 26 Feb 2024 12:44:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BCE142021F
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=s9Pu6ieiVUWU70yfnx7yKzpl91lyIUDqJOc53o+My9E=;
	b=CaiDPLJHzFCmDHSc+Mx/pvIeky
	zwcsrnu0CSMPxozxPbn1+L3cXr6qMDKSJvUz4nQ8UPISIdQccGI5w1vlmgXltWXiWJpRqgJ6jV1cJ
	AKziYg6vQh33tJLm83DZbbeA67hbEWNHxrhe3VjuoA+i5pq+G1dLEgEyJRjuWYMTn5fKJ7uSq/9Bl
	E18C8f8d2HzDfsMXFeH56jUJn1WB8qv0F7zaU0S+XN2D8JWEpeC26JBRxC+6RS51290oO5L75a1oy
	n2Gh1YIC6Uhgu9cbiA2X/7pafimy9XNIsQ+ghB+QnF4svWoPi2nfxo3ktE26Cqd5y5IE+ahkOVYiM
	34bBEG7w==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYGD-000000004sb-495B; Mon, 26 Feb 2024 10:31:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 09/16] block: remove disk_stack_limits
Date: Mon, 26 Feb 2024 11:29:57 +0100
Message-Id: <20240226103004.281412-10-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226103004.281412-1-hch@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
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

disk_stack_limits is unused now, remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 24 ------------------------
 include/linux/blkdev.h |  2 --
 2 files changed, 26 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 13865a9f89726c..3c7d8d638ab59d 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -916,30 +916,6 @@ void queue_limits_stack_bdev(struct queue_limits *t, struct block_device *bdev,
 }
 EXPORT_SYMBOL_GPL(queue_limits_stack_bdev);
 
-/**
- * disk_stack_limits - adjust queue limits for stacked drivers
- * @disk:  MD/DM gendisk (top)
- * @bdev:  the underlying block device (bottom)
- * @offset:  offset to beginning of data within component device
- *
- * Description:
- *    Merges the limits for a top level gendisk and a bottom level
- *    block_device.
- */
-void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
-		       sector_t offset)
-{
-	struct request_queue *t = disk->queue;
-
-	if (blk_stack_limits(&t->limits, &bdev_get_queue(bdev)->limits,
-			get_start_sect(bdev) + (offset >> 9)) < 0)
-		pr_notice("%s: Warning: Device %pg is misaligned\n",
-			disk->disk_name, bdev);
-
-	disk_update_readahead(disk);
-}
-EXPORT_SYMBOL(disk_stack_limits);
-
 /**
  * blk_queue_update_dma_pad - update pad mask
  * @q:     the request queue for the device
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 285e82723d641f..75c909865a8b7b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -926,8 +926,6 @@ extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 			    sector_t offset);
 void queue_limits_stack_bdev(struct queue_limits *t, struct block_device *bdev,
 		sector_t offset, const char *pfx);
-extern void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
-			      sector_t offset);
 extern void blk_queue_update_dma_pad(struct request_queue *, unsigned int);
 extern void blk_queue_segment_boundary(struct request_queue *, unsigned long);
 extern void blk_queue_virt_boundary(struct request_queue *, unsigned long);
-- 
2.39.2

