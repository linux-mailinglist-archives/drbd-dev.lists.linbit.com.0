Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36287710E8F
	for <lists+drbd-dev@lfdr.de>; Thu, 25 May 2023 16:49:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D40F420AFF;
	Thu, 25 May 2023 16:49:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C8AD4202D0
	for <drbd-dev@lists.linbit.com>; Thu, 25 May 2023 16:49:31 +0200 (CEST)
Received: by mail-wr1-f47.google.com with SMTP id
	ffacd0b85a97d-3078a3f3b5fso2189988f8f.0
	for <drbd-dev@lists.linbit.com>; Thu, 25 May 2023 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20221208; t=1685026170; x=1687618170;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=dBdXLO3QgCu0jVhze/OBCYWw3sMFciuNKyeuR+p5Yis=;
	b=nJtFb4iGm83ffp5SG8PMDLl09PNviKy1/FasrfGtBrhMDVFRrvgbfQdXn3cLCTEpLH
	XabA+bDh0tFzUlrGFxrQjdqetIzmqivxtlCRPeYrBS94qkuI3kJ6pe15iyxiAjqKYmgr
	di2ajBdyrRv5OqPC2gLJXxAK+yI82D1+ULQbEMjA12scMaiUKcTic1SHtDX68BtWuvqR
	rXMqA+feOOov9J3lxU4cgW4i7tDCELIrmYccY8cAABW7Tmxd5bQrUZpozj3iV/p1MQ9S
	RR1+xpOZAh6WhHziVRneOLaX2zfeAn4DNovnVF8hVjHW1eOeHefUxZU+uocI0VT3oHvH
	+q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1685026170; x=1687618170;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=dBdXLO3QgCu0jVhze/OBCYWw3sMFciuNKyeuR+p5Yis=;
	b=PYzaBgXj0O357qJpvBSkErW5ZF1WFhDPEPPXR7Sybe0W6YkbOkTDOuwCaZ8e85B/XQ
	QxEQd0EWXZocHgdwTpHzwokvzXuFHKf3uW5d0GlROhtW2uFrW7g9sXUgjwgb16wAPQ6v
	tbvMe9Q32NRVekpKcjJz/4tjhbdvQ8AE6yQb1ZwzhC767akHa7CEitwOc5dnf3Pq9OvK
	2mzPOwfcahOd4+7EV2RTiMrPh1ndp0xLPZ74hOYmnjpIrVIk1QogslDvfdpLVKRQvJ62
	V+B8ncapRnRKkrMJ0LFzKLj3B4i7bxc05ncEXAAB1MrRadNWF/9D4HDeEfsifMM1L15+
	Dnqw==
X-Gm-Message-State: AC+VfDzNyB71CtGyNV4v+uwxVLgzcKcF6/5rI7BCarRdul7RHMzGyHFP
	DlxO70mTeKYb88tAP5VYNH/N1HeZHZ664A==
X-Google-Smtp-Source: ACHHUZ7uWRFUR5FuKq2mf8R/56Rg4OXfut04fNohbppAJi0RPwo8jxiO9QY3D+DzT8v1Eiq6syLVwg==
X-Received: by 2002:adf:cc8a:0:b0:309:3a60:d791 with SMTP id
	p10-20020adfcc8a000000b003093a60d791mr2863019wrj.54.1685026170244;
	Thu, 25 May 2023 07:49:30 -0700 (PDT)
Received: from localhost.localdomain (nat-32.starnet.cz. [178.255.168.32])
	by smtp.gmail.com with ESMTPSA id
	i5-20020a5d4385000000b003062b57ffd1sm2008931wrq.50.2023.05.25.07.49.29
	(version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
	Thu, 25 May 2023 07:49:29 -0700 (PDT)
From: Andrei Kvapil <kvapss@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Thu, 25 May 2023 16:49:15 +0200
Message-Id: <20230525144915.9031-1-kvapss@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Cc: Vasily Oleynikov <vasily.oleynikov@flant.com>
Subject: [Drbd-dev] [PATCH] containers: add commands to correct SELinux
	context
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

When running the entry.sh script with RAM-based module loading method, the
generated modules acquire the 'var_lib_t' context by default on certain systems.

This patch adds commands to correct the context to 'modules_object_t'
to allow seamless module loading on SELinux-enabled systems.

Co-developed-by: Vasily Oleynikov <vasily.oleynikov@flant.com>
---
 docker/entry.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docker/entry.sh b/docker/entry.sh
index 2c91734e6..978df6431 100644
--- a/docker/entry.sh
+++ b/docker/entry.sh
@@ -217,6 +217,10 @@ load_from_ram() {
 		find . -name "*.ko" -print0 | xargs -0 -n1 "/lib/modules/$(uname -r)/build/scripts/sign-file" "$CONFIG_MODULE_SIG_HASH" "${LB_SIGN}/signing_key.pem" "${LB_SIGN}/signing_key.x509" 
 	fi
 
+ 	chcon -t modules_object_t ./drbd.ko || true
+ 	chcon -t modules_object_t ./drbd_transport_tcp.ko || true
+ 	chcon -t modules_object_t ./drbd_transport_rdma.ko || true
+
 	insmod ./drbd.ko usermode_helper=disabled
 	insmod ./drbd_transport_tcp.ko
 	insmod ./drbd_transport_rdma.ko 2>/dev/null || true
-- 
2.32.0 (Apple Git-132)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
