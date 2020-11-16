Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9E2B4A6D
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:13:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB2DB420837;
	Mon, 16 Nov 2020 17:13:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 53D3C420822
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VpFTnx8mSRVx3CfXvp0WWOpahH+qOqL0mP+Plef//Dw=;
	b=QuaAvRf47Sgn9ESoWOtbCEEgKf
	SoaxupntT7YcBZyDBufAz89YGCb7+GAKx9JrFGTvtb5gkr5Mrj1a5W/A5DrAzDitUTF1NGhPPsRi1
	SwVqYv0iBeIK7LPoNhiBiDMfP76vlVOCz5Xf7CxEP2Fi3mTEXQJHqC/WuP7Qu3AmsaO2RNIWflVNw
	HDQluFLq+Cexw+XqCWcvsLMuEyrXOagZfpeUVxdZeb9NaJWSWPy5zSF1aMVGD0p6spy3vB3r2LtM3
	DuVbxT8CDDONVntDglOll0hYSPlE1qzQ6tCXf2v/dx8BmBOznqiTmYL594fNkkwXRuptP0wmQJyGf
	43+tbRTQ==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyQ-000416-5g; Mon, 16 Nov 2020 14:59:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:39 +0100
Message-Id: <20201116145809.410558-49-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 48/78] amiflop: use separate gendisks for Amiga
	vs MS-DOS mode
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

Use separate gendisks (which share a tag_set) for the native Amgiga vs
the MS-DOS mode instead of redirecting the gendisk lookup using a probe
callback.  This avoids potential problems with aliased block_device
instances and will eventually allow for removing the blk_register_region
framework.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/amiflop.c | 98 +++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index 71c2b156455860..9e2d0c6a387721 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -201,7 +201,7 @@ struct amiga_floppy_struct {
 	int busy;			/* true when drive is active */
 	int dirty;			/* true when trackbuf is not on disk */
 	int status;			/* current error code for unit */
-	struct gendisk *gendisk;
+	struct gendisk *gendisk[2];
 	struct blk_mq_tag_set tag_set;
 };
 
@@ -1669,6 +1669,11 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 		return -EBUSY;
 	}
 
