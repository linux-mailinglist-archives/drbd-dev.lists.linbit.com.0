Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDA2D9318
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9B2DD420847;
	Mon, 14 Dec 2020 06:56:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DAA8F420637
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:13 +0100 (CET)
Received: by mail-il1-f195.google.com with SMTP id t9so12779006ilf.2
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YfL57PitswGm9UxzHXFWk6g0RK7ok7U8h7K8e7pfBds=;
	b=Y3S1xlK1xm7WMSLgpoUiGrO/bL8uXrdp3y362iiMXtCsjcPNlOfeIVOoZtA6zsD2H7
	xZkRCyE7cQ3yviRVKDDKTWftD9R1Ufgxei/L5F5FQX/FmjGtsbYdEVDSAKgccTZNQVTp
	BQZgl82gqYYv66Z88xo5IoTeEcZ82TiYfgHhIn8RODO0AhHn+W1CkpHKb2iTUW1ufXRh
	bZWtrKx7ZJIrA8EqXwu1uLGMqy80+GjaFrrGdHxFogMtrhZj+Ni+/wkyzAVqDmlzDgob
	LYo/gMM2e/iKORgtXa8VKU3Dud9Ec8iKG8PMZ3ckknaUmK/Ms4yEGQQsMVWhq+9uVNs6
	V30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YfL57PitswGm9UxzHXFWk6g0RK7ok7U8h7K8e7pfBds=;
	b=ohlfolbfopN8M8gV1QWAUX3yLbkJCyZ+nkhiLVA/JSjxCVU/ekS4nfGzRQnaC5XTgd
	lrKw6T2rpX5ecuZAuE7vO2tIMC1Sv/7jEEI+4EgVh7u7yWOFRrMFddoXNrjWjs5ASg60
	PuTjkFnaRt6s4DCEi7qmbagcD74TmtRePqiN3pVykVvh6QWGDRTYj8E65N5T6DrmhJ2/
	wPsEUxf5gGSWqJWTwQ3hCFlOwAPI1fDQYfFrn/Xfx//4GC/EFsm4zSeUXFwlX7XApz5g
	UAcS/l1lxdu0LT0iRHvPN36fqC/t4PZjOx4LoAVy/vHoxU4R/Mzkd0pJTcAF6lqACkWC
	2ggQ==
X-Gm-Message-State: AOAM531AX9oXLXDtIvs/x+J9V3NSPFj6aJ+Yf6BO+auw+RREUqYx3pcF
	/6uVDaRg8iKxEb4/opERh8w0mr5Z8SDpbA==
X-Google-Smtp-Source: ABdhPJxck33WFbfxwbj7KH4Tn4MFEDyrBpGY9OC1ZXDjyVo7/zgH/XyRKaBYg9YoZII7Td1W0OyWsw==
X-Received: by 2002:a92:41d2:: with SMTP id
	o201mr27440299ila.117.1607839152716; 
	Sat, 12 Dec 2020 21:59:12 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:12 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:59 -0500
Message-Id: <20201213055859.3305-9-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 8/8] compat: remove set_bdi_cap_stable_writes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

BDI_CAP_STABLE_WRITES goes away in 5.10, resulting in tons of warnings at
compile time.  It doesn't look like anything in either drbd or drbd-utils
is using the resulting set_bdi_cap_stable_writes macro anyways, so this
commit removes it.

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd-kernel-compat/drbd_wrappers.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drbd/drbd-kernel-compat/drbd_wrappers.h b/drbd/drbd-kernel-compat/drbd_wrappers.h
index c0d8981c..01fdbf22 100644
--- a/drbd/drbd-kernel-compat/drbd_wrappers.h
+++ b/drbd/drbd-kernel-compat/drbd_wrappers.h
@@ -127,13 +127,6 @@ static inline void blk_queue_write_cache(struct request_queue *q, bool enabled,
 #define KREF_INIT(N) { ATOMIC_INIT(N) }
 #endif
 
-#ifdef BDI_CAP_STABLE_WRITES /* >= v3.9 */
-#define set_bdi_cap_stable_writes(cap)	do { (cap) |= BDI_CAP_STABLE_WRITES; } while (0)
-#else /* < v3.9 */
-#warning "BDI_CAP_STABLE_WRITES not available"
-#define set_bdi_cap_stable_writes(cap)	do { } while (0)
-#endif
-
 #ifdef COMPAT_HAVE_POINTER_BACKING_DEV_INFO /* >= v4.11 */
 #define bdi_from_device(device) (device->ldev->backing_bdev->bd_disk->queue->backing_dev_info)
 #else /* < v4.11 */
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
