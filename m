Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFBA734B54
	for <lists+drbd-dev@lfdr.de>; Mon, 19 Jun 2023 07:25:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7FCA7420632;
	Mon, 19 Jun 2023 07:25:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D23F4203B3
	for <drbd-dev@lists.linbit.com>; Fri, 16 Jun 2023 18:45:30 +0200 (CEST)
Received: by mail-wm1-f54.google.com with SMTP id
	5b1f17b1804b1-3f8d258f203so7592845e9.1
	for <drbd-dev@lists.linbit.com>; Fri, 16 Jun 2023 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20221208; t=1686933930; x=1689525930;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=8V8q96OOXdGau1TedNc2n90X++sVPNRGGXHlrWVRBEc=;
	b=i3YMB8s2sNQ/jSgkkXlqbo+NkETRLlYYZq8OJPUg/h6JEYLiHckfl+M5nU05AA2FP1
	TxtgdKZFXZCunRpwjNko8IUzbadarz/MJ3c4G708uD+fCH9FSFs8vzIQxLlnUK5Ms2cy
	wKO3A5nUaIsLqZ9ngVRW7CBjH9wcNaFJZS5yOQIp+A7djGgdbQywRdGodzqSz5PtZlvM
	wz5b05QrhLY4gSTRRmqPbe/3+d7k1t07arE2z/IDDao/Fy83b6ongXoT3IpP19QRuaqG
	6tg3rvtYbImek8pFfA1WZRyQ6Yv0V3d23594qpbGUomRV9Hn0tBg+a8d7ayNOZQYM+Zz
	pMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1686933930; x=1689525930;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=8V8q96OOXdGau1TedNc2n90X++sVPNRGGXHlrWVRBEc=;
	b=Jo9Hd0s621IlhFedYtYc5FJ8EGT3c+xJTueneEcK3NUTTiqi6LNJ99yg9LReHAFeA7
	umozdGvOjhDOW+CgRv0ZCgyqOqiHbwegCHUQGx+/x5FRfpFgurKPn4SdpltoJ/mkLCQc
	J0OQsZht9fdDHwVmUQ/Fq2FthEI5tZZl1vC2hblHEOHwd9aircYB7Y0QcWBynnikd+5+
	geuuWT+q/RSFcNALWKs3VKUHDi20jfkJZkVlYK5B0l8VP4xcajIYoUTEgMi79yQu7DB2
	3TZ0mWxTwKTcAeL19zc77V+MrISK5MbdkK82C4X6Pjt8dOWsJMRltA9KTnj9oC7ZGwgL
	LbJg==
X-Gm-Message-State: AC+VfDysRgkq4+kPRGplCUGcyLOFk3DOZDqSglba2viQf13WUvqf7T6m
	SXlm1f4qtIWlw1zzhZNGYBY=
X-Google-Smtp-Source: ACHHUZ64k1pdHed8InLXt7Gttw1k3psGS3dQa/8W2hpx8V25//2s5Z4b05o/W2he1wB3HtDeJYgqeQ==
X-Received: by 2002:a05:600c:290:b0:3f7:33da:f218 with SMTP id
	16-20020a05600c029000b003f733daf218mr2068916wmk.35.1686933929885;
	Fri, 16 Jun 2023 09:45:29 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
	[80.193.200.194]) by smtp.gmail.com with ESMTPSA id
	q13-20020a1ce90d000000b003f8e4b22bc2sm2630817wmc.44.2023.06.16.09.45.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Jun 2023 09:45:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
Date: Fri, 16 Jun 2023 17:45:28 +0100
Message-Id: <20230616164528.2342460-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Jun 2023 07:25:13 +0200
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Drbd-dev] [PATCH][next] drbd: remove redundant assignment to
	variable owords
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The variable owords is being assigned a value that is never
read, the exit path via label out returns before owords is ever
used again. The assignment is redundant and can be removed.

Cleans up clang scan build warning:
drivers/block/drbd/drbd_bitmap.c:654:3: warning: Value stored to 'owords' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/drbd/drbd_bitmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 85ca000a0564..897bf211e985 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -651,7 +651,6 @@ int drbd_bm_resize(struct drbd_device *device, sector_t capacity, int set_new_bi
 		spin_lock_irq(&b->bm_lock);
 		opages = b->bm_pages;
 		onpages = b->bm_number_of_pages;
-		owords = b->bm_words;
 		b->bm_pages = NULL;
 		b->bm_number_of_pages =
 		b->bm_set   =
-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
