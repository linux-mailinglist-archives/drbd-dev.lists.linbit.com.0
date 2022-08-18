Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E82598246
	for <lists+drbd-dev@lfdr.de>; Thu, 18 Aug 2022 13:33:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C2A06420951;
	Thu, 18 Aug 2022 13:33:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 411 seconds by postgrey-1.31 at mail19;
	Thu, 18 Aug 2022 13:33:24 CEST
Received: from mail-m24162.qiye.163.com (mail-m24162.qiye.163.com
	[220.194.24.162])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E07B8420620
	for <drbd-dev@lists.linbit.com>; Thu, 18 Aug 2022 13:33:24 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m24162.qiye.163.com (Hmail) with ESMTPA id 5323F4C0308;
	Thu, 18 Aug 2022 19:25:18 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Thu, 18 Aug 2022 19:25:12 +0800
Message-Id: <20220818112512.3557838-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0pLVh8eGBhPSUNDHhlMS1UZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxQ6Dww6PTITLAlJLksDL04e
	LyIwFApVSlVKTU1LQ0lKQkpCT09CVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUpOTEhDNwY+
X-HM-Tid: 0a82b0b354828d2ckuqt5323f4c0308
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH v2] drbd: retry the IO when connection lost
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

Commit 33600a4632f2 has introduced some problems, for example,
the problem mentioned in commit 300bfb7ba.

My test also meet a problem introduced by commit 33600a4632f2.
I have three nodes running with drbd9.1(node-1, node-2 and node-3),
node-1 is primary and other nodes are secondary. Both quorum and
quorum-minimum-redundancy are set to 2.

Cut down the connection between node-1 and node-3 first, then cut
down the connection between node-1 and node-2. When the connection
between node-1 and node-3 comes back, the node-3 whose disk status
isn't UPTODATE prevents the quorum-minimum-redundancy coming back,
the resync process--send bitmap , in turn, is blocked by the
suspended IO. Here is a dead lock.

We can solve those problems by close the blocked IO with POSTPONE,
so the IO will neither return back to upper caller nor block the
resync process. As soon as the resync with peers completes, the quorum
will come back and the IO will be retried.

And it's simpler than the current mechanism.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_main.c     | 59 ++++++++++++++++++-------------
 drbd/drbd_receiver.c | 19 +++-------
 drbd/drbd_req.c      | 82 ++++++--------------------------------------
 drbd/drbd_req.h      |  4 ---
 drbd/drbd_state.c    | 48 --------------------------
 5 files changed, 50 insertions(+), 162 deletions(-)

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 24baa860..dbee64d4 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -2926,43 +2926,32 @@ void drbd_req_destroy_lock(struct kref *kref)
 	read_unlock_irq(&resource->state_rwlock);
 }
 
