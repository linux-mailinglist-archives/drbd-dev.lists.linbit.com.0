Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC69D7B45
	for <lists+drbd-dev@lfdr.de>; Mon, 25 Nov 2024 06:37:59 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7A941420303;
	Mon, 25 Nov 2024 06:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9A5A42006B
	for <drbd-dev@lists.linbit.com>; Sun, 24 Nov 2024 14:46:59 +0100 (CET)
Received: by mail-pl1-f174.google.com with SMTP id
	d9443c01a7336-21263dbbbc4so38051405ad.1
	for <drbd-dev@lists.linbit.com>; Sun, 24 Nov 2024 05:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1732456018; x=1733060818;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=ZmISgBoq2URn/hDyR4q7MEAA7ngEur9IZlkoC4zkGCQ=;
	b=S6dyyMKL8MqRSEhBLJcZKwFY5X+Afai1OfsKZxqoEkCIVOzeq4pzJGiABe4p3CXuws
	eEFtXqvZRB4bd01EtexHcRLufnbjtmsNf+VHx0G/CYOUDq/yrFVYAzCo60zIS8HXxouP
	tQCZt3qKvCcqioQHBzq7iKb+/cWxJ+T8wutrYSMoq/Ns3qIPqE7I0X1NwAdO0rHse7bR
	YJfQZApOWzkZ1wQkGnr5Qyaa/tV0U2wB0uQWjs35uAc/BDZveadJoU4kFlMPepAjAXTA
	f2kDZt4oEbI4EJc6iLRWFo0MpxwgSGF3OeQzeh05XJq7jCLlmWGBtNToX0O4YGI1o53p
	0MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1732456018; x=1733060818;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=ZmISgBoq2URn/hDyR4q7MEAA7ngEur9IZlkoC4zkGCQ=;
	b=kzfKU2xz7bw8gcszhTA7TxKKx5XXf3mpNj+CvEVNXmd7jA2Cr93qfXfY/VbUaOmIu6
	BaZKyfy4x0tHFqs7RnLLLvE6acZVCtwQOC+NMwe1cbo0UbLzARN3t3fT06I13hv0iS85
	vd77FFG/euK2puZ+uumDhVOQtnDBJG8kJoUm5w2XFjf0RexhSk4/d7YiUbBPkamZX58L
	xMgQG63kXaZOnSrecDMxvsg9hEhjM8d+bR1yC4al8/CA8pgqLQZSI08Q9T8KTRYVCu7q
	hJDhh0X7/Mh8mvOdQggOje5EjD5jyp3vm4e0k5HODt+8nsTEYgeXXg6FMVJ0z1laqOjR
	ytAA==
X-Forwarded-Encrypted: i=1;
	AJvYcCUpNFeiawKY5JuZD+b3s9kqxf/uh/7v4k+y9DnmQCMv4sQZG3tA66z4g5Pf10getm2yUujTPk19Vw==@lists.linbit.com
X-Gm-Message-State: AOJu0YwbubaQwzglYhYMEqVfczWC9xj++FjcOrT2EYWt2r0eRAPKa47U
	/rH/b+T2cXtRAmu8ydtkaU988u383jQpGnBp2YUkvtA2SWXyzZ2Y
X-Gm-Gg: ASbGncuWGmxkTOJYIPOIK1ggms2FmlvAO7bLpe4ifjhJ83ls2IlNqkLxIMZyGT3TAvL
	E1myiJfoveykjI0StmRLEv+/euescj72bHjUEOuipVIeb9WIjVSJGTcqructVV8vRX8rjkzza8t
	HEOc3U1HL0NrS2IOs0UqXI6xSVIn5KZBc9i4SXyfVrwDTtKleLD7EdMT3FlTGmRgi3TAH73PDpP
	3XCdzv06D2Qz3vIK7xWGcniCVlb7yYPkXEpBv5ShbNa8l3BKqkdhbQMQsILxFaDpA==
X-Google-Smtp-Source: AGHT+IEeTHJwNLsbC33Xz4h5tJ2xj1ax/aWAICGlsuNXeujZin4eKHBeBYybX8UBaIWL39fJsXyxvA==
X-Received: by 2002:a17:902:ccc8:b0:212:5d53:d02c with SMTP id
	d9443c01a7336-2129fd74093mr130141755ad.50.1732456018455; 
	Sun, 24 Nov 2024 05:46:58 -0800 (PST)
Received: from localhost.localdomain ([49.206.113.92])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-2129db8c864sm46937225ad.37.2024.11.24.05.46.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2024 05:46:57 -0800 (PST)
From: Saru2003 <sarvesh20123@gmail.com>
To: minchan@kernel.org,
	senozhatsky@chromium.org
Subject: [PATCH] Corrected the spelling of dictionary in the example usage of
	'algorithm_params' in the ZRAM documentation.
Date: Sun, 24 Nov 2024 19:15:50 +0530
Message-Id: <20241124134550.69112-1-sarvesh20123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Nov 2024 06:37:52 +0100
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

Signed-off-by: Saru2003 <sarvesh20123@gmail.com>
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

