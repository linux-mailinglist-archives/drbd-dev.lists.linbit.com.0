Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E5C95F51
	for <lists+drbd-dev@lfdr.de>; Mon, 01 Dec 2025 08:08:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58AF41630CD;
	Mon,  1 Dec 2025 08:08:00 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2C2851608F4
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 10:08:20 +0100 (CET)
Received: by mail-pl1-f180.google.com with SMTP id
	d9443c01a7336-2957850c63bso54346455ad.0
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1763456900; x=1764061700;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=wtXQT/OdWgiT+1HPVergpURbuzBj46MXXs88yjk/ACU=;
	b=l5iIVhZrbi6XYPOxFW3iTH3LY4L5lJWPu/MCXvYxWLnuW2GdOIiVz4BUFB/s3PWPYX
	exCT8CgfCs0xat/jHkQU6fBIY+bFuyWobUhYsww6JOFzRuuE2yPEPiqWQkHxB28NoLxJ
	XTBBAxaS0BAL+PDoPU8+i6SCXI8p9pqNGY2xDl/rlKAtUqX5924HEgtMJy6bHxSeCqFQ
	o0zTMozQLgTCUghd5i/73CzAjbDg1jKXGLOMS/57ktFnyDEwSablOebzlqkWRoxlB9SO
	zzu/xVRCI+3vjsAl6pEDJulMoSiMp2UWCcpM4pu9OUHCAKXUuanj4TdK/ZbfuXK6AIsr
	/Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1763456900; x=1764061700;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=wtXQT/OdWgiT+1HPVergpURbuzBj46MXXs88yjk/ACU=;
	b=r/aeP2GmPpADfC4ebAs9p7kGvoah4Shuh6LPwL3Hzyh1tjn4WgZPRyPa2AG9xSjVNY
	NgxeAKWjMBwUxJyEoHkR52s1mzu1klwKmSn2aqSoQ7AmGw+JjYsru0yxcGX+f2UKGAqZ
	hE0eFM7ua1qGoB+ejA7ipD5pHNMrOQyIEcabAK1bit3L/UDqZ+aYsFjaxJ/rB69pFM1/
	zfvwXFI6C5nd5da5tMBLeF5as9phRTXVlfv8EdE29TSkbe4E0UcTu+X+gVty5LBNhKHJ
	oVQJGTzU1K+cKgS8ya/SK5ncLYMOdDUgbh6oQXTCeGPU76FDFGlQoH4CT1U6pFafA0Vc
	deNg==
X-Forwarded-Encrypted: i=1;
	AJvYcCU6PUFBAoOpvzbfgieVZ1j/7p+yXYNjclxuEx+8ps0ZYfa5bp7QPhzFCSNY0rlIuyqMmqWl2DRg/w==@lists.linbit.com
X-Gm-Message-State: AOJu0Yyng9Ul1QirOkXeYbXESFNbbDlgfWtTcy3QSkZ9/4OLhhFvwa+m
	okkVla7fl83RNW2RwRFc/W9s3YqJ8Qdp9BcfgZsUACMV2pA1a2CLsjxn
X-Gm-Gg: ASbGncuVhN2OYg/RpE3vPyfEa6tbNKlVmkzhPsEXW94CeEmlUPernVJn3Nl27eG0ChN
	itum1EU9mkWaL90ypqBdQo85v8gromjZOVV/BVTaeBUC7ETMBdcwbzalDvwSXtA6zJ31KlAfrpl
	s7ICGnaNqiqOTMewB/n9iwhso5jgRDlfKNlM9lJoeuiX7CWWbu91oThKFhmyLXI/JKai4UZ7KO7
	Tq4dN8psU1K/aZAUUOkuL1EzJjKA7T2IKpK4P4jGhLRgrS7G4lWO7iXXhej01WAli+OF3x81bGc
	HPDknQFIUPoKthfGNRCI5LjFt/TI0W+CBCq/yt5Z2ikmJ1pi1kvXBQ1jsdm8+ztL/B2wbT7iqfa
	dg/f1yNRk3GjAUhHfCxrk8+reG/KKRHZh6yefhtJWTsN1KGUvDS+8ooyqnSD+K1lWBbMURP0Brr
	cojmp4qAFcavslbbOb2g==
X-Google-Smtp-Source: AGHT+IFONSoGa0+pxHK7JiJvE0ZXp2Dp4GaKslWjRMI6qlRuZ4eG/9s+0oW21KZbEJFdUWjrjcUxMQ==
X-Received: by 2002:a17:903:fab:b0:297:e6ca:c053 with SMTP id
	d9443c01a7336-299f55b8dffmr32294565ad.28.1763456899674; 
	Tue, 18 Nov 2025 01:08:19 -0800 (PST)
Received: from hsukr3.. ([2405:201:d019:4042:80a6:7dd7:b597:d951])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-2985c2b0c9dsm166669745ad.67.2025.11.18.01.08.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Nov 2025 01:08:18 -0800 (PST)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com (open list:DRBD DRIVER),
	linux-block@vger.kernel.org (open list:BLOCK LAYER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drbd: turn bitmap I/O comments into regular block comments
Date: Tue, 18 Nov 2025 14:37:53 +0530
Message-ID: <20251118090753.390818-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:07:50 +0100
Cc: Sukrut Heroorkar <hsukrut3@gmail.com>, shuah@kernel.org,
	david.hunter.linux@gmail.com
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

W=1 build warns because the bitmap I/O comments use '/**', which
marks them as kernel-doc comments even though these functions do not
document an external API.

Convert these comments to regular block comments so kernel-doc no
longer parses them.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
See: https://lore.kernel.org/all/20251117172557.355797-1-hsukrut3@gmail.com/t/

 drivers/block/drbd/drbd_bitmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 85ca000a0564..d90fa3e7f4cf 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1210,7 +1210,7 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 	return err;
 }
 
-/**
+/*
  * drbd_bm_read() - Read the whole bitmap from its on disk location.
  * @device:	DRBD device.
  */
@@ -1221,7 +1221,7 @@ int drbd_bm_read(struct drbd_device *device,
 	return bm_rw(device, BM_AIO_READ, 0);
 }
 
-/**
+/*
  * drbd_bm_write() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
  *
@@ -1233,7 +1233,7 @@ int drbd_bm_write(struct drbd_device *device,
 	return bm_rw(device, 0, 0);
 }
 
-/**
+/*
  * drbd_bm_write_all() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
  *
@@ -1255,7 +1255,7 @@ int drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_ho
 	return bm_rw(device, BM_AIO_COPY_PAGES, upper_idx);
 }
 
-/**
+/*
  * drbd_bm_write_copy_pages() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
  *
@@ -1272,7 +1272,7 @@ int drbd_bm_write_copy_pages(struct drbd_device *device,
 	return bm_rw(device, BM_AIO_COPY_PAGES, 0);
 }
 
-/**
+/*
  * drbd_bm_write_hinted() - Write bitmap pages with "hint" marks, if they have changed.
  * @device:	DRBD device.
  */
-- 
2.43.0

