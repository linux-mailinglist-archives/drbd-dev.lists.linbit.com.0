Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA82D9313
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9E7A420830;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EAF33420625
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:09 +0100 (CET)
Received: by mail-il1-f196.google.com with SMTP id k8so12795837ilr.4
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TdL8Rx5WU6a8lLrbsLhnYiseC6W3GfBwtn2Z/kgZW6E=;
	b=hEAAZJLxdXy/b8HVweAEcdQPIogVZXOgcZu/NdSNZ+rMGUPr55B0StQpt3qs+BdxAH
	RGRNZQ2KVPHAqcnrzAhTdVGpPqr2puw2Rq043yzxd4RyW+m+mD/uBehhRIVLWjuFd3I/
	6UIJ6HIJbFbIg4dq/PxP+5Ju0epnueDmImFktX++g7ETzcPk5x1s3fDI2TDk+pvMfAiq
	xz/qoV1fHww7JJlj2RkjrAT5Df/0vz0nMJyki8Aj1JamG9TM59KXsgLUtbC3Xghkgf0c
	AutP7jQc1pxsbOdonVRVTQ2anhRlgU3SKi1I4iTqHpmUiEar1A9cGJNZFEzhCaX84SLi
	58rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TdL8Rx5WU6a8lLrbsLhnYiseC6W3GfBwtn2Z/kgZW6E=;
	b=lI07RTLHpErblhRUsPNEck74/XglM0uaAGSfYot0QVBO9iTi/YV4i2dVQfCv6uuaDU
	F+45DzwssopWhGL5h11xdOhGolBfk1ZLVvzncNocNnQ0hjjOF3CG6iN2vMXtSR0HSc39
	4n4yrdwr660Oj7Hceky7jyjTiEfwbwxj5bq4uv0tbJt9CBne+uEG6XkH41ECf+x6gQ/z
	CJFqRoaBzgm+IjLOI5vbXQ9hYRW7hyzvBOtdnWkAsMw3/Di+A0swLRrodpspzmvN1Hle
	GlO+f0MTqp9du/4TVLJSIkeemWO4Dcloum6Mr4RQWEHIoIAw4reRKldTLu+d1sS8rWye
	smXw==
X-Gm-Message-State: AOAM531NS123HGIsTLGjsmeIj2/VJx3WLz22Xd9EjE3cufkjSg29yEWd
	/1Y4DOlwrqHtDuDWbToefP+3/1nnzT3Y2w==
X-Google-Smtp-Source: ABdhPJyE/acJIE2zV5Q7ixDMAIbYHc2W7SZJQa7H8X2Nc+q3lsOsrp/Yb6zdRVDaVc3uWGjJq05G1g==
X-Received: by 2002:a92:d68d:: with SMTP id p13mr26834788iln.27.1607839148749; 
	Sat, 12 Dec 2020 21:59:08 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:08 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:54 -0500
Message-Id: <20201213055859.3305-4-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
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
