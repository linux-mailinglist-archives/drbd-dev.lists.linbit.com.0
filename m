Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26F3A18EF
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Jun 2021 17:15:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1DDB142061D;
	Wed,  9 Jun 2021 17:15:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1127 seconds by postgrey-1.31 at mail19;
	Wed, 09 Jun 2021 14:33:26 CEST
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69E40420333
	for <drbd-dev@lists.linbit.com>;
	Wed,  9 Jun 2021 14:33:26 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G0Qv74T9Sz6w1W;
	Wed,  9 Jun 2021 20:11:31 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
	dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2176.2; Wed, 9 Jun 2021 20:14:35 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
	dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2176.2; Wed, 9 Jun 2021 20:14:35 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg
	<lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>, drbd-dev
	<drbd-dev@lists.linbit.com>, linux-block <linux-block@vger.kernel.org>
Date: Wed, 9 Jun 2021 20:14:26 +0800
Message-ID: <20210609121426.13936-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
	dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Jun 2021 17:15:37 +0200
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [Drbd-dev] [PATCH 1/1] drbd: remove unnecessary oom message
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

Fixes scripts/checkpatch.pl warning:
WARNING: Possible unnecessary 'out of memory' message

Remove it can help us save a bit of memory.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/block/drbd/drbd_receiver.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 69284ebba786..1f740e42e457 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3770,10 +3770,8 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 	}
 
 	new_net_conf = kmalloc(sizeof(struct net_conf), GFP_KERNEL);
-	if (!new_net_conf) {
-		drbd_err(connection, "Allocation of new net_conf failed\n");
+	if (!new_net_conf)
 		goto disconnect;
-	}
 
 	mutex_lock(&connection->data.mutex);
 	mutex_lock(&connection->resource->conf_update);
@@ -4020,10 +4018,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 
 		if (verify_tfm || csums_tfm) {
 			new_net_conf = kzalloc(sizeof(struct net_conf), GFP_KERNEL);
-			if (!new_net_conf) {
-				drbd_err(device, "Allocation of new net_conf failed\n");
+			if (!new_net_conf)
 				goto disconnect;
-			}
 
 			*new_net_conf = *old_net_conf;
 
@@ -4161,7 +4157,6 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 
 			new_disk_conf = kzalloc(sizeof(struct disk_conf), GFP_KERNEL);
 			if (!new_disk_conf) {
-				drbd_err(device, "Allocation of new disk_conf failed\n");
 				put_ldev(device);
 				return -ENOMEM;
 			}
@@ -4288,10 +4283,8 @@ static int receive_uuids(struct drbd_connection *connection, struct packet_info
 	device = peer_device->device;
 
 	p_uuid = kmalloc_array(UI_EXTENDED_SIZE, sizeof(*p_uuid), GFP_NOIO);
-	if (!p_uuid) {
-		drbd_err(device, "kmalloc of p_uuid failed\n");
+	if (!p_uuid)
 		return false;
-	}
 
 	for (i = UI_CURRENT; i < UI_EXTENDED_SIZE; i++)
 		p_uuid[i] = be64_to_cpu(p->uuid[i]);
@@ -5484,8 +5477,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	}
 
 	peers_ch = kmalloc(pi.size, GFP_NOIO);
-	if (peers_ch == NULL) {
-		drbd_err(connection, "kmalloc of peers_ch failed\n");
+	if (!peers_ch) {
 		rv = -1;
 		goto fail;
 	}
@@ -5504,8 +5496,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 
 	resp_size = crypto_shash_digestsize(connection->cram_hmac_tfm);
 	response = kmalloc(resp_size, GFP_NOIO);
-	if (response == NULL) {
-		drbd_err(connection, "kmalloc of response failed\n");
+	if (!response) {
 		rv = -1;
 		goto fail;
 	}
@@ -5552,8 +5543,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	}
 
 	right_response = kmalloc(resp_size, GFP_NOIO);
-	if (right_response == NULL) {
-		drbd_err(connection, "kmalloc of right_response failed\n");
+	if (!right_response) {
 		rv = -1;
 		goto fail;
 	}
-- 
2.25.1


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
