Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034B42F440
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 15:52:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22BA5420FC2;
	Fri, 15 Oct 2021 15:52:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4345A420FB1
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 15:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sSdphJbx9SQw+wN4za3/OjMw3p4iKMeSjeY0No/E5ck=;
	b=mYVi+DfMh2Flgl87jrezDtyvd3
	a2zTmGuRiUkEY5OqSus37P7PJYNXJeYvs4CIR89NSDvWd9hOZQRGpUq2eivUob8wqq1laQh8TrUCx
	2ExLwQDsks/B9O8nP075TlWszILX5iQAAszlnb1d+Cx3e++65QhdSbskGgfjcqUh4xc5arb1PJ6D0
	Qpb8qV4s18gZHs48YP3w/oR7US7tPckLc5rhfJeTdTDk8rAuiPsomrve+M6uLU7Sly4/q32G5x+4Q
	mq6XEPFdhNmj992DCRiM2LNJN0THqGgoA1kAepm/r9IZrWZv3xlxj1K04lBAmw4bNnmJkVkLvjFJ6
	osyWQ5Kg==;
Received: from [2001:4bb8:199:73c5:ddfe:9587:819b:83b0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNFj-007Dux-Lc; Fri, 15 Oct 2021 13:28:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Oct 2021 15:26:43 +0200
Message-Id: <20211015132643.1621913-31-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015132643.1621913-1-hch@lst.de>
References: <20211015132643.1621913-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org,
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
Subject: [Drbd-dev] [PATCH 30/30] udf: use sb_bdev_nr_blocks
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

Use the sb_bdev_nr_blocks helper instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/udf/lowlevel.c | 5 ++---
 fs/udf/super.c    | 9 +++------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/fs/udf/lowlevel.c b/fs/udf/lowlevel.c
index f1094cdcd6cde..46d6971721975 100644
--- a/fs/udf/lowlevel.c
+++ b/fs/udf/lowlevel.c
@@ -47,8 +47,7 @@ unsigned int udf_get_last_session(struct super_block *sb)
 
 unsigned long udf_get_last_block(struct super_block *sb)
 {
-	struct block_device *bdev = sb->s_bdev;
-	struct cdrom_device_info *cdi = disk_to_cdi(bdev->bd_disk);
+	struct cdrom_device_info *cdi = disk_to_cdi(sb->s_bdev->bd_disk);
 	unsigned long lblock = 0;
 
 	/*
@@ -56,7 +55,7 @@ unsigned long udf_get_last_block(struct super_block *sb)
 	 * Try using the device size...
 	 */
 	if (!cdi || cdrom_get_last_written(cdi, &lblock) || lblock == 0)
-		lblock = i_size_read(bdev->bd_inode) >> sb->s_blocksize_bits;
+		lblock = sb_bdev_nr_blocks(sb);
 
 	if (lblock)
 		return lblock - 1;
diff --git a/fs/udf/super.c b/fs/udf/super.c
index b2d7c57d06881..34247fba6df91 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1175,8 +1175,7 @@ static int udf_load_vat(struct super_block *sb, int p_index, int type1_index)
 	struct udf_inode_info *vati;
 	uint32_t pos;
 	struct virtualAllocationTable20 *vat20;
-	sector_t blocks = i_size_read(sb->s_bdev->bd_inode) >>
-			  sb->s_blocksize_bits;
+	sector_t blocks = sb_bdev_nr_blocks(sb);
 
 	udf_find_vat_block(sb, p_index, type1_index, sbi->s_last_block);
 	if (!sbi->s_vat_inode &&
@@ -1838,8 +1837,7 @@ static int udf_check_anchor_block(struct super_block *sb, sector_t block,
 	int ret;
 
 	if (UDF_QUERY_FLAG(sb, UDF_FLAG_VARCONV) &&
-	    udf_fixed_to_variable(block) >=
-	    i_size_read(sb->s_bdev->bd_inode) >> sb->s_blocksize_bits)
+	    udf_fixed_to_variable(block) >= sb_bdev_nr_blocks(sb))
 		return -EAGAIN;
 
 	bh = udf_read_tagged(sb, block, block, &ident);
@@ -1901,8 +1899,7 @@ static int udf_scan_anchors(struct super_block *sb, sector_t *lastblock,
 		last[last_count++] = *lastblock - 152;
 
 	for (i = 0; i < last_count; i++) {
-		if (last[i] >= i_size_read(sb->s_bdev->bd_inode) >>
-				sb->s_blocksize_bits)
+		if (last[i] >= sb_bdev_nr_blocks(sb))
 			continue;
 		ret = udf_check_anchor_block(sb, last[i], fileset);
 		if (ret != -EAGAIN) {
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
