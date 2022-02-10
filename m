Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC04B057C
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Feb 2022 06:41:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B23A542094C;
	Thu, 10 Feb 2022 06:41:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88EB64205D8
	for <drbd-dev@lists.linbit.com>; Thu, 10 Feb 2022 06:40:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 70DD91F43D;
	Thu, 10 Feb 2022 05:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1644471600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=eBfA0J1VAN4vDciFet8kyITCSUUXphOKJM0dbNgQDlg=;
	b=yqtSqHyxwgEcFQ7tdufVmzaUi5fzX/LrzaAkzdhIXE5cnkTbkkI3ey9uCvPzGq0EJK8rda
	+E9mWICL33Dcuy7EPilwaTHUIuOW26UmS0BKCDRpVFIaT/aGIr40dAeK5kQwab4f7Y/7nd
	gFlh18fk9z+J+gUjbfTujF0HzFVklpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1644471600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=eBfA0J1VAN4vDciFet8kyITCSUUXphOKJM0dbNgQDlg=;
	b=CLVBNBE0ot5kjIcVDwlr6NGjjMHQwRokAo5rn1m3cMUkvfX1d7EUuwl81RGB0IMKB7NGBI
	Q3kdl10ckIPVZ6Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2284A13519;
	Thu, 10 Feb 2022 05:39:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id zTSyNCilBGIvOQAAMHmgww
	(envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:39:52 +0000
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
Date: Thu, 10 Feb 2022 16:37:52 +1100
Message-ID: <164447147260.23354.2337728875894445797.stgit@noble.brown>
In-Reply-To: <164447124918.23354.17858831070003318849.stgit@noble.brown>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 06/11] ceph: remove reliance on bdi congestion
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

CEPHfs is one of a small number of filesystems that uses it, setting
just the async (write) congestion flags at what it determines are
appropriate times.

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
 fs/ceph/addr.c  |   22 +++++++++++++---------
 fs/ceph/super.c |    1 +
 fs/ceph/super.h |    1 +
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index c98e5238a1b6..dc7af34640dd 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -563,7 +563,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 
 	if (atomic_long_inc_return(&fsc->writeback_count) >
 	    CONGESTION_ON_THRESH(fsc->mount_options->congestion_kb))
-		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
+		fsc->write_congested = true;
 
 	req = ceph_osdc_new_request(osdc, &ci->i_layout, ceph_vino(inode), page_off, &len, 0, 1,
 				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE, snapc,
@@ -623,7 +623,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 
 	if (atomic_long_dec_return(&fsc->writeback_count) <
 	    CONGESTION_OFF_THRESH(fsc->mount_options->congestion_kb))
-		clear_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
+		fsc->write_congested = false;
 
 	return err;
 }
@@ -635,6 +635,10 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 	BUG_ON(!inode);
 	ihold(inode);
 
+	if (wbc->sync_mode == WB_SYNC_NONE &&
+	    ceph_inode_to_client(inode)->write_congested)
+		return AOP_WRITEPAGE_ACTIVATE;
+
 	wait_on_page_fscache(page);
 
 	err = writepage_nounlock(page, wbc);
@@ -707,8 +711,7 @@ static void writepages_finish(struct ceph_osd_request *req)
 			if (atomic_long_dec_return(&fsc->writeback_count) <
 			     CONGESTION_OFF_THRESH(
 					fsc->mount_options->congestion_kb))
-				clear_bdi_congested(inode_to_bdi(inode),
-						    BLK_RW_ASYNC);
+				fsc->write_congested = false;
 
 			ceph_put_snap_context(detach_page_private(page));
 			end_page_writeback(page);
@@ -760,6 +763,10 @@ static int ceph_writepages_start(struct address_space *mapping,
 	bool done = false;
 	bool caching = ceph_is_cache_enabled(inode);
 
+	if (wbc->sync_mode == WB_SYNC_NONE &&
+	    fsc->write_congested)
+		return 0;
+
 	dout("writepages_start %p (mode=%s)\n", inode,
 	     wbc->sync_mode == WB_SYNC_NONE ? "NONE" :
 	     (wbc->sync_mode == WB_SYNC_ALL ? "ALL" : "HOLD"));
@@ -954,11 +961,8 @@ static int ceph_writepages_start(struct address_space *mapping,
 
 			if (atomic_long_inc_return(&fsc->writeback_count) >
 			    CONGESTION_ON_THRESH(
-				    fsc->mount_options->congestion_kb)) {
-				set_bdi_congested(inode_to_bdi(inode),
-						  BLK_RW_ASYNC);
-			}
-
+				    fsc->mount_options->congestion_kb))
+				fsc->write_congested = true;
 
 			pages[locked_pages++] = page;
 			pvec.pages[i] = NULL;
diff --git a/fs/ceph/super.c b/fs/ceph/super.c
index bf79f369aec6..4a3b77d049c7 100644
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@ -802,6 +802,7 @@ static struct ceph_fs_client *create_fs_client(struct ceph_mount_options *fsopt,
 	fsc->have_copy_from2 = true;
 
 	atomic_long_set(&fsc->writeback_count, 0);
+	fsc->write_congested = false;
 
 	err = -ENOMEM;
 	/*
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index 67f145e1ae7a..0bd97aea2319 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -121,6 +121,7 @@ struct ceph_fs_client {
 	struct ceph_mds_client *mdsc;
 
 	atomic_long_t writeback_count;
+	bool write_congested;
 
 	struct workqueue_struct *inode_wq;
 	struct workqueue_struct *cap_wq;


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
