Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15E2D930A
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70860420805;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB68D420629
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:22 +0100 (CET)
Received: by mail-qk1-f195.google.com with SMTP id 1so12709191qka.0
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TdL8Rx5WU6a8lLrbsLhnYiseC6W3GfBwtn2Z/kgZW6E=;
	b=OWCc9Mn4tHdk7/i9d/U8DfBlswsjC4SbX5HbMYv7nDRgn2dDgO1/QPrH4+rZ7Yhr6r
	rn6HaBzv6F3FkoYntF+PUMCJXgsiPAS4lKPMTcHj00NmYkaLM9K5M3Blj1a774IVmVBh
	kuxVOPXi7lLbKByMylHFn79u87kjxbXI361+Io6OqSe2qTvM3SIrl0tdV/Ks5mEcVHIw
	I5OWhFSL5R7DLN4aUReqKX0Ugv3MiAlz72wbmZHbqtmN5emqIUyOyIS16efMjNozwnWC
	WtqzIfcLiDIPd1ncULK5aceQTRt3a/VEhwO7kVzz+PrYsxYOG+O/diXgxZEVE1lO+4a/
	5F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TdL8Rx5WU6a8lLrbsLhnYiseC6W3GfBwtn2Z/kgZW6E=;
	b=qo1Ghwbj5dXzy/T/ARhDVVw7rfBb1UuE3PGCYE55rqIVfqZTaPrSmyMIsXNv26azrA
	M6u8daJdjftAtUDFs+wHagjD+33e/vRtlRlub5MA9t3+zA/igHoN3LW6Whfuqv0fZNzV
	1XWzQjzA+94vdC7U/Q65kFz5VOyNhpTUMiL/3iQYgqRXCb4XvHWE5c5i0bbGysvZMyyD
	8IIH04JJB5hTYl9UEs8Zw7+wG5YCixlZwka2ThvFrTUhJjnbyYG9ICkki5Q0AX5hwS5p
	fdsBTqVl6h7BcqmWrNyjrrO8u28tvqxDZEINvxoLumorKaCOIQiAkBUF/BwSYb4US09j
	+UiA==
X-Gm-Message-State: AOAM5329z2vWZWfZ7X6/kuc268pTWEEVcF/TKOW2S4yoJg9jUhqCpAEE
	WaXM7yS5cxC3lowiPIJW5B3q0zQn6tpKpQ==
X-Google-Smtp-Source: ABdhPJywyf6jfrSORxPtjaZrmpAxdlZ30RB/l7VREvWm0u2DHryv90ZvwJu35aaGMkwJw8m9BLfSLQ==
X-Received: by 2002:a37:bac7:: with SMTP id
	k190mr26444158qkf.464.1607836041658; 
	Sat, 12 Dec 2020 21:07:21 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:21 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:06:59 -0500
Message-Id: <20201213050704.997-4-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 3/8] drbd: don't include vermagic.h
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

Compilation fails because "This header can be included from kernel/module.c
or *.mod.c only".  Leaving it out seems to work just fine.

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 98a94a16..fe1a0b31 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -16,7 +16,6 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
-#include <linux/vermagic.h>
 #include <linux/jiffies.h>
 #include <linux/drbd.h>
 #include <linux/uaccess.h>
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
