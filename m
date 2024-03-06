Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F4873845
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:04:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3458B4205F9;
	Wed,  6 Mar 2024 15:04:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 954AA4203DF
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:17 +0100 (CET)
Received: by mail-ed1-f45.google.com with SMTP id
	4fb4d7f45d1cf-566adfeced4so7368342a12.1
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733857;
	x=1710338657; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=GBW7AqjFjzB5v7jqorFXCgskxDjZ85ZOVHMqFlQBVwE=;
	b=YS9gnkSy6mAh3QUFaCFXEn16VgE7FwEPZ3AJPErdJ2kniCs5n3r+/arvJfZ9nOP4Mc
	ofQLGImMSyhas2pSJfu2GaJG014I6TpWhStd6t/+dr/MOoC6GRoUYazqOc2nfdkQbAqJ
	KNT3hlMY6AEV0MpUkxzu6sai6AE9hTgCChuQkHKldxpggEgA0NxswEbIdKqXtxggg0Hr
	ZKGTTtlb1mQvqxm4Z5RVDWraIF99bQyvEASSjiXlpQgt+qHN8UYt6QAlrwX4fMzlgHlT
	e9P9hMHuxOSpzQoqCYHWUGe20SMb7dSCqzKO+n0uemaX6DSX6TL0jPO6m4QyPtaxqrOL
	Y/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733857; x=1710338657;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=GBW7AqjFjzB5v7jqorFXCgskxDjZ85ZOVHMqFlQBVwE=;
	b=uzTa3iehXOyxIyeDIt7hWIGa/V0d8crvcJuLrNwalP8WvjLV5Sfj8erPDPRA/NC0cj
	dlmvDiXqqHQ40DNAu17s6HxqLZjlRpSDJFJUUK66v9SxWKnImrGU29zEanLSFjLunPuo
	p/jh2sRWuKQkQ5KZxWiQb+cKO+Y415BurrEOynugmE5WR7LqYemzyvPJt0xlfwgtphlA
	Q7qHmazyvxXQo7KOwD1PRveZyTS2h5eKKijSpvct/xenXTHirhJh8oawkWbGruvy85UY
	OV9gW5S/KOues8Pd7JM2fj9UEf906iVqaZTrSNU6dAeaFCixdcMA72Q9gOHVs1/BrcP3
	kbKw==
X-Gm-Message-State: AOJu0Ywv70t+wuD4QUotVTFM0UuGXbAcBHGvGCYZTE7Y94qhGwwOxvZq
	O70dexXRGnCQa+SQaaVAGBPaXiuXoHw30IgoVP/+UnGHWvJydulB2PflgHXLz0FtrQ==
X-Google-Smtp-Source: AGHT+IH8X5qutVwkgZpmXE85MQxRZM9rY+xR4zYBka/877T9qsUtMwr0urERTQjGPy27Z81odoUEyw==
X-Received: by 2002:a50:cac7:0:b0:566:d28c:e627 with SMTP id
	f7-20020a50cac7000000b00566d28ce627mr10761897edi.36.1709733856582;
	Wed, 06 Mar 2024 06:04:16 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:16 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 2/7] drbd: refactor drbd_reconsider_queue_parameters
Date: Wed,  6 Mar 2024 15:03:27 +0100
Message-Id: <20240306140332.623759-3-philipp.reisner@linbit.com>
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

Split out a drbd_max_peer_bio_size helper for the peer I/O size,
and condense the various checks to a nested min3(..., max())) instead
of using a lot of local variables.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 84 +++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 35 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 43747a1aae43..9135001a8e57 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1189,6 +1189,33 @@ static int drbd_check_al_size(struct drbd_device *device, struct disk_conf *dc)
 	return 0;
 }
 
