Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D622BF6C
	for <lists+drbd-dev@lfdr.de>; Fri, 24 Jul 2020 09:36:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 986C74204CD;
	Fri, 24 Jul 2020 09:36:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 62F6342046D
	for <drbd-dev@lists.linbit.com>; Fri, 24 Jul 2020 09:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kdnG/8uKQIMddLsDA/8BZYPUgnH5s1kSDlqsFlCYesw=;
	b=A0XjcXi6AWg4BAiiYrfb5u7VKs
	19+wnBIlBjZAXX4zKVPektF6PWyu+DNmyLaFolk1xBy7MloHa+kvlgrss7ifjhgU6GtD3krmGSe1q
	Qob4cZHyHGbZ1xL4z4hnUo3T7euA310hpE9Ju6GccfeAQv3NRTZqqerGjyhiyAU3i2gT01UWU2wdk
	ef4MdFc2ShAPldJJulTxd0016duvA41I7W2q+KZQElydQzCvey2c4dL7RaLeWwRyoYVGgnF3CgjJb
	5Vy6ngR2mAoOWKEr+n3p/wzNiPYLuZzlS390YSpz8bv1zWAiHagpWZWbNX/eQY9fB0oM0ifalMldz
	ts0NHyKA==;
Received: from [2001:4bb8:18c:2acc:8dfe:be3c:592c:efc5] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysCy-0006Cs-5e; Fri, 24 Jul 2020 07:33:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 24 Jul 2020 09:33:06 +0200
Message-Id: <20200724073313.138789-8-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724073313.138789-1-hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 07/14] block: make QUEUE_SYSFS_BIT_FNS a little
	more useful
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

Generate the queue_sysfs_entry given that we have all the required
information for it, and rename the generated show and store methods
to match the other ones in the file.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-sysfs.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index ce418d9128a0b2..cfbb039da8751f 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -257,16 +257,16 @@ static ssize_t queue_max_hw_sectors_show(struct request_queue *q, char *page)
 	return queue_var_show(max_hw_sectors_kb, (page));
 }
 
-#define QUEUE_SYSFS_BIT_FNS(name, flag, neg)				\
+#define QUEUE_SYSFS_BIT_FNS(_name, flag, neg)				\
 static ssize_t								\
-queue_show_##name(struct request_queue *q, char *page)			\
+queue_##_name##_show(struct request_queue *q, char *page)		\
 {									\
 	int bit;							\
 	bit = test_bit(QUEUE_FLAG_##flag, &q->queue_flags);		\
 	return queue_var_show(neg ? !bit : bit, page);			\
 }									\
 static ssize_t								\
-queue_store_##name(struct request_queue *q, const char *page, size_t count) \
+queue_##_name##_store(struct request_queue *q, const char *page, size_t count) \
 {									\
 	unsigned long val;						\
 	ssize_t ret;							\
@@ -281,7 +281,12 @@ queue_store_##name(struct request_queue *q, const char *page, size_t count) \
 	else								\
 		blk_queue_flag_clear(QUEUE_FLAG_##flag, q);		\
 	return ret;							\
-}
+}									\
+static struct queue_sysfs_entry queue_##_name##_entry = {		\
+	.attr	= { .name = __stringify(_name), .mode = 0644 },		\
+	.show	= queue_##_name##_show,					\
+	.store	= queue_##_name##_store,				\
+};
 
 QUEUE_SYSFS_BIT_FNS(nonrot, NONROT, 1);
 QUEUE_SYSFS_BIT_FNS(random, ADD_RANDOM, 0);
@@ -661,12 +666,6 @@ static struct queue_sysfs_entry queue_zone_append_max_entry = {
 	.show = queue_zone_append_max_show,
 };
 
-static struct queue_sysfs_entry queue_nonrot_entry = {
-	.attr = {.name = "rotational", .mode = 0644 },
-	.show = queue_show_nonrot,
-	.store = queue_store_nonrot,
-};
-
 static struct queue_sysfs_entry queue_zoned_entry = {
 	.attr = {.name = "zoned", .mode = 0444 },
 	.show = queue_zoned_show,
@@ -699,18 +698,6 @@ static struct queue_sysfs_entry queue_rq_affinity_entry = {
 	.store = queue_rq_affinity_store,
 };
 
-static struct queue_sysfs_entry queue_iostats_entry = {
-	.attr = {.name = "iostats", .mode = 0644 },
-	.show = queue_show_iostats,
-	.store = queue_store_iostats,
-};
-
-static struct queue_sysfs_entry queue_random_entry = {
-	.attr = {.name = "add_random", .mode = 0644 },
-	.show = queue_show_random,
-	.store = queue_store_random,
-};
-
 static struct queue_sysfs_entry queue_poll_entry = {
 	.attr = {.name = "io_poll", .mode = 0644 },
 	.show = queue_poll_show,
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
