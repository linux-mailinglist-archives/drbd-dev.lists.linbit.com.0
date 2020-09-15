Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC826A8AF
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Sep 2020 17:23:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22AF1420BEF;
	Tue, 15 Sep 2020 17:23:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 071C9420BEA
	for <drbd-dev@lists.linbit.com>; Tue, 15 Sep 2020 17:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bCMdefcbVNK1n/7kExQP4kHzaTJA1/jyiOiumdm05Vg=;
	b=JTvp10HXp5J69jy2CuzD9GhhpT
	DDjNKmn/2H6kDp88475wME6gUvl9+f3wRoFLOTLRz3S4MzOpFpW99mnsebG7jG0lF/epV73VMWLqs
	6rlHBaaETOo2D12OSMO42xSsZAtbPpnIpfQGgYc5CZNFbZc5g0o1DD23sYsplsEAglwIWPIKCSkDV
	9qeGpB7rTwZY6t8/erSjBJX3LtFIVUKogeW/OSS8IvTrBg/ORZHDm1hot46XBw9bDYewalYVHh9GO
	DVyg8qV8FRjz+bfG4e7Ggq7zdO8L3OQ3rEJ2SUfMaq/4+eetzjdH995hp/8iQYQ0gmf3EwHmRUTet
	kYO6k9pQ==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICnE-0001A7-PD; Tue, 15 Sep 2020 15:22:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 17:18:18 +0200
Message-Id: <20200915151829.1767176-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915151829.1767176-1-hch@lst.de>
References: <20200915151829.1767176-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 01/12] fs: remove the unused SB_I_MULTIROOT flag
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

The last user of SB_I_MULTIROOT is disappeared with commit f2aedb713c28
("NFS: Add fs_context support.")

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/namei.c         | 4 ++--
 include/linux/fs.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index e99e2a9da0f7de..f1eb8ccd2be958 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -568,8 +568,8 @@ static bool path_connected(struct vfsmount *mnt, struct dentry *dentry)
 {
 	struct super_block *sb = mnt->mnt_sb;
 
-	/* Bind mounts and multi-root filesystems can have disconnected paths */
-	if (!(sb->s_iflags & SB_I_MULTIROOT) && (mnt->mnt_root == sb->s_root))
+	/* Bind mounts can have disconnected paths */
+	if (mnt->mnt_root == sb->s_root)
 		return true;
 
 	return is_subdir(dentry, mnt->mnt_root);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 7519ae003a082c..fbd74df5ce5f34 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1385,7 +1385,6 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
 #define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
 #define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
-#define SB_I_MULTIROOT	0x00000008	/* Multiple roots to the dentry tree */
 
 /* sb->s_iflags to limit user namespace mounts */
 #define SB_I_USERNS_VISIBLE		0x00000010 /* fstype already mounted */
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
