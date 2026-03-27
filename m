Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKRxJx8Hx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:39:27 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6E934C043
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:39:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6025163136;
	Fri, 27 Mar 2026 23:39:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 754241627CC
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:38:48 +0100 (CET)
Received: by mail-wm1-f53.google.com with SMTP id
	5b1f17b1804b1-486fd5360d4so32697425e9.1
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651128;
	x=1775255928; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=k+4sneUti/b8Rpw1YtgfXCWa4T3JT6LBHzjjUYkhTX8=;
	b=bi1CXu3Q5rN1RKrKyUWgqMTDX2MxIc2vwbUqXODt3lWa4K968gwHpyXzkNcbe9wK6W
	ibGCNW7/CnCNQIHFyDvDXHRnn0rtEUA7g8mFAHMPBK4A8dyoAjcxQ25Wexa4YtdDVVtD
	uUlc9DEk+LRFK0gmgQnq20F+U9K/rIuT4y4DsitokWF8Ya7+saKDHW/Flwi09WRzTgGt
	LkWvdClq6QaHCW3AhJJMFYteTtLsRpR6t1M508yNbmO4Kfo4dWhAyvizWMKv80GZm2PV
	yypMjNibmJSZFzjK97f+7KOKy4I2aTWbhdu0TMicH8+XD0MwjvTjIOzBiw5sJpwsjA/A
	r+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651128; x=1775255928;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=k+4sneUti/b8Rpw1YtgfXCWa4T3JT6LBHzjjUYkhTX8=;
	b=ccDn0dOo56zfjS0TeHOYj3gxM1uO3gearyLan8J6wzLjwwJ7jHAfOtae/vx6p/d1o1
	oiva8nXaokjbJ3XZJLeQKp3TMBuZuKyxBByARaLs6Al8Lk2yeZ/keiO5SfgsJdT/4WDo
	1/GOV/8CbPgfVunu4rwCDpkkrBI30IFbgawaBzV+zJ07pymI1yymHML/UcROPxan4wMt
	xKpMIwDZUoqSPPpgoz7wuOPjSj5wPiCrrYEI9to0Tkwi7M1AbafMMnXrR16b67BQQ7I7
	aXNifIFLQPUl3BGFZs7FlPc5kfCX5hpWOEhP8uFOGjYPQBCQ+K9OkS38Qx0Rh1A3Z6C6
	SHdQ==
X-Gm-Message-State: AOJu0YwONAskqZRrJDXU4/zjkTsQ0hfB2/VzTF9PBets9XwPN8DnXI7D
	DC8iaK+NRm/Ut1xS1UzgxQlpxiHnFtql/8Gt5PiTlj8WDljMUmMf170xlIOfUo0in25z50Wbbix
	FXkRSWO8=
X-Gm-Gg: ATEYQzzELvPoA6DRRdbk1OhuEIzVXrgLu6PuUo5kzU6TIfgBRWQE1FlorWF3xAKN5Wk
	TXbyHq7eRpooxiVQIWrUCP77izpf/hh4p+oh9RrJeSNr8XhjchvVZEQQl552Qxe9f0qNTHklm+e
	3Xnl/pka2E/8VTtbWMrjwxZAe83d3u131SUur5j/bzmWDLItahuxK+CcVCusRKX2jNWEG0t8qDj
	1Jv9r3tilW2QRVX9lfVniEHCe4ngP4Lm0qJigHG0JF5n8voYiGDUg3umPZhAQ0BzOJIDyJSYGiV
	WOEvqqJqIkEJ5cEzroUBbPyug/PNDj5zmuE7AfiSuL6iIwFEVdH/RqSalT1ShIyppSF4BhQSd2v
	qQ+kTUU2vaS/2VoxvYfPVsNlJBgmLeu+l2T05WRJY+qA6PWr4YRbmT/MQx2UriMhxVJ2/TUQHUY
	mjJrZfXKqSXXpm+Bm8Q1bl4VhbZ3q1qTyKlCY+tUlHTkyzA9XWIszAbsQh9JRyAgkWgED0v3x+I
	127khd5SL23a1S4ec/+0g==
X-Received: by 2002:a05:6000:22c3:b0:439:b114:60c0 with SMTP id
	ffacd0b85a97d-43b9ea9afcemr7594435f8f.35.1774651127984; 
	Fri, 27 Mar 2026 15:38:47 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.38.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:38:46 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/20] drbd: mark as BROKEN during DRBD 9 rework
Date: Fri, 27 Mar 2026 23:38:01 +0100
Message-ID: <20260327223820.2244227-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
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
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.584];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 7C6E934C043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mark DRBD as BROKEN while the driver is being reworked for DRBD 9
multi-peer support. The following commits restructure the driver
extensively, and intermediate states do not compile. DRBD will be
re-enabled once the rework is complete.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 495a72da04c6..b907b07468bb 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -8,6 +8,7 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
+	depends on BROKEN
 	depends on PROC_FS && INET
 	select LRU_CACHE
 	select CRC32
-- 
2.53.0

