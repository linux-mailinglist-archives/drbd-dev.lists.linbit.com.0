Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96B49F08E
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jan 2022 02:34:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F6F242A58B;
	Fri, 28 Jan 2022 02:34:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 380 seconds by postgrey-1.31 at mail19;
	Fri, 28 Jan 2022 02:34:04 CET
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD52E42A583
	for <drbd-dev@lists.linbit.com>;
	Fri, 28 Jan 2022 02:34:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8C1861D9B;
	Fri, 28 Jan 2022 01:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E36C340E4;
	Fri, 28 Jan 2022 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643333263;
	bh=1DLj8KHTHp8d5WdiUPuZOplV4Q5vuq4iZQ+JC0nHJ2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sifa83s71AP+NEqGPXQ/5S92TYI3+oItVpDEaB/zM4U7IG/Phqxl7cKbkNTJMCcdM
	bf///GlSxnROcERpWqOJnBvLcEP8+e3lzDeKQqcmZ/oJD1Qb71s+egXTZ208pOABI/
	1ISVx27fNyNNEZ9DW/iPyLY1kzgw+HmRiGu0SsshajEzgLlW4n7gBCh+2fg9TR31Iy
	COwN/6oumyYRY/WJcIb1/4aEMsCAekeXJa2V806YdfIaZOgwmVd2vQ6VivQad+AtRE
	oOcOafl34matWgXYicLVuS/pcR46n+6v3OMDvqbEl6vWVFuCfyIfLi+xNUmB50k+at
	Mloh98egdQ82Q==
Date: Thu, 27 Jan 2022 17:27:40 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: NeilBrown <neilb@suse.de>
Message-ID: <YfNGjMZWrlJURRuR@google.com>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
	<164325158957.29787.2116312603613564596.stgit@noble.brown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164325158957.29787.2116312603613564596.stgit@noble.brown>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, drbd-dev@lists.linbit.com,
	Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-nilfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 4/9] f2f2: replace some congestion_wait()
 calls with io_schedule_timeout()
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

I saw some missing cases. Could you please consider this instead?
And, please fix "f2f2:" to "f2fs:".

---
 fs/f2fs/compress.c |  4 +---
 fs/f2fs/data.c     | 13 ++++++-------
 fs/f2fs/f2fs.h     |  6 ++++++
 fs/f2fs/segment.c  |  8 +++-----
 fs/f2fs/super.c    |  6 ++----
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 67bac2792e57..6b22d407a4a4 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1505,9 +1505,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				if (IS_NOQUOTA(cc->inode))
 					return 0;
 				ret = 0;
-				cond_resched();
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 				goto retry_write;
 			}
 			return ret;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0f124e8de1d4..c9285c88cb85 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3046,13 +3046,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto next;
 				} else if (ret == -EAGAIN) {
 					ret = 0;
-					if (wbc->sync_mode == WB_SYNC_ALL) {
-						cond_resched();
-						congestion_wait(BLK_RW_ASYNC,
-							DEFAULT_IO_TIMEOUT);
-						goto retry_write;
-					}
-					goto next;
+					if (wbc->sync_mode != WB_SYNC_ALL)
+						goto next;
+
+					f2fs_io_schedule_timeout(
+						DEFAULT_IO_TIMEOUT);
+					goto retry_write;
 				}
 				done_index = page->index + 1;
 				done = 1;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6ddb98ff0b7c..dbd650a5a8fc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4501,6 +4501,12 @@ static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
 }
 
+static inline void f2fs_io_schedule_timeout(long timeout)
+{
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	io_schedule_timeout(timeout);
+}
+
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 56211e201d51..885b27d7e491 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -313,8 +313,7 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
 skip:
 		iput(inode);
 	}
-	congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
-	cond_resched();
+	f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	if (gc_failure) {
 		if (++looped >= count)
 			return;
@@ -803,8 +802,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 		do {
 			ret = __submit_flush_wait(sbi, FDEV(i).bdev);
 			if (ret)
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 		} while (ret && --count);
 
 		if (ret) {
@@ -3137,7 +3135,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 			goto next;
 		}
 skip:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9af6c20532ec..f484a839fc52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2135,8 +2135,7 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	/* we should flush all the data to keep data consistency */
 	do {
 		sync_inodes_sb(sbi->sb);
-		cond_resched();
-		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+		f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
 
 	if (unlikely(retry < 0))
@@ -2504,8 +2503,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 							&page, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 				goto retry;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-- 
2.35.0.rc0.227.g00780c9af4-goog

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