+struct drbd_request_dummy {
+	struct list_head retry_list;
+	struct bio *master_bio;
+	struct drbd_device *device;
+	unsigned long start_jif;
+	ktime_t start_kt;
+};
+
 static void do_retry(struct work_struct *ws)
 {
 	struct retry_worker *retry = container_of(ws, struct retry_worker, worker);
 	LIST_HEAD(writes);
-	struct drbd_request *req, *tmp;
+	struct drbd_request_dummy *req, *tmp;
 
 	spin_lock_irq(&retry->lock);
 	list_splice_init(&retry->writes, &writes);
 	spin_unlock_irq(&retry->lock);
 
-	list_for_each_entry_safe(req, tmp, &writes, list) {
+	list_for_each_entry_safe(req, tmp, &writes, retry_list) {
 		struct drbd_device *device = req->device;
 		struct bio *bio = req->master_bio;
 		unsigned long start_jif = req->start_jif;
-		bool expected;
 		ktime_get_accounting_assign(ktime_t start_kt, req->start_kt);
 
-
-		/* No locking when accessing local_rq_state & net_rq_state, since
-		 * this request is not active at the moment. */
-		expected =
-			expect(device, atomic_read(&req->completion_ref) == 0) &&
-			expect(device, req->local_rq_state & RQ_POSTPONED) &&
-			expect(device, (req->local_rq_state & RQ_LOCAL_PENDING) == 0 ||
-			       (req->local_rq_state & RQ_LOCAL_ABORTED) != 0);
-
-		if (!expected)
-			drbd_err(device, "req=%p completion_ref=%d rq_state=%x\n",
-				req, atomic_read(&req->completion_ref),
-				req->local_rq_state);
-
-		/* We still need to put one kref associated with the
-		 * "completion_ref" going zero in the code path that queued it
-		 * here.  The request object may still be referenced by a
-		 * frozen local req->private_bio, in case we force-detached.
-		 */
-		kref_put(&req->kref, drbd_req_destroy_lock);
+		list_del_init(&req->retry_list);
+		kfree(req);
 
 		/* A single suspended or otherwise blocking device may stall
 		 * all others as well. This code path is to recover from a
@@ -2979,12 +2968,34 @@ static void do_retry(struct work_struct *ws)
 	}
 }
 
+void drbd_dummy_request_prepare(struct drbd_request *req,
+										struct drbd_request_dummy *dummy)
+{
+	INIT_LIST_HEAD(&dummy->retry_list);
+	dummy->device = req->device;
+	dummy->master_bio = req->master_bio;
+	dummy->start_jif = req->start_jif;
+	ktime_get_accounting_assign(dummy->start_kt, req->start_kt);
+}
+
 /* called via drbd_req_put_completion_ref() */
 void drbd_restart_request(struct drbd_request *req)
 {
 	unsigned long flags;
+	struct drbd_request_dummy *req_dummy;
+	int alloc_times = 0;
+
+retry_alloc:
+	req_dummy = kzalloc(sizeof(struct drbd_request_dummy), GFP_ATOMIC);
+	if (!req_dummy) {
+		alloc_times++;
+		BUG_ON(alloc_times >= 100);
+		goto retry_alloc;
+	}
+	drbd_dummy_request_prepare(req, req_dummy);
+
 	spin_lock_irqsave(&retry.lock, flags);
-	list_move_tail(&req->list, &retry.writes);
+	list_move_tail(&req_dummy->retry_list, &retry.writes);
 	spin_unlock_irqrestore(&retry.lock, flags);
 
 	/* Drop the extra reference that would otherwise
diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index f077f2b1..716fa555 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -3852,13 +3852,6 @@ static enum sync_strategy drbd_uuid_compare(struct drbd_peer_device *peer_device
 			return SYNC_TARGET_USE_BITMAP;
 		}
 
-		if (connection->agreed_pro_version >= 120) {
-			*rule = RULE_RECONNECTED;
-			if (peer_device->uuid_flags & UUID_FLAG_RECONNECT &&
-			    local_uuid_flags & UUID_FLAG_RECONNECT)
-				return NO_SYNC;
-		}
-
 		if (connection->agreed_pro_version >= 121 &&
 		    (wire_protocol == DRBD_PROT_A || wire_protocol == DRBD_PROT_B)) {
 			*rule = RULE_CRASHED_PRIMARY;
@@ -3886,12 +3879,11 @@ static enum sync_strategy drbd_uuid_compare(struct drbd_peer_device *peer_device
 				SYNC_SOURCE_IF_BOTH_FAILED :
 				SYNC_TARGET_IF_BOTH_FAILED;
 
-		if (connection->agreed_pro_version < 120) {
-			*rule = RULE_RECONNECTED;
-			if (peer_device->uuid_flags & UUID_FLAG_RECONNECT &&
-			    local_uuid_flags & UUID_FLAG_RECONNECT)
+		*rule = RULE_RECONNECTED;
+		/* This is a safety net for the following two clauses */
+		if (peer_device->uuid_flags & UUID_FLAG_RECONNECT &&
+			local_uuid_flags & UUID_FLAG_RECONNECT)
 				return NO_SYNC;
-		}
 
 		/* Peer crashed as primary, I survived, resync from me */
 		if (peer_device->uuid_flags & UUID_FLAG_CRASHED_PRIMARY &&
@@ -7897,8 +7889,7 @@ static void conn_disconnect(struct drbd_connection *connection)
 	/* Apply these changes after peer_device_disconnected() because that
 	 * may cause the loss of other connections to be detected, which can
 	 * change the suspended state. */
-	tl_walk(connection, &connection->req_not_net_done,
-			resource->cached_susp ? CONNECTION_LOST_WHILE_SUSPENDED : CONNECTION_LOST);
+	tl_walk(connection, NULL, CONNECTION_LOST);
 
 	i = drbd_free_peer_reqs(connection, &connection->read_ee, true);
 	if (i)
diff --git a/drbd/drbd_req.c b/drbd/drbd_req.c
index 4537584c..15a2d449 100644
--- a/drbd/drbd_req.c
+++ b/drbd/drbd_req.c
@@ -582,12 +582,8 @@ static void drbd_req_put_completion_ref(struct drbd_request *req, struct bio_and
 	if (req->local_rq_state & RQ_LOCAL_ABORTED)
 		return;
 
-	if (req->local_rq_state & RQ_POSTPONED) {
-		/* don't destroy the req object just yet,
-		 * but queue it for retry */
+	if (req->local_rq_state & RQ_POSTPONED)
 		drbd_restart_request(req);
-		return;
-	}
 
 	kref_put(&req->kref, drbd_req_destroy);
 }
@@ -1049,29 +1045,16 @@ void __req_mod(struct drbd_request *req, enum drbd_req_event what,
 		break;
 
 	case CONNECTION_LOST:
-	case CONNECTION_LOST_WHILE_SUSPENDED:
-		/* Only apply to requests that were for this peer but not done. */
-		if (!(req->net_rq_state[idx] & RQ_NET_MASK) || req->net_rq_state[idx] & RQ_NET_DONE)
-			break;
-
-		/* For protocol A, or when not suspended, we consider the
-		 * request to be lost towards this peer.
-		 *
-		 * Protocol B&C requests are kept while suspended because
-		 * resending is allowed. If such a request is pending to this
-		 * peer, we suspend its completion until IO is resumed. This is
-		 * a conservative simplification. We could complete it while
-		 * suspended once we know it has been received by "enough"
-		 * peers. However, we do not track that.
-		 *
-		 * If the request is no longer pending to this peer, then we
-		 * have already received the corresponding ack. The request may
-		 * complete as far as this peer is concerned. */
-		if (what == CONNECTION_LOST ||
-				!(req->net_rq_state[idx] & (RQ_EXP_RECEIVE_ACK|RQ_EXP_WRITE_ACK)))
+		if (!(req->net_rq_state[idx] & (RQ_EXP_RECEIVE_ACK|RQ_EXP_WRITE_ACK)) ||
+		    req->net_rq_state[idx] & RQ_NET_OK) {
 			mod_rq_state(req, m, peer_device, RQ_NET_PENDING|RQ_NET_OK, RQ_NET_DONE);
-		else if (req->net_rq_state[idx] & RQ_NET_PENDING)
-			mod_rq_state(req, m, peer_device, 0, RQ_COMPLETION_SUSP);
+		} else {
+			if (!(req->local_rq_state & RQ_POSTPONED))
+					req->local_rq_state |= RQ_POSTPONED;
+			mod_rq_state(req, m, peer_device,
+							RQ_NET_OK|RQ_NET_PENDING|RQ_COMPLETION_SUSP,
+							RQ_NET_DONE);
+		}
 		break;
 
 	case WRITE_ACKED_BY_PEER_AND_SIS:
@@ -1101,52 +1084,7 @@ void __req_mod(struct drbd_request *req, enum drbd_req_event what,
 			     (req->local_rq_state & RQ_WRITE) ? 0 : RQ_NET_DONE);
 		break;
 
-	case COMPLETION_RESUMED:
-		mod_rq_state(req, m, peer_device, RQ_COMPLETION_SUSP, 0);
-		break;
-
-	case CANCEL_SUSPENDED_IO:
-		/* Only apply to requests that were for this peer but not done. */
-		if (!(req->net_rq_state[idx] & RQ_NET_MASK) || req->net_rq_state[idx] & RQ_NET_DONE)
-			break;
-
-		/* CONNECTION_LOST_WHILE_SUSPENDED followed by
-		 * CANCEL_SUSPENDED_IO should be essentially the same as
-		 * CONNECTION_LOST. Make the corresponding changes. The
-		 * RQ_COMPLETION_SUSP flag is handled by COMPLETION_RESUMED. */
-		mod_rq_state(req, m, peer_device, RQ_NET_PENDING|RQ_NET_OK, RQ_NET_DONE);
-		break;
-
-	case RESEND:
-		/* If RQ_NET_OK is already set, we got a P_WRITE_ACK or P_RECV_ACK
-		   before the connection loss (B&C only); only P_BARRIER_ACK
-		   (or the local completion?) was missing when we suspended.
-		   Throwing them out of the TL here by pretending we got a BARRIER_ACK.
-		   During connection handshake, we ensure that the peer was not rebooted.
-
-		   Protocol A requests always have RQ_NET_OK removed when the
-		   connection is lost, so this will never apply to them.
-
-		   Resending is only allowed on synchronous connections,
-		   where all requests not yet completed to upper layers would
-		   be in the same "reorder-domain", there can not possibly be
-		   any dependency between incomplete requests, and we are
-		   allowed to complete this one "out-of-sequence".
-		 */
-		if (req->net_rq_state[idx] & RQ_NET_OK)
-			goto barrier_acked;
-
-		/* Only apply to requests that are pending a response from
-		 * this peer. */
-		if (!(req->net_rq_state[idx] & RQ_NET_PENDING))
-			break;
-
-		D_ASSERT(device, !(req->net_rq_state[idx] & RQ_NET_QUEUED));
-		mod_rq_state(req, m, peer_device, RQ_NET_SENT, RQ_NET_QUEUED);
-		break;
-
 	case BARRIER_ACKED:
-barrier_acked:
 		/* barrier ack for READ requests does not make sense */
 		if (!(req->local_rq_state & RQ_WRITE))
 			break;
diff --git a/drbd/drbd_req.h b/drbd/drbd_req.h
index 3cc364a2..e7776332 100644
--- a/drbd/drbd_req.h
+++ b/drbd/drbd_req.h
@@ -86,7 +86,6 @@ enum drbd_req_event {
 	HANDED_OVER_TO_NETWORK,
 	OOS_HANDED_TO_NETWORK,
 	CONNECTION_LOST,
-	CONNECTION_LOST_WHILE_SUSPENDED,
 	RECV_ACKED_BY_PEER,
 	WRITE_ACKED_BY_PEER,
 	WRITE_ACKED_BY_PEER_AND_SIS, /* and set_in_sync */
@@ -102,9 +101,6 @@ enum drbd_req_event {
 	DISCARD_COMPLETED_WITH_ERROR,
 
 	ABORT_DISK_IO,
-	RESEND,
-	CANCEL_SUSPENDED_IO,
-	COMPLETION_RESUMED,
 	NOTHING,
 };
 
diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 896c0354..17a8b857 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -2316,18 +2316,6 @@ static bool extra_ldev_ref_for_after_state_chg(enum drbd_disk_state *disk_state)
 	       (disk_state[OLD] != D_DISKLESS && disk_state[NEW] == D_DISKLESS);
 }
 
-static bool has_starting_resyncs(struct drbd_connection *connection)
-{
-	struct drbd_peer_device *peer_device;
-	int vnr;
-
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		if (peer_device->repl_state[NEW] > L_ESTABLISHED)
-			return true;
-	}
-	return false;
-}
-
 /**
  * finish_state_change  -  carry out actions triggered by a state change
  */
@@ -2342,7 +2330,6 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 	bool some_peer_is_primary = false;
 	bool some_peer_request_in_flight = false;
 	bool resource_suspended[2];
-	bool unfreeze_io = false;
 	int vnr;
 
 	print_state_change(resource, "");
@@ -2672,12 +2659,6 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 		if (!device->have_quorum[OLD] && device->have_quorum[NEW])
 			clear_bit(PRIMARY_LOST_QUORUM, &device->flags);
 
-		if (resource_suspended[NEW] &&
-		    !(role[OLD] == R_PRIMARY && !drbd_data_accessible(device, OLD)) &&
-		     (role[NEW] == R_PRIMARY && !drbd_data_accessible(device, NEW)) &&
-		    resource->res_opts.on_no_data == OND_IO_ERROR)
-			unfreeze_io = true;
-
 		if (role[OLD] == R_PRIMARY && role[NEW] == R_SECONDARY)
 			clear_bit(NEW_CUR_UUID, &device->flags);
 	}
@@ -2708,32 +2689,6 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 		if (cstate[OLD] < C_CONNECTED && cstate[NEW] == C_CONNECTED)
 			connection->last_reconnect_jif = jiffies;
 
-		if (resource_suspended[OLD]) {
-			enum drbd_req_event walk_event = -1;
-
-			/* If we resume IO without this connection, then we
-			 * need to cancel suspended requests. */
-			if ((!resource_suspended[NEW] || unfreeze_io) && cstate[NEW] < C_CONNECTED)
-				walk_event = CANCEL_SUSPENDED_IO;
-			/* On reconnection when we have been suspended we need
-			 * to process suspended requests. If there are resyncs,
-			 * that means that it was not a simple disconnect and
-			 * reconnect, so we cannot resend. We must cancel
-			 * instead. */
-			else if (cstate[OLD] < C_CONNECTED && cstate[NEW] == C_CONNECTED)
-				walk_event = has_starting_resyncs(connection) ? CANCEL_SUSPENDED_IO : RESEND;
-
-			if (walk_event != -1)
-				__tl_walk(resource, connection, &connection->req_not_net_done, walk_event);
-
-			/* Since we are in finish_state_change(), and the state
-			 * was previously not C_CONNECTED, the sender cannot
-			 * have received any requests yet. So it will find any
-			 * requests to resend when it rescans the transfer log. */
-			if (walk_event == RESEND)
-				wake_up(&connection->sender_work.q_wait);
-		}
-
 		if (cstate[OLD] == C_CONNECTED && cstate[NEW] < C_CONNECTED)
 			set_bit(RECONNECT, &connection->flags);
 
@@ -2765,9 +2720,6 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 		}
 	}
 
-	if ((resource_suspended[OLD] && !resource_suspended[NEW]) || unfreeze_io)
-		__tl_walk(resource, NULL, NULL, COMPLETION_RESUMED);
-
 	queue_after_state_change_work(resource, done);
 }
 
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
