Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBB87385C
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:06:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8167420633;
	Wed,  6 Mar 2024 15:06:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 573974205D4
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:20 +0100 (CET)
Received: by mail-ed1-f49.google.com with SMTP id
	4fb4d7f45d1cf-564fc495d83so8382089a12.0
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733860;
	x=1710338660; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=5OwPUuyVmsoh2r1aHxw3RV8Tg2NmftwwODINyucCfwc=;
	b=MGD0FLnWVcP1JAbWAzvkFjeAbs8MmCFf3jRN+qs5RYnclfAWc2ZerMImPxSLo1uZr7
	Yq7NS6tdBiSSnbNM3h/BPRO3R6EY54QgLZ26tGakh8p+T+QgO+8oh0lNfsl5ZZnQ2oQo
	YWvg4CmrvPzKTmJ3xNsXK6BLk0bma5aZ7aB1Gs4XqKAEW17ukQ4eZpBxrgRe5ZEkgAOM
	fJK4gK9YTjN8wAT8suF06FR/ySmdj2WVda4Cd5ygdqT1McoxiAR3EuQox7LaQSxzB7Gc
	Euoc+QNGk+KenmTWSToY3SvjQzt1KzvMpRH5zYMtXUIpstfok0zekHA8l5ERcYjzbCiD
	5u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733860; x=1710338660;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=5OwPUuyVmsoh2r1aHxw3RV8Tg2NmftwwODINyucCfwc=;
	b=dwQM/j7LqeD9soQk++r2slNVcXcbamjoRW9GEmn4QH8uRhmSIIIIC02/zq6FHR/05q
	pecEEvxGo3qfcjgjRP7+Uj/UfzLX/HztJ2FbW34BHc2bb7sPTBcet+S5FufZVkvCLijQ
	0I1ACSfTd4e5/+DcMIVZksuGW2aMGl94h9HEjK0muM/onOl2p+Hlh0haFn1uoKI4hIxl
	P4ScuqX31atIV48BQirwmGDTmF7DypQYz9tnbSemBgnQmnGafuFGxYP08+UydFZ4Lr2T
	GmLneqMp2iIII3gEQP+HO/rIYW0sxc9QD1IhmLUdAOQQdrSxHSkxCADdFzJB6XjP3XZT
	akSQ==
X-Gm-Message-State: AOJu0YzNDYmJ0r7WZo4AFjSNth2mVc3+0jzBy/UUb7F0gKzVWsuFT3AS
	XeZr68SQGn7ccn7wuphj348WlBVzWdvlh6YAk5y1JJxk0IKBMpSnkoXW1FU2bHRfTg==
X-Google-Smtp-Source: AGHT+IFo4frb0xUw34CkfDxdsamgCJ6nAx1QPSDWFHeTB3OUKfwmFvtU0AtdfTpm6nZ5gaSR90ZDvw==
X-Received: by 2002:a50:c90d:0:b0:563:c54e:ee with SMTP id
	o13-20020a50c90d000000b00563c54e00eemr10850628edh.2.1709733859877;
	Wed, 06 Mar 2024 06:04:19 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:19 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 5/7] drbd: don't set max_write_zeroes_sectors in
	decide_on_discard_support
Date: Wed,  6 Mar 2024 15:03:30 +0100
Message-Id: <20240306140332.623759-6-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240305134041.137006-1-hch@lst.de>
References: <20240305134041.137006-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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

From: Christoph Hellwig <hch@lst.de>

fixup_write_zeroes always overrides the max_write_zeroes_sectors value
a little further down the callchain, so don't bother to setup a limit
in decide_on_discard_support.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 0f40fdee0899..a79b7fe5335d 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1260,7 +1260,6 @@ static void decide_on_discard_support(struct drbd_device *device,
 	blk_queue_discard_granularity(q, 512);
 	max_discard_sectors = drbd_max_discard_sectors(connection);
 	blk_queue_max_discard_sectors(q, max_discard_sectors);
-	blk_queue_max_write_zeroes_sectors(q, max_discard_sectors);
 	return;
 
 not_supported:
-- 
2.40.1

