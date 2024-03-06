Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB51873851
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:05:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF2434203D9;
	Wed,  6 Mar 2024 15:05:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 622144205A5
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:18 +0100 (CET)
Received: by mail-ed1-f50.google.com with SMTP id
	4fb4d7f45d1cf-5643ae47cd3so9033677a12.3
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733857;
	x=1710338657; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=YRYEa+8c0RD7c9mVDBDAz1QMFvgl81NHS3vUxcRXkOo=;
	b=YTmNfBb+8yvgyxJ4puo0TPICKT6SBpXs39J5NZDO6jbzwZ3g2o0WAO/vVcaMsU3KkE
	NUVmqXvWd7OISVksQ8+HMUgkRhVOIKEE8lwDdDqeJxeBiF3/7FLi/ow77y4yuNCPNGCs
	+mQoWk0dbB9n+0PDmdX4DUC9f/Pkun8hh/YWO+m6brfUxM5jmYy5OVVoCSQWAJOPAsii
	An6kSDEaNh/hho7iNLY6Lpo7Mnd0OIJ6mxuDXkt+3TFzMfDq/JyzOHPMjtRnytpj9l/R
	2E3DX5sLBQN282/UHGwsH7JGoTvG8O5ejOgoTg8c3F7QPI5bKNm/mKsHiw+sjgQL6vlD
	Z09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733857; x=1710338657;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=YRYEa+8c0RD7c9mVDBDAz1QMFvgl81NHS3vUxcRXkOo=;
	b=szZwVyfYF2tuzYfe09hIbpid8kRaEG3Fqi+BzeKER3453psk0TC7elvFDT9iLXGWm8
	SUoPJq94RBkbE3GLhpqNLoXzG/dBnOmlJjVU8CyJ/Y3UQJ+9FLIaPpmwJoD17QZ5IQ5N
	SLPJuvuNmFPPkkkaSrJzHIg5O6rKeL6KnuPTLdrk1G187pCl4hs8fyhydOr3daFtISCZ
	In5efQiEju7nTMeOE5M58c6XVJM9CW+8koIXVkAKmnTzj9psgzr/ItiY1cYBg5lJAzG3
	D/vqVsfhoJ5W81H5I+zwKOEb90IP+c2hBDtXiezWm972pyj9Kz8ysCpqjrRKHgNKx6RB
	YiCA==
X-Gm-Message-State: AOJu0YxBL8K9hL4fnU/i4XGmfVYmERxibHlLBYiPGTuweiYyVu9v6Ttv
	StYWKmDCzbExgf/IlO8Sc3nSHG56ONDCzQcjjtG/yPNjs10znWoGpEAyI8hJ4Eb9wQ==
X-Google-Smtp-Source: AGHT+IFh2HrB/L8s25lhOCmfk34YmGw/xKNWWDg9bAIeSf0LfGcvX4QC61LytQQJ3YYt5/ygtdP2yw==
X-Received: by 2002:aa7:ce05:0:b0:567:702d:ccb1 with SMTP id
	d5-20020aa7ce05000000b00567702dccb1mr5392625edv.20.1709733857680;
	Wed, 06 Mar 2024 06:04:17 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:17 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/7] drbd: refactor the backing dev max_segments calculation
Date: Wed,  6 Mar 2024 15:03:28 +0100
Message-Id: <20240306140332.623759-4-philipp.reisner@linbit.com>
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

Factor out a drbd_backing_dev_max_segments helper that checks the
backing device limitation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 9135001a8e57..0326b7322ceb 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1295,30 +1295,39 @@ static void fixup_discard_support(struct drbd_device *device, struct request_que
 	}
 }
 
+/* This is the workaround for "bio would need to, but cannot, be split" */
+static unsigned int drbd_backing_dev_max_segments(struct drbd_device *device)
+{
+	unsigned int max_segments;
+
+	rcu_read_lock();
+	max_segments = rcu_dereference(device->ldev->disk_conf)->max_bio_bvecs;
+	rcu_read_unlock();
+
+	if (!max_segments)
+		return BLK_MAX_SEGMENTS;
+	return max_segments;
+}
+
 static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backing_dev *bdev,
 				   unsigned int max_bio_size, struct o_qlim *o)
 {
 	struct request_queue * const q = device->rq_queue;
 	unsigned int max_hw_sectors = max_bio_size >> 9;
-	unsigned int max_segments = 0;
+	unsigned int max_segments = BLK_MAX_SEGMENTS;
 	struct request_queue *b = NULL;
-	struct disk_conf *dc;
 
 	if (bdev) {
 		b = bdev->backing_bdev->bd_disk->queue;
 
 		max_hw_sectors = min(queue_max_hw_sectors(b), max_bio_size >> 9);
-		rcu_read_lock();
-		dc = rcu_dereference(device->ldev->disk_conf);
-		max_segments = dc->max_bio_bvecs;
-		rcu_read_unlock();
+		max_segments = drbd_backing_dev_max_segments(device);
 
 		blk_set_stacking_limits(&q->limits);
 	}
 
 	blk_queue_max_hw_sectors(q, max_hw_sectors);
-	/* This is the workaround for "bio would need to, but cannot, be split" */
-	blk_queue_max_segments(q, max_segments ? max_segments : BLK_MAX_SEGMENTS);
+	blk_queue_max_segments(q, max_segments);
 	blk_queue_segment_boundary(q, PAGE_SIZE-1);
 	decide_on_discard_support(device, bdev);
 
-- 
2.40.1

