Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 29671914252
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 07:53:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF58642065B;
	Mon, 24 Jun 2024 07:53:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 332 seconds by postgrey-1.31 at mail19;
	Mon, 24 Jun 2024 07:52:02 CEST
Received: from mail-m1973184.qiye.163.com (mail-m1973184.qiye.163.com
	[220.197.31.84])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BDFD420618
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 07:52:01 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 9F2417E06F0
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:26 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 11/11] drbd_transport_rdma: wake up state_wq after clear
	DSB_CONNECTED in dtr_tx_timeout_work_fn
Date: Mon, 24 Jun 2024 13:46:19 +0800
Message-Id: <20240624054619.23212-11-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0waVk1OGEpITEhKTx4fSVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c80603022ckunm9f2417e06f0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nww6NRw6GDceKgIsTiozHCwJ
	TS9PCw5VSlVKTEpCSUtMQkNMSU9DVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpOQ083Bg++
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
 drbd/drbd_transport_rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 0cd639254..2df33af90 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1572,6 +1572,7 @@ static void dtr_tx_timeout_work_fn(struct work_struct *work)
 	if (!test_and_clear_bit(DSB_CONNECTED, &cm->state) || !path)
 		goto out;
 
+	wake_up(&cm->state_wq);
 	transport = path->path.transport;
 	tr_warn(transport, "%pI4 - %pI4: tx timeout\n",
 		&((struct sockaddr_in *)&path->path.my_addr)->sin_addr,
-- 
2.27.0

