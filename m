Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7330146E
	for <lists+drbd-dev@lfdr.de>; Sat, 23 Jan 2021 11:00:48 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2793C42038D;
	Sat, 23 Jan 2021 11:00:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E01AB420168
	for <drbd-dev@lists.linbit.com>; Thu, 21 Jan 2021 15:23:21 +0100 (CET)
Received: by mail-ed1-f48.google.com with SMTP id d22so2698415edy.1
	for <drbd-dev@lists.linbit.com>; Thu, 21 Jan 2021 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=CERj7KX7K7JrIuOWQ4oCgUXlbuWovrpN34BQcQ4mS0k=;
	b=a9DGwPU6YuxjdiXy7bPZGmuW3CRORweTSSDax0eZONL7sOJpHHSJ0hgTGdra9cfAB6
	UlyYKmbjsO6uej0cqbY7ee2hmntsFkLH9eZwXvBY9MguKkEPh4bHnL/iwcswLX6RLukF
	QnQNbyaa3W0x0OVAtWmuvLkvm6x+qBwP7XJQsU+5R8ggiQu+03d+vYrXKSbSR+99zko6
	LhuR1hAaU/WPo/qk4iGUV0B0VlrI7U56BHze2YlrKEd2iZ7qUZaIq6fNwz0miZiTN5hV
	KIfnpuGTDcWmTSHrC0stZpe/WoCjGTN6rnHRYoEFoCFCL0nafGeqqS1dGlMkkvBUyYlK
	dRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CERj7KX7K7JrIuOWQ4oCgUXlbuWovrpN34BQcQ4mS0k=;
	b=bx0/yHHiWD4/PDGpF+kscYPi0Qis1xiNvz0oKb63evG/86L10lKW4GI7ID1+/dcsCz
	NGFuQgF2GKynNG3ajR66AlFfYKuQBJ1dPN734cMhCvUJqLqX0kc9nf7QFwC70MzuJVmb
	FukEwuVuPWIjwbkrRYYoKjGZx8qB+s35UUPf46bIFjOItShFffaM2oKTbbI4buHcJ5uH
	QhDpnyhGhrVOza6DXYXLs5GMTeSKtRa35pbf+eTGUcGPG60jwkpRtRur3IdmB56LKLPR
	2/80jypfueBL/MvNprplDRiEguoqTQjtQVfqupn322KcY1cOxJTphrHMYzUJpahOHoHI
	gyBA==
X-Gm-Message-State: AOAM5336F27mI/oxu5OaA7UJs26rjJWP840JqAqpzU62pXc22FT0MPgH
	f3hPZGub3oTu93IX4DH23Gmj/A==
X-Google-Smtp-Source: ABdhPJzzcFoJ1Sc53EmjDpU1L67A0MtbbKiS5vfFPW1i5Jmk6+i953CLLAopcb/AM2SXCf6cHXXcjA==
X-Received: by 2002:a05:6402:160f:: with SMTP id
	f15mr11332273edv.348.1611238941391; 
	Thu, 21 Jan 2021 06:22:21 -0800 (PST)
Received: from ls00508.pb.local ([2001:1438:4010:2540:481b:68e3:af3e:e933])
	by smtp.gmail.com with ESMTPSA id
	f20sm2868405edd.47.2021.01.21.06.22.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Jan 2021 06:22:20 -0800 (PST)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: axboe@kernel.dk
Date: Thu, 21 Jan 2021 15:21:50 +0100
Message-Id: <20210121142150.12998-1-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 23 Jan 2021 11:00:46 +0100
Cc: linux-block@vger.kernel.org, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH RESEND] drbd: remove unused argument from
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

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: drbd-dev@lists.linbit.com
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
 drivers/block/drbd/drbd_int.h  |  2 +-
 drivers/block/drbd/drbd_main.c |  3 +--
 drivers/block/drbd/drbd_req.c  | 11 ++++-------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 8f879e5c2f67..8faa31a17b8f 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1449,7 +1449,7 @@ extern void conn_free_crypto(struct drbd_connection *connection);
 
 /* drbd_req */
 extern void do_submit(struct work_struct *ws);
-extern void __drbd_make_request(struct drbd_device *, struct bio *, unsigned long);
+extern void __drbd_make_request(struct drbd_device *, struct bio *);
 extern blk_qc_t drbd_submit_bio(struct bio *bio);
 extern int drbd_read_remote(struct drbd_device *device, struct drbd_request *req);
 extern int is_valid_ar_handle(struct drbd_request *, sector_t);
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 1c8c18b2a25f..7e5fcce812e1 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2288,7 +2288,6 @@ static void do_retry(struct work_struct *ws)
 	list_for_each_entry_safe(req, tmp, &writes, tl_requests) {
 		struct drbd_device *device = req->device;
 		struct bio *bio = req->master_bio;
-		unsigned long start_jif = req->start_jif;
 		bool expected;
 
 		expected =
@@ -2323,7 +2322,7 @@ static void do_retry(struct work_struct *ws)
 		/* We are not just doing submit_bio_noacct(),
 		 * as we want to keep the start_time information. */
 		inc_ap_bio(device);
-		__drbd_make_request(device, bio, start_jif);
+		__drbd_make_request(device, bio);
 	}
 }
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 330f851cb8f0..5e5602af9643 100644
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
