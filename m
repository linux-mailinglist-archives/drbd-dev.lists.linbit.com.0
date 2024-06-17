Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8190A5AF
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 08:26:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F93E420643;
	Mon, 17 Jun 2024 08:26:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA87042082A
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 08:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2dJaKm+BiJU63q3gsUH9CigfskC7JViz+3jaXw01E7A=;
	b=cxeYm0s4jsdRICZx6Akc8m8YW0
	Vhg2XDQtqPhW8I5iZePpDw/KVGsnwdOXfi8cFLWWV/vXN0xw8NTf3V+4woZ2ho3pjGbqoItr8OmVf
	Slhx60fOBSbNZsp/9OGIYvEqktRv+mZiesbKTkVn/anOSDVkbAxUNBL68y9izw7KJFTrrygTli3yu
	lI/Gj2E/n90v/so3fqDa6E0MrtzF72AmZmkARep2ZEflW4Mx9wtBDqVf/JDdhn/dW/l1gsTtLd9mR
	M5hcXxZ7w/wGUQpXtg92QLft3PW+URqUhXTExz50qWMEEWVoH1fCBgauJxK+iVm5ALicFD+T4oAaH
	4buMaMNQ==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5Vm-00000009J1l-1XQN; Mon, 17 Jun 2024 06:06:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 20/26] block: move the dax flag to queue_limits
Date: Mon, 17 Jun 2024 08:04:47 +0200
Message-ID: <20240617060532.127975-21-hch@lst.de>
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
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
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

Move the dax flag into the queue_limits feature field so that it can be
set atomically with the queue frozen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-mq-debugfs.c       | 1 -
 drivers/md/dm-table.c        | 4 ++--
 drivers/nvdimm/pmem.c        | 7 ++-----
 drivers/s390/block/dcssblk.c | 2 +-
 include/linux/blkdev.h       | 6 ++++--
 5 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 62b132e9a9ce3b..f4fa820251ce83 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -88,7 +88,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(SAME_FORCE),
 	QUEUE_FLAG_NAME(INIT_DONE),
 	QUEUE_FLAG_NAME(POLL),
-	QUEUE_FLAG_NAME(DAX),
 	QUEUE_FLAG_NAME(STATS),
 	QUEUE_FLAG_NAME(REGISTERED),
 	QUEUE_FLAG_NAME(QUIESCED),
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 84d636712c7284..e44697037e86f4 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1834,11 +1834,11 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		limits->features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
 
 	if (dm_table_supports_dax(t, device_not_dax_capable)) {
-		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
+		limits->features |= BLK_FEAT_DAX;
 		if (dm_table_supports_dax(t, device_not_dax_synchronous_capable))
 			set_dax_synchronous(t->md->dax_dev);
 	} else
-		blk_queue_flag_clear(QUEUE_FLAG_DAX, q);
+		limits->features &= ~BLK_FEAT_DAX;
 
 	if (dm_table_any_dev_attr(t, device_dax_write_cache_enabled, NULL))
 		dax_write_cache(t->md->dax_dev, true);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index b821dcf018f6ae..1dd74c969d5a09 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -465,7 +465,6 @@ static int pmem_attach_disk(struct device *dev,
 	struct dax_device *dax_dev;
 	struct nd_pfn_sb *pfn_sb;
 	struct pmem_device *pmem;
-	struct request_queue *q;
 	struct gendisk *disk;
 	void *addr;
 	int rc;
@@ -499,6 +498,8 @@ static int pmem_attach_disk(struct device *dev,
 	}
 	if (fua)
 		lim.features |= BLK_FEAT_FUA;
+	if (is_nd_pfn(dev))
+		lim.features |= BLK_FEAT_DAX;
 
 	if (!devm_request_mem_region(dev, res->start, resource_size(res),
 				dev_name(&ndns->dev))) {
@@ -509,7 +510,6 @@ static int pmem_attach_disk(struct device *dev,
 	disk = blk_alloc_disk(&lim, nid);
 	if (IS_ERR(disk))
 		return PTR_ERR(disk);
-	q = disk->queue;
 
 	pmem->disk = disk;
 	pmem->pgmap.owner = pmem;
@@ -547,9 +547,6 @@ static int pmem_attach_disk(struct device *dev,
 	}
 	pmem->virt_addr = addr;
 
-	if (pmem->pfn_flags & PFN_MAP)
-		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
-
 	disk->fops		= &pmem_fops;
 	disk->private_data	= pmem;
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 6d1689a2717e5f..d5a5d11ae0dcdf 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -548,6 +548,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 {
 	struct queue_limits lim = {
 		.logical_block_size	= 4096,
+		.features		= BLK_FEAT_DAX,
 	};
 	int rc, i, j, num_of_segments;
 	struct dcssblk_dev_info *dev_info;
@@ -643,7 +644,6 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	dev_info->gd->fops = &dcssblk_devops;
 	dev_info->gd->private_data = dev_info;
 	dev_info->gd->flags |= GENHD_FL_NO_PART;
-	blk_queue_flag_set(QUEUE_FLAG_DAX, dev_info->gd->queue);
 
 	seg_byte_size = (dev_info->end - dev_info->start + 1);
 	set_capacity(dev_info->gd, seg_byte_size >> 9); // size in sectors
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f3d4519d609d95..7022e06a3dd9a3 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -307,6 +307,9 @@ enum {
 
 	/* supports REQ_NOWAIT */
 	BLK_FEAT_NOWAIT				= (1u << 7),
+
+	/* supports DAX */
+	BLK_FEAT_DAX				= (1u << 8),
 };
 
 /*
@@ -575,7 +578,6 @@ struct request_queue {
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
 #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
 #define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
-#define QUEUE_FLAG_DAX		19	/* device supports DAX */
 #define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
 #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
 #define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
@@ -602,7 +604,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_io_stat(q)	((q)->limits.features & BLK_FEAT_IO_STAT)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
-#define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
+#define blk_queue_dax(q)	((q)->limits.features & BLK_FEAT_DAX)
 #define blk_queue_pci_p2pdma(q)	\
 	test_bit(QUEUE_FLAG_PCI_P2PDMA, &(q)->queue_flags)
 #ifdef CONFIG_BLK_RQ_ALLOC_TIME
-- 
2.43.0

