Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56D1E0D57
	for <lists+drbd-dev@lfdr.de>; Mon, 25 May 2020 13:33:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 695164203F1;
	Mon, 25 May 2020 13:33:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A73F4203E4
	for <drbd-dev@lists.linbit.com>; Mon, 25 May 2020 13:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=v0186iGSqwpARGzc7KINAxQMJdy88hv4ZSp1TLxcph8=;
	b=C3HXaSgydTdPnNhbbqlKc29mMr
	BV8upwmLHyhsrC8k+c203Qz+HXjo5uv7zs/ybS6kup7SzPfR2S71ehMjYo6bso2vAHO98rivXTR6q
	soGtaWhjVwIIR8wUI6G2q36asr3NG1dkzHr2k4Jg3TlR7YgBCaKU7G8YUg9huM2K8qTg5iSKHi3QH
	OaT84T3cBe3SEmzsrjw+u8Pk2LexKtKqMNI0spxmqryoJmt+xl20bX2J8hodH64jimYm2XZmbc5gS
	LDNbzf1jGLIyzHhJMclLSqjQ8vRuXzLjiUk7sg1K0b9QX8ZoAjLcTMKIOXwkEWywr0FeSumaOHC7Q
	v66ZRuww==;
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJV-0002Qh-Hx; Mon, 25 May 2020 11:30:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:05 +0200
Message-Id: <20200525113014.345997-8-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 07/16] nvdimm: use bio_{start,end}_io_acct
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

Switch dm to use the nicer bio accounting helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/blk.c  |  6 ++++--
 drivers/nvdimm/btt.c  |  6 ++++--
 drivers/nvdimm/nd.h   | 19 -------------------
 drivers/nvdimm/pmem.c |  6 ++++--
 4 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 43751fab9d36a..036e23aef9b04 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -178,7 +178,9 @@ static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
 	bip = bio_integrity(bio);
 	nsblk = q->queuedata;
 	rw = bio_data_dir(bio);
-	do_acct = nd_iostat_start(bio, &start);
+	do_acct = blk_queue_io_stat(bio->bi_disk->queue);
+	if (do_acct)
+		start = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		unsigned int len = bvec.bv_len;
 
@@ -195,7 +197,7 @@ static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 	if (do_acct)
-		nd_iostat_end(bio, start);
+		bio_end_io_acct(bio, start);
 
 	bio_endio(bio);
 	return BLK_QC_T_NONE;
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 3b09419218d6f..90c0c4bbe77b9 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1452,7 +1452,9 @@ static blk_qc_t btt_make_request(struct request_queue *q, struct bio *bio)
 	if (!bio_integrity_prep(bio))
 		return BLK_QC_T_NONE;
 
-	do_acct = nd_iostat_start(bio, &start);
+	do_acct = blk_queue_io_stat(bio->bi_disk->queue);
+	if (do_acct)
+		start = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		unsigned int len = bvec.bv_len;
 
@@ -1477,7 +1479,7 @@ static blk_qc_t btt_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 	if (do_acct)
-		nd_iostat_end(bio, start);
+		bio_end_io_acct(bio, start);
 
 	bio_endio(bio);
 	return BLK_QC_T_NONE;
diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
index 85dbb2a322b9b..85c1ae813ea31 100644
--- a/drivers/nvdimm/nd.h
+++ b/drivers/nvdimm/nd.h
@@ -396,25 +396,6 @@ static inline int nvdimm_setup_pfn(struct nd_pfn *nd_pfn,
 #endif
 int nd_blk_region_init(struct nd_region *nd_region);
 int nd_region_activate(struct nd_region *nd_region);
-void __nd_iostat_start(struct bio *bio, unsigned long *start);
-static inline bool nd_iostat_start(struct bio *bio, unsigned long *start)
-{
-	struct gendisk *disk = bio->bi_disk;
-
-	if (!blk_queue_io_stat(disk->queue))
-		return false;
-
-	*start = jiffies;
-	generic_start_io_acct(disk->queue, bio_op(bio), bio_sectors(bio),
-			      &disk->part0);
-	return true;
-}
-static inline void nd_iostat_end(struct bio *bio, unsigned long start)
-{
-	struct gendisk *disk = bio->bi_disk;
-
-	generic_end_io_acct(disk->queue, bio_op(bio), &disk->part0, start);
-}
 static inline bool is_bad_pmem(struct badblocks *bb, sector_t sector,
 		unsigned int len)
 {
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 2df6994acf836..97f948f8f4e62 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -202,7 +202,9 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 	if (bio->bi_opf & REQ_PREFLUSH)
 		ret = nvdimm_flush(nd_region, bio);
 
-	do_acct = nd_iostat_start(bio, &start);
+	do_acct = blk_queue_io_stat(bio->bi_disk->queue);
+	if (do_acct)
+		start = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		if (op_is_write(bio_op(bio)))
 			rc = pmem_do_write(pmem, bvec.bv_page, bvec.bv_offset,
@@ -216,7 +218,7 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 	if (do_acct)
-		nd_iostat_end(bio, start);
+		bio_end_io_acct(bio, start);
 
 	if (bio->bi_opf & REQ_FUA)
 		ret = nvdimm_flush(nd_region, bio);
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
