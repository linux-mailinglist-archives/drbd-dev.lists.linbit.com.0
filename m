Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B141428BC9F
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:43:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9BC894207A5;
	Mon, 12 Oct 2020 17:43:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D82B4206CD
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:43:07 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id z22so14020686wmi.0
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=nrkWmuZbynTCM3f/uot82ff2fO71eir9goNysLeUz2E=;
	b=h4vUYof06Q+rVnHSu06b93pqgS0qCj3VSm+tuV0Gv8L5RXdRW3jb2cr0xr3tZb0Iet
	6vHiBq2/+Mg2SX/I5g00KaImr7waOMRV6GDfwGT6wNtBC2gxOtEag61r7Y/nO5LQSGNJ
	mokNf/11T/NwH8KVoOQNNAgYx9c4VJU1jCnDd+n6/y8+NSMex23JXq0idqYIyyOestwD
	yrNa1wkMBwE/iEXzrexBZd+OTqfPfeNOAK4qEnnnlGYcwE+9nz+LfRKyoMDbXfr/bbyf
	cPXYisU+rMHLhg0yBSHwBYoLUzQUtVXzDT7dTVX5RArdQ8BSZ4OiiAjBbtegXZjDMM1j
	LT6w==
X-Gm-Message-State: AOAM532brfZNRNE1D4Mv1yFRgswZ/JQzLxTtiZpbRxakbJB3S95ueko+
	slKzZbZG3Hp0ydNA+XOZH+fOYayxyjqJaWBI
X-Google-Smtp-Source: ABdhPJxp4KB72Ew/8XkwPwG+X9DF6xQORiISKMyQC/7FYQOYQZav5tj96rYLFJGOJWXch1qesAVhtQ==
X-Received: by 2002:a05:600c:2189:: with SMTP id
	e9mr11089771wme.153.1602517387260; 
	Mon, 12 Oct 2020 08:43:07 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	q4sm24846569wru.65.2020.10.12.08.43.06
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:43:07 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:43:05 +0200
Resent-Message-ID: <20201012154305.GW2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8855E4203EE
	for <drbd-dev@lists.linbit.com>; Wed,  8 Jul 2020 09:59:29 +0200 (CEST)
Received: by mail-ej1-f65.google.com with SMTP id p20so49309210ejd.13
	for <drbd-dev@lists.linbit.com>; Wed, 08 Jul 2020 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nrkWmuZbynTCM3f/uot82ff2fO71eir9goNysLeUz2E=;
	b=RmG9H1oOSBSNGo/T97+ya0G6yXyZCmXTHIM5aehQxamWs383yIiZwJwxh1HQ5CBeZ1
	CJi8BrLTX811AbY9Zs8DeWluHXXr4bU38RzynkigS48Iyvi1jAL7/mw4cyfxhnndvh/d
	zUKyKi9fenPYcENkF6Mdp+C+msaO/UhkX2fCmX0mkgna6dJirzRdWIQh++fMYZtvC9bz
	BH+dpgtvsp77UI1Q03opUrXhKiAxfWlT7O5xqGr54m2LYYyM3tU+3da8ucXl0WKlZdDF
	HJWBEPfykY+uWmBSJS55PI+1P2GI0Zcc2QaQeCBg9VRuGlnGf7O6tgAiLufHGcAZkpwn
	RfLg==
X-Received: by 2002:a17:906:7802:: with SMTP id
	u2mr52350656ejm.478.1594195168913; 
	Wed, 08 Jul 2020 00:59:28 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b161:f409:fd1d:3a1f])
	by smtp.gmail.com with ESMTPSA id
	mj22sm1570858ejb.118.2020.07.08.00.59.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jul 2020 00:59:28 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: axboe@kernel.dk
Date: Wed,  8 Jul 2020 09:58:17 +0200
Message-Id: <20200708075819.4531-4-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
References: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
Cc: linux-block@vger.kernel.org, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH RFC 3/5] drbd: rename start_jif to start_ns
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

