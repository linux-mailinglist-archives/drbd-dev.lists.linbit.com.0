Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21E20D73D
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jun 2020 22:07:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A41334203F8;
	Mon, 29 Jun 2020 22:07:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C84944203E4
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jun 2020 22:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k0UqCYguWovFmFEFba5t9PR/0pWK66pXhP3lJia2sr8=;
	b=iqCpFcUPe8uei0OvFPbjhSxNTT
	c1T6pmYkN8tfj+ZDdjMEXdvIQY7vFCt5slbgsQaKXdo4Kd1gyEg5KFiod7RzsTbOUDePryBejrS+b
	XXFEFR2tyS//dL6Q+58ug6ZB4kvQM0tpJCgXZE/b4COS7LM1KdTQtkcs47fw/V5vIcOdi8w3PIFn6
	izjNKAU43WkDRSoTNfw9en7oWoxgTehMQFpejfnf1wYGPTm70qVHrpZDu9/oE/tePQHfByzG2Fs7z
	mEAYLXz11QRgrumVZmGDa4vtwloca46yusBAa9FT9yxLk6mDaGC/rhZk+gxIjbtgIQ6ZlpbqB1mfC
	lQc4VBXQ==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzdk-0004P4-3Q; Mon, 29 Jun 2020 19:40:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:46 +0200
Message-Id: <20200629193947.2705954-20-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 19/20] block: shortcut __submit_bio_noacct for
	blk-mq drivers
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

For blk-mq drivers bios can only be inserted for the same queue.  So
bypass the complicated sorting logic in __submit_bio_noacct with
a blk-mq simpler submission helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 50 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index b82f48c86e6f7a..46e3c0a37cc377 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1071,20 +1071,6 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 	return false;
 }
 
-static blk_qc_t do_make_request(struct bio *bio)
-{
-	struct gendisk *disk = bio->bi_disk;
-	blk_qc_t ret = BLK_QC_T_NONE;
-
-	if (blk_crypto_bio_prep(&bio)) {
-		if (!disk->fops->submit_bio)
-			return blk_mq_submit_bio(bio);
-		ret = disk->fops->submit_bio(bio);
-	}
-	blk_queue_exit(disk->queue);
-	return ret;
-}
-
 /*
  * The loop in this function may be a bit non-obvious, and so deserves some
  * explanation:
@@ -1127,7 +1113,11 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 		bio_list_on_stack[1] = bio_list_on_stack[0];
 		bio_list_init(&bio_list_on_stack[0]);
 
-		ret = do_make_request(bio);
+		if (blk_crypto_bio_prep(&bio))
+			ret = bio->bi_disk->fops->submit_bio(bio);
+		else
+			ret = BLK_QC_T_NONE;
+		blk_queue_exit(q);
 
 		/*
 		 * Sort new bios into those for a lower level and those for the
@@ -1153,6 +1143,34 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 	return ret;
 }
 
+static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
+{
+	struct gendisk *disk = bio->bi_disk;
+	struct bio_list bio_list;
+	blk_qc_t ret = BLK_QC_T_NONE;
+
+	bio_list_init(&bio_list);
+	current->bio_list = &bio_list;
+
+	do {
+		WARN_ON_ONCE(bio->bi_disk != disk);
+
+		if (unlikely(bio_queue_enter(bio) != 0))
+			continue;
+
+		if (!blk_crypto_bio_prep(&bio)) {
+			blk_queue_exit(disk->queue);
+			ret = BLK_QC_T_NONE;
+			continue;
+		}
+
+		ret = blk_mq_submit_bio(bio);
+	} while ((bio = bio_list_pop(&bio_list)));
+
+	current->bio_list = NULL;
+	return ret;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -1182,6 +1200,8 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
+	if (bio->bi_disk->queue->mq_ops)
+		return __submit_bio_noacct_mq(bio);
 	return __submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio_noacct);
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
