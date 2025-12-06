Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CCBCAA2AA
	for <lists+drbd-dev@lfdr.de>; Sat, 06 Dec 2025 09:18:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0343C1630E7;
	Sat,  6 Dec 2025 09:17:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Sat, 06 Dec 2025 09:17:37 CET
Received: from mail-m1078.netease.com (mail-m1078.netease.com [154.81.10.78])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EEF2162ED2
	for <drbd-dev@lists.linbit.com>;
	Sat,  6 Dec 2025 09:17:36 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13fe2f039;
	Sat, 6 Dec 2025 16:12:31 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 4/4] rdma: Limit tx_descs_posted to prevent ib_post_send()
	failure
Date: Sat,  6 Dec 2025 16:12:27 +0800
Message-ID: <20251206081227.1237575-4-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
References: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2b83bc40227kunmdf22d26a1288048
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEpMVkpJTUNMGE8dHk9MGFYVFAkWGhdVGRETFh
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

RDMA transmit path may encounter ib_post_send() failures with -ENOMEM
if the number of posted tx_descs exceeds tx_descs_max. This can happen
when multiple tx_descs are submitted concurrently without proper tracking
of how many are currently outstanding.

Error log:
  kernel: infiniband mlx5_1: mlx5_ib_post_send:1101:(pid 43146):
  kernel: drbd drbd1 rdma: ib_post_send() failed -12

To avoid this, we introduce a helper function:
  atomic_inc_unless_above_limit()

This function ensures that the tx_descs_posted counter is incremented
only if it is still below tx_descs_max. It is now used in all relevant
paths:
- flow control messages
- tx_desc resend paths (repost)
- normal data/control tx_desc sending

On post failure, the patch ensures tx_descs_posted and peer_rx_descs
are properly rolled back to maintain consistency.

This prevents over-posting and ensures tx_desc submission always
respects the max post queue depth supported by the HCA.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 109 ++++++++++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 32 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index ce7be2549..0df4fdc3f 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -95,7 +95,7 @@ int allocation_size;
 struct dtr_flow_control {
 	uint32_t magic;
 	uint32_t new_rx_descs[2];
-	uint32_t rx_desc_stolen_from_stream;
+	uint32_t send_from_stream;
 } __packed;
 
 /* These numbers are sent within the immediate data value to identify
@@ -538,6 +538,21 @@ static void dtr_control_timer_fn(struct timer_list *t)
 	drbd_control_event(transport, TIMEOUT);
 }
 
+static bool atomic_inc_if_bwlow(atomic_t *v, int limit)
+{
+	int old, new;
+
+	do {
+		old = atomic_read(v);
+		if (old >= limit)
+			return false;
+
+		new = old + 1;
+	} while (atomic_cmpxchg(v, old, new) != old);
+
+	return true;
+}
+
 static int dtr_send(struct dtr_path *path, void *buf, size_t size, gfp_t gfp_mask)
 {
 	struct ib_device *device;
@@ -1454,8 +1469,9 @@ static bool dtr_receive_rx_desc(struct dtr_transport *rdma_transport,
 static int dtr_send_flow_control_msg(struct dtr_path *path, gfp_t gfp_mask)
 {
 	struct dtr_flow_control msg;
+	struct dtr_flow *flow;
 	enum drbd_stream i;
-	int err, n[2], rx_desc_stolen_from = -1, rx_descs = 0;
+	int err, n[2], send_from_stream = -1, rx_descs = 0;
 
 	msg.magic = cpu_to_be32(DTR_MAGIC);
 
@@ -1466,19 +1482,21 @@ static int dtr_send_flow_control_msg(struct dtr_path *path, gfp_t gfp_mask)
 	   from rx_descs_known_to_peer has to be atomic!
 	 */
 	for (i = DATA_STREAM; i <= CONTROL_STREAM; i++) {
-		struct dtr_flow *flow = &path->flow[i];
+		flow = &path->flow[i];
 
 		n[i] = dtr_new_rx_descs(flow);
 		atomic_add(n[i], &flow->rx_descs_known_to_peer);
 		rx_descs += n[i];
 
 		msg.new_rx_descs[i] = cpu_to_be32(n[i]);
-		if (rx_desc_stolen_from == -1 && atomic_dec_if_positive(&flow->peer_rx_descs) >= 0)
-			rx_desc_stolen_from = i;
+		if (send_from_stream == -1 &&
+			atomic_read(&flow->tx_descs_posted) < flow->tx_descs_max &&
+			atomic_dec_if_positive(&flow->peer_rx_descs) >= 0)
+			send_from_stream = i;
 	}
 	spin_unlock_bh(&path->send_flow_control_lock);
 
