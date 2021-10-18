Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C42374316AC
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 12:59:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ADBA7420FFE;
	Mon, 18 Oct 2021 12:59:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B29D4420FD0
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 12:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IR8E02XMGGGYY/7AuAB98aQIqqpNb05KI4jjU1KZi0g=;
	b=jlyC2wKlv0Dk0mRuurE/joWlZF
	VpNlBkeeA0PjZ2NajJoDjr9v3EiIwtPF1JteO360FGKJkhfh9OLHtaWcNC/YYVRHzn4igezSYHxT1
	7XEkIBOlDwUEBTv9B9OT48ouZ/iOk9da/fqLwcy1JfO/lTqQxPh0qQWN/uTAwOGMhGF1R4I0TADUh
	QWh+vV4ybNP0mjpdri/xlUfWGBm2coE3H8OuZR3R+2pX12iGo1tvmes3bbBGd5Z27Cct7Z7Iczbza
	Vr7ekLBFYDDUPusgz0/chUWS0Ox+NEfQQloEJw9Li0TnbKMxDsvOhdpn9LUloR0D9XN9N4HEwoK6P
	KVvyt3rA==;
Received: from [2001:4bb8:199:73c5:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcPcj-00EuH9-BJ; Mon, 18 Oct 2021 10:12:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 18 Oct 2021 12:11:12 +0200
Message-Id: <20211018101130.1838532-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018101130.1838532-1-hch@lst.de>
References: <20211018101130.1838532-1-hch@lst.de>
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
	linux-ext4@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
	Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
	Anand Jain <anand.jain@oracle.com>, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 12/30] btrfs: use bdev_nr_bytes instead of open
	coding it
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

Use the proper helper to read the block device size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Anand Jain <anand.jain@oracle.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Acked-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/dev-replace.c | 3 +--
 fs/btrfs/disk-io.c     | 2 +-
 fs/btrfs/ioctl.c       | 4 ++--
 fs/btrfs/volumes.c     | 8 ++++----
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/btrfs/dev-replace.c b/fs/btrfs/dev-replace.c
index d029be40ea6f0..fbb8b4457a721 100644
--- a/fs/btrfs/dev-replace.c
+++ b/fs/btrfs/dev-replace.c
@@ -283,8 +283,7 @@ static int btrfs_init_dev_replace_tgtdev(struct btrfs_fs_info *fs_info,
 	}
 
 
-	if (i_size_read(bdev->bd_inode) <
-	    btrfs_device_get_total_bytes(srcdev)) {
+	if (bdev_nr_bytes(bdev) < btrfs_device_get_total_bytes(srcdev)) {
 		btrfs_err(fs_info,
 			  "target device is smaller than source device!");
 		ret = -EINVAL;
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 355ea88d5c5f7..29e7598584c4c 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3740,7 +3740,7 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
 	else if (ret)
 		return ERR_PTR(ret);
 
-	if (bytenr + BTRFS_SUPER_INFO_SIZE >= i_size_read(bdev->bd_inode))
+	if (bytenr + BTRFS_SUPER_INFO_SIZE >= bdev_nr_bytes(bdev))
 		return ERR_PTR(-EINVAL);
 
 	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index cc61813213d83..36ff713da1b12 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -1730,7 +1730,7 @@ static noinline int btrfs_ioctl_resize(struct file *file,
 	}
 
 	if (!strcmp(sizestr, "max"))
-		new_size = device->bdev->bd_inode->i_size;
+		new_size = bdev_nr_bytes(device->bdev);
 	else {
 		if (sizestr[0] == '-') {
 			mod = -1;
@@ -1771,7 +1771,7 @@ static noinline int btrfs_ioctl_resize(struct file *file,
 		ret = -EINVAL;
 		goto out_finish;
 	}
-	if (new_size > device->bdev->bd_inode->i_size) {
+	if (new_size > bdev_nr_bytes(device->bdev)) {
 		ret = -EFBIG;
 		goto out_finish;
 	}
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 2ec3b8ac8fa35..676c7c4e6e59d 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1286,7 +1286,7 @@ static struct btrfs_super_block *btrfs_read_disk_super(struct block_device *bdev
 	pgoff_t index;
 
 	/* make sure our super fits in the device */
-	if (bytenr + PAGE_SIZE >= i_size_read(bdev->bd_inode))
+	if (bytenr + PAGE_SIZE >= bdev_nr_bytes(bdev))
 		return ERR_PTR(-EINVAL);
 
 	/* make sure our super fits in the page */
@@ -2610,8 +2610,8 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 	device->io_width = fs_info->sectorsize;
 	device->io_align = fs_info->sectorsize;
 	device->sector_size = fs_info->sectorsize;
-	device->total_bytes = round_down(i_size_read(bdev->bd_inode),
-					 fs_info->sectorsize);
+	device->total_bytes =
+		round_down(bdev_nr_bytes(bdev), fs_info->sectorsize);
 	device->disk_total_bytes = device->total_bytes;
 	device->commit_total_bytes = device->total_bytes;
 	set_bit(BTRFS_DEV_STATE_IN_FS_METADATA, &device->dev_state);
@@ -7236,7 +7236,7 @@ static int read_one_dev(struct extent_buffer *leaf,
 
 	fill_device_from_item(leaf, dev_item, device);
 	if (device->bdev) {
-		u64 max_total_bytes = i_size_read(device->bdev->bd_inode);
+		u64 max_total_bytes = bdev_nr_bytes(device->bdev);
 
 		if (device->total_bytes > max_total_bytes) {
 			btrfs_err(fs_info,
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
