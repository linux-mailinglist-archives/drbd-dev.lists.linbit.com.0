Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07D38C28F
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 11:05:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 78E1D420BB7;
	Fri, 21 May 2021 11:05:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ED4C1420BA7
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 11:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qpSY+0TMV+kLNfssm5yqW5PXw6929uJMh10yjO4G3Hg=;
	b=REjOcyfEWJqr1F+Dz0zsnHHh7k
	CFJeufNc2XQCjxry2qXhzZcdWYuKNubSk6Ip0JRyepquClMzNvAK1cwJDGCf7oQlZfmL2qmubz3Sa
	3DS30OGdWJUke42YryY7PJUac6hEA6fOmzKf888kUppNbcbMZRyxliw8ExySUjM7T7qES1PNURchG
	reZQ76l2KTyWSLrn2iS6wGvfjP71UejnKYwqy0z6+V+6dIp/TcXKf9XTO9kurus/aP68avlCAbWUZ
	kJXtJCv/AW2mNI38UTxbXLtzWToT1Nvc1Clan2W2Jj7CAv5tM3mqun3CXzgQQNlyk64rufwa6Er2D
	cLuVZfGw==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1ljy4T-00Gpyh-Dv; Fri, 21 May 2021 05:51:41 +0000
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
Date: Fri, 21 May 2021 07:50:57 +0200
Message-Id: <20210521055116.1053587-8-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 07/26] drbd: convert to
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

Convert the drbd driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index de463773b530..55234a558e98 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2231,8 +2231,7 @@ void drbd_destroy_device(struct kref *kref)
 	if (device->bitmap) /* should no longer be there. */
 		drbd_bm_cleanup(device);
 	__free_page(device->md_io.page);
-	put_disk(device->vdisk);
-	blk_cleanup_queue(device->rq_queue);
+	blk_cleanup_disk(device->vdisk);
 	kfree(device->rs_plan_s);
 
 	/* not for_each_connection(connection, resource):
@@ -2701,7 +2700,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	struct drbd_device *device;
 	struct drbd_peer_device *peer_device, *tmp_peer_device;
 	struct gendisk *disk;
-	struct request_queue *q;
 	int id;
 	int vnr = adm_ctx->volume;
 	enum drbd_ret_code err = ERR_NOMEM;
@@ -2723,29 +2721,26 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	drbd_init_set_defaults(device);
 
-	q = blk_alloc_queue(NUMA_NO_NODE);
-	if (!q)
-		goto out_no_q;
-	device->rq_queue = q;
-
-	disk = alloc_disk(1);
+	disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!disk)
 		goto out_no_disk;
+
 	device->vdisk = disk;
+	device->rq_queue = disk->queue;
 
 	set_disk_ro(disk, true);
 
-	disk->queue = q;
 	disk->major = DRBD_MAJOR;
 	disk->first_minor = minor;
+	disk->minors = 1;
 	disk->fops = &drbd_ops;
 	sprintf(disk->disk_name, "drbd%d", minor);
 	disk->private_data = device;
 
-	blk_queue_write_cache(q, true, true);
+	blk_queue_write_cache(disk->queue, true, true);
 	/* Setting the max_hw_sectors to an odd value of 8kibyte here
 	   This triggers a max_bio_size message upon first attach or connect */
-	blk_queue_max_hw_sectors(q, DRBD_MAX_BIO_SIZE_SAFE >> 8);
+	blk_queue_max_hw_sectors(disk->queue, DRBD_MAX_BIO_SIZE_SAFE >> 8);
 
 	device->md_io.page = alloc_page(GFP_KERNEL);
 	if (!device->md_io.page)
@@ -2834,10 +2829,8 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 out_no_bitmap:
 	__free_page(device->md_io.page);
 out_no_io_page:
-	put_disk(disk);
+	blk_cleanup_disk(disk);
 out_no_disk:
-	blk_cleanup_queue(q);
-out_no_q:
 	kref_put(&resource->kref, drbd_destroy_resource);
 	kfree(device);
 	return err;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
