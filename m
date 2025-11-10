Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8DC95F45
	for <lists+drbd-dev@lfdr.de>; Mon, 01 Dec 2025 08:08:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF964162EFD;
	Mon,  1 Dec 2025 08:07:53 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 461E81608F2
	for <drbd-dev@lists.linbit.com>; Mon, 10 Nov 2025 13:59:32 +0100 (CET)
Received: by mail-qt1-f177.google.com with SMTP id
	d75a77b69052e-4eda6a8cc12so20634971cf.0
	for <drbd-dev@lists.linbit.com>; Mon, 10 Nov 2025 04:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=grsecurity.net; s=grsec; t=1762779572; x=1763384372;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=T6XzBMI6tJPvxcaO9wmkrj/prooJSDL5hkPraZUof94=;
	b=Qf+SL2y1tYd3lgvsBZ11nLCuSh0FfZA7+joeMsJtz2YkJ2URhyFW0wBpmor12H6U59
	45cQnKZnWvd5awW9OsZzhjhfEPDua1enfFq5PSGhEcWUfxh8hB4EGhC55VX43ADHVV4y
	FFNBL3H8XyHPA/AcHRfa6bOq8UpO2EW9mrEr4ZBQGbStlUEi+QHv5Yp0JGq5AWj5Hx8P
	7Y+h3xyVYTIH9q+Tzj75Ukbr/3w/fkR+jgqQifNZIcbT/E1nm9YbhYVwuHz8hLYfSpAd
	0u/PdfNNVFS1dMqyKziJZlfH/du7O4S2mUBO3tByPCNFvb9h1mYkpNBABsCjj87pSkgl
	YzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1762779572; x=1763384372;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=T6XzBMI6tJPvxcaO9wmkrj/prooJSDL5hkPraZUof94=;
	b=HUJraHT4fA2iB0DscIpgtIQq0x71FZgU5zo5kC8MFrC41fTm6EiUe71d1S364nE6UZ
	8RMMnIncIn+T4UTuSGVftvFombZGbOMa95CWo9/2eYePsA/1HfgL+DzwtvorjPtNzdA7
	SqrSTgdK0yQd382NgM4eDr6BcPsYrmgkAe5oVKzJ5WsKrTiBKudhlJ/x63FBCuONGwbR
	Poh6ZPCqj8/Lj3nxyqe+NCsCubbC71ev96mqOzuW3dD8GknwXQ4KA4cH1JnlCyNSZTQ5
	RtL0o9T5xPlNyHAry5Ym9dyLKATP452wrnunuwDmJge+OXCyGrTU2zh0JjkwD13Ew4oQ
	3SBg==
X-Gm-Message-State: AOJu0Yw/rbcZzhbRClIHU+aUjCt4bOv9AeWDs4V0J57kFEDK1+2cv64m
	vz0o1a2xPKnu1O1Vc40PmTdFOQMQkmIRyro0g32ACngXkhL42QlmFKODOoD/e+jHBjY=
X-Gm-Gg: ASbGncuoHUIPP+XId14ag/UxHH2UXcUBraP/kHh3XU+fWWejyWP0zx9Lgy/muyQQUHy
	OYCkLgPcHHpU7o8yUB9mEvhcUafjRc5XMJ4ZLxxD6REAc4xxN/6lSY7+UPdzI3Jlc/qedQmi6Ol
	oj8bB2DLPEGtVXeA7HIA8Z3g0gaZjJGgWe7gRZtOmFbKa3sglqA1OSyuOoWc6dgfRHrtZiOMvzu
	8fjkbGU3IXfnCj/w/T8yZydG1bTthN05pJP1tgOjBDtj8N28XYqahPyWPd2dbgUHdNYE3ZZegmJ
	4XqYk+3HLA3GxivfVPaiDpOx1w1Qy9WgrUP/KmVjHtJ1lUebdkiaDtdclJjVTky2+iOVMBljnDC
	lcfvvmbN6lIGLDW7Fw6RrEeM+Fhua7fFMg6sntjxbC0d5nfaAIC4cx9+fMs5vSB6cFujbPhdJN4
	GEk+nmFUlnw41Cd03GMTawEg2azrB0rCAHgRtBxFu0fV6DvptnP83VawlIxKMkVZpK3/iH
