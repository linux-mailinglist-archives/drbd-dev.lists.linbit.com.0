Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF71E3829
	for <lists+drbd-dev@lfdr.de>; Wed, 27 May 2020 07:26:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42DBB4203EB;
	Wed, 27 May 2020 07:26:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 98C324203D6
	for <drbd-dev@lists.linbit.com>; Wed, 27 May 2020 07:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nZGXLKg/fa4tsfyS2fhj2WVlRQXCuRwjRot6NDlQz5I=;
	b=fzu6cAW87l58ZwGqhqLgXVanPP
	3esCDLRZY/DJ2+wD/8brXOpiPVWoMKjWh/EaYnrAMvLsXPBhtyQQRmf2cLX0SHIE87Y75sA6RfkFj
	ObWnsjh4dBw2E+aSS5UDyEIy6I3bYiw8jJBof4llS///1Ee22hp8OjcO3Mkg4ihREWtRdjstQwsNW
	nmZGy811NLj6jVsz/Prri/VWqQI4cgAzk9boY8Qb/Bii73ihJ+V3Hum0HnHoJMVG3WNJqgsZp9VG/
	6gMWXiAvZQ8QkodLABZyXP9mO6rxOGI5kSsfE5MFAaE3tJwqs8Mt5KVH0ykUxWmrWmPHYODFZtxzf
	XyfwtGXw==;
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYN-0000oT-Ry; Wed, 27 May 2020 05:24:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:08 +0200
Message-Id: <20200527052419.403583-6-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Coly Li <colyli@suse.de>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 05/16] bcache: use bio_{start,end}_io_acct
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

Switch bcache to use the nicer bio accounting helpers, and call the
routines where we also sample the start time to give coherent accounting
results.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Acked-by: Coly Li <colyli@suse.de>
---
 drivers/md/bcache/request.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 77d1a26975174..22b483527176b 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -668,9 +668,7 @@ static void backing_request_endio(struct bio *bio)
 static void bio_complete(struct search *s)
 {
 	if (s->orig_bio) {
-		generic_end_io_acct(s->d->disk->queue, bio_op(s->orig_bio),
-				    &s->d->disk->part0, s->start_time);
-
+		bio_end_io_acct(s->orig_bio, s->start_time);
 		trace_bcache_request_end(s->d, s->orig_bio);
 		s->orig_bio->bi_status = s->iop.status;
 		bio_endio(s->orig_bio);
@@ -730,7 +728,7 @@ static inline struct search *search_alloc(struct bio *bio,
 	s->recoverable		= 1;
 	s->write		= op_is_write(bio_op(bio));
 	s->read_dirty_data	= 0;
-	s->start_time		= jiffies;
+	s->start_time		= bio_start_io_acct(bio);
 
 	s->iop.c		= d->c;
 	s->iop.bio		= NULL;
@@ -1082,8 +1080,7 @@ static void detached_dev_end_io(struct bio *bio)
 	bio->bi_end_io = ddip->bi_end_io;
 	bio->bi_private = ddip->bi_private;
 
-	generic_end_io_acct(ddip->d->disk->queue, bio_op(bio),
-			    &ddip->d->disk->part0, ddip->start_time);
+	bio_end_io_acct(bio, ddip->start_time);
 
 	if (bio->bi_status) {
 		struct cached_dev *dc = container_of(ddip->d,
@@ -1108,7 +1105,7 @@ static void detached_dev_do_request(struct bcache_device *d, struct bio *bio)
 	 */
 	ddip = kzalloc(sizeof(struct detached_dev_io_private), GFP_NOIO);
 	ddip->d = d;
-	ddip->start_time = jiffies;
+	ddip->start_time = bio_start_io_acct(bio);
 	ddip->bi_end_io = bio->bi_end_io;
 	ddip->bi_private = bio->bi_private;
 	bio->bi_end_io = detached_dev_end_io;
@@ -1190,11 +1187,6 @@ blk_qc_t cached_dev_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 
-	generic_start_io_acct(q,
-			      bio_op(bio),
-			      bio_sectors(bio),
-			      &d->disk->part0);
-
 	bio_set_dev(bio, dc->bdev);
 	bio->bi_iter.bi_sector += dc->sb.data_offset;
 
@@ -1311,8 +1303,6 @@ blk_qc_t flash_dev_make_request(struct request_queue *q, struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
-	generic_start_io_acct(q, bio_op(bio), bio_sectors(bio), &d->disk->part0);
-
 	s = search_alloc(bio, d);
 	cl = &s->cl;
 	bio = &s->bio.bio;
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
