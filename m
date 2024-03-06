Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B13D87384A
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:05:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6B45420590;
	Wed,  6 Mar 2024 15:05:17 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28E63420590
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:16 +0100 (CET)
Received: by mail-ed1-f49.google.com with SMTP id
	4fb4d7f45d1cf-5640fef9fa6so8470106a12.0
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733855;
	x=1710338655; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=DOlF+PxPHHeUuZ4uXPwhCLw1zVKgjCoV/5sm7c1pL88=;
	b=kO8ps++FvNTLq2few1l8Zm71ihkQwy2k4H5XuVAm4bvk8UQm+ELBmXuErBuDBPl0Ge
	qxs//lLESK+mH0yGr9r0oa2belOdWp3QaPJtOCOa6XVCwi6e/DpDkD/Jwi/x8JYWoCu/
	9NSG6bW5jID7w+0rha0ua2xvjYDUvNLu8Zir/3DQO2toSf7iRYKF+77F2UxpBvpmA/0I
	5e843feOXwY7TbYPJUTcyNdH2S/uzc28qTipdRk0PbmU97M8Ptw5/Cxss+1cETJ78FG+
	dkRw1f3Kb0FZROlU64HdzHw71JNZP5OSP54+MQiR3YxxRzyu3e08s92PlBDDNovxIvgb
	ncVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733855; x=1710338655;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=DOlF+PxPHHeUuZ4uXPwhCLw1zVKgjCoV/5sm7c1pL88=;
	b=hoAuuftEC+tqtWJeeNuPQNzc3utoDlI4ANlqSCDlz4GEsC8Xuos+tn++CPZ72ucOW3
	meKky274ds+/kL6hjfzQScK1l2oGWWqgxMIH9gG3EPgIJzJiNmNnCzdJJeh83SvT6DIo
	IHQHuwDnGq3LsMK8Yn7giO+KBGKBUyUaPftsIgy7gWi9tiRjxmSAgmsZqx4e3SD86Sbt
	gYLEhGWqOIB+X6ODvPhrVDkSSM7lFkLGf5hQSKzHMk+yn+2IJqhdga06mmoQ0xUp/LS4
	fqOZ8qYnx9pYWir2z9/yj5ZTTBkRRHo6X4UXK1qgnHR6oyP4j6RMMfmjc+JrpQAFEdzi
	0dYQ==
X-Gm-Message-State: AOJu0Ywc1gj3WS6PNJEMOEUq+N8tO/FcfyfZRDcNfQfvbxmE0ermcqn9
	yU39HQiyrnI0ajTKiAqtUjwvXkey94LP4NLCKnmXYckmvQFcky0UXtDlnaVjQgJXcj0b1hfy6TQ
	q0XI=
X-Google-Smtp-Source: AGHT+IEsmtCchwjV2c/OlW3sJOJ9K+6DxSfSVc4ahLA3PMgA9tHiKHAq8BeBnXBtz9HOsKB+MrnemQ==
X-Received: by 2002:a50:c90d:0:b0:565:471b:c047 with SMTP id
	o13-20020a50c90d000000b00565471bc047mr11643760edh.0.1709733855499;
	Wed, 06 Mar 2024 06:04:15 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:15 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/7] drbd: pass the max_hw_sectors limit to blk_alloc_disk
Date: Wed,  6 Mar 2024 15:03:26 +0100
Message-Id: <20240306140332.623759-2-philipp.reisner@linbit.com>
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

Pass a queue_limits structure with the max_hw_sectors limit to
blk_alloc_disk instead of updating the limit on the allocated gendisk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Reisner <philipp.reisner@linbit.com>
Reviewed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Tested-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index cea1e537fd56..113b441d4d36 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2690,6 +2690,14 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	int id;
 	int vnr = adm_ctx->volume;
 	enum drbd_ret_code err = ERR_NOMEM;
+	struct queue_limits lim = {
+		/*
+		 * Setting the max_hw_sectors to an odd value of 8kibyte here.
+		 * This triggers a max_bio_size message upon first attach or
+		 * connect.
+		 */
+		.max_hw_sectors		= DRBD_MAX_BIO_SIZE_SAFE >> 8,
+	};
 
 	device = minor_to_device(minor);
 	if (device)
@@ -2708,7 +2716,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	drbd_init_set_defaults(device);
 
-	disk = blk_alloc_disk(NULL, NUMA_NO_NODE);
+	disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_no_disk;
@@ -2729,9 +2737,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
 	blk_queue_write_cache(disk->queue, true, true);
-	/* Setting the max_hw_sectors to an odd value of 8kibyte here
-	   This triggers a max_bio_size message upon first attach or connect */
-	blk_queue_max_hw_sectors(disk->queue, DRBD_MAX_BIO_SIZE_SAFE >> 8);
 
 	device->md_io.page = alloc_page(GFP_KERNEL);
 	if (!device->md_io.page)
-- 
2.40.1

