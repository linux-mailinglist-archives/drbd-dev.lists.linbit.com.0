Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24B28BC24
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:40:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE0A54203C4;
	Mon, 12 Oct 2020 17:40:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC4424203C4
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:39:40 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id n18so19712369wrs.5
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id;
	bh=ipdB2i7ibhCad/VO5r4zs//Ta+EMMsKIp2Eo4tcET/Q=;
	b=jnYesr8cSYlc8ojHtFCTqmOmsAHw88gS/H4OESEw0lnGfKg+putLcaO8P87fioRGsy
	IkcYmr/8imWsqI+GIShYU9jFyaKgKH9W6wQbB/L+uZvtsPeM2GLRSgpSJK9FivmT5CWm
	Ds63Q8vbVqY95Z+VAQCVn2BYUALEB1/fCY2WqJpA/UOC241L4Jk1J+/HbL3X3kIZIf1V
	rP12H4xcKOUPEgDp3b3XPiACf8mesmgIf7UHrga9JgTCRydKaWm7iCkrnvLy5V7vULsv
	V5RgsTfDbDxd8m9bgpCZRMc9oxuRUfhyFUDCHsXvikrUmykvBrJdBzK2o7tuy/ga8MG/
	ZK4Q==
X-Gm-Message-State: AOAM533aOXeGr6/C4D2uoyLJzZ43hikn2sNKQXnB/GY50mbwAeEzewzY
	+anI6A6L/TEjIoKYQme3Vcf74A0Xwsu/f3U+
X-Google-Smtp-Source: ABdhPJycV+nMQV+0BKS4EqNOimVu8tPMNJkECZcQpCXZaGcyCor+x8Ej5NAMLImGjTimlXB8wgJFzA==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr21748038wrs.303.1602517179837; 
	Mon, 12 Oct 2020 08:39:39 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	h25sm9044860wrc.55.2020.10.12.08.39.39
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:39:39 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:39:37 +0200
Resent-Message-ID: <20201012153937.GR2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5E1C04203DE
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 14:39:50 +0200 (CEST)
Received: by mail-ed1-f68.google.com with SMTP id dg28so19531367edb.3
	for <drbd-dev@lists.linbit.com>; Wed, 01 Jul 2020 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ipdB2i7ibhCad/VO5r4zs//Ta+EMMsKIp2Eo4tcET/Q=;
	b=a74F5Uiyo86yrxUZNacooIXbEsslb7dzafue0cTCoeDKzEuLgTHHY3pyEGqRnFYK94
	DOlYF7Hrk+Rz63Hx8ZkCKOGlf4HDuCNAf33WV4U6wTuWoY4ptM7mqiFQHI7aILVVqtgu
	rQzj5vY0yjrsVVpa0rtlN0Px+Bmp3qXAYurYt4lhozJOCyvz2sFo3pUJ1zP6zAv2ZzmH
	HugdY8nfJTwvfFIpshzMZr/fVXdgm/T1Lk/TawN/4Kp9uFZ2k/2SozjIkFQ4uX3ouh9i
	TuBXB2LkaMyPZtq76jkQERyO9t+88NufgO5eIcbP792GhJf1K3atcoy1ljaBTt7iTyTy
	LCUQ==
X-Received: by 2002:aa7:d3cd:: with SMTP id o13mr28151009edr.176.1593607190373;
	Wed, 01 Jul 2020 05:39:50 -0700 (PDT)
Received: from gjiang-5491.profitbricks.net
	([2001:16b8:48f3:8a00:2d1a:d73b:b882:b3])
	by smtp.gmail.com with ESMTPSA id
	p18sm4635381ejm.55.2020.07.01.05.39.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jul 2020 05:39:49 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	axboe@kernel.dk
Date: Wed,  1 Jul 2020 14:38:32 +0200
Message-Id: <20200701123832.3868-1-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-block@vger.kernel.org, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: remove unused argument from
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
 drivers/block/drbd/drbd_int.h  |  2 +-
 drivers/block/drbd/drbd_main.c |  3 +--
 drivers/block/drbd/drbd_req.c  | 11 ++++-------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 33d0831c99b6..512888514c9e 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1450,7 +1450,7 @@ extern void conn_free_crypto(struct drbd_connection *connection);
 
 /* drbd_req */
 extern void do_submit(struct work_struct *ws);
-extern void __drbd_make_request(struct drbd_device *, struct bio *, unsigned long);
+extern void __drbd_make_request(struct drbd_device *, struct bio *);
 extern blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio);
 extern int drbd_read_remote(struct drbd_device *device, struct drbd_request *req);
 extern int is_valid_ar_handle(struct drbd_request *, sector_t);
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 45fbd526c453..2aff9a3f06e3 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2292,7 +2292,6 @@ static void do_retry(struct work_struct *ws)
 	list_for_each_entry_safe(req, tmp, &writes, tl_requests) {
 		struct drbd_device *device = req->device;
 		struct bio *bio = req->master_bio;
-		unsigned long start_jif = req->start_jif;
 		bool expected;
 
 		expected =
@@ -2327,7 +2326,7 @@ static void do_retry(struct work_struct *ws)
 		/* We are not just doing generic_make_request(),
 		 * as we want to keep the start_time information. */
 		inc_ap_bio(device);
-		__drbd_make_request(device, bio, start_jif);
+		__drbd_make_request(device, bio);
 	}
 }
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index c80a2f1c3c2a..991d9ba1a5e7 100644
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
 blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio)
 {
 	struct drbd_device *device = (struct drbd_device *) q->queuedata;
-	unsigned long start_jif;
 
 	blk_queue_split(q, &bio);
 
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
