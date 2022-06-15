Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87F54CBB9
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Jun 2022 16:49:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3F77420F78;
	Wed, 15 Jun 2022 16:49:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
	[209.85.218.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43DFE420632
	for <drbd-dev@lists.linbit.com>; Wed, 15 Jun 2022 16:06:51 +0200 (CEST)
Received: by mail-ej1-f54.google.com with SMTP id n10so23468442ejk.5
	for <drbd-dev@lists.linbit.com>; Wed, 15 Jun 2022 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B0r9apFuqJJV7ZRpd76/TTNp8i8bzKGQL4SiZt2zSiM=;
	b=GdmxQK+IE0S17tl5qz5FCFXexDgV2yFTkqqbtob3GVABMG0S2cwYDJ4wEwndS+2hNg
	mv9wx3qn1Esnk3LWWo6IWrSjseMt2BBxWHblyQh8MLcTeaithgVv42SbyvZaYCrgxtZj
	ct8Du4XVoDyKXn/t4c0gUWjQxX8E81RUfmq/+EhA8u0/qjeNxvgS+cfz5w7uGXUu27Jx
	AuhglJimuPjPgP7Dw7m1dGDU8bP1umZaeYv1HzcQmxezlMvBJIy6ch7zV80r24oxhiHC
	DCIYXwVhVIz7mVaKsbGJrBay1/T3F7KfmcKElC1b7qrC0spWhGP/TCiN1PwdwYMvdSnL
	xlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B0r9apFuqJJV7ZRpd76/TTNp8i8bzKGQL4SiZt2zSiM=;
	b=RfGyXhjW036XG77x4OTMXXNvy8TQKDJXWCr6EuSvMOQ7jRFg2mn2loeHSYfijR66G0
	S+WgTfSOhuTpigtg4QxaPreRniO1FfzuZReHnAb8K2f6QDcQq25YfdM2ffQ3BSr2f+bV
	Kao1rlwrrAFSYjEZErano28WVp2vn/agZdbEI1dsoxB7uy4yK6d5syIprc8KwlBhUTTp
	XOysQA7TjTo8k1EXea90IGavv9/trpVy1uck+iJ2J1ZB1cSRP+b6gfz80k2TuHbsaNGA
	167WRtRKUjuAwDZRh5CYkbXziWCQgjef32TQBqF7oou4hGxhXN/vm5YPM+wgqfPFa5H4
	n+sA==
X-Gm-Message-State: AJIora+axfFB4wE8NFUavZAIdD25x0tNOaQHv7/zTNHyg2jtEtF4RDgc
	eXbuZYfFd+rDP4nLxrTiYgsmcH1ZMTZ6Vg==
X-Google-Smtp-Source: AGRyM1tRy6fl6HhnCUdH45RDLpY+EiN4XnruMYP4NbPwJdqXbmvFJqZQMSDsP/Idglog7f6qLtw2+Q==
X-Received: by 2002:a17:907:2cc5:b0:711:d50b:287a with SMTP id
	hg5-20020a1709072cc500b00711d50b287amr9055913ejc.47.1655302010186;
	Wed, 15 Jun 2022 07:06:50 -0700 (PDT)
Received: from localhost.localdomain ([109.164.100.246])
	by smtp.gmail.com with ESMTPSA id
	h14-20020a1709060f4e00b006fedcb78854sm6248330ejj.164.2022.06.15.07.06.48
	(version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
	Wed, 15 Jun 2022 07:06:49 -0700 (PDT)
From: Andrei Kvapil <kvapss@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Wed, 15 Jun 2022 16:06:20 +0200
Message-Id: <20220615140620.31630-1-kvapss@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jun 2022 16:49:47 +0200
Subject: [Drbd-dev] [PATCH] compat: make spaas url configurable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Add opportunity to override SPAAS_URL with local address in case of
building drbd in environments without external internet connectivity.
---
 Makefile                                    | 1 +
 drbd/Makefile                               | 2 ++
 drbd/drbd-kernel-compat/gen_compat_patch.sh | 7 ++++---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 87c29518..37d7851d 100644
--- a/Makefile
+++ b/Makefile
@@ -37,6 +37,7 @@ DOCKERIMAGESTARGETS = $(addprefix dockerimage.,$(DOCKERIMAGES))
 # Use the SPAAS (spatch as a service) online service
 # Have this as make variable for distributions.
 SPAAS ?= true
+SPAAS_URL ?= https://drbd.io:2020
 
 # default for KDIR/KVER
 ifndef KVER
diff --git a/drbd/Makefile b/drbd/Makefile
index 597cf30f..089e5e3a 100644
--- a/drbd/Makefile
+++ b/drbd/Makefile
@@ -40,7 +40,9 @@ MAKEFLAGS += -rR --no-print-directory
 # Use the SPAAS (spatch as a service) online service
 # Have this as make variable for distributions.
 SPAAS ?= true
+SPAAS_URL ?= https://drbd.io:2020
 export SPAAS
+export SPAAS_URL
 
 # since 2.6.16, KERNELRELEASE may be empty,
 # e.g. when building against some (broken?) linux-header package.
diff --git a/drbd/drbd-kernel-compat/gen_compat_patch.sh b/drbd/drbd-kernel-compat/gen_compat_patch.sh
index c57b961c..b8595722 100644
--- a/drbd/drbd-kernel-compat/gen_compat_patch.sh
+++ b/drbd/drbd-kernel-compat/gen_compat_patch.sh
@@ -125,10 +125,11 @@ else
     echo "  SPAAS    $chksum"
 
     # check if SPAAS is even reachable
-    if ! curl -fsS https://drbd.io:2020/api/v1/hello; then
+    SPAAS_URL=${SPAAS_URL:-https://drbd.io:2020}
+    if ! curl -fsS $SPAAS_URL/api/v1/hello; then
         echo "  ERROR: SPAAS is not reachable! Please check if your network"
         echo "  configuration or some firewall prohibits access to "
-        echo "  https://drbd.io:2020."
+        echo "  $SPAAS_URL."
         exit 1
     fi
 
@@ -136,7 +137,7 @@ else
     rm -f $compat_patch.tmp.header $compat_patch.tmp
     if ! base64 $incdir/compat.h |
 	curl -T - -X POST -o $compat_patch.tmp -D $compat_patch.tmp.header -f \
-	    https://drbd.io:2020/api/v1/spatch/$REL_VERSION
+	    $SPAAS_URL/api/v1/spatch/$REL_VERSION
     then
 	ex=${PIPESTATUS[*]}
 	(
-- 
2.32.0 (Apple Git-132)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
