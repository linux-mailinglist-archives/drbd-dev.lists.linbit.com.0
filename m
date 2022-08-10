Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 999AC58F04B
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Aug 2022 18:23:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4E5CF4207B2;
	Wed, 10 Aug 2022 18:23:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CCC47420667
	for <drbd-dev@lists.linbit.com>; Wed, 10 Aug 2022 18:23:34 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id
	o3-20020a17090a0a0300b001f7649cd317so2718456pjo.0
	for <drbd-dev@lists.linbit.com>; Wed, 10 Aug 2022 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc;
	bh=l8jhnzzqeUT5rXTZfmZY4lz5ekShp+fFejfQhPINonU=;
	b=VhANZ/q4aqvEs0EeI/8SuOVCaH8vxi28tvShKjDV/ju2ZX1OV7fEpSOLKwmr24AOil
	nCzLc2WEEpb+uhU66hB5q4Xo6kodhi/kjxdnv9tObLw/YWf8nELjzcx86Fy/6imXbO1L
	eAAF6VKmrWkvCTICh9BPkrnWubsegUWjHMlYtJ+f87fGI5I0a6anSI1Y3iehWDcNP8A+
	WuUmZPdEcYaoAetjaz+MRizyIET0lFomI+Yc6KTbTbcvcaL7dyx2AJkejFIePXtusjw+
	mGF1IDBzXzx8v7ZweCFVMIJSjukqeKmqhzmw2Yx3QAxYz4jtjG2Kz+1YLFaVDmKaxmFG
	/Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc;
	bh=l8jhnzzqeUT5rXTZfmZY4lz5ekShp+fFejfQhPINonU=;
	b=HSY59mAJEXMKhRAXdoGFxhp9zQA2Bvw6qZN5hyVJu7LKCuIncodi50DYBAbLWWU8fo
	8TZ7J8y+3k9vIf0kJEmA9/BpItQV9cCpdqhWmg9q9WcktBx1L6MiovQAayXYMtbD8Mzl
	wTrre5atZp+7wyD7+Q6XNuJsuJsLI8BEm6/RfmW2xkjVh8bvBOZ2f3aXTs5MwGau6ZBt
	JTX+KN2vduDDeeYQ1oa2vOYQvs7HiZ46q6oeG51PpDTd8cEt/3s3qR/WLAHg1k4hN2r2
	Egc2nXZRPnRWtRBmhXdBhnsg3ANHy6lzIQl3zvD2PNNKt0GnjUYxzNCSfoFBKKv8svqp
	Bj1Q==
X-Gm-Message-State: ACgBeo1rLx1TMvPsQLUmXID/gd4oLX2DBUVmq4fALbH7Bn6EEpFcte3R
	nyMtOKjrapwnobT7SWromLA=
X-Google-Smtp-Source: AA6agR4OvhdIkxW4LvoYb4FzC7Lsm5mQfR6T+5vFXIuNHryu6LWpDn/2oTNhAq1Rm5tFAzkNDd87dg==
X-Received: by 2002:a17:902:7c01:b0:16f:9649:be73 with SMTP id
	x1-20020a1709027c0100b0016f9649be73mr23601802pll.70.1660148613445;
	Wed, 10 Aug 2022 09:23:33 -0700 (PDT)
Received: from localhost.localdomain ([223.79.192.142])
	by smtp.gmail.com with ESMTPSA id
	u13-20020a170902e80d00b0015e8d4eb1f7sm13307539plg.65.2022.08.10.09.23.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 10 Aug 2022 09:23:32 -0700 (PDT)
From: John Sanpe <sanpeqf@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com
Date: Thu, 11 Aug 2022 00:23:01 +0800
Message-Id: <20220810162301.201540-1-sanpeqf@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: John Sanpe <sanpeqf@gmail.com>, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] lib/ubsan: add missing line feed of
	alignment-assumption.
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

Added three missing '\n' to pr_err format.

Signed-off-by: John Sanpe <sanpeqf@gmail.com>
---
 lib/ubsan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/ubsan.c b/lib/ubsan.c
index 36bd75e33426..705250ba88bf 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -371,14 +371,14 @@ void __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
 	ubsan_prologue(&data->location, "alignment-assumption");
 
 	if (offset)
-		pr_err("assumption of %lu byte alignment (with offset of %lu byte) for pointer of type %s failed",
+		pr_err("assumption of %lu byte alignment (with offset of %lu byte) for pointer of type %s failed\n",
 		       align, offset, data->type->type_name);
 	else
-		pr_err("assumption of %lu byte alignment for pointer of type %s failed",
+		pr_err("assumption of %lu byte alignment for pointer of type %s failed\n",
 		       align, data->type->type_name);
 
 	real_ptr = ptr - offset;
-	pr_err("%saddress is %lu aligned, misalignment offset is %lu bytes",
+	pr_err("%saddress is %lu aligned, misalignment offset is %lu bytes\n",
 	       offset ? "offset " : "", BIT(real_ptr ? __ffs(real_ptr) : 0),
 	       real_ptr & (align - 1));
 
-- 
2.36.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
