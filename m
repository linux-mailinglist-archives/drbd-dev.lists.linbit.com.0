Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93D9143B3
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 09:29:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CFBE342065B;
	Mon, 24 Jun 2024 09:29:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m25467.xmail.ntesmail.com (mail-m25467.xmail.ntesmail.com
	[103.129.254.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C851D420392
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 09:27:02 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id EF6D67E06EB
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:25 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 10/11] drbd_transport_rdma: introduce timeout for rdma_connect
Date: Mon, 24 Jun 2024 13:46:18 +0800
Message-Id: <20240624054619.23212-10-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0JCVk1IShkeHxoZTklCTFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c80364022ckunmef6d67e06eb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ojo6Iww4NDctEAIUCSo5HCEz
	SytPCTlVSlVKTEpCSUtMQkNNTk1IVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUhPT0I3Bg++
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

From: Dongsheng Yang <dongsheng.yang@easystack.cn>

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 811f1a20a..0cd639254 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -140,11 +140,13 @@ union dtr_immediate {
 
 enum dtr_state_bits {
 	DSB_CONNECT_REQ,
+	DSB_CONNECTING,
 	DSB_CONNECTED,
 	DSB_ERROR,
 };
 
 #define DSM_CONNECT_REQ   (1 << DSB_CONNECT_REQ)
+#define DSM_CONNECTING    (1 << DSB_CONNECTING)
 #define DSM_CONNECTED     (1 << DSB_CONNECTED)
 #define DSM_ERROR         (1 << DSB_ERROR)
 
@@ -1033,6 +1035,7 @@ static int dtr_cma_accept(struct dtr_listener *listener, struct rdma_cm_id *new_
 		return -EAGAIN;
 	}
 
+	set_bit(DSB_CONNECTING, &cm->state);
 	err = rdma_accept(new_cm_id, &dtr_conn_param);
 	if (err)
 		kref_put(&cm->kref, dtr_destroy_cm);
@@ -1163,6 +1166,7 @@ static void dtr_cma_connect_work_fn(struct work_struct *work)
 	}
 
 	kref_get(&cm->kref); /* Expecting RDMA_CM_EVENT_ESTABLISHED */
+	set_bit(DSB_CONNECTING, &cm->state);
 	err = rdma_connect(cm->id, &dtr_conn_param);
 	if (err) {
 		kref_put(&cm->kref, dtr_destroy_cm); /* no RDMA_CM_EVENT_ESTABLISHED */
@@ -1170,6 +1174,15 @@ static void dtr_cma_connect_work_fn(struct work_struct *work)
 		goto out;
 	}
 
+	err = wait_event_timeout(cm->state_wq,
+			   !test_bit(DSB_CONNECTING, &cm->state), 20*HZ);
+
+	if (err == 0 && test_and_clear_bit(DSB_CONNECTING, &cm->state)) {
+		kref_put(&cm->kref, dtr_destroy_cm);
+		tr_err(transport, "rdma_connect timeout\n");
+		goto out;
+	}
+
 	kref_put(&cm->kref, dtr_destroy_cm); /* for work */
 	return;
 out:
@@ -1293,6 +1306,9 @@ static int dtr_cma_event_handler(struct rdma_cm_id *cm_id, struct rdma_cm_event
 
 	case RDMA_CM_EVENT_ESTABLISHED:
 		// pr_info("%s: RDMA_CM_EVENT_ESTABLISHED\n", cm->name);
+		if (!test_and_clear_bit(DSB_CONNECTING, &cm->state))
+			return 0;
+		wake_up(&cm->state_wq);
 		/* cm->state = DSM_CONNECTED; is set later in the work item */
 		/* This is called for active and passive connections */
 
@@ -1313,6 +1329,8 @@ static int dtr_cma_event_handler(struct rdma_cm_id *cm_id, struct rdma_cm_event
 		// pr_info("%s: RDMA_CM_EVENT_REJECTED\n", cm->name);
 		// pr_info("event = %d, status = %d\n", event->event, event->status);
 		set_bit(DSB_ERROR, &cm->state);
+		if (!test_and_clear_bit(DSB_CONNECTING, &cm->state))
+			return 0;
 
 		dtr_cma_retry_connect(cm->path, cm);
 		break;
-- 
2.27.0

