Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2633ABE8
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D0465425C95;
	Mon, 15 Mar 2021 08:01:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D431942032D
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:40 +0100 (CET)
Received: by mail-wm1-f41.google.com with SMTP id
	u5-20020a7bcb050000b029010e9316b9d5so11954358wmj.2
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sw8b8l9dps18Xv2F/jvI6V4dn5OX8FDm+STKM7LA6jU=;
	b=ph4Qipw3vnD2W6lREvmCQLVrUB+U8JnOeBp4T5M3UR3dkLpGIvDI/Qqpyot/aU5jRU
	h0Wv/2Azze2niqV/g99QYo/f8iFnpFZbGZdko9FA5eo7lNrlHYXtG6/Q2X93yV4euKAm
	BpGHRgU6+nmwLfQzXRmGAwR6wNDHZShgjKvV71080WNbziegbKyHlHOM/KQSt7DzZfRV
	reEnjLSr7cDy48ssxYE50vO8leeMSPEfzHlLqt4LL786DPcKq59lFwGpcQuemxGA3kzU
	/widTCznZTf/aCR4CaZzZBXjTyrke5Inp6CK6A+hR2lJU7+MoGo+R/SdDbMU8ngiwcir
	8xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sw8b8l9dps18Xv2F/jvI6V4dn5OX8FDm+STKM7LA6jU=;
	b=pCxG0QXb3XVp2CTVIKg0rNJDbKaE5LvyAGixWoIQi/STC+hQyuyofy+sJm6uCaIrPD
	s9g+4gE6d4uEUK06Fokc4+ilzegTTUIR8pIfa7T9ow9Sx2qI6Hh+8ah5uktXMOkpXBnZ
	klaagmBukO9SqCwXlS5buROsL3BkIYmX51fgHtBj+B01CrbDyFpFfI520pF5a1RCNYjm
	d4PuKf3Dsr0GHEFRCHzkdip4KCFsqMZHhFzVpBgpzKlECHCtAgnCFmofxjpO4YqoYnSt
	L0f9PBTF+afjOsRLjjj3wmf4hjzkzLlZ0eqxBgPD/QCLOjcxpJpDJaOGbDnameTZ9Eci
	FTWg==
X-Gm-Message-State: AOAM533RAOtEZ4YTyA6X/OXzvWxiKg8CGEYDu81oL8UrEvmYStQisjic
	oRUw1oNmDYs2unsaAwTGk0z8TQ==
X-Google-Smtp-Source: ABdhPJxyBpDoMe0jjXCzzm1MfK2QSdn/u7jhhNjZfsVa285gvFGm6GJ+at2a4EqDtCKDp6MqwVx2pg==
X-Received: by 2002:a1c:5f89:: with SMTP id
	t131mr12086962wmb.173.1615546540196; 
	Fri, 12 Mar 2021 02:55:40 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:24 +0000
