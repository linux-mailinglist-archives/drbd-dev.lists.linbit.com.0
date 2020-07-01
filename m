Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 794DC2107F9
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Jul 2020 11:25:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5D0434203ED;
	Wed,  1 Jul 2020 11:25:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D64D4203F1
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 11:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ku+5GjH8zw0sgTMrbEULwF4NzqIBXBwEjjtLU2qAwlM=;
	b=er4MMFOQrl/EQTzzOFx0jLMbL1
	2BlAhROcLRQHs9N0QXhFPhvJi5+bfLZK4yDkD37adIF+HBxn4T+r0YwAfPFqkS8QBbPUrpqM0vPmv
	n6/o4vznQwr5Jx5hrVCzh37vvRP9Nm6lJIjoGRCnfYMQ4u+ytmJUSb7Z5F/jEOpblD+kLEHkPAvKA
	/cUETJzHINIg4mXF7ZiPlJ2gV0swogcP08o6R9OZWnq9qtmFx4RVgfyl/htLKpDJAk0BLey0yKXj8
	2lCydjn5ZnyasyjctAWiTxlbip2/b5l4Gh9+vEK3rFp7qHvA2yC+BHttT9Ob1ID7leVLa595lMtoe
	BTI41cJw==;
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYhG-0000hm-Tw; Wed, 01 Jul 2020 09:06:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 11:06:20 +0200
Message-Id: <20200701090622.3354860-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	linux-btrfs@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/4] writeback: remove {set,clear}_wb_congested
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

Just merge them into their only callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/backing-dev-defs.h | 14 ++------------
 mm/backing-dev.c                 | 12 ++++++------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/include/linux/backing-dev-defs.h b/include/linux/backing-dev-defs.h
index 90a7e844a098f3..cc5aa1f32b91f0 100644
--- a/include/linux/backing-dev-defs.h
+++ b/include/linux/backing-dev-defs.h
@@ -232,18 +232,8 @@ enum {
 	BLK_RW_SYNC	= 1,
 };
 
-void clear_wb_congested(struct bdi_writeback_congested *congested, int sync);
-void set_wb_congested(struct bdi_writeback_congested *congested, int sync);
-
-static inline void clear_bdi_congested(struct backing_dev_info *bdi, int sync)
-{
-	clear_wb_congested(bdi->wb.congested, sync);
-}
-
-static inline void set_bdi_congested(struct backing_dev_info *bdi, int sync)
-{
-	set_wb_congested(bdi->wb.congested, sync);
-}
+void clear_bdi_congested(struct backing_dev_info *bdi, int sync);
+void set_bdi_congested(struct backing_dev_info *bdi, int sync);
 
 struct wb_lock_cookie {
 	bool locked;
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index d382272bcc3100..3ebe5144a102f2 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1047,29 +1047,29 @@ static wait_queue_head_t congestion_wqh[2] = {
 	};
 static atomic_t nr_wb_congested[2];
 
-void clear_wb_congested(struct bdi_writeback_congested *congested, int sync)
+void clear_bdi_congested(struct backing_dev_info *bdi, int sync)
 {
 	wait_queue_head_t *wqh = &congestion_wqh[sync];
 	enum wb_congested_state bit;
 
 	bit = sync ? WB_sync_congested : WB_async_congested;
-	if (test_and_clear_bit(bit, &congested->state))
+	if (test_and_clear_bit(bit, &bdi->wb.congested->state))
 		atomic_dec(&nr_wb_congested[sync]);
 	smp_mb__after_atomic();
 	if (waitqueue_active(wqh))
 		wake_up(wqh);
 }
-EXPORT_SYMBOL(clear_wb_congested);
+EXPORT_SYMBOL(clear_bdi_congested);
 
-void set_wb_congested(struct bdi_writeback_congested *congested, int sync)
+void set_bdi_congested(struct backing_dev_info *bdi, int sync)
 {
 	enum wb_congested_state bit;
 
 	bit = sync ? WB_sync_congested : WB_async_congested;
-	if (!test_and_set_bit(bit, &congested->state))
+	if (!test_and_set_bit(bit, &bdi->wb.congested->state))
 		atomic_inc(&nr_wb_congested[sync]);
 }
-EXPORT_SYMBOL(set_wb_congested);
+EXPORT_SYMBOL(set_bdi_congested);
 
 /**
  * congestion_wait - wait for a backing_dev to become uncongested
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
