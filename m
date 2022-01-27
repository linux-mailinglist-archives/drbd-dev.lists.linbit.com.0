Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAF49DB08
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 07:55:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 479B742A586;
	Thu, 27 Jan 2022 07:55:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D147842A583
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 07:55:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PgD+IJav4203dSpSvWZFzt8f0aKp6aAcIcixqGgndjE=;
	b=ro+fRqmL9qVCJaF/99SlQWBUwu
	U4xvXoXthjCa/Sdn/tVjuKTFoWBp9WCeHgpr9lKghGHh//dj7nOSBgbyiHlzzbgXYGcbrHtH9Jxog
	QYW0D2FlS2a7D17oQ4/ErqDS0YVMUKwOLVmsAczc5X8dcJ29NquGKW1SLuVGeY9snooFbdJrVovSv
	9pNyLTgnjVlbW7v65Snj0za+S6RLOXicQ2VHTb6k70h2dxmwQiQ+QcnpgMwO56hR2IaPL03YPYbBE
	e+3qeZsa3WTfmVYbmGj9B5EYc+eEsfWy7rDPaUCP+dGuxNnUg2q2Gp6/owNjLftJJ9J3bst19ARWr
	9bCmQqHw==;
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyOS-00EYEG-D6; Thu, 27 Jan 2022 06:36:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:43 +0100
Message-Id: <20220127063546.1314111-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127063546.1314111-1-hch@lst.de>
References: <20220127063546.1314111-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 11/14] block: clone crypto and integrity data in
	__bio_clone_fast
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

__bio_clone_fast should also clone integrity and crypto data, as a clone
without those is incomplete.  Right now the only caller that can actually
support crypto and integrity data (dm) does it manually for the one
callchain that supports these, but we better do it properly in the core.

Note that the other callers also don't need to handle failure, as the
integrity and crypto clones are based on mempool allocations that won't
fail for sleeping allocations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio-integrity.c       |  1 -
 block/bio.c                 | 26 +++++++++++++-------------
 block/blk-crypto.c          |  1 -
 drivers/md/bcache/request.c |  2 +-
 drivers/md/dm.c             | 35 ++++++++---------------------------
 drivers/md/md-multipath.c   |  2 +-
 include/linux/bio.h         |  2 +-
 7 files changed, 24 insertions(+), 45 deletions(-)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index d251147154592..bd54532200650 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -420,7 +420,6 @@ int bio_integrity_clone(struct bio *bio, struct bio *bio_src,
 
 	return 0;
 }
