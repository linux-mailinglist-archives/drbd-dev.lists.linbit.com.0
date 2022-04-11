Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B28554FBBBD
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Apr 2022 14:10:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB9784202F6;
	Mon, 11 Apr 2022 14:10:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 501 seconds by postgrey-1.31 at mail19;
	Mon, 11 Apr 2022 14:10:28 CEST
Received: from mail-m2458.qiye.163.com (mail-m2458.qiye.163.com
	[220.194.24.58])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4B324201D4
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 14:10:28 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by mail-m2458.qiye.163.com (Hmail) with ESMTPA id B75F7740351;
	Mon, 11 Apr 2022 20:02:04 +0800 (CST)
From: Rui Xu <rui.xu@easystack.cn>
To: philipp.reisner@linbit.com, joel.colledge@linbit.com,
	drbd-dev@lists.linbit.com
Date: Mon, 11 Apr 2022 20:02:04 +0800
Message-Id: <20220411120204.3683999-1-rui.xu@easystack.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRoZSRpWSBkeTxhMHR1JTB
	9LVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6CDo6MTIoDyg5Dg9WNhUS
	IhoaFE1VSlVKTU9CTUxDTklOSklMVTMWGhIXVQkOElUDDjseGggCCA8aGBBVGBVFWVdZEgtZQVlJ
	SkNVQk9VSkpDVUJLWVdZCAFZQUlKTEs3Bg++
X-HM-Tid: 0a801880a1f08c17kuqtb75f7740351
Cc: Rui Xu <rui.xu@easystack.cn>, dongsheng.yang@easystack.cn
Subject: [Drbd-dev] [PATCH] drbd:clear NEW_CUR_UUID when uuid was actually
	created
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

If there is an IO blocked by creating new uuid, but we found
we dont have quorum, then NEW_CUR_UUID will be cleared but
new uuid was not actually created.

After one peer online, we have enough quorum to continue IO, then this
IO will reach  primary and the online peer.

But if there is another peer join later, this peer will found same uuid, and will lose data.

So don't clear NEW_CUR_UUID unless uuid was actually created.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
---
 drbd/drbd_sender.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
index 7238730..b0e3701 100644
--- a/drbd/drbd_sender.c
+++ b/drbd/drbd_sender.c
@@ -2360,15 +2360,17 @@ void drbd_check_peers_new_current_uuid(struct drbd_device *device)
 
 	drbd_check_peers(resource);
 
-	if (device->have_quorum[NOW] && drbd_data_accessible(device, NOW))
+	if (device->have_quorum[NOW] && drbd_data_accessible(device, NOW)) {
 		drbd_uuid_new_current(device, false);
+		clear_bit(NEW_CUR_UUID, &device->flags);
+	}
 }
 
 static void make_new_current_uuid(struct drbd_device *device)
 {
 	drbd_check_peers_new_current_uuid(device);
 
-	get_work_bits(1UL << NEW_CUR_UUID | 1UL << WRITING_NEW_CUR_UUID, &device->flags);
+	clear_bit(WRITING_NEW_CUR_UUID, &device->flags);
 	wake_up(&device->misc_wait);
 }
 
-- 
1.8.3.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
