Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FACCBEA2
	for <lists+drbd-dev@lfdr.de>; Thu, 18 Dec 2025 14:06:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C661C163177;
	Thu, 18 Dec 2025 14:06:29 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Thu, 18 Dec 2025 14:06:25 CET
Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com
	[101.71.155.78])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9017F162251
	for <drbd-dev@lists.linbit.com>; Thu, 18 Dec 2025 14:06:24 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 148734022;
	Thu, 18 Dec 2025 21:01:18 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH v2] drbd: only send P_PEERS_IN_SYNC for up to 4 MiB in resync
	progress
Date: Thu, 18 Dec 2025 21:01:17 +0800
Message-ID: <20251218130117.907395-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b318ceeee0227kunmc5e1169fa16aab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTxpPVk8aS0kZTkkdS0sYS1YVFAkWGhdVGRETFh
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

The solution is to ensure that P_PEERS_IN_SYNC within a range of 4 MiB is sent each time,
and skip the sector where there is no reysnc.

Fixes: bc218ad64640 ("drbd: only send P_PEERS_IN_SYNC every 4MiB")

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_int.h      |  3 ++-
 drbd/drbd_receiver.c | 21 +++++++++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drbd/drbd_int.h b/drbd/drbd_int.h
index d92eaaf37..e193de9e8 100644
--- a/drbd/drbd_int.h
+++ b/drbd/drbd_int.h
@@ -1930,7 +1930,8 @@ extern sector_t drbd_partition_data_capacity(struct drbd_device *device);
  * extent shift since the P_PEERS_IN_SYNC intervals are broken up based on
  * activity log extents anyway. */
 #define PEERS_IN_SYNC_STEP_SHIFT AL_EXTENT_SHIFT
-#define PEERS_IN_SYNC_STEP_SECT_MASK ((1UL << (PEERS_IN_SYNC_STEP_SHIFT - SECTOR_SHIFT)) - 1)
+#define PEERS_IN_SYNC_STEP_SECT      (1UL << (PEERS_IN_SYNC_STEP_SHIFT - SECTOR_SHIFT))
+#define PEERS_IN_SYNC_STEP_SECT_MASK (PEERS_IN_SYNC_STEP_SECT - 1)
 
 /* bit to represented kilo byte conversion */
 #define Bit2KB(bits) ((bits)<<(BM_BLOCK_SHIFT-10))
diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index d43f3f98b..2bbf167a8 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -2540,8 +2540,10 @@ void drbd_queue_update_peers(struct drbd_peer_device *peer_device,
 	}
 }
 
-static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, sector_t sector_end)
+static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, sector_t sector_start, sector_t sector_end)
 {
+	sector_t range_end;
+	sector_t peers_in_sync_start = sector_start & ~PEERS_IN_SYNC_STEP_SECT_MASK;
 	/* Round down to the boundary defined by PEERS_IN_SYNC_STEP_SHIFT. */
 	sector_t peers_in_sync_end = sector_end & ~PEERS_IN_SYNC_STEP_SECT_MASK;
 
@@ -2555,8 +2557,19 @@ static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, se
 	if (peers_in_sync_end == peer_device->last_peers_in_sync_end)
 		return;
 
-	drbd_queue_update_peers(peer_device, peer_device->last_peers_in_sync_end, peers_in_sync_end);
-	peer_device->last_peers_in_sync_end = peers_in_sync_end;
+	for (; peers_in_sync_end - peer_device->last_peers_in_sync_end >= PEERS_IN_SYNC_STEP_SECT; ) {
+		/* Ensure send range does not over 4 MiB */
+		range_end = min(get_capacity(peer_device->device->vdisk),
+			(peer_device->last_peers_in_sync_end | PEERS_IN_SYNC_STEP_SECT_MASK) + 1);
+
+		drbd_queue_update_peers(peer_device, peer_device->last_peers_in_sync_end, range_end);
+
+		if (peers_in_sync_start <= range_end)
+			peer_device->last_peers_in_sync_end = range_end;
+		else
+			/* Skip the no resync range */
+			peer_device->last_peers_in_sync_end = peers_in_sync_start;
+	}
 
 	/* Also consider scheduling a bitmap update to reduce the size of the
 	 * next resync if this one is disrupted. */
@@ -2580,7 +2593,7 @@ static void drbd_check_peers_in_sync_progress(struct drbd_peer_device *peer_devi
 	spin_unlock_irq(&connection->peer_reqs_lock);
 
 	list_for_each_entry_safe(peer_req, tmp, &completed, recv_order) {
-		drbd_peers_in_sync_progress(peer_device, peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT));
+		drbd_peers_in_sync_progress(peer_device, peer_req->i.sector, peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT));
 		drbd_free_peer_req(peer_req);
 	}
 }
-- 
2.43.0

