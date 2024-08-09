Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34694CD7E
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Aug 2024 11:44:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0AA1A420621;
	Fri,  9 Aug 2024 11:43:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Fri, 09 Aug 2024 11:43:50 CEST
Received: from out199-10.us.a.mail.aliyun.com (out199-10.us.a.mail.aliyun.com
	[47.90.199.10])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AC664205E3
	for <drbd-dev@lists.linbit.com>; Fri,  9 Aug 2024 11:43:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1723196628; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=gZ93c15PmjBf9iKf8+aNnVB3ru9vORti3RxMK+6EHUM=;
	b=mUt2ZfyAPt1ub8bXYd2awdEWdEISWfujPx20DLdtOfd8plTNwMYkq39ECjb3BeSVFYEzqRu8VXCyWuQhX2V1ab0vWqpBAa81qEEbZ7n141qoLtzDKfb7gCeGHVMz89RAYcGnKuQ0nplVfjuALHTv/4AAznTZDitkApjOt6Yxx0g=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
	fp:SMTPD_---0WCPTBTz_1723195963) by smtp.aliyun-inc.com;
	Fri, 09 Aug 2024 17:32:44 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: axboe@kernel.dk,
	christoph.boehmwalder@linbit.com
Subject: [PATCH -next] drbd: Add missing kernel-doc function comments.
Date: Fri,  9 Aug 2024 17:32:33 +0800
Message-Id: <20240809093233.8627-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-block@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
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

Add missing kernel-doc function comments to enhance code readability and
maintainability in accordance with the kernel coding standards.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/block/drbd/drbd_bitmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 85ca000a0564..746bb75ab2a4 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1213,6 +1213,7 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 /**
  * drbd_bm_read() - Read the whole bitmap from its on disk location.
  * @device:	DRBD device.
+ * @peer_device:	DRBD peer device.
  */
 int drbd_bm_read(struct drbd_device *device,
 		 struct drbd_peer_device *peer_device) __must_hold(local)
@@ -1224,6 +1225,7 @@ int drbd_bm_read(struct drbd_device *device,
 /**
  * drbd_bm_write() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device:	DRBD peer device.
  *
  * Will only write pages that have changed since last IO.
  */
@@ -1236,6 +1238,7 @@ int drbd_bm_write(struct drbd_device *device,
 /**
  * drbd_bm_write_all() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device:	DRBD peer device.
  *
  * Will write all pages.
  */
@@ -1258,6 +1261,7 @@ int drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_ho
 /**
  * drbd_bm_write_copy_pages() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device:	DRBD peer device.
  *
  * Will only write pages that have changed since last IO.
  * In contrast to drbd_bm_write(), this will copy the bitmap pages
-- 
2.32.0.3.g01195cf9f

