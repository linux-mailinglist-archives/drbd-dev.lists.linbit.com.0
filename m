Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C74276CACC
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Aug 2023 12:24:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61CF74252E9;
	Wed,  2 Aug 2023 12:24:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1109 seconds by postgrey-1.31 at mail19;
	Tue, 01 Aug 2023 12:01:47 CEST
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A1C4D4201CC
	for <drbd-dev@lists.linbit.com>;
	Tue,  1 Aug 2023 12:01:47 +0200 (CEST)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFVVh2yz3zVjwJ;
	Tue,  1 Aug 2023 17:41:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
	(7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27;
	Tue, 1 Aug 2023 17:43:15 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <philipp.reisner@linbit.com>, <lars.ellenberg@linbit.com>,
	<christoph.boehmwalder@linbit.com>, <axboe@kernel.dk>,
	<drbd-dev@lists.linbit.com>, <linux-block@vger.kernel.org>
Date: Tue, 1 Aug 2023 17:42:45 +0800
Message-ID: <20230801094245.4145708-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
	dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Aug 2023 12:24:45 +0200
Cc: chenjiahao16@huawei.com
Subject: [Drbd-dev] [PATCH -next] drbd: Annotate RCU pointers as __rcu to
	fix sparse errors
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

This patch adds __rcu annotation to RCU protected pointers,
in order to fix following sparse errors:

drbd_state.c:1908:30: error: incompatible types in comparison expression
drbd_state.c:834:22: error: incompatible types in comparison expression
drbd_state.c:838:14: error: incompatible types in comparison expression
drbd_state.c:1064:22: error: incompatible types in comparison expression
drbd_state.c:2075:17: error: incompatible types in comparison expression
drbd_nl.c:454:33: error: incompatible types in comparison expression
drbd_nl.c:691:38: error: incompatible types in comparison expression
drbd_nl.c:983:18: error: incompatible types in comparison expression
drbd_nl.c:1285:22: error: incompatible types in comparison expression
drbd_nl.c:1577:17: error: incompatible types in comparison expression
drbd_nl.c:1587:17: error: incompatible types in comparison expression
drbd_nl.c:1812:14: error: incompatible types in comparison expression
drbd_nl.c:2072:39: error: incompatible types in comparison expression
drbd_nl.c:2080:13: error: incompatible types in comparison expression
drbd_nl.c:2265:50: error: incompatible types in comparison expression
drbd_nl.c:2288:45: error: incompatible types in comparison expression
drbd_nl.c:2433:9: error: incompatible types in comparison expression
drbd_nl.c:2596:9: error: incompatible types in comparison expression
drbd_nl.c:2829:18: error: incompatible types in comparison expression
drbd_nl.c:2869:17: error: incompatible types in comparison expression
drbd_nl.c:3407:33: error: incompatible types in comparison expression
drbd_nl.c:3532:28: error: incompatible types in comparison expression
drbd_nl.c:3745:29: error: incompatible types in comparison expression
drbd_nl.c:3751:22: error: incompatible types in comparison expression
drbd_nl.c:3941:38: error: incompatible types in comparison expression
...

Also, introducing rcu_assign_pointer() and rcu_dereference()
to properly use these RCU protected pointers.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/block/drbd/drbd_int.h   |  6 +++---
 drivers/block/drbd/drbd_nl.c    | 26 +++++++++++++-------------
 drivers/block/drbd/drbd_state.c |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index a30a5ed811be..f97020cd5052 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -526,7 +526,7 @@ struct drbd_backing_dev {
 	struct block_device *backing_bdev;
 	struct block_device *md_bdev;
 	struct drbd_md md;
-	struct disk_conf *disk_conf; /* RCU, for updates: resource->conf_update */
+	struct disk_conf __rcu *disk_conf; /* RCU, for updates: resource->conf_update */
 	sector_t known_size; /* last known size of that backing device */
 };
 
@@ -629,7 +629,7 @@ struct drbd_connection {
 	unsigned int connect_cnt;	/* Inc each time a connection is established */
 
 	unsigned long flags;
-	struct net_conf *net_conf;	/* content protected by rcu */
+	struct net_conf __rcu *net_conf;	/* content protected by rcu */
 	wait_queue_head_t ping_wait;	/* Woken upon reception of a ping, and a state change */
 
 	struct sockaddr_storage my_addr;
@@ -889,7 +889,7 @@ struct drbd_device {
 	int rs_last_events;  /* counter of read or write "events" (unit sectors)
 			      * on the lower level device when we last looked. */
 	int c_sync_rate; /* current resync rate after syncer throttle magic */
-	struct fifo_buffer *rs_plan_s; /* correction values of resync planer (RCU, connection->conn_update) */
+	struct fifo_buffer __rcu *rs_plan_s; /* correction values of resync planer (RCU, connection->conn_update) */
 	int rs_in_flight; /* resync sectors in flight (to proxy, in proxy and from proxy) */
 	atomic_t ap_in_flight; /* App sectors in flight (waiting for ack) */
 	unsigned int peer_max_bio_size;
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index cddae6f4b00f..a63f1b4aae5b 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -722,7 +722,7 @@ drbd_set_role(struct drbd_device *const device, enum drbd_role new_role, int for
 		}
 	} else {
 		mutex_lock(&device->resource->conf_update);
-		nc = connection->net_conf;
+		nc = rcu_dereference(connection->net_conf);
 		if (nc)
 			nc->discard_my_data = 0; /* without copy; single bit op is atomic */
 		mutex_unlock(&device->resource->conf_update);
@@ -1531,7 +1531,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	mutex_lock(&device->resource->conf_update);
-	old_disk_conf = device->ldev->disk_conf;
+	old_disk_conf = rcu_dereference(device->ldev->disk_conf);
 	*new_disk_conf = *old_disk_conf;
 	if (should_set_defaults(info))
 		set_disk_conf_defaults(new_disk_conf);
@@ -1552,7 +1552,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 		new_disk_conf->c_plan_ahead = DRBD_C_PLAN_AHEAD_MAX;
 
 	fifo_size = (new_disk_conf->c_plan_ahead * 10 * SLEEP_TIME) / HZ;
-	if (fifo_size != device->rs_plan_s->size) {
+	if (fifo_size != rcu_dereference(device->rs_plan_s)->size) {
 		new_plan = fifo_alloc(fifo_size);
 		if (!new_plan) {
 			drbd_err(device, "kmalloc of fifo_buffer failed");
@@ -1583,7 +1583,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 		goto fail_unlock;
 
 	if (new_plan) {
-		old_plan = device->rs_plan_s;
+		old_plan = rcu_dereference(device->rs_plan_s);
 		rcu_assign_pointer(device->rs_plan_s, new_plan);
 	}
 
@@ -1715,7 +1715,7 @@ void drbd_backing_dev_free(struct drbd_device *device, struct drbd_backing_dev *
 			  ldev->md_bdev != ldev->backing_bdev);
 	close_backing_dev(device, ldev->backing_bdev, device, true);
 
-	kfree(ldev->disk_conf);
+	kfree(rcu_dereference(ldev->disk_conf));
 	kfree(ldev);
 }
 
@@ -1784,7 +1784,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 		retcode = ERR_NOMEM;
 		goto fail;
 	}
-	nbc->disk_conf = new_disk_conf;
+	rcu_assign_pointer(nbc->disk_conf, new_disk_conf);
 
 	set_disk_conf_defaults(new_disk_conf);
 	err = disk_conf_from_attrs(new_disk_conf, info);
@@ -1934,10 +1934,10 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 
 	/* Prevent shrinking of consistent devices ! */
 	{
-	unsigned long long nsz = drbd_new_dev_size(device, nbc, nbc->disk_conf->disk_size, 0);
+	unsigned long long nsz = drbd_new_dev_size(device, nbc, rcu_dereference(nbc->disk_conf)->disk_size, 0);
 	unsigned long long eff = nbc->md.la_size_sect;
 	if (drbd_md_test_flag(nbc, MDF_CONSISTENT) && nsz < eff) {
-		if (nsz == nbc->disk_conf->disk_size) {
+		if (nsz == rcu_dereference(nbc->disk_conf)->disk_size) {
 			drbd_warn(device, "truncating a consistent device during attach (%llu < %llu)\n", nsz, eff);
 		} else {
 			drbd_warn(device, "refusing to truncate a consistent device (%llu < %llu)\n", nsz, eff);
@@ -1971,7 +1971,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	D_ASSERT(device, device->ldev == NULL);
 	device->ldev = nbc;
 	device->resync = resync_lru;
-	device->rs_plan_s = new_plan;
+	rcu_assign_pointer(device->rs_plan_s, new_plan);
 	nbc = NULL;
 	resync_lru = NULL;
 	new_disk_conf = NULL;
@@ -2130,7 +2130,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	conn_reconfig_done(connection);
 	if (nbc) {
 		close_backing_dev(device, nbc->md_bdev,
-			  nbc->disk_conf->meta_dev_idx < 0 ?
+			  rcu_dereference(nbc->disk_conf)->meta_dev_idx < 0 ?
 				(void *)device : (void *)drbd_m_holder,
 			  nbc->md_bdev != nbc->backing_bdev);
 		close_backing_dev(device, nbc->backing_bdev, device, true);
@@ -2389,7 +2389,7 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 
 	mutex_lock(&connection->data.mutex);
 	mutex_lock(&connection->resource->conf_update);
-	old_net_conf = connection->net_conf;
+	old_net_conf = rcu_dereference(connection->net_conf);
 
 	if (!old_net_conf) {
 		drbd_msg_put_info(adm_ctx.reply_skb, "net conf missing, try connect");
@@ -2587,7 +2587,7 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	drbd_flush_workqueue(&connection->sender_work);
 
 	mutex_lock(&adm_ctx.resource->conf_update);
-	old_net_conf = connection->net_conf;
+	old_net_conf = rcu_dereference(connection->net_conf);
 	if (old_net_conf) {
 		retcode = ERR_NET_CONFIGURED;
 		mutex_unlock(&adm_ctx.resource->conf_update);
@@ -2863,7 +2863,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 
 	if (new_disk_conf) {
 		mutex_lock(&device->resource->conf_update);
-		old_disk_conf = device->ldev->disk_conf;
+		old_disk_conf = rcu_dereference(device->ldev->disk_conf);
 		*new_disk_conf = *old_disk_conf;
 		new_disk_conf->disk_size = (sector_t)rs.resize_size;
 		rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index 287a8d1d3f70..e9fa2dfe0dd8 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -2069,7 +2069,7 @@ static int w_after_conn_state_ch(struct drbd_work *w, int unused)
 		mutex_unlock(&notification_mutex);
 
 		mutex_lock(&connection->resource->conf_update);
-		old_conf = connection->net_conf;
+		old_conf = rcu_dereference(connection->net_conf);
 		connection->my_addr_len = 0;
 		connection->peer_addr_len = 0;
 		RCU_INIT_POINTER(connection->net_conf, NULL);
-- 
2.34.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
