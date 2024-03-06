Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id CD301873866
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:07:48 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 64A9042063A;
	Wed,  6 Mar 2024 15:07:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C5D44205F6
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:22 +0100 (CET)
Received: by mail-ed1-f44.google.com with SMTP id
	4fb4d7f45d1cf-5640fef9fa6so8470284a12.0
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733862;
	x=1710338662; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=+GmncMjG1GIDrKttEG+31/JHanom7hp+TnPpiKXoBMI=;
	b=CdDrEy1K7ywGpfkmPfPATrlJ4Db6GmVLpZ60IIGId/l/z0mfo/iSqGyESKMWzNTugE
	wM58S/jo75tocK42Sg6b1s0kVrZO3VIRWSBQPxWY2P3mfNADs7UHpbpBf/iU/rSTKUXu
	be4Dc35y7rwxBmopSap9V1GpUC+RGmuCida584wG1RYF9aQYNCHiKyEBJTA6HMdeaPZZ
	fwJKnrtIpD/ZMmVMikSa0wEO2YQTRw/A/tyPydlH3eeWWXdKPzMiyfmFtEDGSAza++ba
	sNn3QHVcAKwts8tCXqrkPAx8HJm5l57puXyG2Tumf0JCgiTQ/iV1PBYadM+apGjrkav4
	n2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733862; x=1710338662;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=+GmncMjG1GIDrKttEG+31/JHanom7hp+TnPpiKXoBMI=;
	b=vjO5LurWpeNS+HIIg4l0LtDQ+GL2ptG2zdkg1TvXeupUcCTyFsBnWhz/MPdco33bYL
	cwfwRXv2RqoSVkMQvOK/KVAja0ECBYZtD5Y6K7fbylzIyS19CKeEUcRh3gBHhz4x6TGy
	xzx6adexYi1pYsykI6PA2VCYP+ovbcN/JIqg59tYXKkkWYPiiUGK8BcEJFP3nPu0Pos2
	nuhPg9Mnh4hCgr3n+hZQedCfPu+DCSUJ0U+qm532QHzaJwrBkYCMVHLXDtoi0TukF3cQ
	AvwXaRtSHNcHAi2KIkyFxRWy/MTcNoukj5MTzEkL30JEDYDFvhWcs0ZAhiMCaYy/5ptl
	RVkA==
X-Gm-Message-State: AOJu0YxdEfdjZzzXHLm/tUI/yEk1krzAuD1PAijy6QuoyxzafFgfwzOg
	ej+3KrsMVyT3g1kJo7u9Q4J7bt3zTW+L2wcwUlWU11FWvsodoIbFUu9VrHJvXOe7BQ==
X-Google-Smtp-Source: AGHT+IE4Sgd2O5n0KeOZDMftBV4LfJrVCZIXfrzoDY2ETcKylWMmBMwZuuLmnebrOsGkxfNyK/He3A==
X-Received: by 2002:a05:6402:5bc4:b0:566:6e4e:cb8c with SMTP id
	gy4-20020a0564025bc400b005666e4ecb8cmr9727452edb.38.1709733861928;
	Wed, 06 Mar 2024 06:04:21 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:21 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 7/7] drbd: atomically update queue limits in
	drbd_reconsider_queue_parameters
Date: Wed,  6 Mar 2024 15:03:32 +0100
Message-Id: <20240306140332.623759-8-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240305134041.137006-1-hch@lst.de>
References: <20240305134041.137006-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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

From: Christoph Hellwig <hch@lst.de>

Switch drbd_reconsider_queue_parameters to set up the queue parameters
in an on-stack queue_limits structure and apply the atomically.  Remove
various helpers that have become so trivial that they can be folded into
drbd_reconsider_queue_parameters.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 119 ++++++++++++++---------------------
 1 file changed, 46 insertions(+), 73 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 94ed2b3ea636..fbd92803dc1d 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1216,11 +1216,6 @@ static unsigned int drbd_max_peer_bio_size(struct drbd_device *device)
 	return DRBD_MAX_BIO_SIZE;
 }
 
