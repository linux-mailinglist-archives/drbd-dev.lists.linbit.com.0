Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3A4CB782
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 08:11:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 425464205D8;
	Thu,  3 Mar 2022 08:11:30 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m2458.qiye.163.com (mail-m2458.qiye.163.com
	[220.194.24.58])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA6B04201E4
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 08:11:28 +0100 (CET)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2458.qiye.163.com (Hmail) with ESMTPA id A9611740501;
	Thu,  3 Mar 2022 15:10:15 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	joel.colledge@linbit.com
Date: Thu,  3 Mar 2022 15:10:09 +0800
Message-Id: <20220303071009.1070360-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRkfSUhWTk5ISR4aGUhDT0
	1KVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRQ6Pjo6AzI4HU5IMEkMPToc
	Tw8wChNVSlVKTU9NSUJKT0pNTUpKVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUpMTEk3Bg++
X-HM-Tid: 0a7f4e9d74978c17kuqta9611740501
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd: create new uuid even we dont have quorum
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

We cant skip creating new uuid, when we are making new uuid.

If there is an IO blocked by creating new uuid, but we found
we dont have quorum, then NEW_CUR_UUID will be cleared but
new uuid was not actually created.

After one peer online, we have enough quorum to continue IO, then this
IO will reach  primary and the online peer.

But if there is another peer join later, this peer will found same uuid, and will lose data.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_sender.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
index 7238730..88d49d9 100644
--- a/drbd/drbd_sender.c
+++ b/drbd/drbd_sender.c
@@ -2360,7 +2360,7 @@ void drbd_check_peers_new_current_uuid(struct drbd_device *device)
 
 	drbd_check_peers(resource);
 
-	if (device->have_quorum[NOW] && drbd_data_accessible(device, NOW))
+	if (drbd_data_accessible(device, NOW))
 		drbd_uuid_new_current(device, false);
 }
 
-- 
1.8.3.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
