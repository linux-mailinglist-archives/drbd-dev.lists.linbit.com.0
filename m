Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28638271D96
	for <lists+drbd-dev@lfdr.de>; Mon, 21 Sep 2020 10:11:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A7594203CE;
	Mon, 21 Sep 2020 10:11:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E5654203B1
	for <drbd-dev@lists.linbit.com>; Mon, 21 Sep 2020 10:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KmRAlQxcK0s3supH85snl/zKPatAqKac369melhqJ0o=;
	b=D43E/HsHW9IdsLL/1FSF0dNOTc
	oWjUG4f5vfuv6QcUokJi7t2Ap9KkTdeGxhzQ2JYLkcf3dz31yTpRJkve85W9XAfLN+AbqymRlQrhy
	3+2iM90uTxOcm+GdsjFdmGprZrgn3lobmDUWvpgWgwR56vwTk0F9o4sPfBIltrKPt2FyyITZytUPj
	Jh4RuDp7dkVUoaTFUEIFUWvlBn8/pJFleju2DiIkahjaDezyQmkh1CB1/s3EV6PjabouUpue+mJM8
	8+rDsmBadsPHEsPiBGDt3OeJgaFHbG33m42vvU0xAV6maMbYwv9fo7GuYJ8lwuIBX4CGRTRgBq6Gh
	wT50wWRw==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGrO-0006XP-6n; Mon, 21 Sep 2020 08:07:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 10:07:28 +0200
Message-Id: <20200921080734.452759-8-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921080734.452759-1-hch@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 07/13] block: lift setting the readahead size
	into the block layer
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

Drivers shouldn't really mess with the readahead size, as that is a VM
concept.  Instead set it based on the optimal I/O size by lifting the
algorithm from the md driver when registering the disk.  Also set
bdi->io_pages there as well by applying the same scheme based on
max_sectors.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-settings.c         |  5 ++---
 block/blk-sysfs.c            |  9 +++++++++
 drivers/block/aoe/aoeblk.c   |  1 -
 drivers/block/drbd/drbd_nl.c | 12 +-----------
 drivers/md/bcache/super.c    |  3 ---
 drivers/md/raid0.c           | 16 ----------------
 drivers/md/raid10.c          | 24 +-----------------------
 drivers/md/raid5.c           | 13 +------------
 8 files changed, 14 insertions(+), 69 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 76a7e03bcd6cac..01049e9b998f1d 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -452,6 +452,8 @@ EXPORT_SYMBOL(blk_limits_io_opt);
 void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
 {
 	blk_limits_io_opt(&q->limits, opt);
+	q->backing_dev_info->ra_pages =
+		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
 }
 EXPORT_SYMBOL(blk_queue_io_opt);
 
@@ -628,9 +630,6 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 		printk(KERN_NOTICE "%s: Warning: Device %s is misaligned\n",
 		       top, bottom);
 	}
-
-	t->backing_dev_info->io_pages =
-		t->limits.max_sectors >> (PAGE_SHIFT - 9);
 }
 EXPORT_SYMBOL(disk_stack_limits);
 
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 81722cdcf0cb21..83915b4a1fc3ad 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -854,6 +854,15 @@ int blk_register_queue(struct gendisk *disk)
 		percpu_ref_switch_to_percpu(&q->q_usage_counter);
 	}
 
+	/*
+	 * For read-ahead of large files to be effective, we need to read ahead
+	 * at least twice the optimal I/O size.
+	 */
+	q->backing_dev_info->ra_pages =
+		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
+	q->backing_dev_info->io_pages =
+		queue_max_sectors(q) >> (PAGE_SHIFT - 9);
+
 	ret = blk_trace_init_sysfs(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index d8cfc233e64b93..c34e71b0c4a98c 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -406,7 +406,6 @@ aoeblk_gdalloc(void *vp)
 	WARN_ON(d->gd);
 	WARN_ON(d->flags & DEVFL_UP);
 	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
-	q->backing_dev_info->ra_pages = SZ_2M / PAGE_SIZE;
 	blk_queue_io_opt(q, SZ_2M);
 	d->bufpool = mp;
 	d->blkq = gd->queue = q;
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index aaff5bde391506..f8fb1c9b1bb6c1 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1360,18 +1360,8 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	decide_on_discard_support(device, q, b, discard_zeroes_if_aligned);
 	decide_on_write_same_support(device, q, b, o, disable_write_same);
 
-	if (b) {
+	if (b)
 		blk_stack_limits(&q->limits, &b->limits, 0);
-
-		if (q->backing_dev_info->ra_pages !=
-		    b->backing_dev_info->ra_pages) {
-			drbd_info(device, "Adjusting my ra_pages to backing device's (%lu -> %lu)\n",
-				 q->backing_dev_info->ra_pages,
-				 b->backing_dev_info->ra_pages);
-			q->backing_dev_info->ra_pages =
-						b->backing_dev_info->ra_pages;
-		}
-	}
 	fixup_discard_if_not_supported(q);
 	fixup_write_zeroes(device, q);
 }
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 48113005ed86ad..6bfa771673623e 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1427,9 +1427,6 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
 	if (ret)
 		return ret;
 