Message-Id: <20210312105530.2219008-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 05/11] block: drbd: drbd_receiver: Demote
	non-conformant kernel-doc headers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Fixes the following W=1 kernel build warning(s):

 drivers/block/drbd/drbd_receiver.c:265: warning: Function parameter or member 'peer_device' not described in 'drbd_alloc_pages'
 drivers/block/drbd/drbd_receiver.c:265: warning: Excess function parameter 'device' description in 'drbd_alloc_pages'
 drivers/block/drbd/drbd_receiver.c:1362: warning: Function parameter or member 'connection' not described in 'drbd_may_finish_epoch'
 drivers/block/drbd/drbd_receiver.c:1362: warning: Excess function parameter 'device' description in 'drbd_may_finish_epoch'
 drivers/block/drbd/drbd_receiver.c:1451: warning: Function parameter or member 'resource' not described in 'drbd_bump_write_ordering'
 drivers/block/drbd/drbd_receiver.c:1451: warning: Function parameter or member 'bdev' not described in 'drbd_bump_write_ordering'
 drivers/block/drbd/drbd_receiver.c:1451: warning: Excess function parameter 'connection' description in 'drbd_bump_write_ordering'
 drivers/block/drbd/drbd_receiver.c:1643: warning: Function parameter or member 'op' not described in 'drbd_submit_peer_request'
 drivers/block/drbd/drbd_receiver.c:1643: warning: Function parameter or member 'op_flags' not described in 'drbd_submit_peer_request'
 drivers/block/drbd/drbd_receiver.c:1643: warning: Function parameter or member 'fault_type' not described in 'drbd_submit_peer_request'
 drivers/block/drbd/drbd_receiver.c:1643: warning: Excess function parameter 'rw' description in 'drbd_submit_peer_request'
 drivers/block/drbd/drbd_receiver.c:3055: warning: Function parameter or member 'peer_device' not described in 'drbd_asb_recover_0p'
 drivers/block/drbd/drbd_receiver.c:3138: warning: Function parameter or member 'peer_device' not described in 'drbd_asb_recover_1p'
 drivers/block/drbd/drbd_receiver.c:3195: warning: Function parameter or member 'peer_device' not described in 'drbd_asb_recover_2p'
 drivers/block/drbd/drbd_receiver.c:4684: warning: Function parameter or member 'peer_device' not described in 'receive_bitmap_plain'
 drivers/block/drbd/drbd_receiver.c:4684: warning: Function parameter or member 'size' not described in 'receive_bitmap_plain'
 drivers/block/drbd/drbd_receiver.c:4684: warning: Function parameter or member 'p' not described in 'receive_bitmap_plain'
 drivers/block/drbd/drbd_receiver.c:4684: warning: Function parameter or member 'c' not described in 'receive_bitmap_plain'
 drivers/block/drbd/drbd_receiver.c:4738: warning: Function parameter or member 'peer_device' not described in 'recv_bm_rle_bits'
 drivers/block/drbd/drbd_receiver.c:4738: warning: Function parameter or member 'p' not described in 'recv_bm_rle_bits'
 drivers/block/drbd/drbd_receiver.c:4738: warning: Function parameter or member 'c' not described in 'recv_bm_rle_bits'
 drivers/block/drbd/drbd_receiver.c:4738: warning: Function parameter or member 'len' not described in 'recv_bm_rle_bits'
 drivers/block/drbd/drbd_receiver.c:4807: warning: Function parameter or member 'peer_device' not described in 'decode_bitmap_c'
 drivers/block/drbd/drbd_receiver.c:4807: warning: Function parameter or member 'p' not described in 'decode_bitmap_c'
 drivers/block/drbd/drbd_receiver.c:4807: warning: Function parameter or member 'c' not described in 'decode_bitmap_c'
 drivers/block/drbd/drbd_receiver.c:4807: warning: Function parameter or member 'len' not described in 'decode_bitmap_c'

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linbit.com
Cc: linux-block@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/block/drbd/drbd_receiver.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index c3f09a122f20c..89818a5e0ac67 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -242,9 +242,9 @@ static void conn_reclaim_net_peer_reqs(struct drbd_connection *connection)
 
 /**
  * drbd_alloc_pages() - Returns @number pages, retries forever (or until signalled)
- * @device:	DRBD device.
- * @number:	number of pages requested
- * @retry:	whether to retry, if not enough pages are available right now
+ * @peer_device:	DRBD device.
+ * @number:		number of pages requested
+ * @retry:		whether to retry, if not enough pages are available right now
  *
  * Tries to allocate number pages, first from our own page pool, then from
  * the kernel.
@@ -1352,7 +1352,7 @@ static void drbd_flush(struct drbd_connection *connection)
 
 /**
  * drbd_may_finish_epoch() - Applies an epoch_event to the epoch's state, eventually finishes it.
- * @device:	DRBD device.
+ * @connection:	DRBD connection.
  * @epoch:	Epoch object.
  * @ev:		Epoch event.
  */
@@ -1441,9 +1441,8 @@ max_allowed_wo(struct drbd_backing_dev *bdev, enum write_ordering_e wo)
 	return wo;
 }
 
-/**
+/*
  * drbd_bump_write_ordering() - Fall back to an other write ordering method
- * @connection:	DRBD connection.
  * @wo:		Write ordering method to try.
  */
 void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backing_dev *bdev,
@@ -1623,7 +1622,6 @@ static void drbd_issue_peer_wsame(struct drbd_device *device,
  * drbd_submit_peer_request()
  * @device:	DRBD device.
  * @peer_req:	peer request
- * @rw:		flag field, see bio->bi_opf
  *
  * May spread the pages to multiple bios,
  * depending on bio_add_page restrictions.
@@ -3048,7 +3046,7 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 	return -EIO;
 }
 
-/**
+/*
  * drbd_asb_recover_0p  -  Recover after split-brain with no remaining primaries
  */
 static int drbd_asb_recover_0p(struct drbd_peer_device *peer_device) __must_hold(local)
@@ -3131,7 +3129,7 @@ static int drbd_asb_recover_0p(struct drbd_peer_device *peer_device) __must_hold
 	return rv;
 }
 
-/**
+/*
  * drbd_asb_recover_1p  -  Recover after split-brain with one remaining primary
  */
 static int drbd_asb_recover_1p(struct drbd_peer_device *peer_device) __must_hold(local)
@@ -3188,7 +3186,7 @@ static int drbd_asb_recover_1p(struct drbd_peer_device *peer_device) __must_hold
 	return rv;
 }
 
-/**
+/*
  * drbd_asb_recover_2p  -  Recover after split-brain with two remaining primaries
  */
 static int drbd_asb_recover_2p(struct drbd_peer_device *peer_device) __must_hold(local)
@@ -4672,7 +4670,7 @@ static int receive_sync_uuid(struct drbd_connection *connection, struct packet_i
 	return 0;
 }
 
-/**
+/*
  * receive_bitmap_plain
  *
  * Return 0 when done, 1 when another iteration is needed, and a negative error
@@ -4724,7 +4722,7 @@ static int dcbp_get_pad_bits(struct p_compressed_bm *p)
 	return (p->encoding >> 4) & 0x7;
 }
 
-/**
+/*
  * recv_bm_rle_bits
  *
  * Return 0 when done, 1 when another iteration is needed, and a negative error
@@ -4793,7 +4791,7 @@ recv_bm_rle_bits(struct drbd_peer_device *peer_device,
 	return (s != c->bm_bits);
 }
 
-/**
+/*
  * decode_bitmap_c
  *
  * Return 0 when done, 1 when another iteration is needed, and a negative error
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
