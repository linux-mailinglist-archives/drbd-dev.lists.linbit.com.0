Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4E4AEC6B
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 09:31:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF75A42032B;
	Wed,  9 Feb 2022 09:31:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C053242032B
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 09:28:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6Ljp2leOTsGQNUOBYnhQv9xIriNANEoITJRZY6SLnvw=;
	b=WkX27R9AZnJd8kSamOqXD0BVgG
	TOdzq1J/bOVZSgohrayvR6KpRnhRGbhwTV3XZIkUWge/K3Dxww33V4EW6vI98Yu9cGCAYKpZbdQTl
	TdjU7vAmQ2+t5agHujxpeZLQpGCRJapMuOAhBNsy5mzJvAwQp5FUrtZnRQiqImNFbFT1sglmoUj67
	xbspRUwoU2tHQRdA9NMOIs4WFUZSeoGiJGzz09ny3IVMnlk0DCZw9fqbuY5CBrKReQtEhFFUm3iYD
	+dDMyidOW8GBaO+uRt3cdOZWHce5cJSEkQA6zMg+Q9sgTScpZbcRUp4+w+d4Tnci5w74t+7SUsNYF
	hvklhc8g==;
Received: from [2001:4bb8:188:3efc:ea2:7599:7eeb:4b5a] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiLM-00GcIQ-VN; Wed, 09 Feb 2022 08:28:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk, martin.petersen@oracle.com, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, manoj@linux.ibm.com,
	mrochs@linux.ibm.com, ukrishn@linux.ibm.com
Date: Wed,  9 Feb 2022 09:28:27 +0100
Message-Id: <20220209082828.2629273-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209082828.2629273-1-hch@lst.de>
References: <20220209082828.2629273-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 6/7] dm: remove write same support
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

