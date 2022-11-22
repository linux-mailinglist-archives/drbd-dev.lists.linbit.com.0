Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3136333B5
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 04:06:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E096421742;
	Tue, 22 Nov 2022 04:06:42 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 031814203D5
	for <drbd-dev@lists.linbit.com>;
	Tue, 22 Nov 2022 04:06:10 +0100 (CET)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NGTfD559Rz15Ml8;
	Tue, 22 Nov 2022 11:05:40 +0800 (CST)
Received: from dggpemm500015.china.huawei.com (7.185.36.181) by
	dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Tue, 22 Nov 2022 11:06:09 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500015.china.huawei.com
	(7.185.36.181) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31;
	Tue, 22 Nov 2022 11:06:09 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: 
Date: Tue, 22 Nov 2022 11:04:27 +0800
Message-ID: <20221122030427.731308-3-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122030427.731308-1-bobo.shaobowang@huawei.com>
References: <20221122030427.731308-1-bobo.shaobowang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
	dggpemm500015.china.huawei.com (7.185.36.181)
X-CFilter-Loop: Reflected
Cc: axboe@kernel.dk, bobo.shaobowang@huawei.com, linux-block@vger.kernel.org,
	lars.ellenberg@linbit.com, liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 2/2] drbd: destroy workqueue when drbd device
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
 drivers/block/drbd/drbd_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 78cae4e75af1..2d6b6d1c5ff4 100644
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
@@ -2807,6 +2809,8 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
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
