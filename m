Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E540C420
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Sep 2021 13:07:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 60ECF420636;
	Wed, 15 Sep 2021 13:07:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2835.qiye.163.com (mail-m2835.qiye.163.com [103.74.28.35])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 224BE420625
	for <drbd-dev@lists.linbit.com>; Wed, 15 Sep 2021 13:07:50 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2835.qiye.163.com (Hmail) with ESMTPA id 316F58A019E;
	Wed, 15 Sep 2021 19:07:44 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Wed, 15 Sep 2021 19:07:43 +0800
Message-Id: <20210915110743.1271706-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGNP_+VFUJfijkem8TWr1ptkJXbdZryuvbnpLY1GCBgPvKzdzw@mail.gmail.com>
References: <CAGNP_+VFUJfijkem8TWr1ptkJXbdZryuvbnpLY1GCBgPvKzdzw@mail.gmail.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRoaQktWTkgfQxkdSEpIHh
	1IVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6GDo5FDMMLw5RGEpWFksh
	HBxPCQtVSlVKTUhKTEtPS01PTU5MVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQU9PQkM3Bg++
X-HM-Tid: 0a7be92421a7841dkuqw316f58a019e
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH v3] drbd: fix a race condition in
	update_sync_bits() and receive_bitmap()
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

There was a race condition involving update_sync_bits() and
receive_bitmap(). Consider this scenario:

Primary: node-3, Secondary: node-1, node-2

(1) Network failure occurs on node-1
(2) node-1 network recovers
(3) node-1 connects to node-2, and starts resync (node-1 is SyncTarget,
node-2 is SyncSource)
(4) Before resync in (3) finishes, node-1 connects to node-3 and starts
resync (node-1 is PausedSyncT, node-3 is PausedSyncS)

The following sequence can occur on node-1 while it is syncing from
node-2:

* ack_receiver thread processes P_PEERS_IN_SYNC
* ack_receiver: call update_sync_bits()
* ack_receiver: clear the last bitmap bits for node-3
* ack_receiver: set rs_is_done to 1
* receiver thread processes P_*BITMAP
* receiver: call receive_bitmap()
* receiver: set bitmap bits for node-3
* receiver: set the repl_state towards node-3 to PausedSyncT
* ack_receiver: set RS_DONE flag

This causes the resync from node-3 to node-1 to finish even though
bitmap bits are still set, and node-1 will finish the resync as
PausedSyncT, but the resync from node-2 to node-1 is still ongoing,
at last, it will finish as a unstable resync, and leaving the disk
state end into INCONSISTENT finally.

Fix this by evaluating is_sync_target_state before getting the bitmap
total weight in update_sync_bits.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
---
changelog:
	-From v1: fix typo in commit message
	-From v2: add a brief comment to the code
	and added the bug description in commit message

 drbd/drbd_actlog.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drbd/drbd_actlog.c b/drbd/drbd_actlog.c
index 841e5149..01e64823 100644
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
@@ -1105,11 +1105,18 @@ static int update_sync_bits(struct drbd_peer_device *peer_device,
 	}
 	if (count) {
 		if (mode == SET_IN_SYNC) {
+			/* Evaluate is_sync_target_state before getting the bm total
+			 * weight to avoid a scenario: still_to_go is 0 when sync
+			 * state is not sync_target_state, but sync state change to
+			 * sync_target_state later and finish the resync even though
+			 * bitmap bits are still set.
+			 */
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
