Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268921080F
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Jul 2020 11:28:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C5FE4203F5;
	Wed,  1 Jul 2020 11:28:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5E3144203F6
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 11:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yZp3ZhmmnZVm/xMn8H8i+YIbZxG0gRGZfGVMIZjaPzw=;
	b=RKMWPwGhSFWRqAqKPhX/CZ8Tjr
	2y9UV+7WeqYw079kzvJhfBLKNUSnR39UjjcWcPFdEXxijNON689BbqBUoAHoa4MINvOmGyGIo8p6D
	WBJBVcdmy65C0w0U6CrySV4utK7ZZ6HyASSo1xa6KLt62iitIX6XPwRC25GJIHaUvU32tDpJxF/IZ
	VW63cu8DySq2vkkwy/xd7AUzFnf/7KsER6SY0OiH44xnptYrxnSXEmH3ZsHYzvYnVn7Ql6UghoGbc
	Rt1XjbpS7dVpsBnv4qKhpvsABOXO94ealDA3iuzJa4NI/JBfp2v9rUYzGuLm+Ykbcfs8xzOsSpYeC
	ylv9vMYg==;
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYbJ-0008HS-16; Wed, 01 Jul 2020 09:00:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 10:59:45 +0200
Message-Id: <20200701085947.3354405-19-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
References: <20200701085947.3354405-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 18/20] block: refator submit_bio_noacct
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

Split out a __submit_bio_noacct helper for the actual de-recursion
algorithm, and simplify the loop by using a continue when we can't
enter the queue for a bio.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 143 +++++++++++++++++++++++++----------------------
 1 file changed, 75 insertions(+), 68 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index ff9a88d2d244cb..57b5dc00d44cb1 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1084,6 +1084,74 @@ static blk_qc_t __submit_bio(struct bio *bio)
 	return ret;
 }
 
