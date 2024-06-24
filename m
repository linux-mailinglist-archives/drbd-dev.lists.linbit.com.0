Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D29142A7
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 08:22:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B94704205C6;
	Mon, 24 Jun 2024 08:22:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1199 seconds by postgrey-1.31 at mail19;
	Mon, 24 Jun 2024 08:22:03 CEST
Received: from mail-m25498.xmail.ntesmail.com (mail-m25498.xmail.ntesmail.com
	[103.129.254.98])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B9A04205A5
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 08:22:02 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 955AD7E06C3
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:22 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 05/11] drbd_transport_rdma: dont break in
	dtr_tx_cq_event_handler if (cm->state != DSM_CONNECTED)
Date: Mon, 24 Jun 2024 13:46:13 +0800
Message-Id: <20240624054619.23212-5-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB0YVk9DTk0YSkpCGhhNTFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c7f63f022ckunm955ad7e06c3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6FCo4NTcZIgIzCSpRHCor
	IhVPFEhVSlVKTEpCSUtMQkNIT0tCVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpNQ003Bg++
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

We need to drain all tx in disconnect to put all kref for cm

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index b7ccb15d4..9a6d15b78 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1956,9 +1956,6 @@ static void dtr_tx_cq_event_handler(struct ib_cq *cq, void *ctx)
 			err = dtr_handle_tx_cq_event(cq, cm);
 		} while (!err);
 
-		if (cm->state != DSM_CONNECTED)
-			break;
-
 		rc = ib_req_notify_cq(cq, IB_CQ_NEXT_COMP | IB_CQ_REPORT_MISSED_EVENTS);
 		if (unlikely(rc < 0)) {
 			struct drbd_transport *transport = cm->path->path.transport;
-- 
2.27.0

