Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86C5BD9B5
	for <lists+drbd-dev@lfdr.de>; Tue, 20 Sep 2022 03:53:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1219E420667;
	Tue, 20 Sep 2022 03:53:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 930F84203D5
	for <drbd-dev@lists.linbit.com>;
	Tue, 20 Sep 2022 03:52:19 +0200 (CEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MWkvw3J1xz14QgZ;
	Tue, 20 Sep 2022 09:48:12 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
	kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Tue, 20 Sep 2022 09:52:17 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <philipp.reisner@linbit.com>, <lars.ellenberg@linbit.com>,
	<christoph.boehmwalder@linbit.com>, <axboe@kernel.dk>,
	<cuigaosheng1@huawei.com>
Date: Tue, 20 Sep 2022 09:52:15 +0800
Message-ID: <20220920015216.782190-2-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920015216.782190-1-cuigaosheng1@huawei.com>
References: <20220920015216.782190-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
	kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/2] drbd: remove orphan _req_may_be_done()
	declaration
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

The _req_may_be_done() has been removed by
commit 6870ca6d463e ("drbd: factor out master_bio completion
and drbd_request destruction paths"), so remove the orphan
declaration.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/block/drbd/drbd_req.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_req.h b/drivers/block/drbd/drbd_req.h
index 511f39a08de4..6237fa1dcb0e 100644
--- a/drivers/block/drbd/drbd_req.h
+++ b/drivers/block/drbd/drbd_req.h
@@ -266,8 +266,6 @@ struct bio_and_error {
 
 extern void start_new_tl_epoch(struct drbd_connection *connection);
 extern void drbd_req_destroy(struct kref *kref);
-extern void _req_may_be_done(struct drbd_request *req,
-		struct bio_and_error *m);
 extern int __req_mod(struct drbd_request *req, enum drbd_req_event what,
 		struct bio_and_error *m);
 extern void complete_master_bio(struct drbd_device *device,
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
