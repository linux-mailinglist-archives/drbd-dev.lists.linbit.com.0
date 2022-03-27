Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C394E866B
	for <lists+drbd-dev@lfdr.de>; Sun, 27 Mar 2022 09:09:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F16AE42060F;
	Sun, 27 Mar 2022 09:09:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ECBE74205D8
	for <drbd-dev@lists.linbit.com>; Sun, 27 Mar 2022 09:09:26 +0200 (CEST)
Received: by mail-pg1-f171.google.com with SMTP id w21so9827490pgm.7
	for <drbd-dev@lists.linbit.com>; Sun, 27 Mar 2022 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id;
	bh=Dswsk0jetBijYktZ7SH96xaSPfRhbnA9l3ZIGPdBlrI=;
	b=i6+b2XSkalNg6DOhuZPtEKFGG0z1vvDdmoEcVQ4ypDwvzICeXJOv4LFhwpx2x18QS+
	AhlWIC4s2MpT+zM5Ora+fCociP/CzNaaxGO+mJO+Z7nuQbZL7hQ1oRJlNk+n19Hq4lgb
	7A4rHk02cWxNisZq8XWes7odzO7hdXfD5DMzQIuPQjiRbP1yr1N0cCB7cM7R8ohpRLPx
	YINtCTy1tB07UxDqqu34cU/PVkwNZBOMFK0p8ZA/Dr3q9nYRJ8HLG8q214dSGaW1ETG9
	QrK6+hgJlceQmK7rDuk2ew0kSGyBPUZ1iORntFv13yzMoDOr4mqV6wloQ1dkju8jS0pY
	qzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dswsk0jetBijYktZ7SH96xaSPfRhbnA9l3ZIGPdBlrI=;
	b=jBrsCOXvtbUbM/dMuo5W/W+k6xqmVwB2ACpoGvqxVrqy1DZZS2p5aeLbNlVrGS7W7G
	0D/DjPytes5N4WQSpHPijJ9clxQAIepReK8gLGKUorWuN0/v00k8SxzrprZHICsQUNy6
	3LtWuWBxoWGTD+YIOm33+Xjdhq2hRVt3sZLyiFLvZuzgiE28SzBK+i73kqNwTJeKqiST
	Ab1CFntVhf5wdsVUz5JTSCd32Y5CPokjknjY7NBLak+SoDYd1XUonD6xQa1vbbu9aF7P
	f7zqsKiYvbBZP/qXuFVowwpw47FJB5rk90DMg9NEWpnS07f0EyOVLMdZ4YjiX5c+/K+N
	cNTA==
X-Gm-Message-State: AOAM532e533/0IKEmP9g5NqOpGrOnANp5qQ7KA4y9JhGUt5X1mZPBCC9
	XW48eRtV7VnLUuQtVJYsYks=
X-Google-Smtp-Source: ABdhPJymh6IMTtnDyhTTmlhAfbLgWrj5zjZfypZgJnag3MlTplfc8wEo9bq0GVF9wmHFKQk5NpcMMg==
X-Received: by 2002:a63:de0c:0:b0:378:9365:c3c6 with SMTP id
	f12-20020a63de0c000000b003789365c3c6mr5894337pgg.301.1648364965504;
	Sun, 27 Mar 2022 00:09:25 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
	k14-20020aa7820e000000b004f7134a70cdsm11349504pfi.61.2022.03.27.00.09.24
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 27 Mar 2022 00:09:24 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: philipp.reisner@linbit.com
Date: Sun, 27 Mar 2022 15:09:18 +0800
Message-Id: <20220327070918.8465-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: axboe@kernel.dk, agruen@linbit.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: fix an invalid memory access caused by
	incorrect use of list iterator
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

The bug is here:
	idr_remove(&connection->peer_devices, vnr);

If the previous for_each_connection() don't exit early (no goto hit
inside the loop), the iterator 'connection' after the loop will be a
bogus pointer to an invalid structure object containing the HEAD
(&resource->connections). As a result, the use of 'connection' above
will lead to a invalid memory access (including a possible invalid free
as idr_remove could call free_layer).

The original intention should have been to remove all peer_devices,
but the following lines have already done the work. So just remove
this line and the unneeded label, to fix this bug.

Cc: stable@vger.kernel.org
Fixes: c06ece6ba6f1b ("drbd: Turn connection->volumes into connection->peer_devices")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 6f450816c4fa..5d5beeba3ed4 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2793,12 +2793,12 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	if (init_submitter(device)) {
 		err = ERR_NOMEM;
-		goto out_idr_remove_vol;
+		goto out_idr_remove_from_resource;
 	}
 
 	err = add_disk(disk);
 	if (err)
-		goto out_idr_remove_vol;
+		goto out_idr_remove_from_resource;
 
 	/* inherit the connection state */
 	device->state.conn = first_connection(resource)->cstate;
@@ -2812,8 +2812,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	drbd_debugfs_device_add(device);
 	return NO_ERROR;
 
-out_idr_remove_vol:
-	idr_remove(&connection->peer_devices, vnr);
 out_idr_remove_from_resource:
 	for_each_connection(connection, resource) {
 		peer_device = idr_remove(&connection->peer_devices, vnr);
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
