Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB751E591
	for <lists+drbd-dev@lfdr.de>; Sat,  7 May 2022 10:25:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 29BCC420334;
	Sat,  7 May 2022 10:25:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2837.qiye.163.com (mail-m2837.qiye.163.com [103.74.28.37])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B5544201FE
	for <drbd-dev@lists.linbit.com>; Sat,  7 May 2022 10:25:23 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2837.qiye.163.com (Hmail) with ESMTPA id D0E966007C7;
	Sat,  7 May 2022 16:25:20 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Sat,  7 May 2022 16:25:19 +0800
Message-Id: <20220507082519.1968685-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUJISx1WGkgdSR8fTEMZSB
	kYVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxg6EQw5HjIYFjIxL0gzEjUj
	OkwKCylVSlVKTU5KQkpKQklKQ0NMVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUNCSE03Bg++
X-HM-Tid: 0a809d9f8f3b841fkuqwd0e966007c7
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd: change the variable ov_left to atomic
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

The problem was, that when a node(node-1) is a verify source of another
node(node-2), it will send P_OV_REQUEST and node-2 will process it. In normal
scenarios, node-2 will reply P_OV_REPLY to node-1, but if an application IO is
onging on corresponding sector on node-2, it will reply P_RS_CANCEL to node-1.

So w_e_end_ov_reply and got_NegRSDReply can be happened concurrently, it may
lead to the self subtraction of the variable ov_left happened at the same time,
finally, the variable ov_left may not be reduced to zero, which causes verify
unable to end.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_debugfs.c  |  4 ++--
 drbd/drbd_int.h      |  2 +-
 drbd/drbd_nl.c       |  4 ++--
 drbd/drbd_receiver.c |  9 +++++----
 drbd/drbd_sender.c   | 12 ++++++------
 drbd/drbd_state.c    |  9 +++++----
 6 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drbd/drbd_debugfs.c b/drbd/drbd_debugfs.c