X-Google-Smtp-Source: AGHT+IEGxZlr/V31J4DVmMrsIfVArtKwkB666ay2Bcwor+WzlJbkRW/iNGF4rCS+IW+RswejB4QIpQ==
X-Received: by 2002:a05:622a:1905:b0:4e8:b8d4:a7a0 with SMTP id
	d75a77b69052e-4eda4fca200mr106156021cf.66.1762779571926; 
	Mon, 10 Nov 2025 04:59:31 -0800 (PST)
Received: from bell.fritz.box
	(p200300faaf29b100e8b27dbf0b1165fc.dip0.t-ipconnect.de.
	[2003:fa:af29:b100:e8b2:7dbf:b11:65fc])
	by smtp.gmail.com with ESMTPSA id
	d75a77b69052e-4eda7116927sm43506521cf.13.2025.11.10.04.59.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Nov 2025 04:59:31 -0800 (PST)
From: Mathias Krause <minipli@grsecurity.net>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH] compat: make block_device_operations tests grsec compatible
Date: Mon, 10 Nov 2025 13:59:24 +0100
Message-ID: <20251110125924.511384-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:07:50 +0100
Cc: Mathias Krause <minipli@grsecurity.net>, drbd-dev@lists.linbit.com
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

The grsecurity patch enforces that instances of certain types are always
constified, with the help of a compiler plugin. One of these types is
'struct block_device_operations'. Code that tries to modify a such-typed
object will cause compiler errors, leading to wrong results for the
kernel compatibility tests.

Change these tests to do direct type compare tests instead of trying to
modify the object, making them compatible with grsecurity kernels.

Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
 .../tests/block_device_operations_open_takes_gendisk.c | 10 +++-------
 .../tests/have_blk_qc_t_submit_bio.c                   |  6 +++++-
 drbd/drbd-kernel-compat/tests/have_void_submit_bio.c   |  6 +++++-
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drbd/drbd-kernel-compat/tests/block_device_operations_open_takes_gendisk.c b/drbd/drbd-kernel-compat/tests/block_device_operations_open_takes_gendisk.c
index d5f20fd569fb..9d77f16d09d8 100644
--- a/drbd/drbd-kernel-compat/tests/block_device_operations_open_takes_gendisk.c
+++ b/drbd/drbd-kernel-compat/tests/block_device_operations_open_takes_gendisk.c
@@ -5,13 +5,9 @@
 # define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 #endif
 
-int foo_open(struct gendisk *disk, unsigned int mode)
-{
-	return 0;
-}
+int foo_open(struct gendisk *disk, unsigned int mode);
 
-void foo(void)
+void foo(struct block_device_operations *ops)
 {
-	struct block_device_operations ops;
-	BUILD_BUG_ON(!(__same_type(ops.open, &foo_open)));
+	BUILD_BUG_ON(!(__same_type(ops->open, &foo_open)));
 }
diff --git a/drbd/drbd-kernel-compat/tests/have_blk_qc_t_submit_bio.c b/drbd/drbd-kernel-compat/tests/have_blk_qc_t_submit_bio.c
index d7f2310dfbbd..d3e6dd792ff1 100644
--- a/drbd/drbd-kernel-compat/tests/have_blk_qc_t_submit_bio.c
+++ b/drbd/drbd-kernel-compat/tests/have_blk_qc_t_submit_bio.c
@@ -2,9 +2,13 @@
 
 #include <linux/blkdev.h>
 
+#ifndef __same_type
+# define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
+#endif
+
 blk_qc_t submit(struct bio *bio);
 
 void foo(struct block_device_operations *ops)
 {
-	ops->submit_bio = submit;
+	BUILD_BUG_ON(!(__same_type(ops->submit_bio, &submit)));
 }
diff --git a/drbd/drbd-kernel-compat/tests/have_void_submit_bio.c b/drbd/drbd-kernel-compat/tests/have_void_submit_bio.c
index c638faf020e1..09b56a658a46 100644
--- a/drbd/drbd-kernel-compat/tests/have_void_submit_bio.c
+++ b/drbd/drbd-kernel-compat/tests/have_void_submit_bio.c
@@ -2,9 +2,13 @@
 
 #include <linux/blkdev.h>
 
+#ifndef __same_type
+# define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
+#endif
+
 void submit(struct bio *bio);
 
 void foo(struct block_device_operations *ops)
 {
-	ops->submit_bio = submit;
+	BUILD_BUG_ON(!(__same_type(ops->submit_bio, &submit)));
 }
-- 
2.47.3

