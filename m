Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C844A7541
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:02:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB252420192;
	Wed,  2 Feb 2022 17:02:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B379420192
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8GVQXT0kVqChU6vSgNGttF15H9QFLTedNtJ6t0U/v+8=;
	b=gy5mGNGZskKl9PZnlzVuZdn61+
	9HZOA4yr3sXebPZ/UB56iWuefW+QMc1WWv/75+WQXtMXQuN+Y+DkrJaBFF6gbHhNykAn862njd8qA
	atVWWB75tZtW/5Ar3Ej8RSHdLs8R75RxXiNZrihS8uQNRv7yVF/oS+UVMbxDCS6nHpHfNa3pNO78+
	f7EJ7LRy6dW3qwChpXocua/xfDatRdyObW+jGa5qyFj3pkGUQ5jBo1laqhwwAnPRse/TKIjgVbz/2
	BSH0qDaecFmRJlENqa5cS4NwE58sG1xAiId8R3h3stZUpzmmDDNaWurxT1/rTVu288cH4xPBbN6jB
	9x2hS5rg==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4L-00G7xZ-0B; Wed, 02 Feb 2022 16:01:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:00:58 +0100
Message-Id: <20220202160109.108149-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202160109.108149-1-hch@lst.de>
References: <20220202160109.108149-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 02/13] dm: add a clone_to_tio helper
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

Add a helper to stop open coding the container_of operations to get
from the clone bio to the tio structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index fa596b654c99c..5543e18f3c3bc 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -79,10 +79,14 @@ struct clone_info {
 #define DM_IO_BIO_OFFSET \
 	(offsetof(struct dm_target_io, clone) + offsetof(struct dm_io, tio))
 
+static inline struct dm_target_io *clone_to_tio(struct bio *clone)
+{
+	return container_of(clone, struct dm_target_io, clone);
+}
+
 void *dm_per_bio_data(struct bio *bio, size_t data_size)
 {
-	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
-	if (!tio->inside_dm_io)
+	if (!clone_to_tio(bio)->inside_dm_io)
 		return (char *)bio - DM_TARGET_IO_BIO_OFFSET - data_size;
 	return (char *)bio - DM_IO_BIO_OFFSET - data_size;
 }
@@ -477,10 +481,7 @@ static int dm_blk_ioctl(struct block_device *bdev, fmode_t mode,
 
 u64 dm_start_time_ns_from_clone(struct bio *bio)
 {
-	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
-	struct dm_io *io = tio->io;
-
-	return jiffies_to_nsecs(io->start_time);
+	return jiffies_to_nsecs(clone_to_tio(bio)->io->start_time);
 }
 EXPORT_SYMBOL_GPL(dm_start_time_ns_from_clone);
 
@@ -521,7 +522,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
 
 	clone = bio_alloc_bioset(NULL, 0, 0, GFP_NOIO, &md->io_bs);
 
-	tio = container_of(clone, struct dm_target_io, clone);
+	tio = clone_to_tio(clone);
 	tio->inside_dm_io = true;
 	tio->io = NULL;
 
@@ -557,7 +558,7 @@ static struct dm_target_io *alloc_tio(struct clone_info *ci, struct dm_target *t
 		if (!clone)
 			return NULL;
 
-		tio = container_of(clone, struct dm_target_io, clone);
+		tio = clone_to_tio(clone);
 		tio->inside_dm_io = false;
 	}
 
@@ -878,7 +879,7 @@ static bool swap_bios_limit(struct dm_target *ti, struct bio *bio)
 static void clone_endio(struct bio *bio)
 {
 	blk_status_t error = bio->bi_status;
-	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
+	struct dm_target_io *tio = clone_to_tio(bio);
 	struct dm_io *io = tio->io;
 	struct mapped_device *md = tio->io->md;
 	dm_endio_fn endio = tio->ti->type->end_io;
@@ -1084,7 +1085,7 @@ static int dm_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
  */
 void dm_accept_partial_bio(struct bio *bio, unsigned n_sectors)
 {
-	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
+	struct dm_target_io *tio = clone_to_tio(bio);
 	unsigned bi_size = bio->bi_iter.bi_size >> SECTOR_SHIFT;
 
 	BUG_ON(bio->bi_opf & REQ_PREFLUSH);
@@ -1257,10 +1258,8 @@ static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 		if (bio_nr == num_bios)
 			return;
 
-		while ((bio = bio_list_pop(blist))) {
-			tio = container_of(bio, struct dm_target_io, clone);
-			free_tio(tio);
-		}
+		while ((bio = bio_list_pop(blist)))
+			free_tio(clone_to_tio(bio));
 	}
 }
 
@@ -1282,14 +1281,11 @@ static void __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
 {
 	struct bio_list blist = BIO_EMPTY_LIST;
 	struct bio *bio;
-	struct dm_target_io *tio;
 
 	alloc_multiple_bios(&blist, ci, ti, num_bios);
 
-	while ((bio = bio_list_pop(&blist))) {
-		tio = container_of(bio, struct dm_target_io, clone);
-		__clone_and_map_simple_bio(ci, tio, len);
-	}
+	while ((bio = bio_list_pop(&blist)))
+		__clone_and_map_simple_bio(ci, clone_to_tio(bio), len);
 }
 
 static int __send_empty_flush(struct clone_info *ci)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
