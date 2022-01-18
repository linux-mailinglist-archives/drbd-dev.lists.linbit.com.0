Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA834920CD
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jan 2022 09:01:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF03D420BB1;
	Tue, 18 Jan 2022 09:01:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 59246420949
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jan 2022 08:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Mjlg0k+4PavheCjtECQRQWUa0Hx79sA/tX844Pch6ns=;
	b=J16yfBYxqMqCR4/icZDJD57u2j
	DA/h/Bvx6tp5hUWp6T5hIN6kAo0h81u7VB5vX2PJFYPbA5Jip0zIxH0QF77uc+wv3Tt3bQNqL9zpU
	Xw1J5pCKIH4fMZo0zDzehCBQK4ptMHCf/kurjvoKFxzlkJPj1x3WnU1HronoCcx+5iVomGRe0jbQ5
	+9TeZAxV9SZXRFSdLXyyweZa76qUuxS8EEF2auFQY5FdB6lJIdHPnVZG9tukiFG1EbWFY3JNY3gYZ
	aZzw30AY/9fH2bVgiL3+07XqlleukFPs4e5SlLWaCZ9yT49wuT1K5cXjvZftA2oHDecikY339m78F
	GsPtzqbw==;
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9imv-000ZUu-0D; Tue, 18 Jan 2022 07:20:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:41 +0100
Message-Id: <20220118071952.1243143-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 08/19] dm-thin: use blkdev_issue_flush instead of
	open coding it
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

Use blkdev_issue_flush, which uses an on-stack bio instead of an
opencoded version with a bio embedded into struct pool.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-thin.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 76a9c2e9aeeea..411a3f56ed90c 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -282,8 +282,6 @@ struct pool {
 	struct dm_bio_prison_cell **cell_sort_array;
 
 	mempool_t mapping_pool;
-
-	struct bio flush_bio;
 };
 
 static void metadata_operation_failed(struct pool *pool, const char *op, int r);
@@ -2906,7 +2904,6 @@ static void __pool_destroy(struct pool *pool)
 	if (pool->next_mapping)
 		mempool_free(pool->next_mapping, &pool->mapping_pool);
 	mempool_exit(&pool->mapping_pool);
-	bio_uninit(&pool->flush_bio);
 	dm_deferred_set_destroy(pool->shared_read_ds);
 	dm_deferred_set_destroy(pool->all_io_ds);
 	kfree(pool);
@@ -2987,7 +2984,6 @@ static struct pool *pool_create(struct mapped_device *pool_md,
 	pool->low_water_triggered = false;
 	pool->suspended = true;
 	pool->out_of_data_space = false;
-	bio_init(&pool->flush_bio, NULL, 0);
 
 	pool->shared_read_ds = dm_deferred_set_create();
 	if (!pool->shared_read_ds) {
@@ -3194,13 +3190,8 @@ static void metadata_low_callback(void *context)
 static int metadata_pre_commit_callback(void *context)
 {
 	struct pool *pool = context;
-	struct bio *flush_bio = &pool->flush_bio;
-
-	bio_reset(flush_bio);
-	bio_set_dev(flush_bio, pool->data_dev);
-	flush_bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 
-	return submit_bio_wait(flush_bio);
+	return blkdev_issue_flush(pool->data_dev);
 }
 
 static sector_t get_dev_size(struct block_device *bdev)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
