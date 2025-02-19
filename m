Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D967A3AFEE
	for <lists+drbd-dev@lfdr.de>; Wed, 19 Feb 2025 04:10:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D52CB16B916;
	Wed, 19 Feb 2025 04:10:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Wed, 19 Feb 2025 04:10:14 CET
Received: from mail-m49247.qiye.163.com (mail-m49247.qiye.163.com
	[45.254.49.247])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3723F16B836
	for <drbd-dev@lists.linbit.com>; Wed, 19 Feb 2025 04:10:13 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53df0533;
	Wed, 19 Feb 2025 11:05:07 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] drbd: Fix IO block after network failure
Date: Wed, 19 Feb 2025 11:05:06 +0800
Message-ID: <20250219030506.1389085-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQx8ZVk5MTBhIHkhDGkwaGFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a951c2a931c0227kunm53df0533
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRg6Iio*PDcXOQsZSCIuSSkV
	KSEwCxZVSlVKTEhCQkhPSEtDSk5OVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUhJTkg3Bg++
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

Network failure test, I/O is not finished.
The oldest_request has follow status information:

master: pending|postponed	local: in-AL|completed|ok	net[1]: queued|done : C|barr

This req also has RQ_NET_QUEUED,so its reference count
cannot be reduced to zero and req cannot complete.

The commit 8962f7c03c1
drbd: exclude requests that are not yet queued from "seen_dagtag_sector"
has modify the __next_request_for_connection() function,
which causes the sender thread to be unable to clean up all
pending req when the network failure.

The race occurred as follows, where T is a submit req thread,
and S is a sender thread:
S: process_one_request() handle r0
S: network failure. drbd_send_dblock(r0) fail, then call __req_mod(r0, SEND_FAILED...)
S: Call mod_rq_state(), r0 clear RQ_NET_QUEUED, and still has RQ_NET_PENDING
T: r1 arrive drbd_send_and_submit(), add to transfer_log, and set RQ_NET_QUEUED
S: drbd_sender() handle network failure, change_cstate(C_NETWORK_FAILURE)

When sender thread state change to stop, and want to
cleanup all currently unprocessed requests(call __req_mod(req, SEND_CANCELED...)).
but it can not find r1, because in the __next_request_for_connection() function,
r0 always satisfies the first if condition and returns NULL.
static struct drbd_request *__next_request_for_connection(...)
{
...
		if (unlikely(s & RQ_NET_PENDING && !(s & (RQ_NET_QUEUED|RQ_NET_SENT))))
			return NULL;
...
}
Finally, r1 could not be completed due to has RQ_NET_QUEUED.

So, In the cleanup process of sender,
we find all the req with RQ_NET_QUEUED and clean it.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_sender.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
index 80badc606..e6fc751c7 100644
--- a/drbd/drbd_sender.c
+++ b/drbd/drbd_sender.c
@@ -3251,6 +3251,24 @@ static struct drbd_request *tl_next_request_for_connection(struct drbd_connectio
 	return connection->todo.req;
 }
 
+static struct drbd_request *tl_next_request_for_cleanup(struct drbd_connection *connection)
+{
+	struct drbd_request *req;
+	struct drbd_request *found_req = NULL;
+
+	list_for_each_entry_rcu(req, &connection->resource->transfer_log, tl_requests) {
+		unsigned s = req->net_rq_state[connection->peer_node_id];
+
+		if (s & RQ_NET_QUEUED) {
+			found_req = req;
+			break;
+		}
+	}
+
+	connection->todo.req = found_req;
+	return connection->todo.req;
+}
+
 static void maybe_send_state_afer_ahead(struct drbd_connection *connection)
 {
 	struct drbd_peer_device *peer_device;
@@ -3644,7 +3662,7 @@ int drbd_sender(struct drbd_thread *thi)
 	/* cleanup all currently unprocessed requests */
 	if (!connection->todo.req) {
 		rcu_read_lock();
-		tl_next_request_for_connection(connection);
+		tl_next_request_for_cleanup(connection);
 		rcu_read_unlock();
 	}
 	while (connection->todo.req) {
@@ -3660,7 +3678,7 @@ int drbd_sender(struct drbd_thread *thi)
 			complete_master_bio(device, &m);
 
 		rcu_read_lock();
-		tl_next_request_for_connection(connection);
+		tl_next_request_for_cleanup(connection);
 		rcu_read_unlock();
 	}
 
-- 
2.43.0

