Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3B28BC9C
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:43:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C8124206C7;
	Mon, 12 Oct 2020 17:43:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F0D54206C7
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:43:05 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id d3so17980496wma.4
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=d1La/axhT/8d5t9Aiud14eTBdaZWaa7PgEVZl8V6a7I=;
	b=Cz5BGrlLjg6H6WacSHuhGlfkQwtS4b5K2755mkL7RYRjhSJN/qrv8RmnBbiLRaEthD
	Ymaro6J5ZJdRz75OKzfyXdZ8firvqOoxquuJWyS1dd/zC727IOe1EzOu6PeWq+uXwBDB
	5fpbVN81HqUvf7l2PnY5YbmOQ6um0b5TMGvwFlsIKtZCNKEuxEZG8Cdr+xFe/uq8sa/O
	ZC6NIGN4Zta/16G2PpaV67kFMGDjMIcWsZ4yY3kBNDiDFcoyABIhEfZNRqUsppTb3GJH
	ieh/5bZ6+AdKg5IQgZsg2B/h48EUizNRei/N7O5HMc5EFJx0K4TUxMtzv/RWZzKzyITq
	NWgg==
X-Gm-Message-State: AOAM531yxAXVEopg8MdG9DNE4/BGEf2FuxkQBcqM0JYj3tVACda4Eb1B
	urix2MRxYG01oglMFvjJN0H7DULub+AlWGNE
X-Google-Smtp-Source: ABdhPJwPq9K86K/5SnLIXeYa4Ew0wJ+dwLhOBZhK069AKTuhu875VrLx8o6g7q3S7NSeqNpWJxMlvQ==
X-Received: by 2002:a1c:9910:: with SMTP id b16mr10853470wme.64.1602517385186; 
	Mon, 12 Oct 2020 08:43:05 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	u15sm24909583wrm.77.2020.10.12.08.43.04
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:43:04 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:43:03 +0200
Resent-Message-ID: <20201012154303.GV2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9040A420318
	for <drbd-dev@lists.linbit.com>; Wed,  8 Jul 2020 09:59:28 +0200 (CEST)
Received: by mail-ed1-f66.google.com with SMTP id n2so31839583edr.5
	for <drbd-dev@lists.linbit.com>; Wed, 08 Jul 2020 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d1La/axhT/8d5t9Aiud14eTBdaZWaa7PgEVZl8V6a7I=;
	b=Y4FjnqkAa3dAXCGTBn4aKdECC3vAa4sYo1/cDYBmmbSTpZ/YDuIL33IS4GCNQeMc4X
	fYjFEql0UQuN/iocsdDsGOH5wGLIjpUy1hyWyFwqc8mqMWmUFhlgrlbtsquAam+Udxec
	qKGxL6LQXUDzhk9fi0wKcKcXEb8Ot2BWPLegN+EckKh2YPbZy/1WLwJ5WRF/xPsBVjbi
	8Aj6l+rKV8kdSQ87iZ5SQCfLsTVQoEaRheEWw4v9ykgc9raZwU9lHJeXQfCTOPnb6R5r
	b6femXPdiKKp+tKYyLBOd9histw5KzSMzJXAKRYvs6lJykvNYT04IrHn2Ngw0ee4IKh8
	FlAQ==
X-Received: by 2002:a50:a451:: with SMTP id v17mr46534548edb.256.1594195167995;
	Wed, 08 Jul 2020 00:59:27 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b161:f409:fd1d:3a1f])
	by smtp.gmail.com with ESMTPSA id
	mj22sm1570858ejb.118.2020.07.08.00.59.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jul 2020 00:59:27 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: axboe@kernel.dk
Date: Wed,  8 Jul 2020 09:58:16 +0200
Message-Id: <20200708075819.4531-3-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
References: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
Cc: linux-block@vger.kernel.org, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH RFC 2/5] drbd: remove unused argument from
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
This had been sent before, now it is better to include it in the thread.

https://marc.info/?l=linux-block&m=159369644305325&w=2


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
