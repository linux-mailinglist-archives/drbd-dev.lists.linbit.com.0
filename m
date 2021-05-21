Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id B968938C145
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 10:06:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88E88420960;
	Fri, 21 May 2021 10:06:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A69A42094E
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 10:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=g6mwX33ahW71DGgnPUME24YpEPNX8JCGIKMP7GFikH8=;
	b=Ojb1aPpUmy5x20RnAmlaDjjEz1
	NzzFmwp0AIDELm+ERd+5ViA9IzzZL0NGnqRzmEuITVf8aN5M3VQxEivnv9uPf4nBBoBsxuXaDWgF9
	0Lw6H/Exx3/WCugOlNZaufDJm1g1gcGl9DsKL0R9wpwZD+uISbj/KqCluMqgOTNgYQ2maN7cCa1Uo
	BEyumLPUo+vofFGSTu9gFU3M7kqQmbHhzhcQcBs+lfxXeLzKOOdg/om1KizP5/BYXT5oZnbzIZWpT
	aiebHpDuqdWpspS9rn+bhM1dfQOJMUqAGH2Uz2G1QcW/Okmpd+dKBrZuM1LNQ9aXsBqj+Ya+Hnvhl
	09pbWjfg==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1ljy4x-00Gq6W-0f; Fri, 21 May 2021 05:52:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 21 May 2021 07:51:07 +0200
Message-Id: <20210521055116.1053587-18-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 17/26] nvdimm-pmem: convert to
	blk_alloc_disk/blk_cleanup_disk
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

Convert the nvdimm-pmem driver to use the blk_alloc_disk and
blk_cleanup_disk helpers to simplify gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/pmem.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 968b8483c763..9fcd05084564 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -338,7 +338,7 @@ static void pmem_pagemap_cleanup(struct dev_pagemap *pgmap)
 	struct request_queue *q =
 		container_of(pgmap->ref, struct request_queue, q_usage_counter);
 
-	blk_cleanup_queue(q);
+	blk_cleanup_disk(queue_to_disk(q));
 }
 
 static void pmem_release_queue(void *pgmap)
@@ -361,7 +361,6 @@ static void pmem_release_disk(void *__pmem)
 	kill_dax(pmem->dax_dev);
 	put_dax(pmem->dax_dev);
 	del_gendisk(pmem->disk);
-	put_disk(pmem->disk);
 }
 
 static const struct dev_pagemap_ops fsdax_pagemap_ops = {
@@ -422,10 +421,12 @@ static int pmem_attach_disk(struct device *dev,
 		return -EBUSY;
 	}
 
-	q = blk_alloc_queue(dev_to_node(dev));
-	if (!q)
+	disk = blk_alloc_disk(nid);
+	if (!disk)
 		return -ENOMEM;
+	q = disk->queue;
 
+	pmem->disk = disk;
 	pmem->pfn_flags = PFN_DEV;
 	pmem->pgmap.ref = &q->q_usage_counter;
 	if (is_nd_pfn(dev)) {
@@ -470,11 +471,6 @@ static int pmem_attach_disk(struct device *dev,
 	if (pmem->pfn_flags & PFN_MAP)
 		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
 
-	disk = alloc_disk_node(0, nid);
-	if (!disk)
-		return -ENOMEM;
-	pmem->disk = disk;
-
 	disk->fops		= &pmem_fops;
 	disk->queue		= q;
 	disk->private_data	= pmem;
@@ -490,7 +486,6 @@ static int pmem_attach_disk(struct device *dev,
 		flags = DAXDEV_F_SYNC;
 	dax_dev = alloc_dax(pmem, disk->disk_name, &pmem_dax_ops, flags);
 	if (IS_ERR(dax_dev)) {
-		put_disk(disk);
 		return PTR_ERR(dax_dev);
 	}
 	dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
