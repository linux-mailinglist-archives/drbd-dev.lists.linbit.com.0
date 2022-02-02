Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44D4A7553
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:03:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFA174201D2;
	Wed,  2 Feb 2022 17:03:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D348A420181
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DsQFlobwtwH+o+U45Zc9FPhgYyit0C3r48NlH8H2OKc=;
	b=j+gHptLCTZhtypmJEWrA1ad73E
	6DlmLS+lowmN2MXlII6y72WdyPyJ9MYaHY77ekyvh3oRbWViuQ/VpDjxPs1jBjqXx0p1jGwxQ2uYG
	NlCTnAMf4s+P7xTeUVxjVqeH8310RZdJaKLfQ4xFM5B/wfCC+gKEoC1yOXmfwPVj9nh/JUt6/s9DI
	oItx3QzzC1WXBj1jlgfpCb/6ddMLMUHBZpabX+C5b2HqgMrrrwOVz49K6WYKQsoQsTpiO7abjehNj
	mc6ivJBGTEq08AFahbf+Ew36O8gcG6mndcFkKR9ZXka+DgwPAkcU0kHXAVjXhuMcXrsquT/wlq1P4
	Ires1bpA==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4S-00G81a-UW; Wed, 02 Feb 2022 16:01:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:01:01 +0100
Message-Id: <20220202160109.108149-6-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 05/13] dm: move cloning the bio into alloc_tio
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

Move the call to __bio_clone_fast and the assignment of ->len_ptr from
the callers into alloc_tio to prepare for changes to the bio clone API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 2527b287ead0f..90341b7fa5809 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -545,7 +545,7 @@ static void free_io(struct mapped_device *md, struct dm_io *io)
 }
 
 static struct dm_target_io *alloc_tio(struct clone_info *ci, struct dm_target *ti,
-				      unsigned target_bio_nr, gfp_t gfp_mask)
+		unsigned target_bio_nr, unsigned *len, gfp_t gfp_mask)
 {
 	struct dm_target_io *tio;
 
@@ -561,11 +561,13 @@ static struct dm_target_io *alloc_tio(struct clone_info *ci, struct dm_target *t
 		tio = clone_to_tio(clone);
 		tio->inside_dm_io = false;
 	}
+	__bio_clone_fast(&tio->clone, ci->bio);
 
 	tio->magic = DM_TIO_MAGIC;
 	tio->io = ci->io;
 	tio->ti = ti;
 	tio->target_bio_nr = target_bio_nr;
+	tio->len_ptr = len;
 
 	return tio;
 }
@@ -1197,11 +1199,8 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 	struct dm_target_io *tio;
 	int r;
 
-	tio = alloc_tio(ci, ti, 0, GFP_NOIO);
-	tio->len_ptr = len;
-
+	tio = alloc_tio(ci, ti, 0, len, GFP_NOIO);
 	clone = &tio->clone;
-	__bio_clone_fast(clone, bio);
 
 	r = bio_crypt_clone(clone, bio, GFP_NOIO);
 	if (r < 0)
@@ -1236,7 +1235,8 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 }
 
 static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
-				struct dm_target *ti, unsigned num_bios)
+				struct dm_target *ti, unsigned num_bios,
+				unsigned *len)
 {
 	struct dm_target_io *tio;
 	int try;
@@ -1245,7 +1245,7 @@ static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 		return;
 
 	if (num_bios == 1) {
-		tio = alloc_tio(ci, ti, 0, GFP_NOIO);
+		tio = alloc_tio(ci, ti, 0, len, GFP_NOIO);
 		bio_list_add(blist, &tio->clone);
 		return;
 	}
@@ -1257,7 +1257,8 @@ static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 		if (try)
 			mutex_lock(&ci->io->md->table_devices_lock);
 		for (bio_nr = 0; bio_nr < num_bios; bio_nr++) {
-			tio = alloc_tio(ci, ti, bio_nr, try ? GFP_NOIO : GFP_NOWAIT);
+			tio = alloc_tio(ci, ti, bio_nr, len,
+					try ? GFP_NOIO : GFP_NOWAIT);
 			if (!tio)
 				break;
 
@@ -1279,14 +1280,11 @@ static void __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
 	struct bio_list blist = BIO_EMPTY_LIST;
 	struct bio *clone;
 
-	alloc_multiple_bios(&blist, ci, ti, num_bios);
+	alloc_multiple_bios(&blist, ci, ti, num_bios, len);
 
 	while ((clone = bio_list_pop(&blist))) {
 		struct dm_target_io *tio = clone_to_tio(clone);
 
-		tio->len_ptr = len;
-
-		__bio_clone_fast(clone, ci->bio);
 		if (len)
 			bio_setup_sector(clone, ci->sector, *len);
 		__map_bio(tio);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
