Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id D442B87385A
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:06:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F9FE4203D9;
	Wed,  6 Mar 2024 15:06:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3665D4205C6
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:19 +0100 (CET)
Received: by mail-ed1-f53.google.com with SMTP id
	4fb4d7f45d1cf-56682b85220so10949202a12.1
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733859;
	x=1710338659; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=5JJxAYhfXHCDUu1ylelsVJri+kbSlwIsVmiuUFYkgAo=;
	b=Uk7IISbSQqUgSedA/JtqK80g7vBM+P88Uko+d4ZX/SIr/lNXwAHyuaKnmhsSBHQqLk
	3QCfFteRLYFjq9KwuHkdeKk/eGkJ8qZAM3sJRlfxPZZbnM5ZugF7HlAFGKC7nz9yVdF/
	IsBYSAlzjmKLZ0HVhXwyi1c+olcmoVk3MKCbycnteV++AZupijhJ253lrDMnTYNO4FSc
	eQ0C63Sreo3sz6GDrlNCFrIikRtfz68Yiksj5Me8KomnkBUvw2gItIRTDJrmzFnr/l0L
	pFjsEuL6qjRUEI5+waISi8LwhI+iialy/L1oTJHMImoWUlD8S8OphB2c52/ZllPoyrl8
	xW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733859; x=1710338659;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=5JJxAYhfXHCDUu1ylelsVJri+kbSlwIsVmiuUFYkgAo=;
	b=JABTI9XwbU8HlynAQ6Vd6AwgIQa7r1ejn/1sZ0W4ZK94wnRiGQNYs9dJlZH4YC/3gi
	b7teAmtm3YBNDpAANVa4DJpf1abzVxkiws5PfZIFFuDyAGlKPUMQjltsbR9PQqZUZKyN
	aGcfW3mId7YCPs+RASXfclsoCuhns49o+/8dTYVZq9+opz7QRDL0ph4dfeXo39UeEjQI
	0wTwOu6UnDj4gVueA8aunAPdtzJjN54i7Kk0s1yo8Ou6+jJk34RDiFMzX1S+uQwE6P/M
	E4lbCCWZMm5d4yJluy7hhBkrKeTa27cRrCyme2ecGZ/HmFMMZ+wr9plKfimTib/qbo+H
	xiAw==
X-Gm-Message-State: AOJu0YzmtJ0KkVp77Ri/vq8aPJKBiiWjm26s4DCYo0chqsXtFqlPuk5/
	W4W1t1fWzCBKDyoKU93IFTwXANkEl+8Vu9YRYEIRtSn97/kApraEwE1wVPgKbOdCug==
X-Google-Smtp-Source: AGHT+IHGC0WBmCNO2PZhBdCdtnITFxhmuCY+bn8CEkV5EMiAMwNXGZkbmk3uHno6H5goyo9CEM8ovw==
X-Received: by 2002:a05:6402:17c4:b0:567:e812:e44e with SMTP id
	s4-20020a05640217c400b00567e812e44emr1155277edy.18.1709733858793;
	Wed, 06 Mar 2024 06:04:18 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:18 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 4/7] drbd: merge drbd_setup_queue_param into
	drbd_reconsider_queue_parameters
Date: Wed,  6 Mar 2024 15:03:29 +0100
Message-Id: <20240306140332.623759-5-philipp.reisner@linbit.com>
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

drbd_setup_queue_param is only called by drbd_reconsider_queue_parameters
and there is no really clear boundary of responsibilities between the
two.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 56 ++++++++++++++----------------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 0326b7322ceb..0f40fdee0899 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1309,45 +1309,16 @@ static unsigned int drbd_backing_dev_max_segments(struct drbd_device *device)
 	return max_segments;
 }
 
-static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backing_dev *bdev,
-				   unsigned int max_bio_size, struct o_qlim *o)
-{
-	struct request_queue * const q = device->rq_queue;
-	unsigned int max_hw_sectors = max_bio_size >> 9;
-	unsigned int max_segments = BLK_MAX_SEGMENTS;
-	struct request_queue *b = NULL;
-
-	if (bdev) {
-		b = bdev->backing_bdev->bd_disk->queue;
-
-		max_hw_sectors = min(queue_max_hw_sectors(b), max_bio_size >> 9);
-		max_segments = drbd_backing_dev_max_segments(device);
-
-		blk_set_stacking_limits(&q->limits);
-	}
-
-	blk_queue_max_hw_sectors(q, max_hw_sectors);
-	blk_queue_max_segments(q, max_segments);
-	blk_queue_segment_boundary(q, PAGE_SIZE-1);
-	decide_on_discard_support(device, bdev);
-
-	if (b) {
-		blk_stack_limits(&q->limits, &b->limits, 0);
-		disk_update_readahead(device->vdisk);
-	}
-	fixup_write_zeroes(device, q);
-	fixup_discard_support(device, q);
-}
-
 void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		struct drbd_backing_dev *bdev, struct o_qlim *o)
 {
-	unsigned int now = queue_max_hw_sectors(device->rq_queue) <<
-			SECTOR_SHIFT;
+	struct request_queue * const q = device->rq_queue;
+	unsigned int now = queue_max_hw_sectors(q) << 9;
+	struct request_queue *b = NULL;
 	unsigned int new;
 
 	if (bdev) {
-		struct request_queue *b = bdev->backing_bdev->bd_disk->queue;
+		b = bdev->backing_bdev->bd_disk->queue;
 
 		device->local_max_bio_size =
 			queue_max_hw_sectors(b) << SECTOR_SHIFT;
@@ -1369,7 +1340,24 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		drbd_info(device, "max BIO size = %u\n", new);
 	}
 
-	drbd_setup_queue_param(device, bdev, new, o);
+	if (bdev) {
+		blk_set_stacking_limits(&q->limits);
+		blk_queue_max_segments(q,
+			drbd_backing_dev_max_segments(device));
+	} else {
+		blk_queue_max_segments(q, BLK_MAX_SEGMENTS);
+	}
+
+	blk_queue_max_hw_sectors(q, new >> SECTOR_SHIFT);
+	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
+	decide_on_discard_support(device, bdev);
+
+	if (bdev) {
+		blk_stack_limits(&q->limits, &b->limits, 0);
+		disk_update_readahead(device->vdisk);
+	}
+	fixup_write_zeroes(device, q);
+	fixup_discard_support(device, q);
 }
 
 /* Starts the worker thread */
-- 
2.40.1

