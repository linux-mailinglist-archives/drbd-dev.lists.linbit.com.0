Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FB978E2F
	for <lists+drbd-dev@lfdr.de>; Sat, 14 Sep 2024 08:12:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E9C44208F9;
	Sat, 14 Sep 2024 08:12:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m1282.netease.com (mail-m1282.netease.com [103.209.128.2])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D3BF420233
	for <drbd-dev@lists.linbit.com>;
	Sat, 14 Sep 2024 08:12:45 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 20A8F480258
	for <drbd-dev@lists.linbit.com>; Sat, 14 Sep 2024 13:43:57 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] rdma: Fix multiple disk performance degradation
Date: Sat, 14 Sep 2024 13:43:54 +0800
Message-Id: <20240914054354.13236-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTk8eVkIYSB1PGh0aTxhOSVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxKVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a91ef0f35f00229kunm20a8f480258
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MCI6FSo6TTcvLBAVQ0wZSBcr
	EhIaCSlVSlVKTElNSUJJTUhMTE9KVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQU9KTEs3Bg++
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

In the performance test of rdma mode, we found that when
two drbd disks were simultaneously subjected to high-pressure I/O write,
the IOPS of each drbd disk would be reduced by half.

The reason is that if the cq_attr.comp_vector parameter
is not specified when rdma create send_cq and recv_cq,
cq will be allocated to the same irq for processing.
At this point, if multiple disks are stress tested at the same time,
irq will not be processed in a timely manner
and performance will decrease.

The solution is to use the network port number as the index of the comp_vector,
so that the cq of each disk can be distributed across different IRQs

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 44 ++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 813787c28..8915e60d1 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2486,10 +2486,43 @@ static int dtr_init_flow(struct dtr_path *path, enum drbd_stream stream)
 	return err;
 }
 
+static int dtr_get_my_port(struct dtr_path *path)
+{
+	int port = 0;
+	struct sockaddr_storage *addr = (struct sockaddr_storage *)&path->path.my_addr;
+
+	if (addr->ss_family == AF_INET6) {
+		const struct sockaddr_in6 *v6a = (const struct sockaddr_in6 *)addr;
+
+		port = be16_to_cpu(v6a->sin6_port);
+	} else /* AF_INET, AF_SSOCKS, AF_SDP */ {
+		const struct sockaddr_in *v4a = (const struct sockaddr_in *)addr;
+
+		port = be16_to_cpu(v4a->sin_port);
+	}
+
+	return port;
+}
+
+static void dtr_get_comp_vectors(struct dtr_path *path, int cq_num, int *comp_vectors)
+{
+	int i;
+	int tmp_comp_vector = dtr_get_my_port(path) * cq_num;
+
+	for (i = 0; i < cq_num; i++) {
+		comp_vectors[i] = tmp_comp_vector + i;
+	}
+
+	return;
+}
+
 static int _dtr_cm_alloc_rdma_res(struct dtr_cm *cm,
 				    enum dtr_alloc_rdma_res_causes *cause)
 {
-	int err, i, rx_descs_max = 0, tx_descs_max = 0;
+	int err, i, cq_index = 0, rx_descs_max = 0, tx_descs_max = 0;
+	int cq_num = 2; /* recv_cq and send_cq */
+	int comp_vectors[2] = {0}; /* recv_cq and send_cq */
+	struct ib_device *device = cm->id->device;
 	struct ib_cq_init_attr cq_attr = {};
 	struct dtr_path *path = cm->path;
 
@@ -2504,16 +2537,18 @@ static int _dtr_cm_alloc_rdma_res(struct dtr_cm *cm,
 	/* in 4.9 ib_alloc_pd got the ability to specify flags as second param */
 	/* so far we don't use flags, but if we start using them, we have to be
 	 * aware that the compat layer removes this parameter for old kernels */
-	cm->pd = ib_alloc_pd(cm->id->device, 0);
+	cm->pd = ib_alloc_pd(device, 0);
 	if (IS_ERR(cm->pd)) {
 		*cause = IB_ALLOC_PD;
 		err = PTR_ERR(cm->pd);
 		goto pd_failed;
 	}
 
+	dtr_get_comp_vectors(path, cq_num, comp_vectors);
 	/* create recv completion queue (CQ) */
 	cq_attr.cqe = rx_descs_max;
-	cm->recv_cq = ib_create_cq(cm->id->device,
+	cq_attr.comp_vector = comp_vectors[cq_index] % device->num_comp_vectors;
+	cm->recv_cq = ib_create_cq(device,
 			dtr_rx_cq_event_handler, NULL, cm,
 			&cq_attr);
 	if (IS_ERR(cm->recv_cq)) {
@@ -2524,7 +2559,8 @@ static int _dtr_cm_alloc_rdma_res(struct dtr_cm *cm,
 
 	/* create send completion queue (CQ) */
 	cq_attr.cqe = tx_descs_max;
-	cm->send_cq = ib_create_cq(cm->id->device,
+	cq_attr.comp_vector = comp_vectors[cq_index++] % device->num_comp_vectors;
+	cm->send_cq = ib_create_cq(device,
 			dtr_tx_cq_event_handler, NULL, cm,
 			&cq_attr);
 	if (IS_ERR(cm->send_cq)) {
-- 
2.17.1

