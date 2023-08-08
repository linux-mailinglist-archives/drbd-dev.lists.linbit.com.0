Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6329D773956
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Aug 2023 11:26:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BD7DB42066F;
	Tue,  8 Aug 2023 11:26:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1140 seconds by postgrey-1.31 at mail19;
	Tue, 08 Aug 2023 11:20:47 CEST
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD37242019F
	for <drbd-dev@lists.linbit.com>;
	Tue,  8 Aug 2023 11:20:47 +0200 (CEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RKnDH2VS5z1hwGD;
	Tue,  8 Aug 2023 16:58:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
	(7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27;
	Tue, 8 Aug 2023 17:01:43 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <linux-block@vger.kernel.org>, <drbd-dev@lists.linbit.com>, Philipp
	Reisner <philipp.reisner@linbit.com>, Lars Ellenberg
	<lars.ellenberg@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Date: Tue, 8 Aug 2023 17:01:11 +0800
Message-ID: <20230808090111.2420717-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
	kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Aug 2023 11:26:55 +0200
Cc: ruanjinjie@huawei.com
Subject: [Drbd-dev] [PATCH -next] drbd: Use helper put_drbd_dev() and
	get_drbd_dev()
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

The drbd_destroy_device() arg of this code is already duplicated
18 times, use helper function put_drbd_dev() to release drbd_device
and related resources instead of open coding it to help improve
code readability a bit.

And add get_drbd_dev() helper function to be symmetrical with it.

No functional change involved.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/block/drbd/drbd_debugfs.c  |  2 +-
 drivers/block/drbd/drbd_int.h      | 10 ++++++++++
 drivers/block/drbd/drbd_main.c     | 18 +++++++++---------
 drivers/block/drbd/drbd_nl.c       |  4 ++--
 drivers/block/drbd/drbd_receiver.c | 24 ++++++++++++------------
 drivers/block/drbd/drbd_state.c    |  4 ++--
 drivers/block/drbd/drbd_worker.c   | 12 ++++++------
 7 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/drbd_debugfs.c
index 12460b584bcb..8f681be85460 100644
--- a/drivers/block/drbd/drbd_debugfs.c
+++ b/drivers/block/drbd/drbd_debugfs.c
@@ -751,7 +751,7 @@ static int device_ ## name ## _open(struct inode *inode, struct file *file)	\
 static int device_ ## name ## _release(struct inode *inode, struct file *file)	\
 {										\
 	struct drbd_device *device = inode->i_private;				\
-	kref_put(&device->kref, drbd_destroy_device);				\
+	put_drbd_dev(device);							\
 	return single_release(inode, file);					\
 }										\
 static const struct file_operations device_ ## name ## _fops = {		\
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index a30a5ed811be..052a86240711 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1372,6 +1372,16 @@ extern enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx
 extern void drbd_destroy_device(struct kref *kref);
 extern void drbd_delete_device(struct drbd_device *device);
 
+static inline void get_drbd_dev(struct drbd_device *dev)
+{
+	kref_get(&dev->kref);
+}
+
+static inline void put_drbd_dev(struct drbd_device *dev)
+{
+	kref_put(&dev->kref, drbd_destroy_device);
+}
+
 extern struct drbd_resource *drbd_create_resource(const char *name);
 extern void drbd_free_resource(struct drbd_resource *resource);
 
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 79ab532aabaf..a7c619afecec 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2746,7 +2746,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 			err = ERR_MINOR_OR_VOLUME_EXISTS;
 		goto out_no_minor_idr;
 	}
-	kref_get(&device->kref);
+	get_drbd_dev(device);
 
 	id = idr_alloc(&resource->devices, device, vnr, vnr + 1, GFP_KERNEL);
 	if (id < 0) {
@@ -2754,7 +2754,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 			err = ERR_MINOR_OR_VOLUME_EXISTS;
 		goto out_idr_remove_minor;
 	}
-	kref_get(&device->kref);
+	get_drbd_dev(device);
 
 	INIT_LIST_HEAD(&device->peer_devices);
 	INIT_LIST_HEAD(&device->pending_bitmap_io);
@@ -2766,7 +2766,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 		peer_device->device = device;
 
 		list_add(&peer_device->peer_devices, &device->peer_devices);
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 
 		id = idr_alloc(&connection->peer_devices, peer_device, vnr, vnr + 1, GFP_KERNEL);
 		if (id < 0) {
@@ -2839,15 +2839,15 @@ void drbd_delete_device(struct drbd_device *device)
 	drbd_debugfs_device_cleanup(device);
 	for_each_connection(connection, resource) {
 		idr_remove(&connection->peer_devices, device->vnr);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 	}
 	idr_remove(&resource->devices, device->vnr);
-	kref_put(&device->kref, drbd_destroy_device);
+	put_drbd_dev(device);
 	idr_remove(&drbd_devices, device_to_minor(device));
-	kref_put(&device->kref, drbd_destroy_device);
+	put_drbd_dev(device);
 	del_gendisk(device->vdisk);
 	synchronize_rcu();
-	kref_put(&device->kref, drbd_destroy_device);
+	put_drbd_dev(device);
 }
 
 static int __init drbd_init(void)
@@ -2959,10 +2959,10 @@ void conn_md_sync(struct drbd_connection *connection)
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
 
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 		drbd_md_sync(device);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index cddae6f4b00f..294b0b138e7d 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -228,7 +228,7 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	 * But we may explicitly drop it/retake it in drbd_adm_set_role(),
 	 * so make sure this object stays around. */
 	if (adm_ctx->device)
-		kref_get(&adm_ctx->device->kref);
+		get_drbd_dev(adm_ctx->device);
 
 	if (adm_ctx->resource_name) {
 		adm_ctx->resource = drbd_find_resource(adm_ctx->resource_name);
@@ -304,7 +304,7 @@ static int drbd_adm_finish(struct drbd_config_context *adm_ctx,
 	struct genl_info *info, int retcode)
 {
 	if (adm_ctx->device) {
-		kref_put(&adm_ctx->device->kref, drbd_destroy_device);
+		put_drbd_dev(adm_ctx->device);
 		adm_ctx->device = NULL;
 	}
 	if (adm_ctx->connection) {
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 0c9f54197768..101d81cd4db1 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -230,10 +230,10 @@ static void conn_reclaim_net_peer_reqs(struct drbd_connection *connection)
 		if (!atomic_read(&device->pp_in_use_by_net))
 			continue;
 
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 		drbd_reclaim_net_peer_reqs(device);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
@@ -1105,7 +1105,7 @@ static int conn_connect(struct drbd_connection *connection)
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 
 		if (discard_my_data)
@@ -1114,7 +1114,7 @@ static int conn_connect(struct drbd_connection *connection)
 			clear_bit(DISCARD_MY_DATA, &device->flags);
 
 		drbd_connected(peer_device);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
@@ -1273,7 +1273,7 @@ static void one_flush_endio(struct bio *bio)
 
 	clear_bit(FLUSH_PENDING, &device->flags);
 	put_ldev(device);
-	kref_put(&device->kref, drbd_destroy_device);
+	put_drbd_dev(device);
 
 	if (atomic_dec_and_test(&ctx->pending))
 		complete(&ctx->done);
@@ -1294,7 +1294,7 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 
 		ctx->error = -ENOMEM;
 		put_ldev(device);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		return;
 	}
 
@@ -1326,7 +1326,7 @@ static void drbd_flush(struct drbd_connection *connection)
 
 			if (!get_ldev(device))
 				continue;
-			kref_get(&device->kref);
+			get_drbd_dev(device);
 			rcu_read_unlock();
 
 			submit_one_flush(device, &ctx);
@@ -1746,10 +1746,10 @@ static void conn_wait_active_ee_empty(struct drbd_connection *connection)
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
 
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 		drbd_wait_ee_list_empty(device, &device->active_ee);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
@@ -5129,10 +5129,10 @@ static void conn_disconnect(struct drbd_connection *connection)
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 		drbd_disconnected(peer_device);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
@@ -6112,7 +6112,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 		tcp_sock_set_cork(connection->meta.socket->sk, true);
 
 	err = drbd_finish_peer_reqs(device);
-	kref_put(&device->kref, drbd_destroy_device);
+	put_drbd_dev(device);
 	/* get is in drbd_endio_write_sec_final(). That is necessary to keep the
 	   struct work_struct send_acks_work alive, which is in the peer_device object */
 
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index 287a8d1d3f70..c2fe43d80a29 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -122,7 +122,7 @@ struct drbd_state_change *remember_old_state(struct drbd_resource *resource, gfp
 	device_state_change = state_change->devices;
 	peer_device_state_change = state_change->peer_devices;
 	idr_for_each_entry(&resource->devices, device, vnr) {
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		device_state_change->device = device;
 		device_state_change->disk_state[OLD] = device->state.disk;
 
@@ -264,7 +264,7 @@ void forget_state_change(struct drbd_state_change *state_change)
 		struct drbd_device *device = state_change->devices[n].device;
 
 		if (device)
-			kref_put(&device->kref, drbd_destroy_device);
+			put_drbd_dev(device);
 	}
 	for (n = 0; n < state_change->n_connections; n++) {
 		struct drbd_connection *connection =
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 4352a50fbb3f..10d074885ea4 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -147,9 +147,9 @@ void drbd_endio_write_sec_final(struct drbd_peer_request *peer_req) __releases(l
 		__drbd_chk_io_error(device, DRBD_WRITE_ERROR);
 
 	if (connection->cstate >= C_WF_REPORT_PARAMS) {
-		kref_get(&device->kref); /* put is in drbd_send_acks_wf() */
+		get_drbd_dev(device); /* put is in drbd_send_acks_wf() */
 		if (!queue_work(connection->ack_sender, &peer_device->send_acks_work))
-			kref_put(&device->kref, drbd_destroy_device);
+			put_drbd_dev(device);
 	}
 	spin_unlock_irqrestore(&device->resource->req_lock, flags);
 
@@ -2065,10 +2065,10 @@ static void do_unqueued_work(struct drbd_connection *connection)
 		if (!todo)
 			continue;
 
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 		do_device_work(device, todo);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
@@ -2229,10 +2229,10 @@ int drbd_worker(struct drbd_thread *thi)
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
 		D_ASSERT(device, device->state.disk == D_DISKLESS && device->state.conn == C_STANDALONE);
-		kref_get(&device->kref);
+		get_drbd_dev(device);
 		rcu_read_unlock();
 		drbd_device_cleanup(device);
-		kref_put(&device->kref, drbd_destroy_device);
+		put_drbd_dev(device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
-- 
2.34.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
