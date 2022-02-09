Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 325354AEC6F
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 09:32:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 117AD4205DD;
	Wed,  9 Feb 2022 09:32:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76B36420368
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 09:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QpI6TxzyLD0VhpyON4GNpHisrhmph+FXrDO9j3YfLGQ=;
	b=UBklqOmYcspUOr/wfzlQdfCEK4
	RUywmec4eJRfgow0ROh7C/shmPfjoV9AX6UxEKLQF6DHIoCIFWohTtj/aBZX1myAAiemMpfT3ptVT
	GOGILeVbvLfX+nAbnf6ZYNuMSsmcot+08dxbCablm+LWn5SUEooHHqipq3oCMGN3sJhY1+UvoZ0Os
	e7QJW2SJhNwDTSkWrN9H3FtA6k07L/KlV12vDJG/WMAJUhXCAJdZlfOdV84mn9o8tIk9Uo1L8HFpm
	udbzALPhDlycmvOzBSLRyRvy/ODVEMj+WDMy9Vb6Ul4BwKeC3V04rmtsIHOl2NRCAuOspFKRw9AY2
	rwVglAvQ==;
Received: from [2001:4bb8:188:3efc:ea2:7599:7eeb:4b5a] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiLQ-00GcLQ-OJ; Wed, 09 Feb 2022 08:28:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk, martin.petersen@oracle.com, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, manoj@linux.ibm.com,
	mrochs@linux.ibm.com, ukrishn@linux.ibm.com
Date: Wed,  9 Feb 2022 09:28:28 +0100
Message-Id: <20220209082828.2629273-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209082828.2629273-1-hch@lst.de>
References: <20220209082828.2629273-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 7/7] block: remove REQ_OP_WRITE_SAME support
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

