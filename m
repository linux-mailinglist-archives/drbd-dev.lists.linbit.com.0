Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 843102D9314
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA52E420834;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 414B842062A
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:10 +0100 (CET)
Received: by mail-il1-f196.google.com with SMTP id c18so12764196iln.10
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eYCdkrvA945z/tjwrrTuzh0pYZNC3N9MigL4AfoVdgM=;
	b=itZMAlhvMKzsGovlxsrQTawEuWdWjT2X7Qv+yOSeP/CcqdEKcu07gnnNJIpM5Rhyl3
	FLiQtKLTkwIAA2ZzTkZSTZqyBWJ7l3b/tq1DZIcBISw1Kf7ylcMdTRfaAz1wthV3NeTi
	Z7/EdEEXx9452nb5apQNf7tmWNCW32hQ1pa4rFVb+1N9wjSH2SMdUNIjv4siWsmi1GcR
	rNDnsQJfWN+syB09ZvGmHGFBSF8BSHxCy3ENihHX4oirC8UypmOzkrVM923Rw+xo0uIJ
	mnBevkwIrREBwSWn07aeC9ya4X8gXTftzHLWnA2wLfb5e70VKOawePJYd6zS3HlHUSwq
	lCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eYCdkrvA945z/tjwrrTuzh0pYZNC3N9MigL4AfoVdgM=;
	b=Jj6ocvOobWk4bAPbRIagxUeQA6Q5fkxS8JNri1PoovRdOpVcXUF0GW5JlLgkvDhfZQ
	YoCcjRdw973v53Us5OGS7KbadAGYG7HMb+MPwGQZnNuklU+uxaNXmLfBE0dXCadLM8Dj
	QL4Bs8HJoj12HHJYNVcvzJpFyaxQW4n7NZtDrmHTbfKlWMAqpmSwgiJ6rfamolWSxiKM
	iPDlS1uh9LIzEU9fiUprTYsI4xJgpWTsqNr4cGxjPkg48yVpBQuakOnmWdGqGuOQuiL2
	McXq6PKzJo0xD1Q7me6u2x2cy0UG/hyKrdLmOMqjjleqtpvTwgbFoZ0d958mRcvPDaHB
	Wcpw==
X-Gm-Message-State: AOAM533UrQ6DwusY9NJZ60sk5OwpGZNkYvBq38ecTVTUVjFuMMD3XOrk
	HBnhLp6vfQ+gA8RQf+PQ04eQ2z/Fw2KYZw==
X-Google-Smtp-Source: ABdhPJzbJmQzikQuevPWPvBFIwH+gtB69Uyn16RvhhASZhbvD6F/7/4fyCd4KiLrTB0yZVsd4BswRQ==
X-Received: by 2002:a92:cb44:: with SMTP id f4mr25732067ilq.131.1607839149542; 
	Sat, 12 Dec 2020 21:59:09 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:09 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:55 -0500
Message-Id: <20201213055859.3305-5-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
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
