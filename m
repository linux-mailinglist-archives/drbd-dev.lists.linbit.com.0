Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AB867300
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:26:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 985B142032F;
	Mon, 26 Feb 2024 12:26:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D3D644202FD
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GyO6JLPvWJHWdBIq99b9W/Hc0Q12PjuJv1kdwaFNu7o=;
	b=c/x4CZMn0JkN4okAlVoy8mGNqE
	NnvCFT20l1naRtma8XjDlDx7BCotfevwMnVY/o1zFMav3yc0HApc9dRbMKP8Y4JUW1GVTcbo44ybF
	Pt8q0CRuzdzfec9KYX+jKD4KbcMP7tAZkRALELo/FHKPXfujBZJGl8X3WZbMPHctrWVcusNHH0knE
	yYDTJSxNOCKF6l0LFMmMXBXKbjJCfZQN+5Eq3MkM9+qCmJDOY6qlzaUSFBh56VU8Z3BGLefihV3iF
	jcUAiPfDIklOvKzQkera8ZjVITMFVghOvQm7QzInWjHQrMr6rm/jjRWduVSns3xOWBeGFFIOZJlLc
	QL8aim8g==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYFy-000000004kc-0vZJ; Mon, 26 Feb 2024 10:30:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 06/16] md/raid1: use the atomic queue limit update APIs
Date: Mon, 26 Feb 2024 11:29:54 +0100
Message-Id: <20240226103004.281412-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226103004.281412-1-hch@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
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

Build the queue limits outside the queue and apply them using
queue_limits_set.  Also remove the bogus ->gendisk and ->queue NULL
checks in the are while touching it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/raid1.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 286f8b16c7bde7..752ff99736a636 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1791,10 +1791,9 @@ static int raid1_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 	for (mirror = first; mirror <= last; mirror++) {
 		p = conf->mirrors + mirror;
 		if (!p->rdev) {
-			if (mddev->gendisk)
-				disk_stack_limits(mddev->gendisk, rdev->bdev,
-						  rdev->data_offset << 9);
-
+			err = mddev_stack_new_rdev(mddev, rdev);
+			if (err)
+				return err;
 			p->head_position = 0;
 			rdev->raid_disk = mirror;
 			err = 0;
@@ -3089,9 +3088,9 @@ static struct r1conf *setup_conf(struct mddev *mddev)
 static void raid1_free(struct mddev *mddev, void *priv);
 static int raid1_run(struct mddev *mddev)
 {
+	struct queue_limits lim;
 	struct r1conf *conf;
 	int i;
-	struct md_rdev *rdev;
 	int ret;
 
 	if (mddev->level != 1) {
@@ -3118,15 +3117,12 @@ static int raid1_run(struct mddev *mddev)
 	if (IS_ERR(conf))
 		return PTR_ERR(conf);
 
-	if (mddev->queue)
-		blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
-
-	rdev_for_each(rdev, mddev) {
-		if (!mddev->gendisk)
-			continue;
-		disk_stack_limits(mddev->gendisk, rdev->bdev,
-				  rdev->data_offset << 9);
-	}
+	blk_set_stacking_limits(&lim);
+	lim.max_write_zeroes_sectors = 0;
+	mddev_stack_rdev_limits(mddev, &lim);
+	ret = queue_limits_set(mddev->queue, &lim);
+	if (ret)
+		goto abort;
 
 	mddev->degraded = 0;
 	for (i = 0; i < conf->raid_disks; i++)
-- 
2.39.2