There are no more end-users of REQ_OP_WRITE_SAME left, so we can start
deleting it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-core.h          |  1 -
 drivers/md/dm-crypt.c         |  1 -
 drivers/md/dm-ebs-target.c    |  1 -
 drivers/md/dm-io.c            | 22 ++--------------------
 drivers/md/dm-linear.c        |  1 -
 drivers/md/dm-mpath.c         |  1 -
 drivers/md/dm-rq.c            |  3 ---
 drivers/md/dm-stripe.c        |  4 +---
 drivers/md/dm-table.c         | 29 -----------------------------
 drivers/md/dm-zone.c          |  4 ----
 drivers/md/dm.c               | 15 ---------------
 include/linux/device-mapper.h |  6 ------
 12 files changed, 3 insertions(+), 85 deletions(-)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 72d18c3fbf1f6..18b26882d25ac 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -140,7 +140,6 @@ struct mapped_device {
 #define DMF_EMULATE_ZONE_APPEND 9
 
 void disable_discard(struct mapped_device *md);
-void disable_write_same(struct mapped_device *md);
 void disable_write_zeroes(struct mapped_device *md);
 
 static inline sector_t dm_get_size(struct mapped_device *md)
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index a5006cb6ee8ad..e0e846a35947f 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1996,7 +1996,6 @@ static bool kcryptd_crypt_write_inline(struct crypt_config *cc,
 	 */
 	switch (bio_op(ctx->bio_in)) {
 	case REQ_OP_WRITE:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE_ZEROES:
 		return true;
 	default:
diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index 7ce5d509b9403..0221fa63f888f 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -335,7 +335,6 @@ static int ebs_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
 	ti->num_secure_erase_bios = 0;
-	ti->num_write_same_bios = 0;
 	ti->num_write_zeroes_bios = 0;
 	return 0;
 bad:
diff --git a/drivers/md/dm-io.c b/drivers/md/dm-io.c
index 23e038f8dc845..0969aa39655a4 100644
--- a/drivers/md/dm-io.c
+++ b/drivers/md/dm-io.c
@@ -304,7 +304,6 @@ static void do_region(int op, int op_flags, unsigned region,
 	unsigned num_bvecs;
 	sector_t remaining = where->count;
 	struct request_queue *q = bdev_get_queue(where->bdev);
-	unsigned short logical_block_size = queue_logical_block_size(q);
 	sector_t num_sectors;
 	unsigned int special_cmd_max_sectors;
 
@@ -315,10 +314,8 @@ static void do_region(int op, int op_flags, unsigned region,
 		special_cmd_max_sectors = q->limits.max_discard_sectors;
 	else if (op == REQ_OP_WRITE_ZEROES)
 		special_cmd_max_sectors = q->limits.max_write_zeroes_sectors;
-	else if (op == REQ_OP_WRITE_SAME)
-		special_cmd_max_sectors = q->limits.max_write_same_sectors;
-	if ((op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES ||
-	     op == REQ_OP_WRITE_SAME) && special_cmd_max_sectors == 0) {
+	if ((op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES) &&
+	    special_cmd_max_sectors == 0) {
 		atomic_inc(&io->count);
 		dec_count(io, region, BLK_STS_NOTSUPP);
 		return;
@@ -337,9 +334,6 @@ static void do_region(int op, int op_flags, unsigned region,
 		case REQ_OP_WRITE_ZEROES:
 			num_bvecs = 0;
 			break;
-		case REQ_OP_WRITE_SAME:
-			num_bvecs = 1;
-			break;
 		default:
 			num_bvecs = bio_max_segs(dm_sector_div_up(remaining,
 						(PAGE_SIZE >> SECTOR_SHIFT)));
@@ -355,18 +349,6 @@ static void do_region(int op, int op_flags, unsigned region,
 			num_sectors = min_t(sector_t, special_cmd_max_sectors, remaining);
 			bio->bi_iter.bi_size = num_sectors << SECTOR_SHIFT;
 			remaining -= num_sectors;
-		} else if (op == REQ_OP_WRITE_SAME) {
-			/*
-			 * WRITE SAME only uses a single page.
-			 */
-			dp->get_page(dp, &page, &len, &offset);
-			bio_add_page(bio, page, logical_block_size, offset);
-			num_sectors = min_t(sector_t, special_cmd_max_sectors, remaining);
-			bio->bi_iter.bi_size = num_sectors << SECTOR_SHIFT;
-
-			offset = 0;
-			remaining -= num_sectors;
-			dp->next_page(dp);
 		} else while (remaining) {
 			/*
 			 * Try and add as many pages as possible.
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 1b97a11d71517..76b486e4d2be1 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -60,7 +60,6 @@ static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
 	ti->num_secure_erase_bios = 1;
-	ti->num_write_same_bios = 1;
 	ti->num_write_zeroes_bios = 1;
 	ti->private = lc;
 	return 0;
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index f4719b65e5e33..9ab971834a535 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -1252,7 +1252,6 @@ static int multipath_ctr(struct dm_target *ti, unsigned argc, char **argv)
 
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
-	ti->num_write_same_bios = 1;
 	ti->num_write_zeroes_bios = 1;
 	if (m->queue_mode == DM_TYPE_BIO_BASED)
 		ti->per_io_data_size = multipath_per_bio_data_size();
diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 579ab6183d4d8..3907950a0ddcc 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -217,9 +217,6 @@ static void dm_done(struct request *clone, blk_status_t error, bool mapped)
 		if (req_op(clone) == REQ_OP_DISCARD &&
 		    !clone->q->limits.max_discard_sectors)
 			disable_discard(tio->md);
-		else if (req_op(clone) == REQ_OP_WRITE_SAME &&
-			 !clone->q->limits.max_write_same_sectors)
-			disable_write_same(tio->md);
 		else if (req_op(clone) == REQ_OP_WRITE_ZEROES &&
 			 !clone->q->limits.max_write_zeroes_sectors)
 			disable_write_zeroes(tio->md);
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index e566115ec0bb8..c81d331d1afe9 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -157,7 +157,6 @@ static int stripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->num_flush_bios = stripes;
 	ti->num_discard_bios = stripes;
 	ti->num_secure_erase_bios = stripes;
-	ti->num_write_same_bios = stripes;
 	ti->num_write_zeroes_bios = stripes;
 
 	sc->chunk_size = chunk_size;
@@ -284,8 +283,7 @@ static int stripe_map(struct dm_target *ti, struct bio *bio)
 	}
 	if (unlikely(bio_op(bio) == REQ_OP_DISCARD) ||
 	    unlikely(bio_op(bio) == REQ_OP_SECURE_ERASE) ||
-	    unlikely(bio_op(bio) == REQ_OP_WRITE_ZEROES) ||
-	    unlikely(bio_op(bio) == REQ_OP_WRITE_SAME)) {
+	    unlikely(bio_op(bio) == REQ_OP_WRITE_ZEROES)) {
 		target_bio_nr = dm_bio_get_target_bio_nr(bio);
 		BUG_ON(target_bio_nr >= sc->stripes);
 		return stripe_map_range(sc, bio, target_bio_nr);
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index e43096cfe9e22..88ab986379342 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1822,33 +1822,6 @@ static int device_is_not_random(struct dm_target *ti, struct dm_dev *dev,
 	return !blk_queue_add_random(q);
 }
 
-static int device_not_write_same_capable(struct dm_target *ti, struct dm_dev *dev,
-					 sector_t start, sector_t len, void *data)
-{
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return !q->limits.max_write_same_sectors;
-}
-
-static bool dm_table_supports_write_same(struct dm_table *t)
-{
-	struct dm_target *ti;
-	unsigned i;
-
-	for (i = 0; i < dm_table_get_num_targets(t); i++) {
-		ti = dm_table_get_target(t, i);
-
-		if (!ti->num_write_same_bios)
-			return false;
-
-		if (!ti->type->iterate_devices ||
-		    ti->type->iterate_devices(ti, device_not_write_same_capable, NULL))
-			return false;
-	}
-
-	return true;
-}
-
 static int device_not_write_zeroes_capable(struct dm_target *ti, struct dm_dev *dev,
 					   sector_t start, sector_t len, void *data)
 {
@@ -2027,8 +2000,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	else
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 
-	if (!dm_table_supports_write_same(t))
-		q->limits.max_write_same_sectors = 0;
 	if (!dm_table_supports_write_zeroes(t))
 		q->limits.max_write_zeroes_sectors = 0;
 
diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
index 6d82a34438c85..c1ca9be4b79e9 100644
--- a/drivers/md/dm-zone.c
+++ b/drivers/md/dm-zone.c
@@ -130,7 +130,6 @@ bool dm_is_zone_write(struct mapped_device *md, struct bio *bio)
 
 	switch (bio_op(bio)) {
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE:
 		return !op_is_flush(bio->bi_opf) && bio_sectors(bio);
 	default:
@@ -390,7 +389,6 @@ static bool dm_zone_map_bio_begin(struct mapped_device *md,
 	case REQ_OP_ZONE_FINISH:
 		return true;
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE:
 		/* Writes must be aligned to the zone write pointer */
 		if ((clone->bi_iter.bi_sector & (zsectors - 1)) != zwp_offset)
@@ -446,7 +444,6 @@ static blk_status_t dm_zone_map_bio_end(struct mapped_device *md,
 			   blk_queue_zone_sectors(md->queue));
 		return BLK_STS_OK;
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE:
 		WRITE_ONCE(md->zwp_offset[zno], zwp_offset + nr_sectors);
 		return BLK_STS_OK;
@@ -503,7 +500,6 @@ static bool dm_need_zone_wp_tracking(struct bio *orig_bio)
 		return false;
 	switch (bio_op(orig_bio)) {
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE:
 	case REQ_OP_ZONE_RESET:
 	case REQ_OP_ZONE_FINISH:
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ab9cc91931f99..028771f77aa04 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -856,14 +856,6 @@ void disable_discard(struct mapped_device *md)
 	blk_queue_flag_clear(QUEUE_FLAG_DISCARD, md->queue);
 }
 
-void disable_write_same(struct mapped_device *md)
-{
-	struct queue_limits *limits = dm_get_queue_limits(md);
-
-	/* device doesn't really support WRITE SAME, disable it */
-	limits->max_write_same_sectors = 0;
-}
-
 void disable_write_zeroes(struct mapped_device *md)
 {
 	struct queue_limits *limits = dm_get_queue_limits(md);
@@ -890,9 +882,6 @@ static void clone_endio(struct bio *bio)
 		if (bio_op(bio) == REQ_OP_DISCARD &&
 		    !q->limits.max_discard_sectors)
 			disable_discard(md);
-		else if (bio_op(bio) == REQ_OP_WRITE_SAME &&
-			 !q->limits.max_write_same_sectors)
-			disable_write_same(md);
 		else if (bio_op(bio) == REQ_OP_WRITE_ZEROES &&
 			 !q->limits.max_write_zeroes_sectors)
 			disable_write_zeroes(md);
@@ -1320,7 +1309,6 @@ static bool is_abnormal_io(struct bio *bio)
 	switch (bio_op(bio)) {
 	case REQ_OP_DISCARD:
 	case REQ_OP_SECURE_ERASE:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE_ZEROES:
 		r = true;
 		break;
@@ -1342,9 +1330,6 @@ static bool __process_abnormal_io(struct clone_info *ci, struct dm_target *ti,
 	case REQ_OP_SECURE_ERASE:
 		num_bios = ti->num_secure_erase_bios;
 		break;
-	case REQ_OP_WRITE_SAME:
-		num_bios = ti->num_write_same_bios;
-		break;
 	case REQ_OP_WRITE_ZEROES:
 		num_bios = ti->num_write_zeroes_bios;
 		break;
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index b26fecf6c8e87..721db99f4f630 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -316,12 +316,6 @@ struct dm_target {
 	 */
 	unsigned num_secure_erase_bios;
 
-	/*
-	 * The number of WRITE SAME bios that will be submitted to the target.
-	 * The bio number can be accessed with dm_bio_get_target_bio_nr.
-	 */
-	unsigned num_write_same_bios;
-
 	/*
 	 * The number of WRITE ZEROES bios that will be submitted to the target.
 	 * The bio number can be accessed with dm_bio_get_target_bio_nr.
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
