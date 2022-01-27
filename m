Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A700449DB10
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 07:57:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 89BB842A58F;
	Thu, 27 Jan 2022 07:57:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79E0C42A58D
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 07:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8t+56lp6dVMHM+jQkBmWG3FrLeB98BaTd5m46YJ8gF8=;
	b=bBRBIUtBk5sjvlildtSSk5PtGn
	ZXKuX9y8W0ebknK97WV8RfT5fF8zaPjUsywA2cmMw6ASQj63g2a4kYXz3M7Ht88vERK+44GKdSxL6
	WUdePy07ZN+iiCFrm0dOyOwRxnpodSm7IiqypsUbRJCCn0N0nYEehx41PR5nDRRXxFvIqiApaWMv0
	UE8UcwdJ1HbffPLVGCFzbeK3PfHAxMEjUKdJG0n/vZdE2gwarT2/Unbk4uj7WTttlkFxq+/DSL+tc
	t2ZHfsUIf+ayZC20wx0+kCsuku+zTFyiEjVC8FgObwnUTXgjzuJW8rIIulKVY3KPl5z5UMc1lwAg0
	3bqUzxCg==;
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyOP-00EYCd-7E; Thu, 27 Jan 2022 06:36:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:42 +0100
Message-Id: <20220127063546.1314111-11-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 10/14] dm-cache: remove
	__remap_to_origin_clear_discard
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

Fold __remap_to_origin_clear_discard into the two callers to prepare
for bio cloning refactoring.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-cache-target.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 447d030036d18..1c37fe028e531 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -744,21 +744,14 @@ static void check_if_tick_bio_needed(struct cache *cache, struct bio *bio)
 	spin_unlock_irq(&cache->lock);
 }
 
-static void __remap_to_origin_clear_discard(struct cache *cache, struct bio *bio,
-					    dm_oblock_t oblock, bool bio_has_pbd)
-{
-	if (bio_has_pbd)
-		check_if_tick_bio_needed(cache, bio);
-	remap_to_origin(cache, bio);
-	if (bio_data_dir(bio) == WRITE)
-		clear_discard(cache, oblock_to_dblock(cache, oblock));
-}
-
 static void remap_to_origin_clear_discard(struct cache *cache, struct bio *bio,
 					  dm_oblock_t oblock)
 {
 	// FIXME: check_if_tick_bio_needed() is called way too much through this interface
-	__remap_to_origin_clear_discard(cache, bio, oblock, true);
+	check_if_tick_bio_needed(cache, bio);
+	remap_to_origin(cache, bio);
+	if (bio_data_dir(bio) == WRITE)
+		clear_discard(cache, oblock_to_dblock(cache, oblock));
 }
 
 static void remap_to_cache_dirty(struct cache *cache, struct bio *bio,
@@ -831,11 +824,10 @@ static void remap_to_origin_and_cache(struct cache *cache, struct bio *bio,
 	BUG_ON(!origin_bio);
 
 	bio_chain(origin_bio, bio);
-	/*
-	 * Passing false to __remap_to_origin_clear_discard() skips
-	 * all code that might use per_bio_data (since clone doesn't have it)
-	 */
-	__remap_to_origin_clear_discard(cache, origin_bio, oblock, false);
+
+	remap_to_origin(cache, origin_bio);
+	if (bio_data_dir(origin_bio) == WRITE)
+		clear_discard(cache, oblock_to_dblock(cache, oblock));
 	submit_bio(origin_bio);
 
 	remap_to_cache(cache, bio, cblock);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
