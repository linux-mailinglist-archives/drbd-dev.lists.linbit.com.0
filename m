Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635E926376
	for <lists+drbd-dev@lfdr.de>; Wed,  3 Jul 2024 16:32:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C7A3420304;
	Wed,  3 Jul 2024 16:32:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4F0D420032
	for <drbd-dev@lists.linbit.com>; Wed,  3 Jul 2024 16:31:59 +0200 (CEST)
Received: by mail-ed1-f49.google.com with SMTP id
	4fb4d7f45d1cf-58ba3e37feeso2709685a12.3
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jul 2024 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1720017119;
	x=1720621919; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Itt2d+IUQzAea/NtBwrznoUFsNOSMfVBhNtpl5FziXQ=;
	b=cP/OjrlToFd28hBmFbl5oPD3t9GYDeFBFAA1bDolIvGOYIyv1uzpTGS3T0CdP4XrRK
	kOrJCCWqAMJA2wti8i55eC1J/o7LEflt9/06paCRHAUvZpXwBGKJbsBXaWUf3r7sAMXZ
	dbaup8wkwWRP8KO0RQ23UIVfoWWG2/ns0PkaC36SOjCYyf5YYQz/h4VUM9jD9QcqGIPU
	qYBED03Pu1JyIr643uIni90zPbbhQhuvFYD5XFMso5ChFjiGQVEJLJHb1BWy5eUFaCJf
	YrW6nYeYm7Q+rg+veo9eaY1TiQaSv0vgQrdZOAdrSfjVXBG0Fsc3ggVyNZSyLGrMZqIz
	1rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1720017119; x=1720621919;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Itt2d+IUQzAea/NtBwrznoUFsNOSMfVBhNtpl5FziXQ=;
	b=njRV09m1s/yz1w8o/m8hcLu57Ci6Gj9TsnFUuL0JGDa67/e7ZbmGOVAvVylOlhZPsO
	kXWTmFl1c7I55KQwMQJqbZB1E1HvNA6083rgdcKdLTHHJuHHuedHU77nQtmsOa1vzAFi
	HCVG0BUav+JdrD+q+POYeuXHWd332BNDj/+AG81LwqrYmalXuw2pFRYoi7vQc88OAMyH
	K/bu1Gnu13UjkOGUxDioS67RTiffSgWf8A9sr5oe+YZZOxFspRwydqnCjmgG1DMt2bDm
	YzwCYB9nTY2VofGceJSXW/k6aTlMCmbDTXYctK1In3IY0qbUUW4mKDDeMCegj5MofD6Q
	QkWA==
X-Forwarded-Encrypted: i=1;
	AJvYcCWRmxE2PoBw8h7I55hMH71qpDjQf8vZ3Y0E50poDNicyjtidkRvWhVljmJP89BCZETCXW8QB8vw1VzUoZBOFtV4Nce4HUxSPZ/b
X-Gm-Message-State: AOJu0YynZ9QPuVRc86Lf7+hTdDEGcr9c2vs+4dvX+Qd4KV4YL/xH22q+
	OAxUlq3hPgnSPagT/88uUjyBPmzpOc39cDEnE9VR371oUkPcbPXaIn9JVl4+nRPObDVuV6kvG59
	VgRA=
X-Google-Smtp-Source: AGHT+IFrr7gAhy3I/zlJYgtvPP384Jxuvg01+hDZPJTm3Lky5wleH1ZdTjqkM77lR/KblqNUBuXZ7w==
X-Received: by 2002:a05:6402:27ce:b0:578:6c19:4801 with SMTP id
	4fb4d7f45d1cf-5879fa7b4a7mr7973601a12.22.1720017118833; 
	Wed, 03 Jul 2024 07:31:58 -0700 (PDT)
Received: from ryzen9.home (178-190-217-101.adsl.highway.telekom.at.
	[178.190.217.101]) by smtp.gmail.com with ESMTPSA id
	4fb4d7f45d1cf-5861324ec3dsm7262634a12.38.2024.07.03.07.31.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jul 2024 07:31:58 -0700 (PDT)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Dongsheng Yang <dongsheng.yang@linux.dev>
