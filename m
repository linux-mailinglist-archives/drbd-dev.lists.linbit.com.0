Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id C023F9AA153
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Oct 2024 13:47:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA762420359;
	Tue, 22 Oct 2024 13:47:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Tue, 22 Oct 2024 13:46:58 CEST
Received: from mail-m24105.xmail.ntesmail.com (mail-m24105.xmail.ntesmail.com
	[45.195.24.105])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C837242006B
	for <drbd-dev@lists.linbit.com>; Tue, 22 Oct 2024 13:46:57 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5dbf355;
	Tue, 22 Oct 2024 19:41:52 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] drbd: Fix seq_num numeric conversion error
Date: Tue, 22 Oct 2024 19:41:51 +0800
Message-Id: <20241022114151.8050-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQx9IVk4fGR8YGBhIHU1PSlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lIQktDVUpLS1
	VKQlkG
X-HM-Tid: 0a92b4088c9e0230kunm5dbf355
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6FSo5EjcjDS8SGU8eGjIO
	Ey4aCkxVSlVKTElCTkJMSEpJTUJOVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUNJSDcG
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

seq_num is a 32-bit value and should not be converted with be64_to_cpu().

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_receiver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 4f0670f42..4d3ab28b3 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -2217,7 +2217,7 @@ static void p_req_detail_from_pi(struct drbd_connection *connection,
 
 	d->sector = be64_to_cpu(p->p_data.sector);
 	d->block_id = p->p_data.block_id;
-	d->peer_seq = be64_to_cpu(p->p_data.seq_num);
+	d->peer_seq = be32_to_cpu(p->p_data.seq_num);
 	d->dp_flags = be32_to_cpu(p->p_data.dp_flags);
 	d->length = pi->size;
 	d->bi_size = is_trim_or_zeroes ? be32_to_cpu(p->size) : pi->size - digest_size;
-- 
2.17.1

