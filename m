Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E454E7F3EC4
	for <lists+drbd-dev@lfdr.de>; Wed, 22 Nov 2023 08:18:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 62E484205CA;
	Wed, 22 Nov 2023 08:18:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 319 seconds by postgrey-1.31 at mail19;
	Wed, 22 Nov 2023 04:30:39 CET
Received: from mail-m17245.xmail.ntesmail.com (mail-m17245.xmail.ntesmail.com
	[45.195.17.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8C87420220
	for <drbd-dev@lists.linbit.com>; Wed, 22 Nov 2023 04:30:38 +0100 (CET)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2839.qiye.163.com (Hmail) with ESMTPA id 81C2DC04A9;
	Wed, 22 Nov 2023 11:25:11 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Date: Wed, 22 Nov 2023 11:25:10 +0800
Message-Id: <20231122032510.24233-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaThhCVk5JS0JLGEgdHUxNHlUZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpNQ0xMT1VKS0tVSkJLS1kG
X-HM-Tid: 0a8bf50f708f8421kuqw81c2dc04a9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mj46CAw6QjEwKys#ECocEE4O
	OUgaCz9VSlVKTEtLTUlITkpJSEJIVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlJQkg3Bg++
X-Mailman-Approved-At: Wed, 22 Nov 2023 08:18:50 +0100
Cc: philipp.reisner@linbit.com
Subject: [Drbd-dev] [PATCH] drbd: when change susp_uuid[NEW] to true,
	make sure susp_uuid[OLD] is false
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The problem scenario is as follows:

1. drbd is built on two nodes, role is primary and secondary, quorum is 2.
   then drbd's network fails. IO will be suspended.
2. primary modify quorum to 1, during this state change,
   drbd will set susp_uuid[NEW] to true and generate a new UUID.
3. then in w_after_state_change, start the second state change,
   set susp_uuid[NEW] to false. but during the second state change,
   it's possible to find NEW_CUR_UUID flag was set by others.
   then sanitize_state() will set susp_uuid[NEW] to true.

Finally susp_uuid value is {true, true}, IO is frozen.
And there is no way to set susp_uuid to false after that.

So, while susp_uuid[NEW] is set to true, we want susp_uuid[OLD] to be false.

Fixes: d47f7456ab ("drbd: create new UUID before resuming IO upon regaining quorum")
Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_state.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index e35150340..0dedd2dae 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -2356,6 +2356,7 @@ static void sanitize_state(struct drbd_resource *resource)
 	if (resource_is_suspended(resource, OLD) && !resource_is_suspended(resource, NEW)) {
 		idr_for_each_entry(&resource->devices, device, vnr) {
 			if (test_bit(NEW_CUR_UUID, &device->flags)) {
+				resource->susp_uuid[OLD] = false;
 				resource->susp_uuid[NEW] = true;
 				break;
 			}
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