Let's rename start_jif to start_ns to reflect that bio_start_io_acct
returns ns presicion now.

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: drbd-dev@lists.linbit.com
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
 drivers/block/drbd/drbd_debugfs.c | 8 ++++----
 drivers/block/drbd/drbd_int.h     | 2 +-
 drivers/block/drbd/drbd_req.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/drbd_debugfs.c
index b3b9cd5628fd..672fd7e6587d 100644
--- a/drivers/block/drbd/drbd_debugfs.c
+++ b/drivers/block/drbd/drbd_debugfs.c
@@ -105,7 +105,7 @@ static void seq_print_one_request(struct seq_file *m, struct drbd_request *req,
 		(s & RQ_WRITE) ? "W" : "R");
 
 #define RQ_HDR_2 "\tstart\tin AL\tsubmit"
-	seq_printf(m, "\t%d", jiffies_to_msecs(now - req->start_jif));
+	seq_printf(m, "\t%llu", (ktime_get_ns() - req->start_ns) / NSEC_PER_MSEC);
 	seq_print_age_or_dash(m, s & RQ_IN_ACT_LOG, now - req->in_actlog_jif);
 	seq_print_age_or_dash(m, s & RQ_LOCAL_PENDING, now - req->pre_submit_jif);
 
@@ -161,7 +161,7 @@ static void seq_print_waiting_for_AL(struct seq_file *m, struct drbd_resource *r
 	seq_puts(m, "minor\tvnr\tage\t#waiting\n");
 	rcu_read_lock();
 	idr_for_each_entry(&resource->devices, device, i) {
-		unsigned long jif;
+		unsigned long ns;
 		struct drbd_request *req;
 		int n = atomic_read(&device->ap_actlog_cnt);
 		if (n) {
@@ -171,7 +171,7 @@ static void seq_print_waiting_for_AL(struct seq_file *m, struct drbd_resource *r
 			/* if the oldest request does not wait for the activity log
 			 * it is not interesting for us here */
 			if (req && !(req->rq_state & RQ_IN_ACT_LOG))
-				jif = req->start_jif;
+				ns = req->start_ns;
 			else
 				req = NULL;
 			spin_unlock_irq(&device->resource->req_lock);
@@ -179,7 +179,7 @@ static void seq_print_waiting_for_AL(struct seq_file *m, struct drbd_resource *r
 		if (n) {
 			seq_printf(m, "%u\t%u\t", device->minor, device->vnr);
 			if (req)
-				seq_printf(m, "%u\t", jiffies_to_msecs(now - jif));
+				seq_printf(m, "%llu\t", (ktime_get_ns() - ns) / NSEC_PER_MSEC);
 			else
 				seq_puts(m, "-\t");
 			seq_printf(m, "%u\n", n);
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index aacd2010b555..467d96316230 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -301,7 +301,7 @@ struct drbd_request {
 	struct list_head req_pending_local;
 
 	/* for generic IO accounting */
-	unsigned long start_jif;
+	unsigned long start_ns;
 
 	/* for DRBD internal statistics */
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index f705128b4f27..6ad6b4470ebd 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -245,7 +245,7 @@ void drbd_req_complete(struct drbd_request *req, struct bio_and_error *m)
 		start_new_tl_epoch(first_peer_device(device)->connection);
 
 	/* Update disk stats */
-	bio_end_io_acct(req->master_bio, req->start_jif);
+	bio_end_io_acct(req->master_bio, req->start_ns);
 
 	/* If READ failed,
 	 * have it be pushed back to the retry work queue,
@@ -1206,7 +1206,7 @@ drbd_request_prepare(struct drbd_device *device, struct bio *bio)
 	}
 
 	/* Update disk stats */
-	req->start_jif = bio_start_io_acct(req->master_bio);
+	req->start_ns = bio_start_io_acct(req->master_bio);
 
 	if (!get_ldev(device)) {
 		bio_put(req->private_bio);
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
