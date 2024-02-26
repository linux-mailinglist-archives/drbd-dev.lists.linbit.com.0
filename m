Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 7205E8673BC
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:45:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC08A420651;
	Mon, 26 Feb 2024 12:45:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 942EE4205E3
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:44:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Vp6cPOGmx7IsY/Gom3ohdEDfNj/bokcwTvb4p5mmNMM=;
	b=RZa2ho0xmyB83IqBMMG7w6lFMr
	HtfiLLrvvGgbYnKWkZpXYEaSmK+/vQgubvBp20GbBCMb7+L9axatX4gh6CsP3Kqqp8/vZPdQ4jRJk
	4mFexpbZw6bT1T7vmTtZAMOehB7tJW33X7IN3ix8rPFkD9vbTrNtU6402Wf2oyq7BbnVe0gm1Okxz
	mt6Kz4zaPNdwixYoqM8GkO8JpnvqHGbihGFTTNRaXH8wqQmfTs/CeH4Np7VWn/IlcFAk3BYrDLIAz
	2vPbE4qIf8u1/o45E42l4WuJv6c4VC90kbTE0lYo1Y+kQ7JA+kCClVBZ4j8UawmS8Q2JDJHY5mC7O
	DhD8nqUg==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYFR-000000004Xt-2kh7; Mon, 26 Feb 2024 10:30:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 01/16] block: add a queue_limits_set helper
Date: Mon, 26 Feb 2024 11:29:49 +0100
Message-Id: <20240226103004.281412-2-hch@lst.de>
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

Add a small wrapper around queue_limits_commit_update for stacking
drivers that don't want to update existing limits, but set an
entirely new set.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 18 ++++++++++++++++++
 include/linux/blkdev.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index b6bbe683d218fa..1989a177be201b 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -266,6 +266,24 @@ int queue_limits_commit_update(struct request_queue *q,
 }
 EXPORT_SYMBOL_GPL(queue_limits_commit_update);
 
+/**
+ * queue_limits_commit_set - apply queue limits to queue
+ * @q:		queue to update
+ * @lim:	limits to apply
+ *
+ * Apply the limits in @lim that were freshly initialized to @q.
+ * To update existing limits use queue_limits_start_update() and
+ * queue_limits_commit_update() instead.
+ *
+ * Returns 0 if successful, else a negative error code.
+ */
+int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
+{
+	mutex_lock(&q->limits_lock);
+	return queue_limits_commit_update(q, lim);
+}
+EXPORT_SYMBOL_GPL(queue_limits_set);
+
 /**
  * blk_queue_bounce_limit - set bounce buffer limit for queue
  * @q: the request queue for the device
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index a14ea934413850..dd510ad7ce4b45 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -889,6 +889,7 @@ queue_limits_start_update(struct request_queue *q)
 }
 int queue_limits_commit_update(struct request_queue *q,
 		struct queue_limits *lim);
+int queue_limits_set(struct request_queue *q, struct queue_limits *lim);
 
 /*
  * Access functions for manipulating queue properties
-- 
2.39.2

