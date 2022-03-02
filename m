Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E884CA4E7
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Mar 2022 13:35:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E74F42179D;
	Wed,  2 Mar 2022 13:35:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2458.qiye.163.com (mail-m2458.qiye.163.com
	[220.194.24.58])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B97E8421798
	for <drbd-dev@lists.linbit.com>; Wed,  2 Mar 2022 13:35:31 +0100 (CET)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2458.qiye.163.com (Hmail) with ESMTPA id 73A80740AAE;
	Wed,  2 Mar 2022 20:35:29 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: joel.colledge@linbit.com, philipp.reisner@linbit.com,
	drbd-dev@lists.linbit.com
Date: Wed,  2 Mar 2022 20:35:23 +0800
Message-Id: <20220302123523.471277-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUNJHUxWHUlOQhlNHUMYHx
	9IVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NyI6SQw4PzIyK083HyMiD0o8
	AywKChdVSlVKTU9NSUlPTkhLSUJIVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUpDSUk3Bg++
X-HM-Tid: 0a7f4aa0da408c17kuqt73a80740aae
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd:do not wait for negotiation result with
	unconnected peer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The commit 8a962a6a from Dec 2014
"drbd: fix leaving of D_NEGOTIATING if some peer do not have the minor yet"
introduced a bug that disk state will always stay in negotiating since there
will never be negotiation result with unconnected peer.

So do not wait for an negotiation result with unconnected peer!

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index aeaf36a..f79f5a4 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -1912,7 +1912,8 @@ static void sanitize_state(struct drbd_resource *resource)
 				enum drbd_repl_state nr = peer_device->negotiation_result;
 				enum drbd_disk_state pdsk = peer_device->disk_state[NEW];
 
-				if (pdsk == D_UNKNOWN || pdsk < D_NEGOTIATING)
+				if (pdsk == D_UNKNOWN || pdsk < D_NEGOTIATING ||
+				    peer_device->connection->cstate[NEW] < C_CONNECTED)
 					continue;
 
 				if (pdsk == D_UP_TO_DATE)
-- 
1.8.3.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
