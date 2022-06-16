Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 058AA550F6E
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jun 2022 06:33:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB831420643;
	Mon, 20 Jun 2022 06:33:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 438 seconds by postgrey-1.31 at mail19;
	Thu, 16 Jun 2022 16:42:11 CEST
Received: from smtpbg.qq.com (smtpbg123.qq.com [175.27.65.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 870E14201D9
	for <drbd-dev@lists.linbit.com>; Thu, 16 Jun 2022 16:42:11 +0200 (CEST)
X-QQ-mid: bizesmtp81t1655389959t3qlb9eq
Received: from localhost.localdomain ( [153.0.97.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Jun 2022 22:32:35 +0800 (CST)
X-QQ-SSF: 01000000003000D0I000B00A0000000
X-QQ-FEAT: Lg5IqoGaTUjbL3PLubDSpHKxYIBIqmoLpF7UXENKR/1iBB8hXmAN+cf7h3TS/
	OeAqv0rj6e4J0JKyGqkzxSY2aNXDlXkZ1B5Y5OT6c6RETSBFI5LjQIYQAV1Oe6Spp/KACY2
	vf07GiwvhPWn2RDeYqCsenUR/cknqgs/m+vMdfgi4bGXB92hSGR4IIncxQ8GFbAPImJ6vHH
	HxHj8jCYFxyqNyszMObqHi4W4MfXPVrqOPUov3xnnnlD3VULvb6m/M7MES+qokod2KIw/Cq
	fHyabLHxRLRHytdtVukGtS0jxH2vG+bG3/Xj0vEwHdz1Ssc+lQeLh9AV5yTLCXqP538ztBd
	DpkLFJWFhLAWRb2qKw0Bk5csEYkrw==
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: axboe@kernel.dk
Date: Thu, 16 Jun 2022 22:32:27 +0800
Message-Id: <20220616143227.4004-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
X-Mailman-Approved-At: Mon, 20 Jun 2022 06:33:52 +0200
Cc: Xiang wangx <wangxiang@cdjrlc.com>, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: Fix typo in comment
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

Delete the redundant word 'and'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/block/drbd/drbd_bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 9e060e49b3f8..8afdde400e37 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -86,7 +86,7 @@ struct drbd_bitmap {
 
 	/* exclusively to be used by __al_write_transaction(),
 	 * drbd_bm_mark_for_writeout() and
-	 * and drbd_bm_write_hinted() -> bm_rw() called from there.
+	 * drbd_bm_write_hinted() -> bm_rw() called from there.
 	 */
 	unsigned int n_bitmap_hints;
 	unsigned int al_bitmap_hints[AL_UPDATES_PER_TRANSACTION];
-- 
2.36.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
