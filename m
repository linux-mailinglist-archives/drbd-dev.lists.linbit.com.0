Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD104FA512
	for <lists+drbd-dev@lfdr.de>; Sat,  9 Apr 2022 07:25:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C671942102B;
	Sat,  9 Apr 2022 07:25:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 042BD420FFA
	for <drbd-dev@lists.linbit.com>; Sat,  9 Apr 2022 07:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=LA03+v2RMrt5LLwAfTBpcNFXpYhSXKyM/LEXrkZN1Tc=;
	b=TToQ+IG68ZTma6i9nDz6xx4LYK
	D0aw9uFluTWmoLPN8wS4Tw4ptzJ/n+LwG2AuHxcLmQEWYx1aZe+l+/EUb07HA13ebYd+zXWtHqs00
	wx9o5AAPH2KJPl0+jag4OLclg/JD37wQiqgJHq6T1H6FWx+UFz58+SDkab9YWBuWtwT6h/pIgt6FR
	AzrhjmPB8W4cd/F2sRVPHfKdDw0YBBrQTFPQ9a74BSKEWHHl6H0cqEhdUPbu4a8zWq2vD/QaSCtLv
	QCIx9f2iUsf6SUo5Q4SNMv/t99ukC9ZdAasasKnk54ghRUz188l1onQf3RFgK9e1sPw7Yo1mCiQup
	PdxOz5qQ==;
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd34e-0021EZ-Bz; Sat, 09 Apr 2022 04:51:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:34 +0200
Message-Id: <20220409045043.23593-19-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 18/27] block: move bdev_alignment_offset and
	queue_limit_alignment_offset out of line
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

No need to inline these fairly larger helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/blk-settings.c   | 23 +++++++++++++++++++++++
 include/linux/blkdev.h | 21 +--------------------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index b83df3d2eebca..94410a13c0dee 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -468,6 +468,16 @@ void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
 }
 EXPORT_SYMBOL(blk_queue_io_opt);
 
+static int queue_limit_alignment_offset(struct queue_limits *lim,
+		sector_t sector)
+{
+	unsigned int granularity = max(lim->physical_block_size, lim->io_min);
+	unsigned int alignment = sector_div(sector, granularity >> SECTOR_SHIFT)
+		<< SECTOR_SHIFT;
+
+	return (granularity + lim->alignment_offset - alignment) % granularity;
+}
+
 static unsigned int blk_round_down_sectors(unsigned int sectors, unsigned int lbs)
 {
 	sectors = round_down(sectors, lbs >> SECTOR_SHIFT);
@@ -901,3 +911,16 @@ void blk_queue_set_zoned(struct gendisk *disk, enum blk_zoned_model model)
 	}
 }
 EXPORT_SYMBOL_GPL(blk_queue_set_zoned);
+
+int bdev_alignment_offset(struct block_device *bdev)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	if (q->limits.misaligned)
+		return -1;
+	if (bdev_is_partition(bdev))
+		return queue_limit_alignment_offset(&q->limits,
+				bdev->bd_start_sect);
+	return q->limits.alignment_offset;
+}
+EXPORT_SYMBOL_GPL(bdev_alignment_offset);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d5346e72e3645..0a1795ac26275 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1251,26 +1251,7 @@ bdev_zone_write_granularity(struct block_device *bdev)
 	return queue_zone_write_granularity(bdev_get_queue(bdev));
 }
 
-static inline int queue_limit_alignment_offset(struct queue_limits *lim, sector_t sector)
-{
-	unsigned int granularity = max(lim->physical_block_size, lim->io_min);
-	unsigned int alignment = sector_div(sector, granularity >> SECTOR_SHIFT)
-		<< SECTOR_SHIFT;
-
-	return (granularity + lim->alignment_offset - alignment) % granularity;
-}
-
-static inline int bdev_alignment_offset(struct block_device *bdev)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-
-	if (q->limits.misaligned)
-		return -1;
-	if (bdev_is_partition(bdev))
-		return queue_limit_alignment_offset(&q->limits,
-				bdev->bd_start_sect);
-	return q->limits.alignment_offset;
-}
+int bdev_alignment_offset(struct block_device *bdev);
 
 static inline int queue_discard_alignment(const struct request_queue *q)
 {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
