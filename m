Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD79143AD
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 09:28:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF819420651;
	Mon, 24 Jun 2024 09:28:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m25467.xmail.ntesmail.com (mail-m25467.xmail.ntesmail.com
	[103.129.254.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CAA224205A9
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 09:27:02 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 00AE07E06C8
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:21 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 04/11] drbd_transport_rdma: dont schedule retry_connect_work
	in active is false
Date: Mon, 24 Jun 2024 13:46:12 +0800
Message-Id: <20240624054619.23212-4-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHR4eVk4ZQkkfSRhJT0gfQ1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c7f3dc022ckunm00ae07e06c8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxw6SBw*LDchMgI#CSkrHC4*
	NAwaFDBVSlVKTEpCSUtMQkNJTklPVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlNTE03Bg++
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
 drbd/drbd_transport_rdma.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index eccd0c6ce..b7ccb15d4 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1089,9 +1089,13 @@ static void dtr_cma_retry_connect_work_fn(struct work_struct *work)
 	if (err) {
 		struct dtr_path *path = container_of(cs, struct dtr_path, cs);
 		struct drbd_transport *transport = path->path.transport;
+		struct dtr_transport *rdma_transport =
+			container_of(transport, struct dtr_transport, transport);
 
 		tr_err(transport, "dtr_start_try_connect failed  %d\n", err);
-		schedule_delayed_work(&cs->retry_connect_work, HZ);
+		if (rdma_transport->active) {
+			schedule_delayed_work(&cs->retry_connect_work, HZ);
+		}
 	}
 }
 
@@ -1116,6 +1120,8 @@ static void dtr_remove_cm_from_path(struct dtr_path *path, struct dtr_cm *failed
 static void dtr_cma_retry_connect(struct dtr_path *path, struct dtr_cm *failed_cm)
 {
 	struct drbd_transport *transport = path->path.transport;
+	struct dtr_transport *rdma_transport =
+		container_of(transport, struct dtr_transport, transport);
 	struct dtr_connect_state *cs = &path->cs;
 	long connect_int = 10 * HZ;
 	struct net_conf *nc;
@@ -1128,7 +1134,9 @@ static void dtr_cma_retry_connect(struct dtr_path *path, struct dtr_cm *failed_c
 		connect_int = nc->connect_int * HZ;
 	rcu_read_unlock();
 
-	schedule_delayed_work(&cs->retry_connect_work, connect_int);
+	if (rdma_transport->active) {
+		schedule_delayed_work(&cs->retry_connect_work, connect_int);
+	}
 }
 
 static void dtr_cma_connect_work_fn(struct work_struct *work)
-- 
2.27.0

