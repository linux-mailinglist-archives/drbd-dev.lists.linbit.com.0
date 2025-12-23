Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A5CD9170
	for <lists+drbd-dev@lfdr.de>; Tue, 23 Dec 2025 12:23:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03BB8163147;
	Tue, 23 Dec 2025 12:23:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 602 seconds by postgrey-1.31 at mail19;
	Tue, 23 Dec 2025 12:23:29 CET
Received: from mail-m1973198.qiye.163.com (mail-m1973198.qiye.163.com
	[220.197.31.98])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AB891626CE
	for <drbd-dev@lists.linbit.com>; Tue, 23 Dec 2025 12:23:29 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14b435016;
	Tue, 23 Dec 2025 19:08:19 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH v3] drbd: Send P_PEERS_IN_SYNC only within the resync range in
	resync progress
Date: Tue, 23 Dec 2025 19:08:16 +0800
Message-ID: <20251223110818.589784-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b4ae548960227kunmc8437e80ca9792
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk5MVkNOHR8fQxofTRgeTVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
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

During the resync process, the range of resync is not continuous.
If the next sync position is very far from the current sync position,
it will cause the same problem as commit: e2d0439f9
("drbd: only send P_PEERS_IN_SYNC for up to 4 MiB when resync finished").

The solution is to skip the sector where there is no reysnc.

Fixes: bc218ad64640 ("drbd: only send P_PEERS_IN_SYNC every 4MiB")

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_int.h      |  4 ++-
 drbd/drbd_receiver.c | 61 +++++++++++++++++++++++++++++++++++++++++---
 drbd/drbd_state.c    |  1 +
 3 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/drbd/drbd_int.h b/drbd/drbd_int.h
