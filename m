Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 350F125BACC
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Sep 2020 08:04:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D56C4253B8;
	Thu,  3 Sep 2020 08:04:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 57CDD425101
	for <drbd-dev@lists.linbit.com>; Thu,  3 Sep 2020 08:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uYwGVDMXHB40jgd9uVKYjeLPM/XdqdMbtHf32kGpuZo=;
	b=uNn9oGdwo0OWqccQ+kdfaUKpAZ
	b3FgK4Q9KIUCYXYSBrPhFCLkhSOFO7zvxp8GCc10MEga6TaeQRrJs9P8Ya95fluVt7QSZuuVOIal6
	DbhUGoPt2HqJXLbaShnw+fkBPxA5FNR7m/GRQdBVzh7ej6A6XiBV0XhCncSvC6Npj95+DQq9Ki02F
	4T3sj7BkCQIYpvmCMrX+FlTbfGgODBf0nmy9Dq5hPjy+JdxWxm8BqQGYO5VKNLyi4UtQUFQsoy0iF
	8mokLtzWbh7ytYPgSnDxQMaHKBzsJafd4xRiiaJpUNcJ3wJDzvyXyUpVyo89Lkfog3R4UnolwE3m3
	P1ZiW28w==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzh-0007OY-UH; Thu, 03 Sep 2020 05:41:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:40:59 +0200
Message-Id: <20200903054104.228829-5-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 4/9] md: don't detour through bd_contains for the
	gendisk
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
 drivers/md/md.c | 2 +-
 drivers/md/md.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 3f33562d10d6f5..5a0fd93769a70e 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -8444,7 +8444,7 @@ static int is_mddev_idle(struct mddev *mddev, int init)
 	idle = 1;
 	rcu_read_lock();
 	rdev_for_each_rcu(rdev, mddev) {
-		struct gendisk *disk = rdev->bdev->bd_contains->bd_disk;
+		struct gendisk *disk = rdev->bdev->bd_disk;
 		curr_events = (int)part_stat_read_accum(&disk->part0, sectors) -
 			      atomic_read(&disk->sync_io);
 		/* sync IO will cause sync_io to increase before the disk_stats
diff --git a/drivers/md/md.h b/drivers/md/md.h
index f9e2ccdd22c478..2175a5ac4f7c68 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -551,7 +551,7 @@ extern void mddev_unlock(struct mddev *mddev);
 
 static inline void md_sync_acct(struct block_device *bdev, unsigned long nr_sectors)
 {
-	atomic_add(nr_sectors, &bdev->bd_contains->bd_disk->sync_io);
+	atomic_add(nr_sectors, &bdev->bd_disk->sync_io);
 }
 
 static inline void md_sync_acct_bio(struct bio *bio, unsigned long nr_sectors)
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
