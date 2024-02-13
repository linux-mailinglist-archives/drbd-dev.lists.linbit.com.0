Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F128852D7E
	for <lists+drbd-dev@lfdr.de>; Tue, 13 Feb 2024 11:09:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4758F4203DF;
	Tue, 13 Feb 2024 11:09:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Tue, 13 Feb 2024 11:09:05 CET
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E7FE4201C5
	for <drbd-dev@lists.linbit.com>;
	Tue, 13 Feb 2024 11:09:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1EAE6117F;
	Tue, 13 Feb 2024 10:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF98C433C7;
	Tue, 13 Feb 2024 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707818641;
	bh=AMPyajMBIKdkNHT3a2o6PUCBHMhRtBLpcuVcQ5oFUck=;
	h=From:To:Cc:Subject:Date:From;
	b=DrgfU7Zx6Etobfy1vv5gV1AHdFbilX9QehQ1OaWhDyfH6329fDE3v0nH7JlHBz2fb
	PZzRouGmom4B5PIGODjMrlwOGNtQN6JSoO41ORbywm3BAUjUrYC8vsxmvxGoDbCei7
	C7SIYU9AkC4UrNNhxOMG2/NQSo2ippl2uas//vJ0hcdhhWctvOQ0zO51dm1I90N3e2
	6VnebmDZT3dYrXVGYH/Jrks8y0S1vO0Dwaw69Wpj/ClUOy5WdYuuRplyyEMNeNqkNK
	Re3EJ4ITP7mGM5Vw7vvj8PBjN9pzRkc3nLL79nkBFVthLOkpiPTDh828Sw1rIjRZ9c
	SdVWAIh87EmlQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH] drbd: fix function cast warnings in state machine
Date: Tue, 13 Feb 2024 11:03:01 +0100
Message-Id: <20240213100354.457128-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	"Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, drbd-dev@lists.linbit.com
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

From: Arnd Bergmann <arnd@arndb.de>

There are four state machines in drbd that use a common infrastructure, with
a cast to an incompatible function type in REMEMBER_STATE_CHANGE that clang-16
now warns about:

