Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E50F1E0DB4
	for <lists+drbd-dev@lfdr.de>; Mon, 25 May 2020 13:48:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 75F444203E1;
	Mon, 25 May 2020 13:48:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22EE04203E1
	for <drbd-dev@lists.linbit.com>; Mon, 25 May 2020 13:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9XennrgwipSgDkcsh71JEE0YegAAd1Z7p+AJvSBp+LI=;
	b=ZUcgqvbe9pjXSixowq68xyD1+A
	jECWDJzEqXYVz4Tzq7adXDx4JV7G6zoRYEnkWuFdwWISGC6S79gzajY4IV0Cw9RPRF0ju56IXV7+j
	88UNEit+PABKAihCehQT1F4/c26kP9Beb+a6kzS2EpKuZgO7dukDWVNp9gsDkW+xNa9sHwaIwFtgo
	6c8d3/qF65NmYakyzeUO1P7HDhY4nDa+ee1+72qzGoXz0BWgsa1Rg+cFNYcTUkKEdM1hryKab0feC
	cPnX1kKw20Lq3g4Ar2809ZQSHVQjqhPtM45DIt4SWlwdrTU/PImnX6+oMwT5PIviCnQGmQdnQGaUd
	YQQO9bVQ==;
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJq-0002Y8-LA; Mon, 25 May 2020 11:30:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:12 +0200
Message-Id: <20200525113014.345997-15-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 14/16] block: remove rcu_read_lock() from
	part_stat_lock()
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

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

The RCU lock is required only in disk_map_sector_rcu() to lookup the
partition.  After that request holds reference to related hd_struct.

Replace get_cpu() with preempt_disable() - returned cpu index is unused.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
[hch: rebased]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c             | 11 ++++++++---
 include/linux/part_stat.h |  4 ++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 3e7df0a3e6bb0..1a76593276644 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -321,11 +321,12 @@ struct hd_struct *disk_map_sector_rcu(struct gendisk *disk, sector_t sector)
 	struct hd_struct *part;
 	int i;
 
+	rcu_read_lock();
 	ptbl = rcu_dereference(disk->part_tbl);
 
 	part = rcu_dereference(ptbl->last_lookup);
 	if (part && sector_in_part(part, sector) && hd_struct_try_get(part))
-		return part;
+		goto out_unlock;
 
 	for (i = 1; i < ptbl->len; i++) {
 		part = rcu_dereference(ptbl->part[i]);
@@ -339,10 +340,14 @@ struct hd_struct *disk_map_sector_rcu(struct gendisk *disk, sector_t sector)
 			if (!hd_struct_try_get(part))
 				break;
 			rcu_assign_pointer(ptbl->last_lookup, part);
-			return part;
+			goto out_unlock;
 		}
 	}
-	return &disk->part0;
+
+	part = &disk->part0;
+out_unlock:
+	rcu_read_unlock();
+	return part;
 }
 
 /**
diff --git a/include/linux/part_stat.h b/include/linux/part_stat.h
index 6644197980b92..a6b0938ce82e9 100644
--- a/include/linux/part_stat.h
+++ b/include/linux/part_stat.h
@@ -21,8 +21,8 @@ struct disk_stats {
  *
  * part_stat_read() can be called at any time.
  */
-#define part_stat_lock()	({ rcu_read_lock(); get_cpu(); })
-#define part_stat_unlock()	do { put_cpu(); rcu_read_unlock(); } while (0)
+#define part_stat_lock()	preempt_disable()
+#define part_stat_unlock()	preempt_enable()
 
 #define part_stat_get_cpu(part, field, cpu)				\
 	(per_cpu_ptr((part)->dkstats, (cpu))->field)
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
