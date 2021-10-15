Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44C42F4D1
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 16:06:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 654D7421028;
	Fri, 15 Oct 2021 16:06:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC93F42100C
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 16:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0CV0rywbU1Y4LeVnuyc2lk8pRI72CsoR0SnNvP9lCQM=;
	b=k49lEtK8uwqgmoDwnAW7Y4KGYO
	FQf7Fov/IgaFTh/hXP/bVs+H6AQ0lS9BtKNjlULXmoAZFmNePcqTfcvzvPgcOQWX9wBwE8JEaqLMC
	A9/txVJKPGHeB4+sev6cI65lpw6FaXLs94kz2fLRXl/XTQMTKNoaeQ66dNlxKxb6n+DeYJ86hvGGe
	QP+BkQi1DQ6JWZlpPvML8LUHj1Q4YcAiSA7Y3TNkoEUEpx1yvhTGpUrLkG3EG2uJA/qW/WUfS3aUS
	e7JPbRES2nA/yu42g27JcBylefTQMLTxxdiljqs0eJO/5GIAygFOYKlcNaVwX3TOS0UlOAWpxyg3m
	B19pIwLw==;
Received: from [2001:4bb8:199:73c5:ddfe:9587:819b:83b0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNEg-007CkK-Qs; Fri, 15 Oct 2021 13:26:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Oct 2021 15:26:18 +0200
Message-Id: <20211015132643.1621913-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015132643.1621913-1-hch@lst.de>
References: <20211015132643.1621913-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 05/30] dm: use bdev_nr_sectors and bdev_nr_bytes
	instead of open coding them
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

