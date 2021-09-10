Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C004066E5
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Sep 2021 07:40:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EC6942061D;
	Fri, 10 Sep 2021 07:40:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2835.qiye.163.com (mail-m2835.qiye.163.com [103.74.28.35])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76C6E4201F1
	for <drbd-dev@lists.linbit.com>; Fri, 10 Sep 2021 07:40:16 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2835.qiye.163.com (Hmail) with ESMTPA id BED9E8A026B;
	Fri, 10 Sep 2021 13:40:12 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com,
	drbd-dev@lists.linbit.com
Date: Fri, 10 Sep 2021 13:40:11 +0800
Message-Id: <20210910054011.1115655-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRlDTUhWTh9NTB1OTEwaT0
	pJVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nzo6PCo4EjNRDQotPw0rQ0tL
	Vi8aCQhVSlVKTUhKSU5JT0pISk9JVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUhIT003Bg++
X-HM-Tid: 0a7bce3879c9841dkuqwbed9e8a026b
Cc: dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd: fix a race condition in update_sync_bits()
	and receive_bitmap()
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

There is a race condition in update_sync_bits() and receive_bitmap(),
please consider this scenario:

Primary: node-3, Secondary node-1, node-2

(1) network failure happend on node-1.
(2) node-1 network recovery.
(3) node-1 connect to node-2, and start resync (node-1 is SyncTarget,
node-2 is SyncSource)
(4) before resync in (3) finished, node-1 connect to node-3 and start
resync.(node-1 is PauseSyncTarget, node-3 is PauseSyncSource)

When node-1(SyncTarget) is resync with node-2(SyncSource), node-1 may
set bitmap for node-3 in receive_resync_read()->drbd_set_all_out_of_sync(),
and clear the bimap for node-3 when got P_PEERS_IN_SYNC from node-2.

Then there is a possibility scenario as below:

thread:ack_receiver (node-1)           thread:receiver (node-1)
update_sync_bits()                     receive_bitmap()

set the rs_is_done to 1                set the bitmap for node-3
				       set the repl_state to PauseSyncTarget
set RS_DONE flag

it will lead the reysnc of node-1 and node-3 to finish in an unexpected way, so
we need to determine the is_sync_target_state before getting the bitmap total
weight in update_sync_bits.
---
 drbd/drbd_actlog.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drbd/drbd_actlog.c b/drbd/drbd_actlog.c
index 841e5149..3d2fd399 100644
--- a/drbd/drbd_actlog.c
+++ b/drbd/drbd_actlog.c
@@ -1044,11 +1044,11 @@ static bool lazy_bitmap_update_due(struct drbd_peer_device *peer_device)
 }
 
 static void maybe_schedule_on_disk_bitmap_update(struct drbd_peer_device *peer_device,
-						 bool rs_done)
+						 bool rs_done, bool is_sync_target)
 {
 	if (rs_done) {
 		if (peer_device->connection->agreed_pro_version <= 95 ||
-		    is_sync_target_state(peer_device, NOW))
+		    is_sync_target)
 			set_bit(RS_DONE, &peer_device->flags);
 
 		/* If sync source: rather wait for explicit notification via
@@ -1105,11 +1105,12 @@ static int update_sync_bits(struct drbd_peer_device *peer_device,
 	}
 	if (count) {
 		if (mode == SET_IN_SYNC) {
+			bool is_sync_target = is_sync_target_state(peer_device, NOW);
 			unsigned long still_to_go = drbd_bm_total_weight(peer_device);
 			bool rs_is_done = (still_to_go <= peer_device->rs_failed);
 			drbd_advance_rs_marks(peer_device, still_to_go);
 			if (cleared || rs_is_done)
-				maybe_schedule_on_disk_bitmap_update(peer_device, rs_is_done);
+				maybe_schedule_on_disk_bitmap_update(peer_device, rs_is_done, is_sync_target);
 		} else if (mode == RECORD_RS_FAILED) {
 			peer_device->rs_failed += count;
 		} else /* if (mode == SET_OUT_OF_SYNC) */ {
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