+/*
+ * The loop in this function may be a bit non-obvious, and so deserves some
+ * explanation:
+ *
+ *  - Before entering the loop, bio->bi_next is NULL (as all callers ensure
+ *    that), so we have a list with a single bio.
+ *  - We pretend that we have just taken it off a longer list, so we assign
+ *    bio_list to a pointer to the bio_list_on_stack, thus initialising the
+ *    bio_list of new bios to be added.  ->submit_bio() may indeed add some more
+ *    bios through a recursive call to submit_bio_noacct.  If it did, we find a
+ *    non-NULL value in bio_list and re-enter the loop from the top.
+ *  - In this case we really did just take the bio of the top of the list (no
+ *    pretending) and so remove it from bio_list, and call into ->submit_bio()
+ *    again.
+ *
+ * bio_list_on_stack[0] contains bios submitted by the current ->submit_bio.
+ * bio_list_on_stack[1] contains bios that were submitted before the current
+ *	->submit_bio_bio, but that haven't been processed yet.
+ */
+static blk_qc_t __submit_bio_noacct(struct bio *bio)
+{
+	struct bio_list bio_list_on_stack[2];
+	blk_qc_t ret = BLK_QC_T_NONE;
+
+	BUG_ON(bio->bi_next);
+
+	bio_list_init(&bio_list_on_stack[0]);
+	current->bio_list = bio_list_on_stack;
+
+	do {
+		struct request_queue *q = bio->bi_disk->queue;
+		struct bio_list lower, same;
+
+		if (unlikely(bio_queue_enter(bio) != 0))
+			continue;
+
+		/*
+		 * Create a fresh bio_list for all subordinate requests.
+		 */
+		bio_list_on_stack[1] = bio_list_on_stack[0];
+		bio_list_init(&bio_list_on_stack[0]);
+
+		ret = __submit_bio(bio);
+
+		/*
+		 * Sort new bios into those for a lower level and those for the
+		 * same level.
+		 */
+		bio_list_init(&lower);
+		bio_list_init(&same);
+		while ((bio = bio_list_pop(&bio_list_on_stack[0])) != NULL)
+			if (q == bio->bi_disk->queue)
+				bio_list_add(&same, bio);
+			else
+				bio_list_add(&lower, bio);
+
+		/*
+		 * Now assemble so we handle the lowest level first.
+		 */
+		bio_list_merge(&bio_list_on_stack[0], &lower);
+		bio_list_merge(&bio_list_on_stack[0], &same);
+		bio_list_merge(&bio_list_on_stack[0], &bio_list_on_stack[1]);
+	} while ((bio = bio_list_pop(&bio_list_on_stack[0])));
+
+	current->bio_list = NULL;
+	return ret;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -1095,82 +1163,21 @@ static blk_qc_t __submit_bio(struct bio *bio)
  */
 blk_qc_t submit_bio_noacct(struct bio *bio)
 {
-	/*
-	 * bio_list_on_stack[0] contains bios submitted by the current
-	 * ->submit_bio.
-	 * bio_list_on_stack[1] contains bios that were submitted before the
-	 * current ->submit_bio_bio, but that haven't been processed yet.
-	 */
-	struct bio_list bio_list_on_stack[2];
-	blk_qc_t ret = BLK_QC_T_NONE;
-
 	if (!submit_bio_checks(bio))
-		goto out;
+		return BLK_QC_T_NONE;
 
 	/*
-	 * We only want one ->submit_bio to be active at a time, else
-	 * stack usage with stacked devices could be a problem.  So use
-	 * current->bio_list to keep a list of requests submited by a
-	 * ->submit_bio method.  current->bio_list is also used as a
-	 * flag to say if submit_bio_noacct is currently active in this
-	 * task or not.  If it is NULL, then no make_request is active.  If
-	 * it is non-NULL, then a make_request is active, and new requests
-	 * should be added at the tail
+	 * We only want one ->submit_bio to be active at a time, else stack
+	 * usage with stacked devices could be a problem.  Use current->bio_list
+	 * to collect a list of requests submited by a ->submit_bio method while
+	 * it is active, and then process them after it returned.
 	 */
 	if (current->bio_list) {
 		bio_list_add(&current->bio_list[0], bio);
-		goto out;
+		return BLK_QC_T_NONE;
 	}
 
-	/* following loop may be a bit non-obvious, and so deserves some
-	 * explanation.
-	 * Before entering the loop, bio->bi_next is NULL (as all callers
-	 * ensure that) so we have a list with a single bio.
-	 * We pretend that we have just taken it off a longer list, so
-	 * we assign bio_list to a pointer to the bio_list_on_stack,
-	 * thus initialising the bio_list of new bios to be
-	 * added.  ->submit_bio() may indeed add some more bios
-	 * through a recursive call to submit_bio_noacct.  If it
-	 * did, we find a non-NULL value in bio_list and re-enter the loop
-	 * from the top.  In this case we really did just take the bio
-	 * of the top of the list (no pretending) and so remove it from
-	 * bio_list, and call into ->submit_bio() again.
-	 */
-	BUG_ON(bio->bi_next);
-	bio_list_init(&bio_list_on_stack[0]);
-	current->bio_list = bio_list_on_stack;
-	do {
-		struct request_queue *q = bio->bi_disk->queue;
-
-		if (likely(bio_queue_enter(bio) == 0)) {
-			struct bio_list lower, same;
-
-			/* Create a fresh bio_list for all subordinate requests */
-			bio_list_on_stack[1] = bio_list_on_stack[0];
-			bio_list_init(&bio_list_on_stack[0]);
-			ret = __submit_bio(bio);
-
-			/* sort new bios into those for a lower level
-			 * and those for the same level
-			 */
-			bio_list_init(&lower);
-			bio_list_init(&same);
-			while ((bio = bio_list_pop(&bio_list_on_stack[0])) != NULL)
-				if (q == bio->bi_disk->queue)
-					bio_list_add(&same, bio);
-				else
-					bio_list_add(&lower, bio);
-			/* now assemble so we handle the lowest level first */
-			bio_list_merge(&bio_list_on_stack[0], &lower);
-			bio_list_merge(&bio_list_on_stack[0], &same);
-			bio_list_merge(&bio_list_on_stack[0], &bio_list_on_stack[1]);
-		}
-		bio = bio_list_pop(&bio_list_on_stack[0]);
-	} while (bio);
-	current->bio_list = NULL; /* deactivate */
-
-out:
-	return ret;
+	return __submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio_noacct);
 
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
