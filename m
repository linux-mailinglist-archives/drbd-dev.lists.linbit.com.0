Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 742064920D3
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jan 2022 09:02:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4D591420BB1;
	Tue, 18 Jan 2022 09:02:27 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1C2904202F4
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jan 2022 08:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NiiyVm7T1RSoly2lncOqK9SkmVJ5v0QSThOfEky6q20=;
	b=MpqAqQ8K5Fa6Y5wTGJl/gbG8OO
	dn6PaxcYnaVlNfT2mS1jeUKelsFExp+uG3u9mIvCpmas8BzQ0HJleX15bQnbvwePmlkVlO5W0vzSK
	HvgBfIGs0RGASj9FFd6sE8tJ4qfhkmRCextanNUhqXChTqh8JwFoHdtpflmklbp5zQYV6ZVzOyC1T
	pwKLY+kGCwUQFPrabqHRfoONsuU1ADJ9WWyYqDlTyqsbbVI8ypgDGmJbl8/GUeu7NuW8yznpIFL9H
	xC7HLvhlMXxb+qdKze/uBd+r7dTrjI/Jf8j/c9/dF2KRq4+f8hr1Qn1e+/PCC7wHouMmupch1ruki
	Eavz2L2w==;
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9imp-000ZRg-HC; Tue, 18 Jan 2022 07:20:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:39 +0100
Message-Id: <20220118071952.1243143-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 06/19] dm-crypt: remove clone_init
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

Just open code it next to the bio allocations, which saves a few lines
of code, prepares for future changes and allows to remove the duplicate
bi_opf assignment for the bio_clone_fast case in kcryptd_io_read.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-crypt.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 20abe3486aba1..3c5ecd35d3483 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -234,7 +234,7 @@ static volatile unsigned long dm_crypt_pages_per_client;
 #define DM_CRYPT_MEMORY_PERCENT			2
 #define DM_CRYPT_MIN_PAGES_PER_CLIENT		(BIO_MAX_VECS * 16)
 
-static void clone_init(struct dm_crypt_io *, struct bio *);
+static void crypt_endio(struct bio *clone);
 static void kcryptd_queue_crypt(struct dm_crypt_io *io);
 static struct scatterlist *crypt_get_sg_data(struct crypt_config *cc,
 					     struct scatterlist *sg);
@@ -1673,7 +1673,10 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned size)
 		mutex_lock(&cc->bio_alloc_lock);
 
 	clone = bio_alloc_bioset(GFP_NOIO, nr_iovecs, &cc->bs);
-	clone_init(io, clone);
+	clone->bi_private = io;
+	clone->bi_end_io = crypt_endio;
+	bio_set_dev(clone, cc->dev->bdev);
+	clone->bi_opf = io->base_bio->bi_opf;
 
 	remaining_size = size;
 
@@ -1826,16 +1829,6 @@ static void crypt_endio(struct bio *clone)
 	crypt_dec_pending(io);
 }
 
-static void clone_init(struct dm_crypt_io *io, struct bio *clone)
-{
-	struct crypt_config *cc = io->cc;
-
-	clone->bi_private = io;
-	clone->bi_end_io  = crypt_endio;
-	bio_set_dev(clone, cc->dev->bdev);
-	clone->bi_opf	  = io->base_bio->bi_opf;
-}
-
 static int kcryptd_io_read(struct dm_crypt_io *io, gfp_t gfp)
 {
 	struct crypt_config *cc = io->cc;
@@ -1850,10 +1843,12 @@ static int kcryptd_io_read(struct dm_crypt_io *io, gfp_t gfp)
 	clone = bio_clone_fast(io->base_bio, gfp, &cc->bs);
 	if (!clone)
 		return 1;
+	clone->bi_private = io;
+	clone->bi_end_io = crypt_endio;
+	bio_set_dev(clone, cc->dev->bdev);
 
 	crypt_inc_pending(io);
 
-	clone_init(io, clone);
 	clone->bi_iter.bi_sector = cc->start + io->sector;
 
 	if (dm_crypt_integrity_io_alloc(io, clone)) {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
