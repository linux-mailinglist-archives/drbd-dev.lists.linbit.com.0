Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D82D9309
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4BF5C420631;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 012D5420627
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:21 +0100 (CET)
Received: by mail-qk1-f178.google.com with SMTP id b64so8691554qkc.12
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B3MerAz6CxwlBZxnanBMvYILKAxYlgr54EtmdOqbjYI=;
	b=LAfTorV/VeAtr2MefFpQ6oIiQxuaXJkKGeuGD27fvmFw3b6wazwNmsL/basG5h3ZqR
	cx/cLfODo8vzNDvvdKk/+37BCbpMIo9zjiqIxNPcfmnhxwfADcGgb87re1mgvxv1XMku
	nuP2Tm8KYdUzFQpSxPOqBx0rNXa1s0QSoh01l3h/WuV2H9LXZ9Ic172+9KU82kVrqiMD
	bQ+JAspps7CEScVZN/eyQ6LigbGyRoVE2HpF4rpUHKZDjIedVcbn5euAi9GH4lqSG2Xx
	MVvkeiT5CPWW+MBOGgy8ybuuIGqrwP6/3xtpliHtFPsvUvVweFbaJvvzUIjVjF5gjTo0
	zePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B3MerAz6CxwlBZxnanBMvYILKAxYlgr54EtmdOqbjYI=;
	b=itvOLyO2SVwP0+OoDHlLSaC7jKKBZIOp3xaBA7ZF1ZZ9pfuS1rDxNOefjC3srbVnbL
	ntpgDS+Fl/m7RENQ22mzOmruqCkLQPvIFMREjb0aKUYjXggj9h5LUA+U+Rvvf7FIkeqk
	dioFbS+f4dFlK9aRrzk8z0C/V13NDzR5GPG+szZMBC3BUhLS3xCzRPCJFhQMp68WSaiG
	GQN2vjdnp5fK7Iox1Qmn5lwRKSvQY3cFYuVsoj49Qp4zDakXX7DBEHElPcewXmHbDDSG
	fm+9PI4D7JF2B3hGg38gVY2M8H5f+AOuDp5P+PWrPsVTKIz/a0bPDZeCAjPKJbrBVUca
	9OCA==
X-Gm-Message-State: AOAM532bXipSpP6p39Wv74Vzg501Kj5h8I8ZC0kDtNfeqspi+Luh+AI4
	0qr3P/q4z5XgsXGrPU/Iwc1mUm6vasPwRQ==
X-Google-Smtp-Source: ABdhPJxJzv/1B1FcDOoZA4U6/215eOUfB0NCgQGBeBAioXABnZc9MusEYRIA8DP9AhqPSV0kJCyBnA==
X-Received: by 2002:a37:8384:: with SMTP id
	f126mr25277108qkd.500.1607836040906; 
	Sat, 12 Dec 2020 21:07:20 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:20 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:06:58 -0500
Message-Id: <20201213050704.997-3-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 2/8] compat: fix include for blkdev_get_by_path
	test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This function lives in linux/blkdev.h

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c b/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c
index d0bae496..f795c1d1 100644
--- a/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c
+++ b/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c
@@ -1,4 +1,4 @@
-#include <linux/fs.h>
+#include <linux/blkdev.h>
 
 /*
  * In kernel version 2.6.38-rc1, open_bdev_exclusive() was replaced by
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
