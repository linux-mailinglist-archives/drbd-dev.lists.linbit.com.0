Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E7497C8D
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jan 2022 10:59:59 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8544B42A585;
	Mon, 24 Jan 2022 10:59:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6DA4C42A57F
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jan 2022 10:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VAKGKCfUBMSLG+YSR57H57ZEkLN6BewyVneVTtK6CWk=;
	b=oNwS32SfnvZJzN8YyHWJOl3UJU
	oK8E3D1k2MzQjGFbwP74nx+zncMg4ZWN26Kwvr8W7I4e9e+Y2L6hy8cpR3L2XvXtzzYDyhbNqnqQ9
	w03qKB9NAJTwCUVmpEyQq/gm6i42QNyDMbAORMlSkObthZ5e+9xBZSkWvRXDHW2RLODBCZFFBDTrs
	EMymxa1CDJEFDnU1OlGtKeq3PjJ0QNeK8lOUxAaDnGzgcQJ8d/hZdCBE6puiu59q6FQ1mBBRCIzID
	FO2pjHe0vexE4Y0H8hjmtMw3SfeAJNZX3xL/2I1jXcD18x0pr5FmgVw5oBcO8INdt0T5mPhiusMMR
	kSjMrqTQ==;
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvNz-002kEY-Se; Mon, 24 Jan 2022 09:11:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Jan 2022 10:10:59 +0100
Message-Id: <20220124091107.642561-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 11/19] rnbd-srv: remove struct rnbd_dev_blk_io
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

Only the priv field of rnbd_dev_blk_io is used, so store the value of
that in bio->bi_private directly and remove the entire bio_set overhead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-srv-dev.c |  4 +---
 drivers/block/rnbd/rnbd-srv-dev.h | 13 ++-----------
 drivers/block/rnbd/rnbd-srv.c     | 27 ++++-----------------------
 drivers/block/rnbd/rnbd-srv.h     |  1 -
 4 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
index 98d3e591a0885..c5d0a03911659 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.c
+++ b/drivers/block/rnbd/rnbd-srv-dev.c
@@ -12,8 +12,7 @@
 #include "rnbd-srv-dev.h"
 #include "rnbd-log.h"
 
-struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
-			       struct bio_set *bs)
+struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags)
 {
 	struct rnbd_dev *dev;
 	int ret;
@@ -30,7 +29,6 @@ struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
 
 	dev->blk_open_flags = flags;
 	bdevname(dev->bdev, dev->name);
-	dev->ibd_bio_set = bs;
 
 	return dev;
 
diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
index 1a14ece0be726..2c3df02b5e8ec 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.h
+++ b/drivers/block/rnbd/rnbd-srv-dev.h
@@ -14,25 +14,16 @@
 
 struct rnbd_dev {
 	struct block_device	*bdev;
-	struct bio_set		*ibd_bio_set;
 	fmode_t			blk_open_flags;
 	char			name[BDEVNAME_SIZE];
 };
 
-struct rnbd_dev_blk_io {
-	struct rnbd_dev *dev;
-	void		 *priv;
-	/* have to be last member for front_pad usage of bioset_init */
-	struct bio	bio;
-};
-
 /**
  * rnbd_dev_open() - Open a device
+ * @path:	path to open
  * @flags:	open flags
- * @bs:		bio_set to use during block io,
  */
-struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
-			       struct bio_set *bs);
+struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags);
 
 /**
  * rnbd_dev_close() - Close a device
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 6d228af1dcc35..ff9b389976078 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -116,9 +116,7 @@ rnbd_get_sess_dev(int dev_id, struct rnbd_srv_session *srv_sess)
 
 static void rnbd_dev_bi_end_io(struct bio *bio)
 {
-	struct rnbd_dev_blk_io *io = bio->bi_private;
-
-	rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
+	rnbd_endio(bio->bi_private, blk_status_to_errno(bio->bi_status));
 	bio_put(bio);
 }
 
@@ -131,7 +129,6 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 	struct rnbd_srv_sess_dev *sess_dev;
 	u32 dev_id;
 	int err;
-	struct rnbd_dev_blk_io *io;
 	struct bio *bio;
 	short prio;
 
@@ -152,7 +149,7 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 	priv->sess_dev = sess_dev;
 	priv->id = id;
 
-	bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
+	bio = bio_alloc(GFP_KERNEL, 1);
 	if (bio_add_page(bio, virt_to_page(data), datalen,
 			offset_in_page(data)) != datalen) {
 		rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
@@ -160,12 +157,8 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 		goto bio_put;
 	}
 
-	io = container_of(bio, struct rnbd_dev_blk_io, bio);
-	io->dev = sess_dev->rnbd_dev;
-	io->priv = priv;
-
 	bio->bi_end_io = rnbd_dev_bi_end_io;
-	bio->bi_private = io;
+	bio->bi_private = priv;
 	bio->bi_opf = rnbd_to_bio_flags(le32_to_cpu(msg->rw));
 	bio->bi_iter.bi_sector = le64_to_cpu(msg->sector);
 	bio->bi_iter.bi_size = le32_to_cpu(msg->bi_size);
@@ -260,7 +253,6 @@ static void destroy_sess(struct rnbd_srv_session *srv_sess)
 
 out:
 	xa_destroy(&srv_sess->index_idr);
-	bioset_exit(&srv_sess->sess_bio_set);
 
 	pr_info("RTRS Session %s disconnected\n", srv_sess->sessname);
 
@@ -289,16 +281,6 @@ static int create_sess(struct rtrs_srv_sess *rtrs)
 		return -ENOMEM;
 
 	srv_sess->queue_depth = rtrs_srv_get_queue_depth(rtrs);
-	err = bioset_init(&srv_sess->sess_bio_set, srv_sess->queue_depth,
-			  offsetof(struct rnbd_dev_blk_io, bio),
-			  BIOSET_NEED_BVECS);
-	if (err) {
-		pr_err("Allocating srv_session for path %s failed\n",
-		       pathname);
-		kfree(srv_sess);
-		return err;
-	}
-
 	xa_init_flags(&srv_sess->index_idr, XA_FLAGS_ALLOC);
 	INIT_LIST_HEAD(&srv_sess->sess_dev_list);
 	mutex_init(&srv_sess->lock);
@@ -747,8 +729,7 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
 		goto reject;
 	}
 
-	rnbd_dev = rnbd_dev_open(full_path, open_flags,
-				 &srv_sess->sess_bio_set);
+	rnbd_dev = rnbd_dev_open(full_path, open_flags);
 	if (IS_ERR(rnbd_dev)) {
 		pr_err("Opening device '%s' on session %s failed, failed to open the block device, err: %ld\n",
 		       full_path, srv_sess->sessname, PTR_ERR(rnbd_dev));
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index e5604bce123ab..be2ae486d407e 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -23,7 +23,6 @@ struct rnbd_srv_session {
 	struct rtrs_srv_sess	*rtrs;
 	char			sessname[NAME_MAX];
 	int			queue_depth;
-	struct bio_set		sess_bio_set;
 
 	struct xarray		index_idr;
 	/* List of struct rnbd_srv_sess_dev */
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
