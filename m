Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 61338B298DA
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Aug 2025 07:22:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2AB62162253;
	Mon, 18 Aug 2025 07:21:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5E18160907
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 09:18:51 +0200 (CEST)
Received: by mail-wm1-f42.google.com with SMTP id
	5b1f17b1804b1-459ddf8acf1so52552535e9.0
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1755069531; x=1755674331;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=hT7zNC81MFnipI/Ag5QHfvvjbScQaZ5LLk5g2Y05B+0=;
	b=gpvc6HRWPUzmqcKH/EqTJxca8pIhC+hDVHW1zniJVZc56IA86Ycluh8itfrwBObFDb
	s/fMakNc5sBPJPi0SKt8nCCRktcaqljX/dH0P7j1o9q30XUPmhKs6HysFHDTK4qwBmsz
	xJsLoUcxbWATVMDaO3pbfJkEcHZOACaTLVGIMEWFL3bSiDTDggOq+SJ5/3NMutaE9Q7X
	D4UBLSUyh8H2qyiTDSaBmlHkxuiNj8+N/6HQVU0Yf2e/h52HBYj6lmix0DbTfbsc45YF
	WSoXePyLo9SEsgAMXUWbQIUo1Ug2egBYhSKGnoK04CzVwbJipCBJb93YQ+NsYdt04Gzw
	n33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1755069531; x=1755674331;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=hT7zNC81MFnipI/Ag5QHfvvjbScQaZ5LLk5g2Y05B+0=;
	b=nwvlszn8BtbAIzR6zKe3ydCTxq0GzxCbFvtVdHYvd4zZSU7O4SArJ3IVXg56LWwNeI
	hL6mf8N2jd9S477z05mNWL6yKbD+9qIU194at77MUXrey25PHJANh7gn3n7FNos012q/
	6AY4FY14gf5YlMrNPVrwOEw9TLi+FQBOtnjr/dmT5cXFi08nJD0pjFTQ2nnZ9GlM5E71
	Yh2lKZ8mGnshdjRrOA3hzxhmjsvuoDS5LLOwUWrAOhpEwrOXePzvFczNT+MARHjOUVBW
	J6dZ3FQVjGGWhncPpO8as2mPeViAET72qqQzWHxu03hUejWNTrUsKxkElCASDIKRpLgY
	8iBg==
X-Forwarded-Encrypted: i=1;
	AJvYcCUKhmFmRcKyT3R/Mk5dy6qpbHHQDzLW5ZUTxD+wDZl66heB3FQP/rFotoYXQszhz6RDVp/n50tjyA==@lists.linbit.com
X-Gm-Message-State: AOJu0Ywe1yRIu1wfFE4wJTLT27XcUTIcX/eY11ARqPvSXmy/G94jXYOI
	cL8XZrZpuUbMuUGkfaESYit0lfeo8WBDTzfpiySzU9q3PV6QBBr1c0ZW
X-Gm-Gg: ASbGncsxKxTXF+QY9r3xsQBghHik3W1eaOpMI0lWNf2uBYbsMBQKz4yb1/PWqo2JerV
	RmWNhZP5cu72i0w+sDrN5yEIM5lrDumkfhjPtAZ/j6z+wss4taEMfW/2fKCP0pOf0t19NUON4fE
	GgNIlTlpmUaavKv+9UHFl4xDhfjvFXqUWLfYOye6teJEdRZ+HmhIOgfmHegxe3zTNiR31d1/lKr
	68W1dwq+5c2LsoAAxjwPXYcXUBp75dni/Yugu5WNoZHX52kt7NePHPutoTHz0157Ae/yctI72xi
	aFJfM93ovDdVVXzoobiruyNpv6iCP6ljefBsft9X33g+BbHxydDkq2HI2c1qDgH9BsDD02p5/s2
	rhcGcrMph1GBLXcz5bGg=
X-Google-Smtp-Source: AGHT+IEglHcl0W/BNit8lnQzWA48TYtNNYEYIowfu0Jp/7j5jJeKFCchpl/EObW5f9/xZRNrLK5j6g==
X-Received: by 2002:a05:600c:1d20:b0:459:db80:c2ce with SMTP id
	5b1f17b1804b1-45a165fbf95mr14268835e9.7.1755069530601; 
	Wed, 13 Aug 2025 00:18:50 -0700 (PDT)
Received: from pc.. ([102.208.164.18]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-45a16df1cf8sm16944565e9.24.2025.08.13.00.18.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Aug 2025 00:18:49 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Docs: admin-guide: Correct spelling mistake
Date: Wed, 13 Aug 2025 10:18:36 +0300
Message-ID: <20250813071837.668613-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Aug 2025 07:21:50 +0200
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, skhan@linuxfoundation.org,
	Erick Karanja <karanja99erick@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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

Fix spelling mistake directoy to directory

Reported-by: codespell

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 Documentation/admin-guide/blockdev/zoned_loop.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
index 9c7aa3b482f3..64dcfde7450a 100644
--- a/Documentation/admin-guide/blockdev/zoned_loop.rst
+++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
@@ -79,7 +79,7 @@ zone_capacity_mb   Device zone capacity (must always be equal to or lower than
                    the zone size. Default: zone size.
 conv_zones         Total number of conventioanl zones starting from sector 0.
                    Default: 8.
-base_dir           Path to the base directoy where to create the directory
+base_dir           Path to the base directory where to create the directory
                    containing the zone files of the device.
                    Default=/var/local/zloop.
                    The device directory containing the zone files is always
-- 
2.43.0

