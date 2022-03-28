Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001F4E8D73
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Mar 2022 07:07:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F0388420600;
	Mon, 28 Mar 2022 07:07:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 317 seconds by postgrey-1.31 at mail19;
	Mon, 28 Mar 2022 04:59:29 CEST
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8158E42034F
	for <drbd-dev@lists.linbit.com>; Mon, 28 Mar 2022 04:59:29 +0200 (CEST)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
	(172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0;
	Mon, 28 Mar 2022 10:54:12 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
	(172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14;
	Mon, 28 Mar 2022 10:54:10 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <philipp.reisner@linbit.com>, <lars.ellenberg@linbit.com>,
	<axboe@kernel.dk>
Date: Mon, 28 Mar 2022 10:54:09 +0800
Message-ID: <1648436049-4335-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-125.meizu.com (172.16.1.125) To
	IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Mon, 28 Mar 2022 07:07:25 +0200
Cc: linux-block@vger.kernel.org, Haowen Bai <baihaowen@meizu.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: Return true/false (not 1/0) from bool
	functions
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

Return boolean values ("true" or "false") instead of 1 or 0 from bool
functions.  This fixes the following warnings from coccicheck:

./drivers/block/drbd/drbd_req.c:912:9-10: WARNING: return of 0/1 in
function 'remote_due_to_read_balancing' with return type bool

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/block/drbd/drbd_req.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index c043945..171905a 100644
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
2.7.4

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
