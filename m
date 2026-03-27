Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CPOGX4Jx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:49:34 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEC234C21E
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:49:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC96C1630D7;
	Fri, 27 Mar 2026 23:48:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2445163139
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:31 +0100 (CET)
Received: by mail-wm1-f42.google.com with SMTP id
	5b1f17b1804b1-486fd5360d4so32700835e9.1
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651171;
	x=1775255971; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=VecWmpi83v+PE+reglGIWmaIkeSxUqDGWr/8h3U8fxc=;
	b=nESEdWNmsebwSj5TnJtsynY+KdL/EBCWuXnwx5A3wmMg08h6EIcuhB5q3QpQRMynk4
	JJ4ZEhOJQdlALICyN8FkzXb4ers5E34CA3nED9HE3qlJ2Oz+nB8J9tq+doyNkow/N955
	4LFg/2TKC/5EGVpaQo+YJVbVdYaAIEyAxC40S1GnqeTUkmdL9PAmGbpmczfg0CseA++/
	XPDjZSkBPREn1nX/ym0JKRJXkvyyhX8m0jsTs+BuobDlEZ4OaK4+JfQKBdhTacRiHQtu
	EvlANMbw3Xs4XKfBByl90YDONlSG8A4TsVhMgwtiM6/nrx+e/ObSIV0GrKKMDc5MQapF
	CFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651171; x=1775255971;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=VecWmpi83v+PE+reglGIWmaIkeSxUqDGWr/8h3U8fxc=;
	b=lmps0A5WzlzfWQbR3JXA1/YxonIqPzDKaSAwVbMztR6LIBvoFjfKeAA330jVJLWi1f
	VCbUofLynQTsu7nXrF4tzHL4J3R1Tj1NN+Fo6W7t1z82R+tbp9ICiQ9/7Kl6G1dBHTMw
	Bods+b7rTgrxDtZH7xADRTd7jzExHwja47J4Xw1knQsw7bzKlvcw41UMk5vo8qSSkeAd
	IedJIWaxBRtNyUFur2W9ccWPuk+lsmwfOHodS1F8hi6IQk7ysPMWN0yVLkZy/EA7Iseo
	qv131XsrtrlhPB9TX5sSIi76tYwv3ytAHAFpgNjzy5s2WXlM4VPfGp04MM5PFK8marlR
	lW5w==
X-Gm-Message-State: AOJu0YyWxLdv2YZQgLkP5jEIe28JugqNLbyGuCstXEI4T3LtuTD93hVm
	IeRGjbWFICAQxL9ndDxm1E/peyyS7jpjyY1HRZBrlOsGCjK3a47kqI9D7yPFMxGVOvZw8A==
X-Gm-Gg: ATEYQzxlhfazairrKP70zTZ01x6hWieGhJsJIUYlL/c5u905pHK9adYEww6qMabIpCc
	vwJYLVoVuaY1k9pY23HQjFR4rjHhgi0O3XQYIMRUsUW0ofx59mvtgDvH04zAJiupJfvqdDbYdfb
	SDE+nn9poHiiKcHoDTxl7ROqszki2gtoo40lsubJPJ/vILdeYEfW/+tyxsWXKm9UhF5ZCSVrxxo
	divreY0i774n926wBHW9za+uw7gjcdzzf2guRJcTABxGJJWK8g4MmQmKWCppQ0Qp2D/g5FK8mGZ
	Ab/zovtJOPR8oRzdQnFmRifywzc5UDD6+gS0p2NSYZHpIVVJ7rVx81Y77P5GrYzjdazAU2/t95i
	sOBTruepWy5dtpQKdPBSIhw1fQWJ0fYYSFiJ+kiLAPDFjyqR3RFw4TVViJyAL+uMYxlhABxgRdB
	OoGeKhN50B1qGEih//1G4jVMjUy9ZGQmasJpsfGO3uyUElc5vXV0DSO4V6JmAWSpyJWrg6/Vw+a
	JDZjaKKpH9MBKOg3uliQg==
X-Received: by 2002:a05:600c:83c4:b0:485:46fd:7887 with SMTP id
	5b1f17b1804b1-48727d8816amr68969855e9.13.1774651171200; 
	Fri, 27 Mar 2026 15:39:31 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:30 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 20/20] drbd: remove BROKEN for DRBD
Date: Fri, 27 Mar 2026 23:38:20 +0100
Message-ID: <20260327223820.2244227-21-christoph.boehmwalder@linbit.com>
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
	NEURAL_HAM(-0.00)[-0.668];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:email,linbit.com:mid]
X-Rspamd-Queue-Id: 3AEC234C21E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the BROKEN dependency now that the DRBD 9 rework is complete
and the driver compiles cleanly again.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index d4975c21d4de..ddab8d4ed40b 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -8,7 +8,6 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
-	depends on BROKEN
 	depends on PROC_FS && INET
 	select LRU_CACHE
 	select CRC32
-- 
2.53.0

