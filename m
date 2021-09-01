Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 161733FD16C
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Sep 2021 04:38:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF70F420206;
	Wed,  1 Sep 2021 04:38:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2835.qiye.163.com (mail-m2835.qiye.163.com [103.74.28.35])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D3CE3420206
	for <drbd-dev@lists.linbit.com>; Wed,  1 Sep 2021 04:38:33 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2835.qiye.163.com (Hmail) with ESMTPA id 3EB8C8A0107;
	Wed,  1 Sep 2021 10:38:27 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com,
	drbd-dev@lists.linbit.com
Date: Wed,  1 Sep 2021 10:38:26 +0800
Message-Id: <20210901023826.838222-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUMYTxlWGEJMQ0lDGBoaTU
	tCVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBw6NSo*KDNMQh4pKR5JDiMM
	GgxPC1FVSlVKTUhLT01IQktMTU5CVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUhCSUs3Bg++
X-HM-Tid: 0a7b9f38d5fb841dkuqw3eb8c8a0107
Subject: [Drbd-dev] [PATCH] drbd: do not finish the stable resync when repl
	state is L_PAUSED_SYNC_T
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

The assumption was, when a unstable resync start first, then a stable resync starts
and be paused. If the stable resync finish ahead of the unstable one from paused directly,
it will leaving the resync end into INCONSISTENT finally.

So don't finish the stable resync when repl state is L_PAUSED_SYNC_T, finish it when the
repl state turns into L_SYNC_TARGET.

Signed-off-by: Xu Rui <rui.xu@easystack.cn>
---
 drbd/drbd_actlog.c | 15 +++++++++++++++
 drbd/drbd_int.h    |  1 +
 drbd/drbd_sender.c |  5 +++++
 3 files changed, 21 insertions(+)

diff --git a/drbd/drbd_actlog.c b/drbd/drbd_actlog.c
index 1676c355..3900b426 100644
--- a/drbd/drbd_actlog.c
+++ b/drbd/drbd_actlog.c
@@ -1117,7 +1117,22 @@ static int update_sync_bits(struct drbd_peer_device *peer_device,
 		if (mode == SET_IN_SYNC) {
 			unsigned long still_to_go = drbd_bm_total_weight(peer_device);
 			bool rs_is_done = (still_to_go <= peer_device->rs_failed);
+			enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
 			drbd_advance_rs_marks(peer_device, still_to_go);
+                        if (rs_is_done && repl_state == L_PAUSED_SYNC_T && !test_bit(UNSTABLE_RESYNC, &peer_device->flags)) {
+                                struct drbd_device *device = peer_device->device;
+                                struct drbd_peer_device *p;
+                                for_each_peer_device(p, device) {
+                                    if (p == peer_device)
+                                        continue;
+
+                                    if (test_bit(UNSTABLE_RESYNC, &p->flags) && p->repl_state[NOW] == L_SYNC_TARGET) {
+                                        rs_is_done = false;
+                                        peer_device->finish_resync_delay = true;
+                                        break;
+                                    }
+                                }
+                        }
 			if (cleared || rs_is_done)
 				maybe_schedule_on_disk_bitmap_update(peer_device, rs_is_done);
 		} else if (mode == RECORD_RS_FAILED) {
diff --git a/drbd/drbd_int.h b/drbd/drbd_int.h
index 8db0007e..a3a7d241 100644
--- a/drbd/drbd_int.h
+++ b/drbd/drbd_int.h
@@ -1095,6 +1095,7 @@ struct drbd_peer_device {
 	bool resync_susp_peer[2];
 	bool resync_susp_dependency[2];
 	bool resync_susp_other_c[2];
+	bool finish_resync_delay;
 	enum drbd_repl_state negotiation_result; /* To find disk state after attach */
 	unsigned int send_cnt;
 	unsigned int recv_cnt;
diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
index f3c39b0f..01ce46b3 100644
--- a/drbd/drbd_sender.c
+++ b/drbd/drbd_sender.c
@@ -735,6 +735,7 @@ next_sector:
 			goto request_done;
 		}
 
+		peer_device->finish_resync_delay = false;
 		sector = BM_BIT_TO_SECT(bit);
 
 		if (drbd_try_rs_begin_io(peer_device, sector, true)) {
@@ -833,6 +834,10 @@ request_done:
 		 * resync data block, and the last bit is cleared.
 		 * until then resync "work" is "inactive" ...
 		 */
+                if (peer_device->finish_resync_delay) {
+                	drbd_resync_finished(peer_device, D_MASK);
+                	peer_device->finish_resync_delay = false;
+                }
 		put_ldev(device);
 		return 0;
 	}
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
