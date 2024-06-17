Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF290A5CD
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 08:30:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B51964208F7;
	Mon, 17 Jun 2024 08:30:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B322420885
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 08:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sVPSgMGllCuuf3AHxeXTZ5uQtffNoK6cimLoRUqfpII=;
	b=VioNQoDuEPZXCsKlMJ8bqEiq0T
	kRBW+7G7WzsxTJ4OBci76q6USGBDDQiOfibYrttMiSM6xgfALh4eJYkdqxFkKpa0fvjzH6PCnCyq+
	ZKJWcyQ559x7OvgyNRyO76m6ErDBT2VgUaabGfSLSwYnZibkII3KKAqxNLZYVz1hAY37asOxO9J3I
	O0+z/zCRcV2GKzvDH6kzspoBq8lHRUzFkF2FhVrUNIE0TFqG5TiD/1VJMeLWPvEK26w6rEkb+t/4R
	Peq6bWwz+eDuzNivW/LlWb9gU264Y0QgY5uwQWqqOfawz68inb+qcMNDkfGNqakoL9YeDx9VdO556
	pwRWtwmA==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5VJ-00000009IaG-2UjF; Mon, 17 Jun 2024 06:06:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/26] block: remove blk_flush_policy
Date: Mon, 17 Jun 2024 08:04:39 +0200
Message-ID: <20240617060532.127975-13-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
	Hannes Reinecke <hare@suse.de>, xen-devel@lists.xenproject.org,
	ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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

Fold blk_flush_policy into the only caller to prepare for pending changes
to it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/blk-flush.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index c17cf8ed8113db..2234f8b3fc05f2 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -100,23 +100,6 @@ blk_get_flush_queue(struct request_queue *q, struct blk_mq_ctx *ctx)
 	return blk_mq_map_queue(q, REQ_OP_FLUSH, ctx)->fq;
 }
 
-static unsigned int blk_flush_policy(unsigned long fflags, struct request *rq)
-{
-	unsigned int policy = 0;
-
-	if (blk_rq_sectors(rq))
-		policy |= REQ_FSEQ_DATA;
-
-	if (fflags & (1UL << QUEUE_FLAG_WC)) {
-		if (rq->cmd_flags & REQ_PREFLUSH)
-			policy |= REQ_FSEQ_PREFLUSH;
-		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
-		    (rq->cmd_flags & REQ_FUA))
-			policy |= REQ_FSEQ_POSTFLUSH;
-	}
-	return policy;
-}
-
 static unsigned int blk_flush_cur_seq(struct request *rq)
 {
 	return 1 << ffz(rq->flush.seq);
@@ -399,12 +382,26 @@ bool blk_insert_flush(struct request *rq)
 {
 	struct request_queue *q = rq->q;
 	unsigned long fflags = q->queue_flags;	/* may change, cache */
-	unsigned int policy = blk_flush_policy(fflags, rq);
 	struct blk_flush_queue *fq = blk_get_flush_queue(q, rq->mq_ctx);
+	unsigned int policy = 0;
 
 	/* FLUSH/FUA request must never be merged */
 	WARN_ON_ONCE(rq->bio != rq->biotail);
 
+	if (blk_rq_sectors(rq))
+		policy |= REQ_FSEQ_DATA;
+
+	/*
+	 * Check which flushes we need to sequence for this operation.
+	 */
+	if (fflags & (1UL << QUEUE_FLAG_WC)) {
+		if (rq->cmd_flags & REQ_PREFLUSH)
+			policy |= REQ_FSEQ_PREFLUSH;
+		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
+		    (rq->cmd_flags & REQ_FUA))
+			policy |= REQ_FSEQ_POSTFLUSH;
+	}
+
 	/*
 	 * @policy now records what operations need to be done.  Adjust
 	 * REQ_PREFLUSH and FUA for the driver.
-- 
2.43.0

