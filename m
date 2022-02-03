Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9A4A7F42
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Feb 2022 07:21:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BB2594201FA;
	Thu,  3 Feb 2022 07:21:44 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Thu, 03 Feb 2022 04:35:39 CET
Received: from out30-132.freemail.mail.aliyun.com
	(out30-132.freemail.mail.aliyun.com [115.124.30.132])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A732420181
	for <drbd-dev@lists.linbit.com>; Thu,  3 Feb 2022 04:35:38 +0100 (CET)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
	TI=SMTPD_---0V3Tur6c_1643859034; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
	fp:SMTPD_---0V3Tur6c_1643859034) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 03 Feb 2022 11:30:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: axboe@kernel.dk
Date: Thu,  3 Feb 2022 11:30:33 +0800
Message-Id: <20220203033033.52214-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Feb 2022 07:21:42 +0100
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
	philipp.reisner@linbit.com, linux-block@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH -next] mm/fs: fix boolreturn.cocci warning
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

Return statement in function returning bool should use true/false
instead of 1/0.

Eliminate the following coccicheck warning:
./drivers/block/drbd/drbd_req.c:912:9-10: WARNING: return of 0/1 in
function 'remote_due_to_read_balancing' with return type bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/block/drbd/drbd_req.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 2e5fb7e442e3..c8448379bbcd 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -909,7 +909,7 @@ static bool remote_due_to_read_balancing(struct drbd_device *device, sector_t se
 
 	switch (rbm) {
 	case RB_CONGESTED_REMOTE:
-		return 0;
+		return false;
 	case RB_LEAST_PENDING:
 		return atomic_read(&device->local_cnt) >
 			atomic_read(&device->ap_pending_cnt) + atomic_read(&device->rs_pending_cnt);
-- 
2.20.1.7.g153144c

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
