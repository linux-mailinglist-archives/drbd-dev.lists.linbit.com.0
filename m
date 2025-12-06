Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4ECAA2B0
	for <lists+drbd-dev@lfdr.de>; Sat, 06 Dec 2025 09:18:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B74D016310D;
	Sat,  6 Dec 2025 09:18:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m93129.xmail.ntesmail.com (mail-m93129.xmail.ntesmail.com
	[103.126.93.129])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3AA6F162EF9
	for <drbd-dev@lists.linbit.com>; Sat,  6 Dec 2025 09:17:36 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13fe2f034;
	Sat, 6 Dec 2025 16:12:28 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 1/4] rdma: Reduce the load of the drbd_receive thread
Date: Sat,  6 Dec 2025 16:12:24 +0800
Message-ID: <20251206081227.1237575-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2b82f680227kunmdf22d26a1287e23
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTkxNVhpLSBgdHhodSEgdSFYVFAkWGhdVGRETFh
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

When drbd is in rdma transfer mode, in the scenario of high pressure I/O,
We find that as the value of the fio parameter iodepth increases,
the performance of IO actually decreases.

We noticed that the load of the drbd_receive thread is very high.
Using tools such as perf, we observed that the related function
overhead of rx_desc in the drbd_receive thread is relatively high.

So in dtr_refill_rx_desc(), we use schedule path->refill_rx_descs_work
to reduce the load of the drbd_receive thread and
the IO performance stabilizes.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 6795d9def..3addb7e42 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2131,9 +2131,18 @@ out:
 static void dtr_refill_rx_descs_work_fn(struct work_struct *work)
 {
 	struct dtr_path *path = container_of(work, struct dtr_path, refill_rx_descs_work);
+	int i;
+
+	if (!dtr_path_ok(path))
+		return;
+
+	for (i = DATA_STREAM; i <= CONTROL_STREAM ; i++) {
+		struct dtr_flow *flow = &path->flow[i];
 
-	if (dtr_path_ok(path))
-		__dtr_refill_rx_desc(path, DATA_STREAM);
+		if (atomic_read(&flow->rx_descs_posted) < flow->rx_descs_want_posted / 2)
+			__dtr_refill_rx_desc(path, i);
+		dtr_flow_control(flow, GFP_NOIO);
+	}
 }
 
 static void __dtr_refill_rx_desc(struct dtr_path *path, enum drbd_stream stream)
@@ -2174,11 +2183,7 @@ static void dtr_refill_rx_desc(struct dtr_transport *rdma_transport,
 	for_each_path_ref(drbd_path, transport) {
 		struct dtr_path *path = container_of(drbd_path, struct dtr_path, path);
 
-		if (!dtr_path_ok(path))
-			continue;
-
-		__dtr_refill_rx_desc(path, stream);
-		dtr_flow_control(&path->flow[stream], GFP_NOIO);
+		schedule_work(&path->refill_rx_descs_work);
 	}
 }
 
-- 
2.43.0

