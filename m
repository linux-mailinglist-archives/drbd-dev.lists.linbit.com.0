Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLLpHgDWhGlo5gMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 05 Feb 2026 18:40:16 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 1C45AF60B9
	for <lists+drbd-dev@lfdr.de>; Thu, 05 Feb 2026 18:40:16 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 541FD162EE3;
	Thu,  5 Feb 2026 18:40:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D23E0160953
	for <drbd-dev@lists.linbit.com>; Thu,  5 Feb 2026 18:39:58 +0100 (CET)
Received: by mail-wr1-f41.google.com with SMTP id
	ffacd0b85a97d-432d28870ddso882562f8f.3
	for <drbd-dev@lists.linbit.com>; Thu, 05 Feb 2026 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1770313198;
	x=1770917998; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=wdr0IwDMGGG3tNroL/3nN4LO0wiu5miJzO4pgtEfhC0=;
	b=ST/ZP+bz+lMkfgCsMiF0L1nWkQMfR1oe3UbcsrJkhgKAyvq2q1CgpNnPyNt90ibbSa
	w913D7DERGAtErS+KDOD1Po8xHi9twp0vXSWDTTbEaDC0mOD7X0A2gwyhgUOjxFPcg+t
	EzI6kM9N8aTIIWYZy988ThgjtfUytXemIBldTxxXo0KAkjOjiT7KehWRTyqP1W/tkMMI
	iIurj8ywP2YOR9U+Oxtx61YkONJ1vtReIYIiUqjxwsgzdu0bV9cm8ISzsIehhOrEJk6y
	T+hhZEfzfYuRZx/vBdqCskYAzIfnUZGYVJG65zDOavVVgokGmTcwyhkSBnVUSJ5tprnL
	CVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1770313198; x=1770917998;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=wdr0IwDMGGG3tNroL/3nN4LO0wiu5miJzO4pgtEfhC0=;
	b=C6q+Rlg7eQ016ULHHDo2rWmgJZBNDyURmlPDELfsG04c7vu4PJb2nzXJFvFOc4uYie
	E3OYS7YQ3xqJLki9Q7LhakgfKhySLBmG+5iuCXYim4hF44iIVSHBM7JxiB60ja7tr6lH
	KZS0RGFOWf3UqRtxtM7XEMcT3MljRt6jtwDyS0kcPIMR9nOsVV0LCh9WWw12l6OpsLor
	Os+Jva+KNQKXDpVyQT3Aon2vqnjDrn1tsTefVQtJjFNazAfOyiVrlsxgKOiqxRR9Zwjm
	PY88DLDdG5pPXGOhFiLtPObuRQTe+2OdMdgy8qEqsYZF1twww7ys41s5Oe3q8Jfenkbl
	bigw==
X-Gm-Message-State: AOJu0YxYR3YYIUY1rxvtZ2eW58JXOA7fBfRMLCl43g17vkCRbcj2Ahx9
	e4eK0rMrCgzcj6iwi/HPQJOOe2DvSTzJpE2Ue8nZ/nUiLIplaOiH9EHpAHRK9CS0qY8G3A==
X-Gm-Gg: AZuq6aJwIWGKWxPgK1c4EEPVV+PVzdyMlcq7bgN7GEHdafRdRYq5K1Dwe4IP8MMDq0W
	/JCdXeR9lJjHG4RbgD74vNFIHuwcasY5n9Mad5HIn4x9ZRBUljsgrCyjk2ugU4yJoy5HsaKdMRO
	WlPKCKtGWdjMHK2spLHnZ7BhnbrmthnWEoRv70ixJ9DSQYgYFDXtgjObQ9MqAxoTfvThLbKayHK
	SrICs0E35bH//ku6dyOFI7dvTpD5gahMerPw+5KlbYRventS/hhx4MM+cIhf7Pk1aTYORyoCaht
	aJ0yLB07er5UyQxxXoIgASwIE+BZ5jw1k58Nc1gSRKMti75IVzf+eHBBICgeecLhAs/YtJEgKzJ
	RbCVJAF0de29goVELIaZRL28gFNXsh+V3fehBTHaFpDvhBsWcI8vIufjEp/k2c7gs/W3cVLHY9b
	ZJ1fFiwmdsxmoCN4kg9VKeRPuvtpezQCRjwbvOx/HrHmF5fnOzwfqArwhC8cjlnTrETL6SZXTsS
	nu5vHCsOA==
