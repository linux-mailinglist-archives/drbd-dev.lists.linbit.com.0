Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B355526483F
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Sep 2020 16:48:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8FAC6420FF3;
	Thu, 10 Sep 2020 16:48:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 23C91420FEF
	for <drbd-dev@lists.linbit.com>; Thu, 10 Sep 2020 16:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iAWmHQBw0kh6rX2xz3yUX0hw8/2a2BhJq7lAu3Cbxmg=;
	b=IN7JZpI7Qt3jhTw51rzq1KZOe3
	8pzQfiHkXBOl9r8YD/Gl8PdSA6lQWae62Sr/jpxPzIHHr5jMwEGCXuazDnNN4wdfSJoo2rjfuNZWX
	fbxYYNXXs2XXK7lQIJxt9bvqRjAAmCHbm48MDjGyEEAbuVz/AjF3hnZsggGqIaAcCTb9iPlpsY3WF
	E3WMUtZHDB4PZ/JIt7ZUpPS6ATu29C8u17ncM/42fHEyNAba/0BDVGOyRDn4VuBlkW3Ea/UZ7+TIt
	lp+eayiIP6umygg7WIuWTolnHvPAhFV3Y7AxHoPywQVRZThTno2G0mMB76A+oP2m04qwuuwud9az0
	+vOm6GnA==;
Received: from [2001:4bb8:184:af1:3ecc:ac5b:136f:434a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGNsL-0006vm-QH; Thu, 10 Sep 2020 14:48:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 Sep 2020 16:48:22 +0200
Message-Id: <20200910144833.742260-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910144833.742260-1-hch@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 02/12] drbd: remove dead code in
	device_to_statistics
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

Ever since the switch to blk-mq, a lower device not used for VM
writeback will not be marked congested, so the check will never
trigger.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_nl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 43c8ae4d9fca81..aaff5bde391506 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -3370,7 +3370,6 @@ static void device_to_statistics(struct device_statistics *s,
 	if (get_ldev(device)) {
 		struct drbd_md *md = &device->ldev->md;
 		u64 *history_uuids = (u64 *)s->history_uuids;
-		struct request_queue *q;
 		int n;
 
 		spin_lock_irq(&md->uuid_lock);
@@ -3384,11 +3383,6 @@ static void device_to_statistics(struct device_statistics *s,
 		spin_unlock_irq(&md->uuid_lock);
 
 		s->dev_disk_flags = md->flags;
-		q = bdev_get_queue(device->ldev->backing_bdev);
-		s->dev_lower_blocked =
-			bdi_congested(q->backing_dev_info,
-				      (1 << WB_async_congested) |
-				      (1 << WB_sync_congested));
 		put_ldev(device);
 	}
 	s->dev_size = drbd_get_capacity(device->this_bdev);
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
