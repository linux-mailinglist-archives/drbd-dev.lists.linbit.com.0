Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B814977B26
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Sep 2024 10:35:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 21C28420900;
	Fri, 13 Sep 2024 10:35:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B02CF420060
	for <drbd-dev@lists.linbit.com>; Fri, 13 Sep 2024 10:35:14 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id
	98e67ed59e1d1-2d87a1f0791so520518a91.2
	for <drbd-dev@lists.linbit.com>; Fri, 13 Sep 2024 01:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1726216513; x=1726821313;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=kC1E6rGRaMKkAAHcPV87FQ7r8LHjz2Mgn/xn2HhiS4I=;
	b=WaGZSLvyOT87LYDbrLabR4IOveuMpjhg/AKmYPpelLIOVmD7Tefj2zcyc0GW2SKdLi
	jKVfg8ylgtEgQ/zg4h02eekmAVeX4GgXosL9lwVwbr6dIJyzHCS9hX/jhdEc6tVpXaDw
	xNqXlCxF0HK6Dwx+2wbgej2bvffzcHD3TCx9YjKpuBre+e7Eu/pTCnc67OWyYta010Yt
	+Jnh5YgavxIVb+qxpKtH84+/LNT0BMpXkDcBO840HVt3rc35XhOS8GkkjcAJSzFZ9mYT
	ET+olw/4oUEnbNZsDcaDWyF81nybtn98YekGctWicb0Rvvjatv+E/j8gd/qtTWbvVump
	TzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1726216513; x=1726821313;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=kC1E6rGRaMKkAAHcPV87FQ7r8LHjz2Mgn/xn2HhiS4I=;
	b=UfpnHI7sD3Q9qMmBb3Y5U5WGjifEdjTGtXDyHAyBrGpfxxCRk7gjUdiuS7XzZWIkxn
	elRLogRm2lFbucVvScmTRrsI3j4SlfCLOGqq8HPIaLGlXYTa9vbMELYTps1th2oCnLbB
	lmKSCQf4fDkfS/PTJsIt3/nFfiqLVmOn2kiSI6nI612ScfvA4qhxDHVjRfbAiGBgBIUA
	XGbq85D82G4NbKG200Cljjjtk+5waFWHHFJXLo97qTups+Y12dZQZfEzo+jlSrDRH4KU
	zNPBy2qD5dcJS+hDPJ0P87dAGDHv9xTZzLjxXELRSZIoaA3YGgZMqYbgdsxSI4ynkEjr
	ii6Q==
X-Gm-Message-State: AOJu0Yw1MzEuO/Vzh3vxWd02zj2WDeCfyYA4jWrfslV/riEDjFzX37Sd
	OtLLQ84lEoNaGv5eb6AvvgJFFBfCP4mnTUl0boWLchD8C6cKQ/cm
X-Google-Smtp-Source: AGHT+IGhOiHOH2ZzR9kqH7H6Mz2LbLdj+bggZwXEzS9FbvIrM15f4iZFYOTdBo7HUQ+io4t6nMbhvw==
X-Received: by 2002:a17:90a:d149:b0:2c6:ee50:5af4 with SMTP id
	98e67ed59e1d1-2dbb9dc1163mr2394189a91.6.1726216513004; 
	Fri, 13 Sep 2024 01:35:13 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.164])
	by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-2dbb9d37e01sm1123613a91.52.2024.09.13.01.35.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2024 01:35:12 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, axboe@kernel.dk
Subject: [PATCH] drbd: Fix atomicity violation in drbd_uuid_set_bm()
Date: Fri, 13 Sep 2024 16:35:04 +0800
Message-Id: <20240913083504.10549-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Qiu-ji Chen <chenqiuji666@gmail.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	baijiaju1990@gmail.com, drbd-dev@lists.linbit.com
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

The violation of atomicity occurs when the drbd_uuid_set_bm function is
executed simultaneously with modifying the value of
device->ldev->md.uuid[UI_BITMAP]. Consider a scenario where, while
device->ldev->md.uuid[UI_BITMAP] passes the validity check when its value
is not zero, the value of device->ldev->md.uuid[UI_BITMAP] is written to
zero. In this case, the check in drbd_uuid_set_bm might refer to the old
value of device->ldev->md.uuid[UI_BITMAP] (before locking), which allows
an invalid value to pass the validity check, resulting in inconsistency.

To address this issue, it is recommended to include the data validity check
within the locked section of the function. This modification ensures that
the value of device->ldev->md.uuid[UI_BITMAP] does not change during the
validation process, thereby maintaining its integrity.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs to extract
function pairs that can be concurrently executed, and then analyzes the
instructions in the paired functions to identify possible concurrency bugs
including data races and atomicity violations.

Fixes: 9f2247bb9b75 ("drbd: Protect accesses to the uuid set with a spinlock")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index a9e49b212341..abafc4edf9ed 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3399,10 +3399,12 @@ void drbd_uuid_new_current(struct drbd_device *device) __must_hold(local)
 void drbd_uuid_set_bm(struct drbd_device *device, u64 val) __must_hold(local)
 {
 	unsigned long flags;
-	if (device->ldev->md.uuid[UI_BITMAP] == 0 && val == 0)
+	spin_lock_irqsave(&device->ldev->md.uuid_lock, flags);
+	if (device->ldev->md.uuid[UI_BITMAP] == 0 && val == 0) {
+		spin_unlock_irqrestore(&device->ldev->md.uuid_lock, flags);
 		return;
+	}
 
-	spin_lock_irqsave(&device->ldev->md.uuid_lock, flags);
 	if (val == 0) {
 		drbd_uuid_move_history(device);
 		device->ldev->md.uuid[UI_HISTORY_START] = device->ldev->md.uuid[UI_BITMAP];
-- 
2.34.1

