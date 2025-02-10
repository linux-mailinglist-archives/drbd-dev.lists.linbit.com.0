Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5859DA304AF
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Feb 2025 08:41:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7DD0716109C;
	Tue, 11 Feb 2025 08:41:28 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5DB8A160650
	for <drbd-dev@lists.linbit.com>; Mon, 10 Feb 2025 12:13:30 +0100 (CET)
Received: by mail-wm1-f51.google.com with SMTP id
	5b1f17b1804b1-43944c51e41so7772795e9.0
	for <drbd-dev@lists.linbit.com>; Mon, 10 Feb 2025 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1739186010; x=1739790810;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=LSdJQgcp2y7iHjwit0HOOl9HKbnE8QQbbuMwDImG398=;
	b=RtxSJCAvV9yNlWvWyPdVZJ1bAiztyztfZG62vUAlfVbzhTmHd14YHVGjuAszTLNypE
	MUaFkBhfShZBo41ezqA7vHvXK9Q6BU2C0CZh2l8fTjND2zIapQi7VUOCfI7wHMiEiZQv
	CbOvhwMy+/GTgjA2yLiZktOjeLt/h0Z7yY+U15lw2PABQ+T6lzE0Kp7xqtmiPAFYOpZc
	twGuJFfK/2pRev7ZYQPbKrVVVwOifeU5KkZJmIVGcKuE5CJoBkbWMl2tKcvpqp914wMN
	otgBmnUjzgCQemvgjpB650wVqXdtSBcXaRRbeCho6caiR+ayki4gWPFE0Ik5usvY6qSl
	vRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1739186010; x=1739790810;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=LSdJQgcp2y7iHjwit0HOOl9HKbnE8QQbbuMwDImG398=;
	b=ca3mPLJnuKY7nWDqjY1lWzFgBPkFwEzmp/ohU0DCvzNKjS+16ZjqqNRc4LDrs4bAgq
	TN/9kWkm73+UJ9AiTA+l5JkzghDL10/GcMS8bSW9GS7AiOjVBjRQabRGJX7eIgHQytnQ
	huNL/JxB3ZAhz7RMy0G3zLhudssBAeX6oiLNIeqvtoK+CxITj2TU/TTMsYExKF4DgPkR
	DX9jQKmRFFn9wnpvEIIEt6lUb1fF0nWYkbYOw53D3rj96lWffW7hexKe2ofgeceo3yf9
	YksXXipxazY9Ci/tS4PLpmVYCPdGeoJZFUCO+tthYM7cxls+86x7Zs+CXm460U4EGfwX
	9Leg==
X-Gm-Message-State: AOJu0Yz4feznS+UH61gu8OZ7p8muCkdGLMOIiWJWzH3+2YHyb3n0ek1p
	xUSfkQa8bZDvRPWBNPoNsuZXZ8VQ6PYei8dyP8Qkc18Y2c4TSm1H
X-Gm-Gg: ASbGncvMstZnm9JW8FDyFVDJ1bhN22RMhTSi4s50CuNa+fL5kL+0R0anK8Sx9d1WHR8
	NDwR7fxQyyHFqA3/ngFQYh1m09BkJgsdi+gx/k/c2TOnTviS6vn8M+rPGaCO1n1Y1zq45+aeKwF
	wHM1Jf0yu9bXneurjyi9jyjwIEYK6ZNHz0Ejs3kQz8+Rdnoubpcf8+gBdnqTWaVYkn4ioGG8C69
	TEwMUYeJDHQGL0Mix9mdHlcJpj2GNCGVv6h/YeGthI+P6HtXAvoiGt+zcx2zsPS8VEgH4QlQAao
	WVBsNoTGBBi/
X-Google-Smtp-Source: AGHT+IFaU2YoCTpHdtd/tojrjTH8ALsB9SNLM2ym1wrDznm+SKutFiqojoOwPae3ZpHcm6k0gVP0mA==
X-Received: by 2002:a05:600c:468c:b0:435:23c:e23e with SMTP id
	5b1f17b1804b1-4392498a1eemr107768405e9.12.1739186009633; 
	Mon, 10 Feb 2025 03:13:29 -0800 (PST)
Received: from void.void ([141.226.169.178]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-38dc672b55bsm10260635f8f.79.2025.02.10.03.13.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2025 03:13:29 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: Fix typo in error directive
Date: Mon, 10 Feb 2025 13:13:05 +0200
Message-ID: <20250210111324.29407-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Feb 2025 08:41:23 +0100
Cc: linux-block@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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

There is a typo in error directive:
 - endianess -> endianness

Fix it via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/block/drbd/drbd_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.h b/drivers/block/drbd/drbd_state.h
index cbaeb8018dbf..89d7c828eb59 100644
--- a/drivers/block/drbd/drbd_state.h
+++ b/drivers/block/drbd/drbd_state.h
@@ -106,7 +106,7 @@ union drbd_dev_state {
 		unsigned peer:2 ;   /* 3/4	 primary/secondary/unknown */
 		unsigned role:2 ;   /* 3/4	 primary/secondary/unknown */
 #else
-# error "this endianess is not supported"
+# error "this endianness is not supported"
 #endif
 	};
 	unsigned int i;
-- 
2.48.1.268.g9520f7d998

