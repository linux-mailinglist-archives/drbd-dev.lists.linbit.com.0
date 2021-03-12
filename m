Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D233ABE6
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:38 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8A810420634;
	Mon, 15 Mar 2021 08:01:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6FCAC420231
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:37 +0100 (CET)
Received: by mail-wr1-f49.google.com with SMTP id b9so1523654wrt.8
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j/WYLYLqmQFWxlr9WoVnLBGdoC49pGhDOWKpOODCm24=;
	b=OuQeMCfTT4DatgyvzMVQDGeeb5cw3kg6EcS8gxT0b9bi0EC0YubnFpjF9nNaWKZHgc
	QdXmiRwI/ZD6uDY8J9puCjAmJJfsbyIKB31Ed+8S/4kY32MFrgGJA8dQek3l3TZroSaj
	LL3NP4zewqLYp4qjM7gvay4NKq4zrqXasmNsyidm1eIpkYCYoJlwkMWP2m/adoAF0u+S
	noDM1gQxWUaKB8u7Hr/CcnVOq5gbjcEXe4MOZTgHhSUiBAWrd6v6DR6Kc0x8MDXzVN6k
	kF9u7zGq3JBrnKmIZN0MPZmFMR2NrT2iq9eiifs7MMewPrD9YNvMBmvmHz/YK3mEQldv
	s7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j/WYLYLqmQFWxlr9WoVnLBGdoC49pGhDOWKpOODCm24=;
	b=A5A/I+Lt4SuvjrzzIJnm7wUAY2B6U6IdNn15C24SOEEYM3L5yrgZtcdhwEwf5uCrht
	tyCZ7XxTx8/L/Z2Jvet5VkQwbzFgRdaW5R2Qhr2OMNf1CBVz3EBd7UxrsHmOB2niZXDL
	1U/hd2Gzfe+Xf0W3NNetR8W1a28+TMHXdu1vPwO9t1k4s5v0F1HQDNEuopxrdb4fshgB
	sudOU6OGZOQAWU+wkT5rAc4fCZED4s1K0lVxeWVKXHlRS5vJLWomMai0CgOMbqcmLHXa
	d1RGQyYUL0P0nptxy63srHYhaIZSuY28GtbXy/1X09x8XqEfa+tIT7STOPZawf+NnNYW
	hzqw==
X-Gm-Message-State: AOAM53203LcAGmZSOL0Ca9Jw2Krt4RKkvIJ3Dwy0YFhmi7zhcQ1s0CwU
	0EYbbx+pQwWKUNcnUmKktCGUsw==
X-Google-Smtp-Source: ABdhPJy+LSfk15aIBYGicZ5iq8PFrPFac51w86XE4skIkuw+WVP7ywQfAlsxnz2II7j14s8zrlbb4Q==
X-Received: by 2002:adf:a703:: with SMTP id c3mr13132259wrd.379.1615546536734; 
	Fri, 12 Mar 2021 02:55:36 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:21 +0000
Message-Id: <20210312105530.2219008-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 02/11] block: drbd: drbd_interval: Demote some
	kernel-doc abuses and fix another header
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

Fixes the following W=1 kernel build warning(s):

 drivers/block/drbd/drbd_interval.c:11: warning: Function parameter or member 'node' not described in 'interval_end'
 drivers/block/drbd/drbd_interval.c:26: warning: Function parameter or member 'root' not described in 'drbd_insert_interval'
 drivers/block/drbd/drbd_interval.c:26: warning: Function parameter or member 'this' not described in 'drbd_insert_interval'
 drivers/block/drbd/drbd_interval.c:70: warning: Function parameter or member 'root' not described in 'drbd_contains_interval'
 drivers/block/drbd/drbd_interval.c:96: warning: Function parameter or member 'root' not described in 'drbd_remove_interval'
 drivers/block/drbd/drbd_interval.c:96: warning: Function parameter or member 'this' not described in 'drbd_remove_interval'
 drivers/block/drbd/drbd_interval.c:113: warning: Function parameter or member 'root' not described in 'drbd_find_overlap'

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linbit.com
Cc: linux-block@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/block/drbd/drbd_interval.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_interval.c b/drivers/block/drbd/drbd_interval.c
index 651bd0236a996..f07b4378388b0 100644
--- a/drivers/block/drbd/drbd_interval.c
+++ b/drivers/block/drbd/drbd_interval.c
@@ -3,7 +3,7 @@
 #include <linux/rbtree_augmented.h>
 #include "drbd_interval.h"
 
-/**
+/*
  * interval_end  -  return end of @node
  */
 static inline
@@ -18,7 +18,7 @@ sector_t interval_end(struct rb_node *node)
 RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
 			 struct drbd_interval, rb, sector_t, end, NODE_END);
 
-/**
+/*
  * drbd_insert_interval  -  insert a new interval into a tree
  */
 bool
@@ -56,6 +56,7 @@ drbd_insert_interval(struct rb_root *root, struct drbd_interval *this)
 
 /**
  * drbd_contains_interval  -  check if a tree contains a given interval
+ * @root:	red black tree root
  * @sector:	start sector of @interval
  * @interval:	may not be a valid pointer
  *
@@ -88,7 +89,7 @@ drbd_contains_interval(struct rb_root *root, sector_t sector,
 	return false;
 }
 
-/**
+/*
  * drbd_remove_interval  -  remove an interval from a tree
  */
 void
@@ -99,6 +100,7 @@ drbd_remove_interval(struct rb_root *root, struct drbd_interval *this)
 
 /**
  * drbd_find_overlap  - search for an interval overlapping with [sector, sector + size)
+ * @root:	red black tree root
  * @sector:	start sector
  * @size:	size, aligned to 512 bytes
  *
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
