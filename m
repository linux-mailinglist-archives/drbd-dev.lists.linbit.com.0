Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36763304186
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:08:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E7E342061D;
	Tue, 26 Jan 2021 16:08:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B811742060C
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KOVL9a1MkJeVtbO5wAEfyylWZoWniZN5JlBdpQ6RLVM=;
	b=UXprdS/M6ExT6y8z2YkV6ntwGP
	omDC0ofe3OnxV6Yi9f2pOA923E0+NvR1wQq66SRHdZNqeVD0AQ/Acio/9Gjfz/d10FJCj/4OtjPPq
	5vLqgkQ6Gw3w0jW1aGI3RDIv1430L0ay0COX8MLA1pUbgCL2jA3OvOmmWJjwcwk2myTY7jXxTdmLj
	Mi4ZHZsF7s1B2FS9/PgBbHuju0uOmuX3pLQJDcXwpWqzfDAQIQJbd7/DZ2lCXEyuoiqh6J3yWSM10
	2Im25S5t/YszSEhuYaz0/qYB7rknN6NIVA+IhRXWoJioq0M/9ZpeFlFCgmoUfgLlfbp5pszdUTI5J
	oiwn5nvQ==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4Ps6-005mzo-8D; Tue, 26 Jan 2021 15:03:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:36 +0100
Message-Id: <20210126145247.1964410-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
	linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 06/17] dm-clone: use blkdev_issue_flush in
	commit_metadata
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

Use blkdev_issue_flush instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-clone-target.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index bdb255edc20043..a90bdf9b2ca6bd 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -85,12 +85,6 @@ struct clone {
 
 	struct dm_clone_metadata *cmd;
 
-	/*
-	 * bio used to flush the destination device, before committing the
-	 * metadata.
-	 */
-	struct bio flush_bio;
-
 	/* Region hydration hash table */
 	struct hash_table_bucket *ht;
 
@@ -1155,11 +1149,7 @@ static int commit_metadata(struct clone *clone, bool *dest_dev_flushed)
 		goto out;
 	}
 
-	bio_reset(&clone->flush_bio);
-	bio_set_dev(&clone->flush_bio, clone->dest_dev->bdev);
-	clone->flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
-
-	r = submit_bio_wait(&clone->flush_bio);
+	r = blkdev_issue_flush(clone->dest_dev->bdev);
 	if (unlikely(r)) {
 		__metadata_operation_failed(clone, "flush destination device", r);
 		goto out;
@@ -1886,7 +1876,6 @@ static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bio_list_init(&clone->deferred_flush_completions);
 	clone->hydration_offset = 0;
 	atomic_set(&clone->hydrations_in_flight, 0);
-	bio_init(&clone->flush_bio, NULL, 0);
 
 	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
 	if (!clone->wq) {
@@ -1958,7 +1947,6 @@ static void clone_dtr(struct dm_target *ti)
 	struct clone *clone = ti->private;
 
 	mutex_destroy(&clone->commit_lock);
-	bio_uninit(&clone->flush_bio);
 
 	for (i = 0; i < clone->nr_ctr_args; i++)
 		kfree(clone->ctr_args[i]);
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
