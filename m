Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B14629B88
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Nov 2022 15:07:01 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A422420968;
	Tue, 15 Nov 2022 15:07:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 02C6A4205B8
	for <drbd-dev@lists.linbit.com>; Tue, 15 Nov 2022 14:16:47 +0100 (CET)
Received: by mail-wr1-f48.google.com with SMTP id z14so24053194wrn.7
	for <drbd-dev@lists.linbit.com>; Tue, 15 Nov 2022 05:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=content-disposition:mime-version:message-id:subject:cc:to:from:date
	:from:to:cc:subject:date:message-id:reply-to;
	bh=PBoJDQnhlmWZlV1VrcsZgizsnIm6qCYmmX9Ncnb4i4Y=;
	b=dkckIW1PVglmNO6MtTydvtrSHdn8XftgrOE0/j3P3C0l90RJJG+MFkv5wPUKQVyCvL
	ZqsdfvMEgw250jSUd7Yg89ETICa1EpJqkZgH/4lhiF34kqRmCHO76VhmZtIXHLg5jMZo
	ttixW1zvox8Z+GdXVEPHQ9Fqy9HZAhnRT5NjO2elAb/2a+lHYAWvFKvK4XlVZFWKBGrM
	VRlGlVyOgsDPrEzh/Wv4QEk2gR/5j4Z3MR8ZUZsU1C5AjAUWoFWZXvcYQRdC+Wrm2bvj
	J4X6cslSnS7fTd89LOBpxInv/HP8H9xSs51/Zj9oAKaZK6gFTyUHeVVPaAjt+JeV8tiU
	hUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-disposition:mime-version:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=PBoJDQnhlmWZlV1VrcsZgizsnIm6qCYmmX9Ncnb4i4Y=;
	b=SoFCQ+dLWsLlmuP7ang6zXRy/AKcDE5NSWc6aYeLCamPFB6p/3zmh5b+aV195dvwdF
	nB+OiClXhKnLJFJp9or1HtkYyUfSu+HvOxFRfFl67eGBaYkTHl9Lcl08Hc3FFmwkQoQB
	2Ba+n5nJ8QRwAugGi+jAZzS5AsWp2Kupp/XsssiQ9jSlIAXKgCwSEG2j8JjSFdK7NZDg
	WXjcrKwWrAOEx3hwM1xAu+rFTt+s6KRFMsXwehfdzM8F40wuY1DcReOd3FUcxNdOO9hg
	09PdJ7YhDIst7C6+4KD+mz05NeBO35oi3npjX3rDQlf2otRXWpyybWZM2z+IuwvYIJ19
	traQ==
X-Gm-Message-State: ANoB5pkO9E9C6dCDFQYM+WqLYAJaAduThlhltATzweMmO2GvmIbbcZ5b
	ytL5Ti24JzeNFX9xnBcewbo=
X-Google-Smtp-Source: AA0mqf4oQzxbBTQYDlzEXnGARcEIi7wxDyi7MBe1ZuPB1+4ZO4/fj69rdF4JEloD5NtpcD7tQQqBGg==
X-Received: by 2002:adf:a3de:0:b0:236:5655:13a5 with SMTP id
	m30-20020adfa3de000000b00236565513a5mr10625325wrb.477.1668518207324;
	Tue, 15 Nov 2022 05:16:47 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
	n18-20020a7bcbd2000000b003cf9bf5208esm20580871wmi.19.2022.11.15.05.16.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Nov 2022 05:16:47 -0800 (PST)
Date: Tue, 15 Nov 2022 16:16:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>
Message-ID: <Y3Jd5iZRbNQ9w6gm@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Tue, 15 Nov 2022 15:06:59 +0100
Cc: Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org,
	Andreas Gruenbacher <agruen@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: use after free in drbd_create_device()
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

The drbd_destroy_connection() frees the "connection" so use the _safe()
iterator to prevent a use after free.

Fixes: b6f85ef9538b ("drbd: Iterate over all connections")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Smatch assumes that kref_put() generally calls the free function so it
gets very confused by drbd_delete_device() which calls:

	kref_put(&device->kref, drbd_destroy_device);

Four times in a row.  (Smatch has some checking for incremented
reference counts but even there it assumes that people are going to hold
one reference and not four).

drivers/block/drbd/drbd_main.c:2831 drbd_delete_device() error: dereferencing freed memory 'device'
drivers/block/drbd/drbd_main.c:2833 drbd_delete_device() warn: passing freed memory 'device'
drivers/block/drbd/drbd_main.c:2835 drbd_delete_device() error: dereferencing freed memory 'device'

The drbd_adm_get_status_all() function makes me itch as well.  It seems
like we drop a reference and then take it again?

drivers/block/drbd/drbd_nl.c:4019 drbd_adm_get_status_all() warn: 'resource' was already freed.
drivers/block/drbd/drbd_nl.c:4021 drbd_adm_get_status_all() warn: 'resource' was already freed.

 drivers/block/drbd/drbd_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index f3e4db16fd07..8532b839a343 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2672,7 +2672,7 @@ static int init_submitter(struct drbd_device *device)
 enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsigned int minor)
 {
 	struct drbd_resource *resource = adm_ctx->resource;
-	struct drbd_connection *connection;
+	struct drbd_connection *connection, *n;
 	struct drbd_device *device;
 	struct drbd_peer_device *peer_device, *tmp_peer_device;
 	struct gendisk *disk;
@@ -2789,7 +2789,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	return NO_ERROR;
 
 out_idr_remove_from_resource:
-	for_each_connection(connection, resource) {
+	for_each_connection_safe(connection, n, resource) {
 		peer_device = idr_remove(&connection->peer_devices, vnr);
 		if (peer_device)
 			kref_put(&connection->kref, drbd_destroy_connection);
-- 
2.35.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
