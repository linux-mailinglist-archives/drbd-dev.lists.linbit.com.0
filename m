Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF9872099
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Mar 2024 14:43:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4662A4205D4;
	Tue,  5 Mar 2024 14:43:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 50EE34203D9
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 14:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=HGtAw79TfbpqxN7DjdZnzGM38FdIDqy2dwX3NjUJYVw=;
	b=4RndfurZVf4hgZKhOw+MHdL7Al
	XmJGWhauhoCg+bS2ZCB3elzlA+Y5V1fln1gh7uiWnD1dNfTBVbbz1oODpsJ7QSl4CXSVHK37IU+Lt
	P+7lYzbopD9yXtQJt1g34ivs/pPckR7SYjX4ryqWIEBEtN5LW+eNyb27qbq0u4o6W97MRu3xVOx7i
	0o3D7afmlSymQp8uPSvt7tAD/6tqCctHhvM+ZkOE/1dVAxQY6wUzAAkt9AzxiXLxaAtD4bbHtdCn1
	UMUzmROnQowAfrHiNz+O9oi/n+XHURck+wH+Sy0WizF2qEP6oVE0vhVDoQXLQ8rMBl/yTrdwM88M2
	P+gN80gA==;
Received: from [50.219.53.154] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhV2F-0000000DqyR-1ll0; Tue, 05 Mar 2024 13:40:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 6/7] drbd: split out a drbd_discard_supported helper
Date: Tue,  5 Mar 2024 06:40:40 -0700
Message-Id: <20240305134041.137006-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305134041.137006-1-hch@lst.de>
References: <20240305134041.137006-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
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

Add a helper to check if discard is supported for a given connection /
backing device combination.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_nl.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index a79b7fe5335de4..94ed2b3ea6361d 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1231,24 +1231,33 @@ static unsigned int drbd_max_discard_sectors(struct drbd_connection *connection)
 	return AL_EXTENT_SIZE >> 9;
 }
 
-static void decide_on_discard_support(struct drbd_device *device,
+static bool drbd_discard_supported(struct drbd_connection *connection,
 		struct drbd_backing_dev *bdev)
 {
-	struct drbd_connection *connection =
-		first_peer_device(device)->connection;
-	struct request_queue *q = device->rq_queue;
-	unsigned int max_discard_sectors;
-
 	if (bdev && !bdev_max_discard_sectors(bdev->backing_bdev))
-		goto not_supported;
+		return false;
 
 	if (connection->cstate >= C_CONNECTED &&
 	    !(connection->agreed_features & DRBD_FF_TRIM)) {
 		drbd_info(connection,
 			"peer DRBD too old, does not support TRIM: disabling discards\n");
-		goto not_supported;
+		return false;
 	}
 
+	return true;
+}
+
+static void decide_on_discard_support(struct drbd_device *device,
+		struct drbd_backing_dev *bdev)
+{
+	struct drbd_connection *connection =
+		first_peer_device(device)->connection;
+	struct request_queue *q = device->rq_queue;
+	unsigned int max_discard_sectors;
+
+	if (!drbd_discard_supported(connection, bdev))
+		goto not_supported;
+
 	/*
 	 * We don't care for the granularity, really.
 	 *
-- 
2.39.2

