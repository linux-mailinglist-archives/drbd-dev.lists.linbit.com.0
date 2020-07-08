Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D228BCB1
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:45:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F0454207C4;
	Mon, 12 Oct 2020 17:45:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C02404207A2
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:44:03 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id n6so19423470wrm.13
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=DRUCw0m6MRFHAU9r2+IyC0j6NTzZrJ1siX12KTm+zWI=;
	b=L80T6uaq1tQCLulDQRmk1N2XiJBYrYdJQhlMr3ceYaqF+4Na8hMNqaabH/h4efDklC
	dUco7SvIuINzpw5BiQ2szrnrIbn/SzfZgIK+Idra15e5fEGw7cyFv+5zo7GOpmor12c+
	DMXx+3OAftJ/hQTNqVADA2mMrvR+po6RlhxQLqwePU77qvEXaMX376Dt7Q0HBQOiUUPK
	TTNYeUF7KWwlxKBdCLnEk/byQ3AbOSwyhBnYeKc691psgPdsN1Q9ZvbNHQIcNGU47sNo
	htoUmcsgWu+38D+BDmLK2CgiNZKtT4ymVYDhCKX+yP932b+YSZnh0tyL5vcSDtJDhBaF
	S5QA==
X-Gm-Message-State: AOAM53340iMMJt9fx3r76NRNFObSjBXKeSkS+xV+mVKISrTLu+xf+7sZ
	ObXRwkT3zI62XwgBT6/7c/CGKrMe8VzgWI9v
X-Google-Smtp-Source: ABdhPJymPEDKA/mCE7lBIh7DBJkKXsK3d4a5Y36OYwSRKyZmAGvB8/dtsicQlUH2GaYuajT3Uvz9jQ==
X-Received: by 2002:adf:90c4:: with SMTP id i62mr28684563wri.98.1602517383080; 
	Mon, 12 Oct 2020 08:43:03 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214])
	by smtp.gmail.com with ESMTPSA id o4sm6947378wrv.8.2020.10.12.08.43.02
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:43:02 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:43:01 +0200
Resent-Message-ID: <20201012154301.GU2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9B5D5420318
	for <drbd-dev@lists.linbit.com>; Wed,  8 Jul 2020 09:59:27 +0200 (CEST)
Received: by mail-ed1-f65.google.com with SMTP id e15so40857865edr.2
	for <drbd-dev@lists.linbit.com>; Wed, 08 Jul 2020 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DRUCw0m6MRFHAU9r2+IyC0j6NTzZrJ1siX12KTm+zWI=;
	b=MjUZ6RHWFN55P93dC82a9yD/gjsPUUjaFLqxknsxkFpTs8HUh20479lW2XamPoR2FI
	OtOVMSWPdbYgDABJ9lHKTu3pYj2UUmELnmimyBxxdcXY0LFB4snFdrNDogrrRetmh6Fe
	JghgMXENwj03syxYJWwSQ9CI/5GGE+mf+5WGlyYbCrn02wtQrji+i/brZCNmAB5AWIet
	KkIJvn74qhfXbFzCsceTSJJacji/39LyPK7pacIdyzxKGVVrjk0WCigcjRxEDlZNvT6V
	exufTaYVxHN5XXo8/FUKaXd0LXjRgCrt4q1PUDT/ROgs7ZYbcQj+hbjtYWhNIZi4jFD9
	G55A==
X-Received: by 2002:a05:6402:1a54:: with SMTP id
	bf20mr65053241edb.69.1594195166763; 
	Wed, 08 Jul 2020 00:59:26 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b161:f409:fd1d:3a1f])
	by smtp.gmail.com with ESMTPSA id
	mj22sm1570858ejb.118.2020.07.08.00.59.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jul 2020 00:59:26 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: axboe@kernel.dk
Date: Wed,  8 Jul 2020 09:58:15 +0200
Message-Id: <20200708075819.4531-2-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
References: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
Cc: linux-block@vger.kernel.org, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH RFC 1/5] block: return ns precision from
	disk_start_io_acct
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

Currently the duration accounting of bio based driver is converted from
jiffies to ns, means it could be less accurate as request based driver.

So let disk_start_io_acct return from ns precision, instead of convert
jiffies to ns in disk_end_io_acct.

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: drbd-dev@lists.linbit.com
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
 block/blk-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index d9d632639bd1..0e806a8c62fb 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1466,6 +1466,7 @@ unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
 	struct hd_struct *part = &disk->part0;
 	const int sgrp = op_stat_group(op);
 	unsigned long now = READ_ONCE(jiffies);
+	unsigned long start_ns = ktime_get_ns();
 
 	part_stat_lock();
 	update_io_ticks(part, now, false);
@@ -1474,7 +1475,7 @@ unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
 	part_stat_local_inc(part, in_flight[op_is_write(op)]);
 	part_stat_unlock();
 
-	return now;
+	return start_ns;
 }
 EXPORT_SYMBOL(disk_start_io_acct);
 
@@ -1484,11 +1485,11 @@ void disk_end_io_acct(struct gendisk *disk, unsigned int op,
 	struct hd_struct *part = &disk->part0;
 	const int sgrp = op_stat_group(op);
 	unsigned long now = READ_ONCE(jiffies);
-	unsigned long duration = now - start_time;
+	unsigned long duration = ktime_get_ns() - start_time;
 
 	part_stat_lock();
 	update_io_ticks(part, now, true);
-	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
+	part_stat_add(part, nsecs[sgrp], duration);
 	part_stat_local_dec(part, in_flight[op_is_write(op)]);
 	part_stat_unlock();
 }
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