-	if (rx_desc_stolen_from == -1) {
+	if (send_from_stream == -1) {
 		struct drbd_transport *transport = path->path.transport;
 		struct dtr_transport *rdma_transport =
 			container_of(transport, struct dtr_transport, transport);
@@ -1489,18 +1507,20 @@ static int dtr_send_flow_control_msg(struct dtr_path *path, gfp_t gfp_mask)
 		goto out_undo;
 	}
 
-	if (rx_descs == 0) {
-		atomic_inc(&path->flow[rx_desc_stolen_from].peer_rx_descs);
+	flow = &path->flow[send_from_stream];
+	if (rx_descs == 0 || !atomic_inc_if_bwlow(&flow->tx_descs_posted, flow->tx_descs_max)) {
+		atomic_inc(&flow->peer_rx_descs);
 		return 0;
 	}
 
-	msg.rx_desc_stolen_from_stream = cpu_to_be32(rx_desc_stolen_from);
+	msg.send_from_stream = cpu_to_be32(send_from_stream);
 	err = dtr_send(path, &msg, sizeof(msg), gfp_mask);
 	if (err) {
-		atomic_inc(&path->flow[rx_desc_stolen_from].peer_rx_descs);
-	out_undo:
+		atomic_inc(&flow->peer_rx_descs);
+		atomic_dec(&flow->tx_descs_posted);
+out_undo:
 		for (i = DATA_STREAM; i <= CONTROL_STREAM; i++) {
-			struct dtr_flow *flow = &path->flow[i];
+			flow = &path->flow[i];
 			atomic_sub(n[i], &flow->rx_descs_known_to_peer);
 		}
 	}
@@ -1540,7 +1560,7 @@ static int dtr_got_flow_control_msg(struct dtr_path *path,
 			clear_bit(NET_CONGESTED, &rdma_transport->transport.flags);
 	}
 
-	return be32_to_cpu(msg->rx_desc_stolen_from_stream);
+	return be32_to_cpu(msg->send_from_stream);
 }
 
 static void dtr_flow_control_tasklet_fn(struct tasklet_struct *t)
@@ -1550,12 +1570,12 @@ static void dtr_flow_control_tasklet_fn(struct tasklet_struct *t)
 	dtr_send_flow_control_msg(path, GFP_ATOMIC);
 }
 
