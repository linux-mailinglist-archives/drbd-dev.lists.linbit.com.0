Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428125BAC1
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Sep 2020 08:02:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70A8B425125;
	Thu,  3 Sep 2020 08:02:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EE9BF4250F5
	for <drbd-dev@lists.linbit.com>; Thu,  3 Sep 2020 08:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lCOMSP4uMUJ3uIKDrmMJjxXVc+8ZTxkt+4XjQNLywdE=;
	b=eK9nvduJBsF3+cFTg4gaoVitAF
	+ngsBu/GQmjN2Kkei/TQJDAdcxbgEbcowO4oUhDKz/X+MpdHJ9JSsYzNgq/WuQyFdrbm6GJHZWwq4
	JrgcgyQJCGU5rIQYbwNwassLYxu40btDFlRANV2x8rC8vLwjpbiUEIdGJGVogvw/S9NBPejBnQisG
	WCF1SMA+9B/Rbj+9uxsq98RHEWSZSmNQO1U/69CerajafRbz56F/KrD4fETqj37nQXCChnxJsMFXI
	mGhsLBpRMs0vHulWMhQd5QEVMpgR1AWbiyszmK+fSirDb+Zn+WKblR08rDNIIHmvtGk5RoGT2sAyA
	4jmNJ4wA==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzi-0007Oh-UY; Thu, 03 Sep 2020 05:41:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:41:00 +0200
Message-Id: <20200903054104.228829-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 5/9] drbd: don't detour through bd_contains for
	the gendisk
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

bd_disk is set on all block devices, including those for partitions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_receiver.c | 2 +-
 drivers/block/drbd/drbd_worker.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 422363daa6180b..2d16fb0905999d 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2789,7 +2789,7 @@ bool drbd_rs_should_slow_down(struct drbd_device *device, sector_t sector,
 
 bool drbd_rs_c_min_rate_throttle(struct drbd_device *device)
 {
-	struct gendisk *disk = device->ldev->backing_bdev->bd_contains->bd_disk;
+	struct gendisk *disk = device->ldev->backing_bdev->bd_disk;
 	unsigned long db, dt, dbdt;
 	unsigned int c_min_rate;
 	int curr_events;
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 7c903de5c4e103..9107b109ba7bcb 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1672,7 +1672,7 @@ void drbd_resync_after_changed(struct drbd_device *device)
 
 void drbd_rs_controller_reset(struct drbd_device *device)
 {
-	struct gendisk *disk = device->ldev->backing_bdev->bd_contains->bd_disk;
+	struct gendisk *disk = device->ldev->backing_bdev->bd_disk;
 	struct fifo_buffer *plan;
 
 	atomic_set(&device->rs_sect_in, 0);
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
