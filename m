Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EECAB97E4
	for <lists+drbd-dev@lfdr.de>; Fri, 16 May 2025 10:41:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F7F116CD7D;
	Fri, 16 May 2025 10:41:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C0F5A16B84C
	for <drbd-dev@lists.linbit.com>; Thu, 15 May 2025 04:48:26 +0200 (CEST)
Received: by mail-wr1-f43.google.com with SMTP id
	ffacd0b85a97d-3a0b3f62d1aso61182f8f.1
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 19:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1747277305; x=1747882105; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=qinAM/CoQGYjAgznUCkC5zXMIdUvFUc/z6bj07ewl8s=;
	b=RSt9tE9z4QRBOt+TJFgMVgUxEJFImj+rUUy8ZMZgwk1NyMn3KFHtiUd25WOEvFDcYR
	UjkqHkKYa/Fseuv/HWp7d9myba39RR71l6gQpH6NLABHgai8tgEdrEznOR1r4feeM9f8
	d+SdAk+gRsyFQ2l28lugj4dzpda6nAzwjbSUnFIUyEt4pYln+pvcFWPioE6DQv+UGnse
	5BA+mgHBvhNWgHNy0/Q8pzn2rjjxUGjCqwbGNppTJqAmwVp+Ro/8kSsAv9zS1+ppkK18
	yReoB+t8Q48c42XtZ78Jwza6eJuo6eufZ7IEAZELyAj3WTjbrUdbQZbbIc3qqqvQWZKq
	IPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1747277305; x=1747882105;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=qinAM/CoQGYjAgznUCkC5zXMIdUvFUc/z6bj07ewl8s=;
	b=I+6jRx0XFK/RXNVsIQJyujAVXEzgGuAAflZlXcDADh+8pLGjvnOQEdlBrIfw3mxcFd
	SLMcSbb9orZngQwJz3e6XrO9M8BD0FD3MW2SmIiM4ohzNmeGJnWHK6CzqdXXtaQ8/1Gf
	QXRiMRh3F34sqJpGbf2WsuMB5aKHGMEUp/duOIk5I4i11pfDIlM+Nog5MaZtEefEu34y
	rQbwGAKQryQL17RJU2rpBiFU84aQep2KlgIG9tA7mmUFx2ppYAmyW1d0RLyS8cCSIo1/
	DT3GjVQ4oLIEP3q8hLnvojiMPMeeOgxowup+r6sXBpfaS7s5f1YiooqnZwkTYJbk2Z0q
	oR2g==
X-Gm-Message-State: AOJu0Yzk90fpeovfJqwhPL99ghftnjLsJCWnfsiAHO/Cwm+ZoZaCHIOl
	uUuVOFPoVeEpKIwgvsiimPscpiNILX9+nFKNj15zTUus4udbIGK5fdEIJ8zx5wpwNHsO4ri4RTk
	I
X-Gm-Gg: ASbGncuDDaSldQ8sbDlr9onYYcJ/DNm+PPwYf54sJoJceCT/j/RSvYSBzLRP3J5PvLB
	5Tu5jMW9bSeptCcu95vGq8cebaDyaqTAYD8BFnl8v20vfYhvAAXpUSoFMyAN5yp/zoQXGaAbpoj
	sYApL87Zx784aLYBElFbuopwZXdgXGnb/TO2x9pDWDlZDJ4vxYa8tE6dPkaoivFWgjUdJ2FijIt
	Qu2lMSNiiNG4BmtZcIQWdSIbWcyedxmCwNbccksB44pZohb3BbSwPWwGk7ZEIwzJqWZCrFKSbFG
	seAKX0aNHzFo4JnUC4tDv5weR0zqPLM0wUAMfsdd0IZ86NrRBxmx
X-Google-Smtp-Source: AGHT+IGpUEVbUFFKUorgFnKOcxvGVpDupldz4yp7qFPdW3QMY8XcbjvHp7NwD/3tqb/9mWdNGS+4+A==
X-Received: by 2002:a05:600c:1384:b0:43d:2318:ed7f with SMTP id
	5b1f17b1804b1-442f1ddcf8emr19618785e9.0.1747277304970; 
	Wed, 14 May 2025 19:48:24 -0700 (PDT)
Received: from p15.suse.cz ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7423772832csm10578197b3a.59.2025.05.14.19.48.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 May 2025 19:48:24 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [PATCH v2 1/2] build: changing SUSE release file
Date: Thu, 15 May 2025 10:48:14 +0800
Message-ID: <20250515024817.25717-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515024817.25717-1-heming.zhao@suse.com>
References: <20250515024817.25717-1-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 May 2025 10:41:11 +0200
Cc: zzhou@suse.com
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

This commit changes /etc/SuSe-release to /etc/os-release.
The SuSe-release file disappeared a long time ago.

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 282fdf1584e3..883fe3e5cdb3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -402,7 +402,7 @@ else
    if test -z $DISTRO; then
       AC_CHECK_FILE(/etc/redhat-release, [DISTRO="redhat"])
       AC_CHECK_FILE(/etc/debian_version, [DISTRO="debian"])
-      AC_CHECK_FILE(/etc/SuSE-release, [DISTRO="suse"])
+      AC_CHECK_FILE(/etc/os-release, [DISTRO="suse"])
    fi
    case "$DISTRO" in
         redhat)
@@ -439,7 +439,7 @@ else
 	    # RPM_REQ_HEARTBEAT="Requires: heartbeat"
 
 	    # Unfortunately gcc on SLES9 is broken with -O2. Works with -O1
-	    if grep -q 'VERSION = 9' /etc/SuSE-release; then
+	    if grep -q 'VERSION = 9' /etc/os-release; then
 		    CFLAGS="-g -O1"
 	    fi
 	    ;;
-- 
2.43.0