-static void dtr_maybe_trigger_flow_control_msg(struct dtr_path *path, int rx_desc_stolen_from)
+static void dtr_maybe_trigger_flow_control_msg(struct dtr_path *path, int send_from_stream)
 {
 	struct dtr_flow *flow;
 	int n;
 
-	flow = &path->flow[rx_desc_stolen_from];
+	flow = &path->flow[send_from_stream];
 	n = atomic_dec_return(&flow->rx_descs_known_to_peer);
 	/* If we get a lot of flow control messages in, but no data on this
 	 * path, we need to tell the peer that we recycled all these buffers
@@ -1802,15 +1822,15 @@ static int dtr_handle_rx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 	rx_desc->size = wc.byte_len;
 	immediate.i = be32_to_cpu(wc.ex.imm_data);
 	if (immediate.stream == ST_FLOW_CTRL) {
-		int rx_desc_stolen_from;
+		int send_from_stream;
 
 		ib_dma_sync_single_for_cpu(cm->id->device, rx_desc->sge.addr,
 					   rdma_transport->rx_allocation_size, DMA_FROM_DEVICE);
-		rx_desc_stolen_from = dtr_got_flow_control_msg(path, page_address(rx_desc->page));
+		send_from_stream = dtr_got_flow_control_msg(path, page_address(rx_desc->page));
 		err = dtr_repost_rx_desc(cm, rx_desc);
 		if (err)
 			tr_err(&rdma_transport->transport, "dtr_repost_rx_desc() failed %d", err);
-		dtr_maybe_trigger_flow_control_msg(path, rx_desc_stolen_from);
+		dtr_maybe_trigger_flow_control_msg(path, send_from_stream);
 	} else {
 		struct dtr_flow *flow = &path->flow[immediate.stream];
 		struct dtr_stream *rdma_stream = &rdma_transport->stream[immediate.stream];
@@ -1905,6 +1925,8 @@ static int dtr_handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 	struct dtr_path *path = cm->path;
 	struct dtr_transport *rdma_transport =
 		container_of(path->path.transport, struct dtr_transport, transport);
+	struct dtr_flow *flow;
+	struct dtr_stream *rdma_stream;
 	struct dtr_tx_desc *tx_desc;
 	struct ib_wc wc;
 	enum dtr_stream_nr stream_nr;
@@ -1916,12 +1938,20 @@ static int dtr_handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 
 	tx_desc = (struct dtr_tx_desc *) (unsigned long) wc.wr_id;
 	stream_nr = tx_desc->imm.stream;
+	if (stream_nr != ST_FLOW_CTRL) {
+		flow = &path->flow[stream_nr];
+		rdma_stream = &rdma_transport->stream[stream_nr];
+	} else {
+		struct dtr_flow_control *msg = (struct dtr_flow_control *)tx_desc->data;
+		enum dtr_stream_nr send_from_stream = be32_to_cpu(msg->send_from_stream);
+		flow = &path->flow[send_from_stream];
+		rdma_stream = &rdma_transport->stream[send_from_stream];
+	}
 
 	if (wc.status != IB_WC_SUCCESS || wc.opcode != IB_WC_SEND) {
 		struct drbd_transport *transport = &rdma_transport->transport;
 
 		if (wc.status == IB_WC_RNR_RETRY_EXC_ERR) {
-			struct dtr_flow *flow = &path->flow[stream_nr];
 			tr_err(transport, "tx_event: wc.status = IB_WC_RNR_RETRY_EXC_ERR\n");
 			tr_info(transport, "peer_rx_descs = %d", atomic_read(&flow->peer_rx_descs));
 		} else if (wc.status != IB_WC_WR_FLUSH_ERR) {
@@ -1930,6 +1960,7 @@ static int dtr_handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 			       wc.vendor_err, wc.byte_len, wc.ex.imm_data);
 		}
 
+		atomic_inc(&flow->peer_rx_descs);
 		set_bit(DSB_ERROR, &cm->state);
 
 		if (stream_nr != ST_FLOW_CTRL) {
@@ -1943,13 +1974,8 @@ static int dtr_handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 		}
 	}
 
-	if (stream_nr != ST_FLOW_CTRL) {
-		struct dtr_flow *flow = &path->flow[stream_nr];
-		struct dtr_stream *rdma_stream = &rdma_transport->stream[stream_nr];
-
-		atomic_dec(&flow->tx_descs_posted);
-		wake_up_interruptible(&rdma_stream->send_wq);
-	}
+	atomic_dec(&flow->tx_descs_posted);
+	wake_up_interruptible(&rdma_stream->send_wq);
 
 	if (tx_desc)
 		dtr_free_tx_desc(cm, tx_desc);
@@ -2385,6 +2411,7 @@ static int dtr_repost_tx_desc(struct dtr_cm *old_cm, struct dtr_tx_desc *tx_desc
 		container_of(old_cm->path->path.transport, struct dtr_transport, transport);
 	enum drbd_stream stream = tx_desc->imm.stream;
 	struct dtr_cm *cm;
+	struct dtr_flow *flow;
 	int err;
 
 	do {
@@ -2399,10 +2426,21 @@ static int dtr_repost_tx_desc(struct dtr_cm *old_cm, struct dtr_tx_desc *tx_desc
 			continue;
 		}
 
+		flow = &cm->path->flow[stream];
+		if (atomic_dec_if_positive(&flow->peer_rx_descs) < 0) {
+			kref_put(&cm->kref, dtr_destroy_cm);
+			continue;
+		}
+		if (!atomic_inc_if_bwlow(&flow->tx_descs_posted, flow->tx_descs_max)) {
+			atomic_inc(&flow->peer_rx_descs);
+			kref_put(&cm->kref, dtr_destroy_cm);
+			continue;
+		}
+
 		err = __dtr_post_tx_desc(cm, tx_desc);
-		if (!err) {
-			struct dtr_flow *flow = &cm->path->flow[stream];
-			atomic_inc(&flow->tx_descs_posted);
+		if (err) {
+			atomic_inc(&flow->peer_rx_descs);
+			atomic_dec(&flow->tx_descs_posted);
 		}
 		kref_put(&cm->kref, dtr_destroy_cm);
 	} while (err);
@@ -2440,6 +2478,12 @@ retry:
 		kref_put(&cm->kref, dtr_destroy_cm);
 		goto retry;
 	}
+	if (!atomic_inc_if_bwlow(&flow->tx_descs_posted, flow->tx_descs_max)) {
+		atomic_inc(&flow->peer_rx_descs);
+		kref_put(&cm->kref, dtr_destroy_cm);
+		goto retry;
+	}
+
 	device = cm->id->device;
 	switch (tx_desc->type) {
 	case SEND_PAGE:
@@ -2458,10 +2502,11 @@ retry:
 	}
 
 	err = __dtr_post_tx_desc(cm, tx_desc);
-	if (!err)
-		atomic_inc(&flow->tx_descs_posted);
-	else
+	if (err) {
+		atomic_inc(&flow->peer_rx_descs);
+		atomic_dec(&flow->tx_descs_posted);
 		ib_dma_unmap_page(device, tx_desc->sge[0].addr, tx_desc->sge[0].length, DMA_TO_DEVICE);
+	}
 
 
 out:
-- 
2.43.0

