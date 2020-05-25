Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 749861E0DBB
	for <lists+drbd-dev@lfdr.de>; Mon, 25 May 2020 13:50:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5E5174203F9;
	Mon, 25 May 2020 13:50:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 08E3E4203F1
	for <drbd-dev@lists.linbit.com>; Mon, 25 May 2020 13:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6a0vq31enKgegF8zJ78j2cWuR5zRd/jk3PszJMlohfc=;
	b=Ge2LnKsk+SKGrPrG0DitHoff1G
	Y8AvSx505qQET7z074lnMmQikRXHviQhfvg0vxoHLL+wm49VWuSW1JO2Xhd4NiYkPYKKUR2UH7HRs
	2HUUjIaxogCdKr8Hbb71kEtxSr2DOKB7GqbErm1ACQGU35q6xPc77JyEGOcX5/57SLlf0GnuygsQn
	DS/CykRJKh56fKKqO6QnxEfnLAz+HYKhK1SuUaKVyTFjaC/vnC6MuSMKIZMj5GQz2zO1WvhW5BAZf
	2LNbcceiQVL9wb0GxaCaLcHuydilhbuMUu1KAEYL6sUuTDBuQWAr7lZc51rkY+f/TYpxn+ODAX3Ad
	9XOpd8cQ==;
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJe-0002Ty-Ib; Mon, 25 May 2020 11:30:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:08 +0200
Message-Id: <20200525113014.345997-11-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 10/16] block: move update_io_ticks to blk-core.c
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

All callers are in blk-core.c, so move update_io_ticks over.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c      | 16 ----------------
 block/blk-core.c | 15 +++++++++++++++
 block/blk.h      |  1 -
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 3e89c7b37855a..5235da6434aab 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1376,22 +1376,6 @@ void bio_check_pages_dirty(struct bio *bio)
 	schedule_work(&bio_dirty_work);
 }
 
-void update_io_ticks(struct hd_struct *part, unsigned long now, bool end)
-{
-	unsigned long stamp;
-again:
-	stamp = READ_ONCE(part->stamp);
-	if (unlikely(stamp != now)) {
-		if (likely(cmpxchg(&part->stamp, stamp, now) == stamp)) {
-			__part_stat_add(part, io_ticks, end ? now - stamp : 1);
-		}
-	}
-	if (part->partno) {
-		part = &part_to_disk(part)->part0;
-		goto again;
-	}
-}
-
 static inline bool bio_remaining_done(struct bio *bio)
 {
 	/*
diff --git a/block/blk-core.c b/block/blk-core.c
index 8973104f88d90..c1675d43c2da0 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1381,6 +1381,21 @@ unsigned int blk_rq_err_bytes(const struct request *rq)
 }
 EXPORT_SYMBOL_GPL(blk_rq_err_bytes);
 
+static void update_io_ticks(struct hd_struct *part, unsigned long now, bool end)
+{
+	unsigned long stamp;
+again:
+	stamp = READ_ONCE(part->stamp);
+	if (unlikely(stamp != now)) {
+		if (likely(cmpxchg(&part->stamp, stamp, now) == stamp))
+			__part_stat_add(part, io_ticks, end ? now - stamp : 1);
+	}
+	if (part->partno) {
+		part = &part_to_disk(part)->part0;
+		goto again;
+	}
+}
+
 static void blk_account_io_completion(struct request *req, unsigned int bytes)
 {
 	if (req->part && blk_do_io_stat(req)) {
diff --git a/block/blk.h b/block/blk.h
index 5db4ec1e85f7b..bdf5e94467aa2 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -344,7 +344,6 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q);
 static inline void blk_queue_free_zone_bitmaps(struct request_queue *q) {}
 #endif
 
-void update_io_ticks(struct hd_struct *part, unsigned long now, bool end);
 struct hd_struct *disk_map_sector_rcu(struct gendisk *disk, sector_t sector);
 
 int blk_alloc_devt(struct hd_struct *part, dev_t *devt);
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
