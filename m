Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5055559C
	for <lists+drbd-dev@lfdr.de>; Wed, 22 Jun 2022 22:58:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CAA89420621;
	Wed, 22 Jun 2022 22:58:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F373442060F
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 18:05:12 +0200 (CEST)
X-QQ-mid: bizesmtp66t1655913147t3a158w9
Received: from ubuntu.localdomain ( [106.117.78.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 23:52:22 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000E00A0000000
X-QQ-FEAT: F3yR32iATbiPoMYvaDYTFsBZP9QS13DHRUXxAF9nw2AecPV51DVC2kmloL/tk
	2mNTwzMeXCZZ1SGC0+j0lExTrDTnubodTIzsw7t/2xgMnCj+mc7Fnvt+JPvh26zQYou9GQ9
	0/BAqjpdfuvmkVwry71ZqbJpH636cOkrUwN9nQt2q49m0il6X/C2BaQQhhVc4j4TXjfzxlk
	EvuXFFSjG2N7yeN6SSziicY4/yaosBlzJxmLNb1Qhg/f5RJsluE+lzbP+THkyVYGGsNNXkF
	otiu1Gk8cA66+padPxGLebmT9OuKratvx95tMPZy1/qjN6qRGTU+XYYZSHARkLSRQ2Bl1+U
	RhBgot9y9W9zx+hbpgHZpPb9Qf9GOcvT8w8o4hR
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: axboe@kernel.dk
Date: Wed, 22 Jun 2022 23:52:20 +0800
Message-Id: <20220622155220.8704-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Mailman-Approved-At: Wed, 22 Jun 2022 22:58:16 +0200
Cc: philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Jiang Jian <jiangjian@cdjrlc.com>,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] block: drbd: drbd_state: Fix typo in comments
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

Replace 'is' with 'it'

file: drivers/block/drbd/drbd_state.c
line: 1900

* But is is still not save to dreference ldev here, since

changed to:

* But it is still not save to dreference ldev here, since

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/block/drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index 3f7bf9f2d874..99927c44f0c3 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1897,7 +1897,7 @@ static void after_state_ch(struct drbd_device *device, union drbd_state os,
 		int was_io_error = 0;
 		/* corresponding get_ldev was in _drbd_set_state, to serialize
 		 * our cleanup here with the transition to D_DISKLESS.
-		 * But is is still not save to dreference ldev here, since
+		 * But it is still not save to dreference ldev here, since
 		 * we might come from an failed Attach before ldev was set. */
 		if (device->ldev) {
 			rcu_read_lock();
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
