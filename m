Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MlKKB1f+GlJtgIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Mon, 04 May 2026 10:55:57 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBAB4BAA20
	for <lists+drbd-dev@lfdr.de>; Mon, 04 May 2026 10:55:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E7529164D74;
	Mon,  4 May 2026 10:55:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69CC0160920
	for <drbd-dev@lists.linbit.com>; Mon,  4 May 2026 05:26:02 +0200 (CEST)
Received: by mail-pj1-f47.google.com with SMTP id
	98e67ed59e1d1-364da484a82so836959a91.2
	for <drbd-dev@lists.linbit.com>; Sun, 03 May 2026 20:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20251104; t=1777865161; x=1778469961;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=sHXTY9sLnF1K25ZmkWpIUiO8YMQuEQwzanxq/iB+EKM=;
	b=X7Ak7R3YCJrwbiiXHV6H2O46NOQaqjNwcD68GotN35xSJRYhGbDnIoc3kDrhuDmOjz
	MzSNqSx/2fV3yL3d0G20d6wiP9K/l1WiL+aPqVSgkMzuHpwegxx6LwHyRsfo7vxezAv2
	KJCZnW3tWcsVH6EdMV8QeqPDb5SFM9qWkEJQXMCbT2OTo27YKVQzwIuAK16xrCdaR1/8
	EJzAEayw/iWGj18+ITAZ7QFuVRHAscxnfnbGsQ7rAreY9dEru4XstjliN1It4eZ8bgOK
	lKFGl0vnz99h+fOpMnx2xJSKHRxbl0NhLOJg2RZFvFbLmYPyn5PNXAzQS+DHJDIwkga1
	+1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1777865161; x=1778469961;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=sHXTY9sLnF1K25ZmkWpIUiO8YMQuEQwzanxq/iB+EKM=;
	b=YlGG9dJTFIIVXdf3s7wPOWcUBYfIOmMMnNfIgmCrfCWSOb9IUMKfiTdsLf2dElubFK
	jv6i8t9Qr5kaIyvvF2GVAvOgcF7UZZwWvyPpQy6GV8hzjS+f/PQ/xInf/pUUviBAZkpP
	3tpdW2mNeK/JK6z2J/hPAwwLHefNYEqIfNmPW2tSE8zxIRW9OGFio+1Gavm96S9QqFOC
	DbgSOWaaDsMADDYr4DlYpbYMJJWgReJtZZjiRlRnd8O2/jDeWm23rO+dyX6WGj2R7ynM
	V2CEGn2LieizlfScxO+dVmv17u3MMD3Ey2hePmRI4myqsOox4Z9hC4Qo47r+Wxh3Ix4d
	2wLw==
X-Forwarded-Encrypted: i=1;
	AFNElJ9SzmQu5HrJR+peA1ONb7bD3aUUYlBuCLcRvAj5RElvwBZmTonxV15DkxEcH6b20IBp55EL2VrbLg==@lists.linbit.com
X-Gm-Message-State: AOJu0Yy23cCur/I8kQVuOAbGOHKGyeBR6HPYUosSPWt7H82FOwQCDWUj
	8q3CS4YDueWTTo3HAwUfytIaGKgsqZYpPmJo6nTPbekdS7NwTdYVmZuE
X-Gm-Gg: AeBDievZoESfAaqVY4JGePzCF6PKxc6V5N+VknkUmPbPOrwgqjMPU0mYXa2h1uIMCg1
	kijDoMlW03JhKsQpn+tJU0WCgSI6ABi1qbthqm0SkgoKFtmV0A3MTdGSOlDaajH/GKQc/w8fci9
	5zB2L+mtE+R2tozJPgewY/mEjgMQ4VIJumu8wl4gy3Rm2r9IS46LWbEZAGT2kobKe8M0zmN4ibm
	U6E76gM9DbSeawWm84WqCbzRvpQ0YJR+FsxGdjVkYXzK0y0p86plrposSngGhoFddA8Hh4jni4J
	735MO2pspgYxrs2cEp3Czb/3tG27Q3hw+lxtOdtn+tDwMsBinnvx6w5rcTVw+4dx84sBDB4/73E
	hCNbynl43Qrn02Ys/7MJiGEggksu4ly7apYZSPyC6xtINrYBOjNxx2zjpBphNCdG1CtehAa65Tw
	0TE6yyWSI2FpRM+JlnfOYYqTzEH5xH408cM4VyCK/u3g==
X-Received: by 2002:a05:6a00:1490:b0:835:45bf:965a with SMTP id
	d2e1a72fcca58-83545bf98a7mr2082260b3a.7.1777865161249; 
	Sun, 03 May 2026 20:26:01 -0700 (PDT)
Received: from b330-MS-7D46.. ([122.192.219.205])
	by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-83515acfbb5sm10165651b3a.34.2026.05.03.20.25.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 03 May 2026 20:26:00 -0700 (PDT)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com
Subject: [PATCH] drbd: serialize UUID snapshot in drbd_md_write()
Date: Mon,  4 May 2026 11:25:50 +0800
Message-ID: <20260504032550.706749-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 May 2026 10:55:44 +0200
Cc: axboe@kernel.dk, gality369@gmail.com, zhenghaoran154@gmail.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	baijiaju1990@gmail.com, zzzccc427@gmail.com,
	Ziyu Zhang <ziyuzhang201@gmail.com>, r33s3n6@gmail.com,
	hanguidong02@gmail.com, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Rspamd-Queue-Id: 3EBAB4BAA20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org,lists.linbit.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:gality369@gmail.com,m:zhenghaoran154@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:ziyuzhang201@gmail.com,m:r33s3n6@gmail.com,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ziyuzhang201@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.052];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziyuzhang201@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	TAGGED_RCPT(0.00)[drbd-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]

drbd_md_write() copies device->ldev->md.uuid[] into the on-disk
metadata block without holding uuid_lock.

The write-side helpers drbd_uuid_new_current() and drbd_uuid_set_bm()
update md.uuid[] under uuid_lock, and some updates span multiple UUID
slots as one logical state transition. An unlocked drbd_md_write() can
therefore observe and persist a mixed UUID tuple assembled from two
different states.

This is problematic because the serialized UUID tuple is written to
stable storage and later consumed by reconnect and resync decision
logic, meaning an inconsistent on-disk snapshot can represent a state that
never existed atomically in memory.

Protect the UUID copy with uuid_lock so drbd_md_write() serializes one
coherent snapshot.

Fixes: b411b3637fa7 ("The DRBD driver")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index a9e49b212..6f835dd05 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3004,13 +3004,17 @@ void drbd_md_write(struct drbd_device *device, void *b)
 {
 	struct meta_data_on_disk *buffer = b;
 	sector_t sector;
+	unsigned long flags;
 	int i;
 
 	memset(buffer, 0, sizeof(*buffer));
 
 	buffer->la_size_sect = cpu_to_be64(get_capacity(device->vdisk));
+	/* Serialize the UUID tuple as one coherent snapshot. */
+	spin_lock_irqsave(&device->ldev->md.uuid_lock, flags);
 	for (i = UI_CURRENT; i < UI_SIZE; i++)
 		buffer->uuid[i] = cpu_to_be64(device->ldev->md.uuid[i]);
+	spin_unlock_irqrestore(&device->ldev->md.uuid_lock, flags);
 	buffer->flags = cpu_to_be32(device->ldev->md.flags);
 	buffer->magic = cpu_to_be32(DRBD_MD_MAGIC_84_UNCLEAN);
 
-- 
2.43.0

