Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8247214A
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Dec 2021 08:03:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF0A6420960;
	Mon, 13 Dec 2021 08:03:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22E07420629
	for <drbd-dev@lists.linbit.com>;
	Fri, 10 Dec 2021 06:05:51 +0100 (CET)
Received: from canpemm500008.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J9JHb0mzbz92qN;
	Fri, 10 Dec 2021 12:45:31 +0800 (CST)
Received: from localhost.huawei.com (10.175.124.27) by
	canpemm500008.china.huawei.com (7.192.105.151) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2308.20; Fri, 10 Dec 2021 12:46:10 +0800
From: Li Jinlin <lijinlin3@huawei.com>
To: <song@kernel.org>, <philipp.reisner@linbit.com>,
	<lars.ellenberg@linbit.com>, <axboe@kernel.dk>, <hare@suse.de>,
	<jack@suse.cz>, <ming.lei@redhat.com>, <tj@kernel.org>,
	<mcgrof@kernel.org>, <mcroce@microsoft.com>
Date: Fri, 10 Dec 2021 13:17:07 +0800
Message-ID: <20211210051707.2202646-4-lijinlin3@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211210051707.2202646-1-lijinlin3@huawei.com>
References: <20211210051707.2202646-1-lijinlin3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
	canpemm500008.china.huawei.com (7.192.105.151)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 13 Dec 2021 08:03:45 +0100
Cc: linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
	linfeilong@huawei.com, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/3] drdb: Remove useless variable in struct
	drbd_device
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

rs_last_sect_ev is unused since added in 1d7734a0df02, so just remove it.

Signed-off-by: Li Jinlin <lijinlin3@huawei.com>
---
 drivers/block/drbd/drbd_int.h    | 1 -
 drivers/block/drbd/drbd_main.c   | 1 -
 drivers/block/drbd/drbd_state.c  | 1 -
 drivers/block/drbd/drbd_worker.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 1b71adc07e83..a163141aff1b 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -955,7 +955,6 @@ struct drbd_device {
 	char congestion_reason;  /* Why we where congested... */
 	atomic_t rs_sect_in; /* for incoming resync data rate, SyncTarget */
 	atomic64_t rs_sect_ev; /* for submitted resync data rate, both */
-	int rs_last_sect_ev; /* counter to compare with */
 	s64 rs_last_events;  /* counter of read or write "events" (unit sectors)
 			      * on the lower level device when we last looked. */
 	int c_sync_rate; /* current resync rate after syncer throttle magic */
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index ea057bd60541..f1fa03c69809 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2046,7 +2046,6 @@ void drbd_device_cleanup(struct drbd_device *device)
 	device->rs_total     =
 	device->rs_failed    = 0;
 	device->rs_last_events = 0;
-	device->rs_last_sect_ev = 0;
 	for (i = 0; i < DRBD_SYNC_MARKS; i++) {
 		device->rs_mark_left[i] = 0;
 		device->rs_mark_time[i] = 0;
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index b8a27818ab3f..4a6c69133c62 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1389,7 +1389,6 @@ _drbd_set_state(struct drbd_device *device, union drbd_state ns,
 
 		set_ov_position(device, ns.conn);
 		device->rs_start = now;
-		device->rs_last_sect_ev = 0;
 		device->ov_last_oos_size = 0;
 		device->ov_last_oos_start = 0;
 
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index a4edd0a9c875..45ae4abd355a 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1829,7 +1829,6 @@ void drbd_start_resync(struct drbd_device *device, enum drbd_conns side)
 		device->rs_failed    = 0;
 		device->rs_paused    = 0;
 		device->rs_same_csum = 0;
-		device->rs_last_sect_ev = 0;
 		device->rs_total     = tw;
 		device->rs_start     = now;
 		for (i = 0; i < DRBD_SYNC_MARKS; i++) {
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
