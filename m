Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6B48673B1
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:44:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22F174205F9;
	Mon, 26 Feb 2024 12:44:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2796442064B
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=oCgQZaiF/v38Xtofqeuu4eAUS7fzPBaKg2U7fjijjbw=;
	b=FqI2JI6M3qofTF9w+6ijD2ioqg
	pSUUTadeeHiaRaG3ggKME5+KmS0Q2tK9zyDCayjhmRbHNmHSFEo88sYEd9pS0V4iwOrGbXQ/Cc611
	SVyJd3nZdf9fmcX+6C/ziUEHreOkvk0yH4z6QWZvvwkgcCY0ZwfdbekjVh3L45Fd1lvt9qXJ5ZUKb
	IKo/jvl2ywF75BuQPhyJ+80bXwkAlmtgnPw8RZCpegYhQv8UADO1GG8PUwXlGYJtbL6GXaqpBIiZ5
	KDgaUueWcoKcBsceAP+G3UKkZdaGUBZyOtWpSjyuJp5v4guyc+wKG7fN1D2BQOJJKU/0qzErWqeEU
	i2LujmoQ==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYGa-0000000052z-2Ade; Mon, 26 Feb 2024 10:31:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 13/16] drbd: merge drbd_setup_queue_param into
	drbd_reconsider_queue_parameters
Date: Mon, 26 Feb 2024 11:30:01 +0100
Message-Id: <20240226103004.281412-14-hch@lst.de>
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

drbd_setup_queue_param is only called by drbd_reconsider_queue_parameters
and there is no really clear boundary of responsibilities between the
two.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_nl.c | 56 ++++++++++++++----------------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 0326b7322ceb48..0f40fdee089971 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1309,45 +1309,16 @@ static unsigned int drbd_backing_dev_max_segments(struct drbd_device *device)
 	return max_segments;
 }
 
-static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backing_dev *bdev,
-				   unsigned int max_bio_size, struct o_qlim *o)
-{
-	struct request_queue * const q = device->rq_queue;
-	unsigned int max_hw_sectors = max_bio_size >> 9;
-	unsigned int max_segments = BLK_MAX_SEGMENTS;
-	struct request_queue *b = NULL;
-
-	if (bdev) {
-		b = bdev->backing_bdev->bd_disk->queue;
-
-		max_hw_sectors = min(queue_max_hw_sectors(b), max_bio_size >> 9);
-		max_segments = drbd_backing_dev_max_segments(device);
-
-		blk_set_stacking_limits(&q->limits);
-	}
-
-	blk_queue_max_hw_sectors(q, max_hw_sectors);
-	blk_queue_max_segments(q, max_segments);
-	blk_queue_segment_boundary(q, PAGE_SIZE-1);
-	decide_on_discard_support(device, bdev);
-
-	if (b) {
-		blk_stack_limits(&q->limits, &b->limits, 0);
-		disk_update_readahead(device->vdisk);
-	}
-	fixup_write_zeroes(device, q);
-	fixup_discard_support(device, q);
-}
-
 void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		struct drbd_backing_dev *bdev, struct o_qlim *o)
 {
-	unsigned int now = queue_max_hw_sectors(device->rq_queue) <<
-			SECTOR_SHIFT;
+	struct request_queue * const q = device->rq_queue;
+	unsigned int now = queue_max_hw_sectors(q) << 9;
+	struct request_queue *b = NULL;
 	unsigned int new;
 
 	if (bdev) {
-		struct request_queue *b = bdev->backing_bdev->bd_disk->queue;
+		b = bdev->backing_bdev->bd_disk->queue;
 
 		device->local_max_bio_size =
 			queue_max_hw_sectors(b) << SECTOR_SHIFT;
@@ -1369,7 +1340,24 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		drbd_info(device, "max BIO size = %u\n", new);
 	}
 
-	drbd_setup_queue_param(device, bdev, new, o);
+	if (bdev) {
+		blk_set_stacking_limits(&q->limits);
+		blk_queue_max_segments(q,
+			drbd_backing_dev_max_segments(device));
+	} else {
+		blk_queue_max_segments(q, BLK_MAX_SEGMENTS);
+	}
+
+	blk_queue_max_hw_sectors(q, new >> SECTOR_SHIFT);
+	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
+	decide_on_discard_support(device, bdev);
+
+	if (bdev) {
+		blk_stack_limits(&q->limits, &b->limits, 0);
+		disk_update_readahead(device->vdisk);
+	}
+	fixup_write_zeroes(device, q);
+	fixup_discard_support(device, q);
 }
 
 /* Starts the worker thread */
-- 
2.39.2

