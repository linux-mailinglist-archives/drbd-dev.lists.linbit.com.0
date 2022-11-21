Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075E632154
	for <lists+drbd-dev@lfdr.de>; Mon, 21 Nov 2022 12:53:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4D8F421743;
	Mon, 21 Nov 2022 12:53:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1041 seconds by postgrey-1.31 at mail19;
	Mon, 21 Nov 2022 12:30:43 CET
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 461C34202EC
	for <drbd-dev@lists.linbit.com>;
	Mon, 21 Nov 2022 12:30:43 +0100 (CET)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NG4Vg2RCMzHw0v;
	Mon, 21 Nov 2022 19:12:43 +0800 (CST)
Received: from dggpemm500015.china.huawei.com (7.185.36.181) by
	dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Mon, 21 Nov 2022 19:13:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500015.china.huawei.com
	(7.185.36.181) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31;
	Mon, 21 Nov 2022 19:13:17 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: 
Date: Mon, 21 Nov 2022 19:11:38 +0800
Message-ID: <20221121111138.3665586-1-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
	dggpemm500015.china.huawei.com (7.185.36.181)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 21 Nov 2022 12:53:19 +0100
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, liwei391@huawei.com,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: destroy workqueue when drbd device was
	freed
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

A submitter workqueue is dynamically allocated by init_submitter()
called by drbd_create_device(), we should destroy it when this
device was not needed or destroyed.

Fixes: 113fef9e20e0 ("drbd: prepare to queue write requests on a submit worker")
Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---
 drivers/block/drbd/drbd_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 8532b839a343..467c498e3add 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2218,6 +2218,9 @@ void drbd_destroy_device(struct kref *kref)
 		kfree(peer_device);
 	}
 	memset(device, 0xfd, sizeof(*device));
+
+	if (device->submit.wq)
+		destroy_workqueue(device->submit.wq);
 	kfree(device);
 	kref_put(&resource->kref, drbd_destroy_resource);
 }
@@ -2810,6 +2813,8 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	put_disk(disk);
 out_no_disk:
 	kref_put(&resource->kref, drbd_destroy_resource);
+	if (device->submit.wq)
+		destroy_workqueue(device->submit.wq);
 	kfree(device);
 	return err;
 }
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
