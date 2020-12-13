Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C152D9308
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 340684207BD;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 516824205A9
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:20 +0100 (CET)
Received: by mail-qk1-f171.google.com with SMTP id z11so12703683qkj.7
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8a5tj2JBx2bl81QF7qOK5H0R1+N6+ftvy6EOY2CK7RA=;
	b=U8DazKyTPnsWk+Jd3FM7MO0iybk/KEKl2SNkl0lyteB8W08L+tPTcOhLWK6wocqfLW
	b2fVXRTeW2LftVr6b8X7AlFRmsEaRkFCFi8ljLH3d2Uy5SssOaq/WkZ1TWC4a9cBLw5n
	fSXgzOEbC3SYwp1xMhPyfwWPwWXMpNf4Nd7QIomWhLYnhp2FpP1G0yZaME2lz5yBzob0
	IMXwf86ZLu03cY4vB1HVxEyR8ZVFAEmE1aZV3FLsG+EFctldnY5KA6evCHLYPZYxGtg0
	TvoBD2bEdS8jLIVSulrY5Q1KmEzTeQqR3R9XSgBc5082GhB4Q7myypMAwRSceHl8cKnt
	QNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8a5tj2JBx2bl81QF7qOK5H0R1+N6+ftvy6EOY2CK7RA=;
	b=HodqpYOBAINTu303X5yKarUc6uI27uu+KYs2Owj/xXjCCR/iNgKBqlRIFEHhEicnRg
	lln4OiIDf3ofEWuqua0mXruiwQw92vKKsB7T4kicOidHtb57fAcf3CB9HK2eCborl9EM
	wfjdfO3cDsXXK8hpFEm2Z0Qv/nHRAlJBFJmXGW1NMlrqz3qUsxvzO6dkW+JX4RSvktvu
	lqTpWsE1Kikqg1xH4CVRm/rGs+j5hiNY/7ossQWz3GXPdaSzVRGGG/nI9i1opjJOLm5N
	3DH8WSOsgElunDN41lzJkgDHhTosS8enMHpG9n5CluMAd6Y7FeJyXUwejqebxnCK/2YQ
	J2fw==
X-Gm-Message-State: AOAM530cORWQcXCzYiL1h9tfO8yavWmgHhqtLjs/rj/yc3TszvaNL9Dr
	vf6iDjfz2ZuOyFvW+KSs2rNdH1rx7xERGQ==
X-Google-Smtp-Source: ABdhPJzgMitCl8DU4dJmBXxfYrSwspeGvxcM1FpmOVGhClBCuJhJTyBh9Ir+62upIEImJXrxP2sJ/Q==
X-Received: by 2002:a37:63d1:: with SMTP id
	x200mr13088969qkb.164.1607836040168; 
	Sat, 12 Dec 2020 21:07:20 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:19 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:06:57 -0500
Message-Id: <20201213050704.997-2-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 1/8] compat: fix include for submit_bio test
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

Looks like this test is including the wrong header to get at struct
block_device_operations.

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd-kernel-compat/tests/have_submit_bio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd-kernel-compat/tests/have_submit_bio.c b/drbd/drbd-kernel-compat/tests/have_submit_bio.c
index 26bc7e8c..ca94cd27 100644
--- a/drbd/drbd-kernel-compat/tests/have_submit_bio.c
+++ b/drbd/drbd-kernel-compat/tests/have_submit_bio.c
@@ -1,6 +1,6 @@
 /* { "version": "v5.8", "commit": "c62b37d96b6eb3ec5ae4cbe00db107bf15aebc93", "comment": "Since 5.8 make_request_fn has been replaced by a block_device_operations method called submit_bio", "author": "Christoph Hellwig <hch@lst.de>", "date": "Wed Jul 1 10:59:43 2020 +0200" } */
 
-#include <linux/blk_types.h>
+#include <linux/blkdev.h>
 
 void foo(struct block_device_operations *ops)
 {
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
