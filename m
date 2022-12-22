Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BB66D745
	for <lists+drbd-dev@lfdr.de>; Tue, 17 Jan 2023 08:52:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1FF7E42214A;
	Tue, 17 Jan 2023 08:52:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 20CEA42210F
	for <drbd-dev@lists.linbit.com>; Thu, 22 Dec 2022 04:20:22 +0100 (CET)
Received: by mail-pg1-f177.google.com with SMTP id b12so502066pgj.6
	for <drbd-dev@lists.linbit.com>; Wed, 21 Dec 2022 19:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=9PJ8uz0rxp3hHvSHKvksB7Kl+fG7eR7Mieev9l52RQM=;
	b=OZJ2iBodCiLa2Trh7yXOzHGYnOifVTaeHCM34ipoEIfUHY291ihIiNQjKM1j3S2cbt
	N42P/rgXlqFJgxdZM/o4tTb7jrg6EJm3Vfw/h5mhWEyxeTa6rmCSA1y89MHdA1BqcMc1
	9GnZ0yI3x9dhbTxMpAU/TFk7wiiWQC62BkI8Xk7aBJ5UgvPdkrAbGRTecSR6V+hg3oxi
	kXe6rumrUr41dfPfPyEgqcPioy4XvUnhPJgeLTTBXKeBsUz7/Nf8imws+xMrMYdopNac
	AYr3/592U+t1GAl+A9w7ZSOT7zwNBjYvSpEs5SRRBkHk5E81uLgyakXbqRQrIceGkAFX
	bwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=9PJ8uz0rxp3hHvSHKvksB7Kl+fG7eR7Mieev9l52RQM=;
	b=jeO050AKZVCgIGONEadT5n5+4+CurR6ON5QtJsVPzohKdSOpM52aUEOnHpkUF0ORyr
	wlqYIoZMsSb0c8gPO6PS9Lq3RbNCJbNY7xGenD8PP5CoPymLSDP0FsVFSoeUsVh0GsZ0
	H7f/2/sd8Oq5qmWld52PBiDzcO/AW+s/MlIco+3vUTNOAo/Y0nrvB1lcfApN/a/9T20w
	ZwdcNhdSJniCpoBQ/xc2Q2UE8taQZIBrFI0YGNw8cgOMmWnIWcVMUF14Wz3rlHsi3B4g
	UwshHmXpGKTVHtgY3pfuwGK1fscV3OEIVL3hm8y/tEqwKnKvNoWV4NIAPd91JBixwGfL
	59Lg==
X-Gm-Message-State: AFqh2kr1QYwcRvtxy9flH8/VPJXYhpGSZ8w2j9vHrN+BK0ScwiO1pEZJ
	GkxcrFcAZSK/3ayuYtUU4a8g1Tz+3z8=
X-Google-Smtp-Source: AMrXdXsG6/E+czBZ1XpyktxS800aKDbqHseb8M04RVhm+JEVGNuBKVpRBYHGAkW29iE8WcrzJz8IwQ==
X-Received: by 2002:a05:6a00:4d:b0:578:2b1b:e900 with SMTP id
	i13-20020a056a00004d00b005782b1be900mr3920166pfk.18.1671679221448;
	Wed, 21 Dec 2022 19:20:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
	by smtp.gmail.com with ESMTPSA id
	81-20020a621654000000b00574740c99e9sm11272674pfw.129.2022.12.21.19.20.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Dec 2022 19:20:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Wed, 21 Dec 2022 19:20:18 -0800
Message-Id: <20221222032018.1001700-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Jan 2023 08:52:22 +0100
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [Drbd-dev] [PATCH] replace off64_t with off_t
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

off_t is already 64-bits when _FILE_OFFSET_BITS=64
using off_t also makes it portable on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 user/v9/drbdadm_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/user/v9/drbdadm_main.c b/user/v9/drbdadm_main.c
index 91e9507d..2030946c 100644
--- a/user/v9/drbdadm_main.c
+++ b/user/v9/drbdadm_main.c
@@ -1264,11 +1264,11 @@ static int adm_resource(const struct cfg_ctx *ctx)
 	return ex;
 }
 
-static off64_t read_drbd_dev_size(int minor)
+static off_t read_drbd_dev_size(int minor)
 {
 	char *path;
 	FILE *file;
-	off64_t val;
+	off_t val;
 	int r;
 
 	m_asprintf(&path, "/sys/block/drbd%d/size", minor);
@@ -1289,9 +1289,9 @@ int adm_resize(const struct cfg_ctx *ctx)
 	char *argv[MAX_ARGS];
 	struct d_option *opt;
 	bool is_resize = !strcmp(ctx->cmd->name, "resize");
-	off64_t old_size = -1;
-	off64_t target_size = 0;
-	off64_t new_size;
+	off_t old_size = -1;
+	off_t target_size = 0;
+	off_t new_size;
 	int argc = 0;
 	int silent;
 	int ex;
-- 
2.39.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
