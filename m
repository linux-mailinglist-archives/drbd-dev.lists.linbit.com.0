Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F322278DAC
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Sep 2020 18:09:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2BD4421033;
	Fri, 25 Sep 2020 18:09:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B06C9420F4F
	for <drbd-dev@lists.linbit.com>; Fri, 25 Sep 2020 18:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uQJgydSUoDayMaZ249oqW7zlbGRJdSVTgqWhb7/rJ3k=;
	b=cj/4AY1inDNhDrclJrrVdCdYE+
	PJvR/111DO97fIjVnQ14y2n3dlupQHcIJ/DkkbbQS3rpDbWSt50bn+xQWsabkwUb7YyV8SKlH1cO7
	Hoe90eDO+/f1nOSbc1ugnU90h8Cz052p4U1tI1KWFWw+M+1zqleVC0aheX0+YbvjySe753X/V4N/+
	Ewd6DbHsExdbRARUIHO1ZJmryZu6V3TdVKllEEEXXI+EGNk40D8tMlScIUB7ZgyLSOhYTpPnf2JYF
	AAof47/pFcDFKKKLi2aP44Xf+u7N2grImrufgZ/1wr528ymlA2LbAY/oZg+2FtW4YsVvKPvtGtDvI
	M0d/+vSA==;
Received: from [213.208.157.35] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLqF5-0003Ow-HI; Fri, 25 Sep 2020 16:06:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Sep 2020 18:06:18 +0200
Message-Id: <20200925160618.1481450-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925160618.1481450-1-hch@lst.de>
References: <20200925160618.1481450-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org
Subject: [Drbd-dev] [PATCH 2/2] block: add a bdget_part helper
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

All remaining callers of bdget() outside of fs/block_dev.c want to get a
reference to the struct block_device for a given struct hd_struct.  Add
a helper just for that and then mark bdget static.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c           | 2 +-
 block/partitions/core.c | 2 +-
 fs/block_dev.c          | 9 ++++++---
 include/linux/blkdev.h  | 2 +-
 kernel/trace/blktrace.c | 9 ++-------
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index e5f17f022ec700..0a273211fec283 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1048,7 +1048,7 @@ struct block_device *bdget_disk(struct gendisk *disk, int partno)
 
 	part = disk_get_part(disk, partno);
 	if (part)
-		bdev = bdget(part_devt(part));
+		bdev = bdget_part(part);
 	disk_put_part(part);
 
 	return bdev;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index dd6811422a87af..5309e0f44ba352 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -580,7 +580,7 @@ int bdev_resize_partition(struct block_device *bdev, int partno,
 		return -ENXIO;
 
 	ret = -ENOMEM;
-	bdevp = bdget(part_devt(part));
+	bdevp = bdget_part(part);
 	if (!bdevp)
 		goto out_put_part;
 
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 6b9d19ffa5af7b..9e84b1928b9401 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -891,7 +891,7 @@ static int bdev_set(struct inode *inode, void *data)
 	return 0;
 }
 
-struct block_device *bdget(dev_t dev)
+static struct block_device *bdget(dev_t dev)
 {
 	struct block_device *bdev;
 	struct inode *inode;
@@ -920,8 +920,6 @@ struct block_device *bdget(dev_t dev)
 	return bdev;
 }
 
-EXPORT_SYMBOL(bdget);
-
 /**
  * bdgrab -- Grab a reference to an already referenced block device
  * @bdev:	Block device to grab a reference to.
@@ -933,6 +931,11 @@ struct block_device *bdgrab(struct block_device *bdev)
 }
 EXPORT_SYMBOL(bdgrab);
 
+struct block_device *bdget_part(struct hd_struct *part)
+{
+	return bdget(part_devt(part));
+}
+
 long nr_blockdev_pages(void)
 {
 	struct inode *inode;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d5a3e1a4c2f79b..cf80e61b4c5e1a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -2003,7 +2003,7 @@ void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
 void blkdev_put(struct block_device *bdev, fmode_t mode);
 
 struct block_device *I_BDEV(struct inode *inode);
-struct block_device *bdget(dev_t);
+struct block_device *bdget_part(struct hd_struct *part);
 struct block_device *bdgrab(struct block_device *bdev);
 void bdput(struct block_device *);
 
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index ec874ea040922a..f1022945e3460b 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -1827,13 +1827,11 @@ static ssize_t sysfs_blk_trace_attr_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
+	struct block_device *bdev = bdget_part(dev_to_part(dev));
 	struct request_queue *q;
-	struct block_device *bdev;
 	struct blk_trace *bt;
 	ssize_t ret = -ENXIO;
 
-	bdev = bdget(part_devt(p));
 	if (bdev == NULL)
 		goto out;
 
@@ -1875,7 +1873,6 @@ static ssize_t sysfs_blk_trace_attr_store(struct device *dev,
 {
 	struct block_device *bdev;
 	struct request_queue *q;
-	struct hd_struct *p;
 	struct blk_trace *bt;
 	u64 value;
 	ssize_t ret = -EINVAL;
@@ -1895,9 +1892,7 @@ static ssize_t sysfs_blk_trace_attr_store(struct device *dev,
 		goto out;
 
 	ret = -ENXIO;
-
-	p = dev_to_part(dev);
-	bdev = bdget(part_devt(p));
+	bdev = bdget_part(dev_to_part(dev));
 	if (bdev == NULL)
 		goto out;
 
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
