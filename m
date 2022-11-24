Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3F63702D
	for <lists+drbd-dev@lfdr.de>; Thu, 24 Nov 2022 03:00:36 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD7E742177C;
	Thu, 24 Nov 2022 03:00:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B3524422110
	for <drbd-dev@lists.linbit.com>;
	Thu, 24 Nov 2022 03:00:08 +0100 (CET)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NHh1t0zSszJnsm;
	Thu, 24 Nov 2022 09:56:50 +0800 (CST)
Received: from dggpemm500015.china.huawei.com (7.185.36.181) by
	dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Thu, 24 Nov 2022 10:00:02 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500015.china.huawei.com
	(7.185.36.181) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31;
	Thu, 24 Nov 2022 10:00:02 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: 
Date: Thu, 24 Nov 2022 09:58:17 +0800
Message-ID: <20221124015817.2729789-3-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124015817.2729789-1-bobo.shaobowang@huawei.com>
References: <20221124015817.2729789-1-bobo.shaobowang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
	dggpemm500015.china.huawei.com (7.185.36.181)
X-CFilter-Loop: Reflected
Cc: axboe@kernel.dk, bobo.shaobowang@huawei.com, linux-block@vger.kernel.org,
	lars.ellenberg@linbit.com, liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v4 2/2] drbd: destroy workqueue when drbd device
	was freed
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
device is not needed or destroyed.

Fixes: 113fef9e20e0 ("drbd: prepare to queue write requests on a submit worker")
Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---

v4:
  - solve conflict in applying patch [2/2] to for-6.2/block branch

v3:
   - add out_* label for destroy_workqueue().

 drivers/block/drbd/drbd_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index b4ae508abf49..e02db1dccab1 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2217,6 +2217,8 @@ void drbd_destroy_device(struct kref *kref)
 		kref_put(&peer_device->connection->kref, drbd_destroy_connection);
 		kfree(peer_device);
 	}
+	if (device->submit.wq)
+		destroy_workqueue(device->submit.wq);
 	kfree(device);
 	kref_put(&resource->kref, drbd_destroy_resource);
 }
@@ -2771,7 +2773,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	err = add_disk(disk);
 	if (err)
-		goto out_idr_remove_from_resource;
+		goto out_destroy_workqueue;
 
 	/* inherit the connection state */
 	device->state.conn = first_connection(resource)->cstate;
@@ -2785,6 +2787,8 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	drbd_debugfs_device_add(device);
 	return NO_ERROR;
 
+out_destroy_workqueue:
+	destroy_workqueue(device->submit.wq);
 out_idr_remove_from_resource:
 	for_each_connection(connection, resource) {
 		peer_device = idr_remove(&connection->peer_devices, vnr);
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
