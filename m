Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A461D5B287E
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Sep 2022 23:23:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9009A4210CE;
	Thu,  8 Sep 2022 23:23:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from aragorn.cowesettanimalhospital.com
	(wsip-72-215-235-61.ri.ri.cox.net [72.215.235.61])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0AA364210CE
	for <drbd-dev@lists.linbit.com>; Thu,  8 Sep 2022 23:21:24 +0200 (CEST)
Received: by aragorn.cowesettanimalhospital.com (Postfix, from userid 1200)
	id 3EB6F1407B2; Thu,  8 Sep 2022 17:13:53 -0400 (EDT)
From: Michael D Labriola <veggiemike@sourceruckus.org>
To: drbd-dev@lists.linbit.com
Date: Thu,  8 Sep 2022 17:13:36 -0400
Message-Id: <20220908211337.17090-3-veggiemike@sourceruckus.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908211337.17090-1-veggiemike@sourceruckus.org>
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
Subject: [Drbd-dev] [PATCH 2/3] drbd: remove reliance on bdi congestion
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

A serries of commits between 5.17 and 5.18 removed inode_congested()
and all it's related functions because "No bdi reports congestion any
more, so this always returns 'false'".

This commit just returns false in both places bdi_congested() was
called... which probably isn't the best long-term fix.

See upstream commits:

670d21c6e17f67535fcf16e14c772209220da9ae
6df25e58532be7a4cd6fb15bcd85805947402d91
503d4fa6ee28e8d4d201c92ac3922d1b3526f844
fe55d563d4174f13839a9b7ef7309da5031b5d93

Signed-off-by: Michael D Labriola <veggiemike@sourceruckus.org>
---
 drbd/drbd_nl.c  | 5 +----
 drbd/drbd_req.c | 3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index 79464bb7..1a126d41 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -5446,10 +5446,7 @@ static void device_to_statistics(struct device_statistics *s,
 		spin_unlock_irq(&md->uuid_lock);
 
 		s->dev_disk_flags = md->flags;
-		s->dev_lower_blocked =
-			bdi_congested(device->ldev->backing_bdev->bd_disk->bdi,
-				      (1 << WB_async_congested) |
-				      (1 << WB_sync_congested));
+		s->dev_lower_blocked = false;
 		put_ldev(device);
 	}
 	s->dev_size = get_capacity(device->vdisk);
diff --git a/drbd/drbd_req.c b/drbd/drbd_req.c
index f58bfc4a..fc7dfb8d 100644
--- a/drbd/drbd_req.c
+++ b/drbd/drbd_req.c
@@ -1274,8 +1274,7 @@ static bool remote_due_to_read_balancing(struct drbd_device *device,
 
 	switch (rbm) {
 	case RB_CONGESTED_REMOTE:
-		return bdi_read_congested(
-			device->ldev->backing_bdev->bd_disk->bdi);
+		return false;
 	case RB_LEAST_PENDING:
 		return atomic_read(&device->local_cnt) >
 			atomic_read(&peer_device->ap_pending_cnt) + atomic_read(&peer_device->rs_pending_cnt);
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
