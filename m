Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95738C28E
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 11:04:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E538420BC5;
	Fri, 21 May 2021 11:04:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C8E2420BA6
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 11:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bO+oXGA9WmLEETtk0wIIo+77NnlxzsiBizrGZOlgSHY=;
	b=m5qs8ZX/0IIcCGIriH5FAt4d8x
	mJi3+aQdE0lI+0AErD2TqsZzVR7CQ0mAKWx+Tj57wA1w6G6ElqkXfbNZtkvJcAVgydB1Zox2iMnJM
	UTScAS+nU7ct3D/7dlzYrENbQ0TLttsm/U2UkUXWyGwBBTEaJmTTo4+cWZ9uoYH12bKzM0TxtZHcK
	OWqHZCJEENW+2b/mQRmu2ADenLPb46vnthTba9uApwmH6oQRclZ5TGqhV+url+xVyuaoPVKkYfFan
	f2ZZzjRx0KjG2RhZMGH1gtDaSc7etxxqUI1vt/bPC3/24C76SF4PMzqQyXxlxdZQwmZ+ZVIer5ZMe
	9Xwdq0uQ==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1ljy4W-00Gpz2-CI; Fri, 21 May 2021 05:51:44 +0000
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
Date: Fri, 21 May 2021 07:50:58 +0200
Message-Id: <20210521055116.1053587-9-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 08/26] pktcdvd: convert to
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

Convert the pktcdvd driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/pktcdvd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index bd3556585122..f69b5c69c2a6 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2711,19 +2711,17 @@ static int pkt_setup_dev(dev_t dev, dev_t* pkt_dev)
 	pd->write_congestion_off = write_congestion_off;
 
 	ret = -ENOMEM;
-	disk = alloc_disk(1);
+	disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!disk)
 		goto out_mem;
 	pd->disk = disk;
 	disk->major = pktdev_major;
 	disk->first_minor = idx;
+	disk->minors = 1;
 	disk->fops = &pktcdvd_ops;
 	disk->flags = GENHD_FL_REMOVABLE;
 	strcpy(disk->disk_name, pd->name);
 	disk->private_data = pd;
-	disk->queue = blk_alloc_queue(NUMA_NO_NODE);
-	if (!disk->queue)
-		goto out_mem2;
 
 	pd->pkt_dev = MKDEV(pktdev_major, idx);
 	ret = pkt_new_dev(pd, dev);
@@ -2746,7 +2744,7 @@ static int pkt_setup_dev(dev_t dev, dev_t* pkt_dev)
 	return 0;
 
 out_mem2:
-	put_disk(disk);
+	blk_cleanup_disk(disk);
 out_mem:
 	mempool_exit(&pd->rb_pool);
 	kfree(pd);
@@ -2796,8 +2794,7 @@ static int pkt_remove_dev(dev_t pkt_dev)
 	pkt_dbg(1, pd, "writer unmapped\n");
 
 	del_gendisk(pd->disk);
-	blk_cleanup_queue(pd->disk->queue);
-	put_disk(pd->disk);
+	blk_cleanup_disk(pd->disk);
 
 	mempool_exit(&pd->rb_pool);
 	kfree(pd);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