+	if (unit[drive].type->code == FD_NODRIVE) {
+		mutex_unlock(&amiflop_mutex);
+		return -ENXIO;
+	}
+
 	if (mode & (FMODE_READ|FMODE_WRITE)) {
 		bdev_check_media_change(bdev);
 		if (mode & FMODE_WRITE) {
@@ -1695,7 +1700,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 	unit[drive].dtype=&data_types[system];
 	unit[drive].blocks=unit[drive].type->heads*unit[drive].type->tracks*
 		data_types[system].sects*unit[drive].type->sect_mult;
-	set_capacity(unit[drive].gendisk, unit[drive].blocks);
+	set_capacity(unit[drive].gendisk[system], unit[drive].blocks);
 
 	printk(KERN_INFO "fd%d: accessing %s-disk with %s-layout\n",drive,
 	       unit[drive].type->name, data_types[system].name);
@@ -1772,36 +1777,68 @@ static const struct blk_mq_ops amiflop_mq_ops = {
 	.queue_rq = amiflop_queue_rq,
 };
 
-static struct gendisk *fd_alloc_disk(int drive)
+static int fd_alloc_disk(int drive, int system)
 {
 	struct gendisk *disk;
 
 	disk = alloc_disk(1);
 	if (!disk)
 		goto out;
-
-	disk->queue = blk_mq_init_sq_queue(&unit[drive].tag_set, &amiflop_mq_ops,
-						2, BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(disk->queue)) {
-		disk->queue = NULL;
+	disk->queue = blk_mq_init_queue(&unit[drive].tag_set);
+	if (IS_ERR(disk->queue))
 		goto out_put_disk;
-	}
 
+	disk->major = FLOPPY_MAJOR;
+	disk->first_minor = drive + system;
+	disk->fops = &floppy_fops;
+	disk->events = DISK_EVENT_MEDIA_CHANGE;
+	if (system)
+		sprintf(disk->disk_name, "fd%d_msdos", drive);
+	else
+		sprintf(disk->disk_name, "fd%d", drive);
+	disk->private_data = &unit[drive];
+	set_capacity(disk, 880 * 2);
+
+	unit[drive].gendisk[system] = disk;
+	add_disk(disk);
+	return 0;
+
+out_put_disk:
+	disk->queue = NULL;
+	put_disk(disk);
+out:
+	return -ENOMEM;
+}
+
+static int fd_alloc_drive(int drive)
+{
 	unit[drive].trackbuf = kmalloc(FLOPPY_MAX_SECTORS * 512, GFP_KERNEL);
 	if (!unit[drive].trackbuf)
-		goto out_cleanup_queue;
+		goto out;
 
-	return disk;
+	memset(&unit[drive].tag_set, 0, sizeof(unit[drive].tag_set));
+	unit[drive].tag_set.ops = &amiflop_mq_ops;
+	unit[drive].tag_set.nr_hw_queues = 1;
+	unit[drive].tag_set.nr_maps = 1;
+	unit[drive].tag_set.queue_depth = 2;
+	unit[drive].tag_set.numa_node = NUMA_NO_NODE;
+	unit[drive].tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	if (blk_mq_alloc_tag_set(&unit[drive].tag_set))
+		goto out_cleanup_trackbuf;
 
-out_cleanup_queue:
-	blk_cleanup_queue(disk->queue);
-	disk->queue = NULL;
+	pr_cont(" fd%d", drive);
+
+	if (fd_alloc_disk(drive, 0) || fd_alloc_disk(drive, 1))
+		goto out_cleanup_tagset;
+	return 0;
+
+out_cleanup_tagset:
 	blk_mq_free_tag_set(&unit[drive].tag_set);
-out_put_disk:
-	put_disk(disk);
+out_cleanup_trackbuf:
+	kfree(unit[drive].trackbuf);
 out:
 	unit[drive].type->code = FD_NODRIVE;
-	return NULL;
+	return -ENOMEM;
 }
 
 static int __init fd_probe_drives(void)
@@ -1812,29 +1849,16 @@ static int __init fd_probe_drives(void)
 	drives=0;
 	nomem=0;
 	for(drive=0;drive<FD_MAX_UNITS;drive++) {
-		struct gendisk *disk;
 		fd_probe(drive);
 		if (unit[drive].type->code == FD_NODRIVE)
 			continue;
 
-		disk = fd_alloc_disk(drive);
-		if (!disk) {
+		if (fd_alloc_drive(drive) < 0) {
 			pr_cont(" no mem for fd%d", drive);
 			nomem = 1;
 			continue;
 		}
-		unit[drive].gendisk = disk;
 		drives++;
-
-		pr_cont(" fd%d",drive);
-		disk->major = FLOPPY_MAJOR;
-		disk->first_minor = drive;
-		disk->fops = &floppy_fops;
-		disk->events = DISK_EVENT_MEDIA_CHANGE;
-		sprintf(disk->disk_name, "fd%d", drive);
-		disk->private_data = &unit[drive];
-		set_capacity(disk, 880*2);
-		add_disk(disk);
 	}
 	if ((drives > 0) || (nomem == 0)) {
 		if (drives == 0)
@@ -1846,15 +1870,6 @@ static int __init fd_probe_drives(void)
 	return -ENOMEM;
 }
  
-static struct kobject *floppy_find(dev_t dev, int *part, void *data)
-{
-	int drive = *part & 3;
-	if (unit[drive].type->code == FD_NODRIVE)
-		return NULL;
-	*part = 0;
-	return get_disk_and_module(unit[drive].gendisk);
-}
-
 static int __init amiga_floppy_probe(struct platform_device *pdev)
 {
 	int i, ret;
@@ -1884,9 +1899,6 @@ static int __init amiga_floppy_probe(struct platform_device *pdev)
 	if (fd_probe_drives() < 1) /* No usable drives */
 		goto out_probe;
 
-	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
-				floppy_find, NULL, NULL);
-
 	/* initialize variables */
 	timer_setup(&motor_on_timer, motor_on_callback, 0);
 	motor_on_timer.expires = 0;
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
