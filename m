Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF2304223
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:19:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AAE1C42063C;
	Tue, 26 Jan 2021 16:19:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15699420630
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W8aYaHALoHXbZuaFOXKQTvVh+y8Fd7IAvJYrZZoNhdA=;
	b=JGt1JH63w8eiaQAEI4n5kVSxVw
	Yb98hQCjj4BuRaFELXNV4V1YWR5whaTFBuvsbS38JX90ZmqkewzosVaccIltP0wA2PaXodrpLDpB2
	dSjrXAgSsWvpd2IUnGUtb9AYtQSvL35vq7Nk0hrDytjnDJgyME8PkByHiOhSAl9mtgqEmnzC6m+1a
	27nBnbSxYEnE4x0UzJcki15gkshb+GwSUKKI0Oto59KylHdpnaNOwDbNnn+gdjEjJTFJ/NFEbW1sE
	0TONqXtHBo84FuLa/h+/kr81vIkdUY2Vm7qMY41RhMKFBZje5JtOQrBJAVRfoZsXINuN6WnyqR5mx
	9qSFgATA==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4Q1A-005nvT-6a; Tue, 26 Jan 2021 15:13:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:42 +0100
Message-Id: <20210126145247.1964410-13-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
	linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 12/17] md: simplify sync_page_io
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

Use an on-stack bio and biovec for the single page synchronous I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index e2b9dbb6e888f6..6a27f52007c871 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1021,29 +1021,29 @@ int md_super_wait(struct mddev *mddev)
 int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
 		 struct page *page, int op, int op_flags, bool metadata_op)
 {
-	struct bio *bio = md_bio_alloc_sync(rdev->mddev);
-	int ret;
+	struct bio bio;
+	struct bio_vec bvec;
+
+	bio_init(&bio, &bvec, 1);
 
 	if (metadata_op && rdev->meta_bdev)
-		bio_set_dev(bio, rdev->meta_bdev);
+		bio_set_dev(&bio, rdev->meta_bdev);
 	else
-		bio_set_dev(bio, rdev->bdev);
-	bio_set_op_attrs(bio, op, op_flags);
+		bio_set_dev(&bio, rdev->bdev);
+	bio.bi_opf = op | op_flags;
 	if (metadata_op)
-		bio->bi_iter.bi_sector = sector + rdev->sb_start;
+		bio.bi_iter.bi_sector = sector + rdev->sb_start;
 	else if (rdev->mddev->reshape_position != MaxSector &&
 		 (rdev->mddev->reshape_backwards ==
 		  (sector >= rdev->mddev->reshape_position)))
-		bio->bi_iter.bi_sector = sector + rdev->new_data_offset;
+		bio.bi_iter.bi_sector = sector + rdev->new_data_offset;
 	else
-		bio->bi_iter.bi_sector = sector + rdev->data_offset;
-	bio_add_page(bio, page, size, 0);
+		bio.bi_iter.bi_sector = sector + rdev->data_offset;
+	bio_add_page(&bio, page, size, 0);
 
-	submit_bio_wait(bio);
+	submit_bio_wait(&bio);
 
-	ret = !bio->bi_status;
-	bio_put(bio);
-	return ret;
+	return !bio.bi_status;
 }
 EXPORT_SYMBOL_GPL(sync_page_io);
 
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