+static unsigned int drbd_max_peer_bio_size(struct drbd_device *device)
+{
+	/*
+	 * We may ignore peer limits if the peer is modern enough.  From 8.3.8
+	 * onwards the peer can use multiple BIOs for a single peer_request.
+	 */
+	if (device->state.conn < C_WF_REPORT_PARAMS)
+		return device->peer_max_bio_size;
+
+	if (first_peer_device(device)->connection->agreed_pro_version < 94)
+		return min(device->peer_max_bio_size, DRBD_MAX_SIZE_H80_PACKET);
+
+	/*
+	 * Correct old drbd (up to 8.3.7) if it believes it can do more than
+	 * 32KiB.
+	 */
+	if (first_peer_device(device)->connection->agreed_pro_version == 94)
+		return DRBD_MAX_SIZE_H80_PACKET;
+
+	/*
+	 * drbd 8.3.8 onwards, before 8.4.0
+	 */
+	if (first_peer_device(device)->connection->agreed_pro_version < 100)
+		return DRBD_MAX_BIO_SIZE_P95;
+	return DRBD_MAX_BIO_SIZE;
+}
+
 static void blk_queue_discard_granularity(struct request_queue *q, unsigned int granularity)
 {
 	q->limits.discard_granularity = granularity;
@@ -1303,48 +1330,35 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	fixup_discard_support(device, q);
 }
 
-void drbd_reconsider_queue_parameters(struct drbd_device *device, struct drbd_backing_dev *bdev, struct o_qlim *o)
+void drbd_reconsider_queue_parameters(struct drbd_device *device,
+		struct drbd_backing_dev *bdev, struct o_qlim *o)
 {
-	unsigned int now, new, local, peer;
-
-	now = queue_max_hw_sectors(device->rq_queue) << 9;
-	local = device->local_max_bio_size; /* Eventually last known value, from volatile memory */
-	peer = device->peer_max_bio_size; /* Eventually last known value, from meta data */
+	unsigned int now = queue_max_hw_sectors(device->rq_queue) <<
+			SECTOR_SHIFT;
+	unsigned int new;
 
 	if (bdev) {
-		local = queue_max_hw_sectors(bdev->backing_bdev->bd_disk->queue) << 9;
-		device->local_max_bio_size = local;
-	}
-	local = min(local, DRBD_MAX_BIO_SIZE);
-
-	/* We may ignore peer limits if the peer is modern enough.
-	   Because new from 8.3.8 onwards the peer can use multiple
-	   BIOs for a single peer_request */
-	if (device->state.conn >= C_WF_REPORT_PARAMS) {
-		if (first_peer_device(device)->connection->agreed_pro_version < 94)
-			peer = min(device->peer_max_bio_size, DRBD_MAX_SIZE_H80_PACKET);
-			/* Correct old drbd (up to 8.3.7) if it believes it can do more than 32KiB */
-		else if (first_peer_device(device)->connection->agreed_pro_version == 94)
-			peer = DRBD_MAX_SIZE_H80_PACKET;
-		else if (first_peer_device(device)->connection->agreed_pro_version < 100)
-			peer = DRBD_MAX_BIO_SIZE_P95;  /* drbd 8.3.8 onwards, before 8.4.0 */
-		else
-			peer = DRBD_MAX_BIO_SIZE;
+		struct request_queue *b = bdev->backing_bdev->bd_disk->queue;
 
-		/* We may later detach and re-attach on a disconnected Primary.
-		 * Avoid this setting to jump back in that case.
-		 * We want to store what we know the peer DRBD can handle,
-		 * not what the peer IO backend can handle. */
-		if (peer > device->peer_max_bio_size)
-			device->peer_max_bio_size = peer;
+		device->local_max_bio_size =
+			queue_max_hw_sectors(b) << SECTOR_SHIFT;
 	}
-	new = min(local, peer);
 
-	if (device->state.role == R_PRIMARY && new < now)
-		drbd_err(device, "ASSERT FAILED new < now; (%u < %u)\n", new, now);
-
-	if (new != now)
+	/*
+	 * We may later detach and re-attach on a disconnected Primary.  Avoid
+	 * decreasing the value in this case.
+	 *
+	 * We want to store what we know the peer DRBD can handle, not what the
+	 * peer IO backend can handle.
+	 */
+	new = min3(DRBD_MAX_BIO_SIZE, device->local_max_bio_size,
+		max(drbd_max_peer_bio_size(device), device->peer_max_bio_size));
+	if (new != now) {
+		if (device->state.role == R_PRIMARY && new < now)
+			drbd_err(device, "ASSERT FAILED new < now; (%u < %u)\n",
+					new, now);
 		drbd_info(device, "max BIO size = %u\n", new);
+	}
 
 	drbd_setup_queue_param(device, bdev, new, o);
 }
-- 
2.40.1

