Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3119760E9
	for <lists+drbd-dev@lfdr.de>; Thu, 12 Sep 2024 08:01:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 509E8420900;
	Thu, 12 Sep 2024 08:01:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 27E4D4202C8
	for <drbd-dev@lists.linbit.com>; Wed, 11 Sep 2024 11:16:36 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id
	d9443c01a7336-20688fbaeafso66996885ad.0
	for <drbd-dev@lists.linbit.com>; Wed, 11 Sep 2024 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1726046195; x=1726650995;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=WcDJb5QYEy4QSNbCqr1Ub2x3UYsUcQg9U2wYJLfZOgA=;
	b=WZeBBcZuv3IwboVz/A9EkjktJYoiaezrZqmUVP0zs4o0004VrjD8vbryhe/qkm0/KM
	XH7zJA82NV3jsDp0Tat48eSifZKUo3mYC1O9NWnsbn7Z2tO1lGSo2ROfT2wrx8Li2amd
	C6ylSNDl4yFrywC+iAKTvKmY6z/IO/k7tpB4W4+XVcq+5Cei+77m6o+1T379pRUXYcn6
	okAdDx6j4o1c06cwtCw3AqaVnUQFuFEcHKSfhBhS0DnraITcpBV8iX4vLBrSE+UKS0Dn
	mgKuUcldY5gQPjfPg4d2wAMjQxEQqrcOHZH4hskSY+yMGurA36+YIyd4lwgumrPswSkg
	nZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1726046195; x=1726650995;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=WcDJb5QYEy4QSNbCqr1Ub2x3UYsUcQg9U2wYJLfZOgA=;
	b=IxRkxymDtW4c1+qLOajo8ki/aPn6ZLXWJlEiZWETSkVGSQcRKvIVvUjiloxwHqBZTC
	JtoaaudQ8lvmmtGk9jl9uZ70Zypr0eLdL0ra/8TASGMpvMOKDWI0Q55rPir8AT+yAxMv
	ojRuyTRKUhJSsU+4BzopYah77D0n0DDobB/DPfQ6Uid/5sURW7JiOMajrA727B22/xZR
	LqccVIDMeUs86PimomJD1alEpr6/XLayCfNOXMRuiu85q8wP0sCUFRiqqDEoOPF0Z17Q
	YK6bguoHSO51oS+eG19d6j+LmYu5o1vT7WX/sIaN8kY44SO7TqUW0zzz89PcV8V8VU02
	ej0A==
X-Gm-Message-State: AOJu0YzRanahIsDrFeUDm4R+PxvAvJqy6vuAYhFwTCBZg6HNnP4UDY0D
	yz8BldUgKNFtXFeePV3Owj/WASsyUqQZURsIRiYSG9pU+h7s4eiirpXDxXACuobahQ==
X-Google-Smtp-Source: AGHT+IEhYB+6J+0UCltGlnaoCjtSirBu3Qn2up1kXKerpnf9BCxeM5frLfc6fpa0E+C/vwJef/J/OA==
X-Received: by 2002:a17:902:c946:b0:205:7f87:ba3e with SMTP id
	d9443c01a7336-2074c5e4cf2mr55804235ad.13.1726046194685; 
	Wed, 11 Sep 2024 02:16:34 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.164])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-20710e32e2fsm59844995ad.101.2024.09.11.02.16.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2024 02:16:34 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, axboe@kernel.dk
Subject: [PATCH] brbd: Fix atomicity violation in drbd_uuid_set_bm()
Date: Wed, 11 Sep 2024 17:16:19 +0800
Message-Id: <20240911091619.4430-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Sep 2024 08:01:29 +0200
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

The violation of atomicity occurs when the brbd_uuid_set_bm function is
executed simultaneously with modifying the value of
device->ldev->md.uuid[UI_BITMAP]. Consider a scenario where, while
device->ldev->md.uuid[UI_BITMAP] passes the validity check when its value
is not zero, the value of device->ldev->md.uuid[UI_BITMAP] is written to
zero. In this case, the check in brbd_uuid_set_bm might refer to the old
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

