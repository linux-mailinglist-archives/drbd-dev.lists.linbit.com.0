Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 509639143AC
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 09:27:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 86FCB420633;
	Mon, 24 Jun 2024 09:27:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m25467.xmail.ntesmail.com (mail-m25467.xmail.ntesmail.com
	[103.129.254.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CBB3B4205C6
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 09:27:03 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 9C4FE7E06E5
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:24 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 08/11] drbd_transport_rdma: fix a race between dtr_connect and
	drbd_thread_stop
Date: Mon, 24 Jun 2024 13:46:16 +0800
Message-Id: <20240624054619.23212-8-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTxpKVhhKQ0hOThpMTExIH1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c7fe2a022ckunm9c4fe7e06e5
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OAg6CSo5MDcjLgI2NyoIHBgB
	CwwwFC9VSlVKTEpCSUtMQkNOSk1OVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlJQ0k3Bg++
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

If the send_sig() in drbd_thread_stop before wait_for_completion_interruptible() in dtr_connect(),
it can't return from dtr_connect in network failure.

So replace wait_for_completion_interruptible with wait_for_completion_interruptible_timeout, and
check status by dtr_connect() itself.

This behavior is similar with tcp transport

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 77ff0055e..c47b344f8 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2996,12 +2996,21 @@ static int dtr_connect(struct drbd_transport *transport)
 {
 	struct dtr_transport *rdma_transport =
 		container_of(transport, struct dtr_transport, transport);
-	int i, err = -ENOMEM;
+	int i, err;
 
-	err = wait_for_completion_interruptible(&rdma_transport->connected);
-	if (err) {
+again:
+	if (drbd_should_abort_listening(transport)) {
+		err = -EAGAIN;
+		goto abort;
+	}
+
+	err = wait_for_completion_interruptible_timeout(&rdma_transport->connected, HZ);
+	if (err < 0) {
 		flush_signals(current);
 		goto abort;
+	} else if (err == 0) {
+		/* timed out */
+		goto again;
 	}
 
 	err = atomic_read(&rdma_transport->first_path_connect_err);
-- 
2.27.0