Use the proper helpers to read the block device size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-bufio.c           | 2 +-
 drivers/md/dm-cache-metadata.c  | 2 +-
 drivers/md/dm-cache-target.c    | 2 +-
 drivers/md/dm-clone-target.c    | 2 +-
 drivers/md/dm-dust.c            | 5 ++---
 drivers/md/dm-ebs-target.c      | 2 +-
 drivers/md/dm-era-target.c      | 2 +-
 drivers/md/dm-exception-store.h | 2 +-
 drivers/md/dm-flakey.c          | 3 +--
 drivers/md/dm-integrity.c       | 6 +++---
 drivers/md/dm-linear.c          | 3 +--
 drivers/md/dm-log-writes.c      | 4 ++--
 drivers/md/dm-log.c             | 2 +-
 drivers/md/dm-mpath.c           | 2 +-
 drivers/md/dm-raid.c            | 6 +++---
 drivers/md/dm-switch.c          | 2 +-
 drivers/md/dm-table.c           | 3 +--
 drivers/md/dm-thin-metadata.c   | 2 +-
 drivers/md/dm-thin.c            | 2 +-
 drivers/md/dm-verity-target.c   | 3 +--
 drivers/md/dm-writecache.c      | 2 +-
 drivers/md/dm-zoned-target.c    | 2 +-
 22 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 50f3e673729c3..104ebc1f08dcc 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -1525,7 +1525,7 @@ EXPORT_SYMBOL_GPL(dm_bufio_get_block_size);
 
 sector_t dm_bufio_get_device_size(struct dm_bufio_client *c)
 {
-	sector_t s = i_size_read(c->bdev->bd_inode) >> SECTOR_SHIFT;
+	sector_t s = bdev_nr_sectors(c->bdev);
 	if (s >= c->start)
 		s -= c->start;
 	else
diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index 89a73204dbf47..2874f222c3138 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -334,7 +334,7 @@ static int __write_initial_superblock(struct dm_cache_metadata *cmd)
 	int r;
 	struct dm_block *sblock;
 	struct cache_disk_superblock *disk_super;
-	sector_t bdev_size = i_size_read(cmd->bdev->bd_inode) >> SECTOR_SHIFT;
+	sector_t bdev_size = bdev_nr_sectors(cmd->bdev);
 
 	/* FIXME: see if we can lose the max sectors limit */
 	if (bdev_size > DM_CACHE_METADATA_MAX_SECTORS)
diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index bdd500447dea2..447d030036d18 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -1940,7 +1940,7 @@ static void cache_dtr(struct dm_target *ti)
 
 static sector_t get_dev_size(struct dm_dev *dev)
 {
-	return i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
+	return bdev_nr_sectors(dev->bdev);
 }
 
 /*----------------------------------------------------------------*/
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index 84dbe08ad2053..e4bb2fde1b54f 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -1514,7 +1514,7 @@ static void clone_status(struct dm_target *ti, status_type_t type,
 
 static sector_t get_dev_size(struct dm_dev *dev)
 {
-	return i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
+	return bdev_nr_sectors(dev->bdev);
 }
 
 /*---------------------------------------------------------------------------*/
diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 3163e2b1418e7..03672204b0e38 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -415,7 +415,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 			char *result, unsigned int maxlen)
 {
 	struct dust_device *dd = ti->private;
-	sector_t size = i_size_read(dd->dev->bdev->bd_inode) >> SECTOR_SHIFT;
+	sector_t size = bdev_nr_sectors(dd->dev->bdev);
 	bool invalid_msg = false;
 	int r = -EINVAL;
 	unsigned long long tmp, block;
@@ -544,8 +544,7 @@ static int dust_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 	/*
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
-	if (dd->start ||
-	    ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT)
+	if (dd->start || ti->len != bdev_nr_sectors(dev->bdev))
 		return 1;
 
 	return 0;
diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index d25989660a768..7ce5d509b9403 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -416,7 +416,7 @@ static int ebs_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
 	*bdev = dev->bdev;
-	return !!(ec->start || ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT);
+	return !!(ec->start || ti->len != bdev_nr_sectors(dev->bdev));
 }
 
 static void ebs_io_hints(struct dm_target *ti, struct queue_limits *limits)
diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index 2a78f68741431..1f6bf152b3c74 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -1681,7 +1681,7 @@ static int era_message(struct dm_target *ti, unsigned argc, char **argv,
 
 static sector_t get_dev_size(struct dm_dev *dev)
 {
-	return i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
+	return bdev_nr_sectors(dev->bdev);
 }
 
 static int era_iterate_devices(struct dm_target *ti,
diff --git a/drivers/md/dm-exception-store.h b/drivers/md/dm-exception-store.h
index 3f4139ac1f602..b5f20eba36415 100644
--- a/drivers/md/dm-exception-store.h
+++ b/drivers/md/dm-exception-store.h
@@ -168,7 +168,7 @@ static inline void dm_consecutive_chunk_count_dec(struct dm_exception *e)
  */
 static inline sector_t get_dev_size(struct block_device *bdev)
 {
-	return i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
+	return bdev_nr_sectors(bdev);
 }
 
 static inline chunk_t sector_to_chunk(struct dm_exception_store *store,
diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index 4b94ffe6f2d4f..345229d7e59c1 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -456,8 +456,7 @@ static int flakey_prepare_ioctl(struct dm_target *ti, struct block_device **bdev
 	/*
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
-	if (fc->start ||
-	    ti->len != i_size_read((*bdev)->bd_inode) >> SECTOR_SHIFT)
+	if (fc->start || ti->len != bdev_nr_sectors((*bdev)))
 		return 1;
 	return 0;
 }
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index dc03b70f6e65c..d0f788e72abf9 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -4113,11 +4113,11 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		}
 	}
 
-	ic->data_device_sectors = i_size_read(ic->dev->bdev->bd_inode) >> SECTOR_SHIFT;
+	ic->data_device_sectors = bdev_nr_sectors(ic->dev->bdev);
 	if (!ic->meta_dev)
 		ic->meta_device_sectors = ic->data_device_sectors;
 	else
-		ic->meta_device_sectors = i_size_read(ic->meta_dev->bdev->bd_inode) >> SECTOR_SHIFT;
+		ic->meta_device_sectors = bdev_nr_sectors(ic->meta_dev->bdev);
 
 	if (!journal_sectors) {
 		journal_sectors = min((sector_t)DEFAULT_MAX_JOURNAL_SECTORS,
@@ -4367,7 +4367,7 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	DEBUG_print("	journal_sections %u\n", (unsigned)le32_to_cpu(ic->sb->journal_sections));
 	DEBUG_print("	journal_entries %u\n", ic->journal_entries);
 	DEBUG_print("	log2_interleave_sectors %d\n", ic->sb->log2_interleave_sectors);
-	DEBUG_print("	data_device_sectors 0x%llx\n", i_size_read(ic->dev->bdev->bd_inode) >> SECTOR_SHIFT);
+	DEBUG_print("	data_device_sectors 0x%llx\n", bdev_nr_sectors(ic->dev->bdev));
 	DEBUG_print("	initial_sectors 0x%x\n", ic->initial_sectors);
 	DEBUG_print("	metadata_run 0x%x\n", ic->metadata_run);
 	DEBUG_print("	log2_metadata_run %d\n", ic->log2_metadata_run);
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 679b4c0a2eea1..66ba16713f696 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -135,8 +135,7 @@ static int linear_prepare_ioctl(struct dm_target *ti, struct block_device **bdev
 	/*
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
-	if (lc->start ||
-	    ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT)
+	if (lc->start || ti->len != bdev_nr_sectors(dev->bdev))
 		return 1;
 	return 0;
 }
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index d93a4db235124..46de085a96709 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -446,7 +446,7 @@ static int log_super(struct log_writes_c *lc)
 
 static inline sector_t logdev_last_sector(struct log_writes_c *lc)
 {
-	return i_size_read(lc->logdev->bdev->bd_inode) >> SECTOR_SHIFT;
+	return bdev_nr_sectors(lc->logdev->bdev);
 }
 
 static int log_writes_kthread(void *arg)
@@ -851,7 +851,7 @@ static int log_writes_prepare_ioctl(struct dm_target *ti,
 	/*
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
-	if (ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT)
+	if (ti->len != bdev_nr_sectors(dev->bdev))
 		return 1;
 	return 0;
 }
diff --git a/drivers/md/dm-log.c b/drivers/md/dm-log.c
index 1ecf75ef276a4..06f328928a7f5 100644
--- a/drivers/md/dm-log.c
+++ b/drivers/md/dm-log.c
@@ -447,7 +447,7 @@ static int create_log_context(struct dm_dirty_log *log, struct dm_target *ti,
 				bdev_logical_block_size(lc->header_location.
 							    bdev));
 
-		if (buf_size > i_size_read(dev->bdev->bd_inode)) {
+		if (buf_size > bdev_nr_bytes(dev->bdev)) {
 			DMWARN("log device %s too small: need %llu bytes",
 				dev->name, (unsigned long long)buf_size);
 			kfree(lc);
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 694aaca4eea24..5794f5415155d 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -2061,7 +2061,7 @@ static int multipath_prepare_ioctl(struct dm_target *ti,
 	/*
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
-	if (!r && ti->len != i_size_read((*bdev)->bd_inode) >> SECTOR_SHIFT)
+	if (!r && ti->len != bdev_nr_sectors((*bdev)))
 		return 1;
 	return r;
 }
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index d9ef52159a22b..2b26435a6946e 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -1261,7 +1261,7 @@ static int parse_raid_params(struct raid_set *rs, struct dm_arg_set *as,
 			md_rdev_init(jdev);
 			jdev->mddev = &rs->md;
 			jdev->bdev = rs->journal_dev.dev->bdev;
-			jdev->sectors = to_sector(i_size_read(jdev->bdev->bd_inode));
+			jdev->sectors = bdev_nr_sectors(jdev->bdev);
 			if (jdev->sectors < MIN_RAID456_JOURNAL_SPACE) {
 				rs->ti->error = "No space for raid4/5/6 journal";
 				return -ENOSPC;
@@ -1607,7 +1607,7 @@ static int _check_data_dev_sectors(struct raid_set *rs)
 
 	rdev_for_each(rdev, &rs->md)
 		if (!test_bit(Journal, &rdev->flags) && rdev->bdev) {
-			ds = min(ds, to_sector(i_size_read(rdev->bdev->bd_inode)));
+			ds = min(ds, bdev_nr_sectors(rdev->bdev));
 			if (ds < rs->md.dev_sectors) {
 				rs->ti->error = "Component device(s) too small";
 				return -EINVAL;
@@ -2662,7 +2662,7 @@ static int rs_adjust_data_offsets(struct raid_set *rs)
 	 * Make sure we got a minimum amount of free sectors per device
 	 */
 	if (rs->data_offset &&
-	    to_sector(i_size_read(rdev->bdev->bd_inode)) - rs->md.dev_sectors < MIN_FREE_RESHAPE_SPACE) {
+	    bdev_nr_sectors(rdev->bdev) - rs->md.dev_sectors < MIN_FREE_RESHAPE_SPACE) {
 		rs->ti->error = data_offset ? "No space for forward reshape" :
 					      "No space for backward reshape";
 		return -ENOSPC;
diff --git a/drivers/md/dm-switch.c b/drivers/md/dm-switch.c
index 028a92ff6d576..534dc2ca8bb06 100644
--- a/drivers/md/dm-switch.c
+++ b/drivers/md/dm-switch.c
@@ -529,7 +529,7 @@ static int switch_prepare_ioctl(struct dm_target *ti, struct block_device **bdev
 	 * Only pass ioctls through if the device sizes match exactly.
 	 */
 	if (ti->len + sctx->path_list[path_nr].start !=
-	    i_size_read((*bdev)->bd_inode) >> SECTOR_SHIFT)
+	    bdev_nr_sectors((*bdev)))
 		return 1;
 	return 0;
 }
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 1fa4d5582dca5..d95142102bd25 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -227,8 +227,7 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
 {
 	struct queue_limits *limits = data;
 	struct block_device *bdev = dev->bdev;
-	sector_t dev_size =
-		i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
+	sector_t dev_size = bdev_nr_sectors(bdev);
 	unsigned short logical_block_size_sectors =
 		limits->logical_block_size >> SECTOR_SHIFT;
 	char b[BDEVNAME_SIZE];
diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index c88ed14d49e65..1a96a07cbf443 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -549,7 +549,7 @@ static int __write_initial_superblock(struct dm_pool_metadata *pmd)
 	int r;
 	struct dm_block *sblock;
 	struct thin_disk_superblock *disk_super;
-	sector_t bdev_size = i_size_read(pmd->bdev->bd_inode) >> SECTOR_SHIFT;
+	sector_t bdev_size = bdev_nr_sectors(pmd->bdev);
 
 	if (bdev_size > THIN_METADATA_MAX_SECTORS)
 		bdev_size = THIN_METADATA_MAX_SECTORS;
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 4c67b77c23c1b..ec119d2422d5d 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3212,7 +3212,7 @@ static int metadata_pre_commit_callback(void *context)
 
 static sector_t get_dev_size(struct block_device *bdev)
 {
-	return i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
+	return bdev_nr_sectors(bdev);
 }
 
 static void warn_if_metadata_device_too_big(struct block_device *bdev)
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 88e2702b473b0..4651859d4233b 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -825,8 +825,7 @@ static int verity_prepare_ioctl(struct dm_target *ti, struct block_device **bdev
 
 	*bdev = v->data_dev->bdev;
 
-	if (v->data_start ||
-	    ti->len != i_size_read(v->data_dev->bdev->bd_inode) >> SECTOR_SHIFT)
+	if (v->data_start || ti->len != bdev_nr_sectors(v->data_dev->bdev))
 		return 1;
 	return 0;
 }
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 18320444fb0a9..017806096b91e 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -2341,7 +2341,7 @@ static int writecache_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		ti->error = "Cache data device lookup failed";
 		goto bad;
 	}
-	wc->memory_map_size = i_size_read(wc->ssd_dev->bdev->bd_inode);
+	wc->memory_map_size = bdev_nr_bytes(wc->ssd_dev->bdev);
 
 	/*
 	 * Parse the cache block size
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index ae1bc48c0043d..8dc21c09329f2 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -733,7 +733,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path,
 	dev->dev_idx = idx;
 	(void)bdevname(dev->bdev, dev->name);
 
-	dev->capacity = i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
+	dev->capacity = bdev_nr_sectors(bdev);
 	if (ti->begin) {
 		ti->error = "Partial mapping is not supported";
 		goto err;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
