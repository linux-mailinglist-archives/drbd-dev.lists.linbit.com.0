Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 60149CAA2B3
	for <lists+drbd-dev@lfdr.de>; Sat, 06 Dec 2025 09:19:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F0FE3163113;
	Sat,  6 Dec 2025 09:19:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m93129.xmail.ntesmail.com (mail-m93129.xmail.ntesmail.com
	[103.126.93.129])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 413431630C5
	for <drbd-dev@lists.linbit.com>; Sat,  6 Dec 2025 09:17:36 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13fe2f037;
	Sat, 6 Dec 2025 16:12:30 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 3/4] rdma: When the post send fails,
	change the connection state to C_NETWORK_FAILURE
Date: Sat,  6 Dec 2025 16:12:26 +0800
Message-ID: <20251206081227.1237575-3-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
References: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2b838460227kunmdf22d26a1288009
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBhNVh1LHh1CTh4ZHU1ITVYVFAkWGhdVGRETFh
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

In rdma mode, the sync process gets stuck.

We found that on the recv side, the flow expects the rx_sequence
of the next rx_desc is 92831, but the minimum rx_sequence
of rx_desc on the current rx_descs list is 92833.
memory info:
      rx_sequence = 92831,
      rdma_transport = 0xff1616c673f3aa60
      }, {
    send_wq = {
crash> list -o dtr_rx_desc.list -s dtr_rx_desc.sequence  -H 0xff1616bf0cd80008
ff1616e0208346c0
  sequence = 92833
ff1616c4a7f78600
  sequence = 92834

Then we found the log of fail post send_wr on the send side:
kernel: infiniband mlx5_1: mlx5_ib_post_send:1101:(pid 43146):
kernel: drbd drbd1 rdma: ib_post_send() failed -12

The problem is that when ib_post_send() fails to post a send_wr,
flush_send_buffer() returns an error, but its caller does not check the return value,
and continues to run. Because tx/rx_sequence increments both in send and recv side,
it eventually leads to recv side constantly wait for the rx_desc that
has already fail to be post.

The solution is to use drbd_control_event() to disconnect the current connection.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 5a28f58f0..ce7be2549 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1936,8 +1936,10 @@ static int dtr_handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 			err = dtr_repost_tx_desc(cm, tx_desc);
 			if (!err)
 				tx_desc = NULL; /* it is in the air again! Fly! */
-			else if (__ratelimit(&rdma_transport->rate_limit))
+			else if (__ratelimit(&rdma_transport->rate_limit)) {
 				tr_warn(transport, "repost of tx_desc failed! %d\n", err);
+				drbd_control_event(transport, CLOSED_BY_PEER);
+			}
 		}
 	}
 
@@ -3234,6 +3236,9 @@ static int dtr_send_page(struct drbd_transport *transport, enum drbd_stream stre
 	if (err) {
 		put_page(page);
 		kfree(tx_desc);
+
+		tr_err(transport, "dtr_post_tx_desc() failed %d\n", err);
+		drbd_control_event(transport, CLOSED_BY_PEER);
 	}
 
 	if (stream == DATA_STREAM)
@@ -3320,6 +3325,9 @@ static int dtr_send_bio_part(struct dtr_transport *rdma_transport,
 			}
 			kfree(tx_desc);
 		}
+
+		tr_err(transport, "dtr_post_tx_desc() failed %d\n", err);
+		drbd_control_event(transport, CLOSED_BY_PEER);
 	}
 
 	return err;
-- 
2.43.0

