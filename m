Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIblFhFImGnYFAMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Feb 2026 12:40:01 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 055F7167521
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Feb 2026 12:40:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B63421627B9;
	Fri, 20 Feb 2026 12:39:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4E4E160922
	for <drbd-dev@lists.linbit.com>; Fri, 20 Feb 2026 12:39:44 +0100 (CET)
Received: by mail-wm1-f50.google.com with SMTP id
	5b1f17b1804b1-4806bf39419so21875775e9.1
	for <drbd-dev@lists.linbit.com>; Fri, 20 Feb 2026 03:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1771587584;
	x=1772192384; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=NAZvmYa4+oLnoaGzT3J4OlkyuUdxp/o/vWFvPoP3fG0=;
	b=mozjKF3vlee0B3k2TVc0l2yJ99NPDbWVmdNgLCxbNKPQLgN6WYhKcD/YqqawKMY5Qv
	XWv7CcYUulbGlSb/hwq6fLw0G2ZcZ7qLYhYfesa/DB392piJFWCs9CIwsoAq72GBEnMq
	ospDKtpnL/aQr6nhNo/HMiKlYHyhrKzV5hGeppVqHmyluMf0WUyWyG0NegHemgRGjDMl
	l8+Mu/X67KcyWtxZ2Td4WeYmbJjbbtVAGNU8XEyEAisVdhV9TFEHJsxAQk8MKTAj7JPb
	X8tBO4bqq8aN+IQg9VYqy2S6E3klMqIX4aS5NZwY2a16i7wwya2GhOvWAE7k5mdKePaj
	/CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771587584; x=1772192384;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=NAZvmYa4+oLnoaGzT3J4OlkyuUdxp/o/vWFvPoP3fG0=;
	b=PqXXiwad0nTIBkzB6Wdse8vDMCIo4VCmk0izPLGVTsLMuaL8VLeogpbDYS+3NjaC6Y
	QBLroZrmslnCN1RAS4BdMGUmigadwksh2nEDBNnlRJgvEG/AIxlxC0cKi9B0+YeFbfTE
	/AdAUBlARz1AtynzGiofzcotDeyn+NxniQRuVwklYg4C4gsYO5IAd1WlAQn9IHYB8vIG
	zfVZOO48B94VxY8Q26K28KaNSawnxYtwvc989PiOf4xI3PHDjZTlOpzpkeRXj2OMfFzY
	7+XLWO+9KFcL8vW4WFk9PZwjuYWpxeGqkmr/skpp0AC1acdcqmqPiTF76/j4J2m71etP
	i8DA==
X-Gm-Message-State: AOJu0YwGTiS6BTB9MDNBknIOP2X7+bECdFwM45kgmwDjzzOS5XITg9jV
	MmEgB3xQeHUVBBfoHLCmp60xQJiX0aZHCIbSsnZuouKIgxNH8wpfQrqpNtUPGKKFdpQC+w==
X-Gm-Gg: AZuq6aKtG4JCHDYGrAF57dRTdLs1LgWlBpAS5kGHkMseXWkpdY1mG9RZGer1zGLIT+U
	Q2MS9gCLdZOotxy2A9IJI6ROok7Kp24l5nii2Vtk5VmfRtmg1Y33ln2epNj+Og5mRmRpWi23heh
	BmRLhr/0pIba0SfF7yyMKFGusLFdSTe/eu/tRyizJWwV1CAMqBYZY51sizszWcgpZj4r1CZBAEV
	IkYYE8a7aqR2LOi9RuAaz5pY4IZDMmltnB4Npl7EUNB7Djy/XayM3Paz/bKJXfai0MlDvdoRoSH
	1sixBQr8pAjt4Qasc2E47l1F3V+JjGvSIZaFyBDztz/GX3co1XPoZDVDCHToepJlMVbdKTVe+mn
	5IiD1DtQzJbk6ZQ7ufC9nJoh41uUwfYdWGGIykPeqswK2XrAU03BrG7AtQVZAUK7Agf8L+LEHYu
	t8LFUqk9rqIa0CCN2Ly+vsEkQ+aytJCe+LUXCMdeL02OhJb1zcawUYhL8LUrke/nQSL2BPhnk1r
	0Qftcuto0fdXOh0D+GSPA==
X-Received: by 2002:a05:600c:c114:b0:47e:e97e:11aa with SMTP id
	5b1f17b1804b1-4839fe8e843mr76621565e9.4.1771587583811; 
	Fri, 20 Feb 2026 03:39:43 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-483a316eb08sm75529045e9.0.2026.02.20.03.39.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Feb 2026 03:39:43 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: fix null-pointer dereference on local read error
Date: Fri, 20 Feb 2026 12:39:37 +0100
Message-ID: <20260220113937.2691322-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Tuo Li <islituo@gmail.com>, drbd-dev@lists.linbit.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linbit.com,vger.kernel.org,gmail.com,lists.linbit.com];
	NEURAL_SPAM(0.00)[0.532];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:islituo@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid,linbit.com:email]
X-Rspamd-Queue-Id: 055F7167521
X-Rspamd-Action: no action

In drbd_request_endio(), READ_COMPLETED_WITH_ERROR is passed to
__req_mod() with a NULL peer_device:

  __req_mod(req, what, NULL, &m);

The READ_COMPLETED_WITH_ERROR handler then unconditionally passes this
NULL peer_device to drbd_set_out_of_sync(), which dereferences it,
causing a null-pointer dereference.

Fix this by obtaining the peer_device via first_peer_device(device),
matching how drbd_req_destroy() handles the same situation.

Cc: stable@vger.kernel.org
Reported-by: Tuo Li <islituo@gmail.com>
Link: https://lore.kernel.org/linux-block/20260104165355.151864-1-islituo@gmail.com
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_req.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index d15826f6ee81..70f75ef07945 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -621,7 +621,8 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
 		break;
 
 	case READ_COMPLETED_WITH_ERROR:
-		drbd_set_out_of_sync(peer_device, req->i.sector, req->i.size);
+		drbd_set_out_of_sync(first_peer_device(device),
+				req->i.sector, req->i.size);
 		drbd_report_io_error(device, req);
 		__drbd_chk_io_error(device, DRBD_READ_ERROR);
 		fallthrough;

base-commit: 72f4d6fca699a1e35b39c5e5dacac2926d254135
-- 
2.53.0