No more users of REQ_OP_WRITE_SAME or drivers implementing it are left,
so remove the infrastructure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          | 13 +-----
 block/blk-lib.c           | 91 ---------------------------------------
 block/blk-merge.c         | 40 -----------------
 block/blk-settings.c      | 16 -------
 block/blk-sysfs.c         |  8 ----
 block/blk-zoned.c         |  1 -
 block/blk.h               |  1 -
 block/bounce.c            |  3 --
 include/linux/bio.h       |  3 --
 include/linux/blk_types.h |  2 -
 include/linux/blkdev.h    | 19 --------
 kernel/trace/blktrace.c   |  1 -
 12 files changed, 1 insertion(+), 197 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index be8812f5489d4..dabc771538db8 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -122,7 +122,6 @@ static const char *const blk_op_name[] = {
 	REQ_OP_NAME(ZONE_CLOSE),
 	REQ_OP_NAME(ZONE_FINISH),
 	REQ_OP_NAME(ZONE_APPEND),
-	REQ_OP_NAME(WRITE_SAME),
 	REQ_OP_NAME(WRITE_ZEROES),
 	REQ_OP_NAME(DRV_IN),
 	REQ_OP_NAME(DRV_OUT),
@@ -735,10 +734,6 @@ noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		if (!blk_queue_secure_erase(q))
 			goto not_supported;
 		break;
-	case REQ_OP_WRITE_SAME:
-		if (!q->limits.max_write_same_sectors)
-			goto not_supported;
-		break;
 	case REQ_OP_ZONE_APPEND:
 		status = blk_check_zone_append(q, bio);
 		if (status != BLK_STS_OK)
@@ -934,13 +929,7 @@ void submit_bio(struct bio *bio)
 	 * go through the normal accounting stuff before submission.
 	 */
 	if (bio_has_data(bio)) {
-		unsigned int count;
-
-		if (unlikely(bio_op(bio) == REQ_OP_WRITE_SAME))
-			count = queue_logical_block_size(
-					bdev_get_queue(bio->bi_bdev)) >> 9;
-		else
-			count = bio_sectors(bio);
+		unsigned int count = bio_sectors(bio);
 
 		if (op_is_write(bio_op(bio))) {
 			count_vm_events(PGPGOUT, count);
diff --git a/block/blk-lib.c b/block/blk-lib.c
index 1b8ced45e4e55..05d3dbfe24eaa 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -135,97 +135,6 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 }
 EXPORT_SYMBOL(blkdev_issue_discard);
 
-/**
- * __blkdev_issue_write_same - generate number of bios with same page
- * @bdev:	target blockdev
- * @sector:	start sector
- * @nr_sects:	number of sectors to write
- * @gfp_mask:	memory allocation flags (for bio_alloc)
- * @page:	page containing data to write
- * @biop:	pointer to anchor bio
- *
- * Description:
- *  Generate and issue number of bios(REQ_OP_WRITE_SAME) with same page.
- */
-static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
-		sector_t nr_sects, gfp_t gfp_mask, struct page *page,
-		struct bio **biop)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-	unsigned int max_write_same_sectors;
-	struct bio *bio = *biop;
-	sector_t bs_mask;
-
-	if (!q)
-		return -ENXIO;
-
-	if (bdev_read_only(bdev))
-		return -EPERM;
-
-	bs_mask = (bdev_logical_block_size(bdev) >> 9) - 1;
-	if ((sector | nr_sects) & bs_mask)
-		return -EINVAL;
-
-	if (!bdev_write_same(bdev))
-		return -EOPNOTSUPP;
-
-	/* Ensure that max_write_same_sectors doesn't overflow bi_size */
-	max_write_same_sectors = bio_allowed_max_sectors(q);
-
-	while (nr_sects) {
-		bio = blk_next_bio(bio, bdev, 1, REQ_OP_WRITE_SAME, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio->bi_vcnt = 1;
-		bio->bi_io_vec->bv_page = page;
-		bio->bi_io_vec->bv_offset = 0;
-		bio->bi_io_vec->bv_len = bdev_logical_block_size(bdev);
-
-		if (nr_sects > max_write_same_sectors) {
-			bio->bi_iter.bi_size = max_write_same_sectors << 9;
-			nr_sects -= max_write_same_sectors;
-			sector += max_write_same_sectors;
-		} else {
-			bio->bi_iter.bi_size = nr_sects << 9;
-			nr_sects = 0;
-		}
-		cond_resched();
-	}
-
-	*biop = bio;
-	return 0;
-}
-
-/**
- * blkdev_issue_write_same - queue a write same operation
- * @bdev:	target blockdev
- * @sector:	start sector
- * @nr_sects:	number of sectors to write
- * @gfp_mask:	memory allocation flags (for bio_alloc)
- * @page:	page containing data
- *
- * Description:
- *    Issue a write same request for the sectors in question.
- */
-int blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
-				sector_t nr_sects, gfp_t gfp_mask,
-				struct page *page)
-{
-	struct bio *bio = NULL;
-	struct blk_plug plug;
-	int ret;
-
-	blk_start_plug(&plug);
-	ret = __blkdev_issue_write_same(bdev, sector, nr_sects, gfp_mask, page,
-			&bio);
-	if (ret == 0 && bio) {
-		ret = submit_bio_wait(bio);
-		bio_put(bio);
-	}
-	blk_finish_plug(&plug);
-	return ret;
-}
-EXPORT_SYMBOL(blkdev_issue_write_same);
-
 static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop, unsigned flags)
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 4de34a332c9fd..87cee7e82ae15 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -152,22 +152,6 @@ static struct bio *blk_bio_write_zeroes_split(struct request_queue *q,
 	return bio_split(bio, q->limits.max_write_zeroes_sectors, GFP_NOIO, bs);
 }
 