-EXPORT_SYMBOL(bio_integrity_clone);
 
 int bioset_integrity_create(struct bio_set *bs, int pool_size)
 {
diff --git a/block/bio.c b/block/bio.c
index 03cefe81950f2..60f79b33a49af 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -730,6 +730,7 @@ EXPORT_SYMBOL(bio_put);
  * 	__bio_clone_fast - clone a bio that shares the original bio's biovec
  * 	@bio: destination bio
  * 	@bio_src: bio to clone
+ *	@gfp: allocation flags
  *
  *	Clone a &bio. Caller will own the returned bio, but not
  *	the actual data it points to. Reference count of returned
@@ -737,7 +738,7 @@ EXPORT_SYMBOL(bio_put);
  *
  * 	Caller must ensure that @bio_src is not freed before @bio.
  */
-void __bio_clone_fast(struct bio *bio, struct bio *bio_src)
+int __bio_clone_fast(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 {
 	WARN_ON_ONCE(bio->bi_pool && bio->bi_max_vecs);
 
@@ -759,6 +760,13 @@ void __bio_clone_fast(struct bio *bio, struct bio *bio_src)
 
 	bio_clone_blkg_association(bio, bio_src);
 	blkcg_bio_issue_init(bio);
+
+	if (bio_crypt_clone(bio, bio_src, gfp) < 0)
+		return -ENOMEM;
+	if (bio_integrity(bio_src) &&
+	    bio_integrity_clone(bio, bio_src, gfp) < 0)
+		return -ENOMEM;
+	return 0;
 }
 EXPORT_SYMBOL(__bio_clone_fast);
 
@@ -778,20 +786,12 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 	if (!b)
 		return NULL;
 
-	__bio_clone_fast(b, bio);
-
-	if (bio_crypt_clone(b, bio, gfp_mask) < 0)
-		goto err_put;
-
-	if (bio_integrity(bio) &&
-	    bio_integrity_clone(b, bio, gfp_mask) < 0)
-		goto err_put;
+	if (__bio_clone_fast(b, bio, gfp_mask < 0)) {
+		bio_put(b);
+		return NULL;
+	}
 
 	return b;
-
-err_put:
-	bio_put(b);
-	return NULL;
 }
 EXPORT_SYMBOL(bio_clone_fast);
 
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index ec9efeeeca918..773dae4c329ba 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -111,7 +111,6 @@ int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
 	*dst->bi_crypt_context = *src->bi_crypt_context;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(__bio_crypt_clone);
 
 /* Increments @dun by @inc, treating @dun as a multi-limb integer. */
 void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 7ba59d08ed870..574b02b94f1a4 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -686,7 +686,7 @@ static void do_bio_hook(struct search *s,
 	struct bio *bio = &s->bio.bio;
 
 	bio_init(bio, NULL, NULL, 0, 0);
-	__bio_clone_fast(bio, orig_bio);
+	__bio_clone_fast(bio, orig_bio, GFP_NOIO);
 	/*
 	 * bi_end_io can be set separately somewhere else, e.g. the
 	 * variants in,
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 57f44d3a4d747..5978cb87e9372 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -553,6 +553,10 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 		/* the dm_target_io embedded in ci->io is available */
 		tio = &ci->io->tio;
 		bio_init(&tio->clone, NULL, NULL, 0, 0);
+		if (__bio_clone_fast(&tio->clone, ci->bio, gfp_mask) < 0) {
+			bio_uninit(&tio->clone);
+			return NULL;
+		}
 	} else {
 		struct bio *clone = bio_alloc_bioset(NULL, 0, 0, gfp_mask,
 						     &ci->io->md->bs);
@@ -561,8 +565,11 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 
 		tio = clone_to_tio(clone);
 		tio->inside_dm_io = false;
+		if (__bio_clone_fast(&tio->clone, ci->bio, gfp_mask) < 0) {
+			bio_put(clone);
+			return NULL;
+		}
 	}
-	__bio_clone_fast(&tio->clone, ci->bio);
 
 	tio->magic = DM_TIO_MAGIC;
 	tio->io = ci->io;
@@ -1197,31 +1204,8 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 				    sector_t sector, unsigned *len)
 {
 	struct bio *bio = ci->bio, *clone;
-	int r;
 
 	clone = alloc_tio(ci, ti, 0, len, GFP_NOIO);
-
-	r = bio_crypt_clone(clone, bio, GFP_NOIO);
-	if (r < 0)
-		goto free_tio;
-
-	if (bio_integrity(bio)) {
-		struct dm_target_io *tio = clone_to_tio(clone);
-
-		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
-			     !dm_target_passes_integrity(tio->ti->type))) {
-			DMWARN("%s: the target %s doesn't support integrity data.",
-				dm_device_name(tio->io->md),
-				tio->ti->type->name);
-			r = -EIO;
-			goto free_tio;
-		}
-
-		r = bio_integrity_clone(clone, bio, GFP_NOIO);
-		if (r < 0)
-			goto free_tio;
-	}
-
 	bio_advance(clone, to_bytes(sector - clone->bi_iter.bi_sector));
 	clone->bi_iter.bi_size = to_bytes(*len);
 
@@ -1230,9 +1214,6 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 
 	__map_bio(clone);
 	return 0;
-free_tio:
-	free_tio(clone);
-	return r;
 }
 
 static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
diff --git a/drivers/md/md-multipath.c b/drivers/md/md-multipath.c
index 5e15940634d85..010c759c741ad 100644
--- a/drivers/md/md-multipath.c
+++ b/drivers/md/md-multipath.c
@@ -122,7 +122,7 @@ static bool multipath_make_request(struct mddev *mddev, struct bio * bio)
 	multipath = conf->multipaths + mp_bh->path;
 
 	bio_init(&mp_bh->bio, NULL, NULL, 0, 0);
-	__bio_clone_fast(&mp_bh->bio, bio);
+	__bio_clone_fast(&mp_bh->bio, bio, GFP_NOIO);
 
 	mp_bh->bio.bi_iter.bi_sector += multipath->rdev->data_offset;
 	bio_set_dev(&mp_bh->bio, multipath->rdev->bdev);
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 18cfe5bb41ea8..b814361c957b0 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -413,7 +413,7 @@ struct bio *bio_alloc_kiocb(struct kiocb *kiocb, struct block_device *bdev,
 struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned short nr_iovecs);
 extern void bio_put(struct bio *);
 
-extern void __bio_clone_fast(struct bio *, struct bio *);
+int __bio_clone_fast(struct bio *bio, struct bio *bio_src, gfp_t gfp);
 extern struct bio *bio_clone_fast(struct bio *, gfp_t, struct bio_set *);
 
 extern struct bio_set fs_bio_set;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
