Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574B2A9D83
	for <lists+drbd-dev@lfdr.de>; Fri,  6 Nov 2020 20:07:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D1CDC4207D6;
	Fri,  6 Nov 2020 20:07:42 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9E5E4207AE
	for <drbd-dev@lists.linbit.com>; Fri,  6 Nov 2020 20:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S6R/LHkwABMFjsoJfGZBhUHQ6k4Dx5wFWz0jliJ5rD4=;
	b=U1It/9VbhOthOZFs+YaVYw6zCF
	hNCoh8Q0VrrRw+fcw+giRCsYx4IzyJqpYjQUkT9hnCEW7vlBjyfGp4xQIQZdpzcZqGIczsa9Rbzeq
	csXqFZUcF409NVlMSBJ6emZObaktQ+PW12dNKE6Wt3cwNbOS6p1R+LMqGZ6N5QYbqrmyAk58AFU7i
	vOL8ZxppeFPE2SWuIK6cM1/GCx9SodNxTSAOH8MIGdsdIVTf6kNR7ak6SkuuXu0m07Pf4gSvqNRxz
	GZKRdWmd7ZGqToecIIzl+SJ6plPlZPGQgVa0wCWrE9dOJ0tigJgjfSwvF9I0uonfZF33Uc7mHc/4w
	bMzYnQig==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71l-0000vc-9Z; Fri, 06 Nov 2020 19:04:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  6 Nov 2020 20:03:19 +0100
Message-Id: <20201106190337.1973127-8-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 07/24] nbd: remove the call to set_blocksize
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

Block driver have no business setting the file system concept of a
block size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c4f9ccf5cc2ac5..f618688a196654 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -296,7 +296,7 @@ static void nbd_size_clear(struct nbd_device *nbd)
 	}
 }
 
-static void nbd_size_update(struct nbd_device *nbd, bool start)
+static void nbd_size_update(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
 	struct block_device *bdev = bdget_disk(nbd->disk, 0);
@@ -311,11 +311,9 @@ static void nbd_size_update(struct nbd_device *nbd, bool start)
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
 	set_capacity(nbd->disk, nr_sectors);
 	if (bdev) {
-		if (bdev->bd_disk) {
+		if (bdev->bd_disk)
 			bd_set_nr_sectors(bdev, nr_sectors);
-			if (start)
-				set_blocksize(bdev, config->blksize);
-		} else
+		else
 			set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
 		bdput(bdev);
 	}
@@ -329,7 +327,7 @@ static void nbd_size_set(struct nbd_device *nbd, loff_t blocksize,
 	config->blksize = blocksize;
 	config->bytesize = blocksize * nr_blocks;
 	if (nbd->task_recv != NULL)
-		nbd_size_update(nbd, false);
+		nbd_size_update(nbd);
 }
 
 static void nbd_complete_rq(struct request *req)
@@ -1309,7 +1307,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	nbd_size_update(nbd, true);
+	nbd_size_update(nbd);
 	return error;
 }
 
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