-	dc->disk.disk->queue->backing_dev_info->ra_pages =
-		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
-		    q->backing_dev_info->ra_pages);
 	blk_queue_io_opt(dc->disk.disk->queue,
 		max(queue_io_opt(dc->disk.disk->queue), queue_io_opt(q)));
 
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index f54a449f97aa79..aa2d7279176880 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -410,22 +410,6 @@ static int raid0_run(struct mddev *mddev)
 		 mdname(mddev),
 		 (unsigned long long)mddev->array_sectors);
 
-	if (mddev->queue) {
-		/* calculate the max read-ahead size.
-		 * For read-ahead of large files to be effective, we need to
-		 * readahead at least twice a whole stripe. i.e. number of devices
-		 * multiplied by chunk size times 2.
-		 * If an individual device has an ra_pages greater than the
-		 * chunk size, then we will not drive that device as hard as it
-		 * wants.  We consider this a configuration error: a larger
-		 * chunksize should be used in that case.
-		 */
-		int stripe = mddev->raid_disks *
-			(mddev->chunk_sectors << 9) / PAGE_SIZE;
-		if (mddev->queue->backing_dev_info->ra_pages < 2* stripe)
-			mddev->queue->backing_dev_info->ra_pages = 2* stripe;
-	}
-
 	dump_zones(mddev);
 
 	ret = md_integrity_register(mddev);
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 9956a04ac13bd6..5d1bdee313ec33 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3873,19 +3873,6 @@ static int raid10_run(struct mddev *mddev)
 	mddev->resync_max_sectors = size;
 	set_bit(MD_FAILFAST_SUPPORTED, &mddev->flags);
 
-	if (mddev->queue) {
-		int stripe = conf->geo.raid_disks *
-			((mddev->chunk_sectors << 9) / PAGE_SIZE);
-
-		/* Calculate max read-ahead size.
-		 * We need to readahead at least twice a whole stripe....
-		 * maybe...
-		 */
-		stripe /= conf->geo.near_copies;
-		if (mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-			mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
-	}
-
 	if (md_integrity_register(mddev))
 		goto out_free_conf;
 
@@ -4723,17 +4710,8 @@ static void end_reshape(struct r10conf *conf)
 	conf->reshape_safe = MaxSector;
 	spin_unlock_irq(&conf->device_lock);
 
-	/* read-ahead size must cover two whole stripes, which is
-	 * 2 * (datadisks) * chunksize where 'n' is the number of raid devices
-	 */
-	if (conf->mddev->queue) {
-		int stripe = conf->geo.raid_disks *
-			((conf->mddev->chunk_sectors << 9) / PAGE_SIZE);
-		stripe /= conf->geo.near_copies;
-		if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-			conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+	if (conf->mddev->queue)
 		raid10_set_io_opt(conf);
-	}
 	conf->fullsync = 0;
 }
 
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 9a7d1250894ef1..7ace1f76b14736 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7522,8 +7522,6 @@ static int raid5_run(struct mddev *mddev)
 		int data_disks = conf->previous_raid_disks - conf->max_degraded;
 		int stripe = data_disks *
 			((mddev->chunk_sectors << 9) / PAGE_SIZE);
-		if (mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-			mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
 
 		chunk_size = mddev->chunk_sectors << 9;
 		blk_queue_io_min(mddev->queue, chunk_size);
@@ -8111,17 +8109,8 @@ static void end_reshape(struct r5conf *conf)
 		spin_unlock_irq(&conf->device_lock);
 		wake_up(&conf->wait_for_overlap);
 
-		/* read-ahead size must cover two whole stripes, which is
-		 * 2 * (datadisks) * chunksize where 'n' is the number of raid devices
-		 */
-		if (conf->mddev->queue) {
-			int data_disks = conf->raid_disks - conf->max_degraded;
-			int stripe = data_disks * ((conf->chunk_sectors << 9)
-						   / PAGE_SIZE);
-			if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-				conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+		if (conf->mddev->queue)
 			raid5_set_io_opt(conf);
-		}
 	}
 }
 
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