index 68991ab93..0bfcd0f0a 100644
--- a/drbd/drbd_int.h
+++ b/drbd/drbd_int.h
@@ -1379,6 +1379,7 @@ struct drbd_peer_device {
 	enum drbd_disk_state resync_finished_pdsk; /* Finished while starting resync */
 	int resync_again; /* decided to resync again while resync running */
 	sector_t last_peers_in_sync_end; /* sector after end of last scheduled peers-in-sync */
+	sector_t last_in_sync_end; /* sector of the last in sync and not update */
 	unsigned long resync_next_bit; /* bitmap bit to search from for next resync request */
 	unsigned long last_resync_pass_bits; /* bitmap weight at end of previous pass */
 
@@ -2014,7 +2015,8 @@ static inline sector_t device_bit_to_kb(struct drbd_device *device, unsigned lon
  * extent shift since the P_PEERS_IN_SYNC intervals are broken up based on
  * activity log extents anyway. */
 #define PEERS_IN_SYNC_STEP_SHIFT AL_EXTENT_SHIFT
-#define PEERS_IN_SYNC_STEP_SECT_MASK ((1UL << (PEERS_IN_SYNC_STEP_SHIFT - SECTOR_SHIFT)) - 1)
+#define PEERS_IN_SYNC_STEP_SECT      (1UL << (PEERS_IN_SYNC_STEP_SHIFT - SECTOR_SHIFT))
+#define PEERS_IN_SYNC_STEP_SECT_MASK (PEERS_IN_SYNC_STEP_SECT - 1)
 
 /* Indexed external meta data has a fixed on-disk size of 128MiB, of which
  * 4KiB are our "superblock", and 32KiB are the fixed size activity
diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 3eed5d33e..08fd20b14 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -2350,11 +2350,17 @@ void drbd_queue_update_peers(struct drbd_peer_device *peer_device,
 	}
 }
 
-static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, sector_t sector_end)
+static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device,
+		sector_t sector_start, sector_t sector_end)
 {
+	sector_t tmp_peers_in_sync_end, last_in_sync_end;
+	sector_t peers_in_sync_start = sector_start & ~PEERS_IN_SYNC_STEP_SECT_MASK;
 	/* Round down to the boundary defined by PEERS_IN_SYNC_STEP_SHIFT. */
 	sector_t peers_in_sync_end = sector_end & ~PEERS_IN_SYNC_STEP_SECT_MASK;
 
+	last_in_sync_end = peer_device->last_in_sync_end;
+	peer_device->last_in_sync_end = sector_end;
+
 	/* If we move backwards then move marker back. */
 	if (peers_in_sync_end < peer_device->last_peers_in_sync_end) {
 		peer_device->last_peers_in_sync_end = peers_in_sync_end;
@@ -2365,8 +2371,54 @@ static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, se
 	if (peers_in_sync_end == peer_device->last_peers_in_sync_end)
 		return;
 
-	drbd_queue_update_peers(peer_device, peer_device->last_peers_in_sync_end, peers_in_sync_end);
-	peer_device->last_peers_in_sync_end = peers_in_sync_end;
+	tmp_peers_in_sync_end = min(get_capacity(peer_device->device->vdisk),
+			(peer_device->last_peers_in_sync_end | PEERS_IN_SYNC_STEP_SECT_MASK) + 1);
+	D_ASSERT(peer_device, last_in_sync_end >= peer_device->last_peers_in_sync_end &&
+			last_in_sync_end < tmp_peers_in_sync_end);
+	/*  We need to consider two cases here:
+	 *  If last_in_sync_end has crossed last_peers_in_sync_end,
+	 *  we need to schedule an update.  Also, if sector_start is before
+	 *  tmp_peers_in_sync_end, we need to schedule an update.
+	 *
+	 * Condition A: last_in_sync_end has advanced beyond last_peers_in_sync_end
+	 *
+	 *     last_peers_in_sync_end       tmp_peers_in_sync_end
+	 *             ↓                             ↓
+	 *     --------|--------- 4MiB --------------|---------
+	 *             [--- last_in_sync_end ---]
+	 *
+	 * Condition B: New I/O starts before the next boundary
+	 *
+	 *     last_peers_in_sync_end       tmp_peers_in_sync_end
+	 *             ↓                             ↓
+	 *     --------|--------- 4MiB --------------|---------
+	 *                         ↓                 ↓
+	 *                         |-- sector_start -|-- sector_end --|
+	 */
+	if (last_in_sync_end > peer_device->last_peers_in_sync_end ||
+		sector_start < tmp_peers_in_sync_end)
+		drbd_queue_update_peers(peer_device, peer_device->last_peers_in_sync_end,
+			tmp_peers_in_sync_end);
+
+	/* If has no resync range between peers_in_sync_start and
+	 * tmp_peers_in_sync_end, we need to skip it.
+	 *
+	 * And if new resync range has over 4MiB, we need to update again.
+	 *
+	 *   tmp_peers_in_sync_end      peers_in_sync_start           peers_in_sync_end
+	 *          ↓                            ↓                             ↓
+	 *  --------|---- ... 4MiB * n ... ------|--------- 4MiB --------------|---------
+	 *                                                   ↓                 ↓
+	 *                                                   |-- sector_start -|-- sector_end --|
+	 */
+	if (peers_in_sync_start > tmp_peers_in_sync_end)
+		tmp_peers_in_sync_end = peers_in_sync_start;
+	if (peers_in_sync_end - tmp_peers_in_sync_end >= PEERS_IN_SYNC_STEP_SECT) {
+		drbd_queue_update_peers(peer_device, tmp_peers_in_sync_end, peers_in_sync_end);
+		tmp_peers_in_sync_end = peers_in_sync_end;
+	}
+
+	peer_device->last_peers_in_sync_end = tmp_peers_in_sync_end;
 
 	/* Also consider scheduling a bitmap update to reduce the size of the
 	 * next resync if this one is disrupted. */
@@ -2391,7 +2443,8 @@ static void drbd_check_peers_in_sync_progress(struct drbd_peer_device *peer_devi
 	spin_unlock_irq(&connection->peer_reqs_lock);
 
 	list_for_each_entry_safe(peer_req, tmp, &completed, recv_order) {
-		drbd_peers_in_sync_progress(peer_device, peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT));
+		drbd_peers_in_sync_progress(peer_device, peer_req->i.sector,
+			peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT));
 		drbd_free_peer_req(peer_req);
 	}
 }
diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 28c89c2be..9b0dd97d4 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -2722,6 +2722,7 @@ static void initialize_resync(struct drbd_peer_device *peer_device)
 	unsigned long now = jiffies;
 
 	peer_device->last_peers_in_sync_end = 0;
+	peer_device->last_in_sync_end = 0;
 	peer_device->resync_next_bit = 0;
 	peer_device->last_resync_pass_bits = tw;
 	peer_device->rs_failed = 0;
-- 
2.43.0

