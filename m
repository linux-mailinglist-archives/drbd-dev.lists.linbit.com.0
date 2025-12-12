Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EA3CB85A1
	for <lists+drbd-dev@lfdr.de>; Fri, 12 Dec 2025 10:00:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3D56A163120;
	Fri, 12 Dec 2025 10:00:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Fri, 12 Dec 2025 10:00:30 CET
Received: from mail-m4920.qiye.163.com (mail-m4920.qiye.163.com [45.254.49.20])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18EBA1627BB
	for <drbd-dev@lists.linbit.com>; Fri, 12 Dec 2025 10:00:29 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1443cd877;
	Fri, 12 Dec 2025 16:55:22 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] drbd: only send P_PEERS_IN_SYNC for up to 4 MiB in resync
	progress
Date: Fri, 12 Dec 2025 16:55:20 +0800
Message-ID: <20251212085520.2910741-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b11c59a33022ekunmfa884bc615563d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTkkaVk4ZQk1DT00ZGkJIGlYVFAkWGhdVGRETFh
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

The solution is to ensure that P_PEERS_IN_SYNC within a range of 4 MiB is sent each time.

Fixes: bc218ad64640 ("drbd: only send P_PEERS_IN_SYNC every 4MiB")

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_receiver.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 3eed5d33e..08032dd73 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -2352,6 +2352,7 @@ void drbd_queue_update_peers(struct drbd_peer_device *peer_device,
 
 static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, sector_t sector_end)
 {
+	sector_t boundary_end, send_end;
 	/* Round down to the boundary defined by PEERS_IN_SYNC_STEP_SHIFT. */
 	sector_t peers_in_sync_end = sector_end & ~PEERS_IN_SYNC_STEP_SECT_MASK;
 
@@ -2365,7 +2366,14 @@ static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device, se
 	if (peers_in_sync_end == peer_device->last_peers_in_sync_end)
 		return;
 
-	drbd_queue_update_peers(peer_device, peer_device->last_peers_in_sync_end, peers_in_sync_end);
+	/* Ensure send range does not over 4 MiB */
+	send_end = peers_in_sync_end;
+	boundary_end = min(get_capacity(peer_device->device->vdisk),
+			(peer_device->last_peers_in_sync_end | PEERS_IN_SYNC_STEP_SECT_MASK) + 1);
+	if (peers_in_sync_end > boundary_end)
+		send_end = boundary_end;
+
+	drbd_queue_update_peers(peer_device, peer_device->last_peers_in_sync_end, send_end);
 	peer_device->last_peers_in_sync_end = peers_in_sync_end;
 
 	/* Also consider scheduling a bitmap update to reduce the size of the
-- 
2.43.0