index fbc6e3f..9fde14a 100644
--- a/drbd/drbd_debugfs.c
+++ b/drbd/drbd_debugfs.c
@@ -1428,7 +1428,7 @@ static void drbd_get_syncer_progress(struct drbd_peer_device *pd,
 	 * for the percentage, we don't care. */
 
 	if (repl_state == L_VERIFY_S || repl_state == L_VERIFY_T)
-		*bits_left = pd->ov_left;
+		*bits_left = atomic64_read(&pd->ov_left);
 	else
 		*bits_left = drbd_bm_total_weight(pd) - pd->rs_failed;
 	/* >> 10 to prevent overflow,
@@ -1564,7 +1564,7 @@ static void drbd_syncer_progress(struct drbd_peer_device *pd, struct seq_file *s
 		unsigned long long stop_sector = 0;
 		if (repl_state == L_VERIFY_S ||
 		    repl_state == L_VERIFY_T) {
-			bit_pos = bm_bits - pd->ov_left;
+			bit_pos = bm_bits - (unsigned long)atomic64_read(&pd->ov_left);
 			stop_sector = pd->ov_stop_sector;
 		} else
 			bit_pos = pd->resync_next_bit;
diff --git a/drbd/drbd_int.h b/drbd/drbd_int.h
index c042f39..ca5877b 100644
--- a/drbd/drbd_int.h
+++ b/drbd/drbd_int.h
@@ -1254,7 +1254,7 @@ struct drbd_peer_device {
 			      * on the lower level device when we last looked. */
 	int rs_in_flight; /* resync sectors in flight (to proxy, in proxy and from proxy) */
 	ktime_t rs_last_mk_req_kt;
-	unsigned long ov_left; /* in bits */
+	atomic64_t ov_left; /* in bits */
 	unsigned long ov_skipped; /* in bits */
 	u64 rs_start_uuid;
 
diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index 8f49f84..b6ac19f 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -5795,11 +5795,11 @@ static void peer_device_to_statistics(struct peer_device_statistics *s,
 	s->peer_dev_out_of_sync = BM_BIT_TO_SECT(drbd_bm_total_weight(pd));
 
 	if (is_verify_state(pd, NOW)) {
-		rs_left = BM_BIT_TO_SECT(pd->ov_left);
+		rs_left = BM_BIT_TO_SECT(atomic64_read(&pd->ov_left));
 		s->peer_dev_ov_start_sector = pd->ov_start_sector;
 		s->peer_dev_ov_stop_sector = pd->ov_stop_sector;
 		s->peer_dev_ov_position = pd->ov_position;
-		s->peer_dev_ov_left = BM_BIT_TO_SECT(pd->ov_left);
+		s->peer_dev_ov_left = BM_BIT_TO_SECT(atomic64_read(&pd->ov_left));
 		s->peer_dev_ov_skipped = BM_BIT_TO_SECT(pd->ov_skipped);
 	} else if (is_sync_state(pd, NOW)) {
 		rs_left = s->peer_dev_out_of_sync - BM_BIT_TO_SECT(pd->rs_failed);
diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index f077f2b..bea6e09 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -3131,7 +3131,7 @@ bool drbd_rs_c_min_rate_throttle(struct drbd_peer_device *peer_device)
 		i = (peer_device->rs_last_mark + DRBD_SYNC_MARKS-1) % DRBD_SYNC_MARKS;
 
 		if (peer_device->repl_state[NOW] == L_VERIFY_S || peer_device->repl_state[NOW] == L_VERIFY_T)
-			rs_left = peer_device->ov_left;
+			rs_left = atomic64_read(&peer_device->ov_left);
 		else
 			rs_left = drbd_bm_total_weight(peer_device) - peer_device->rs_failed;
 
@@ -3330,13 +3330,14 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 		if (peer_device->ov_start_sector == ~(sector_t)0) {
 			unsigned long now = jiffies;
 			int i;
+			unsigned long ov_left = drbd_bm_bits(device) - BM_SECT_TO_BIT(sector);
+			atomic64_set(&peer_device->ov_left, ov_left);	
 			peer_device->ov_start_sector = sector;
-			peer_device->ov_left = drbd_bm_bits(device) - BM_SECT_TO_BIT(sector);
 			peer_device->ov_skipped = 0;
-			peer_device->rs_total = peer_device->ov_left;
+			peer_device->rs_total = ov_left;
 			peer_device->rs_last_writeout = now;
 			for (i = 0; i < DRBD_SYNC_MARKS; i++) {
-				peer_device->rs_mark_left[i] = peer_device->ov_left;
+				peer_device->rs_mark_left[i] = ov_left;
 				peer_device->rs_mark_time[i] = now;
 			}
 			drbd_info(device, "Online Verify start sector: %llu\n",
diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
index 134e6b9..5d514c5 100644
--- a/drbd/drbd_sender.c
+++ b/drbd/drbd_sender.c
@@ -1280,7 +1280,7 @@ void drbd_resync_finished(struct drbd_peer_device *peer_device,
 	db = peer_device->rs_total;
 	/* adjust for verify start and stop sectors, respective reached position */
 	if (repl_state[NOW] == L_VERIFY_S || repl_state[NOW] == L_VERIFY_T)
-		db -= peer_device->ov_left;
+		db -= atomic64_read(&peer_device->ov_left);
 
 	dbdt = Bit2KB(db/dt);
 	peer_device->rs_paused /= HZ;
@@ -1424,7 +1424,7 @@ out_unlock:
 
 out:
 	/* reset start sector, if we reached end of device */
-	if (verify_done && peer_device->ov_left == 0)
+	if (verify_done && atomic64_read(&peer_device->ov_left) == 0)
 		peer_device->ov_start_sector = 0;
 
 	drbd_md_sync_if_dirty(device);
@@ -1711,13 +1711,13 @@ void verify_progress(struct drbd_peer_device *peer_device,
 		(peer_device->repl_state[NOW] == L_VERIFY_S) &&
 		(sector + (size>>9)) >= peer_device->ov_stop_sector;
 
-	--peer_device->ov_left;
+	unsigned long ov_left = atomic64_dec_return(&peer_device->ov_left);
 
 	/* let's advance progress step marks only for every other megabyte */
-	if ((peer_device->ov_left & 0x1ff) == 0)
-		drbd_advance_rs_marks(peer_device, peer_device->ov_left);
+	if ((ov_left & 0x1ff) == 0)
+		drbd_advance_rs_marks(peer_device, ov_left);
 
-	if (peer_device->ov_left == 0 || stop_sector_reached)
+	if (ov_left == 0 || stop_sector_reached)
 		drbd_peer_device_post_work(peer_device, RS_DONE);
 }
 
diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 896c035..7f81192 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -2234,7 +2234,7 @@ static void set_ov_position(struct drbd_peer_device *peer_device,
 			peer_device->rs_total -= bit;
 		peer_device->ov_position = peer_device->ov_start_sector;
 	}
-	peer_device->ov_left = peer_device->rs_total;
+	atomic64_set(&peer_device->ov_left, peer_device->rs_total);
 	peer_device->ov_skipped = 0;
 }
 
@@ -2416,6 +2416,7 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 			enum drbd_disk_state *peer_disk_state = peer_device->disk_state;
 			struct drbd_connection *connection = peer_device->connection;
 			enum drbd_role *peer_role = connection->peer_role;
+			unsigned long ov_left = atomic64_read(&peer_device->ov_left);
 
 			if (repl_state[OLD] <= L_ESTABLISHED && repl_state[NEW] == L_WF_BITMAP_S)
 				starting_resync = true;
@@ -2432,8 +2433,8 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 			if ((repl_state[OLD] == L_VERIFY_S || repl_state[OLD] == L_VERIFY_T) &&
 			    repl_state[NEW] <= L_ESTABLISHED) {
 				peer_device->ov_start_sector =
-					BM_BIT_TO_SECT(drbd_bm_bits(device) - peer_device->ov_left);
-				if (peer_device->ov_left)
+					BM_BIT_TO_SECT(drbd_bm_bits(device) - ov_left);
+				if (ov_left)
 					drbd_info(peer_device, "Online Verify reached sector %llu\n",
 						  (unsigned long long)peer_device->ov_start_sector);
 			}
@@ -2475,7 +2476,7 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 				peer_device->ov_last_skipped_start = 0;
 				peer_device->rs_last_writeout = now;
 				for (i = 0; i < DRBD_SYNC_MARKS; i++) {
-					peer_device->rs_mark_left[i] = peer_device->ov_left;
+					peer_device->rs_mark_left[i] = peer_device->rs_total;
 					peer_device->rs_mark_time[i] = now;
 				}
 
-- 
1.8.3.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
