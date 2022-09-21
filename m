Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188E5BFA71
	for <lists+drbd-dev@lfdr.de>; Wed, 21 Sep 2022 11:15:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DF51D4210D5;
	Wed, 21 Sep 2022 11:15:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 486 seconds by postgrey-1.31 at mail19;
	Wed, 21 Sep 2022 11:15:30 CEST
Received: from mail-m3163.qiye.163.com (mail-m3163.qiye.163.com [103.74.31.63])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6AEAA421023
	for <drbd-dev@lists.linbit.com>; Wed, 21 Sep 2022 11:15:30 +0200 (CEST)
Received: from localhost.localdomain (unknown [49.74.64.98])
	by mail-m3163.qiye.163.com (Hmail) with ESMTPA id 31C9E840271;
	Wed, 21 Sep 2022 17:07:17 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Wed, 21 Sep 2022 17:07:10 +0800
Message-Id: <20220921090710.2238953-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRlDVkhNSkNKGksYSEJOTFUZERMWGhIXJBQOD1
	lXWRgSC1lBWU9CVUxPVU1PVUJDWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6Kyo4ATIVHS4DKgEIHBwa
	EjkKFA1VSlVKTU1ITE5KSUhDT0hJVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlP
	QlVMT1VNT1VCQ1lXWQgBWUFJSElPNwY+
X-HM-Tid: 0a835f4d2fe800a3kurm31c9e840271
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd: fix a bug of got_peer_ack
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

Consider a scenrio that io is ongoing and the backing disk of
secondary drbd suddenly broken. Some requset from primary node
will not be processed in receive_Data since there is no ldev.
And primary node will send peer_ack to secondary node for those
requsets, but the secondary node will not find these requests in
got_peer_ack.

The first problem caused by this bug is that the two nodes will be
disconnected, and the second problem is that some peer requests
can't be destroyed.

Fix it by find the last peer request on peer_requests list and then
the remaining requests on the list will be destroyed.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_receiver.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 656d4eced..b63e83f52 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -9343,6 +9343,13 @@ static int got_peer_ack(struct drbd_connection *connection, struct packet_info *
 		if (dagtag == peer_req->dagtag_sector)
 			goto found;
 	}
+
+        list_for_each_entry(peer_req, &connection->peer_requests, recv_order) {
+                if (peer_req->dagtag_sector == atomic64_read(&connection->last_dagtag_sector)) {
+                        drbd_info(connection, "peer request with last dagtag sector %llu has found\n", peer_req->dagtag_sector);
+                        goto found;
+                }
+        }
 	spin_unlock_irq(&connection->peer_reqs_lock);
 
 	drbd_err(connection, "peer request with dagtag %llu not found\n", dagtag);
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
