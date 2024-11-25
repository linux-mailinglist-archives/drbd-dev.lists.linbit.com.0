Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id D21779D8AA6
	for <lists+drbd-dev@lfdr.de>; Mon, 25 Nov 2024 17:52:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4617420663;
	Mon, 25 Nov 2024 17:52:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A935420302
	for <drbd-dev@lists.linbit.com>; Mon, 25 Nov 2024 17:51:58 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id
	d9443c01a7336-21270d64faeso33104675ad.1
	for <drbd-dev@lists.linbit.com>; Mon, 25 Nov 2024 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1732553517; x=1733158317;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=MtUn9lt5gw5xGS0lfaSG6+NKW+5RIPrQ8eMvyuD2pds=;
	b=U0g3rdp02zWPAFAoQA8v3N/3Keg323fhLsX1MVvFUnsrkUktm/D5fi3wr2odFLCnND
	WfVKj4IXh8Wx22g3p8ASZCLtsTMLGPq9uu/paSWdl7rng489+bAmdeAZGfTznITPYuiK
	chVicaDILic65lCUcP6aX1XMEqaQ24Cy6rFc8oPocpBbP6HXAsvRHN4zCE5ileehXG60
	fQ+W2wcyeKlHklrrcFfwgnjXeLWcVvoZSAq9whh4RlXOqhO8YBNvGOqn2aNHP6wSIOY8
	APKeyhfQBDIKBZQsVzgT2dStSCTvxVgb6i9JeR1aeAg2xyRa/72M4Dcx1DyuZ4n1UB17
	FH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1732553517; x=1733158317;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=MtUn9lt5gw5xGS0lfaSG6+NKW+5RIPrQ8eMvyuD2pds=;
	b=MewF8aBxYc3OkxKuRyas32o+npzwQ8AyWtjJWLO2e/zVDc7nIDF52zcbJu7TRMNCiL
	z2Q8Nt5F1bhX4h8iMLHLDS9KCA39Y+RK+/xBOrOJVk8g4szWYfHwoEfn+xi0DHBxj/Vi
	Nxm9G/YeeW/DtAwsUciFFO7g3HJFusgLTx/3kq9FkjAbG6Yev0kORh8mGXmzKkE6NRZT
	JbT2hBBqdZbdgPrwE/PUcAj/cdZ6RwwX2uJrub461hGKGxDZH0GnWx29K5dRXgYnqKqw
	aU6Uyp0C5W5PWcbI5E+DiVrsMWPiaP+oXiswPt81StfbclX9plXwfIhd6xkv51GBxq5F
	NQew==
X-Forwarded-Encrypted: i=1;
	AJvYcCW82HMM5UGcTXo1ocs3ViH4haWqaLZWowq/N7V0oKRLqSyRQLZ/zZy10xhKglm7HNnywOKrpvWk2w==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw91m347z4cQJr8VjvW/DmAwkpsgFOG13rUkmL54XhN9C9H7RXD
	I5nNoTwfTOa424dYnHacLC1ZBT1K6dm5JOIlHDFAuE8Ro7Jam1Bb
X-Gm-Gg: ASbGncsh0KIcMAihayTP+BWEvqBloiYZRKDRGm8rCXZAmT4j9M5w3jFYYaEAQN1u7BC
	9Aqi9KZdLoxWyUq+37+8/FKeKyPx6bjWFrtV0J6QomuqdQQLllp2CbZvbDWjIUu10IVFOcyewup
	qpBBIJq7s+hBpVZm1VlhJNBz2EARMn90rH7NjFPPbDiHDdBPeOzc1ZT7k1kakcoQ1jTUlkfceT7
	I2EflplQjGlNZU/tASWha/Ol51kWwxAjSpjB5Inhid5e105LVSM/uDsQXjTHkyPww==
X-Google-Smtp-Source: AGHT+IF1b8SEIuY7pSRwqzWQ7mPcZgZAK0pcvKoIaS7ug2WaDSKDkMZOsUR2pmo2Gs/K2dxHnsFHEg==
X-Received: by 2002:a17:902:ce8c:b0:20b:707c:d688 with SMTP id
	d9443c01a7336-2129f67b0a9mr133164315ad.18.1732553517556; 
	Mon, 25 Nov 2024 08:51:57 -0800 (PST)
Received: from localhost.localdomain ([49.206.113.92])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-2129dc2214esm67126995ad.236.2024.11.25.08.51.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2024 08:51:57 -0800 (PST)
From: Saru2003 <sarvesh20123@gmail.com>
To: minchan@kernel.org,
	senozhatsky@chromium.org
Subject: [PATCH v2] Documentation: zram: fix dictionary spelling
Date: Mon, 25 Nov 2024 22:21:22 +0530
Message-Id: <20241125165122.17521-1-sarvesh20123@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125024927.GA440697@google.com>
References: <20241125024927.GA440697@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, terrelln@fb.com,
	Saru2003 <sarvesh20123@gmail.com>, lars.ellenberg@linbit.com,
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

Fixes a typo in the ZRAM documentation where 'dictioary' was
misspelled. Corrected it to 'dictionary' in the example usage
of 'algorithm_params'.

Signed-off-by: Sarveshwaar SS <sarvesh20123@gmail.com>
---
 Documentation/admin-guide/blockdev/zram.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 678d70d6e1c3..dbf2b4f47ec3 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -119,14 +119,14 @@ compression algorithm to use external pre-trained dictionary, pass full
 path to the `dict` along with other parameters::
 
 	#pass path to pre-trained zstd dictionary
-	echo "algo=zstd dict=/etc/dictioary" > /sys/block/zram0/algorithm_params
+	echo "algo=zstd dict=/etc/dictionary" > /sys/block/zram0/algorithm_params
 
 	#same, but using algorithm priority
-	echo "priority=1 dict=/etc/dictioary" > \
+	echo "priority=1 dict=/etc/dictionary" > \
 		/sys/block/zram0/algorithm_params
 
 	#pass path to pre-trained zstd dictionary and compression level
-	echo "algo=zstd level=8 dict=/etc/dictioary" > \
+	echo "algo=zstd level=8 dict=/etc/dictionary" > \
 		/sys/block/zram0/algorithm_params
 
 Parameters are algorithm specific: not all algorithms support pre-trained
-- 
2.34.1

