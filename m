Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA12B49E6
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 16:51:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC8F7420862;
	Mon, 16 Nov 2020 16:51:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6C39042084C
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 16:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=G/1St6AKcpua/c8qIsi4IENao5SAFeNTsicWvdwJGKA=;
	b=cAGojbspvBWLkhCqOD3ExDenEy
	hsbkbexTXugOliCWH3wwCYbwxpTnVtQvHgLrTwVXI7TrPcURLYokj4yyAxwxnnG9BNHdwGnWa8IJp
	dYa+F3Gfpccic7jbe1Y8gwBkRHM+oEunUjIG3WI5m5UONDYn9V9VBRbIHSxNQhGM/1JRKjD49Xkx0
	0pBHsNUFU/UPntTwF6P/GQ0sJw5J/q2+RSCrhYYdXSuMK/KdhdMuk9LCQiscZHIVOefv7v6KYkI86
	OblDiO3zLuOm232EWEv9/powerW9w8u+EGbE5WQyTuk7Cg+xA59dLIs/S/NWj2DLWnBN8UoHAueaN
	ZQN++kOA==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyU-00043H-JC; Mon, 16 Nov 2020 14:59:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:42 +0100
Message-Id: <20201116145809.410558-52-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 51/78] z2ram: use separate gendisk for the
	different modes
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

Use separate gendisks (which share a tag_set) for the different operating
modes instead of redirecting the gendisk lookup using a probe callback.
This avoids potential problems with aliased block_device instances and
will eventually allow for removing the blk_register_region framework.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/z2ram.c | 100 ++++++++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index eafecc9a72b38d..c1d20818e64920 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -63,7 +63,7 @@ static int current_device = -1;
 
 static DEFINE_SPINLOCK(z2ram_lock);
 
-static struct gendisk *z2ram_gendisk;
+static struct gendisk *z2ram_gendisk[Z2MINOR_COUNT];
 
 static blk_status_t z2_queue_rq(struct blk_mq_hw_ctx *hctx,
 				const struct blk_mq_queue_data *bd)
@@ -283,7 +283,7 @@ static int z2_open(struct block_device *bdev, fmode_t mode)
 
 		current_device = device;
 		z2ram_size <<= Z2RAM_CHUNKSHIFT;
-		set_capacity(z2ram_gendisk, z2ram_size >> 9);
+		set_capacity(z2ram_gendisk[device], z2ram_size >> 9);
 	}
 
 	mutex_unlock(&z2ram_mutex);
@@ -315,71 +315,87 @@ static const struct block_device_operations z2_fops = {
 	.release = z2_release,
 };
 
-static struct kobject *z2_find(dev_t dev, int *part, void *data)
-{
-	*part = 0;
-	return get_disk_and_module(z2ram_gendisk);
-}
-
-static struct request_queue *z2_queue;
 static struct blk_mq_tag_set tag_set;
 
 static const struct blk_mq_ops z2_mq_ops = {
 	.queue_rq = z2_queue_rq,
 };
 
+static int z2ram_register_disk(int minor)
+{
+	struct request_queue *q;
+	struct gendisk *disk;
+
+	disk = alloc_disk(1);
+	if (!disk)
+		return -ENOMEM;
+
+	q = blk_mq_init_queue(&tag_set);
+	if (IS_ERR(q)) {
+		put_disk(disk);
+		return PTR_ERR(q);
+	}
+
+	disk->major = Z2RAM_MAJOR;
+	disk->first_minor = minor;
+	disk->fops = &z2_fops;
+	if (minor)
+		sprintf(disk->disk_name, "z2ram%d", minor);
+	else
+		sprintf(disk->disk_name, "z2ram");
+	disk->queue = q;
+
+	z2ram_gendisk[minor] = disk;
+	add_disk(disk);
+	return 0;
+}
+
 static int __init z2_init(void)
 {
-	int ret;
+	int ret, i;
 
 	if (!MACH_IS_AMIGA)
 		return -ENODEV;
 
-	ret = -EBUSY;
 	if (register_blkdev(Z2RAM_MAJOR, DEVICE_NAME))
-		goto err;
-
-	ret = -ENOMEM;
-	z2ram_gendisk = alloc_disk(1);
-	if (!z2ram_gendisk)
-		goto out_disk;
-
-	z2_queue = blk_mq_init_sq_queue(&tag_set, &z2_mq_ops, 16,
-					BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(z2_queue)) {
-		ret = PTR_ERR(z2_queue);
-		z2_queue = NULL;
-		goto out_queue;
+		return -EBUSY;
+
+	tag_set.ops = &z2_mq_ops;
+	tag_set.nr_hw_queues = 1;
+	tag_set.nr_maps = 1;
+	tag_set.queue_depth = 16;
+	tag_set.numa_node = NUMA_NO_NODE;
+	tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	ret = blk_mq_alloc_tag_set(&tag_set);
+	if (ret)
+		goto out_unregister_blkdev;
+
+	for (i = 0; i < Z2MINOR_COUNT; i++) {
+		ret = z2ram_register_disk(i);
+		if (ret && i == 0)
+			goto out_free_tagset;
 	}
 
-	z2ram_gendisk->major = Z2RAM_MAJOR;
-	z2ram_gendisk->first_minor = 0;
-	z2ram_gendisk->fops = &z2_fops;
-	sprintf(z2ram_gendisk->disk_name, "z2ram");
-
-	z2ram_gendisk->queue = z2_queue;
-	add_disk(z2ram_gendisk);
-	blk_register_region(MKDEV(Z2RAM_MAJOR, 0), Z2MINOR_COUNT, THIS_MODULE,
-			    z2_find, NULL, NULL);
-
 	return 0;
 
-out_queue:
-	put_disk(z2ram_gendisk);
-out_disk:
+out_free_tagset:
+	blk_mq_free_tag_set(&tag_set);
+out_unregister_blkdev:
 	unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
-err:
 	return ret;
 }
 
 static void __exit z2_exit(void)
 {
 	int i, j;
-	blk_unregister_region(MKDEV(Z2RAM_MAJOR, 0), Z2MINOR_COUNT);
+
 	unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
-	del_gendisk(z2ram_gendisk);
-	put_disk(z2ram_gendisk);
-	blk_cleanup_queue(z2_queue);
+
+	for (i = 0; i < Z2MINOR_COUNT; i++) {
+		del_gendisk(z2ram_gendisk[i]);
+		blk_cleanup_queue(z2ram_gendisk[i]->queue);
+		put_disk(z2ram_gendisk[i]);
+	}
 	blk_mq_free_tag_set(&tag_set);
 
 	if (current_device != -1) {
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
