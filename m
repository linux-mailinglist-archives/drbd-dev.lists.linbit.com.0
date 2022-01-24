Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C3497B2A
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jan 2022 10:11:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 363B0420FC5;
	Mon, 24 Jan 2022 10:11:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A62B4205C6
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jan 2022 10:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pMAOIxwEWgivE8T/8jAutxBqi67ojpc7aSJ9Dfvp1Nk=;
	b=xHe2ACiTwAYAjp/I5zJRyXa8ki
	JlnNLXudrLlXUiX6cEigCKlkTBhciArJsMDCFKqz+sqi60Z5HlA6HuKOjc7Lxa8uuV31Tjrrn9i2o
	fuitG3t8mkNF95ga5JGVLb/VdVUg2NdWllmOqOY00XjI0JRdDRzciunmhniPRzNPdtSaYWxdCyNzc
	Musr2zaRq8/xl+srtNtDGeIaNmqqS9DkkHEJKhT1AK/jQGaZWQNg+DZ6Yc1BQDudjwt+F39JP3zQ7
	blPTtw58n/XnFVYKRC4Mt5UJvveE4UCZ4e+Nrt7XpLtReKDGM7X7AGj2ChOx6sVKSwUgI5CuSTWdy
	lzb9QxpQ==;
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvNd-002k0e-Og; Mon, 24 Jan 2022 09:11:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Jan 2022 10:10:51 +0100
Message-Id: <20220124091107.642561-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 03/19] nfs/blocklayout: remove bl_alloc_init_bio
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

bio_alloc will never fail when it can sleep.  Remove the now simple
bl_alloc_init_bio helper and open code it in the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/nfs/blocklayout/blocklayout.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/fs/nfs/blocklayout/blocklayout.c b/fs/nfs/blocklayout/blocklayout.c
index fe860c5387476..38e063af7e98a 100644
--- a/fs/nfs/blocklayout/blocklayout.c
+++ b/fs/nfs/blocklayout/blocklayout.c
@@ -115,23 +115,6 @@ bl_submit_bio(struct bio *bio)
 	return NULL;
 }
 
-static struct bio *bl_alloc_init_bio(unsigned int npg,
-		struct block_device *bdev, sector_t disk_sector,
-		bio_end_io_t end_io, struct parallel_io *par)
-{
-	struct bio *bio;
-
-	npg = bio_max_segs(npg);
-	bio = bio_alloc(GFP_NOIO, npg);
-	if (bio) {
-		bio->bi_iter.bi_sector = disk_sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_end_io = end_io;
-		bio->bi_private = par;
-	}
-	return bio;
-}
-
 static bool offset_in_map(u64 offset, struct pnfs_block_dev_map *map)
 {
 	return offset >= map->start && offset < map->start + map->len;
@@ -171,10 +154,11 @@ do_add_page_to_bio(struct bio *bio, int npg, int rw, sector_t isect,
 
 retry:
 	if (!bio) {
-		bio = bl_alloc_init_bio(npg, map->bdev,
-				disk_addr >> SECTOR_SHIFT, end_io, par);
-		if (!bio)
-			return ERR_PTR(-ENOMEM);
+		bio = bio_alloc(GFP_NOIO, bio_max_segs(npg));
+		bio->bi_iter.bi_sector = disk_addr >> SECTOR_SHIFT;
+		bio_set_dev(bio, map->bdev);
+		bio->bi_end_io = end_io;
+		bio->bi_private = par;
 		bio_set_op_attrs(bio, rw, 0);
 	}
 	if (bio_add_page(bio, page, *len, offset) < *len) {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
