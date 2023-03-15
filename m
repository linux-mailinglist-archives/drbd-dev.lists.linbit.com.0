Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3B6BD371
	for <lists+drbd-dev@lfdr.de>; Thu, 16 Mar 2023 16:26:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 872644210D9;
	Thu, 16 Mar 2023 16:26:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A2E842095F
	for <drbd-dev@lists.linbit.com>; Wed, 15 Mar 2023 19:19:26 +0100 (CET)
Received: by mail-qt1-f177.google.com with SMTP id c18so17223034qte.5
	for <drbd-dev@lists.linbit.com>; Wed, 15 Mar 2023 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=joelfernandes.org; s=google; t=1678904365;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=GgzilRrDZzjZzGZPzVxtA7dkKR8Cud+QjJJNSSQFpD0=;
	b=aeF1GaiTWV2z10A11VbsrsakE7qKYNyoR2nVgFLI3d6N8gJEjje/zzswtN2TGFln6U
	SlbpWOL++D9xe66W2i+I7sjdmACU7jeLTJNedgxGtjL2iQs0D2V2ErxDWeH77FfhlQ7S
	B9eXRQAjYlyuksBs4ic13nFMImugk9I19BUXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1678904365;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=GgzilRrDZzjZzGZPzVxtA7dkKR8Cud+QjJJNSSQFpD0=;
	b=mzjnX/Xye0Mn5yvacq914EBsIZy+qcDjfzJPG7KMZD8MxW7k5TTzotevRhOfgDO8m3
	gRtrCiJwnpN7fU2RPQBKxGp1NyKqV2DlpJ6tBA5Rpagbv6u2c2F745N4phdqqlwGkICE
	s+hY/bifZs1koXZdj+OHiqa/dntktNkO7WrDoVvBD7215TE+0tg5Kq3VhZfTcq534Nms
	0V3r8lPpSoLJsMlRvfWFlU/MpQzhz6ZoEVYpn5C+gHPWXnKFAzYrUrtX1MF7MxlMUIOg
	FoauVebJBUOkz5co01ceHtZNdjNrFbaiDVOVWOfxUcMS2bq9kYGyS5r/T4OSkc3KVXjO
	5r7Q==
X-Gm-Message-State: AO0yUKVGY6Y0K0dXgHzXFQ3mlRGj12qnl3tJ/4X1QySSvAp9w2Y3haA9
	SPIrvr9rr8boCsV7tTJWB7Jdlw==
X-Google-Smtp-Source: AK7set8VcYEA2FNHiNt71e1UCyy1BH+LnV/QaaYc7e1fsnQTQLTwiKalxIxHMNkF25qJEH4XWQKcdQ==
X-Received: by 2002:ac8:5cce:0:b0:3bf:c266:fa6f with SMTP id
	s14-20020ac85cce000000b003bfc266fa6fmr1378818qta.46.1678904365367;
	Wed, 15 Mar 2023 11:19:25 -0700 (PDT)
Received: from joelboxx.c.googlers.com.com
	(129.239.188.35.bc.googleusercontent.com. [35.188.239.129])
	by smtp.gmail.com with ESMTPSA id
	v125-20020a379383000000b007458ae32290sm4113974qkd.128.2023.03.15.11.19.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Mar 2023 11:19:24 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Date: Wed, 15 Mar 2023 18:18:48 +0000
Message-Id: <20230315181902.4177819-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Mar 2023 16:26:55 +0100
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	"Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 01/14] drbd: Rename kvfree_rcu() to
	kvfree_rcu_mightsleep()
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

From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>

The kvfree_rcu() macro's single-argument form is deprecated.  Therefore
switch to the new kvfree_rcu_mightsleep() variant. The goal is to
avoid accidental use of the single-argument forms, which can introduce
functionality bugs in atomic contexts and latency bugs in non-atomic
contexts.

Cc: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 drivers/block/drbd/drbd_nl.c       | 6 +++---
 drivers/block/drbd/drbd_receiver.c | 4 ++--
 drivers/block/drbd/drbd_state.c    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 60757ac31701..f49f2a5282e1 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1615,7 +1615,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 			drbd_send_sync_param(peer_device);
 	}
 
-	kvfree_rcu(old_disk_conf);
+	kvfree_rcu_mightsleep(old_disk_conf);
 	kfree(old_plan);
 	mod_timer(&device->request_timer, jiffies + HZ);
 	goto success;
@@ -2446,7 +2446,7 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 
 	mutex_unlock(&connection->resource->conf_update);
 	mutex_unlock(&connection->data.mutex);
-	kvfree_rcu(old_net_conf);
+	kvfree_rcu_mightsleep(old_net_conf);
 
 	if (connection->cstate >= C_WF_REPORT_PARAMS) {
 		struct drbd_peer_device *peer_device;
@@ -2860,7 +2860,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 		new_disk_conf->disk_size = (sector_t)rs.resize_size;
 		rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
 		mutex_unlock(&device->resource->conf_update);
-		kvfree_rcu(old_disk_conf);
+		kvfree_rcu_mightsleep(old_disk_conf);
 		new_disk_conf = NULL;
 	}
 
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 757f4692b5bd..e197b2a465d2 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3759,7 +3759,7 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 		drbd_info(connection, "peer data-integrity-alg: %s\n",
 			  integrity_alg[0] ? integrity_alg : "(none)");
 
-	kvfree_rcu(old_net_conf);
+	kvfree_rcu_mightsleep(old_net_conf);
 	return 0;
 
 disconnect_rcu_unlock:
@@ -4127,7 +4127,7 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 
 			rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
 			mutex_unlock(&connection->resource->conf_update);
-			kvfree_rcu(old_disk_conf);
+			kvfree_rcu_mightsleep(old_disk_conf);
 
 			drbd_info(device, "Peer sets u_size to %lu sectors (old: %lu)\n",
 				 (unsigned long)p_usize, (unsigned long)my_usize);
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index 75d13ea0024f..2aeea295fa28 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -2071,7 +2071,7 @@ static int w_after_conn_state_ch(struct drbd_work *w, int unused)
 		conn_free_crypto(connection);
 		mutex_unlock(&connection->resource->conf_update);
 
-		kvfree_rcu(old_conf);
+		kvfree_rcu_mightsleep(old_conf);
 	}
 
 	if (ns_max.susp_fen) {
-- 
2.40.0.rc1.284.g88254d51c5-goog

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