-static void blk_queue_discard_granularity(struct request_queue *q, unsigned int granularity)
-{
-	q->limits.discard_granularity = granularity;
-}
-
 static unsigned int drbd_max_discard_sectors(struct drbd_connection *connection)
 {
 	/* when we introduced REQ_WRITE_SAME support, we also bumped
@@ -1247,62 +1242,6 @@ static bool drbd_discard_supported(struct drbd_connection *connection,
 	return true;
 }
 
-static void decide_on_discard_support(struct drbd_device *device,
-		struct drbd_backing_dev *bdev)
-{
-	struct drbd_connection *connection =
-		first_peer_device(device)->connection;
-	struct request_queue *q = device->rq_queue;
-	unsigned int max_discard_sectors;
-
-	if (!drbd_discard_supported(connection, bdev))
-		goto not_supported;
-
-	/*
-	 * We don't care for the granularity, really.
-	 *
-	 * Stacking limits below should fix it for the local device.  Whether or
-	 * not it is a suitable granularity on the remote device is not our
-	 * problem, really. If you care, you need to use devices with similar
-	 * topology on all peers.
-	 */
-	blk_queue_discard_granularity(q, 512);
-	max_discard_sectors = drbd_max_discard_sectors(connection);
-	blk_queue_max_discard_sectors(q, max_discard_sectors);
-	return;
-
-not_supported:
-	blk_queue_discard_granularity(q, 0);
-	blk_queue_max_discard_sectors(q, 0);
-}
-
-static void fixup_write_zeroes(struct drbd_device *device, struct request_queue *q)
-{
-	/* Fixup max_write_zeroes_sectors after blk_stack_limits():
-	 * if we can handle "zeroes" efficiently on the protocol,
-	 * we want to do that, even if our backend does not announce
-	 * max_write_zeroes_sectors itself. */
-	struct drbd_connection *connection = first_peer_device(device)->connection;
-	/* If the peer announces WZEROES support, use it.  Otherwise, rather
-	 * send explicit zeroes than rely on some discard-zeroes-data magic. */
-	if (connection->agreed_features & DRBD_FF_WZEROES)
-		q->limits.max_write_zeroes_sectors = DRBD_MAX_BBIO_SECTORS;
-	else
-		q->limits.max_write_zeroes_sectors = 0;
-}
-
-static void fixup_discard_support(struct drbd_device *device, struct request_queue *q)
-{
-	unsigned int max_discard = device->rq_queue->limits.max_discard_sectors;
-	unsigned int discard_granularity =
-		device->rq_queue->limits.discard_granularity >> SECTOR_SHIFT;
-
-	if (discard_granularity > max_discard) {
-		blk_queue_discard_granularity(q, 0);
-		blk_queue_max_discard_sectors(q, 0);
-	}
-}
-
 /* This is the workaround for "bio would need to, but cannot, be split" */
 static unsigned int drbd_backing_dev_max_segments(struct drbd_device *device)
 {
@@ -1320,8 +1259,11 @@ static unsigned int drbd_backing_dev_max_segments(struct drbd_device *device)
 void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		struct drbd_backing_dev *bdev, struct o_qlim *o)
 {
+	struct drbd_connection *connection =
+		first_peer_device(device)->connection;
 	struct request_queue * const q = device->rq_queue;
 	unsigned int now = queue_max_hw_sectors(q) << 9;
+	struct queue_limits lim;
 	struct request_queue *b = NULL;
 	unsigned int new;
 
@@ -1348,24 +1290,55 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		drbd_info(device, "max BIO size = %u\n", new);
 	}
 
+	lim = queue_limits_start_update(q);
 	if (bdev) {
-		blk_set_stacking_limits(&q->limits);
-		blk_queue_max_segments(q,
-			drbd_backing_dev_max_segments(device));
+		blk_set_stacking_limits(&lim);
+		lim.max_segments = drbd_backing_dev_max_segments(device);
 	} else {
-		blk_queue_max_segments(q, BLK_MAX_SEGMENTS);
+		lim.max_segments = BLK_MAX_SEGMENTS;
 	}
 
-	blk_queue_max_hw_sectors(q, new >> SECTOR_SHIFT);
-	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
-	decide_on_discard_support(device, bdev);
+	lim.max_hw_sectors = new >> SECTOR_SHIFT;
+	lim.seg_boundary_mask = PAGE_SIZE - 1;
 
-	if (bdev) {
-		blk_stack_limits(&q->limits, &b->limits, 0);
-		disk_update_readahead(device->vdisk);
+	/*
+	 * We don't care for the granularity, really.
+	 *
+	 * Stacking limits below should fix it for the local device.  Whether or
+	 * not it is a suitable granularity on the remote device is not our
+	 * problem, really. If you care, you need to use devices with similar
+	 * topology on all peers.
+	 */
+	if (drbd_discard_supported(connection, bdev)) {
+		lim.discard_granularity = 512;
+		lim.max_hw_discard_sectors =
+			drbd_max_discard_sectors(connection);
+	} else {
+		lim.discard_granularity = 0;
+		lim.max_hw_discard_sectors = 0;
 	}
-	fixup_write_zeroes(device, q);
-	fixup_discard_support(device, q);
+
+	if (bdev)
+		blk_stack_limits(&lim, &b->limits, 0);
+
+	/*
+	 * If we can handle "zeroes" efficiently on the protocol, we want to do
+	 * that, even if our backend does not announce max_write_zeroes_sectors
+	 * itself.
+	 */
+	if (connection->agreed_features & DRBD_FF_WZEROES)
+		lim.max_write_zeroes_sectors = DRBD_MAX_BBIO_SECTORS;
+	else
+		lim.max_write_zeroes_sectors = 0;
+
+	if ((lim.discard_granularity >> SECTOR_SHIFT) >
+	    lim.max_hw_discard_sectors) {
+		lim.discard_granularity = 0;
+		lim.max_hw_discard_sectors = 0;
+	}
+
+	if (queue_limits_commit_update(q, &lim))
+		drbd_err(device, "setting new queue limits failed\n");
 }
 
 /* Starts the worker thread */
-- 
2.40.1

