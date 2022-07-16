Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 26119579D03
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jul 2022 14:46:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B961F4206B6;
	Tue, 19 Jul 2022 14:46:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 377 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jul 2022 14:24:07 CEST
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 54EAA4202B8
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jul 2022 14:24:07 +0200 (CEST)
X-QQ-mid: bizesmtp84t1658232992tcyg0vfy
Received: from localhost.localdomain ( [171.223.96.21])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Jul 2022 20:16:30 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000020
X-QQ-FEAT: 4rCmCcmdMHdi35qznvqNxxvnEWdSiRmmST1u+A2o6peXFM/RSPwShRDt80gHA
	y5DVAxaORbKKdxdxy0RXOWPAkhqBXotrr90r8Qf4Fi65bbCAqQWvR+03tN+lHkZi7TSZNv9
	YoX+BR/arF0CSkVM85USAgAIDuf0wu4iiLQdvhsq4Ocr/CJpCJofS+HLnDok5GJZIB1rDqi
	J6rFXe2FhiUBBzfDsiDdyKVIREWrAb0bSisepF97ZleNonM52r0awyxf0NnR5e1YOOBqY1N
	v3oRZHhM6xhmec09WOtHr94pWHAVP9DKk/Ty1NJKxSCEDjcfjcqjrQSma+V3qWnFgCzR5Sl
	y6VHSuQJNuBjinDlb9d4ay4X9oLx2CXW8D7CFc8MQzb1KZKp3V2Y1HdEIWxfmHri3jJ+1RU
	4xvtfeMJsrs=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: axboe@kernel.dk
Date: Sat, 16 Jul 2022 12:14:34 +0800
Message-Id: <20220716041434.33148-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Tue, 19 Jul 2022 14:46:53 +0200
Cc: philipp.reisner@linbit.com, Jason Wang <wangborong@cdjrlc.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] block/drbd: Fix comment typo
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

The double `and' is duplicated in line 89, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/block/drbd/drbd_bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 7d9db33363de..736416186c2f 100644
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
2.35.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