Subject: [PATCH] drbd: make drbd_adm_detach() interruptible
Date: Wed,  3 Jul 2024 16:31:35 +0200
Message-ID: <20240703143135.330462-1-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <d16555b2-a777-e6ed-83f3-fc93a7a12607@linux.dev>
References: <d16555b2-a777-e6ed-83f3-fc93a7a12607@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
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

If a backing device suddenly ceases delivering I/O completions, and in
reaction, the user issues a `drbdsetup detach`, the operation will
hang when it tries to write internal meta-data.

The user should have used `drbdsetup --force detach`, but it is too
late. There was no way to interrupt the hanging drbdsetup detach.

Improve the situation by making detach operations interruptible.
---
 drbd/drbd_actlog.c |  5 ++++-
 drbd/drbd_int.h    |  1 +
 drbd/drbd_state.c  | 29 +++++++++++++++++++++++++++--
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drbd/drbd_actlog.c b/drbd/drbd_actlog.c
index bc09dee2f..d6ba168ac 100644
--- a/drbd/drbd_actlog.c
+++ b/drbd/drbd_actlog.c
@@ -74,7 +74,10 @@ void wait_until_done_or_force_detached(struct drbd_device *device, struct drbd_b
 		dt = MAX_SCHEDULE_TIMEOUT;
 
 	dt = wait_event_timeout(device->misc_wait,
-			*done || test_bit(FORCE_DETACH, &device->flags), dt);
+			*done ||
+			test_bit(FORCE_DETACH, &device->flags) ||
+			test_bit(INTERRUPT_DETACH, &device->flags),
+			dt);
 	if (dt == 0) {
 		drbd_err(device, "meta-data IO operation timed out\n");
 		drbd_handle_io_error(device, DRBD_FORCE_DETACH);
diff --git a/drbd/drbd_int.h b/drbd/drbd_int.h
index 0ebd79091..8ea752edd 100644
--- a/drbd/drbd_int.h
+++ b/drbd/drbd_int.h
@@ -521,6 +521,7 @@ enum device_flag {
 	MD_NO_FUA,		/* meta data device does not support barriers,
 				   so don't even try */
 	FORCE_DETACH,		/* Force-detach from local disk, aborting any pending local IO */
+	INTERRUPT_DETACH,	/* Interrupt an ongoing detach operation */
 	NEW_CUR_UUID,		/* Create new current UUID when thawing IO or issuing local IO */
 	__NEW_CUR_UUID,		/* Set NEW_CUR_UUID as soon as state change visible */
 	WRITING_NEW_CUR_UUID,	/* Set while the new current ID gets generated. */
diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index be1de8f06..643b2f385 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -924,14 +924,39 @@ void state_change_lock(struct drbd_resource *resource, unsigned long *irq_flags,
 	resource->state_change_flags = flags;
 }
 
+/* Interrupt writing meta-data */
+static void interrupt_detach(struct drbd_resource *resource, struct completion *done)
+{
+	struct drbd_device *device;
+	int vnr;
+
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		if (device->disk_state[NOW] == D_DETACHING) {
+			set_bit(INTERRUPT_DETACH, &device->flags);
+			wake_up_all(&device->misc_wait);
+		}
+	}
+
+	wait_for_completion(done);
+
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		if (test_bit(INTERRUPT_DETACH, &device->flags))
+			clear_bit(INTERRUPT_DETACH, &device->flags);
+	}
+}
+
 static void __state_change_unlock(struct drbd_resource *resource, unsigned long *irq_flags, struct completion *done)
 {
 	enum chg_state_flags flags = resource->state_change_flags;
 
 	resource->state_change_flags = 0;
 	write_unlock_irqrestore(&resource->state_rwlock, *irq_flags);
-	if (done && expect(resource, current != resource->worker.task))
-		wait_for_completion(done);
+	if (done && expect(resource, current != resource->worker.task)) {
+		int err = wait_for_completion_interruptible(done);
+
+		if (err == -ERESTARTSYS)
+			interrupt_detach(resource, done);
+	}
 	if ((flags & CS_SERIALIZE) && !(flags & (CS_ALREADY_SERIALIZED | CS_PREPARE)))
 		up(&resource->state_sem);
 }
-- 
2.45.2

