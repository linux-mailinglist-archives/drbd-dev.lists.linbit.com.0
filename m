Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC06333B1
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 04:06:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0CE1542066F;
	Tue, 22 Nov 2022 04:06:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00C694203A1
	for <drbd-dev@lists.linbit.com>;
	Tue, 22 Nov 2022 04:06:10 +0100 (CET)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NGTfD1tbdz15Mbh;
	Tue, 22 Nov 2022 11:05:40 +0800 (CST)
Received: from dggpemm500015.china.huawei.com (7.185.36.181) by
	dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Tue, 22 Nov 2022 11:06:09 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500015.china.huawei.com
	(7.185.36.181) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31;
	Tue, 22 Nov 2022 11:06:08 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: 
Date: Tue, 22 Nov 2022 11:04:26 +0800
Message-ID: <20221122030427.731308-2-bobo.shaobowang@huawei.com>
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
Subject: [Drbd-dev] [PATCH v2 1/2] drbd: remove call to memset before free
	device/resource/connection
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

This revert c2258ffc56f2 ("drbd: poison free'd device, resource and
connection structs"), add memset is odd here for debugging, there are
some methods to accurately show what happened, such as kdump.

Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---
 drivers/block/drbd/drbd_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 8532b839a343..78cae4e75af1 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2217,7 +2217,6 @@ void drbd_destroy_device(struct kref *kref)
 		kref_put(&peer_device->connection->kref, drbd_destroy_connection);
 		kfree(peer_device);
 	}
-	memset(device, 0xfd, sizeof(*device));
 	kfree(device);
 	kref_put(&resource->kref, drbd_destroy_resource);
 }
@@ -2309,7 +2308,6 @@ void drbd_destroy_resource(struct kref *kref)
 	idr_destroy(&resource->devices);
 	free_cpumask_var(resource->cpu_mask);
 	kfree(resource->name);
-	memset(resource, 0xf2, sizeof(*resource));
 	kfree(resource);
 }
 
@@ -2650,7 +2648,6 @@ void drbd_destroy_connection(struct kref *kref)
 	drbd_free_socket(&connection->data);
 	kfree(connection->int_dig_in);
 	kfree(connection->int_dig_vv);
-	memset(connection, 0xfc, sizeof(*connection));
 	kfree(connection);
 	kref_put(&resource->kref, drbd_destroy_resource);
 }
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
