Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E22D930F
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2EEBC42081C;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A24D1420637
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:26 +0100 (CET)
Received: by mail-qk1-f194.google.com with SMTP id 22so2485964qkf.9
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YfL57PitswGm9UxzHXFWk6g0RK7ok7U8h7K8e7pfBds=;
	b=lF7ehoiqT9Z+6Jf+xai8Yi+4pJC8WRIZOw+zdWxw+U7FEsjaYwmI/O8GNFZtDPqRpG
	2R4tbpWRxG67lxLmDODWR0zfgIUXic3NbMp6qxoHA+OiAiXnUBc5fkchWlPljHB1yPx7
	WgYGH/z6gL5U1JRsN8PrrOi//BpxPmEbvvf9h68UAwlXV1QEg9jMLH+VyC0rxT8D+Qoa
	U948vQX7vTF72k3/KJPFY9NRSSqr5kvhs4RDtMoGI0KfSsurNr08fMksm0VPUPmxtGkb
	bukAbc2d1uKNRgJ2ylw0qAoYI9ZOinwTkqtHCgTl4enl58TkNO1BHlFFJZIl+ylgm91p
	GAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YfL57PitswGm9UxzHXFWk6g0RK7ok7U8h7K8e7pfBds=;
	b=i+5r0EdYoa2BwO73M2axSR5oeKVgraV+xe1YrKfzmFAIBvQ5je3Z8gZrt4W1XLPKdh
	JKDQRVedMUCcYcMojjQ0eKxkNrZ5r7wIU8oAOzpoxeR5gKf82TAhomrXblk5QKIzPiw9
	WWyw+RzKQp9AQtts8W72liyYkxdxkx7o1kjWgCV9em5057bXfo/nIRa/G3y8t6k6b3Vw
	JPOtNO6innklKnSpmvSBajubGLf4iys3/nHJZz1dLxcF4UZkC8Y+0yaefiu/6E/tv3wD
	VEdL2Y1djHnmLKV2dTB7lmoucIZLcofk5V11EsGvo4gl0DVcxgi/UJ1bPThm0MSBArI8
	i43w==
X-Gm-Message-State: AOAM530SrufUZOwUeuQxIQVlIpYAvWOVcqp5gqt1GJrk8mRquQxTgs0g
	3P1JjeWNWdeQox82AO9CV+YiGMURKUAGZw==
X-Google-Smtp-Source: ABdhPJwqpA6oeJ0aISAUG7GuFpvnV/FlEfXkQkRkQebNvYWABG7cX7Om4Hy0rn0/veVI21ubGuS5CA==
X-Received: by 2002:a37:af06:: with SMTP id y6mr26314393qke.305.1607836045899; 
	Sat, 12 Dec 2020 21:07:25 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:25 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:07:04 -0500
Message-Id: <20201213050704.997-9-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 8/8] compat: remove set_bdi_cap_stable_writes
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

BDI_CAP_STABLE_WRITES goes away in 5.10, resulting in tons of warnings at
compile time.  It doesn't look like anything in either drbd or drbd-utils
is using the resulting set_bdi_cap_stable_writes macro anyways, so this
commit removes it.

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd-kernel-compat/drbd_wrappers.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drbd/drbd-kernel-compat/drbd_wrappers.h b/drbd/drbd-kernel-compat/drbd_wrappers.h
index c0d8981c..01fdbf22 100644
--- a/drbd/drbd-kernel-compat/drbd_wrappers.h
+++ b/drbd/drbd-kernel-compat/drbd_wrappers.h
@@ -127,13 +127,6 @@ static inline void blk_queue_write_cache(struct request_queue *q, bool enabled,
 #define KREF_INIT(N) { ATOMIC_INIT(N) }
 #endif
 
-#ifdef BDI_CAP_STABLE_WRITES /* >= v3.9 */
-#define set_bdi_cap_stable_writes(cap)	do { (cap) |= BDI_CAP_STABLE_WRITES; } while (0)
-#else /* < v3.9 */
-#warning "BDI_CAP_STABLE_WRITES not available"
-#define set_bdi_cap_stable_writes(cap)	do { } while (0)
-#endif
-
 #ifdef COMPAT_HAVE_POINTER_BACKING_DEV_INFO /* >= v4.11 */
 #define bdi_from_device(device) (device->ldev->backing_bdev->bd_disk->queue->backing_dev_info)
 #else /* < v4.11 */
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
