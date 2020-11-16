Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C32B491C
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 16:24:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 711C6420809;
	Mon, 16 Nov 2020 16:24:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F6A94207DF
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 16:21:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MRrZvPHBJ7MmOJqwCwh6BOwzTdjIUug0RFrQfdUF4D0=;
	b=VdELZpYq+wC9PRGd7E7gW7f022
	iWbf/yBwlwECTqIWeSXdM3vxnd7C5rUPQt4zYgr4w4y5VS7aEw4XAXZZL1+gLjTfVzbErgItFolKx
	NoEr+DW9LtrWG9rcze2kkbyopscePeN91WRL96HJxHAuEnkYQzapbI9qst3MaFX6akHBdBUBm7/eb
	Ud1nBnozpN0bnLBzUbAJlQGLF7WvSR9ySOqhWBvr5OEnKwbk0b1hc36z3Q1K2nfJ5d/hpkLfSI8aB
	GuaLrCyXWDM01VUM6hy+z+KyIliSIUOnGWO2OtY/JMGDpZLn+Yks0DpKHFYl+4qlADIgIFPwiG6NQ
	nFJMH8wg==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyy-0004HD-T0; Mon, 16 Nov 2020 14:59:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:58:02 +0100
Message-Id: <20201116145809.410558-72-hch@lst.de>
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
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 71/78] block: add a bdev_kobj helper
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

Add a little helper to find the kobject for a struct block_device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/bcache/super.c |  7 ++-----
 drivers/md/md.c           |  4 +---
 fs/btrfs/sysfs.c          | 15 +++------------
 include/linux/blk_types.h |  3 +++
 4 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index ea2b80c3e44c38..f6edacc81527c7 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1447,8 +1447,7 @@ static int register_bdev(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
 		goto err;
 
 	err = "error creating kobject";
-	if (kobject_add(&dc->disk.kobj, &part_to_dev(bdev->bd_part)->kobj,
-			"bcache"))
+	if (kobject_add(&dc->disk.kobj, bdev_kobj(bdev), "bcache"))
 		goto err;
 	if (bch_cache_accounting_add_kobjs(&dc->accounting, &dc->disk.kobj))
 		goto err;
@@ -2342,9 +2341,7 @@ static int register_cache(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
 		goto err;
 	}
 
-	if (kobject_add(&ca->kobj,
-			&part_to_dev(bdev->bd_part)->kobj,
-			"bcache")) {
+	if (kobject_add(&ca->kobj, bdev_kobj(bdev), "bcache")) {
 		err = "error calling kobject_add";
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index b2edf5e0f965b5..7ce6047c856ea2 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -2414,7 +2414,6 @@ EXPORT_SYMBOL(md_integrity_add_rdev);
 static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
 {
 	char b[BDEVNAME_SIZE];
-	struct kobject *ko;
 	int err;
 
 	/* prevent duplicates */
@@ -2477,9 +2476,8 @@ static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
 	if ((err = kobject_add(&rdev->kobj, &mddev->kobj, "dev-%s", b)))
 		goto fail;
 
-	ko = &part_to_dev(rdev->bdev->bd_part)->kobj;
 	/* failure here is OK */
-	err = sysfs_create_link(&rdev->kobj, ko, "block");
+	err = sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "block");
 	rdev->sysfs_state = sysfs_get_dirent_safe(rdev->kobj.sd, "state");
 	rdev->sysfs_unack_badblocks =
 		sysfs_get_dirent_safe(rdev->kobj.sd, "unacknowledged_bad_blocks");
diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
index 279d9262b676d4..24b6c6dc69000a 100644
--- a/fs/btrfs/sysfs.c
+++ b/fs/btrfs/sysfs.c
@@ -1232,8 +1232,6 @@ int btrfs_sysfs_add_space_info_type(struct btrfs_fs_info *fs_info,
 
 void btrfs_sysfs_remove_device(struct btrfs_device *device)
 {
-	struct hd_struct *disk;
-	struct kobject *disk_kobj;
 	struct kobject *devices_kobj;
 
 	/*
@@ -1243,11 +1241,8 @@ void btrfs_sysfs_remove_device(struct btrfs_device *device)
 	devices_kobj = device->fs_info->fs_devices->devices_kobj;
 	ASSERT(devices_kobj);
 
-	if (device->bdev) {
-		disk = device->bdev->bd_part;
-		disk_kobj = &part_to_dev(disk)->kobj;
-		sysfs_remove_link(devices_kobj, disk_kobj->name);
-	}
+	if (device->bdev)
+		sysfs_remove_link(devices_kobj, bdev_kobj(device->bdev)->name);
 
 	if (device->devid_kobj.state_initialized) {
 		kobject_del(&device->devid_kobj);
@@ -1353,11 +1348,7 @@ int btrfs_sysfs_add_device(struct btrfs_device *device)
 	nofs_flag = memalloc_nofs_save();
 
 	if (device->bdev) {
-		struct hd_struct *disk;
-		struct kobject *disk_kobj;
-
-		disk = device->bdev->bd_part;
-		disk_kobj = &part_to_dev(disk)->kobj;
+		struct kobject *disk_kobj = bdev_kobj(device->bdev);
 
 		ret = sysfs_create_link(devices_kobj, disk_kobj, disk_kobj->name);
 		if (ret) {
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 0735e335ca6c0a..5a5ccacb804cdb 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -49,6 +49,9 @@ struct block_device {
 #define bdev_whole(_bdev) \
 	((_bdev)->bd_disk->part0.bdev)
 
+#define bdev_kobj(_bdev) \
+	(&part_to_dev((_bdev)->bd_part)->kobj)
+
 /*
  * Block error status values.  See block/blk-core:blk_errors for the details.
  * Alpha cannot write a byte atomically, so we need to use 32-bit value.
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
