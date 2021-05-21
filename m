Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298938C056
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 09:07:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11F9D420626;
	Fri, 21 May 2021 09:07:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A653E4205D4
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 09:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZDCcHPEM0INb2T5zcubYaFWSf1yp8CSnvcGaR6/cpic=;
	b=2yjVQIeHAyfo2XhgICgTStbQOg
	jcNnbxIE1u76xg05aeJAqvuiDDQjci0kPV/WRbNI+ftxKqgGJFpxl6fNUgPYM09ftrHkEOPj7Uc71
	XsXsva6TLjpm5lo0bhCX4R9IyXPZhPyiPYDNiqX+3o6cFqKv2Thl3PVEcLreQRT/WEZGPr2ZzjQ2Q
	0gRyUlSbbP/a6lDdvQqWoGeR74n0JjrIbdiUHUecmQoiLHzWJycHNdEY1+PvP7HGUah5FfCLz50xh
	z6ys+9kRUELGbftltWOi0TwV+67rFSam3lTFqdSSqODUYX1M060t8X2DcuA59KunJ4+Mrf0J2xuPQ
	72lW/5Yw==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1ljy5S-00GqGW-Ms; Fri, 21 May 2021 05:52:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 21 May 2021 07:51:15 +0200
Message-Id: <20210521055116.1053587-26-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 25/26] null_blk: convert to
	blk_alloc_disk/blk_cleanup_disk
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

Convert the null_blk driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.  Note that the
blk-mq mode is left with its own allocations scheme, to be handled later.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/null_blk/main.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 5f006d9e1472..d8e098f1e5b5 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1597,11 +1597,10 @@ static void null_del_dev(struct nullb *nullb)
 		null_restart_queue_async(nullb);
 	}
 
-	blk_cleanup_queue(nullb->q);
+	blk_cleanup_disk(nullb->disk);
 	if (dev->queue_mode == NULL_Q_MQ &&
 	    nullb->tag_set == &nullb->__tag_set)
 		blk_mq_free_tag_set(nullb->tag_set);
-	put_disk(nullb->disk);
 	cleanup_queues(nullb);
 	if (null_cache_active(nullb))
 		null_free_device_storage(nullb->dev, true);
@@ -1700,22 +1699,19 @@ static int init_driver_queues(struct nullb *nullb)
 static int null_gendisk_register(struct nullb *nullb)
 {
 	sector_t size = ((sector_t)nullb->dev->size * SZ_1M) >> SECTOR_SHIFT;
-	struct gendisk *disk;
+	struct gendisk *disk = nullb->disk;
 
-	disk = nullb->disk = alloc_disk_node(1, nullb->dev->home_node);
-	if (!disk)
-		return -ENOMEM;
 	set_capacity(disk, size);
 
 	disk->flags |= GENHD_FL_EXT_DEVT | GENHD_FL_SUPPRESS_PARTITION_INFO;
 	disk->major		= null_major;
 	disk->first_minor	= nullb->index;
+	disk->minors		= 1;
 	if (queue_is_mq(nullb->q))
 		disk->fops		= &null_rq_ops;
 	else
 		disk->fops		= &null_bio_ops;
 	disk->private_data	= nullb;
-	disk->queue		= nullb->q;
 	strncpy(disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
 
 	if (nullb->dev->zoned) {
@@ -1851,23 +1847,27 @@ static int null_add_dev(struct nullb_device *dev)
 			goto out_cleanup_queues;
 
 		if (!null_setup_fault())
-			goto out_cleanup_queues;
+			goto out_cleanup_tags;
 
+		rv = -ENOMEM;
 		nullb->tag_set->timeout = 5 * HZ;
 		nullb->q = blk_mq_init_queue_data(nullb->tag_set, nullb);
-		if (IS_ERR(nullb->q)) {
-			rv = -ENOMEM;
+		if (IS_ERR(nullb->q))
 			goto out_cleanup_tags;
-		}
+		nullb->disk = alloc_disk_node(1, nullb->dev->home_node);
+		if (!nullb->disk)
+			goto out_cleanup_disk;
+		nullb->disk->queue = nullb->q;
 	} else if (dev->queue_mode == NULL_Q_BIO) {
-		nullb->q = blk_alloc_queue(dev->home_node);
-		if (!nullb->q) {
-			rv = -ENOMEM;
+		rv = -ENOMEM;
+		nullb->disk = blk_alloc_disk(nullb->dev->home_node);
+		if (!nullb->disk)
 			goto out_cleanup_queues;
-		}
+
+		nullb->q = nullb->disk->queue;
 		rv = init_driver_queues(nullb);
 		if (rv)
-			goto out_cleanup_blk_queue;
+			goto out_cleanup_disk;
 	}
 
 	if (dev->mbps) {
@@ -1883,7 +1883,7 @@ static int null_add_dev(struct nullb_device *dev)
 	if (dev->zoned) {
 		rv = null_init_zoned_dev(dev, nullb->q);
 		if (rv)
-			goto out_cleanup_blk_queue;
+			goto out_cleanup_disk;
 	}
 
 	nullb->q->queuedata = nullb;
@@ -1921,8 +1921,8 @@ static int null_add_dev(struct nullb_device *dev)
 	return 0;
 out_cleanup_zone:
 	null_free_zoned_dev(dev);
-out_cleanup_blk_queue:
-	blk_cleanup_queue(nullb->q);
+out_cleanup_disk:
+	blk_cleanup_disk(nullb->disk);
 out_cleanup_tags:
 	if (dev->queue_mode == NULL_Q_MQ && nullb->tag_set == &nullb->__tag_set)
 		blk_mq_free_tag_set(nullb->tag_set);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
