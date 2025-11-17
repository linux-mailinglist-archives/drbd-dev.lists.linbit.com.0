Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43CC95F4B
	for <lists+drbd-dev@lfdr.de>; Mon, 01 Dec 2025 08:08:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F2021630C9;
	Mon,  1 Dec 2025 08:07:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30239160923
	for <drbd-dev@lists.linbit.com>; Mon, 17 Nov 2025 18:26:23 +0100 (CET)
Received: by mail-pl1-f176.google.com with SMTP id
	d9443c01a7336-297d4a56f97so49798895ad.1
	for <drbd-dev@lists.linbit.com>; Mon, 17 Nov 2025 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1763400382; x=1764005182;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=v3YaAQQfJl7oxy9ZHWXLH2rWSEnvHqvGOwv88JZqfY4=;
	b=WZWsiSXotdJLLFiP+t9CVF/CWgwEnanhtQByLUu2/07lhasZhV5mFNHGs7ZiF/HxY2
	hHNHjH2N7+RsWv4QVxZsBqZe81f20l0olvKcpAqQcglXTT8twxJBF/aeChki4Qlkg/JB
	PUO/84GXB69tE2wamMD6RVnBHGl8DOiiYzuZRhvrFx4O8eOCGKL4TT8LRk6vh+0afbr9
	BRwigYsy+zUMibGp7XRvudL+qZKvTtT5HSo/EhwGLP5GUtZut4bzO5hbmH2V11iUka1x
	aZRHHZyjZq1pasbb94hctz7YM+kWb0sIj3LaOqTcxMX+EaQBSbh3YoUfqZGM7xp2du0k
	j/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1763400382; x=1764005182;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=v3YaAQQfJl7oxy9ZHWXLH2rWSEnvHqvGOwv88JZqfY4=;
	b=qvOOejkS+XW2hrSIGI3xSGaYYgqRkaQd1uQCcsTjxcAvjU0W+zYyP6BRBqD1FvvqQy
	uSyPJHO8o9KRpzxsiTkzy/eQ0IPY3ps4+ijVKtgQSX15U0u7U7EXoUo+/NNVplkY/kxO
	MS55yzsYo3+0D9D0DA4TY4BTwTG71XLeHlu/kZd0m31dL5RFK9OuRNPDlrAfEVwBqLsB
	QYEC3agDCwV0IJXkS9qFJ8nugoAgYBuJPTGQYdGMrqgp87NBpIVq7x+5K3OAsOKMPmcH
	J1DrwgWnwEVb9xaZYXDuMRuGrR6IxS525EfuDqpCOQJt/zmvzlaxcjMob1cqnEvVkdD3
	4F4g==
X-Forwarded-Encrypted: i=1;
	AJvYcCVEEry/lMhsVMe58C/77ccXaZDhlZ/cOXjLKNqN5zRQJm+dJVAaosM/2y5SZKZRhi1vX39TS6TZvg==@lists.linbit.com
X-Gm-Message-State: AOJu0YyYX0MhoDvS7r3orsQb+4C6MDDe9BhSEgKrbbEAEwwJx5Ku5QaF
	U16BLXzzzq6CzbHZ6JuOX436RUlppFx0Ar6qwl1WTOEG0+ZVq+mVVs/V
X-Gm-Gg: ASbGncvOdDTEciSGhUs+ZIX0lajDpTmHj3GMYmhKrVKlrbxRtN45Uh23eyR2og2oeOC
	Wg7Lh8/4mg1MtvEkJFxEdcDAU51+6fh/yTQcsmm1ECmj7zdfTQD1uCM+jVYuNfasL1uLRoHJT7T
	/Jp7beLLWkzk7c9MA4KEiYY6t0GJNl45QchpYkEiBnXUeJHcJhNA+G1ZkrK/v6+jPySjbqTl0oR
	vx3ptNyhCtEyoydut/UFO2IRxo9zkHu3wL2epim6vtfY/GGOKTLa0SX0QH6PUQOssoWer6fJeDy
	vNvu2+XkQYd3svd/Els7BX5xpUSHeJ/MFehMMzsu6mB6lu0FwVQASvup1DFJGZqE2iYulS0/x1f
	46ofmzAELyS3UsOpJOMR6Em620EmSIHlRR5ObYdH1qhXJDeHBiojzhDOX8NjhesSiHpujXXTt
X-Google-Smtp-Source: AGHT+IGVOqt1KvdPHFwUMBNxRfOX0UgBscBOMeK4i00bBVPVTRd3PKUbbydP08iP89j2CLTLFzgFUQ==
X-Received: by 2002:a17:902:d4c4:b0:298:55c8:eb8d with SMTP id
	d9443c01a7336-2986a72bf9dmr158144985ad.35.1763400382095; 
	Mon, 17 Nov 2025 09:26:22 -0800 (PST)
Received: from hsukr3.. ([2405:201:d019:4042:4a5d:d140:fa1f:849b])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-2985c2565easm145017485ad.48.2025.11.17.09.26.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Nov 2025 09:26:21 -0800 (PST)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com (open list:DRBD DRIVER),
	linux-block@vger.kernel.org (open list:BLOCK LAYER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drbd: add missing kernel-doc for peer_device parameter
Date: Mon, 17 Nov 2025 22:55:56 +0530
Message-ID: <20251117172557.355797-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:07:50 +0100
Cc: Sukrut Heroorkar <hsukrut3@gmail.com>, shuah@kernel.org,
	david.hunter.linux@gmail.com
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

W=1 build warns that peer_device is undocumented in the bitmap I/O
handlers. This parameter was introduced in commit 8164dd6c8ae1
("drbd: Add peer device parameter to whole-bitmap I/O handlers"), but
the kernel-doc was not updated.

Add the missing @peer_device entry.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 drivers/block/drbd/drbd_bitmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 85ca000a0564..2d26f9d2454d 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1213,6 +1213,7 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 /**
  * drbd_bm_read() - Read the whole bitmap from its on disk location.
  * @device:	DRBD device.
+ * @peer_device: Peer device for which the bitmap read is performed.
  */
 int drbd_bm_read(struct drbd_device *device,
 		 struct drbd_peer_device *peer_device) __must_hold(local)
@@ -1224,6 +1225,7 @@ int drbd_bm_read(struct drbd_device *device,
 /**
  * drbd_bm_write() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device: Peer device for which the bitmap write is performed.
  *
  * Will only write pages that have changed since last IO.
  */
@@ -1236,7 +1238,7 @@ int drbd_bm_write(struct drbd_device *device,
 /**
  * drbd_bm_write_all() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
- *
+ * @peer_device: Peer device for which the bitmap write is performed.
  * Will write all pages.
  */
 int drbd_bm_write_all(struct drbd_device *device,
@@ -1258,6 +1260,7 @@ int drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_ho
 /**
  * drbd_bm_write_copy_pages() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device: Peer device for which the bitmap write is performed.
  *
  * Will only write pages that have changed since last IO.
  * In contrast to drbd_bm_write(), this will copy the bitmap pages
@@ -1275,6 +1278,7 @@ int drbd_bm_write_copy_pages(struct drbd_device *device,
 /**
  * drbd_bm_write_hinted() - Write bitmap pages with "hint" marks, if they have changed.
  * @device:	DRBD device.
+ * @peer_device: Peer device for which the bitmap write is performed.
  */
 int drbd_bm_write_hinted(struct drbd_device *device) __must_hold(local)
 {
-- 
2.43.0

