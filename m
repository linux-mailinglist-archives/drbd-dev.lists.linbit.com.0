Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326A1E3813
	for <lists+drbd-dev@lfdr.de>; Wed, 27 May 2020 07:26:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E7384203F0;
	Wed, 27 May 2020 07:26:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A1764203B3
	for <drbd-dev@lists.linbit.com>; Wed, 27 May 2020 07:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MXWnqW/ECLPoEYUDhXXIoQmMb8HA67Uhf/bGGut9o84=;
	b=dU4IYFdGrGJ02LwrgMAzBuw1L1
	Fy6vkaFecBS3RToEwf7wyyza28rPAHoYKub+Lgc/mCWG56GSqipT0RuaEj0Q3Bsv/oOaTp8awHgO3
	ycKwAhNt3E896qAQ81wFLKOMXDV0IRvo6SCccdEKqNR3KaNYVutYI9WWM7om9Ala4Nxb9orrVQFio
	9BkblfgFB8zU8FmA8QEII+uNUu/KeBS6qDaMfhRfoF2lZiGZnu0O9+UNYXVYz1H7yGazw97sNC8d5
	40AVY/hKNnapSYEJs4sqG5UWtozjcA0jO3heikgJMjfu6F/msMA6/YAZCC/9r9FO3F38X4VeAkPms
	TIpnUibA==;
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYC-0000mh-7k; Wed, 27 May 2020 05:24:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:04 +0200
Message-Id: <20200527052419.403583-2-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 01/16] block: add disk/bio-based accounting
	helpers
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

Add two new helpers to simplify I/O accounting for bio based drivers.
Currently these drivers use the generic_start_io_acct and
generic_end_io_acct helpers which have very cumbersome calling
conventions, don't actually return the time they started accounting,
and try to deal with accounting for partitions, which can't happen
for bio based drivers.  The new helpers will be used to subsequently
replace uses of the old helpers.

The main API is the bio based wrappes in blkdev.h, but for zram
which wants to account rw_page based I/O lower level routines are
provided as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 block/blk-core.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 77e57c2e8d602..8973104f88d90 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1432,6 +1432,40 @@ void blk_account_io_start(struct request *rq, bool new_io)
 	part_stat_unlock();
 }
 
+unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
+		unsigned int op)
+{
+	struct hd_struct *part = &disk->part0;
+	const int sgrp = op_stat_group(op);
+	unsigned long now = READ_ONCE(jiffies);
+
+	part_stat_lock();
+	update_io_ticks(part, now, false);
+	part_stat_inc(part, ios[sgrp]);
+	part_stat_add(part, sectors[sgrp], sectors);
+	part_stat_local_inc(part, in_flight[op_is_write(op)]);
+	part_stat_unlock();
+
+	return now;
+}
+EXPORT_SYMBOL(disk_start_io_acct);
+
+void disk_end_io_acct(struct gendisk *disk, unsigned int op,
+		unsigned long start_time)
+{
+	struct hd_struct *part = &disk->part0;
+	const int sgrp = op_stat_group(op);
+	unsigned long now = READ_ONCE(jiffies);
+	unsigned long duration = now - start_time;
+
+	part_stat_lock();
+	update_io_ticks(part, now, true);
+	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
+	part_stat_local_dec(part, in_flight[op_is_write(op)]);
+	part_stat_unlock();
+}
+EXPORT_SYMBOL(disk_end_io_acct);
+
 /*
  * Steal bios from a request and add them to a bio list.
  * The request must not have been partially completed before.
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 7d10f4e632325..6f7ff0fa8fcf8 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1892,4 +1892,32 @@ static inline void blk_wake_io_task(struct task_struct *waiter)
 		wake_up_process(waiter);
 }
 
+unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
+		unsigned int op);
+void disk_end_io_acct(struct gendisk *disk, unsigned int op,
+		unsigned long start_time);
+
+#ifdef CONFIG_BLOCK
+/**
+ * bio_start_io_acct - start I/O accounting for bio based drivers
+ * @bio:	bio to start account for
+ *
+ * Returns the start time that should be passed back to bio_end_io_acct().
+ */
+static inline unsigned long bio_start_io_acct(struct bio *bio)
+{
+	return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bio));
+}
+
+/**
+ * bio_end_io_acct - end I/O accounting for bio based drivers
+ * @bio:	bio to end account for
+ * @start:	start time returned by bio_start_io_acct()
+ */
+static inline void bio_end_io_acct(struct bio *bio, unsigned long start_time)
+{
+	return disk_end_io_acct(bio->bi_disk, bio_op(bio), start_time);
+}
+#endif /* CONFIG_BLOCK */
+
 #endif
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
