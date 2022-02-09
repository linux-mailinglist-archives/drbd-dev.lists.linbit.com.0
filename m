Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 114CD4AEC63
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 09:30:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9FBD4205DD;
	Wed,  9 Feb 2022 09:30:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 443334202F6
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 09:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JdN4fbdK7WSMBnVaS60mQB7FbW/jFBWd0pawLUyHjGA=;
	b=wHNaFwY83lay7D9iwJ8InWcr9u
	bbmb/7SzRoqUC/miWmB5j8pVQ+s5ZP0M+0ccnP8h34i2LNuszCHuDenLHxCQKV3Ahdy8bMwFEMIu4
	NFwTPcfq8Plez6YNfIROUwZX/EVyTahjZlfkxiWUVCIHtUar5yUTezFusFEwZsk61nqE31Qq0vqEi
	18vQUqtXweuevpFdt9jOU2TLuY0TupHsCYsIDPgR6IgiJmERIk/McfJGwOdNmQsUZZ7tx1fbZNO6j
	9pRc8TF8kfOQYXu+nXlr6+LS3dcBHtEbhVAbacmdcpIZAg++j1/aNJIjngRPQKlJCvXx5peQVqtNi
	k4RWA4DQ==;
Received: from [2001:4bb8:188:3efc:ea2:7599:7eeb:4b5a] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiLC-00GcBy-3d; Wed, 09 Feb 2022 08:28:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk, martin.petersen@oracle.com, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, manoj@linux.ibm.com,
	mrochs@linux.ibm.com, ukrishn@linux.ibm.com
Date: Wed,  9 Feb 2022 09:28:24 +0100
Message-Id: <20220209082828.2629273-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209082828.2629273-1-hch@lst.de>
References: <20220209082828.2629273-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/7] rnbd: drop WRITE_SAME support
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

REQ_OP_WRITE_SAME was only ever submitted by the legacy Linux zeroing
code, which has switched to use REQ_OP_WRITE_ZEROES long before rnbd was
even merged.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-clt.c   | 7 ++-----
 drivers/block/rnbd/rnbd-clt.h   | 1 -
 drivers/block/rnbd/rnbd-proto.h | 6 ------
 drivers/block/rnbd/rnbd-srv.c   | 3 +--
 4 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index c08971de369fc..dc192d2738854 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -82,7 +82,6 @@ static int rnbd_clt_set_dev_attr(struct rnbd_clt_dev *dev,
 	dev->nsectors		    = le64_to_cpu(rsp->nsectors);
 	dev->logical_block_size	    = le16_to_cpu(rsp->logical_block_size);
 	dev->physical_block_size    = le16_to_cpu(rsp->physical_block_size);
-	dev->max_write_same_sectors = le32_to_cpu(rsp->max_write_same_sectors);
 	dev->max_discard_sectors    = le32_to_cpu(rsp->max_discard_sectors);
 	dev->discard_granularity    = le32_to_cpu(rsp->discard_granularity);
 	dev->discard_alignment	    = le32_to_cpu(rsp->discard_alignment);
@@ -1359,8 +1358,6 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
 	blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
 	blk_queue_physical_block_size(dev->queue, dev->physical_block_size);
 	blk_queue_max_hw_sectors(dev->queue, dev->max_hw_sectors);
-	blk_queue_max_write_same_sectors(dev->queue,
-					 dev->max_write_same_sectors);
 
 	/*
 	 * we don't support discards to "discontiguous" segments
@@ -1610,10 +1607,10 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
 	}
 
 	rnbd_clt_info(dev,
-		       "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_write_same_sectors: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
+		       "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
 		       dev->gd->disk_name, dev->nsectors,
 		       dev->logical_block_size, dev->physical_block_size,
-		       dev->max_write_same_sectors, dev->max_discard_sectors,
+		       dev->max_discard_sectors,
 		       dev->discard_granularity, dev->discard_alignment,
 		       dev->secure_discard, dev->max_segments,
 		       dev->max_hw_sectors, dev->rotational, dev->wc, dev->fua);
diff --git a/drivers/block/rnbd/rnbd-clt.h b/drivers/block/rnbd/rnbd-clt.h
index 0c2cae7f39b9f..6946ba23d62e5 100644
--- a/drivers/block/rnbd/rnbd-clt.h
+++ b/drivers/block/rnbd/rnbd-clt.h
@@ -122,7 +122,6 @@ struct rnbd_clt_dev {
 	bool			wc;
 	bool			fua;
 	u32			max_hw_sectors;
-	u32			max_write_same_sectors;
 	u32			max_discard_sectors;
 	u32			discard_granularity;
 	u32			discard_alignment;
diff --git a/drivers/block/rnbd/rnbd-proto.h b/drivers/block/rnbd/rnbd-proto.h
index de5d5a8df81d7..3eb8b34bd1886 100644
--- a/drivers/block/rnbd/rnbd-proto.h
+++ b/drivers/block/rnbd/rnbd-proto.h
@@ -249,9 +249,6 @@ static inline u32 rnbd_to_bio_flags(u32 rnbd_opf)
 	case RNBD_OP_SECURE_ERASE:
 		bio_opf = REQ_OP_SECURE_ERASE;
 		break;
-	case RNBD_OP_WRITE_SAME:
-		bio_opf = REQ_OP_WRITE_SAME;
-		break;
 	default:
 		WARN(1, "Unknown RNBD type: %d (flags %d)\n",
 		     rnbd_op(rnbd_opf), rnbd_opf);
@@ -284,9 +281,6 @@ static inline u32 rq_to_rnbd_flags(struct request *rq)
 	case REQ_OP_SECURE_ERASE:
 		rnbd_opf = RNBD_OP_SECURE_ERASE;
 		break;
-	case REQ_OP_WRITE_SAME:
-		rnbd_opf = RNBD_OP_WRITE_SAME;
-		break;
 	case REQ_OP_FLUSH:
 		rnbd_opf = RNBD_OP_FLUSH;
 		break;
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 132e950685d59..0e6b5687f8321 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -548,8 +548,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
 		cpu_to_le16(rnbd_dev_get_max_segs(rnbd_dev));
 	rsp->max_hw_sectors =
 		cpu_to_le32(rnbd_dev_get_max_hw_sects(rnbd_dev));
-	rsp->max_write_same_sectors =
-		cpu_to_le32(bdev_write_same(rnbd_dev->bdev));
+	rsp->max_write_same_sectors = 0;
 	rsp->max_discard_sectors =
 		cpu_to_le32(rnbd_dev_get_max_discard_sects(rnbd_dev));
 	rsp->discard_granularity =
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