-static struct bio *blk_bio_write_same_split(struct request_queue *q,
-					    struct bio *bio,
-					    struct bio_set *bs,
-					    unsigned *nsegs)
-{
-	*nsegs = 1;
-
-	if (!q->limits.max_write_same_sectors)
-		return NULL;
-
-	if (bio_sectors(bio) <= q->limits.max_write_same_sectors)
-		return NULL;
-
-	return bio_split(bio, q->limits.max_write_same_sectors, GFP_NOIO, bs);
-}
-
 /*
  * Return the maximum number of sectors from the start of a bio that may be
  * submitted as a single request to a block device. If enough sectors remain,
@@ -351,10 +335,6 @@ void __blk_queue_split(struct request_queue *q, struct bio **bio,
 		split = blk_bio_write_zeroes_split(q, *bio, &q->bio_split,
 				nr_segs);
 		break;
-	case REQ_OP_WRITE_SAME:
-		split = blk_bio_write_same_split(q, *bio, &q->bio_split,
-				nr_segs);
-		break;
 	default:
 		split = blk_bio_segment_split(q, *bio, &q->bio_split, nr_segs);
 		break;
@@ -416,8 +396,6 @@ unsigned int blk_recalc_rq_segments(struct request *rq)
 		return 1;
 	case REQ_OP_WRITE_ZEROES:
 		return 0;
-	case REQ_OP_WRITE_SAME:
-		return 1;
 	}
 
 	rq_for_each_bvec(bv, rq, iter)
@@ -555,8 +533,6 @@ int __blk_rq_map_sg(struct request_queue *q, struct request *rq,
 
 	if (rq->rq_flags & RQF_SPECIAL_PAYLOAD)
 		nsegs = __blk_bvec_map_sg(rq->special_vec, sglist, last_sg);
-	else if (rq->bio && bio_op(rq->bio) == REQ_OP_WRITE_SAME)
-		nsegs = __blk_bvec_map_sg(bio_iovec(rq->bio), sglist, last_sg);
 	else if (rq->bio)
 		nsegs = __blk_bios_map_sg(q, rq->bio, sglist, last_sg);
 
@@ -757,13 +733,6 @@ static enum elv_merge blk_try_req_merge(struct request *req,
 	return ELEVATOR_NO_MERGE;
 }
 
-static inline bool blk_write_same_mergeable(struct bio *a, struct bio *b)
-{
-	if (bio_page(a) == bio_page(b) && bio_offset(a) == bio_offset(b))
-		return true;
-	return false;
-}
-
 /*
  * For non-mq, this has to be called with the request spinlock acquired.
  * For mq with scheduling, the appropriate queue wide lock should be held.
@@ -780,10 +749,6 @@ static struct request *attempt_merge(struct request_queue *q,
 	if (rq_data_dir(req) != rq_data_dir(next))
 		return NULL;
 
-	if (req_op(req) == REQ_OP_WRITE_SAME &&
-	    !blk_write_same_mergeable(req->bio, next->bio))
-		return NULL;
-
 	/*
 	 * Don't allow merge of different write hints, or for a hint with
 	 * non-hint IO.
@@ -912,11 +877,6 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
 	if (!bio_crypt_rq_ctx_compatible(rq, bio))
 		return false;
 
-	/* must be using the same buffer */
-	if (req_op(rq) == REQ_OP_WRITE_SAME &&
-	    !blk_write_same_mergeable(rq->bio, bio))
-		return false;
-
 	/*
 	 * Don't allow merge of different write hints, or for a hint with
 	 * non-hint IO.
diff --git a/block/blk-settings.c b/block/blk-settings.c
index b880c70e22e4e..b83df3d2eebca 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -42,7 +42,6 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->max_sectors = lim->max_hw_sectors = BLK_SAFE_MAX_SECTORS;
 	lim->max_dev_sectors = 0;
 	lim->chunk_sectors = 0;
-	lim->max_write_same_sectors = 0;
 	lim->max_write_zeroes_sectors = 0;
 	lim->max_zone_append_sectors = 0;
 	lim->max_discard_sectors = 0;
@@ -79,7 +78,6 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_segment_size = UINT_MAX;
 	lim->max_sectors = UINT_MAX;
 	lim->max_dev_sectors = UINT_MAX;
-	lim->max_write_same_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
 	lim->max_zone_append_sectors = UINT_MAX;
 }
@@ -178,18 +176,6 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_discard_sectors);
 
-/**
- * blk_queue_max_write_same_sectors - set max sectors for a single write same
- * @q:  the request queue for the device
- * @max_write_same_sectors: maximum number of sectors to write per command
- **/
-void blk_queue_max_write_same_sectors(struct request_queue *q,
-				      unsigned int max_write_same_sectors)
-{
-	q->limits.max_write_same_sectors = max_write_same_sectors;
-}
-EXPORT_SYMBOL(blk_queue_max_write_same_sectors);
-
 /**
  * blk_queue_max_write_zeroes_sectors - set max sectors for a single
  *                                      write zeroes
@@ -519,8 +505,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_sectors = min_not_zero(t->max_sectors, b->max_sectors);
 	t->max_hw_sectors = min_not_zero(t->max_hw_sectors, b->max_hw_sectors);
 	t->max_dev_sectors = min_not_zero(t->max_dev_sectors, b->max_dev_sectors);
-	t->max_write_same_sectors = min(t->max_write_same_sectors,
-					b->max_write_same_sectors);
 	t->max_write_zeroes_sectors = min(t->max_write_zeroes_sectors,
 					b->max_write_zeroes_sectors);
 	t->max_zone_append_sectors = min(t->max_zone_append_sectors,
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 9f32882ceb2f6..4a5bb47bee3ce 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -212,12 +212,6 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
 	return queue_var_show(0, page);
 }
 
-static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
-{
-	return sprintf(page, "%llu\n",
-		(unsigned long long)q->limits.max_write_same_sectors << 9);
-}
-
 static ssize_t queue_write_zeroes_max_show(struct request_queue *q, char *page)
 {
 	return sprintf(page, "%llu\n",
@@ -587,7 +581,6 @@ QUEUE_RO_ENTRY(queue_discard_max_hw, "discard_max_hw_bytes");
 QUEUE_RW_ENTRY(queue_discard_max, "discard_max_bytes");
 QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
 
-QUEUE_RO_ENTRY(queue_write_same_max, "write_same_max_bytes");
 QUEUE_RO_ENTRY(queue_write_zeroes_max, "write_zeroes_max_bytes");
 QUEUE_RO_ENTRY(queue_zone_append_max, "zone_append_max_bytes");
 QUEUE_RO_ENTRY(queue_zone_write_granularity, "zone_write_granularity");
@@ -643,7 +636,6 @@ static struct attribute *queue_attrs[] = {
 	&queue_discard_max_entry.attr,
 	&queue_discard_max_hw_entry.attr,
 	&queue_discard_zeroes_data_entry.attr,
-	&queue_write_same_max_entry.attr,
 	&queue_write_zeroes_max_entry.attr,
 	&queue_zone_append_max_entry.attr,
 	&queue_zone_write_granularity_entry.attr,
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 602bef54c8134..38cd840d88387 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -65,7 +65,6 @@ bool blk_req_needs_zone_write_lock(struct request *rq)
 
 	switch (req_op(rq)) {
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE:
 		return blk_rq_zone_is_seq(rq);
 	default:
diff --git a/block/blk.h b/block/blk.h
index abb663a2a147b..2fe483bcc6d38 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -286,7 +286,6 @@ static inline bool blk_may_split(struct request_queue *q, struct bio *bio)
 	case REQ_OP_DISCARD:
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 		return true; /* non-trivial splitting decisions */
 	default:
 		break;
