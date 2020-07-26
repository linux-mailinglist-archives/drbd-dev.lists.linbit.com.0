Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638D22E067
	for <lists+drbd-dev@lfdr.de>; Sun, 26 Jul 2020 17:08:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F191420597;
	Sun, 26 Jul 2020 17:08:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4352B420597
	for <drbd-dev@lists.linbit.com>; Sun, 26 Jul 2020 17:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2XFxJKGxcOOVZQBrWMAqxenYfkp6e0GZfp9ni0DLWtg=;
	b=ZE4oTpId+pT7G6zEvfTK/sqnvr
	4cLSa7rwQXQHqnGnLAotS6phFT4NL1IJMcr8TEaFwR0yBvO5L/PSolSc53Tqi9MVNnSz3fCs0q3gS
	hEUWbcgaAJYHgnaTS9F1VZ6r6keNiWAqzboB1R52AD+sshtiD7WcuoDXicBJkr3CEQqtdZ/M3T7ER
	6RSRamzVJHM2Al3vwXiQGazeavNpkSiqk8JdetLo9KxJcIyaM5phx4BaSVkNXbT38CfEmOaOuK0wx
	EtOtZZ2KUzx0dNvwL02Xj7jne1txcIxNoRq5MpLbc924ni87Ja7p2zTMgrWBFC9gOilDPLRCJGOk7
	zRbKCuMQ==;
Received: from [2001:4bb8:18c:2acc:2375:88ff:9f84:118d] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jziBi-0005gE-QC; Sun, 26 Jul 2020 15:03:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 26 Jul 2020 17:03:23 +0200
Message-Id: <20200726150333.305527-5-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726150333.305527-1-hch@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: David Sterba <dsterba@suse.com>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
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

Set up a readahead size by default, as very few users have a good
reason to change it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
---
 block/blk-core.c      | 1 -
 drivers/mtd/mtdcore.c | 1 +
 fs/9p/vfs_super.c     | 4 ++--
 fs/afs/super.c        | 1 -
 fs/btrfs/disk-io.c    | 1 -
 fs/fuse/inode.c       | 1 -
 fs/nfs/super.c        | 9 +--------
 fs/ubifs/super.c      | 1 +
 fs/vboxsf/super.c     | 1 +
 mm/backing-dev.c      | 1 +
 10 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 93104c7470e8ac..ea1665de7a2079 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -538,7 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
 	if (!q->stats)
 		goto fail_stats;
 
-	q->backing_dev_info->ra_pages = VM_READAHEAD_PAGES;
 	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
 	q->node = node_id;
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7d930569a7dfb7..01b3fe888d885b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2196,6 +2196,7 @@ static struct backing_dev_info * __init mtd_bdi_init(char *name)
 	bdi = bdi_alloc(NUMA_NO_NODE);
 	if (!bdi)
 		return ERR_PTR(-ENOMEM);
+	bdi->ra_pages = 0;
 
 	/*
 	 * We put '-0' suffix to the name to get the same name format as we
diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index 74df32be4c6a52..a338eb979cadf9 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -80,8 +80,8 @@ v9fs_fill_super(struct super_block *sb, struct v9fs_session_info *v9ses,
 	if (ret)
 		return ret;
 
-	if (v9ses->cache)
-		sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
+	if (!v9ses->cache)
+		sb->s_bdi->ra_pages = 0;
 
 	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC;
 	if (!v9ses->cache)
diff --git a/fs/afs/super.c b/fs/afs/super.c
index b552357b1d1379..3a40ee752c1e3f 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -456,7 +456,6 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 	ret = super_setup_bdi(sb);
 	if (ret)
 		return ret;
-	sb->s_bdi->ra_pages	= VM_READAHEAD_PAGES;
 
 	/* allocate the root inode and dentry */
 	if (as->dyn_root) {
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index ad157b55d7f5f0..f92c45fe019c48 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3033,7 +3033,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
 	}
 
 	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
-	sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
 	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
 	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index bba747520e9b08..17b00670fb539e 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1049,7 +1049,6 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
 	if (err)
 		return err;
 
-	sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
 	/* fuse does it's own writeback accounting */
 	sb->s_bdi->capabilities = BDI_CAP_NO_ACCT_WB | BDI_CAP_STRICTLIMIT;
 
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 7a70287f21a2c1..f943e37853fa25 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1200,13 +1200,6 @@ static void nfs_get_cache_cookie(struct super_block *sb,
 }
 #endif
 
-static void nfs_set_readahead(struct backing_dev_info *bdi,
-			      unsigned long iomax_pages)
-{
-	bdi->ra_pages = VM_READAHEAD_PAGES;
-	bdi->io_pages = iomax_pages;
-}
-
 int nfs_get_tree_common(struct fs_context *fc)
 {
 	struct nfs_fs_context *ctx = nfs_fc2context(fc);
@@ -1251,7 +1244,7 @@ int nfs_get_tree_common(struct fs_context *fc)
 					     MINOR(server->s_dev));
 		if (error)
 			goto error_splat_super;
-		nfs_set_readahead(s->s_bdi, server->rpages);
+		s->s_bdi->io_pages = server->rpages;
 		server->super = s;
 	}
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7fc2f3f07c16ed..ee7692e7a35371 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2159,6 +2159,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 				   c->vi.vol_id);
 	if (err)
 		goto out_close;
+	sb->s_bdi->ra_pages = 0; /* ubifs does its own readahead */
 
 	sb->s_fs_info = c;
 	sb->s_magic = UBIFS_SUPER_MAGIC;
diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
index 8fe03b4a0d2b03..6574ae5a97c2c8 100644
--- a/fs/vboxsf/super.c
+++ b/fs/vboxsf/super.c
@@ -167,6 +167,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
 	err = super_setup_bdi_name(sb, "vboxsf-%d", sbi->bdi_id);
 	if (err)
 		goto fail_free;
+	sb->s_bdi->ra_pages = 0;
 
 	/* Turn source into a shfl_string and map the folder */
 	size = strlen(fc->source) + 1;
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 8e8b00627bb2d8..3e441e0ff1bc88 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -746,6 +746,7 @@ struct backing_dev_info *bdi_alloc(int node_id)
 		kfree(bdi);
 		return NULL;
 	}
+	bdi->ra_pages = VM_READAHEAD_PAGES;
 	return bdi;
 }
 EXPORT_SYMBOL(bdi_alloc);
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
