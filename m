Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65190A41A
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 08:08:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09F07420642;
	Mon, 17 Jun 2024 08:08:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EEE7A4203D5
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 08:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=meZuXUdMqnfJKNa8LwE+49M6ExyQLw1VDUKKaUAtY/k=;
	b=kXJ7ztHFcc1IoznmhgthEbCn2W
	e1Zl0vH8pJJ+B1epWy41WO2zQGJBi7XGUy+4DCl9YDXMqTyH3anZVULv8jW+BHuwQ85BKjVgecb4w
	hAGHoW9h4WP4v1QYat3Jf10IP4aUS7o6JZkLXgjO/8HcnWdwF4gdFcc7AKgkddhvpiw4wY1zPxXr8
	3mk8eCEPPsZL/pesCm8st49vLZsZi08TeEmgYQj7DQG8b6JLAICjztbtSkI7ROD2ePH/Irbhf7bQ+
	3BFsrlrwOKGuxd2zhlnwTsZISXTPAagKKPg7HdaG9zcqs83W9ES5qTSx7HYqlSblbPpRJLwJC6SUc
	Bt14RRKQ==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5Uz-00000009IIF-1FWI; Mon, 17 Jun 2024 06:05:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/26] loop: always update discard settings in
	loop_reconfigure_limits
Date: Mon, 17 Jun 2024 08:04:32 +0200
Message-ID: <20240617060532.127975-6-hch@lst.de>
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
	linux-s390@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
	Hannes Reinecke <hare@suse.de>, xen-devel@lists.xenproject.org,
	ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
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

Simplify loop_reconfigure_limits by always updating the discard limits.
This adds a little more work to loop_set_block_size, but doesn't change
the outcome as the discard flag won't change.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/block/loop.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index fd671028fa8554..ce197cbea5f434 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -975,8 +975,7 @@ loop_set_status_from_info(struct loop_device *lo,
 	return 0;
 }
 
-static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize,
-		bool update_discard_settings)
+static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 {
 	struct queue_limits lim;
 
@@ -984,8 +983,7 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize,
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
 	lim.io_min = bsize;
-	if (update_discard_settings)
-		loop_config_discard(lo, &lim);
+	loop_config_discard(lo, &lim);
 	return queue_limits_commit_update(lo->lo_queue, &lim);
 }
 
@@ -1086,7 +1084,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	else
 		bsize = 512;
 
-	error = loop_reconfigure_limits(lo, bsize, true);
+	error = loop_reconfigure_limits(lo, bsize);
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
 
@@ -1496,7 +1494,7 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	invalidate_bdev(lo->lo_device);
 
 	blk_mq_freeze_queue(lo->lo_queue);
-	err = loop_reconfigure_limits(lo, arg, false);
+	err = loop_reconfigure_limits(lo, arg);
 	loop_update_dio(lo);
 	blk_mq_unfreeze_queue(lo->lo_queue);
 
-- 
2.43.0

