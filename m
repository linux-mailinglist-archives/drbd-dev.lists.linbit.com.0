Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A920DCD7
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jun 2020 22:43:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 06CFA420385;
	Mon, 29 Jun 2020 22:43:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11F0D4202BD
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jun 2020 22:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8L8p6UbF45RVD9lwh+Y9njbbxbDNtEWDlp4D4BAc300=;
	b=fZK4xo8+3EiAVx4FIVtuNf4vAv
	zm4KGc7qiZkEK9LKiarRfAqvPpqWgTHtvE1QlHbQB0NZU32yOFMr/MNwB/ae5o6r8J1k0LS9KcWAk
	y7NYBsiVmRRcp2FQitQb40ThskDUPPDmDPYJLe8Pz2HzRaKfT30JREsrdWRxrkBie92FmSraPeTrJ
	5gSeTgEBrq4yvaPEIhmxj824T815wc+cDodRF3igQSRVwj8EWofccCOa9w/2vYmArzZqDITwIfqs4
	88J/ODZsBaLBKHJTA5Q+FqqqW0H41wxD+2jejtdQOMfQBGUmjLZbPCuBmTM01I2o9gUYysjfD3sm2
	QnEgqUIA==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzdI-0004Gf-PC; Mon, 29 Jun 2020 19:40:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:33 +0200
Message-Id: <20200629193947.2705954-7-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 06/20] rsxx: stop using ->queuedata
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

Instead of setting up the queuedata as well just use one private data
field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rsxx/dev.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/rsxx/dev.c b/drivers/block/rsxx/dev.c
index 3ba07ab30c84f5..6a4d8d26e32cbd 100644
--- a/drivers/block/rsxx/dev.c
+++ b/drivers/block/rsxx/dev.c
@@ -119,7 +119,7 @@ static void bio_dma_done_cb(struct rsxx_cardinfo *card,
 
 static blk_qc_t rsxx_make_request(struct request_queue *q, struct bio *bio)
 {
-	struct rsxx_cardinfo *card = q->queuedata;
+	struct rsxx_cardinfo *card = bio->bi_disk->private_data;
 	struct rsxx_bio_meta *bio_meta;
 	blk_status_t st = BLK_STS_IOERR;
 
@@ -267,8 +267,6 @@ int rsxx_setup_dev(struct rsxx_cardinfo *card)
 		card->queue->limits.discard_alignment   = RSXX_HW_BLK_SIZE;
 	}
 
-	card->queue->queuedata = card;
-
 	snprintf(card->gendisk->disk_name, sizeof(card->gendisk->disk_name),
 		 "rsxx%d", card->disk_id);
 	card->gendisk->major = card->major;
@@ -289,7 +287,6 @@ void rsxx_destroy_dev(struct rsxx_cardinfo *card)
 	card->gendisk = NULL;
 
 	blk_cleanup_queue(card->queue);
-	card->queue->queuedata = NULL;
 	unregister_blkdev(card->major, DRIVER_NAME);
 }
 
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
