Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360C4BEFFF
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 04:19:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 41BF6421780;
	Tue, 22 Feb 2022 04:19:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 93AEF420060
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 04:18:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75B9C21100;
	Tue, 22 Feb 2022 03:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1645499938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=CRQpTl6gU6MaBAdfwSalgYu+ynBw18B3JAwgtU5P7zs=;
	b=rAWmkDzMUq5saT4diV9iyBOxbbUTYHnUd2tyt0hXJjU6qv76OdiJ5quclkFkgkZQZIH/wp
	djrbwIjn2UoPBOT7mgohYOdjGbrka++Z8N5ut87wSQClx58gfzi3CCtWd2zWBc047trrfv
	Pk48nRu5043YQll4VCkTE6CkokYW/jI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1645499938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=CRQpTl6gU6MaBAdfwSalgYu+ynBw18B3JAwgtU5P7zs=;
	b=78ppJZNYmM3wJ075e/NaA+H//budRLqxkm37FXGyz0tkz7p2NRq8afWahvYZOHCZpahi12
	jM7r94+t4KDXnMBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 080F213BA7;
	Tue, 22 Feb 2022 03:18:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id IoVMLRpWFGKhWgAAMHmgww
	(envelope-from <neilb@suse.de>); Tue, 22 Feb 2022 03:18:50 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
	Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 14:17:17 +1100
Message-ID: <164549983738.9187.3972219847989393182.stgit@noble.brown>
In-Reply-To: <164549971112.9187.16871723439770288255.stgit@noble.brown>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 05/11] nfs: remove reliance on bdi congestion
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

The bdi congestion tracking in not widely used and will be removed.

NFS is one of a small number of filesystems that uses it, setting just
the async (write) congestion flag at what it determines are appropriate
times.

The only remaining effect of the async flag is to cause (some)
WB_SYNC_NONE writes to be skipped.

So instead of setting the flag, set an internal flag and change:
 - .writepages to do nothing if WB_SYNC_NONE and the flag is set
 - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
    and the flag is set.

The writepages change causes a behavioural change in that pageout() can
now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
be called on the page which (I think) wil further delay the next attempt
at writeout.  This might be a good thing.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/nfs/write.c            |   14 +++++++++++---
 include/linux/nfs_fs_sb.h |    1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 987a187bd39a..7c986164018e 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -417,7 +417,7 @@ static void nfs_set_page_writeback(struct page *page)
 
 	if (atomic_long_inc_return(&nfss->writeback) >
 			NFS_CONGESTION_ON_THRESH)
-		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
+		nfss->write_congested = 1;
 }
 
 static void nfs_end_page_writeback(struct nfs_page *req)
@@ -433,7 +433,7 @@ static void nfs_end_page_writeback(struct nfs_page *req)
 
 	end_page_writeback(req->wb_page);
 	if (atomic_long_dec_return(&nfss->writeback) < NFS_CONGESTION_OFF_THRESH)
-		clear_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
+		nfss->write_congested = 0;
 }
 
 /*
@@ -672,6 +672,10 @@ static int nfs_writepage_locked(struct page *page,
 	struct inode *inode = page_file_mapping(page)->host;
 	int err;
 
+	if (wbc->sync_mode == WB_SYNC_NONE &&
+	    NFS_SERVER(inode)->write_congested)
+		return AOP_WRITEPAGE_ACTIVATE;
+
 	nfs_inc_stats(inode, NFSIOS_VFSWRITEPAGE);
 	nfs_pageio_init_write(&pgio, inode, 0,
 				false, &nfs_async_write_completion_ops);
@@ -719,6 +723,10 @@ int nfs_writepages(struct address_space *mapping, struct writeback_control *wbc)
 	int priority = 0;
 	int err;
 
+	if (wbc->sync_mode == WB_SYNC_NONE &&
+	    NFS_SERVER(inode)->write_congested)
+		return 0;
+
 	nfs_inc_stats(inode, NFSIOS_VFSWRITEPAGES);
 
 	if (!(mntflags & NFS_MOUNT_WRITE_EAGER) || wbc->for_kupdate ||
@@ -1893,7 +1901,7 @@ static void nfs_commit_release_pages(struct nfs_commit_data *data)
 	}
 	nfss = NFS_SERVER(data->inode);
 	if (atomic_long_read(&nfss->writeback) < NFS_CONGESTION_OFF_THRESH)
-		clear_bdi_congested(inode_to_bdi(data->inode), BLK_RW_ASYNC);
+		nfss->write_congested = 0;
 
 	nfs_init_cinfo(&cinfo, data->inode, data->dreq);
 	nfs_commit_end(cinfo.mds);
diff --git a/include/linux/nfs_fs_sb.h b/include/linux/nfs_fs_sb.h
index ca0959e51e81..6aa2a200676a 100644
--- a/include/linux/nfs_fs_sb.h
+++ b/include/linux/nfs_fs_sb.h
@@ -138,6 +138,7 @@ struct nfs_server {
 	struct nlm_host		*nlm_host;	/* NLM client handle */
 	struct nfs_iostats __percpu *io_stats;	/* I/O statistics */
 	atomic_long_t		writeback;	/* number of writeback pages */
+	unsigned int		write_congested;/* flag set when writeback gets too high */
 	unsigned int		flags;		/* various flags */
 
 /* The following are for internal use only. Also see uapi/linux/nfs_mount.h */


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
