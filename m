Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D95293F6C7
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jul 2024 15:36:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB09F42086A;
	Mon, 29 Jul 2024 15:35:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E0DF4205D7
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 15:34:33 +0200 (CEST)
Received: by mail-lj1-f180.google.com with SMTP id
	38308e7fff4ca-2ef2fccca2cso43117981fa.1
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1722260072; x=1722864872; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=BdyZpkmJwdfq3Lek2xqahDhlS+3lMvLBI2+fTAofbyM=;
	b=ciN/82R4mtbj80kgLpbo8YGXS2Jv2by07bK7TebvqCEP2MtaB9cMTS4HjByQk7us1X
	waDrj6wT8bakkSKq+tZ73SyiNyWWKNmjnlPOBd2lSE3eJLNjUtoGeAISuniNvRK2Rx6n
	B98/0Lz/5voCOAcOhleLM2ERECKqFKYOp1EBF+G4D54lORegOuSp0xlajdCmlEATB15e
	zc71jtZoxiGALhwvvTV2R8MevXudAGwpNO+OH5pCy4tdIz1vv3Hn6H97jVJpqfS9QvvY
	sxP5cGl0HrHD7QfT/0X494QNZrU3LYj38zTBWQsxXi36rgopJ8EPTRh+wwR1T5KTU7JU
	w2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1722260072; x=1722864872;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=BdyZpkmJwdfq3Lek2xqahDhlS+3lMvLBI2+fTAofbyM=;
	b=AjP7WUPYHiLST9tylJUZQVbrbXTlbu0YZ2W0lfQwpemirMPElbdZbu7L9tkqIPgCxP
	VAigcall2zMNak1yUWwCPehaH+D07OuzWjqTq3kDIck046aTkrK1sYaV1U6ce4gGUjq4
	W6jKHU6JCZfzFIN93/ybI+ZLi6kOPB8kwOTls59c3bQEfPJ4AD4OLxvHWoOvt4ixMPjr
	HCt6XhnmPkMTK70KmKOdd55M+xhycw5drLSmnrlbEZYVlX5hpwurvQB+ydXPFkcaYse8
	NdZT4vpxdrxTuuW1lDE4R3XIH7l553GNiL3HoYyZxrvlaNag+WOpr0rPlUw66rC/R013
	ed2g==
X-Gm-Message-State: AOJu0YyXcy3cx49nOwvaD75nOvgctDhFdgiP7RPdA0VFGHIl8OchJx08
	pvXWtbBo1FKTewkDHi1jQJp1mGfw8QY2FUJQy36PPiGvXBEkKkYtab+VXIxWdCxAU+QoKuc0nZo
	O
X-Google-Smtp-Source: AGHT+IHSHkRyLhL92F4T76DFJ/p20QqQN0rWdxkwKpz20KUfj2Xg/pDQj70ki14WkN/tjmDAbK5a0Q==
X-Received: by 2002:a2e:3a15:0:b0:2ef:22e6:234b with SMTP id
	38308e7fff4ca-2f12ee194bbmr46131771fa.26.1722260072340; 
	Mon, 29 Jul 2024 06:34:32 -0700 (PDT)
Received: from localhost.localdomain ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-70ead71832csm6802427b3a.72.2024.07.29.06.34.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jul 2024 06:34:31 -0700 (PDT)
From: Su Yue <glass.su@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [RFC PATCH 3/3] drbd.ocf: update for OCF 1.1
Date: Mon, 29 Jul 2024 21:34:10 +0800
Message-ID: <20240729133410.8332-4-glass.su@suse.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729133410.8332-1-glass.su@suse.com>
References: <20240729133410.8332-1-glass.su@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lars.ellenberg@linbit.com
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

According to [1], the commit
1. bumps drbd ocf version to 1.5
2. updates the <version> element to 1.1 for declare support OCF 1.1.
3. uses unique-group attribute but keeps deprecated unique attribute.
4. advertises new role names 'Unpromoted' and 'Unpromoted' instead of
    'Master' and 'Slave'.

Because of change[4], the drbd ocf RA won't be able to support old
names so we need to bump version of the RA.

Links: https://projects.clusterlabs.org/w/development/update_resource_agent_for_ocf_1.1/
Signed-off-by: Su Yue <glass.su@suse.com>
---
 scripts/drbd.ocf | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/drbd.ocf b/scripts/drbd.ocf
index bbe25f38edda..5b213640ec38 100755
--- a/scripts/drbd.ocf
+++ b/scripts/drbd.ocf
@@ -233,13 +233,13 @@ meta_data() {
 <?xml version="1.0"?>
 <!DOCTYPE resource-agent SYSTEM "ra-api-1.dtd">
 <!-- version attribute is version of this resource agent -->
-<resource-agent name="drbd" version="LINBIT 1.4">
+<resource-agent name="drbd" version="LINBIT 1.5">
 
 <!-- Version number of the standard this agent complies with -->
-<version>1.0</version>
+<version>1.1</version>
 
 <longdesc lang="en">
-This resource agent manages a DRBD resource as a master/slave resource.
+This resource agent manages a DRBD resource as a promotable resource.
 DRBD is a shared-nothing replicated storage device.
 
 NOTE:
@@ -253,10 +253,10 @@ See the DRBD User's Guide for more information.
 https://docs.linbit.com/
 </longdesc>
 
-<shortdesc lang="en">Manages a DRBD device as a Master/Slave resource</shortdesc>
+<shortdesc lang="en">Manages a DRBD device as a promotable resource</shortdesc>
 
 <parameters>
-<parameter name="drbd_resource" unique="1" required="1">
+<parameter name="drbd_resource" unique="1" unique-group="name" required="1">
 <longdesc lang="en">
 The name of the drbd resource from the drbd.conf file.
 </longdesc>
@@ -483,8 +483,8 @@ to be generated after the failover of a "healthy" DRBD.
 <action name="demote"	timeout="90" />
 <action name="notify"	timeout="90" />
 <action name="stop"    timeout="100" />
-<action name="monitor"  timeout="20" interval="20" role="Slave" />
-<action name="monitor"  timeout="20" interval="10" role="Master" />
+<action name="monitor"  timeout="20" interval="20" role="Unpromoted" />
+<action name="monitor"  timeout="20" interval="10" role="Promoted" />
 <action name="meta-data"  timeout="5" />
 <action name="validate-all" />
 </actions>
@@ -974,7 +974,7 @@ drbd_monitor() {
 	fi
 
 	case $status in
-	(0) : "OCF_SUCCESS aka 'running/slave'" ;;
+	(0) : "OCF_SUCCESS aka 'running/unpromotable'" ;;
 	(1) : "OCF_ERR_GENERIC" ;;
 	(2) : "OCF_ERR_ARGS" ;;
 	(3) : "OCF_ERR_UNIMPLEMENTED" ;;
-- 
2.45.2

