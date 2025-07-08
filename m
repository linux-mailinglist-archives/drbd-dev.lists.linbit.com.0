Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC748AFC367
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Jul 2025 08:55:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 871F1162279;
	Tue,  8 Jul 2025 08:55:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 301 seconds by postgrey-1.31 at mail19;
	Tue, 08 Jul 2025 08:55:46 CEST
Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com
	[220.197.32.121])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B0A65162250
	for <drbd-dev@lists.linbit.com>; Tue,  8 Jul 2025 08:55:46 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id cb35d843;
	Tue, 8 Jul 2025 14:50:42 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 3/3] modify rdma_conn_param.rnr_retry to 7
Date: Tue,  8 Jul 2025 14:50:40 +0800
Message-ID: <20250708065040.4043169-3-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708065040.4043169-1-zhengbing.huang@easystack.cn>
References: <20250708065040.4043169-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUpMVklJS04YTR1CSkpCSFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a97e8cd107f0227kunm79295d308d0d91
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhA6FSo*PjdMUQ42HQoXIzkf
	GQwwChBVSlVKTE5KQk5MT09ISENIVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpNS0k3Bg++
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

During the sync process, we found that the
IB_WC_RNR_RETRY_EXC_ERR error always occurred, and then
the connection break. Then when the connection is restored,
this error occurs again, enter a loop.

When the IB_WC_RNR_RETRY_EXC_ERR error occurs,
it indicates that there is no rx_desc at the receive side currently.
Then we query that the current rnr_retry value is 0,
meane there is no retry.

So we modify rnr_retry to 7(max value), and the problem did not occur again.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 30edfaf96..14392a33b 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -409,6 +409,7 @@ static struct rdma_conn_param dtr_conn_param = {
 	.responder_resources = 1,
 	.initiator_depth = 1,
 	.retry_count = 10,
+	.rnr_retry_count  = 7,
 };
 
 static u32 dtr_cm_to_lkey(struct dtr_cm *cm)
-- 
2.43.0

