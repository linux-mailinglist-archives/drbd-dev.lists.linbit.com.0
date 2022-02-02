Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACF4A7544
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:02:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 29DEF4201C0;
	Wed,  2 Feb 2022 17:02:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A3C84201B5
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2zDeJV7L2pJAwrBW2BoaWb0iAmlSixUiIC+xO6VsI9s=;
	b=HynGE8TD9m6HLFarZX5vNdsvyE
	IoxmI0Dxy5doQdGvR/a3Ot3TJAwRwwe82ufa7zuoWpqLgcOUmKbcbiwgEgfediuOzGYxYbRj5jC82
	IferQLr2R7RhDTFul+jZP+SKAws+9t5Zqm1wUG0bXF/6cil+pLb60/3Pa2W1X2pmNetyZOISqfXqU
	KFF4hTLmF3/AODcwsKBeJ7eKxxS2lDTaTtdql5wHcOps3YS/bebU77Ast4dR5V+QgpZVw5YU9LLCi
	gNb8yi3B1KhozI0O3JjyBzHMFYPc8xqCnlwzRQhnApezX1a83xmYsp32ScJVxLylyPmhnuPQ3KlIN
	enW2xelg==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4N-00G7yw-LV; Wed, 02 Feb 2022 16:01:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:00:59 +0100
Message-Id: <20220202160109.108149-4-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 03/13] dm: fold clone_bio into
	__clone_and_map_data_bio
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

Fold clone_bio into its only caller to prepare for refactoring.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 43 +++++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5543e18f3c3bc..9384d250a3e4e 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1190,17 +1190,22 @@ static void bio_setup_sector(struct bio *bio, sector_t sector, unsigned len)
 /*
  * Creates a bio that consists of range of complete bvecs.
  */
-static int clone_bio(struct dm_target_io *tio, struct bio *bio,
-		     sector_t sector, unsigned len)
+static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
+				    sector_t sector, unsigned *len)
 {
-	struct bio *clone = &tio->clone;
+	struct bio *bio = ci->bio, *clone;
+	struct dm_target_io *tio;
 	int r;
 
+	tio = alloc_tio(ci, ti, 0, GFP_NOIO);
+	tio->len_ptr = len;
+
+	clone = &tio->clone;
 	__bio_clone_fast(clone, bio);
 
 	r = bio_crypt_clone(clone, bio, GFP_NOIO);
 	if (r < 0)
-		return r;
+		goto free_tio;
 
 	if (bio_integrity(bio)) {
 		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
@@ -1208,21 +1213,26 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
 			DMWARN("%s: the target %s doesn't support integrity data.",
 				dm_device_name(tio->io->md),
 				tio->ti->type->name);
-			return -EIO;
+			r = -EIO;
+			goto free_tio;
 		}
 
 		r = bio_integrity_clone(clone, bio, GFP_NOIO);
 		if (r < 0)
-			return r;
+			goto free_tio;
 	}
 
 	bio_advance(clone, to_bytes(sector - clone->bi_iter.bi_sector));
-	clone->bi_iter.bi_size = to_bytes(len);
+	clone->bi_iter.bi_size = to_bytes(*len);
 
 	if (bio_integrity(bio))
 		bio_integrity_trim(clone);
 
+	__map_bio(tio);
 	return 0;
+free_tio:
+	free_tio(tio);
+	return r;
 }
 
 static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
@@ -1313,25 +1323,6 @@ static int __send_empty_flush(struct clone_info *ci)
 	return 0;
 }
 
-static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
-				    sector_t sector, unsigned *len)
-{
-	struct bio *bio = ci->bio;
-	struct dm_target_io *tio;
-	int r;
-
-	tio = alloc_tio(ci, ti, 0, GFP_NOIO);
-	tio->len_ptr = len;
-	r = clone_bio(tio, bio, sector, *len);
-	if (r < 0) {
-		free_tio(tio);
-		return r;
-	}
-	__map_bio(tio);
-
-	return 0;
-}
-
 static int __send_changing_extent_only(struct clone_info *ci, struct dm_target *ti,
 				       unsigned num_bios)
 {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
