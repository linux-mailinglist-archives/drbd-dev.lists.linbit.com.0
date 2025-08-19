Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB29B2B8FE
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Aug 2025 07:55:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D6C916271A;
	Tue, 19 Aug 2025 07:55:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Tue, 19 Aug 2025 07:55:08 CEST
Received: from mail-m15598.qiye.163.com (mail-m15598.qiye.163.com
	[101.71.155.98])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D2C08162251
	for <drbd-dev@lists.linbit.com>; Tue, 19 Aug 2025 07:55:07 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id ed8f6733;
	Tue, 19 Aug 2025 13:50:00 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] drbd: Fix the seq_num conversion error in got_OVResult()
Date: Tue, 19 Aug 2025 13:49:59 +0800
Message-ID: <20250819054959.1168661-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98c0e094620231kunm5e4e508e97dc21
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQhpOVkkaSB8ZGEhPSh4aH1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
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

In the got_OVResult function, seq_num was converted twice by the be32_to_cpu,
which led to an abnormal value of peer_device->peer_seq.
Any subsequent use peer_device->peer_seq would result in an error.

For example, we encounter the follow error:
xxx: Timed out waiting for missing ack packets; disconnecting

So, we remove the second erroneous be32_to_cpu conversion.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_receiver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index fdb6eb458..21bc84c5b 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -10743,7 +10743,7 @@ static int got_OVResult(struct drbd_connection *connection, struct packet_info *
 		result = be32_to_cpu(p->result);
 	}
 
-	update_peer_seq(peer_device, be32_to_cpu(seq_num));
+	update_peer_seq(peer_device, seq_num);
 
 	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_OV_READ_TARGET),
 			sector, size, block_id);
-- 
2.43.0

