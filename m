Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8842F442
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 15:52:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5561E420FC7;
	Fri, 15 Oct 2021 15:52:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2C26420FAF
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 15:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CZsQopzZFCFutbkFSIGbqiyQrSSJ9R5UeOdpKBwhF7I=;
	b=Co6wYCF7AhUPA5SRoUj9KvX3/0
	OUn3XuYq99+ZapZrOXMaffeFLI7TIa10nOOoCaWcgLL5kjNEe5sv9dkk/zaDUmot0RLPv0lI/hAnk
	7M81vrANNQXDfiAq2WguipC+mpmulBU5RRiB8/b7DqhGr+4guXJ9Ej4V5VeGc/G7rVZO9SorGuR+T
	PQ24zoBl4Bg21VmaY53qc3PeN9McWVjplMTfyC7lYJklwr+0VrYdNxsSMlZhKxS9gTKu3Ha+VxCrp
	ujA3+QjINJ5dGCbFEFzHRRb5BajJ2KLveWZN7ycQfU/bnNveEeiFh6YTv4CqPavfPVChHhMumcYka
	hL9l2MMA==;
Received: from [2001:4bb8:199:73c5:ddfe:9587:819b:83b0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNFe-007Do9-Ir; Fri, 15 Oct 2021 13:27:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Oct 2021 15:26:41 +0200
Message-Id: <20211015132643.1621913-29-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 28/30] ntfs: use sb_bdev_nr_blocks
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

Use the sb_bdev_nr_blocks helper instead of open coding it and clean up
ntfs_fill_super a bit by moving an assignment a little earlier that has
no negative side effects.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 fs/ntfs/super.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 0d7e948cb29c9..5ae8de09b271b 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -2772,13 +2772,12 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
 	ntfs_debug("Set device block size to %i bytes (block size bits %i).",
 			blocksize, sb->s_blocksize_bits);
 	/* Determine the size of the device in units of block_size bytes. */
-	if (!i_size_read(sb->s_bdev->bd_inode)) {
+	vol->nr_blocks = sb_bdev_nr_blocks(sb);
+	if (!vol->nr_blocks) {
 		if (!silent)
 			ntfs_error(sb, "Unable to determine device size.");
 		goto err_out_now;
 	}
-	vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
-			sb->s_blocksize_bits;
 	/* Read the boot sector and return unlocked buffer head to it. */
 	if (!(bh = read_ntfs_boot_sector(sb, silent))) {
 		if (!silent)
@@ -2816,8 +2815,7 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
 			goto err_out_now;
 		}
 		BUG_ON(blocksize != sb->s_blocksize);
-		vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
-				sb->s_blocksize_bits;
+		vol->nr_blocks = sb_bdev_nr_blocks(sb);
 		ntfs_debug("Changed device block size to %i bytes (block size "
 				"bits %i) to match volume sector size.",
 				blocksize, sb->s_blocksize_bits);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
