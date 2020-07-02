Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6728BC9A
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:42:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2CA564204CE;
	Mon, 12 Oct 2020 17:42:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6DD1420418
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:42:44 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id e2so17993741wme.1
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=zBaUOzBUmZvfHz2BrgXV4tbsfNQDmUh4O5tah2+TEQA=;
	b=mn11I3T+r5Ke+5OwlcInzGIH4A7Y0BUDigUqGX0oA2vueh0jWaFlvkgG3camFpztI3
	nNVJ/eJBTnLzNZyzDRTE7puNFNpAYZ3ZPHnQ2YnxYcPA2UhohkpTPKm263At6zqPFUg3
	dCe7+v0aSSnkg0C9RUAWWBOIV+QU5V12ZTHAr/zMC8Hb2gQhGFR7HTLpiqnjmaeuEFLC
	vNi/cKlMJWGQJpgxO6O+tWxYsVsBp3nuGKEd4IAj4y4uHpm0+izKuYNDrkx31Rh3A11n
	/Q2tmhA84mtQhnymq3eCqPV/ZyMHXvti0EjbeKeSIw7kPgb94cGQzm+CnTLZroLMVjNg
	al8A==
X-Gm-Message-State: AOAM532RGnpq9k+eGp/ztodihS7rzW+Y3ZZ4m7LjaLWsObst5sEAGcVs
	h7uliXNYjaHeZ0JvMwwQec2e7JYyJoyRBWF+
X-Google-Smtp-Source: ABdhPJwkFgn61UQCWXzUYCSyc73W3KbMcqbeYVcyRI/qbRYeXd5VaM8bXJ2v10elwLQlTjk/5HWR2Q==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr9260371wmj.168.1602517304144; 
	Mon, 12 Oct 2020 08:41:44 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	t4sm22028794wra.75.2020.10.12.08.41.43
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:41:43 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:41:42 +0200
Resent-Message-ID: <20201012154142.GS2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3C89420385
	for <drbd-dev@lists.linbit.com>; Thu,  2 Jul 2020 15:27:20 +0200 (CEST)
Received: by mail-ed1-f68.google.com with SMTP id g20so23629762edm.4
	for <drbd-dev@lists.linbit.com>; Thu, 02 Jul 2020 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zBaUOzBUmZvfHz2BrgXV4tbsfNQDmUh4O5tah2+TEQA=;
	b=PwcqrbBbcthT5ztTfKZdLaQXrCUSB09PnEybMbNBDsdwdafapuB/4ZJ/MeR4BSj8+r
	LIsgCccpJJ3oNIOWxGmSqnrhGjX0sZH15eEQkJuIHEHHSbAcdTyeeYI4Etn65pQGNCJX
	tzeG6WNEuHCFw/gdvgqubPclNCVDcQOUMeqR8/8okgJP1UfdQY7qjryQ2blar78tfcGC
	Xsh4vxZlwNBmxNohs40cUv0aQcfSgpsm7p1U0iUoVO/9QliX4sGyYNBXxdbPMEi0YewK
	Q4XFX7Tle8swndJF/t9Z/afPxDXjuBwwfije73RFx91SW+7XIxlqSh1GH0vo7C16DJQI
	e0pg==
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr36023142edi.120.1593696439901;
	Thu, 02 Jul 2020 06:27:19 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:2968:e1c0:a871:b69c])
	by smtp.gmail.com with ESMTPSA id m13sm6863457ejc.1.2020.07.02.06.27.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jul 2020 06:27:19 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	axboe@kernel.dk
Date: Thu,  2 Jul 2020 15:27:02 +0200
Message-Id: <20200702132702.6914-1-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701123832.3868-1-guoqing.jiang@cloud.ionos.com>
References: <20200701123832.3868-1-guoqing.jiang@cloud.ionos.com>
Cc: linux-block@vger.kernel.org, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH V2] drbd: remove unused argument from
	drbd_request_prepare and __drbd_make_request
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

We can remove start_jif since it is not used by drbd_request_prepare,
then remove it from __drbd_make_request further.

Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
V2:
1. rebased with latest for-next branch

 drivers/block/drbd/drbd_int.h  |  2 +-
 drivers/block/drbd/drbd_main.c |  3 +--
 drivers/block/drbd/drbd_req.c  | 11 ++++-------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index fe6cb99eb917..aacd2010b555 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1450,7 +1450,7 @@ extern void conn_free_crypto(struct drbd_connection *connection);
 
 /* drbd_req */
 extern void do_submit(struct work_struct *ws);
-extern void __drbd_make_request(struct drbd_device *, struct bio *, unsigned long);
+extern void __drbd_make_request(struct drbd_device *, struct bio *);
 extern blk_qc_t drbd_submit_bio(struct bio *bio);
 extern int drbd_read_remote(struct drbd_device *device, struct drbd_request *req);
 extern int is_valid_ar_handle(struct drbd_request *, sector_t);
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 7c34cc0ad8cc..42f2a235417c 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2293,7 +2293,6 @@ static void do_retry(struct work_struct *ws)
 	list_for_each_entry_safe(req, tmp, &writes, tl_requests) {
 		struct drbd_device *device = req->device;
 		struct bio *bio = req->master_bio;
-		unsigned long start_jif = req->start_jif;
 		bool expected;
 
 		expected =
@@ -2328,7 +2327,7 @@ static void do_retry(struct work_struct *ws)
 		/* We are not just doing submit_bio_noacct(),
 		 * as we want to keep the start_time information. */
 		inc_ap_bio(device);
-		__drbd_make_request(device, bio, start_jif);
+		__drbd_make_request(device, bio);
 	}
 }
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 674be09b2da9..f705128b4f27 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1188,7 +1188,7 @@ static void drbd_queue_write(struct drbd_device *device, struct drbd_request *re
  * Returns ERR_PTR(-ENOMEM) if we cannot allocate a drbd_request.
  */
 static struct drbd_request *
-drbd_request_prepare(struct drbd_device *device, struct bio *bio, unsigned long start_jif)
+drbd_request_prepare(struct drbd_device *device, struct bio *bio)
 {
 	const int rw = bio_data_dir(bio);
 	struct drbd_request *req;
@@ -1416,9 +1416,9 @@ static void drbd_send_and_submit(struct drbd_device *device, struct drbd_request
 		complete_master_bio(device, &m);
 }
 
-void __drbd_make_request(struct drbd_device *device, struct bio *bio, unsigned long start_jif)
+void __drbd_make_request(struct drbd_device *device, struct bio *bio)
 {
-	struct drbd_request *req = drbd_request_prepare(device, bio, start_jif);
+	struct drbd_request *req = drbd_request_prepare(device, bio);
 	if (IS_ERR_OR_NULL(req))
 		return;
 	drbd_send_and_submit(device, req);
@@ -1596,19 +1596,16 @@ void do_submit(struct work_struct *ws)
 blk_qc_t drbd_submit_bio(struct bio *bio)
 {
 	struct drbd_device *device = bio->bi_disk->private_data;
-	unsigned long start_jif;
 
 	blk_queue_split(&bio);
 
-	start_jif = jiffies;
-
 	/*
 	 * what we "blindly" assume:
 	 */
 	D_ASSERT(device, IS_ALIGNED(bio->bi_iter.bi_size, 512));
 
 	inc_ap_bio(device);
-	__drbd_make_request(device, bio, start_jif);
+	__drbd_make_request(device, bio);
 	return BLK_QC_T_NONE;
 }
 
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
