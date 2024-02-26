Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028586733B
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:35:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 13B9D4205F9;
	Mon, 26 Feb 2024 12:35:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 210DA4205E5
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WCouwC0fhxTIxJn2BmBN/79OSqvHAzI8vVcSvmEQk0s=;
	b=dd2k278NZjk15ed0O+I04nv46R
	DSeufO/JBPjWRZiTUAh7V6p0a3lE3XrgJ4JlMmPcaYPrTBkKIonDyRjz/X99fn3eBdZCDUWtma0Un
	Sxlf1h1RPuaBHBj3HkyVPQymGgdo4Q3KJQlc/MeAeJyJahmcCAkZ4+hOjVt7YMrLlVArx23nYnrOn
	rjPPebnDgsZPQSu2418zPeMx1Seuh6GSp+io76WKL56ywOdjrtyl3sVoomMw5Zs2ZC0EMdqv4FIh7
	NgvPxHVe5nXFB7J0RJ2G+4UilIWi/9T2B/DyjDkiblUd2O+FMThceNpKHIXhQFIuiwy1NwlgsfrOM
	+Dol9Nbw==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYFW-000000004ZZ-3G8O; Mon, 26 Feb 2024 10:30:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 02/16] block: add a queue_limits_stack_bdev helper
Date: Mon, 26 Feb 2024 11:29:50 +0100
Message-Id: <20240226103004.281412-3-hch@lst.de>
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

Add a small wrapper around blk_stack_limits that allows passing a bdev
for the bottom device and prints an error in case of misaligned
device. The name fits into the new queue limits API and the intent is
to eventually replace disk_stack_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 25 +++++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 1989a177be201b..865fe4ebbf9b83 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -891,6 +891,31 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 }
 EXPORT_SYMBOL(blk_stack_limits);
 
+/**
+ * queue_limits_stack_bdev - adjust queue_limits for stacked devices
+ * @t:	the stacking driver limits (top device)
+ * @bdev:  the underlying block device (bottom)
+ * @offset:  offset to beginning of data within component device
+ * @pfx: prefix to use for warnings logged
+ *
+ * Description:
+ *    This function is used by stacking drivers like MD and DM to ensure
+ *    that all component devices have compatible block sizes and
+ *    alignments.  The stacking driver must provide a queue_limits
+ *    struct (top) and then iteratively call the stacking function for
+ *    all component (bottom) devices.  The stacking function will
+ *    attempt to combine the values and ensure proper alignment.
+ */
+void queue_limits_stack_bdev(struct queue_limits *t, struct block_device *bdev,
+		sector_t offset, const char *pfx)
+{
+	if (blk_stack_limits(t, &bdev_get_queue(bdev)->limits,
+			get_start_sect(bdev) + offset))
+		pr_notice("%s: Warning: Device %pg is misaligned\n",
+			pfx, bdev);
+}
+EXPORT_SYMBOL_GPL(queue_limits_stack_bdev);
+
 /**
  * disk_stack_limits - adjust queue limits for stacked drivers
  * @disk:  MD/DM gendisk (top)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index dd510ad7ce4b45..285e82723d641f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -924,6 +924,8 @@ extern void blk_set_queue_depth(struct request_queue *q, unsigned int depth);
 extern void blk_set_stacking_limits(struct queue_limits *lim);
 extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 			    sector_t offset);
+void queue_limits_stack_bdev(struct queue_limits *t, struct block_device *bdev,
+		sector_t offset, const char *pfx);
 extern void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 			      sector_t offset);
 extern void blk_queue_update_dma_pad(struct request_queue *, unsigned int);
-- 
2.39.2

