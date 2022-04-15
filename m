Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A25023CD
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Apr 2022 07:23:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7267C420FAA;
	Fri, 15 Apr 2022 07:23:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E80F8420979
	for <drbd-dev@lists.linbit.com>; Fri, 15 Apr 2022 07:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6r328luNCDNaFOT33dRflffYOj2Ig+snh5CgwFTaxcw=;
	b=mNuFiFjSDLbldIX31eYOuSlRR9
	8563S/h8LrxYIHowjJfVJZ76RAtIHUbU8W+hFh4MWU8WMYfdB6LyJh2COdvD/iZqFmSUWNE+zj3n8
	TjDK1RADFF2jHuhjgFvsFPr2iNfo2ZxzGPd6/D7n8+r4+csvAbreOAgnv7mb2shTRUMZRApT5F90K
	NcXEn1pmSIjxsyXRt1Q5Fpafq+pdIcKs6RGb6uD0qSORONp8YiTBWhXw1jJiMd9DQ1XNtZR7AS8Rn
	LRWZ13064QQZdYqJpwxZzURW2pQw6Vjn+9nq/BjlV+QBzJ7qa6lBovEI7n8jqfejDLm+YrLORSOW6
	48XX9zTw==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfDyB-008PbH-KB; Fri, 15 Apr 2022 04:54:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:52 +0200
Message-Id: <20220415045258.199825-22-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 21/27] block: move {bdev,
	queue_limit}_discard_alignment out of line
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

No need to inline these fairly larger helpers.  Also fix the return value
to be unsigned, just like the field in struct queue_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/blk-settings.c   | 35 +++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h | 34 +---------------------------------
 2 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 94410a13c0dee..fd83d674afd0a 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -478,6 +478,30 @@ static int queue_limit_alignment_offset(struct queue_limits *lim,
 	return (granularity + lim->alignment_offset - alignment) % granularity;
 }
 
+static unsigned int queue_limit_discard_alignment(struct queue_limits *lim,
+		sector_t sector)
+{
+	unsigned int alignment, granularity, offset;
+
+	if (!lim->max_discard_sectors)
+		return 0;
+
+	/* Why are these in bytes, not sectors? */
+	alignment = lim->discard_alignment >> SECTOR_SHIFT;
+	granularity = lim->discard_granularity >> SECTOR_SHIFT;
+	if (!granularity)
+		return 0;
+
+	/* Offset of the partition start in 'granularity' sectors */
+	offset = sector_div(sector, granularity);
+
+	/* And why do we do this modulus *again* in blkdev_issue_discard()? */
+	offset = (granularity + alignment - offset) % granularity;
+
+	/* Turn it back into bytes, gaah */
+	return offset << SECTOR_SHIFT;
+}
+
 static unsigned int blk_round_down_sectors(unsigned int sectors, unsigned int lbs)
 {
 	sectors = round_down(sectors, lbs >> SECTOR_SHIFT);
@@ -924,3 +948,14 @@ int bdev_alignment_offset(struct block_device *bdev)
 	return q->limits.alignment_offset;
 }
 EXPORT_SYMBOL_GPL(bdev_alignment_offset);
+
+unsigned int bdev_discard_alignment(struct block_device *bdev)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	if (bdev_is_partition(bdev))
+		return queue_limit_discard_alignment(&q->limits,
+				bdev->bd_start_sect);
+	return q->limits.discard_alignment;
+}
+EXPORT_SYMBOL_GPL(bdev_discard_alignment);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5a9b7aeda010b..34b1cfd067421 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1252,39 +1252,7 @@ bdev_zone_write_granularity(struct block_device *bdev)
 }
 
 int bdev_alignment_offset(struct block_device *bdev);
-
-static inline int queue_limit_discard_alignment(struct queue_limits *lim, sector_t sector)
-{
-	unsigned int alignment, granularity, offset;
-
-	if (!lim->max_discard_sectors)
-		return 0;
-
-	/* Why are these in bytes, not sectors? */
-	alignment = lim->discard_alignment >> SECTOR_SHIFT;
-	granularity = lim->discard_granularity >> SECTOR_SHIFT;
-	if (!granularity)
-		return 0;
-
-	/* Offset of the partition start in 'granularity' sectors */
-	offset = sector_div(sector, granularity);
-
-	/* And why do we do this modulus *again* in blkdev_issue_discard()? */
-	offset = (granularity + alignment - offset) % granularity;
-
-	/* Turn it back into bytes, gaah */
-	return offset << SECTOR_SHIFT;
-}
-
-static inline int bdev_discard_alignment(struct block_device *bdev)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-
-	if (bdev_is_partition(bdev))
-		return queue_limit_discard_alignment(&q->limits,
-				bdev->bd_start_sect);
-	return q->limits.discard_alignment;
-}
+unsigned int bdev_discard_alignment(struct block_device *bdev);
 
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
