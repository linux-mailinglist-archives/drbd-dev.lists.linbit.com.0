Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D85BA5BE8E
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Mar 2025 12:11:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4140A16B86C;
	Tue, 11 Mar 2025 12:11:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Tue, 11 Mar 2025 12:11:41 CET
Received: from mail-m15571.qiye.163.com (mail-m15571.qiye.163.com
	[101.71.155.71])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E0A1E160657
	for <drbd-dev@lists.linbit.com>; Tue, 11 Mar 2025 12:11:41 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 65fad535;
	Tue, 11 Mar 2025 19:06:33 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] rdma: Add network ping detection
Date: Tue, 11 Mar 2025 19:06:32 +0800
Message-ID: <20250311110633.1122918-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEsYVk9IS0oaH0gdSkJPS1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9584e289eb0227kunm65fad535
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDo6LCo*SDcSHjMVGjItDTYW
	OSlPCS9VSlVKTE9KTUJKSkJPTUxKVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpLQ0o3Bg++
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

In rdma mode, the drbd establishes a connection between two nodes,
and without I/O. If one node suddenly crash,
the connection status of the remain node is still normal.
That is, the remain node cannot detect the exception of the peer node.

So in rdma transport mode, we also add a ping work, like tcp transport mode.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 427065789..9799be396 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -3152,6 +3152,9 @@ static void dtr_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream
 		container_of(transport, struct dtr_transport, transport);
 
 	rdma_transport->stream[stream].recv_timeout = timeout;
+
+	if (stream == CONTROL_STREAM)
+		mod_timer(&rdma_transport->control_timer, jiffies + timeout);
 }
 
 static long dtr_get_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream)
-- 
2.43.0