X-Received: by 2002:a5d:630c:0:b0:436:1896:e1e3 with SMTP id
	ffacd0b85a97d-4362924101dmr57832f8f.9.1770313197976; 
	Thu, 05 Feb 2026 09:39:57 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43617e25cefsm16559622f8f.9.2026.02.05.09.39.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Feb 2026 09:39:57 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: always set BLK_FEAT_STABLE_WRITES
Date: Thu,  5 Feb 2026 18:39:29 +0100
Message-ID: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.084];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 1C45AF60B9
X-Rspamd-Action: no action

DRBD requires stable pages because it may read the same bio data
multiple times for local disk I/O and network transmission, and in
some cases for calculating checksums.

The BLK_FEAT_STABLE_WRITES flag is set when the device is first
created, but blk_set_stacking_limits() clears it whenever a
backing device is attached. In some cases the flag may be
inherited from the backing device, but we want it to be enabled
at all times.

Unconditionally re-enable BLK_FEAT_STABLE_WRITES in
drbd_reconsider_queue_parameters() after the queue parameter
negotiations.

Also, document why we want this flag enabled in the first place.

Fixes: 1a02f3a73f8c ("block: move the stable_writes flag to queue_limits")
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
Note: this commit is based on the for-6.19/block tree in case it is
still possible to take it into the 6.19 release as this *could* lead
to silent data corruption. However, due to other protection
mechanisms in DRBD, this is relatively unlikely to happen in the
real world and we have not seen any corresponding reports from users.
So if this only lands in 6.20/7.0, it is also fine.

 drivers/block/drbd/drbd_main.c |  3 ---
 drivers/block/drbd/drbd_nl.c   | 20 +++++++++++++++++++-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index c73376886e7a..1f6ac9202b66 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2659,9 +2659,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 		 * connect.
 		 */
 		.max_hw_sectors		= DRBD_MAX_BIO_SIZE_SAFE >> 8,
-		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
-					  BLK_FEAT_ROTATIONAL |
-					  BLK_FEAT_STABLE_WRITES,
 	};
 
 	device = minor_to_device(minor);
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 91f3b8afb63c..b502038be0a9 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1296,6 +1296,8 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		lim.max_segments = drbd_backing_dev_max_segments(device);
 	} else {
 		lim.max_segments = BLK_MAX_SEGMENTS;
+		lim.features = BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
+			       BLK_FEAT_ROTATIONAL | BLK_FEAT_STABLE_WRITES;
 	}
 
 	lim.max_hw_sectors = new >> SECTOR_SHIFT;
@@ -1318,8 +1320,24 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		lim.max_hw_discard_sectors = 0;
 	}
 
-	if (bdev)
+	if (bdev) {
 		blk_stack_limits(&lim, &b->limits, 0);
+		/*
+		 * blk_set_stacking_limits() cleared the features, and
+		 * blk_stack_limits() may or may not have inherited
+		 * BLK_FEAT_STABLE_WRITES from the backing device.
+		 *
+		 * DRBD always requires stable writes because:
+		 * 1. The same bio data is read for both local disk I/O and
+		 *    network transmission. If the page changes mid-flight,
+		 *    the local and remote copies could diverge.
+		 * 2. When data integrity is enabled, DRBD calculates a
+		 *    checksum before sending the data. If the page changes
+		 *    between checksum calculation and transmission, the
+		 *    receiver will detect a checksum mismatch.
+		 */
+		lim.features |= BLK_FEAT_STABLE_WRITES;
+	}
 
 	/*
 	 * If we can handle "zeroes" efficiently on the protocol, we want to do

base-commit: b1e5c96ab4a011763afac033f6660cf1eb499458
-- 
2.52.0

