Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86D572DF1
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 08:11:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D0C1420FBE;
	Wed, 13 Jul 2022 08:11:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E36DB420BA2
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 08:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bjngWu2+fy+EhLHzFfowceaR1j/UA31xrrxHhRbbPPo=;
	b=eK7l6IZou/+UiLWuRhRJW2kUNF
	RpfKvThqfwsyR+cMUx8PBvIbgU01gZ0oWI9XpdINo2jgH3dSHI1lEPGQmlTEgoPYTMOYbr16595A3
	MFz2oVSMmjvNoyPs1BGlO4XvDNzM48KTWLf3Bq7fJFTwhw+/LCG88jGR8AtzHLYtERIhWYGenwnL/
	6CU15IsolJQgPTYsk278i56pFs5cTzgQETWdjwZTez1Gqm8nU+YCZmIAsZ63Vidzj/Gu7//ryo9h9
	9He+NBNWjW6V4elzAZic6h5Ntm+w7m8ATCSfAU2++U3Wc9+GDrzV9dI6n3kVsckgX5IOjbRGaLv3F
	fjyauc/Q==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJf-000NXh-F4; Wed, 13 Jul 2022 05:53:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:16 +0200
Message-Id: <20220713055317.1888500-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220713055317.1888500-1-hch@lst.de>
References: <20220713055317.1888500-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Song Liu <song@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	linux-raid@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 8/9] ext4: only initialize mmp_bdevname once
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

mmp_bdevname is currently both initialized nested inside the kthread_run
call in ext4_multi_mount_protect and in the kmmpd thread started by it.

Lift the initiaization out of the kthread_run call in
ext4_multi_mount_protect, move the BUILD_BUG_ON next to it and remove
the duplicate assignment inside of kmmpd.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/mmp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index 79d05e464c432..b7a850b0070b8 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -150,8 +150,6 @@ static int kmmpd(void *data)
 	mmp_check_interval = max(EXT4_MMP_CHECK_MULT * mmp_update_interval,
 				 EXT4_MMP_MIN_CHECK_INTERVAL);
 	mmp->mmp_check_interval = cpu_to_le16(mmp_check_interval);
-	BUILD_BUG_ON(sizeof(mmp->mmp_bdevname) < BDEVNAME_SIZE);
-	bdevname(bh->b_bdev, mmp->mmp_bdevname);
 
 	memcpy(mmp->mmp_nodename, init_utsname()->nodename,
 	       sizeof(mmp->mmp_nodename));
@@ -372,13 +370,15 @@ int ext4_multi_mount_protect(struct super_block *sb,
 
 	EXT4_SB(sb)->s_mmp_bh = bh;
 
+	BUILD_BUG_ON(sizeof(mmp->mmp_bdevname) < BDEVNAME_SIZE);
+	bdevname(bh->b_bdev, mmp->mmp_bdevname);
+
 	/*
 	 * Start a kernel thread to update the MMP block periodically.
 	 */
 	EXT4_SB(sb)->s_mmp_tsk = kthread_run(kmmpd, sb, "kmmpd-%.*s",
 					     (int)sizeof(mmp->mmp_bdevname),
-					     bdevname(bh->b_bdev,
-						      mmp->mmp_bdevname));
+					     mmp->mmp_bdevname);
 	if (IS_ERR(EXT4_SB(sb)->s_mmp_tsk)) {
 		EXT4_SB(sb)->s_mmp_tsk = NULL;
 		ext4_warning(sb, "Unable to create kmmpd thread for %s.",
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
