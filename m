Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF942B58B
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 07:36:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2254F420FC5;
	Wed, 13 Oct 2021 07:36:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E1E6420FC0
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 07:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b/1WtCR7MZhJba3BS3poCWIl5wb8PwibdCVDGtUMTIg=;
	b=AibyI63hxlP0PaVEtM1IB45vue
	B2Qp9sl1L0sVZCSdVPNP2iqBhSzPbqm6ldKWMyav2yvdMQ8khXEtRJDK2V9zGHlPUMeKa8c8v4s4E
	hTRbUpkJ5IfZ1QXJr94uVSBQLjDMG1t+3M/ofV8sFHUaAtQSYoPoQsKWFIiX0cVrr8xgrr9ZfEvYU
	VSxfoBUL4jMnlFdTu2kCpc9Pi2uWPogBS9qNnRhqO3RXf9uBkRWfNVq1ab8AfJFIv7CqvsjupDBKJ
	8pOAEhN8lIBVRjgAwbzXc7/iEd8mafeISKsRwX+b8XdVb8I+dz+5xaXlAxETrLmdZEU0hlvvnr1wv
	uQt5wmrg==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWrI-0077W8-Sa; Wed, 13 Oct 2021 05:31:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Oct 2021 07:10:31 +0200
Message-Id: <20211013051042.1065752-19-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013051042.1065752-1-hch@lst.de>
References: <20211013051042.1065752-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
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
Subject: [Drbd-dev] [PATCH 18/29] nilfs2: use bdev_nr_sectors instead of
	open coding it
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
---
 fs/nilfs2/ioctl.c     | 2 +-
 fs/nilfs2/super.c     | 2 +-
 fs/nilfs2/the_nilfs.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 640ac8fe891e6..4c12cc0e265e1 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -1107,7 +1107,7 @@ static int nilfs_ioctl_set_alloc_range(struct inode *inode, void __user *argp)
 		goto out;
 
 	ret = -ERANGE;
-	if (range[1] > i_size_read(inode->i_sb->s_bdev->bd_inode))
+	if (range[1] > (bdev_nr_sectors(inode->i_sb->s_bdev) << SECTOR_SHIFT))
 		goto out;
 
 	segbytes = nilfs->ns_blocks_per_segment * nilfs->ns_blocksize;
diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index f6b2d280aab5a..1842663339acc 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -403,7 +403,7 @@ int nilfs_resize_fs(struct super_block *sb, __u64 newsize)
 	int ret;
 
 	ret = -ERANGE;
-	devsize = i_size_read(sb->s_bdev->bd_inode);
+	devsize = bdev_nr_sectors(sb->s_bdev) << SECTOR_SHIFT;
 	if (newsize > devsize)
 		goto out;
 
diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
index c8bfc01da5d71..d68df998213e9 100644
--- a/fs/nilfs2/the_nilfs.c
+++ b/fs/nilfs2/the_nilfs.c
@@ -489,7 +489,8 @@ static int nilfs_load_super_block(struct the_nilfs *nilfs,
 {
 	struct nilfs_super_block **sbp = nilfs->ns_sbp;
 	struct buffer_head **sbh = nilfs->ns_sbh;
-	u64 sb2off = NILFS_SB2_OFFSET_BYTES(nilfs->ns_bdev->bd_inode->i_size);
+	loff_t size = bdev_nr_sectors(nilfs->ns_bdev) << SECTOR_SHIFT;
+	u64 sb2off = NILFS_SB2_OFFSET_BYTES(size);
 	int valid[2], swp = 0;
 
 	sbp[0] = nilfs_read_super_block(sb, NILFS_SB_OFFSET_BYTES, blocksize,
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