diff --git a/block/bounce.c b/block/bounce.c
index 3fd3bc6fd5dbb..d9df1788c440c 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -178,9 +178,6 @@ static struct bio *bounce_clone_bio(struct bio *bio_src)
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
 		break;
-	case REQ_OP_WRITE_SAME:
-		bio->bi_io_vec[bio->bi_vcnt++] = bio_src->bi_io_vec[0];
-		break;
 	default:
 		bio_for_each_segment(bv, bio_src, iter)
 			bio->bi_io_vec[bio->bi_vcnt++] = bv;
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 7523aba4ddf7c..74bf16558ef4b 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -65,7 +65,6 @@ static inline bool bio_no_advance_iter(const struct bio *bio)
 {
 	return bio_op(bio) == REQ_OP_DISCARD ||
 	       bio_op(bio) == REQ_OP_SECURE_ERASE ||
-	       bio_op(bio) == REQ_OP_WRITE_SAME ||
 	       bio_op(bio) == REQ_OP_WRITE_ZEROES;
 }
 
@@ -186,8 +185,6 @@ static inline unsigned bio_segments(struct bio *bio)
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
 		return 0;
-	case REQ_OP_WRITE_SAME:
-		return 1;
 	default:
 		break;
 	}
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 5561e58d158ac..e72cb45593fbe 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -361,8 +361,6 @@ enum req_opf {
 	REQ_OP_DISCARD		= 3,
 	/* securely erase sectors */
 	REQ_OP_SECURE_ERASE	= 5,
-	/* write the same sector many times */
-	REQ_OP_WRITE_SAME	= 7,
 	/* write the zero filled sector many times */
 	REQ_OP_WRITE_ZEROES	= 9,
 	/* Open a zone */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 3bfc75a2a4509..b92345c044991 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -247,7 +247,6 @@ struct queue_limits {
 	unsigned int		io_opt;
 	unsigned int		max_discard_sectors;
 	unsigned int		max_hw_discard_sectors;
-	unsigned int		max_write_same_sectors;
 	unsigned int		max_write_zeroes_sectors;
 	unsigned int		max_zone_append_sectors;
 	unsigned int		discard_granularity;
@@ -913,9 +912,6 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
 		return min(q->limits.max_discard_sectors,
 			   UINT_MAX >> SECTOR_SHIFT);
 
-	if (unlikely(op == REQ_OP_WRITE_SAME))
-		return q->limits.max_write_same_sectors;
-
 	if (unlikely(op == REQ_OP_WRITE_ZEROES))
 		return q->limits.max_write_zeroes_sectors;
 
@@ -958,8 +954,6 @@ extern void blk_queue_max_discard_segments(struct request_queue *,
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
 extern void blk_queue_max_discard_sectors(struct request_queue *q,
 		unsigned int max_discard_sectors);
-extern void blk_queue_max_write_same_sectors(struct request_queue *q,
-		unsigned int max_write_same_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
 extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
@@ -1096,9 +1090,6 @@ static inline long nr_blockdev_pages(void)
 
 extern void blk_io_schedule(void);
 
-extern int blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
-		sector_t nr_sects, gfp_t gfp_mask, struct page *page);
-
 #define BLKDEV_DISCARD_SECURE	(1 << 0)	/* issue a secure erase */
 
 extern int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
@@ -1325,16 +1316,6 @@ static inline int bdev_discard_alignment(struct block_device *bdev)
 	return q->limits.discard_alignment;
 }
 
-static inline unsigned int bdev_write_same(struct block_device *bdev)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-
-	if (q)
-		return q->limits.max_write_same_sectors;
-
-	return 0;
-}
-
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index af68a67179b48..19514edc44f71 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -1892,7 +1892,6 @@ void blk_fill_rwbs(char *rwbs, unsigned int op)
 
 	switch (op & REQ_OP_MASK) {
 	case REQ_OP_WRITE:
-	case REQ_OP_WRITE_SAME:
 		rwbs[i++] = 'W';
 		break;
 	case REQ_OP_DISCARD:
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
