Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id C993099C069
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Oct 2024 08:52:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9903F42090D;
	Mon, 14 Oct 2024 08:52:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 2424 seconds by postgrey-1.31 at mail19;
	Thu, 10 Oct 2024 23:24:55 CEST
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D7BF420211
	for <drbd-dev@lists.linbit.com>; Thu, 10 Oct 2024 23:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx;
	h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=2yWyCpZ53gIzx3cAD/L1bBLUXyJxFe90aJntlIsY7DE=;
	b=aT9yBInumEWU60gV
	hmoBzenr8/UVDbVxS8RVtQaRYD3ZDaRMzGPplltSjtBmfnjdaepkTRKdfeBQmxrLN7ntezYZhM1CW
	Eig8HEueTHvc55w1U6RbNIb8ghmifhl/g8I1ZQpsb+5DPQyAWbavmL+Rouq2RlmvtEfzepN7u1acm
	ynVYnUttaLcBFQsCvAxrWp8YZIHRDQnQG6cxC/G6/yfMOcdSfMmKzYroLjTlEbV6j7/DdQYKpzMEx
	Eyplvi5UsEJjSNT5h/tI9667UVOS/zbDaZZAKYiQ4oCRw5GrcdhVkSq5FNj64Ea47tb9nCXb97ML+
	L4USjEM5i16eVH46NQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>) id 1sz01M-00AMjK-0t;
	Thu, 10 Oct 2024 20:44:28 +0000
From: linux@treblig.org
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, axboe@kernel.dk
Subject: [PATCH] drbd: Remove unused conn_lowest_minor
Date: Thu, 10 Oct 2024 21:44:26 +0100
Message-ID: <20241010204426.277535-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Oct 2024 08:52:49 +0200
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

From: "Dr. David Alan Gilbert" <linux@treblig.org>

conn_lowest_minor() last use was removed by 2011 commit
69a227731a37 ("drbd: Pass a peer device to a number of fuctions")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/block/drbd/drbd_int.h  |  1 -
 drivers/block/drbd/drbd_main.c | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 2a05d955e30b..e21492981f7d 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1364,7 +1364,6 @@ extern struct bio_set drbd_io_bio_set;
 
 extern struct mutex resources_mutex;
 
-extern int conn_lowest_minor(struct drbd_connection *connection);
 extern enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsigned int minor);
 extern void drbd_destroy_device(struct kref *kref);
 extern void drbd_delete_device(struct drbd_device *device);
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 0d74d75260ef..5bbd312c3e14 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -471,20 +471,6 @@ void _drbd_thread_stop(struct drbd_thread *thi, int restart, int wait)
 		wait_for_completion(&thi->stop);
 }
 
-int conn_lowest_minor(struct drbd_connection *connection)
-{
-	struct drbd_peer_device *peer_device;
-	int vnr = 0, minor = -1;
-
-	rcu_read_lock();
-	peer_device = idr_get_next(&connection->peer_devices, &vnr);
-	if (peer_device)
-		minor = device_to_minor(peer_device->device);
-	rcu_read_unlock();
-
-	return minor;
-}
-
 #ifdef CONFIG_SMP
 /*
  * drbd_calc_cpu_mask() - Generate CPU masks, spread over all CPUs
-- 
2.47.0

