Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DE2AED11
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Nov 2020 10:13:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB337420822;
	Wed, 11 Nov 2020 10:13:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BA8E42080C
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 10:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7BWzzM1ONnukKsMJYvFCtkh7Po4ojUIcRAoXEXZQpls=;
	b=RCXh8hHVKHOdlbTgZudBE0UgxQ
	OdZbQcCl+Yq46gbMhWR8GVkt7ot75syMIyMmRVs70SjQ1O8I3Qml7eCC8UgjmLw+eZKo3Y+wA2Jn3
	swdtiCKDiqLib1ChlnI43270zWz+HESqHy3CFg19CGNjMaZmfyCASYpR/6tWH4C8l/mB79/1BSWgs
	puiFVbzfVm1so5b0mSiZ9Ei1//wgG5uEkaKOW5zYLA6lZYmZLWg1vlPvHI0aYLKiQl40RWCE1w1Is
	2SNvkcNq6XAtQw8IczEREzWr5hvM924WJzBVkrt1lqmXha4587UsPlSaCJVXmHuHTxzWvnOewG4Qb
	h8NmpJFw==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTD-0007b7-Eu; Wed, 11 Nov 2020 08:27:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 11 Nov 2020 09:26:44 +0100
Message-Id: <20201111082658.3401686-11-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 10/24] nbd: validate the block size in
	nbd_set_size
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

Move the validation of the block from the callers into nbd_set_size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 47 +++++++++++++++------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index eb8a5da48ad75a..327060e01ad58e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -296,16 +296,21 @@ static void nbd_size_clear(struct nbd_device *nbd)
 	}
 }
 
-static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
+static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
 	struct block_device *bdev;
 
+	if (!blksize)
+		blksize = NBD_DEF_BLKSIZE;
+	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
+		return -EINVAL;
+
 	nbd->config->bytesize = bytesize;
 	nbd->config->blksize = blksize;
 
 	if (!nbd->task_recv)
-		return;
+		return 0;
 
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = blksize;
@@ -325,6 +330,7 @@ static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		bdput(bdev);
 	}
 	kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
+	return 0;
 }
 
 static void nbd_complete_rq(struct request *req)
@@ -1304,8 +1310,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	nbd_set_size(nbd, config->bytesize, config->blksize);
-	return error;
+	return nbd_set_size(nbd, config->bytesize, config->blksize);
 }
 
 static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
@@ -1347,14 +1352,6 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 		nbd_config_put(nbd);
 }
 
-static bool nbd_is_valid_blksize(unsigned long blksize)
-{
-	if (!blksize || !is_power_of_2(blksize) || blksize < 512 ||
-	    blksize > PAGE_SIZE)
-		return false;
-	return true;
-}
-
 static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
 {
 	nbd->tag_set.timeout = timeout * HZ;
@@ -1379,19 +1376,12 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_SOCK:
 		return nbd_add_socket(nbd, arg, false);
 	case NBD_SET_BLKSIZE:
-		if (!arg)
-			arg = NBD_DEF_BLKSIZE;
-		if (!nbd_is_valid_blksize(arg))
-			return -EINVAL;
-		nbd_set_size(nbd, config->bytesize, arg);
-		return 0;
+		return nbd_set_size(nbd, config->bytesize, arg);
 	case NBD_SET_SIZE:
-		nbd_set_size(nbd, arg, config->blksize);
-		return 0;
+		return nbd_set_size(nbd, arg, config->blksize);
 	case NBD_SET_SIZE_BLOCKS:
-		nbd_set_size(nbd, arg * config->blksize,
-			     config->blksize);
-		return 0;
+		return nbd_set_size(nbd, arg * config->blksize,
+				    config->blksize);
 	case NBD_SET_TIMEOUT:
 		nbd_set_cmd_timeout(nbd, arg);
 		return 0;
@@ -1808,18 +1798,11 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 	if (info->attrs[NBD_ATTR_SIZE_BYTES])
 		bytes = nla_get_u64(info->attrs[NBD_ATTR_SIZE_BYTES]);
 
-	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]) {
+	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES])
 		bsize = nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
-		if (!bsize)
-			bsize = NBD_DEF_BLKSIZE;
-		if (!nbd_is_valid_blksize(bsize)) {
-			printk(KERN_ERR "Invalid block size %llu\n", bsize);
-			return -EINVAL;
-		}
-	}
 
 	if (bytes != config->bytesize || bsize != config->blksize)
-		nbd_set_size(nbd, bytes, bsize);
+		return nbd_set_size(nbd, bytes, bsize);
 	return 0;
 }
 
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
