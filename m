Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A9389712107
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 09:34:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87BE04252E9;
	Fri, 26 May 2023 09:34:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C00F7420AFF
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 09:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mp0R5kJjV9ATA7f3wCKoUGxZA6HQSlfyegxBHwX5Bjk=;
	b=JFyweRH3uI2LUIKa6CevDLZKGx
	TKIgB0Y1EjmjhgQtYqrSPkMNG5keYraDpb6BQnGzIKLhMTVo0oblR4jwgMIB6HIdUXSpGXq28Xvyh
	mtYzmXcLkLNuZP2TpCA4lzDp1RA2SxN0/ENDC+tnH0vBOiJFjpSdfkBUaUztNotfiYNvg1cz1G7/1
	zF7NHp330UXzfhSxJuQ3/eJkFTHFymVoG8RVBzcYY3SMWY45Ut2V3AZToDDkiy4FZEh+w6+Ma+nuF
	OtmnMOJt2rZqs5q6W/LuP6PHm5KmPG18Oz3Qh8+WAau3MwsT+44Wt7PDwRVd38S7pB26tTKLzCQ3m
	oxCy1d7A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1q2RxA-001RdR-3D; Fri, 26 May 2023 07:33:37 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 26 May 2023 00:33:32 -0700
Message-Id: <20230526073336.344543-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526073336.344543-1-mcgrof@kernel.org>
References: <20230526073336.344543-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, rohan.puri@samsung.com,
	da.gomez@samsung.com, mcgrof@kernel.org, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de, linux-fsdevel@vger.kernel.org,
	rpuri.linux@gmail.com, kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 1/5] block: annotate bdev_disk_changed()
	deprecation with a symbol namespace
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

This ensures no other users pop up by mistake easily and provides
us a with an easy vehicle to do the same with other routines should
we need it later.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 block/partitions/core.c         | 6 +-----
 drivers/block/loop.c            | 2 ++
 drivers/s390/block/dasd_genhd.c | 2 ++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/partitions/core.c b/block/partitions/core.c
index 49e0496ff23c..6f18444be4fe 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -690,11 +690,7 @@ int bdev_disk_changed(struct gendisk *disk, bool invalidate)
 
 	return ret;
 }
-/*
- * Only exported for loop and dasd for historic reasons.  Don't use in new
- * code!
- */
-EXPORT_SYMBOL_GPL(bdev_disk_changed);
+EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, BLOCK_DEPRECATED);
 
 void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p)
 {
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index bc31bb7072a2..50aa5b4c0c56 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -37,6 +37,8 @@
 #include <linux/spinlock.h>
 #include <uapi/linux/loop.h>
 
+MODULE_IMPORT_NS(BLOCK_DEPRECATED);
+
 /* Possible states of device */
 enum {
 	Lo_unbound,
diff --git a/drivers/s390/block/dasd_genhd.c b/drivers/s390/block/dasd_genhd.c
index 998a961e1704..5ea244aec534 100644
--- a/drivers/s390/block/dasd_genhd.c
+++ b/drivers/s390/block/dasd_genhd.c
@@ -25,6 +25,8 @@
 
 #include "dasd_int.h"
 
+MODULE_IMPORT_NS(BLOCK_DEPRECATED);
+
 static unsigned int queue_depth = 32;
 static unsigned int nr_hw_queues = 4;
 
-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
