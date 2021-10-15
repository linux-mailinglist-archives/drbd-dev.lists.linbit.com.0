Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AE10B42F490
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 15:59:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79F90421009;
	Fri, 15 Oct 2021 15:59:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D75F2420FCD
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 15:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=l6H+xWHI2buGGvGsIZb/A3dvICuo/7ewDE4S1/fqN/c=;
	b=PZKuiIv/qJljrkxnxnKD+h7ASp
	t1DY8S37VxTjS5GVdTkbLu2mMuhS6r19M9P18jq5XWRRb/cDXTKEhdKZpbi6BYfjD+qVUx98A7XOx
	dOceraYZgfKi6i/cyCWYpqxoLOymY2Qbs01Ah8Y+ZKKT9clwZtoud58n6FEGbl464S2EYE1cDTPWl
	4k2uxiZ1Ufz8ImJJ9J6PAiEaI3OVRm7cm1hnYyVq9H/QoM0+iG2ltlqYPdw3Ica7l/zAFYvuR19Li
	1xrYDx5RlNaWSbE2njYmuPk8oSACh0P63MHKOWIgGLbA1JAiNrz3A7Mcdmlh/tLrvL90Jz6F3+CFW
	fbcCjk3g==;
Received: from [2001:4bb8:199:73c5:ddfe:9587:819b:83b0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNF4-007D8w-Ce; Fri, 15 Oct 2021 13:27:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Oct 2021 15:26:27 +0200
Message-Id: <20211015132643.1621913-15-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 14/30] fat: use bdev_nr_sectors instead of open
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
---
 fs/fat/inode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index de0c9b013a851..9f3cd03668adc 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -1536,14 +1536,11 @@ static int fat_read_static_bpb(struct super_block *sb,
 	struct fat_bios_param_block *bpb)
 {
 	static const char *notdos1x = "This doesn't look like a DOS 1.x volume";
-
+	sector_t bd_sects = bdev_nr_sectors(sb->s_bdev);
 	struct fat_floppy_defaults *fdefaults = NULL;
 	int error = -EINVAL;
-	sector_t bd_sects;
 	unsigned i;
 
-	bd_sects = i_size_read(sb->s_bdev->bd_inode) / SECTOR_SIZE;
-
 	/* 16-bit DOS 1.x reliably wrote bootstrap short-jmp code */
 	if (b->ignored[0] != 0xeb || b->ignored[2] != 0x90) {
 		if (!silent)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
