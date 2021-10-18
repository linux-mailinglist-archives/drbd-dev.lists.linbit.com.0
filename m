Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 088DD4316A5
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 12:58:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD9D8420FFF;
	Mon, 18 Oct 2021 12:58:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09CC5420FF6
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 12:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Ss3ilUyKMuPfHBXzBJ88Vs1wtib02SxYRpGnTBbPDiA=;
	b=oAbnRWg/YW/pvh0a/EKd2He+y8
	nhRS61TBq4K/396NBlUVJPiq7U8gOjdM+JVuY0sA6KWIwYTIUOcl5EeE57s1AY7f06lIYlW9O/j4o
	UMAhvrYBojy6l7jxkCXMVIhDsqhCiPdKDdRXdynprKLz3bF+wOqvzPYluC8tglrc6VSUQTwiLQCOD
	veucZd4xDpI/b9hqSeZnZr0mHV4dXMogd8BlQMVoXYmdd/TJDxSvjMaWeO+8WO+iqmTPtMrkF6CjB
	IMmu5I08e32bMALy0zhps5vW3RO4HSUhmaaU8lydFjNoKUiwc2Z2qyuCR8orEZbLXBcDro8LkzLsC
	HQ2vwtRQ==;
Received: from [2001:4bb8:199:73c5:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcPcw-00EuTH-R5; Mon, 18 Oct 2021 10:12:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 18 Oct 2021 12:11:17 +0200
Message-Id: <20211018101130.1838532-18-hch@lst.de>
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
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	Dave Kleikamp <dave.kleikamp@oracle.com>, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 17/30] jfs: use bdev_nr_bytes instead of open
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
Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>
---
 fs/jfs/resize.c | 2 +-
 fs/jfs/super.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/resize.c b/fs/jfs/resize.c
index bde787c354fcc..a42dbb0d3d28a 100644
--- a/fs/jfs/resize.c
+++ b/fs/jfs/resize.c
@@ -199,7 +199,7 @@ int jfs_extendfs(struct super_block *sb, s64 newLVSize, int newLogSize)
 	txQuiesce(sb);
 
 	/* Reset size of direct inode */
-	sbi->direct_inode->i_size =  i_size_read(sb->s_bdev->bd_inode);
+	sbi->direct_inode->i_size = bdev_nr_bytes(sb->s_bdev);
 
 	if (sbi->mntflag & JFS_INLINELOG) {
 		/*
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 9030aeaf0f886..9241caa161163 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -551,7 +551,7 @@ static int jfs_fill_super(struct super_block *sb, void *data, int silent)
 		ret = -ENOMEM;
 		goto out_unload;
 	}
-	inode->i_size = i_size_read(sb->s_bdev->bd_inode);
+	inode->i_size = bdev_nr_bytes(sb->s_bdev);
 	inode->i_mapping->a_ops = &jfs_metapage_aops;
 	inode_fake_hash(inode);
 	mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
