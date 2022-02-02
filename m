Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051B4A755E
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:04:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3850E4201D2;
	Wed,  2 Feb 2022 17:04:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CBDC4201B7
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0KkcieFVl0IGyoBXee3Jo2St7aVyz1T+6Nz7lRgq7G0=;
	b=Cqyxo5CWfnRWYVc4tfecgiNu82
	BdBKWmenlvwKq2lIZTpQgK47lxUYSol23/1rHk+kSsoB5hfRa40mkU/FokDf6nF3TvOxMTrcqw2Qz
	Vld8fr+Kbh+gXx12XGpv0gnJAxg/3Kv84/qXYdF0e0evSj8VSqTKHrVq2Rj9naFodPLp9yplKp6I+
	moljdMz4FUf3UTcsWe6Nta3Q6FXvXCkSdiKVxBb/cIvCgcT7gSrxwM19sD6+4td7xiDzBghYhk//E
	fRrMydm10fq4dFBBpCICm9yWm3wCuCgckWDiLq5l70CYDxybyQ/9ohDW+fzOvUm6s+A6vauz+g2+Z
	vK8XwIXg==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4Y-00G84D-AB; Wed, 02 Feb 2022 16:01:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:01:03 +0100
Message-Id: <20220202160109.108149-8-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 07/13] dm: retun the clone bio from alloc_tio
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

Return the clone bio embedded into the tio as that is what the callers
actually want.  Similar for the free side.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index a43d280e9bc54..c05b6ff1bb957 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -544,7 +544,7 @@ static void free_io(struct mapped_device *md, struct dm_io *io)
 	bio_put(&io->tio.clone);
 }
 
-static struct dm_target_io *alloc_tio(struct clone_info *ci, struct dm_target *ti,
+static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 		unsigned target_bio_nr, unsigned *len, gfp_t gfp_mask)
 {
 	struct dm_target_io *tio;
@@ -569,14 +569,14 @@ static struct dm_target_io *alloc_tio(struct clone_info *ci, struct dm_target *t
 	tio->target_bio_nr = target_bio_nr;
 	tio->len_ptr = len;
 
-	return tio;
+	return &tio->clone;
 }
 
-static void free_tio(struct dm_target_io *tio)
+static void free_tio(struct bio *clone)
 {
-	if (tio->inside_dm_io)
+	if (clone_to_tio(clone)->inside_dm_io)
 		return;
-	bio_put(&tio->clone);
+	bio_put(clone);
 }
 
 /*
@@ -932,7 +932,7 @@ static void clone_endio(struct bio *bio)
 		up(&md->swap_bios_semaphore);
 	}
 
-	free_tio(tio);
+	free_tio(bio);
 	dm_io_dec_pending(io, error);
 }
 
@@ -1166,7 +1166,7 @@ static void __map_bio(struct bio *clone)
 			struct mapped_device *md = io->md;
 			up(&md->swap_bios_semaphore);
 		}
-		free_tio(tio);
+		free_tio(clone);
 		dm_io_dec_pending(io, BLK_STS_IOERR);
 		break;
 	case DM_MAPIO_REQUEUE:
@@ -1174,7 +1174,7 @@ static void __map_bio(struct bio *clone)
 			struct mapped_device *md = io->md;
 			up(&md->swap_bios_semaphore);
 		}
-		free_tio(tio);
+		free_tio(clone);
 		dm_io_dec_pending(io, BLK_STS_DM_REQUEUE);
 		break;
 	default:
@@ -1196,17 +1196,17 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 				    sector_t sector, unsigned *len)
 {
 	struct bio *bio = ci->bio, *clone;
-	struct dm_target_io *tio;
 	int r;
 
-	tio = alloc_tio(ci, ti, 0, len, GFP_NOIO);
-	clone = &tio->clone;
+	clone = alloc_tio(ci, ti, 0, len, GFP_NOIO);
 
 	r = bio_crypt_clone(clone, bio, GFP_NOIO);
 	if (r < 0)
 		goto free_tio;
 
 	if (bio_integrity(bio)) {
+		struct dm_target_io *tio = clone_to_tio(clone);
+
 		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
 			     !dm_target_passes_integrity(tio->ti->type))) {
 			DMWARN("%s: the target %s doesn't support integrity data.",
@@ -1230,7 +1230,7 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 	__map_bio(clone);
 	return 0;
 free_tio:
-	free_tio(tio);
+	free_tio(clone);
 	return r;
 }
 
@@ -1238,31 +1238,30 @@ static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 				struct dm_target *ti, unsigned num_bios,
 				unsigned *len)
 {
-	struct dm_target_io *tio;
+	struct bio *bio;
 	int try;
 
 	if (!num_bios)
 		return;
 
 	if (num_bios == 1) {
-		tio = alloc_tio(ci, ti, 0, len, GFP_NOIO);
-		bio_list_add(blist, &tio->clone);
+		bio = alloc_tio(ci, ti, 0, len, GFP_NOIO);
+		bio_list_add(blist, bio);
 		return;
 	}
 
 	for (try = 0; try < 2; try++) {
 		int bio_nr;
-		struct bio *bio;
 
 		if (try)
 			mutex_lock(&ci->io->md->table_devices_lock);
 		for (bio_nr = 0; bio_nr < num_bios; bio_nr++) {
-			tio = alloc_tio(ci, ti, bio_nr, len,
+			bio = alloc_tio(ci, ti, bio_nr, len,
 					try ? GFP_NOIO : GFP_NOWAIT);
-			if (!tio)
+			if (!bio)
 				break;
 
-			bio_list_add(blist, &tio->clone);
+			bio_list_add(blist, bio);
 		}
 		if (try)
 			mutex_unlock(&ci->io->md->table_devices_lock);
@@ -1270,7 +1269,7 @@ static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 			return;
 
 		while ((bio = bio_list_pop(blist)))
-			free_tio(clone_to_tio(bio));
+			free_tio(bio);
 	}
 }
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
