Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C8576355682
	for <lists+drbd-dev@lfdr.de>; Tue,  6 Apr 2021 16:22:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A12CB4205F5;
	Tue,  6 Apr 2021 16:22:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1201 seconds by postgrey-1.31 at mail19;
	Tue, 06 Apr 2021 14:30:04 CEST
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A4E84205DE
	for <drbd-dev@lists.linbit.com>;
	Tue,  6 Apr 2021 14:30:04 +0200 (CEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FF5qm1W9BzPnmF;
	Tue,  6 Apr 2021 20:07:16 +0800 (CST)
Received: from mdc.localdomain (10.175.104.57) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.498.0; Tue, 6 Apr 2021 20:09:54 +0800
From: Huang Guobin <huangguobin4@huawei.com>
To: <huangguobin4@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
Date: Tue, 6 Apr 2021 20:09:48 +0800
Message-ID: <1617710988-49205-1-git-send-email-huangguobin4@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 06 Apr 2021 16:22:06 +0200
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH -next] drbd: use DEFINE_SPINLOCK() for spinlock
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

From: Guobin Huang <huangguobin4@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Guobin Huang <huangguobin4@huawei.com>
---
 drivers/block/drbd/drbd_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 25cd8a2f729d..d8605159240b 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -125,7 +125,7 @@ struct bio_set drbd_io_bio_set;
 	 member of struct page.
  */
 struct page *drbd_pp_pool;
-spinlock_t   drbd_pp_lock;
+DEFINE_SPINLOCK(drbd_pp_lock);
 int          drbd_pp_vacant;
 wait_queue_head_t drbd_pp_wait;
 
@@ -2161,9 +2161,6 @@ static int drbd_create_mempools(void)
 	if (ret)
 		goto Enomem;
 
-	/* drbd's page pool */
-	spin_lock_init(&drbd_pp_lock);
-
 	for (i = 0; i < number; i++) {
 		page = alloc_page(GFP_HIGHUSER);
 		if (!page)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
