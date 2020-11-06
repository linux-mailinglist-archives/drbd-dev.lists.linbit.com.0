Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7892A9E35
	for <lists+drbd-dev@lfdr.de>; Fri,  6 Nov 2020 20:41:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D1C434207FA;
	Fri,  6 Nov 2020 20:41:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CABFA4207DB
	for <drbd-dev@lists.linbit.com>; Fri,  6 Nov 2020 20:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WafBEWtlgaGQA6gJMzw9vDCsOJAcghOtJS1v2YawlXs=;
	b=flOhs9A/3seUHab/L3fPIkhaNZ
	9UswHJ8U+Kj8ED+yShSZu6GM+08fa76LVduUB9dedyXSWnyRdFXAyFvywj+/KCSXIwAgSJSmRp82S
	oR68sdZML/aTnhokGAlqIPYaJ/BHEowfwu0siFs8kVUoyIZ8SrRGZTQ6gzKa8+ZQa1extJCjIvL1i
	g8i5qyKq2lJyPvkyGL2NnsSGowpS7lKDXuUb2uBm6SUkKi22pRV6trECh4UkMxiq1pDU2hAwMhUTo
	b4W8rz5ng0alQbIdzSFfASLY9LdhAIlkIhcvN4JB03FqWcb0jzUIyy8YalqzMOORvloskZfg0OmOB
	NMBFMKAg==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71p-0000wK-4f; Fri, 06 Nov 2020 19:04:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  6 Nov 2020 20:03:21 +0100
Message-Id: <20201106190337.1973127-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 09/24] nbd: refactor size updates
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

Merge nbd_size_set and nbd_size_update into a single function that also
updates the nbd_config fields.  This new function takes the device size
in bytes as the first argument, and the blocksize as the second argument,
simplifying the calculations required in most callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 44 ++++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 58b7090dcbd832..eb8a5da48ad75a 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -296,28 +296,30 @@ static void nbd_size_clear(struct nbd_device *nbd)
 	}
 }
 
-static void nbd_size_update(struct nbd_device *nbd)
+static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
+		loff_t blksize)
 {
-	struct nbd_config *config = nbd->config;
-	sector_t nr_sectors = config->bytesize >> 9;
 	struct block_device *bdev;
 
+	nbd->config->bytesize = bytesize;
+	nbd->config->blksize = blksize;
+
 	if (!nbd->task_recv)
 		return;
 
-	if (config->flags & NBD_FLAG_SEND_TRIM) {
-		nbd->disk->queue->limits.discard_granularity = config->blksize;
-		nbd->disk->queue->limits.discard_alignment = config->blksize;
+	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
+		nbd->disk->queue->limits.discard_granularity = blksize;
+		nbd->disk->queue->limits.discard_alignment = blksize;
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
 	}
-	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
-	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
+	blk_queue_logical_block_size(nbd->disk->queue, blksize);
+	blk_queue_physical_block_size(nbd->disk->queue, blksize);
 
-	set_capacity(nbd->disk, nr_sectors);
+	set_capacity(nbd->disk, bytesize >> 9);
 	bdev = bdget_disk(nbd->disk, 0);
 	if (bdev) {
 		if (bdev->bd_disk)
-			bd_set_nr_sectors(bdev, nr_sectors);
+			bd_set_nr_sectors(bdev, bytesize >> 9);
 		else
 			set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
 		bdput(bdev);
@@ -325,15 +327,6 @@ static void nbd_size_update(struct nbd_device *nbd)
 	kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
 }
 
-static void nbd_size_set(struct nbd_device *nbd, loff_t blocksize,
-			 loff_t nr_blocks)
-{
-	struct nbd_config *config = nbd->config;
-	config->blksize = blocksize;
-	config->bytesize = blocksize * nr_blocks;
-	nbd_size_update(nbd);
-}
-
 static void nbd_complete_rq(struct request *req)
 {
 	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
@@ -1311,7 +1304,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	nbd_size_update(nbd);
+	nbd_set_size(nbd, config->bytesize, config->blksize);
 	return error;
 }
 
@@ -1390,15 +1383,14 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 			arg = NBD_DEF_BLKSIZE;
 		if (!nbd_is_valid_blksize(arg))
 			return -EINVAL;
-		nbd_size_set(nbd, arg,
-			     div_s64(config->bytesize, arg));
+		nbd_set_size(nbd, config->bytesize, arg);
 		return 0;
 	case NBD_SET_SIZE:
-		nbd_size_set(nbd, config->blksize,
-			     div_s64(arg, config->blksize));
+		nbd_set_size(nbd, arg, config->blksize);
 		return 0;
 	case NBD_SET_SIZE_BLOCKS:
-		nbd_size_set(nbd, config->blksize, arg);
+		nbd_set_size(nbd, arg * config->blksize,
+			     config->blksize);
 		return 0;
 	case NBD_SET_TIMEOUT:
 		nbd_set_cmd_timeout(nbd, arg);
@@ -1827,7 +1819,7 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 	}
 
 	if (bytes != config->bytesize || bsize != config->blksize)
-		nbd_size_set(nbd, bsize, div64_u64(bytes, bsize));
+		nbd_set_size(nbd, bytes, bsize);
 	return 0;
 }
 
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
