Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA7747160
	for <lists+drbd-dev@lfdr.de>; Tue,  4 Jul 2023 14:29:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5BD94252BD;
	Tue,  4 Jul 2023 14:29:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A630742036A
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jul 2023 14:28:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D9E422868;
	Tue,  4 Jul 2023 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688473345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Y5Z0PpLwK7LWiMwHAJV3g58wt4Pu7/r/oCMflfsspxI=;
	b=Yfx9ztWkVatt0fVfNPxdamFDjV837Nu56ImHpS3yWvwdcdXXyeJ1ONnOd+6RA+xJckyxi2
	Fr1h4BOlDMHKk2yJxxmlop9vtybjvkzPRI8sOxjaR75gWlVSNQjeXkVo/sHlsqPbUV+LJG
	uG3Fi84JhxR4KPvRm9XoLJxwd0lLAD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688473345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Y5Z0PpLwK7LWiMwHAJV3g58wt4Pu7/r/oCMflfsspxI=;
	b=vF6CF3OlMOzmEcsCihpnKLEsv6y6u4duYbSxFgbJ4TrA9OaJnML/9G2T1z6YHtiVQ3zwq6
	zVCIM6qtTQOYAOBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 433C713A97;
	Tue,  4 Jul 2023 12:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id fiTSDwEPpGQQMAAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 04 Jul 2023 12:22:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 97B9EA0763; Tue,  4 Jul 2023 14:22:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-block@vger.kernel.org>
Date: Tue,  4 Jul 2023 14:21:28 +0200
Message-Id: <20230704122224.16257-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230629165206.383-1-jack@suse.cz>
References: <20230629165206.383-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5599; i=jack@suse.cz;
	h=from:subject; bh=repJSb0/C5PfG8Cx5q/n/kNJZOabhc2tYWxiICNNTtg=;
	b=owGbwMvMwME4Z+4qdvsUh5uMp9WSGFKW8J3uuK2gorZt+knOzhX81snTGX/57phWXzfXM3w+50Xl
	rfb7OxmNWRgYORhkxRRZVkde1L42z6hra6iGDMwgViaQKQxcnAIwERsLDobphetsJoi99quKYIut26
	wgv/K+lUS+secym02t85epsOp8rtu3acJMN1WFRiX1irKCnSu+LXh+rVyp65RAEGttl+XcP32mOR0n
	ZJYFm7orF8YFnhVftYzZjm2Rva3I0oqXdap/bUJr8qNjVVfHnBRiFEv0Ocgpck1jlTHfEWUu71NrKu
	8EXrbnsfD7wm1qKHDqnnnD21y1n9OFHn8/7qJz4O19panPLvMxrOrNn970IcH6rnhQsq0ZS1v6JUfN
	RS5ah5XMXNI/c14+vVlVkPVI9n2HQNZlEfdsO13VFx17Z7f0vKnN9UZZ3Zii6WbsWS81/qefFs1Ljl
	+dK1sZIpSRdXfx+jksz9T4il4AAA==
X-Developer-Key: i=jack@suse.cz; a=openpgp;
	fpr=93C6099A142276A28BBE35D815BC833443038D8C
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-nvme@lists.infradead.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jack Wang <jinpu.wang@ionos.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, Gao Xiang <xiang@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
	Mike Snitzer <snitzer@kernel.org>, Chao Yu <chao@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	reiserfs-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	linux-mm@kvack.org, Song Liu <song@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, Anna Schumaker <anna@kernel.org>,
	linux-fsdevel@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
	functions
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

Create struct bdev_handle that contains all parameters that need to be
passed to blkdev_put() and provide blkdev_get_handle_* functions that
return this structure instead of plain bdev pointer. This will
eventually allow us to pass one more argument to blkdev_put() without
too much hassle.

CC: Alasdair Kergon <agk@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Anna Schumaker <anna@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Coly Li <colyli@suse.de
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Kleikamp <shaggy@kernel.org>
CC: David Sterba <dsterba@suse.com>
CC: dm-devel@redhat.com
CC: drbd-dev@lists.linbit.com
CC: Gao Xiang <xiang@kernel.org>
CC: Jack Wang <jinpu.wang@ionos.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: jfs-discussion@lists.sourceforge.net
CC: Joern Engel <joern@lazybastard.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>
CC: Kent Overstreet <kent.overstreet@gmail.com>
CC: linux-bcache@vger.kernel.org
CC: linux-btrfs@vger.kernel.org
CC: linux-erofs@lists.ozlabs.org
CC: <linux-ext4@vger.kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
CC: linux-mm@kvack.org
CC: linux-mtd@lists.infradead.org
CC: linux-nfs@vger.kernel.org
CC: linux-nilfs@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: linux-raid@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: linux-xfs@vger.kernel.org
CC: "Md. Haris Iqbal" <haris.iqbal@ionos.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: Minchan Kim <minchan@kernel.org>
CC: ocfs2-devel@oss.oracle.com
CC: reiserfs-devel@vger.kernel.org
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Song Liu <song@kernel.org>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: target-devel@vger.kernel.org
CC: Ted Tso <tytso@mit.edu>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: xen-devel@lists.xenproject.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 block/bdev.c           | 47 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h | 10 +++++++++
 2 files changed, 57 insertions(+)

