Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IdCLDoIx2maRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:44:10 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 937CB34C170
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:44:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0923F163151;
	Fri, 27 Mar 2026 23:43:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4C02816311D
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:07 +0100 (CET)
Received: by mail-wr1-f46.google.com with SMTP id
	ffacd0b85a97d-43b5bded412so1891069f8f.0
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651147;
	x=1775255947; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=mk2UWFlmHmW1dHnQHL6sTA+0nfmMZ6Ah6Xrxf7Z8Aq0=;
	b=fZnz1rb9qsWsGwwe3g3B6DAoxbqt3iuD6Ve0zhL/+aEPc6DOqAztNNK3KQmXgwTTJW
	XJOVOcxG4OPdEAczYZ6nMSlRDda0g453FTEVpmnuI1EpbUV8MOmbUWo7ATeGy+4ZlNsn
	25mAz4b0T4rhP6e7EhVmejIjhKMD3pc9V4LKWUh7NxH/XKkoBG44vQoMm51MEm7g4BtD
	1h/Tkc/0L29Mbufb0aNmhBvw1FeEqXnwnwFmKbjLmbrMD+Wd57/0vXyLGmvOXofXr9fX
	O6vKTM1hUiqcJoBukLYK/BxvfZSjSwoeddqn884GuBMPhkcD0IgihJ+v4PdX3lgNUECm
	J/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651147; x=1775255947;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=mk2UWFlmHmW1dHnQHL6sTA+0nfmMZ6Ah6Xrxf7Z8Aq0=;
	b=SiVVhrz3sL7eLz/qFee8KexgoROs03QF16nuNVQpWTB/WUohqEUk56DqpKKROhbbPc
	+S46KB36qdnZFRaKHbHBKGetmJGshX5N/iWqDsed/9qiLBqJrMp5k0Zb+hhOcAiC1amR
	hY7wk694YO7ozfrXB7vifcILBSY9lh6ss5cvsy6f4qLx247apJiAAd1eV8EXwGwS2doG
	ClKEWqMiEu10PIFhnxrxjpYX0oVoH+Z+O+M5cm/ApkVehkS2twB/xgpeh6tal1W8l7eL
	qJfARpUHnKKJOw7wfbkKBOx35Tunq7Ii7TncmJBqWErqDtszkAdRmx7Ij2k2xtbEF97W
	gy6g==
X-Gm-Message-State: AOJu0YzH3DvjDKtTAkXMALz5kzHHXqIBsnEylqo5WKz4Y9tVz0/VsPMb
	cYiUQiSdvoe/pxfaSmyON06iZ41tOTGmMSgt7jk0iqivhfvjdxUqN60PBldisHt0Y/AxDg==
X-Gm-Gg: ATEYQzyUfWRfud92RNJ2B4kHE054SnuBVObgeycXT1XV+wCEEeLXr6dv5k/ZCLu7c23
	iXuB4S5YlbIFTVczttPArBYGnfodTLuHoR5fP2dE6vt6UeVV4x6gAxuy8nqLCYqP/H7WH8JvBo9
	ZIMY4bzHFIkcshhLr+EWFOEDwmiD7oiFSXU2hto+ZSoV/YduX/dWvW1hPjpSXyrvLnv9xSeZ1Fs
	V7Cuv4wToZlD9BrQs18cABNLG94bmJmWP/G4LzXQDcDy3NbR6ORljHOT8P1vS3UhR5KslGgA2qk
	BwsRjdpLdgE+SdBjFD8LfC57QLxzDBIyy+sFHIF/pI1+7qV7B5fDCHMbavnwXH0cNKEBLtNXEBR
	cZBGiXhb7mco6IcUCyx65VEiKsJfPRHNCoLap3l0p4QnD5dl/aUYEWII6TqejRjEE86S9hEWVHG
	/1QDN5xCZKQ2469b5XjhYvymuc/DnpEOthLn8EVS5OS/VkDWUHDUyE40I3quyexXPxnGt8je/EC
	2ivTtRR3WwKme3elt4FYw==
X-Received: by 2002:a05:6000:268a:b0:43b:4ec7:f90c with SMTP id
	ffacd0b85a97d-43b9ea4a504mr6983962f8f.26.1774651147293; 
	Fri, 27 Mar 2026 15:39:07 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:06 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/20] drbd: rename drbd_worker.c to drbd_sender.c
Date: Fri, 27 Mar 2026 23:38:10 +0100
Message-ID: <20260327223820.2244227-11-christoph.boehmwalder@linbit.com>
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
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.682];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 937CB34C170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pure rename in preparation for the DRBD 9 sender rework. The file is
renamed to reflect the architectural split where the sender thread
handles per-connection transfer log processing and replication data
transmission, while the worker thread (function remains in the renamed
file) handles per-resource background work.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Makefile                         | 2 +-
 drivers/block/drbd/{drbd_worker.c => drbd_sender.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/block/drbd/{drbd_worker.c => drbd_sender.c} (100%)

diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index 1f0776c65349..af482bea1af1 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 drbd-y := drbd_buildtag.o drbd_bitmap.o drbd_proc.o
-drbd-y += drbd_worker.o drbd_receiver.o drbd_req.o drbd_actlog.o
+drbd-y += drbd_sender.o drbd_receiver.o drbd_req.o drbd_actlog.o
 drbd-y += drbd_main.o drbd_strings.o drbd_nl.o
 drbd-y += drbd_interval.o drbd_state.o
 drbd-y += drbd_nla.o
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_sender.c
similarity index 100%
rename from drivers/block/drbd/drbd_worker.c
rename to drivers/block/drbd/drbd_sender.c
-- 
2.53.0

