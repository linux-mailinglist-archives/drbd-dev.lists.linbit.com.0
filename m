Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F9877B20
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Mar 2024 08:04:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9DEDB4202BF;
	Mon, 11 Mar 2024 08:04:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8195420178
	for <drbd-dev@lists.linbit.com>; Mon, 11 Mar 2024 04:08:00 +0100 (CET)
Received: by mail-pl1-f176.google.com with SMTP id
	d9443c01a7336-1dcf0d7dc8bso3171245ad.0
	for <drbd-dev@lists.linbit.com>; Sun, 10 Mar 2024 20:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1710126479; x=1710731279;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=DcGqr5CIuEqHVlI4/PROdr6v9f2SLyEhz6wyKlzGBoQ=;
	b=D5FzUaF/hO2cod4a6Qi+xgPyv1nfMLJXiVASCSFLDhS7VDBDKTJu9jiEtXt5VXtFhF
	J3sXT573etW7DKX1VxiaA6tr0L6AgwQye/j9dvEvZYs+W/57WHa2ISC3by0SkoVq/Oi2
	4a6VEfhBu4KW7I1Ra2bNwk6BbSKXPc8WSTPKfERreV9Uv7ym+1/FaHiL9J0mXqysTxcv
	OEsh55GHe1KZQ2ODZpOtp1rpO4m06Pv9iBkfP/SRtm3Ci37Hf4hbt1Ue1kxw8scfdFg9
	HzDI/dnj10C4bRPdod1BIr4VmZ4IJHd1myoV7Lb1ufQwVh2EkAipQammY6o4NLwAXOEv
	KSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1710126479; x=1710731279;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=DcGqr5CIuEqHVlI4/PROdr6v9f2SLyEhz6wyKlzGBoQ=;
	b=AIc6DXuTx94lDfEL7ET8s66x5XP0ZUlTt8hj5bxuEFsGYZcBEUIIf/C3mCdQNS/vNn
	d5wXyjY/+YaplFHjnVcc7DUWWXquFPGfmL+Yrio7prCXxhq1GqA6TF3/5pk48g8AQp+U
	qxi/gqvWpxEeoeQIR9S6klTrGqXvbxm4zbKc8avTkGaMKGi/YF/uPGQwbtWnxwQPJK87
	4HJNLHG1CaZaZW3UGE3H0Hp5dRdltVHVJ2qIf2Qm891Ne5fjFQ2VjRBK6tXNPcqwmBlK
	xbCx55oyvE++FZNkQw4TNkMneT4nADtJSCqQKRPqPugfIBNetSDLCcKB9OXYRWqWB9zv
	M//g==
X-Forwarded-Encrypted: i=1;
	AJvYcCXvrSOzpjA5vhetWMUDV7WXjY9EKwgRKc8/pDSX3hc2OSLvN3uKhvmzFKPwitD3kSiJSGrSsYpxFFJi9ATLCg/HZro6wj/l+Gin
X-Gm-Message-State: AOJu0YyePN5VPgTAF/vxGzqDyhXS/BUlIrginLLS6iQS64p1ri3mOznY
	JYpKPLKUF/+tV1Rf4vqMpbZUMNVZ0u1S+RhDm6t4oQLFRlc4mMgu
X-Google-Smtp-Source: AGHT+IFPLoe8prsZnH/IcoheBux0DDIfZMnWJLPR2QtXvxdPGYwSYwOHsyS4BA4UTnwXv3vSOk45Yg==
X-Received: by 2002:a17:902:7b91:b0:1db:94a9:f9f0 with SMTP id
	w17-20020a1709027b9100b001db94a9f9f0mr6247911pll.2.1710126479574;
	Sun, 10 Mar 2024 20:07:59 -0700 (PDT)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:b289:6f57:682e:c7f1])
	by smtp.gmail.com with ESMTPSA id
	c8-20020a170902d48800b001dd8cf4170bsm1879641plg.230.2024.03.10.20.07.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Mar 2024 20:07:58 -0700 (PDT)
From: I-HSIN CHENG <richard120310@gmail.com>
To: philipp.reisner@linbit.com
Subject: [PATCH] lru_cache: Initialize hlist_head in lc_create
Date: Mon, 11 Mar 2024 11:07:35 +0800
Message-Id: <20240311030735.233470-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Mar 2024 08:03:57 +0100
Cc: lars.ellenberg@linbit.com, I-HSIN CHENG <richard120310@gmail.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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

Use INIT_HLIST_HEAD to perform the initialization for each pointer to
struct list_head in the variable "slot" to provide more safety and
prevent possible bugs from uninitialized behavior.

Signed-off-by: I-HSIN CHENG <richard120310@gmail.com>
---
 lib/lru_cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/lru_cache.c b/lib/lru_cache.c
index b3d918761..f2197aae1 100644
--- a/lib/lru_cache.c
+++ b/lib/lru_cache.c
@@ -105,6 +105,9 @@ struct lru_cache *lc_create(const char *name, struct kmem_cache *cache,
 	if (!lc)
 		goto out_fail;
 
+	for (int i = 0; i < e_count; i++)
+		INIT_HLIST_HEAD(slot + (i * sizeof(struct hlist_head)));
+
 	INIT_LIST_HEAD(&lc->in_use);
 	INIT_LIST_HEAD(&lc->lru);
 	INIT_LIST_HEAD(&lc->free);
-- 
2.34.1

