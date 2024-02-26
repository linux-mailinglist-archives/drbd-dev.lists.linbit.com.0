Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6F867305
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:27:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF69F420618;
	Mon, 26 Feb 2024 12:27:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88BE6420605
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=r3ThMUbXihPrvcBcOHkCf9OCUiYRxiuGjTc7JZwm/9g=;
	b=N+7rBBMmM5a0PB2joJRIyFlX16
	JLg0/hMBVcEeQIp1b8+8JSZJPrGhqQNl/WErFu++TfYhCclPTbIr//9rSAcv7WUVk4cMn5mDwK32P
	qgTgfB9DTwa1dJtMey/jDERvHts9GHuuqKDeqYXeiImK782b6WhrrCXE4kv9Ua/J8RsQxpaLxU8nI
	o1B84kgjrTQ46vcs3OjxyKupMMsb3UdQE9zjlmLl+KSzkFRy0XOsvpaMDd1BZD2gHcj0DUhA94VdC
	ApCba11ze/JV6QjUvZlRA80hBP1KX8pu040scRn2QhoGj14YB4qGPh62XBA6+2r7p8pScq5X4xluq
	r0ctmohQ==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYFc-000000004bp-27l0; Mon, 26 Feb 2024 10:30:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 03/16] dm: use queue_limits_set
Date: Mon, 26 Feb 2024 11:29:51 +0100
Message-Id: <20240226103004.281412-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226103004.281412-1-hch@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Use queue_limits_set which validates the limits and takes care of
updating the readahead settings instead of directly assigning them to
the queue.  For that make sure all limits are actually updated before
the assignment.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c  |  2 +-
 drivers/md/dm-table.c | 27 ++++++++++++---------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 865fe4ebbf9b83..13865a9f89726c 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -267,7 +267,7 @@ int queue_limits_commit_update(struct request_queue *q,
 EXPORT_SYMBOL_GPL(queue_limits_commit_update);
 
 /**
- * queue_limits_commit_set - apply queue limits to queue
+ * queue_limits_set - apply queue limits to queue
  * @q:		queue to update
  * @lim:	limits to apply
  *
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 41f1d731ae5ac2..88114719fe187a 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1963,26 +1963,27 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	bool wc = false, fua = false;
 	int r;
 
-	/*
-	 * Copy table's limits to the DM device's request_queue
-	 */
-	q->limits = *limits;
-
 	if (dm_table_supports_nowait(t))
 		blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
 	else
 		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);
 
 	if (!dm_table_supports_discards(t)) {
-		q->limits.max_discard_sectors = 0;
-		q->limits.max_hw_discard_sectors = 0;
-		q->limits.discard_granularity = 0;
-		q->limits.discard_alignment = 0;
-		q->limits.discard_misaligned = 0;
+		limits->max_hw_discard_sectors = 0;
+		limits->discard_granularity = 0;
+		limits->discard_alignment = 0;
+		limits->discard_misaligned = 0;
 	}
 
+	if (!dm_table_supports_write_zeroes(t))
+		limits->max_write_zeroes_sectors = 0;
+
 	if (!dm_table_supports_secure_erase(t))
-		q->limits.max_secure_erase_sectors = 0;
+		limits->max_secure_erase_sectors = 0;
+
+	r = queue_limits_set(q, limits);
+	if (r)
+		return r;
 
 	if (dm_table_supports_flush(t, (1UL << QUEUE_FLAG_WC))) {
 		wc = true;
@@ -2007,9 +2008,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	else
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 
-	if (!dm_table_supports_write_zeroes(t))
-		q->limits.max_write_zeroes_sectors = 0;
-
 	dm_table_verify_integrity(t);
 
 	/*
@@ -2047,7 +2045,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	}
 
 	dm_update_crypto_profile(q, t);
-	disk_update_readahead(t->md->disk);
 
 	/*
 	 * Check for request-based device is left to
-- 
2.39.2

