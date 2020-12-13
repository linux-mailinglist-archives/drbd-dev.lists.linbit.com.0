Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D202D9311
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87846420827;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2212B4202B2
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:07 +0100 (CET)
Received: by mail-il1-f178.google.com with SMTP id 2so12782248ilg.9
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8a5tj2JBx2bl81QF7qOK5H0R1+N6+ftvy6EOY2CK7RA=;
	b=m8dGdYcH09L+akumUWRNoGz1YMWVFGsstZuPS7TPu9M8/zFPPteHsh9/kfaiD2omBN
	zBB8GdeLNiopHV4ef9J0mZOpMz9SL20n47MJJhFaEj5uKwtxu6q4QhCJaCI9AA+2J1Di
	2sYFM01DZw1n4nZadNxDVzRXvZKBQtxF8X/Isgtdl+z1Nv8/X/D6tvTegk6q79F6KhSW
	WvMuqwwSig4lEh2oX6Dcv1k4Au4zj/BMLKRcow67TNa9A7ASj+xTDEYGPmolBiTgYiXB
	sXflCyZJiavoABtzwEhDp+65r2PHaNNZmqD/EsU04Ce2SFnq//R9bAZZLZ0Ann7x5KBE
	+lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8a5tj2JBx2bl81QF7qOK5H0R1+N6+ftvy6EOY2CK7RA=;
	b=MYphDifoXJIE7of0IcE5GzXHy2zqy2D2iPSi0oB0jFfK1jFpquMo78eMgVS9dC/bkT
	DXKe1E+of+MAHYPqJQTC9czMjVINHj40TWBOXmPypUW5qG218a5mTqqEZzEB2NzW2bNy
	URhByqCXJafftOOi31qWL12sQQs0zKTU3GYCalE2Oso1Udqm+vrVu/6Yvl6sli97zm9f
	OeIw61sJ1ZP3eSg4ulJ6qXtqMldPTALiNdHDg/Y01MlosDUGQxkI82G9AeX4cygZeQOE
	DjrznoXIKJxSuIAqm9dtTJve95GEo7UBIraIcrc8G+FmZAmfL1rm9JswW3zqQZkonvhS
	y5CQ==
X-Gm-Message-State: AOAM533Zsfl0rteZbNELXuQk2gIfBlkJVqFXzmePlXm1V4MF7CkjV6aO
	lCwOsacF17zLQ0SAxm1aORM7Uw9UonQoyA==
X-Google-Smtp-Source: ABdhPJzvUq7+jwpmqaAc69fNVALu7Kj8noMjxhaaIXhjWs8AEJGkWXejWA3rewYXNqeVZ2e/38NyEQ==
X-Received: by 2002:a92:6706:: with SMTP id b6mr28202768ilc.121.1607839147050; 
	Sat, 12 Dec 2020 21:59:07 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:06 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:52 -0500
Message-Id: <20201213055859.3305-2-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
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