diff --git a/block/bdev.c b/block/bdev.c
index 979e28a46b98..c75de5cac2bc 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -846,6 +846,24 @@ struct block_device *blkdev_get_by_dev(dev_t dev, blk_mode_t mode, void *holder,
 }
 EXPORT_SYMBOL(blkdev_get_by_dev);
 
+struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
+		void *holder, const struct blk_holder_ops *hops)
+{
+	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
+					     GFP_KERNEL);
+	struct block_device *bdev;
+
+	if (!handle)
+		return ERR_PTR(-ENOMEM);
+	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
+	if (IS_ERR(bdev))
+		return ERR_CAST(bdev);
+	handle->bdev = bdev;
+	handle->holder = holder;
+	return handle;
+}
+EXPORT_SYMBOL(blkdev_get_handle_by_dev);
+
 /**
  * blkdev_get_by_path - open a block device by name
  * @path: path to the block device to open
@@ -884,6 +902,28 @@ struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
 }
 EXPORT_SYMBOL(blkdev_get_by_path);
 
+struct bdev_handle *blkdev_get_handle_by_path(const char *path, blk_mode_t mode,
+		void *holder, const struct blk_holder_ops *hops)
+{
+	struct bdev_handle *handle;
+	dev_t dev;
+	int error;
+
+	error = lookup_bdev(path, &dev);
+	if (error)
+		return ERR_PTR(error);
+
+	handle = blkdev_get_handle_by_dev(dev, mode, holder, hops);
+	if (!IS_ERR(handle) && (mode & BLK_OPEN_WRITE) &&
+	    bdev_read_only(handle->bdev)) {
+		blkdev_handle_put(handle);
+		return ERR_PTR(-EACCES);
+	}
+
+	return handle;
+}
+EXPORT_SYMBOL(blkdev_get_handle_by_path);
+
 void blkdev_put(struct block_device *bdev, void *holder)
 {
 	struct gendisk *disk = bdev->bd_disk;
@@ -920,6 +960,13 @@ void blkdev_put(struct block_device *bdev, void *holder)
 }
 EXPORT_SYMBOL(blkdev_put);
 
+void blkdev_handle_put(struct bdev_handle *handle)
+{
+	blkdev_put(handle->bdev, handle->holder);
+	kfree(handle);
+}
+EXPORT_SYMBOL(blkdev_handle_put);
+
 /**
  * lookup_bdev() - Look up a struct block_device by name.
  * @pathname: Name of the block device in the filesystem.
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index ed44a997f629..a910e9997ddd 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1471,14 +1471,24 @@ struct blk_holder_ops {
 #define sb_open_mode(flags) \
 	(BLK_OPEN_READ | (((flags) & SB_RDONLY) ? 0 : BLK_OPEN_WRITE))
 
+struct bdev_handle {
+	struct block_device *bdev;
+	void *holder;
+};
+
 struct block_device *blkdev_get_by_dev(dev_t dev, blk_mode_t mode, void *holder,
 		const struct blk_holder_ops *hops);
 struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
 		void *holder, const struct blk_holder_ops *hops);
+struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
+		void *holder, const struct blk_holder_ops *hops);
+struct bdev_handle *blkdev_get_handle_by_path(const char *path, blk_mode_t mode,
+		void *holder, const struct blk_holder_ops *hops);
 int bd_prepare_to_claim(struct block_device *bdev, void *holder,
 		const struct blk_holder_ops *hops);
 void bd_abort_claiming(struct block_device *bdev, void *holder);
 void blkdev_put(struct block_device *bdev, void *holder);
+void blkdev_handle_put(struct bdev_handle *handle);
 
 /* just for blk-cgroup, don't use elsewhere */
 struct block_device *blkdev_get_no_open(dev_t dev);
-- 
2.35.3

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
