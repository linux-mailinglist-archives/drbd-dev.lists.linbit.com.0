Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33E72D4D
	for <lists+drbd-dev@lfdr.de>; Wed, 24 Jul 2019 13:20:37 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 37252101AC4E;
	Wed, 24 Jul 2019 13:20:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C8EB101AC4B
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 13:19:51 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id v19so41285193wmj.5
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 04:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id;
	bh=opj8lnCtN7uVcvkOiHNBMfsILzIZd7HuE+IB/qnbPFs=;
	b=ptu7eb3gRgUM8kdamZ0Qfro1g2odH7mK5XsS+V7bWcazYyUTAYkhNFtkYHBY2zrzZV
	rq/znHDgPlp6gwUdftOpA5iDyfVofAr2LFV6p30P4Zqgazv6JLcLQnpp+SWsjcq7eHWD
	ZEsoktGEo3Mim/OGLDFTPHrD/243womBwxOGcYdHjxPazDpNHeCDFgy/osYrNlKf+yxL
	LJn3XTAPzIbP5M5GgmJwUXCdsHe14nkYdZPv5RdTIqWsRnx/L5GWireahiWkiejIFluT
	vvhDpJW8aCj6c6c/E6AxPSUoyRptHl9WT6u3oTtrrAtkdaDjd0s8DfiSkRpRsnbVarTl
	hq6A==
X-Gm-Message-State: APjAAAW9G15TdfYB9M5RyR0m82+SMcO17YZYJhyCjQ/y5tI40DGG7cKc
	dZjt89CRymFHWLrgfT/i1hffQJfiEMHIRg==
X-Google-Smtp-Source: APXvYqyWqM6BkHJiYe55C7281Hvn1AzKFRi4MkOr5acsLh/SMWDDzUILDhQr90lrNf9NN+7LCWKj0Q==
X-Received: by 2002:a05:600c:212:: with SMTP id
	18mr24594152wmi.88.1563967190391; 
	Wed, 24 Jul 2019 04:19:50 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id a2sm45620274wmj.9.2019.07.24.04.19.49
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jul 2019 04:19:50 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Wed, 24 Jul 2019 13:19:48 +0200
Resent-Message-ID: <20190724111948.GG6697@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 910C2101AC44
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 06:11:35 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id f5so11667972pgu.5
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2019 21:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=opj8lnCtN7uVcvkOiHNBMfsILzIZd7HuE+IB/qnbPFs=;
	b=ltVI7vA+iq01wgiVxnieomCY9v/Tub804FD/gn9yiUjeQMRw2XKJofb5kolEda7nrV
	v3aQUuQuzvKVF3jveZuBXMoNL+KrzVgCeDLCc8nV9CpqFCUMe6jmzNjNLGf0Khh2pywL
	sUBhtVnBipvGnWDKC5Yj0crLE61C0zJiSYLjdQ0NaUHBjpCZjuhqnxFDAtLHM91JULXM
	wQpQxztA9L2D5PGuXsf18W+CJ1pmRMx7lFizLIgDBdmO1w0lUJww65iQgnxFp0cgoJOk
	K9/XZXQLUrUg/4/AEXqlc24YDF/UFQoFD7z6oxdRGgSqnLksMjaeBMoS6Qzvb3Fr0yiW
	n/Hw==
X-Received: by 2002:a62:cdc8:: with SMTP id o191mr9130518pfg.74.1563940176347; 
	Tue, 23 Jul 2019 20:49:36 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
	by smtp.gmail.com with ESMTPSA id
	t11sm51359610pgb.33.2019.07.23.20.49.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jul 2019 20:49:35 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	axboe@kernel.dk
Date: Wed, 24 Jul 2019 11:49:26 +0800
Message-Id: <20190724034926.28755-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: linux-block@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/2] block: drbd: Fix a possible null-pointer
	dereference in is_valid_state()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

In is_valid_state(), there is an if statement on line 839 to check
whether nc is NULL:
    if (nc)

When nc is NULL, it is used on line 880:
    (nc->verify_alg[0] == 0)

Thus, a possible null-pointer dereference may occur.

To fix this bug, nc is also checked on line 880.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/block/drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index eeaa3b49b264..3cf477e9cf6a 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -877,7 +877,7 @@ is_valid_state(struct drbd_device *device, union drbd_state ns)
 		rv = SS_CONNECTED_OUTDATES;
 
 	else if ((ns.conn == C_VERIFY_S || ns.conn == C_VERIFY_T) &&
-		 (nc->verify_alg[0] == 0))
+		 (nc && nc->verify_alg[0] == 0))
 		rv = SS_NO_VERIFY_ALG;
 
 	else if ((ns.conn == C_VERIFY_S || ns.conn == C_VERIFY_T) &&
-- 
2.17.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
