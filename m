Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40C87385D
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:07:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A61EC4205F9;
	Wed,  6 Mar 2024 15:07:17 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3DF824205E9
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:21 +0100 (CET)
Received: by mail-ed1-f50.google.com with SMTP id
	4fb4d7f45d1cf-55a5e7fa471so9995275a12.1
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733861;
	x=1710338661; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ddcEzANygbtc3ybmp2B4OrDAWMjMfbP+itxySdBOqeo=;
	b=xJvgdcGcEwR26aDOsqq03yocZdPGn1cE6uHnk//62fsmxmEGjDWd0KnPulty8UWfUG
	nW8pZDsfOfI/jZ/Yb44TNDAlzHDC+p9Lndqx+hcveGQkLayalOVxkd2AdMdX+jd1x9Su
	7U0dzDm8kQW35ntg8xQV6NgsfK2xoDXbLqnlHN+zOiJ7TpCUX8XrJDG4mvNq6F+Y29Gy
	fHKJ5tHHCm+osleda6Sh9U6910DHqeJo746P3c5UuI7oehcpYK62pSJsPtJrWt89Y71h
	CoQ/v6tGGRb2FDHLh1fLtc+8pnaD2n0vhhq6qouf93b4NqiMRlUmgOpcIQIQSneVGTF6
	qe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733861; x=1710338661;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ddcEzANygbtc3ybmp2B4OrDAWMjMfbP+itxySdBOqeo=;
	b=TD8DXRhD02E9PKmCKcCPqJxqrtynVGtK42WjyVpdA6/e7xMGE0zSEVPII0LGgTSwzk
	ycqV7GGqsZ8VSHBm6Mgr1Oh/k1kT5O6AZmJNY2vmxvtNSt52f/Bw/o1D3y8tqqkZdDOz
	QjvEQIdI83aybT+CAcNb3rjzKuGWta/bd6XMVzFtUeDRTDz+eQB163+jIfY02lzx6xRr
	560VztnH15UcT4yCfhJf6SCz4u8bCwzUWWVSD/rMzfKdqrAH3iknwBwsG5aLZc7VSkla
	5qOprBAQSGNhFTlMnlEkgW1w8iuqnhojjyPzwD2I3RyqLgBqbCtH5t3Pdi1KYBaB+Dme
	uefQ==
X-Gm-Message-State: AOJu0YxUMvk/3GfLMoidVyah9CPiucmDHK9RZciQGaE5gavQXMd8pPOy
	hlL42g+4/k+A0Z7Mriz4ipcvCffxELfsElBqeGaRaNVOLhuLN7rfF7d+zvzAkeuIVw==
X-Google-Smtp-Source: AGHT+IHUhpFjq3HzoKT3pD6jLwRx4Gr7Yp6Yi0B26xPnRLjrZL40RznfDozglRseSLyoU7bAr6UZKA==
X-Received: by 2002:a05:6402:903:b0:566:95e3:1759 with SMTP id
	g3-20020a056402090300b0056695e31759mr9427437edz.26.1709733860883;
	Wed, 06 Mar 2024 06:04:20 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:20 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 6/7] drbd: split out a drbd_discard_supported helper
Date: Wed,  6 Mar 2024 15:03:31 +0100
Message-Id: <20240306140332.623759-7-philipp.reisner@linbit.com>
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

Add a helper to check if discard is supported for a given connection /
backing device combination.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index a79b7fe5335d..94ed2b3ea636 100644
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
2.40.1

