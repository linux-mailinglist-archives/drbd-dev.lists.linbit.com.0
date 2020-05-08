Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A69581CB52B
	for <lists+drbd-dev@lfdr.de>; Fri,  8 May 2020 18:48:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 937F2420413;
	Fri,  8 May 2020 18:48:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 13F624203EC
	for <drbd-dev@lists.linbit.com>; Fri,  8 May 2020 18:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rZtsV1PDBMttxVZ0UQKr9n1WRMbI8yQyqdUS8peoGRI=;
	b=lwbrDiZRTLg37IrLiDUB1xU6OB
	XQ5Yja7qHRUxU0W9ZWUn/ofYF/eNcFQEGhja1Sno6TfsoqgdOxl36hEOZBaMPzBztAndx4GWjnlFw
	ftI0M9CJzMZ7ZbReKJapBuhwamtRkaGgCNvVlT4GREU3byg+o0mo4BLbfbSJZwpYLvAW5AGuHkSmw
	IbVlPxX1BVr1XMNjcXOKVht9vSCLQD/E+FykqUvb7pBxc+gb0ZA/st2VP9Bu0mTIbFoQ2iJNgZpN1
	3Q1aZzgQ82hMy8J9tYWVlKyEFGz/MNiDE01wdHaBJ628HjW1z6HvjLHdwq8UIEHfpdeXqrN5ixxkg
	ToFrPouQ==;
Received: from [2001:4bb8:180:9d3f:90d7:9df8:7cd:3504] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX5fM-0004oE-Ap; Fri, 08 May 2020 16:16:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  8 May 2020 18:15:15 +0200
Message-Id: <20200508161517.252308-14-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508161517.252308-1-hch@lst.de>
References: <20200508161517.252308-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
	linux-kernel@vger.kernel.org, Jim Paris <jim@jtan.com>,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Joshua Morris <josh.h.morris@us.ibm.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 13/15] nvdimm/blk: stop using ->queuedata
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/blk.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 43751fab9d36a..ffe4728bad8b1 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -165,7 +165,7 @@ static int nsblk_do_bvec(struct nd_namespace_blk *nsblk,
 static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
 {
 	struct bio_integrity_payload *bip;
-	struct nd_namespace_blk *nsblk;
+	struct nd_namespace_blk *nsblk = bio->bi_disk->private_data;
 	struct bvec_iter iter;
 	unsigned long start;
 	struct bio_vec bvec;
@@ -176,7 +176,6 @@ static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
 		return BLK_QC_T_NONE;
 
 	bip = bio_integrity(bio);
-	nsblk = q->queuedata;
 	rw = bio_data_dir(bio);
 	do_acct = nd_iostat_start(bio, &start);
 	bio_for_each_segment(bvec, bio, iter) {
@@ -258,7 +257,6 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	blk_queue_max_hw_sectors(q, UINT_MAX);
 	blk_queue_logical_block_size(q, nsblk_sector_size(nsblk));
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
-	q->queuedata = nsblk;
 
 	disk = alloc_disk(0);
 	if (!disk)
@@ -268,6 +266,7 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	disk->fops		= &nd_blk_fops;
 	disk->queue		= q;
 	disk->flags		= GENHD_FL_EXT_DEVT;
+	disk->private_data	= nsblk;
 	nvdimm_namespace_disk_name(&nsblk->common, disk->disk_name);
 
 	if (devm_add_action_or_reset(dev, nd_blk_release_disk, disk))
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
