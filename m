Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9DA1668B
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jan 2025 07:11:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D629916B819;
	Mon, 20 Jan 2025 07:11:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48711160963
	for <drbd-dev@lists.linbit.com>; Sun, 29 Dec 2024 05:28:07 +0100 (CET)
Received: by mail-pl1-f196.google.com with SMTP id
	d9443c01a7336-21644aca3a0so2402625ad.3
	for <drbd-dev@lists.linbit.com>; Sat, 28 Dec 2024 20:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1735446487; x=1736051287;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=oBrWL7GllNsi0LAiNro+Jy+rbseWxtpto9r5kXiY8ZM=;
	b=MArRmk6AIPydW+tUo2BFL9d+EPo7F3J0lzPgIODnpTisP0PVC5fGRPaQl475wTzN11
	oVQ3PiCz7jVZ/6YfXtO/07GvItXtpLbS5gI0wdhJVT1suHiQal2ewXLzRm0D2aAI8SrP
	LJqxKTt95CMSVCzT814UdzFAKzPhvvT1oN0zdXoQsWjcWYegqs7eGjx5rzyhT8nQJvel
	J5nk+bU2IjACqgEqsu0JaDy4I6hrGtoFLR2gKuXwJ2CEwq5CGJ01tA9deIoi/Hqe4bMR
	k1UNukV34JEkGxJ6TIWMn+oMe2R3lpEyTS0vPcHuiFB2MR4ua9veUJb10FN3jN7V8u7q
	ZS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1735446487; x=1736051287;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=oBrWL7GllNsi0LAiNro+Jy+rbseWxtpto9r5kXiY8ZM=;
	b=oAxmb1svw5+K7dclq3J49UuAROur9X+HAV7a3MyoD/G35ftzoiOhWoXJ4seQAnNuMt
	KTXMmyDhy0tpkRT5LXH9QYj6x2tsTu4pKXllFJ2e9rgbwMgygJDbXWy6ztDWmNj4bWup
	/5SNpDeC/T8XNbkh+jVKR1mPkIWtCocV8dY/1epFcKdrm0+GCiDge0UbxNr3VGywz7Bk
	SJrfdjJAV2wGtnN+5iM05IRCYhPJspXfCUusXh57u8EeP4d6Mok/07+7xuGOmPwubd9W
	oW5eJfRxcCfwHJmSMi6y+iIesnAxx1evFXZ5gxwPWt5R05Cs1kPY39AKbIcZ3DVqMHII
	1FdQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCVruZbDoG5vVKDnX0KO3YSpqhvsZwCDXshQSISebHkcKsF2QOzrClcKn5wfmETMNVmE+0R4s+wW6Q==@lists.linbit.com
X-Gm-Message-State: AOJu0YwpFKsBecWqn8nkA/OiUNt2QcYfnZ5nt0GGU/FxPOmuGNICiDnR
	mG0hH2Wt89s0yxF8OfLOhIPvEMraGaAMkKEdLrekLWiHzs+ii9Sm
X-Gm-Gg: ASbGncvgIKOpIcoUfj+hUCmtCVko89tp2LaVXm0aRriOlgMh7RZu+xy99WEP+GInC1b
	VqBOHUauNaDFRODWTgju5nxA/XWBHwvoinGQ/uLSOr8+H2PphLCt3bPY7VkuH/uGbWhXUD3pK9v
	bkiqJqj4tQoB3nCcfoSEbXXuKpW0PB9ju3wPGYDuxQWK+yT4ROoFPKhXQEgUlWAWLDbDNk7SVqc
	oQ9WJCFnHqFRiDfScE51adYfSi3Cx8fI7zVurq06fnNVPMScWUvmCWOSb2bMh1pzoPY
X-Google-Smtp-Source: AGHT+IHgUdW+0UmloENQn+1Zkn7yQW144gDP51T6HntWWBf+b3N+bM7oD5Wj4FfS53Ad3kkuvErKGg==
X-Received: by 2002:a17:90b:2f45:b0:2f4:434d:c7ed with SMTP id
	98e67ed59e1d1-2f452e1cc5cmr47887421a91.16.1735446486853; 
	Sat, 28 Dec 2024 20:28:06 -0800 (PST)
Received: from shilearning.. ([180.109.90.38])
	by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-2f47b3349a9sm10924394a91.5.2024.12.28.20.28.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2024 20:28:06 -0800 (PST)
From: Shi Xinhe <shixinhe6@gmail.com>
To: minchan@kernel.org
Subject: [PATCH] Documentation zram: fix description about huge page writeback
	example
Date: Sun, 29 Dec 2024 04:27:58 +0000
Message-Id: <20241229042758.163842-1-shixinhe6@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jan 2025 07:11:04 +0100
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
	Shi Xinhe <shixinhe6@gmail.com>, lars.ellenberg@linbit.com,
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

Corrected the description to accurately reflect that huge page writeback example.

Signed-off-by: Shi Xinhe <shixinhe6@gmail.com>
---
 Documentation/admin-guide/blockdev/zram.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 1576fb93f06c..48ba192e667b 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -343,7 +343,7 @@ To use the feature, admin should set up backing device via::
 	echo /dev/sda5 > /sys/block/zramX/backing_dev
 
 before disksize setting. It supports only partitions at this moment.
-If admin wants to use incompressible page writeback, they could do it via::
+If admin wants to use huge page writeback, they could do it via::
 
 	echo huge > /sys/block/zramX/writeback
 
-- 
2.34.1

