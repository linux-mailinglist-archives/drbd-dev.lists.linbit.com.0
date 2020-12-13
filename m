Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BDD2D930B
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9086B42080A;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 38B5542062A
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:23 +0100 (CET)
Received: by mail-qk1-f195.google.com with SMTP id i67so5179397qkf.11
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eYCdkrvA945z/tjwrrTuzh0pYZNC3N9MigL4AfoVdgM=;
	b=u9m/lQiLXoS4Puu1h1SIhMAlX8evKvvNCAdkb0qeTbdkMyEkiTWYszMrTeNSonzbDs
	rxPx1Y0VjqEnn0qFgC4wmmm6pPTiike4QAb0mneV/BOCyRYGWtam6lVDo3hfGo+Ac4rB
	du0YZzcKEXzsLlvf+QGHVN7vt5bHWa7s6MR4Q+RnP3CNuvoqKpnz58DqdeP2AcFoagln
	fpa9vHbg0LrgIaMaV8VIJIYZ9e4UfW0gcy5aPPfX5+WRLpLJJzs3YDZ2lIEU1NbSAASo
	7AJMkysRXbAqTR0aLCOUQLnZuQvFKRVl8ihwSU7a84tfgvrKq43kdvcp7COO+OKZNtQD
	JgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eYCdkrvA945z/tjwrrTuzh0pYZNC3N9MigL4AfoVdgM=;
	b=VwzmM1J7Ze0ikQyi6IJiupNFYBbPKyZj0XDkFpPUosTkwMgIEnxWBrbVkmn8v9CQ9s
	fETEpMSpXIEfrcnikHCuZjVZSoPMxz+dhtfGDIkfY4we+6Re3tlk2DUHuRJuBPep40gD
	yMBhve50/7uhnkfikeo8eIZVHfCCFQZtnX1bAfl4ovtbwD/cgdUPsKxLX5z2jzNP3kK3
	toRxXzYM6cKtHOqT5IkgYai8DR2xPr5O5lV22hc97PsxdepvEXb1yhla+kNuSNcSTZog
	1TV1xWX6brink78YomrbZvA0da5QpJFQCyz6Or4vO9InuafnI24Hn03oakrYLb4zB+Gz
	s93A==
X-Gm-Message-State: AOAM530Bb5aD/RZTkf04h2gBPvPC+R4rbuF1whQ8hWaKNCwu4UtHzFB8
	aMzUW1AlAi1MrTPFo2O9Ouai5A/go8STKA==
X-Google-Smtp-Source: ABdhPJywr70RADYN9ycTTP5krxhlfSqcm/M2eeALSoJ5GOu0+mYuHVfyDzHy/ElKhe6XqJfwTaetQQ==
X-Received: by 2002:a37:4142:: with SMTP id o63mr24179607qka.395.1607836042434;
	Sat, 12 Dec 2020 21:07:22 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:21 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:07:00 -0500
Message-Id: <20201213050704.997-5-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 4/8] drbd: fix drbd_submit_bio argument handling
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

Looks like we changed arguments from q to bio, but left the line that gets
device from q untouched.  Oopsie.

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd_req.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_req.c b/drbd/drbd_req.c
index 8db2a0e0..92b3b863 100644
--- a/drbd/drbd_req.c
+++ b/drbd/drbd_req.c
@@ -2196,7 +2196,7 @@ static bool drbd_fail_request_early(struct drbd_device *device, struct bio *bio)
 
 blk_qc_t drbd_submit_bio(struct bio *bio)
 {
-	struct drbd_device *device = (struct drbd_device *) q->queuedata;
+	struct drbd_device *device = bio->bi_disk->private_data;
 #ifdef CONFIG_DRBD_TIMING_STATS
 	ktime_t start_kt;
 #endif
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
