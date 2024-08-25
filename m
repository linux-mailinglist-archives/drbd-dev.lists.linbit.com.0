Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212B967F08
	for <lists+drbd-dev@lfdr.de>; Mon,  2 Sep 2024 08:00:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B3DC42092C;
	Mon,  2 Sep 2024 08:00:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 532 seconds by postgrey-1.31 at mail19;
	Sun, 25 Aug 2024 18:31:22 CEST
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
	[80.12.242.24])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3D72642004B
	for <drbd-dev@lists.linbit.com>; Sun, 25 Aug 2024 18:31:22 +0200 (CEST)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
	id iG0Zs22q8jDE7iG0ZswTyj; Sun, 25 Aug 2024 18:22:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724602948;
	bh=dWmD0V+W1NiHZUZkeWhaQAh8ZUporSmdN746Lio9aro=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jD4Y7aGW+AP7mCFOiQtxNv1Ze05yNleFkbmCSCIJjBErp9S+CNqbeq7isXLW8S7e/
	l80O6buXBuwgjC2+BC9F8brGqjHZDPs7PYqOiyTLPMwc0EbYekuo9H2pJaukRvO4yi
	jXl+UTQqWROs3SiAWilcm7o2H9KD+WnlwCCO6s3sMy5B+0bRWqMQMjVyWC+QisB3SF
	rq9XS+GTOGRzVdD6ruO4tTKJmZ4EtFXSjkwUgnRVeSP3vO/ak23syLNAUMrZWVfNqj
	nyszHp3pbfo7p8Vex4KD/d4LlnNkiqCy4bsxn2F7iJKGwxLsKpyr+SLt6XX4yNc0v9
	pn8vWnCHPuJ+Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 Aug 2024 18:22:28 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: Remove an unused field in struct drbd_device
Date: Sun, 25 Aug 2024 18:22:23 +0200
Message-ID: <d5322ef88d1d6f544963ee277cb0b427da8dceef.1724602922.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Sep 2024 08:00:24 +0200
Cc: linux-block@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
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

'next_barrier_nr' is not used in this driver. Remove it.

It was already part of the original commit b411b3637fa7 ("The DRBD driver")
Apparently, it has never been used.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/block/drbd/drbd_int.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index d2937bca1fe4..2a05d955e30b 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -860,7 +860,6 @@ struct drbd_device {
 	struct list_head read_ee;   /* [RS]P_DATA_REQUEST being read */
 	struct list_head net_ee;    /* zero-copy network send in progress */
 
-	int next_barrier_nr;
 	struct list_head resync_reads;
 	atomic_t pp_in_use;		/* allocated from page pool */
 	atomic_t pp_in_use_by_net;	/* sendpage()d, still referenced by tcp */
-- 
2.46.0

