Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D8E7D48CA
	for <lists+drbd-dev@lfdr.de>; Tue, 24 Oct 2023 09:41:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E088420239;
	Tue, 24 Oct 2023 09:41:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Mon, 23 Oct 2023 08:42:28 CEST
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 701174201C5
	for <drbd-dev@lists.linbit.com>; Mon, 23 Oct 2023 08:42:27 +0200 (CEST)
X-UUID: 21920e6397694984822899e3834b1105-20231023
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:dc5d4585-ad3a-4482-9932-278215af4edb, IP:20,
	URL:0, TC:0, Content:-5, EDM:25, RT:0, SF:-15, FILE:0, BULK:0,
	RULE:Release_Ham, AC TION:release,TS:25
X-CID-INFO: VERSION:1.1.32, REQID:dc5d4585-ad3a-4482-9932-278215af4edb, IP:20,
	UR L:0, TC:0, Content:-5, EDM:25, RT:0, SF:-15, FILE:0, BULK:0,
	RULE:Release_Ham, ACTI ON:release,TS:25
X-CID-META: VersionHash:5f78ec9, CLOUDID:7de1087d-ccd9-4df5-91ce-9df5fea3ae01,
	B ulkID:231023142837SMUKN4XO, BulkQuantity:1, Recheck:0,
	SF:17|19|44|66|38|24|1
	02, TC:nil, Content:0, EDM:5, IP:-2, URL:0, File:nil, Bulk:40, QS:nil,
	BEC:nil, COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 21920e6397694984822899e3834b1105-20231023
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.171)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 373002410; Mon, 23 Oct 2023 14:31:58 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, axboe@kernel.dk
Date: Mon, 23 Oct 2023 14:31:55 +0800
Message-Id: <20231023063155.719469-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Oct 2023 09:41:06 +0200
Cc: linux-block@vger.kernel.org, kunwu.chan@hotmail.com,
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: Spelling fix in comment
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

protocoll -> protocol

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/block/drbd/drbd_req.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 380e6584a4ee..60e6e016829e 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1745,7 +1745,7 @@ void request_timer_fn(struct timer_list *t)
 	 * but which is still waiting for an ACK. */
 	req_peer = connection->req_ack_pending;
 
-	/* if we don't have such request (e.g. protocoll A)
+	/* if we don't have such request (e.g. protocol A)
 	 * check the oldest requests which is still waiting on its epoch
 	 * closing barrier ack. */
 	if (!req_peer)
-- 
2.34.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
