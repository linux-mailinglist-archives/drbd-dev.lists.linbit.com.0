Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4793AC77
	for <lists+drbd-dev@lfdr.de>; Wed, 24 Jul 2024 08:10:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11FC142065A;
	Wed, 24 Jul 2024 08:10:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 363 seconds by postgrey-1.31 at mail19;
	Tue, 23 Jul 2024 11:48:06 CEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C252E420653
	for <drbd-dev@lists.linbit.com>;
	Tue, 23 Jul 2024 11:48:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9540160B76;
	Tue, 23 Jul 2024 09:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91B9C4AF0B;
	Tue, 23 Jul 2024 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721727721;
	bh=NcDpupcZcDk6/0XTYK18tiU/nA/nZnaPVgRpLi4PPa4=;
	h=From:Date:Subject:To:Cc:From;
	b=cdOWFQpcyfVoOMiGT+7ICwbw37JeS6fhY39vVyEai+n5SO3p/C8c2lgLLxFv2jaU0
	/tSm54hT+dNiijQG/Yfv/BqOk+T3VBiEmV+13U8cmwwGbS2eLNSQLHQRfU+iWnoAge
	YpaTZAymS8hYm59WWxYDHWz+MHlAMFnkjaVNdm493z/lWNTi3VlugcDMgom4S9RQgq
	UqWYo7CH/agVpGPATqJIAFAQok9NftgLB7IM0ZJodIsizQCvWfjqfjIjT4jZxOkFFR
	10+hmj/V/sI/X6PgnjxUr3OE7ypiF/xNgpDgJQ2WSE9nuBHTN4w9263dTHxCTMmUcJ
	G+YBF7J5l9DcA==
From: Simon Horman <horms@kernel.org>
Date: Tue, 23 Jul 2024 10:41:52 +0100
Subject: [PATCH] drbd: Add peer_device to Kernel doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-drbd-doc-v1-1-a04d9b7a9688@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN96n2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
	vPSU3UzU4B8JSMDIxMDcyNj3ZSipBTdlPxk3WRDAwMjA3MDg8SUVCWg8oKi1LTMCrBR0bG1tQD
	oFOZDWgAAAA==
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
X-Mailer: b4 0.14.0
X-Mailman-Approved-At: Wed, 24 Jul 2024 08:10:31 +0200
Cc: linux-block@vger.kernel.org, Andreas Gruenbacher <agruen@kernel.org>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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

Add missing documentation of peer_device parameter to Kernel doc.

These parameters were added in commit 8164dd6c8ae1 ("drbd: Add peer
device parameter to whole-bitmap I/O handlers")

Flagged by W=1 builds.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/block/drbd/drbd_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index f92673f05c7a..a9e49b212341 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3422,6 +3422,7 @@ void drbd_uuid_set_bm(struct drbd_device *device, u64 val) __must_hold(local)
 /**
  * drbd_bmio_set_n_write() - io_fn for drbd_queue_bitmap_io() or drbd_bitmap_io()
  * @device:	DRBD device.
+ * @peer_device: Peer DRBD device.
  *
  * Sets all bits in the bitmap and writes the whole bitmap to stable storage.
  */
@@ -3448,6 +3449,7 @@ int drbd_bmio_set_n_write(struct drbd_device *device,
 /**
  * drbd_bmio_clear_n_write() - io_fn for drbd_queue_bitmap_io() or drbd_bitmap_io()
  * @device:	DRBD device.
+ * @peer_device: Peer DRBD device.
  *
  * Clears all bits in the bitmap and writes the whole bitmap to stable storage.
  */
@@ -3501,6 +3503,7 @@ static int w_bitmap_io(struct drbd_work *w, int unused)
  * @done:	callback to be called after the bitmap IO was performed
  * @why:	Descriptive text of the reason for doing the IO
  * @flags:	Bitmap flags
+ * @peer_device: Peer DRBD device.
  *
  * While IO on the bitmap happens we freeze application IO thus we ensure
  * that drbd_set_out_of_sync() can not be called. This function MAY ONLY be
@@ -3549,6 +3552,7 @@ void drbd_queue_bitmap_io(struct drbd_device *device,
  * @io_fn:	IO callback to be called when bitmap IO is possible
  * @why:	Descriptive text of the reason for doing the IO
  * @flags:	Bitmap flags
+ * @peer_device: Peer DRBD device.
  *
  * freezes application IO while that the actual IO operations runs. This
  * functions MAY NOT be called from worker context.

