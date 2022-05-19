Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC935308A2
	for <lists+drbd-dev@lfdr.de>; Mon, 23 May 2022 07:24:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5ED8F420372;
	Mon, 23 May 2022 07:24:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 615 seconds by postgrey-1.31 at mail19;
	Thu, 19 May 2022 12:16:12 CEST
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A6EB4201FE
	for <drbd-dev@lists.linbit.com>; Thu, 19 May 2022 12:16:11 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id EFFE41E80D93
	for <drbd-dev@lists.linbit.com>; Thu, 19 May 2022 17:59:18 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSQJNVD0NWtr; Thu, 19 May 2022 17:59:16 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: kunyu@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 06C3C1E80D92;
	Thu, 19 May 2022 17:59:16 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: drbd-dev@lists.linbit.com
Date: Thu, 19 May 2022 18:05:09 +0800
Message-Id: <20220519100508.3143-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Mon, 23 May 2022 07:24:02 +0200
Subject: [Drbd-dev] [PATCH] drbd: The process_twopc() function does not use
	a return val and could be changed to void
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

This function could clear the unused return value
 and remove an integer temporary variable of the calling function.

Signed-off-by: Li kunyu <kunyu@nfschina.com>
---
 drbd/drbd_receiver.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 27f8de80..917c8c7e 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -255,7 +255,7 @@ static int e_end_block(struct drbd_work *, int);
 static void cleanup_unacked_peer_requests(struct drbd_connection *connection);
 static void cleanup_peer_ack_list(struct drbd_connection *connection);
 static u64 node_ids_to_bitmap(struct drbd_device *device, u64 node_ids);
-static int process_twopc(struct drbd_connection *, struct twopc_reply *, struct packet_info *, unsigned long);
+static void process_twopc(struct drbd_connection *, struct twopc_reply *, struct packet_info *, unsigned long);
 static void drbd_resync(struct drbd_peer_device *, enum resync_reason) __must_hold(local);
 static void drbd_unplug_all_devices(struct drbd_connection *connection);
 static int decode_header(struct drbd_connection *, void *, struct packet_info *);
@@ -6068,7 +6068,6 @@ static int receive_twopc(struct drbd_connection *connection, struct packet_info
 	struct drbd_resource *resource = connection->resource;
 	struct p_twopc_request *p = pi->data;
 	struct twopc_reply reply = {0};
-	int rv;
 
 	reply.vnr = pi->vnr;
 	reply.tid = be32_to_cpu(p->tid);
@@ -6093,9 +6092,9 @@ static int receive_twopc(struct drbd_connection *connection, struct packet_info
 		clear_bit(CONN_HANDSHAKE_READY, &connection->flags);
 	}
 
-	rv = process_twopc(connection, &reply, pi, jiffies);
+	process_twopc(connection, &reply, pi, jiffies);
 
-	return rv;
+	return 0;
 }
 
 static void nested_twopc_abort(struct drbd_resource *resource, int vnr, enum drbd_packet cmd,
@@ -6252,7 +6251,7 @@ enum drbd_state_rv drbd_support_2pc_resize(struct drbd_resource *resource)
 	return rv;
 }
 
-static int process_twopc(struct drbd_connection *connection,
+static void process_twopc(struct drbd_connection *connection,
 			 struct twopc_reply *reply,
 			 struct packet_info *pi,
 			 unsigned long receive_jif)
@@ -6278,11 +6277,11 @@ static int process_twopc(struct drbd_connection *connection,
 			dynamic_drbd_dbg(connection, "Ignoring %s packet %u\n",
 				   drbd_packet_name(pi->cmd),
 				   reply->tid);
-			return 0;
+			return;
 		}
 		if (reply->is_aborted) {
 			write_unlock_irq(&resource->state_rwlock);
-			return 0;
+			return;
 		}
 		resource->remote_state_change = true;
 		resource->twopc_type = pi->cmd == P_TWOPC_PREPARE ? TWOPC_STATE_CHANGE : TWOPC_RESIZE;
@@ -6297,7 +6296,7 @@ static int process_twopc(struct drbd_connection *connection,
 			drbd_info(connection, "Ignoring redundant %s packet %u.\n",
 				  drbd_packet_name(pi->cmd),
 				  reply->tid);
-			return 0;
+			return;
 		}
 	} else if (csc_rv == CSC_ABORT_LOCAL && is_prepare(pi->cmd)) {
 		enum alt_rv alt_rv;
@@ -6317,12 +6316,12 @@ static int process_twopc(struct drbd_connection *connection,
 				  resource->twopc_reply.tid,
 				  reply->tid);
 			drbd_send_twopc_reply(connection, P_TWOPC_RETRY, reply);
-			return 0;
+			return;
 		}
 		/* abort_local_transaction() returned with the state_rwlock write lock */
 		if (reply->is_aborted) {
 			write_unlock_irq(&resource->state_rwlock);
-			return 0;
+			return;
 		}
 		resource->remote_state_change = true;
 		resource->twopc_type = pi->cmd == P_TWOPC_PREPARE ? TWOPC_STATE_CHANGE : TWOPC_RESIZE;
@@ -6333,7 +6332,7 @@ static int process_twopc(struct drbd_connection *connection,
 		/* crc_rc != CRC_MATCH */
 		write_unlock_irq(&resource->state_rwlock);
 		nested_twopc_abort(resource, pi->vnr, pi->cmd, p);
-		return 0;
+		return;
 	} else {
 		write_unlock_irq(&resource->state_rwlock);
 
@@ -6345,7 +6344,7 @@ static int process_twopc(struct drbd_connection *connection,
 				  reply->tid,
 				  resource->twopc_reply.tid);
 			drbd_send_twopc_reply(connection, P_TWOPC_RETRY, reply);
-			return 0;
+			return;
 		}
 
 		if (is_prepare(pi->cmd)) {
@@ -6390,7 +6389,7 @@ static int process_twopc(struct drbd_connection *connection,
 				  reply->tid,
 				  resource->twopc_reply.tid);
 		}
-		return 0;
+		return;
 	}
 
 	if (reply->initiator_node_id != connection->peer_node_id) {
@@ -6564,8 +6563,6 @@ static int process_twopc(struct drbd_connection *connection,
 		    mask.conn == conn_MASK && val.conn == C_CONNECTED)
 			conn_connect2(connection);
 	}
-
-	return 0;
 }
 
 void drbd_try_to_get_resynced(struct drbd_device *device)
-- 
2.18.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