drivers/block/drbd/drbd_state.c:1632:3: error: cast from 'int (*)(struct sk_buff *, unsigned int, struct drbd_resource_state_change *, enum drbd_notification_type)' to 'typeof (last_func)' (aka 'int (*)(struct sk_buff *, unsigned int, void *, enum drbd_notification_type)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
 1632 |                 REMEMBER_STATE_CHANGE(notify_resource_state_change,
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1633 |                                       resource_state_change, NOTIFY_CHANGE);
      |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/drbd/drbd_state.c:1619:17: note: expanded from macro 'REMEMBER_STATE_CHANGE'
 1619 |            last_func = (typeof(last_func))func; \
      |                        ^~~~~~~~~~~~~~~~~~~~~~~
drivers/block/drbd/drbd_state.c:1641:4: error: cast from 'int (*)(struct sk_buff *, unsigned int, struct drbd_connection_state_change *, enum drbd_notification_type)' to 'typeof (last_func)' (aka 'int (*)(struct sk_buff *, unsigned int, void *, enum drbd_notification_type)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
 1641 |                         REMEMBER_STATE_CHANGE(notify_connection_state_change,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1642 |                                               connection_state_change, NOTIFY_CHANGE);
      |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change these all to actually expect a void pointer to be passed, which
matches the caller.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/drbd/drbd_state.c        | 24 ++++++++++++++----------
 drivers/block/drbd/drbd_state_change.h |  8 ++++----
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index 287a8d1d3f70..e858e7e0383f 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1542,9 +1542,10 @@ int drbd_bitmap_io_from_worker(struct drbd_device *device,
 
 int notify_resource_state_change(struct sk_buff *skb,
 				  unsigned int seq,
-				  struct drbd_resource_state_change *resource_state_change,
+				  void *state_change,
 				  enum drbd_notification_type type)
 {
+	struct drbd_resource_state_change *resource_state_change = state_change;
 	struct drbd_resource *resource = resource_state_change->resource;
 	struct resource_info resource_info = {
 		.res_role = resource_state_change->role[NEW],
@@ -1558,13 +1559,14 @@ int notify_resource_state_change(struct sk_buff *skb,
 
 int notify_connection_state_change(struct sk_buff *skb,
 				    unsigned int seq,
-				    struct drbd_connection_state_change *connection_state_change,
+				    void *state_change,
 				    enum drbd_notification_type type)
 {
-	struct drbd_connection *connection = connection_state_change->connection;
+	struct drbd_connection_state_change *p = state_change;
+	struct drbd_connection *connection = p->connection;
 	struct connection_info connection_info = {
-		.conn_connection_state = connection_state_change->cstate[NEW],
-		.conn_role = connection_state_change->peer_role[NEW],
+		.conn_connection_state = p->cstate[NEW],
+		.conn_role = p->peer_role[NEW],
 	};
 
 	return notify_connection_state(skb, seq, connection, &connection_info, type);
@@ -1572,9 +1574,10 @@ int notify_connection_state_change(struct sk_buff *skb,
 
 int notify_device_state_change(struct sk_buff *skb,
 				unsigned int seq,
-				struct drbd_device_state_change *device_state_change,
+				void *state_change,
 				enum drbd_notification_type type)
 {
+	struct drbd_device_state_change *device_state_change = state_change;
 	struct drbd_device *device = device_state_change->device;
 	struct device_info device_info = {
 		.dev_disk_state = device_state_change->disk_state[NEW],
@@ -1585,9 +1588,10 @@ int notify_device_state_change(struct sk_buff *skb,
 
 int notify_peer_device_state_change(struct sk_buff *skb,
 				     unsigned int seq,
-				     struct drbd_peer_device_state_change *p,
+				     void *state_change,
 				     enum drbd_notification_type type)
 {
+	struct drbd_peer_device_state_change *p = state_change;
 	struct drbd_peer_device *peer_device = p->peer_device;
 	struct peer_device_info peer_device_info = {
 		.peer_repl_state = p->repl_state[NEW],
@@ -1605,8 +1609,8 @@ static void broadcast_state_change(struct drbd_state_change *state_change)
 	struct drbd_resource_state_change *resource_state_change = &state_change->resource[0];
 	bool resource_state_has_changed;
 	unsigned int n_device, n_connection, n_peer_device, n_peer_devices;
-	int (*last_func)(struct sk_buff *, unsigned int, void *,
-			  enum drbd_notification_type) = NULL;
+	int (*last_func)(struct sk_buff *, unsigned int,
+		void *, enum drbd_notification_type) = NULL;
 	void *last_arg = NULL;
 
 #define HAS_CHANGED(state) ((state)[OLD] != (state)[NEW])
@@ -1616,7 +1620,7 @@ static void broadcast_state_change(struct drbd_state_change *state_change)
 	})
 #define REMEMBER_STATE_CHANGE(func, arg, type) \
 	({ FINAL_STATE_CHANGE(type | NOTIFY_CONTINUES); \
-	   last_func = (typeof(last_func))func; \
+	   last_func = func; \
 	   last_arg = arg; \
 	 })
 
diff --git a/drivers/block/drbd/drbd_state_change.h b/drivers/block/drbd/drbd_state_change.h
index 9d78d8e3912e..a56a57d67686 100644
--- a/drivers/block/drbd/drbd_state_change.h
+++ b/drivers/block/drbd/drbd_state_change.h
@@ -46,19 +46,19 @@ extern void forget_state_change(struct drbd_state_change *);
 
 extern int notify_resource_state_change(struct sk_buff *,
 					 unsigned int,
-					 struct drbd_resource_state_change *,
+					 void *,
 					 enum drbd_notification_type type);
 extern int notify_connection_state_change(struct sk_buff *,
 					   unsigned int,
-					   struct drbd_connection_state_change *,
+					   void *,
 					   enum drbd_notification_type type);
 extern int notify_device_state_change(struct sk_buff *,
 				       unsigned int,
-				       struct drbd_device_state_change *,
+				       void *,
 				       enum drbd_notification_type type);
 extern int notify_peer_device_state_change(struct sk_buff *,
 					    unsigned int,
-					    struct drbd_peer_device_state_change *,
+					    void *,
 					    enum drbd_notification_type type);
 
 #endif  /* DRBD_STATE_CHANGE_H */
-- 
2.39.2

