Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B4B49DADE
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 07:37:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E32142A570;
	Thu, 27 Jan 2022 07:37:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9927642063A
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 07:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nD4hnO0c/894wfLkn4haH61TsQIJtd27xipaLx7cMsQ=;
	b=bsQUK2WB6GGyx0rEP0sp+HTSD1
	WeNjA8hyO2rlpW103YJDXGkG3dnB669BTh/2pJAuol5z7f+8LIdPDkDTrk+qACYWnDikXXc46OZmU
	WOp7W5d4Knf/Hu66kjqIwOwE6/jw3dobfoxWk2+5kXQYOpxkKCw9v9jWwnCfN9V1Amfi5ffkL3Vl/
	f8PSQbWjNDr2nWBlsek4L+FuOj7RH5dOlebzoTaGsg9zwa0/7ZE2Va3GkAkA56VynPxmTphOKGjzk
	4fSW1VyJVjX2ZU8817cMs7z4cB5OBpp5fwQNjtfN9Hk47d2OLEOG1WtZqDkNbf5ClIuo91cwvxaDs
	MPg/Ivqg==;
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyO1-00EY3r-UR; Thu, 27 Jan 2022 06:36:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:35 +0100
Message-Id: <20220127063546.1314111-4-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 03/14] dm: fold clone_bio into
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
index 692a06156c927..e1356a4ce0393 100644
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
