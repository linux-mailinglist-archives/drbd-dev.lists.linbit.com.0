Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A562AEBF4
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Nov 2020 09:31:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 376BF4207ED;
	Wed, 11 Nov 2020 09:31:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 35EA74207CF
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 09:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sleWhQz8pOnJuBnS8tyNBOSxS3LFjGP3TCWYI+Y9Xwo=;
	b=SnGVq269/UTvePhazhsGEqe1g4
	+Sdxfj0JE1XKc8hE5k0k3fff848q4NtXnaEE9VLg/C2I0lFuBfyREt4J81h7TQHcYmvdbPYYZExEc
	rvsv8rKBFRclcRvxaov26S6VkAKG56QaJUn2wD/mTm4/DYl8qdkAvKZ4bO76kHjl21mZEwgM+L3W8
	B0dk20R4wCMbx4pzaYw5R6GsJ3eFFwEWgkikMnu+2X9+jrMgSEIR2I0zoFfL2v0SAjEba5l3GfvGJ
	VVKXne4B7f2m79dzqfoTvI53FLRJZJnCKRBE5HBGzRzPBkuT4Wg+DmexI9Xj8bzcPW8BIeky07GCR
	w5/puTXA==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTB-0007aj-13; Wed, 11 Nov 2020 08:27:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 11 Nov 2020 09:26:42 +0100
Message-Id: <20201111082658.3401686-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 08/24] nbd: move the task_recv check into
	nbd_size_update
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

nbd_size_update is about to acquire a few more callers, so lift the check
into the function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index f618688a196654..58b7090dcbd832 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -299,8 +299,11 @@ static void nbd_size_clear(struct nbd_device *nbd)
 static void nbd_size_update(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
-	struct block_device *bdev = bdget_disk(nbd->disk, 0);
 	sector_t nr_sectors = config->bytesize >> 9;
+	struct block_device *bdev;
+
+	if (!nbd->task_recv)
+		return;
 
 	if (config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = config->blksize;
@@ -309,7 +312,9 @@ static void nbd_size_update(struct nbd_device *nbd)
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
+
 	set_capacity(nbd->disk, nr_sectors);
+	bdev = bdget_disk(nbd->disk, 0);
 	if (bdev) {
 		if (bdev->bd_disk)
 			bd_set_nr_sectors(bdev, nr_sectors);
@@ -326,8 +331,7 @@ static void nbd_size_set(struct nbd_device *nbd, loff_t blocksize,
 	struct nbd_config *config = nbd->config;
 	config->blksize = blocksize;
 	config->bytesize = blocksize * nr_blocks;
-	if (nbd->task_recv != NULL)
-		nbd_size_update(nbd);
+	nbd_size_update(nbd);
 }
 
 static void nbd_complete_rq(struct request *req)
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
