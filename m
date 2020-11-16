Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D92B473C
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 16:03:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 759CB4207C8;
	Mon, 16 Nov 2020 16:03:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3677A4207B0
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 15:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MbR6eD8Z5sCp9HMp2xRKfZrC0GyX/16idOKOYUQxwmk=;
	b=lVGpDrCYC4uApK0HXhMfWQu//t
	v5TNY33739vaVgizhet7Btd0aO7HYFUr4uFDV+hjF3FjzaPwtVUz2Kb7kWA5WHMiCOvV1zLNOLH3Z
	xYyJ9PyjAQotPS9g4g5yfkhyuQvbAwVKYue6ztUh19mPuVx8DtNsK62BOcbCwnRTuEJ3dvoDg2ldg
	WeBaZz6b7R0R55We4FXJgz3pLCWNo1XvND1Ep24BS9hOMWi13U/CDCIc7JHWwTXem/0p/fbzf34hi
	1r3s/4MDxah8TmWEcY0L5xxJ+d6obD1qWfKT/c/iL18LhZNRmRcA2WXg5WAUiLmevTSoEYS+1X/52
	zWWV8w6g==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxY-0003mO-Ss; Mon, 16 Nov 2020 14:58:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:02 +0100
Message-Id: <20201116145809.410558-12-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 11/78] aoe: don't call set_capacity from irq
	context
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

Updating the block device size from irq context can lead to torn
writes of the 64-bit value, and prevents us from using normal
process context locking primitives to serialize access to the 64-bit
nr_sectors value.  Defer the set_capacity to the already existing
workqueue handler, where it can be merged with the update of the
block device size by using set_capacity_and_notify.  As an extra
bonus this also adds proper uevent notifications for the resize.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/aoe/aoecmd.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 313f0b946fe2b3..ac720bdcd983e7 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -890,19 +890,13 @@ void
 aoecmd_sleepwork(struct work_struct *work)
 {
 	struct aoedev *d = container_of(work, struct aoedev, work);
-	struct block_device *bd;
-	u64 ssize;
 
 	if (d->flags & DEVFL_GDALLOC)
 		aoeblk_gdalloc(d);
 
 	if (d->flags & DEVFL_NEWSIZE) {
-		ssize = get_capacity(d->gd);
-		bd = bdget_disk(d->gd, 0);
-		if (bd) {
-			bd_set_nr_sectors(bd, ssize);
-			bdput(bd);
-		}
+		set_capacity_and_notify(d->gd, d->ssize);
+
 		spin_lock_irq(&d->lock);
 		d->flags |= DEVFL_UP;
 		d->flags &= ~DEVFL_NEWSIZE;
@@ -971,10 +965,9 @@ ataid_complete(struct aoedev *d, struct aoetgt *t, unsigned char *id)
 	d->geo.start = 0;
 	if (d->flags & (DEVFL_GDALLOC|DEVFL_NEWSIZE))
 		return;
-	if (d->gd != NULL) {
-		set_capacity(d->gd, ssize);
+	if (d->gd != NULL)
 		d->flags |= DEVFL_NEWSIZE;
-	} else
+	else
 		d->flags |= DEVFL_GDALLOC;
 	schedule_work(&d->work);
 }
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
