Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E642B5F8
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 07:47:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ACC19420FDE;
	Wed, 13 Oct 2021 07:47:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DF41B420FB2
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 07:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MKwukInBFyTrKs6Aaqva7I1GF564O65mEY1S2Zysf+k=;
	b=oqNTvlSr0gVAj0cgPWjUWrqx5W
	302GO5JLoORjXACgqvRCalGteDMLyREVnZEUqj7xcXjq/iId0NgEzrSbOh4obQ/4ee5i8l5o4LHIM
	wuROI6BCvi3PT9S4ISVOdom6x+IJvC1vWyuVq0NPvO9jZe22/fFauPkXcii4KKRs5DNXGpYni/AL8
	7HHnxpob34N0OG8teoDCDT7mKUkmCfBE3Z53xu4LPhWgu0mT3MaKEu43GOXtbQZ/0tXbgdi3R0K1w
	t+4AxSmLzZ2HoIZ3ScAlF5AU7pcSW/CSoinAM1YX5U1B5IcEYVGt+llNo1haLmMx3TH1LnU3xsrsR
	xISwV+ig==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maX1B-0078JQ-HS; Wed, 13 Oct 2021 05:41:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Oct 2021 07:10:39 +0200
Message-Id: <20211013051042.1065752-27-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 26/29] jfs: use sb_bdev_nr_blocks
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
---
 fs/jfs/resize.c | 3 +--
 fs/jfs/super.c  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/resize.c b/fs/jfs/resize.c
index 51a8b22e71030..f23445fa4b417 100644
--- a/fs/jfs/resize.c
+++ b/fs/jfs/resize.c
@@ -86,8 +86,7 @@ int jfs_extendfs(struct super_block *sb, s64 newLVSize, int newLogSize)
 		goto out;
 	}
 
-	VolumeSize = i_size_read(sb->s_bdev->bd_inode) >> sb->s_blocksize_bits;
-
+	VolumeSize = sb_bdev_nr_blocks(sb);
 	if (VolumeSize) {
 		if (newLVSize > VolumeSize) {
 			printk(KERN_WARNING "jfs_extendfs: invalid size\n");
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 992870160903d..fecef43f94ae8 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -284,8 +284,7 @@ static int parse_options(char *options, struct super_block *sb, s64 *newLVSize,
 		}
 		case Opt_resize_nosize:
 		{
-			*newLVSize = i_size_read(sb->s_bdev->bd_inode) >>
-				sb->s_blocksize_bits;
+			*newLVSize = sb_bdev_nr_blocks(sb);
 			if (*newLVSize == 0)
 				pr_err("JFS: Cannot determine volume size\n");
 			break;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
