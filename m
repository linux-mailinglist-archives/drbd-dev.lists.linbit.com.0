Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A6583E26
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jul 2022 13:58:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4C052420F78;
	Thu, 28 Jul 2022 13:58:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 595 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jul 2022 13:58:05 CEST
Received: from mail-m2457.qiye.163.com (mail-m2457.qiye.163.com
	[220.194.24.57])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52F984207B8
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jul 2022 13:58:04 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2457.qiye.163.com (Hmail) with ESMTPA id BEB8AC40139;
	Thu, 28 Jul 2022 19:48:05 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Thu, 28 Jul 2022 19:47:59 +0800
Message-Id: <20220728114759.810371-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHk9LVk8aS0sZQ0waHUhMTlUZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6Sww6KDIPOC8JOT03FD02
	GR5PCRFVSlVKTU5CS0tDQ0NNTUNJVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUpMSEI3Bg++
X-HM-Tid: 0a8244a2a6168c16kuqtbeb8ac40139
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd: fix a bug with two-primaries configuration
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

There is a bug when execute 'drbdsetup disconnect' in
two-primaries configuration.

When 'drbdsetup disconnect' is called by user, two primary
nodes will going to outdated in do_change_cstate, then the
command will failed since there is no UpToDate node.

Fix it by modify the judgment condition in do_change_cstate.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 792a96d5..c4f3f776 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -5406,7 +5406,7 @@ static bool do_change_cstate(struct change_context *context, enum change_phase p
 		u64 directly_reachable = directly_connected_nodes(resource, NEW) |
 			NODE_MASK(resource->res_opts.node_id);
 
-		if (reply->primary_nodes & ~directly_reachable)
+		if (!(reply->primary_nodes & directly_reachable))
 			__outdate_myself(resource);
 	}
 
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
