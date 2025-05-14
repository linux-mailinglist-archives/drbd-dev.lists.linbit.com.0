Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A6AB97DE
	for <lists+drbd-dev@lfdr.de>; Fri, 16 May 2025 10:41:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 91DAB160916;
	Fri, 16 May 2025 10:41:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 989B016B81E
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 17:04:10 +0200 (CEST)
Received: by mail-wr1-f45.google.com with SMTP id
	ffacd0b85a97d-3a0b4907a28so1029071f8f.2
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1747235050; x=1747839850; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=qinAM/CoQGYjAgznUCkC5zXMIdUvFUc/z6bj07ewl8s=;
	b=ZDdMC6i1SFD5bwNliIDd/2l+hTjV0a7HWP9XYBWAHVtshnGexALxF9q+y1+OhAC1id
	PsUZ8TOXfiuF9v+2cpZJXDzXrrLYaxUuBeeSKlRHnkHnGh4KYo91rsu/hiepJRxzrZXs
	PVF8FsmeueJTrn0nOc3GejP/MEol72m4Hp5gb5RrYqAvByTyf5drNLX+UjVdN/Z2VAvN
	1/6uhQwx9q6tmLRLJMccZiLHAAOBQBGuQe65XqkTErgFetWSyWHYX/9pEqJJsqHViExW
	q+ucetnHUJ4/IG0dXXmBdQRmc93feLqRv+DVz6GNR/BeDi+q3kFxzGOgUruodZXKlMpP
	Y4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1747235050; x=1747839850;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=qinAM/CoQGYjAgznUCkC5zXMIdUvFUc/z6bj07ewl8s=;
	b=GDQ8ypUQbR1NUHXG9Nl3VJnVoU1GJqO6J4LoVZnpxlCOHPINp5tWasEEguX4xiQomT
	86ln6EQwPWDVNXYIblOZEXhwFsGRM+kUroJ8R/X0ICPf30AjoE+wLVOTEEANK/yPsDar
	OjY5uUu9oNXXOx/9sH0QxM1VkuYDUBOKGiwPYB4cijb4AyH4f+MNkTQcloOuXa4hQsS8
	bcovhvXLtp602MqFcp0SsJ2SuEbPpHy6/5m3v2KIRP+RIZDKYH6lsqJGRg1y1SJ9PYni
	/wBLtQLC/T4DlFSdcqRvNEUXsAoEcl15GBlNPLwBq54aBJ0aFrbKy3KcbBuJwLDeSuvO
	txUQ==
X-Gm-Message-State: AOJu0YzDk4ON21hRbkVacAzKllgnZQy0FyzbxiRg9XPc5hb9IyshkKnU
	deI4xSa33gvTrWQqXjKKaZuR22to1JwgikRSu9ipARuHpa2uAYv1GiURBNDSB37rXQ0N54DC1OD
	y
X-Gm-Gg: ASbGnctiy+5u40UEgX6ksXZeFBV3a6nQSfaEjVebnD9DGszQvxlybK2/L08dsV8LFXR
	ddtkzqVc8DJ/U8mSDX+yzT9Jiug2GGJ3qkD6irnCGY9u/cccTDGKHjXpWQc5HABXnfgOKA2y3Ps
	j2SI8GPzqzOQtmWvhLBhSB7dDgaC6vQq95mT3N5TClCuLiMrEcNxad99IceEuxXUUAINlmVe1Hy
	w/8HiJJ+u9j8ic7EV3UECuvrGqEcU3W/XQQY8iXaI/tw5Fwq4GpOCe5KrNOMRQ8Y73WOSLtLfWZ
	sZcf/0E/+tS9JxI+qj3BinLqSPxVKuAS7l1XrWV9M3xEsn0QDzqPxhvSXsyWvTzP9Q==
X-Google-Smtp-Source: AGHT+IGdu4fHYC2Ig/18wD5QN91I/jzeyZ+pF2nYIZcJFNk/6xo0RnjZMMhDX28FxJmBUZyvl245fw==
X-Received: by 2002:a05:6000:1ace:b0:3a0:bd7a:7bab with SMTP id
	ffacd0b85a97d-3a34991a88emr1242769f8f.12.1747235048952; 
	Wed, 14 May 2025 08:04:08 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
	by smtp.gmail.com with ESMTPSA id
	41be03b00d2f7-b23493257bcsm8944484a12.6.2025.05.14.08.04.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 May 2025 08:04:08 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 1/2] build: changing SUSE release file
Date: Wed, 14 May 2025 23:03:59 +0800
Message-ID: <20250514150402.15848-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
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

