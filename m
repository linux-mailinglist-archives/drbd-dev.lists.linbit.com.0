Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071D1E382D
	for <lists+drbd-dev@lfdr.de>; Wed, 27 May 2020 07:28:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 055664203F0;
	Wed, 27 May 2020 07:28:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0751042000B
	for <drbd-dev@lists.linbit.com>; Wed, 27 May 2020 07:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tYO/gDhBfCcsr0X6BnTt3DLrPKvKaNJnAYUJw8Z986o=;
	b=b1nllpsV/a54uoCmOngroSJuQa
	VdtWl/+xyPwYLgDYCElFBCov9QFtKdlqgpSsTeZMZdY5tjWDspuLhwb8xH3IBfT7/Myrkba3SV1Rw
	UUk44G6PQQVmP5kjd1ipNp3S92jY0f+Q6JXbR+qWNvfdV2UxcZ6bBHLvCJWY3hPK144wze9fdkCxT
	eXMmmV38qrNHhPgrQn1yxU6gL80vU7ZrHx4mjzY0coEDkn53mAq9ldSkvl3ltLuGTUV4yyLzeqCeG
	AeCxqW0IMayHOek2jmwnuKPsJSo6TChjmopqBwqRpwaxblDwX9LQX7vt2fiNYQ0o8lXOJ+4Q5GGkK
	aVsO+GsQ==;
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYW-0000q0-6A; Wed, 27 May 2020 05:24:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:11 +0200
Message-Id: <20200527052419.403583-9-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 08/16] zram: nvdimm: use bio_{start,
	end}_io_acct and disk_{start, end}_io_acct
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

Switch zram to use the nicer bio accounting helpers, and as part of that
ensure each bio is counted as a single I/O request.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 drivers/block/zram/zram_drv.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ebb234f36909c..6e2ad90b17a37 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1510,13 +1510,8 @@ static void zram_bio_discard(struct zram *zram, u32 index,
 static int zram_bvec_rw(struct zram *zram, struct bio_vec *bvec, u32 index,
 			int offset, unsigned int op, struct bio *bio)
 {
-	unsigned long start_time = jiffies;
-	struct request_queue *q = zram->disk->queue;
 	int ret;
 
-	generic_start_io_acct(q, op, bvec->bv_len >> SECTOR_SHIFT,
-			&zram->disk->part0);
-
 	if (!op_is_write(op)) {
 		atomic64_inc(&zram->stats.num_reads);
 		ret = zram_bvec_read(zram, bvec, index, offset, bio);
@@ -1526,8 +1521,6 @@ static int zram_bvec_rw(struct zram *zram, struct bio_vec *bvec, u32 index,
 		ret = zram_bvec_write(zram, bvec, index, offset, bio);
 	}
 
-	generic_end_io_acct(q, op, &zram->disk->part0, start_time);
-
 	zram_slot_lock(zram, index);
 	zram_accessed(zram, index);
 	zram_slot_unlock(zram, index);
@@ -1548,6 +1541,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 	u32 index;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
+	unsigned long start_time;
 
 	index = bio->bi_iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
 	offset = (bio->bi_iter.bi_sector &
@@ -1563,6 +1557,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 		break;
 	}
 
+	start_time = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		struct bio_vec bv = bvec;
 		unsigned int unwritten = bvec.bv_len;
@@ -1571,8 +1566,10 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 			bv.bv_len = min_t(unsigned int, PAGE_SIZE - offset,
 							unwritten);
 			if (zram_bvec_rw(zram, &bv, index, offset,
-					 bio_op(bio), bio) < 0)
-				goto out;
+					 bio_op(bio), bio) < 0) {
+				bio->bi_status = BLK_STS_IOERR;
+				break;
+			}
 
 			bv.bv_offset += bv.bv_len;
 			unwritten -= bv.bv_len;
@@ -1580,12 +1577,8 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 			update_position(&index, &offset, &bv);
 		} while (unwritten);
 	}
-
+	bio_end_io_acct(bio, start_time);
 	bio_endio(bio);
-	return;
-
-out:
-	bio_io_error(bio);
 }
 
 /*
@@ -1633,6 +1626,7 @@ static int zram_rw_page(struct block_device *bdev, sector_t sector,
 	u32 index;
 	struct zram *zram;
 	struct bio_vec bv;
+	unsigned long start_time;
 
 	if (PageTransHuge(page))
 		return -ENOTSUPP;
@@ -1651,7 +1645,9 @@ static int zram_rw_page(struct block_device *bdev, sector_t sector,
 	bv.bv_len = PAGE_SIZE;
 	bv.bv_offset = 0;
 
+	start_time = disk_start_io_acct(bdev->bd_disk, SECTORS_PER_PAGE, op);
 	ret = zram_bvec_rw(zram, &bv, index, offset, op, NULL);
+	disk_end_io_acct(bdev->bd_disk, op, start_time);
 out:
 	/*
 	 * If I/O fails, just return error(ie, non-zero) without
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
