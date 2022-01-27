Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802E49D8B7
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 03:58:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F09442063A;
	Thu, 27 Jan 2022 03:58:09 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 792A64207D1
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 03:57:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC4B62190B;
	Thu, 27 Jan 2022 02:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1643251787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=OVO5L5oh76QqfW3n1oDvBos2Yawv0E43OsrqMmz97u8=;
	b=JOFvU7iAGyn/v6BD3Bp+bh089vjSIxSCwY01PObM+BmenfkUZ1j2GJfL9RHxbWRZM/l98u
	qo/UEFC5lfk1D4MRdyMUcjwh6hIji/NTYfIRlm9cB6k65ocg8RHieVXuXzdIix2W/WWAJB
	+fCFtWOMn+6HtfPTgy8eWKnyVdE1o0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1643251787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=OVO5L5oh76QqfW3n1oDvBos2Yawv0E43OsrqMmz97u8=;
	b=IBhAkB2hVQaF92fXW6Y2P175TbQ6CFUUnjY/M7g7xzSXg9kQBD90kXkX3iZRhhBhPwaHez
	ofEg50iSvDeTM4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B085A13E46;
	Thu, 27 Jan 2022 02:49:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id DVgjG0QI8mF9LAAAMHmgww
	(envelope-from <neilb@suse.de>); Thu, 27 Jan 2022 02:49:40 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 13:46:29 +1100
Message-ID: <164325158960.29787.17588717894058708630.stgit@noble.brown>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 9/9] Remove congestion tracking framework.
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

This framework is no longer used - so discard it.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 include/linux/backing-dev-defs.h |    8 -----
 include/linux/backing-dev.h      |    2 -
 include/trace/events/writeback.h |   28 -------------------
 mm/backing-dev.c                 |   57 --------------------------------------
 4 files changed, 95 deletions(-)

diff --git a/include/linux/backing-dev-defs.h b/include/linux/backing-dev-defs.h
index 993c5628a726..e863c88df95f 100644
--- a/include/linux/backing-dev-defs.h
+++ b/include/linux/backing-dev-defs.h
@@ -207,14 +207,6 @@ struct backing_dev_info {
 #endif
 };
 
-enum {
-	BLK_RW_ASYNC	= 0,
-	BLK_RW_SYNC	= 1,
-};
-
-void clear_bdi_congested(struct backing_dev_info *bdi, int sync);
-void set_bdi_congested(struct backing_dev_info *bdi, int sync);
-
 struct wb_lock_cookie {
 	bool locked;
 	unsigned long flags;
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 2d764566280c..87ce24d238f3 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -135,8 +135,6 @@ static inline bool writeback_in_progress(struct bdi_writeback *wb)
 
 struct backing_dev_info *inode_to_bdi(struct inode *inode);
 
-long congestion_wait(int sync, long timeout);
-
 static inline bool mapping_can_writeback(struct address_space *mapping)
 {
 	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
index a345b1e12daf..86b2a82da546 100644
--- a/include/trace/events/writeback.h
+++ b/include/trace/events/writeback.h
@@ -735,34 +735,6 @@ TRACE_EVENT(writeback_sb_inodes_requeue,
 	)
 );
 
-DECLARE_EVENT_CLASS(writeback_congest_waited_template,
-
-	TP_PROTO(unsigned int usec_timeout, unsigned int usec_delayed),
-
-	TP_ARGS(usec_timeout, usec_delayed),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	usec_timeout	)
-		__field(	unsigned int,	usec_delayed	)
-	),
-
-	TP_fast_assign(
-		__entry->usec_timeout	= usec_timeout;
-		__entry->usec_delayed	= usec_delayed;
-	),
-
-	TP_printk("usec_timeout=%u usec_delayed=%u",
-			__entry->usec_timeout,
-			__entry->usec_delayed)
-);
-
-DEFINE_EVENT(writeback_congest_waited_template, writeback_congestion_wait,
-
-	TP_PROTO(unsigned int usec_timeout, unsigned int usec_delayed),
-
-	TP_ARGS(usec_timeout, usec_delayed)
-);
-
 DECLARE_EVENT_CLASS(writeback_single_inode_template,
 
 	TP_PROTO(struct inode *inode,
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index eae96dfe0261..7176af65b103 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1005,60 +1005,3 @@ const char *bdi_dev_name(struct backing_dev_info *bdi)
 	return bdi->dev_name;
 }
 EXPORT_SYMBOL_GPL(bdi_dev_name);
-
-static wait_queue_head_t congestion_wqh[2] = {
-		__WAIT_QUEUE_HEAD_INITIALIZER(congestion_wqh[0]),
-		__WAIT_QUEUE_HEAD_INITIALIZER(congestion_wqh[1])
-	};
-static atomic_t nr_wb_congested[2];
-
-void clear_bdi_congested(struct backing_dev_info *bdi, int sync)
-{
-	wait_queue_head_t *wqh = &congestion_wqh[sync];
-	enum wb_congested_state bit;
-
-	bit = sync ? WB_sync_congested : WB_async_congested;
-	if (test_and_clear_bit(bit, &bdi->wb.congested))
-		atomic_dec(&nr_wb_congested[sync]);
-	smp_mb__after_atomic();
-	if (waitqueue_active(wqh))
-		wake_up(wqh);
-}
-EXPORT_SYMBOL(clear_bdi_congested);
-
-void set_bdi_congested(struct backing_dev_info *bdi, int sync)
-{
-	enum wb_congested_state bit;
-
-	bit = sync ? WB_sync_congested : WB_async_congested;
-	if (!test_and_set_bit(bit, &bdi->wb.congested))
-		atomic_inc(&nr_wb_congested[sync]);
-}
-EXPORT_SYMBOL(set_bdi_congested);
-
-/**
- * congestion_wait - wait for a backing_dev to become uncongested
- * @sync: SYNC or ASYNC IO
- * @timeout: timeout in jiffies
- *
- * Waits for up to @timeout jiffies for a backing_dev (any backing_dev) to exit
- * write congestion.  If no backing_devs are congested then just wait for the
- * next write to be completed.
- */
-long congestion_wait(int sync, long timeout)
-{
-	long ret;
-	unsigned long start = jiffies;
-	DEFINE_WAIT(wait);
-	wait_queue_head_t *wqh = &congestion_wqh[sync];
-
-	prepare_to_wait(wqh, &wait, TASK_UNINTERRUPTIBLE);
-	ret = io_schedule_timeout(timeout);
-	finish_wait(wqh, &wait);
-
-	trace_writeback_congestion_wait(jiffies_to_usecs(timeout),
-					jiffies_to_usecs(jiffies - start));
-
-	return ret;
-}
-EXPORT_SYMBOL(congestion_wait);


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
