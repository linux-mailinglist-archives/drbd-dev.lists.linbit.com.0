Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4AB3041C7
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:12:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 25F1342062A;
	Tue, 26 Jan 2021 16:12:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19FA8420622
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HErhv54QBaSjoGpiWf1SZ+x2VawfdyThF54vo2cmZ+0=;
	b=psFgtPRZ6D/21BqcKKyxXBT5zV
	Arh/O5/9ipibQp28daCFwPAkwEfB8+qxTkARKVHVe011bePjLLoCZIAzrYjP3M/HV6EqUx4is00Yk
	kOABbaz6Etshz/WgzYdyqQE+9HKqaXrdoZVODEsiOGiRPyCkiK74I61FXpT/fV0sHhSRmxgTQ0iBY
	SFDBTDTQ5plMii25HFVgTG3Wg/BO1lFNS1S2Mmjf3GTuH1SDsGuByg0C1MHlYmglHBfP0gXy8clgd
	Ld4f4GtTIzjg/E/zIYg1Xr48+Gj7Jvj4OIzkm7oxnKOobS8TWjPxW+tR7kP9DT95SnrWdUOiZj+ok
	zlSx8+ow==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4PwO-005nSC-70; Tue, 26 Jan 2021 15:07:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:39 +0100
Message-Id: <20210126145247.1964410-10-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 09/17] drbd: remove bio_alloc_drbd
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

Given that drbd_md_io_bio_set is initialized during module initialization
and the module fails to load if the initialization fails there is no need
to fall back to plain bio_alloc.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_actlog.c |  2 +-
 drivers/block/drbd/drbd_bitmap.c |  2 +-
 drivers/block/drbd/drbd_int.h    |  2 --
 drivers/block/drbd/drbd_main.c   | 13 -------------
 4 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index 7227fc7ab8ed1e..72cf7603d51fc7 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -138,7 +138,7 @@ static int _drbd_md_sync_page_io(struct drbd_device *device,
 		op_flags |= REQ_FUA | REQ_PREFLUSH;
 	op_flags |= REQ_SYNC;
 
-	bio = bio_alloc_drbd(GFP_NOIO);
+	bio = bio_alloc_bioset(GFP_NOIO, 1, &drbd_md_io_bio_set);
 	bio_set_dev(bio, bdev->md_bdev);
 	bio->bi_iter.bi_sector = sector;
 	err = -EIO;
diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index df53dca5d02c7e..c1f816f896a89a 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -976,7 +976,7 @@ static void drbd_bm_endio(struct bio *bio)
 
 static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_hold(local)
 {
-	struct bio *bio = bio_alloc_drbd(GFP_NOIO);
+	struct bio *bio = bio_alloc_bioset(GFP_NOIO, 1, &drbd_md_io_bio_set);
 	struct drbd_device *device = ctx->device;
 	struct drbd_bitmap *b = device->bitmap;
 	struct page *page;
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index b2c93a29c251fd..02db50d7e4c668 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1422,8 +1422,6 @@ extern mempool_t drbd_md_io_page_pool;
 /* We also need to make sure we get a bio
  * when we need it for housekeeping purposes */
 extern struct bio_set drbd_md_io_bio_set;
-/* to allocate from that set */
-extern struct bio *bio_alloc_drbd(gfp_t gfp_mask);
 
 /* And a bio_set for cloning */
 extern struct bio_set drbd_io_bio_set;
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 1c8c18b2a25f33..788dd97e6026b8 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -138,19 +138,6 @@ static const struct block_device_operations drbd_ops = {
 	.release	= drbd_release,
 };
 
-struct bio *bio_alloc_drbd(gfp_t gfp_mask)
-{
-	struct bio *bio;
-
-	if (!bioset_initialized(&drbd_md_io_bio_set))
-		return bio_alloc(gfp_mask, 1);
-
-	bio = bio_alloc_bioset(gfp_mask, 1, &drbd_md_io_bio_set);
-	if (!bio)
-		return NULL;
-	return bio;
-}
-
 #ifdef __CHECKER__
 /* When checking with sparse, and this is an inline function, sparse will
    give tons of false positives. When this is a real functions sparse works.
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
