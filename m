Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCoMDT8Jx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:48:31 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id A74A134C1F8
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:48:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 350A5163174;
	Fri, 27 Mar 2026 23:47:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5D768163134
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:26 +0100 (CET)
Received: by mail-wr1-f43.google.com with SMTP id
	ffacd0b85a97d-439b2965d4bso1932578f8f.2
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651166;
	x=1775255966; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=W5IIToDcXWgU8X6mDNUUMvTL1X7Plm6zgEWhMO2GnnA=;
	b=n+TOKF+HQ/5L4NTOdanFAa7naqM22bqwGhzXfvfnMcu+i63pzkAY3iYLlsIW2i+bVH
	TN6tyOukXj9X3WcFiMXRRX5EgU3Os4lQQRH3JiEX7T2jlOK5YHPGndYBG2JIOqUoFfxC
	IeLS/By1ngHQVg73LDyiXD2oSROSK4QD8gmHt3BKjsQK/qzGJDD3e9DUPK6NotpNnkkp
	jubGeTIH5ZE85cm4TvmNQnaWgRMqv2Jkfh1iq+wQTMjMt+CCxNke4btlx9PRP7d2DueY
	+I7H11TUdG7uLzoonpjYnnjiOYrbSKXeNyTiC1aWvTe8KHfIP889IxjHKZA67akKEEex
	c2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651166; x=1775255966;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=W5IIToDcXWgU8X6mDNUUMvTL1X7Plm6zgEWhMO2GnnA=;
	b=m6iKDPOj1xRh9S7hJo20g80MHGMj0HrS9EWR5i6JfBp2SDKd19ChNTdHOuUbJz4ENr
	RSYtAfcm7FURRq0vLAEVcaFzcuxUIohwqKcxydqcFJMYUAsDct724A59cWARwbK7Ieai
	kkBvp5sYM0GhEgP0C9ij23SBcS4oR5djGHz3ed8fdwg6f2VkxG8xfi3Qjjdn22n+tOo5
	odMJsajSBOy352h4uZh6VCle+WWXwPyfRyLRdN/BfaINIWRVC0P6vmB95btuBzvRZtXk
	E6mK2Qxp5HYkaVgeFX+gnDxLD05lFmvSz/wscvw0gPUK0S4tN4xStHT3VlOVAc9YvCSu
	KTfw==
X-Gm-Message-State: AOJu0Yxbo5xclP68Of6x8bjq1TyVAEDa07ZSLx+v1f0e7Uup1axujbPk
	PMLPOUAMc2NDB79brKkxZcqiFqrzMHBq/SewoaHP5kFnDcvw/jCRdpnCj1Ap6TOYkM7fjQ==
X-Gm-Gg: ATEYQzxxhiFWfgPgnpT0szCjyejH/7CI8WlExkRGSOq8DekHttFomcM/nrQCHUUJw74
	Y/9McjYEQ5D1YgyRGOsBSE4x4/bP/3HhTVronR3WNBuAuyVDEBWRGLvI1M9fQBXGfLTZ+wDvzg1
	VsbANGWtpVv4VdiX5G50gM+t5QLMMBVvryHsl22pOGAeoBz417Uyn5L2bln4HmzcdquLeKg5M/r
	D0Lx+eVNQHwdc7c8+SZumRYz0Pp4WEKNQB5Pk8gHO/KWRV4SRJ8b5fmQQxW/BtJakbCMIPRQE9g
	tBbfoNzpV0zTLr/yUhPldBokjrmt2v8XORHFA+NfCzfFyqwj0EkEhCpU100fzuZt2sa+rcrpgzz
	jn8x844hP0ZCBLs2oXttA+yC3hhLhIW+PWt8s26ymoFRluY7hhIoSn0/2zLUTnhNDohryv4jteb
	HoZbKN9q0ozbDzWf1Uni31J0F2/GORFBUgXQKocDcMSYldGUuMcIRt6XyW9n7poShlrI8RQ0tBT
	GFsXQOC9NT/Ha0KQqFsd7PbU6RpSJ9v
X-Received: by 2002:a05:6000:3102:b0:43b:9b39:8982 with SMTP id
	ffacd0b85a97d-43b9e9e8d3bmr6767047f8f.18.1774651164672; 
	Fri, 27 Mar 2026 15:39:24 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:23 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 17/20] drbd: rework receiver for DRBD 9 transport and
	multi-peer protocol
Date: Fri, 27 Mar 2026 23:38:17 +0100
Message-ID: <20260327223820.2244227-18-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 23:47:36 +0100
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.892];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m.bio:url,linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns,mail-archive.com:url,parallels.com:email]
X-Rspamd-Queue-Id: A74A134C1F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adapt the receiver to the DRBD 9 multi-peer architecture.
Replace all direct socket I/O by calls through the transport abstraction
layer, with the transport managing buffer allocation.
Move peer request tracking from per-device lists to connection-level
structures, enabling a single receiver thread to serve all volumes on
a connection.

UUID-based resync decisions replace the old integer heuristic with enums
for strategies and rules, so each sync handshake outcome and its reason
are self-describing and logged by name.
Update UUID comparison for multi-peer: each peer now carries per-node
bitmap UUIDs and a history array, replacing the fixed four-slot layout.

Introduce DAG-tag ordering as a causal consistency mechanism, letting
peer requests declare dependencies on writes seen at another node and
waiting until those dependencies are resolved.

Add two-phase commit handling so that coordinated state changes (role
transitions, resync initiation, resize) can be propagated to all nodes
atomically.

Write conflict detection moves from a flag-based approach to an
interval-tree with typed intervals, using asynchronous deferred
submission for conflicting requests.

The disconnect path is restructured at the connection level: it
cancels dagtag-dependent requests, drains resync activity, flushes
workqueues, and performs per-peer-device teardown before returning
the connection to the unconnected state.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_receiver.c         | 12258 ++++++++++++++-----
 drivers/block/drbd/drbd_transport.h        |   127 +-
 drivers/block/drbd/drbd_transport_lb-tcp.c |    50 +-
 drivers/block/drbd/drbd_transport_rdma.c   |    74 +-
 drivers/block/drbd/drbd_transport_tcp.c    |    49 +-
 5 files changed, 9029 insertions(+), 3529 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 58b95bf4bdca..e8c4cd1cda14 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -10,42 +10,54 @@
 
  */
 
-
-#include <linux/module.h>
-
-#include <linux/uaccess.h>
 #include <net/sock.h>
 
+#include <linux/bio.h>
 #include <linux/drbd.h>
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/in.h>
 #include <linux/mm.h>
-#include <linux/memcontrol.h>
+#include <linux/memcontrol.h> /* needed on kernels <4.3 */
 #include <linux/mm_inline.h>
 #include <linux/slab.h>
-#include <uapi/linux/sched/types.h>
-#include <linux/sched/signal.h>
 #include <linux/pkt_sched.h>
-#include <linux/unistd.h>
+#include <uapi/linux/sched/types.h>
 #include <linux/vmalloc.h>
 #include <linux/random.h>
-#include <linux/string.h>
-#include <linux/scatterlist.h>
+#include <net/ipv6.h>
 #include <linux/part_stat.h>
-#include <linux/mempool.h>
+
 #include "drbd_int.h"
+#include "drbd_meta_data.h"
 #include "drbd_protocol.h"
 #include "drbd_req.h"
 #include "drbd_vli.h"
 
-#define PRO_FEATURES (DRBD_FF_TRIM|DRBD_FF_THIN_RESYNC|DRBD_FF_WSAME|DRBD_FF_WZEROES)
 
-struct packet_info {
-	enum drbd_packet cmd;
-	unsigned int size;
-	unsigned int vnr;
-	void *data;
+enum ao_op {
+	OUTDATE_DISKS,
+	OUTDATE_DISKS_AND_DISCONNECT,
+};
+
+struct flush_work {
+	struct drbd_work w;
+	struct drbd_epoch *epoch;
+};
+
+struct update_peers_work {
+       struct drbd_work w;
+       struct drbd_peer_device *peer_device;
+       sector_t sector_start;
+       sector_t sector_end;
+};
+
+enum epoch_event {
+	EV_PUT,
+	EV_GOT_BARRIER_NR,
+	EV_BARRIER_DONE,
+	EV_BECAME_LAST,
+	EV_CLEANUP = 32, /* used as flag */
 };
 
 enum finish_epoch {
@@ -54,201 +66,508 @@ enum finish_epoch {
 	FE_RECYCLED,
 };
 
-static int drbd_do_features(struct drbd_connection *connection);
-static int drbd_do_auth(struct drbd_connection *connection);
-static int drbd_disconnected(struct drbd_peer_device *);
-static void conn_wait_active_ee_empty(struct drbd_connection *connection);
+enum resync_reason {
+	AFTER_UNSTABLE,
+	DISKLESS_PRIMARY,
+};
+
+enum sync_rule {
+	RULE_SYNC_SOURCE_MISSED_FINISH,
+	RULE_SYNC_SOURCE_PEER_MISSED_FINISH,
+	RULE_SYNC_TARGET_MISSED_FINISH,
+	RULE_SYNC_TARGET_PEER_MISSED_FINISH,
+	RULE_SYNC_TARGET_MISSED_START,
+	RULE_SYNC_SOURCE_MISSED_START,
+	RULE_INITIAL_HANDSHAKE_CHANGED,
+	RULE_JUST_CREATED_PEER,
+	RULE_JUST_CREATED_SELF,
+	RULE_JUST_CREATED_BOTH,
+	RULE_CRASHED_PRIMARY,
+	RULE_LOST_QUORUM,
+	RULE_RECONNECTED,
+	RULE_BOTH_OFF,
+	RULE_BITMAP_PEER,
+	RULE_BITMAP_PEER_OTHER,
+	RULE_BITMAP_SELF,
+	RULE_BITMAP_SELF_OTHER,
+	RULE_BITMAP_BOTH,
+	RULE_HISTORY_PEER,
+	RULE_HISTORY_SELF,
+	RULE_HISTORY_BOTH,
+};
+
+static const char * const sync_rule_names[] = {
+	[RULE_SYNC_SOURCE_MISSED_FINISH] = "sync-source-missed-finish",
+	[RULE_SYNC_SOURCE_PEER_MISSED_FINISH] = "sync-source-peer-missed-finish",
+	[RULE_SYNC_TARGET_MISSED_FINISH] = "sync-target-missed-finish",
+	[RULE_SYNC_TARGET_PEER_MISSED_FINISH] = "sync-target-peer-missed-finish",
+	[RULE_SYNC_TARGET_MISSED_START] = "sync-target-missed-start",
+	[RULE_SYNC_SOURCE_MISSED_START] = "sync-source-missed-start",
+	[RULE_INITIAL_HANDSHAKE_CHANGED] = "initial-handshake-changed",
+	[RULE_JUST_CREATED_PEER] = "just-created-peer",
+	[RULE_JUST_CREATED_SELF] = "just-created-self",
+	[RULE_JUST_CREATED_BOTH] = "just-created-both",
+	[RULE_CRASHED_PRIMARY] = "crashed-primary",
+	[RULE_LOST_QUORUM] = "lost-quorum",
+	[RULE_RECONNECTED] = "reconnected",
+	[RULE_BOTH_OFF] = "both-off",
+	[RULE_BITMAP_PEER] = "bitmap-peer",
+	[RULE_BITMAP_PEER_OTHER] = "bitmap-peer-other",
+	[RULE_BITMAP_SELF] = "bitmap-self",
+	[RULE_BITMAP_SELF_OTHER] = "bitmap-self-other",
+	[RULE_BITMAP_BOTH] = "bitmap-both",
+	[RULE_HISTORY_PEER] = "history-peer",
+	[RULE_HISTORY_SELF] = "history-self",
+	[RULE_HISTORY_BOTH] = "history-both",
+};
+
+enum sync_strategy {
+	UNDETERMINED = 0,
+	NO_SYNC,
+	SYNC_SOURCE_IF_BOTH_FAILED,
+	SYNC_SOURCE_USE_BITMAP,
+	SYNC_SOURCE_SET_BITMAP,
+	SYNC_SOURCE_COPY_BITMAP,
+	SYNC_TARGET_IF_BOTH_FAILED,
+	SYNC_TARGET_USE_BITMAP,
+	SYNC_TARGET_SET_BITMAP,
+	SYNC_TARGET_CLEAR_BITMAP,
+	SPLIT_BRAIN_AUTO_RECOVER,
+	SPLIT_BRAIN_DISCONNECT,
+	UNRELATED_DATA,
+	RETRY_CONNECT,
+	REQUIRES_PROTO_91,
+	REQUIRES_PROTO_96,
+	REQUIRES_PROTO_124,
+	SYNC_TARGET_PRIMARY_RECONNECT,
+	SYNC_TARGET_PRIMARY_DISCONNECT,
+};
+
+struct sync_descriptor {
+	char * const name;
+	int required_protocol;
+	bool is_split_brain;
+	bool is_sync_source;
+	bool is_sync_target;
+	bool reconnect;
+	bool disconnect;
+	int resync_peer_preference;
+	enum sync_strategy full_sync_equivalent;
+	enum sync_strategy reverse;
+};
+
+static const struct sync_descriptor sync_descriptors[] = {
+	[UNDETERMINED] = {
+		.name = "?",
+	},
+	[NO_SYNC] = {
+		.name = "no-sync",
+		.resync_peer_preference = 5,
+	},
+	[SYNC_SOURCE_IF_BOTH_FAILED] = {
+		.name = "source-if-both-failed",
+		.is_sync_source = true,
+		.reverse = SYNC_TARGET_IF_BOTH_FAILED,
+	},
+	[SYNC_SOURCE_USE_BITMAP] = {
+		.name = "source-use-bitmap",
+		.is_sync_source = true,
+		.full_sync_equivalent = SYNC_SOURCE_SET_BITMAP,
+		.reverse = SYNC_TARGET_USE_BITMAP,
+	},
+	[SYNC_SOURCE_SET_BITMAP] = {
+		.name = "source-set-bitmap",
+		.is_sync_source = true,
+		.reverse = SYNC_TARGET_SET_BITMAP,
+	},
+	[SYNC_SOURCE_COPY_BITMAP] = {
+		.name = "source-copy-other-bitmap",
+		.is_sync_source = true,
+	},
+	[SYNC_TARGET_IF_BOTH_FAILED] = {
+		.name = "target-if-both-failed",
+		.is_sync_target = true,
+		.resync_peer_preference = 4,
+		.reverse = SYNC_SOURCE_IF_BOTH_FAILED,
+	},
+	[SYNC_TARGET_USE_BITMAP] = {
+		.name = "target-use-bitmap",
+		.is_sync_target = true,
+		.full_sync_equivalent = SYNC_TARGET_SET_BITMAP,
+		.resync_peer_preference = 3,
+		.reverse = SYNC_SOURCE_USE_BITMAP,
+	},
+	[SYNC_TARGET_SET_BITMAP] = {
+		.name = "target-set-bitmap",
+		.is_sync_target = true,
+		.resync_peer_preference = 2,
+		.reverse = SYNC_SOURCE_SET_BITMAP,
+	},
+	[SYNC_TARGET_CLEAR_BITMAP] = {
+		.name = "target-clear-bitmap",
+		.is_sync_target = true,
+		.resync_peer_preference = 1,
+	},
+	[SPLIT_BRAIN_AUTO_RECOVER] = {
+		.name = "split-brain-auto-recover",
+		.is_split_brain = true,
+		.disconnect = true,
+	},
+	[SPLIT_BRAIN_DISCONNECT] = {
+		.name = "split-brain-disconnect",
+		.is_split_brain = true,
+		.disconnect = true,
+	},
+	[UNRELATED_DATA] = {
+		.name = "unrelated-data",
+		.disconnect = true,
+	},
+	[RETRY_CONNECT] = {
+		.name = "retry-connect",
+		.reconnect = true,
+	},
+	[REQUIRES_PROTO_91] = {
+		.name = "requires-proto-91",
+		.required_protocol = 91,
+		.disconnect = true,
+	},
+	[REQUIRES_PROTO_96] = {
+		.name = "requires-proto-96",
+		.required_protocol = 96,
+		.disconnect = true,
+	},
+	[REQUIRES_PROTO_124] = {
+		.name = "requires-proto-124",
+		.required_protocol = 124,
+		.disconnect = true,
+	},
+	[SYNC_TARGET_PRIMARY_RECONNECT] = {
+		.name = "sync-target-primary-reconnect",
+		.is_sync_target = true,
+		.reconnect = true,
+	},
+	[SYNC_TARGET_PRIMARY_DISCONNECT] = {
+		.name = "sync-target-primary-disconnect",
+		.is_sync_target = true,
+		.disconnect = true,
+	},
+};
+
+enum rcv_timeou_kind {
+	PING_TIMEOUT,
+	REGULAR_TIMEOUT,
+};
+
+int drbd_do_features(struct drbd_connection *connection);
+int drbd_do_auth(struct drbd_connection *connection);
+static void conn_disconnect(struct drbd_connection *connection);
+
 static enum finish_epoch drbd_may_finish_epoch(struct drbd_connection *, struct drbd_epoch *, enum epoch_event);
 static int e_end_block(struct drbd_work *, int);
+static void cleanup_unacked_peer_requests(struct drbd_connection *connection);
+static void cleanup_peer_ack_list(struct drbd_connection *connection);
+static u64 node_ids_to_bitmap(struct drbd_device *device, u64 node_ids);
+static void process_twopc(struct drbd_connection *, struct twopc_reply *, struct packet_info *, unsigned long);
+static void drbd_resync(struct drbd_peer_device *, enum resync_reason);
+static void drbd_unplug_all_devices(struct drbd_connection *connection);
+static int decode_header(struct drbd_connection *, const void *, struct packet_info *);
+static void check_resync_source(struct drbd_device *device, u64 weak_nodes);
+static void set_rcvtimeo(struct drbd_connection *connection, enum rcv_timeou_kind kind);
+static bool disconnect_expected(struct drbd_connection *connection);
+static bool uuid_in_peer_history(struct drbd_peer_device *peer_device, u64 uuid);
+static bool uuid_in_my_history(struct drbd_device *device, u64 uuid);
+static void drbd_cancel_conflicting_resync_requests(struct drbd_peer_device *peer_device);
+
+static const char *drbd_sync_rule_str(enum sync_rule rule)
+{
+	if (rule < 0 || rule >= ARRAY_SIZE(sync_rule_names)) {
+		WARN_ON(true);
+		return "?";
+	}
+	return sync_rule_names[rule];
+}
 
+static struct sync_descriptor strategy_descriptor(enum sync_strategy strategy)
+{
+	if (strategy < 0 || strategy > ARRAY_SIZE(sync_descriptors)) {
+		WARN_ON(true);
+		return sync_descriptors[UNDETERMINED];
+	}
+	return sync_descriptors[strategy];
+}
+
+static bool is_strategy_determined(enum sync_strategy strategy)
+{
+	return strategy == NO_SYNC ||
+			strategy_descriptor(strategy).is_sync_source ||
+			strategy_descriptor(strategy).is_sync_target;
+}
 
-#define GFP_TRY	(__GFP_HIGHMEM | __GFP_NOWARN)
+static struct drbd_epoch *previous_epoch(struct drbd_connection *connection, struct drbd_epoch *epoch)
+{
+	struct drbd_epoch *prev;
+	spin_lock(&connection->epoch_lock);
+	prev = list_entry(epoch->list.prev, struct drbd_epoch, list);
+	if (prev == epoch || prev == connection->current_epoch)
+		prev = NULL;
+	spin_unlock(&connection->epoch_lock);
+	return prev;
+}
 
-static struct page *__drbd_alloc_pages(unsigned int number)
+static void rs_sectors_came_in(struct drbd_peer_device *peer_device, int size)
 {
-	struct page *page = NULL;
-	struct page *tmp = NULL;
-	unsigned int i = 0;
+	int rs_sect_in = atomic_add_return(size >> 9, &peer_device->rs_sect_in);
 
-	/* GFP_TRY, because we must not cause arbitrary write-out: in a DRBD
-	 * "criss-cross" setup, that might cause write-out on some other DRBD,
-	 * which in turn might block on the other node at this very place.  */
-	for (i = 0; i < number; i++) {
-		tmp = mempool_alloc(&drbd_buffer_page_pool, GFP_TRY);
-		if (!tmp)
-			goto fail;
-		set_page_private(tmp, (unsigned long)page);
-		page = tmp;
+	/* When resync runs faster than anticipated, consider running the
+	 * resync_work early. */
+	if (rs_sect_in >= peer_device->rs_in_flight)
+		drbd_rs_all_in_flight_came_back(peer_device, rs_sect_in);
+}
+
+void drbd_peer_req_strip_bio(struct drbd_peer_request *peer_req)
+{
+	struct drbd_transport *transport = &peer_req->peer_device->connection->transport;
+	struct bvec_iter iter;
+	struct bio_vec bvec;
+	struct bio *bio;
+
+	while ((bio = bio_list_pop(&peer_req->bios))) {
+		bio_for_each_bvec(bvec, bio, iter) {
+			struct page *page = bvec.bv_page;
+			unsigned int len = bvec.bv_len;
+
+			/* bio_add_page() may have merged contiguous pages from
+			 * separate allocations into a single bvec. Step through
+			 * by compound_order to free each allocation unit.
+			 */
+			while (len) {
+				unsigned int order = compound_order(page);
+
+				drbd_free_page(transport, page);
+				page += 1 << order;
+				len -= min_t(unsigned int, PAGE_SIZE << order, len);
+			}
+		}
+		bio_put(bio);
 	}
+}
+
+static struct page *
+__drbd_alloc_pages(struct drbd_connection *connection, gfp_t gfp_mask, int order)
+{
+	struct page *page;
+	unsigned int mxb;
+
+	rcu_read_lock();
+	mxb = rcu_dereference(connection->transport.net_conf)->max_buffers;
+	rcu_read_unlock();
+
+	if (atomic_read(&connection->pp_in_use) >= mxb)
+		schedule_timeout_interruptible(HZ / 10);
+
+	if (order == 0)
+		page = mempool_alloc(&drbd_buffer_page_pool, gfp_mask);
+	else
+		page = alloc_pages(gfp_mask | __GFP_COMP | __GFP_NORETRY, order);
+
+	if (page)
+		atomic_add(1 << order, &connection->pp_in_use);
+
 	return page;
-fail:
-	page_chain_for_each_safe(page, tmp) {
-		set_page_private(page, 0);
-		mempool_free(page, &drbd_buffer_page_pool);
-	}
-	return NULL;
 }
 
 /**
- * drbd_alloc_pages() - Returns @number pages, retries forever (or until signalled)
- * @peer_device:	DRBD device.
- * @number:		number of pages requested
- * @retry:		whether to retry, if not enough pages are available right now
- *
- * Tries to allocate number pages, first from our own page pool, then from
- * the kernel.
- * Possibly retry until DRBD frees sufficient pages somewhere else.
+ * drbd_alloc_pages() - Returns a page, which might be a single or compound page
+ * @transport:	DRBD transport
+ * @gfp_mask:	how to allocate and whether to loop until we succeed
+ * @size:	Desired size, gets rounded down to the closest power of two
  *
- * If this allocation would exceed the max_buffers setting, we throttle
- * allocation (schedule_timeout) to give the system some room to breathe.
+ * Allocates a page from the kernel or from the private mempool. When this
+ * allocation exceeds the max_buffers setting, throttle the allocation via
+ * schedule_timeout.
  *
- * We do not use max-buffers as hard limit, because it could lead to
- * congestion and further to a distributed deadlock during online-verify or
- * (checksum based) resync, if the max-buffers, socket buffer sizes and
+ * We do not use max-buffers as a hard limit, because it could lead to
+ * congestion and, further, to a distributed deadlock during online-verify or
+ * (checksum-based) resync, if the max-buffers, socket buffer sizes, and
  * resync-rate settings are mis-configured.
- *
- * Returns a page chain linked via page->private.
  */
-struct page *drbd_alloc_pages(struct drbd_peer_device *peer_device, unsigned int number,
-			      bool retry)
+struct page *drbd_alloc_pages(struct drbd_transport *transport, gfp_t gfp_mask, unsigned int size)
 {
-	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection =
+		container_of(transport, struct drbd_connection, transport);
+	int order = max(ilog2(size) - PAGE_SHIFT, 0);
 	struct page *page;
-	struct net_conf *nc;
-	unsigned int mxb;
 
-	rcu_read_lock();
-	nc = rcu_dereference(peer_device->connection->net_conf);
-	mxb = nc ? nc->max_buffers : 1000000;
-	rcu_read_unlock();
+	if (order && drbd_insert_fault_conn(connection, DRBD_FAULT_BIO_TOO_SMALL))
+		order = 0;
 
-	if (atomic_read(&device->pp_in_use) >= mxb)
-		schedule_timeout_interruptible(HZ / 10);
-	page = __drbd_alloc_pages(number);
+	page = __drbd_alloc_pages(connection, gfp_mask | __GFP_NOWARN, order);
+	if (!page && order)
+		page = __drbd_alloc_pages(connection, gfp_mask, 0);
 
-	if (page)
-		atomic_add(number, &device->pp_in_use);
 	return page;
 }
+EXPORT_SYMBOL(drbd_alloc_pages); /* for transports */
 
-/* Must not be used from irq, as that may deadlock: see drbd_alloc_pages.
- * Is also used from inside an other spin_lock_irq(&resource->req_lock);
- * Either links the page chain back to the global pool,
+/* Must not be used from irq, as that may deadlock: see drbd_alloc_pages().
+ * Either links the page chain back to the pool of free pages,
  * or returns all pages to the system. */
-static void drbd_free_pages(struct drbd_device *device, struct page *page)
+void drbd_free_page(struct drbd_transport *transport, struct page *page)
 {
-	struct page *tmp;
-	int i = 0;
+	struct drbd_connection *connection =
+		container_of(transport, struct drbd_connection, transport);
+	int order = compound_order(page), i = 0;
 
 	if (page == NULL)
 		return;
 
-	page_chain_for_each_safe(page, tmp) {
-		set_page_private(page, 0);
-		if (page_count(page) == 1)
-			mempool_free(page, &drbd_buffer_page_pool);
-		else
-			put_page(page);
-		i++;
-	}
-	i = atomic_sub_return(i, &device->pp_in_use);
+	if (page_count(page) == 1 && order == 0)
+		mempool_free(page, &drbd_buffer_page_pool);
+	else
+		put_page(page);
+
+	i = atomic_sub_return(1 << order, &connection->pp_in_use);
 	if (i < 0)
-		drbd_warn(device, "ASSERTION FAILED: pp_in_use: %d < 0\n", i);
+		drbd_warn(connection, "ASSERTION FAILED: pp_in_use: %d < 0\n", i);
 }
+EXPORT_SYMBOL(drbd_free_page);
 
-/*
-You need to hold the req_lock:
- _drbd_wait_ee_list_empty()
-
-You must not have the req_lock:
- drbd_free_peer_req()
- drbd_alloc_peer_req()
- drbd_free_peer_reqs()
- drbd_ee_fix_bhs()
- drbd_finish_peer_reqs()
- drbd_clear_done_ee()
- drbd_wait_ee_list_empty()
-*/
+static int
+peer_req_alloc_bio(struct drbd_peer_request *peer_req, size_t size, gfp_t gfp_mask, blk_opf_t opf)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_transport *transport = &peer_device->connection->transport;
+	struct drbd_device *device = peer_device->device;
+	enum req_op op = opf & REQ_OP_MASK;
+	unsigned short nr_vecs;
+	struct page *page;
+	struct bio *bio;
+
+	nr_vecs = DIV_ROUND_UP(size, PAGE_SIZE);
+	if (nr_vecs > BIO_MAX_VECS)
+		nr_vecs = BIO_MAX_VECS;
+
+	if (drbd_insert_fault(device, DRBD_FAULT_BIO_TOO_SMALL))
+		nr_vecs = DIV_ROUND_UP(nr_vecs, 4);
+
+	bio = bio_alloc(device->ldev->backing_bdev, nr_vecs, opf, gfp_mask);
+	if (!bio)
+		return -ENOMEM;
+
+	bio_list_add(&peer_req->bios, bio);
+
+	if (op == REQ_OP_READ) {
+		while (size) {
+			int len;
+
+			page = drbd_alloc_pages(transport, gfp_mask, size);
+			if (!page)
+				goto out_free_pages;
+			len = min(PAGE_SIZE << compound_order(page), size);
+
+			len = drbd_bio_add_page(transport, &peer_req->bios, page, len, 0);
+			if (len < 0)
+				goto out_free_pages;
+			size -= len;
+		}
+		if (!mempool_is_saturated(&drbd_buffer_page_pool))
+			peer_req->flags |= EE_RELEASE_TO_MEMPOOL;
+	}
+	return 0;
+
+out_free_pages:
+	drbd_peer_req_strip_bio(peer_req);
+	return -ENOMEM;
+}
 
-/* normal: payload_size == request size (bi_size)
- * w_same: payload_size == logical_block_size
- * trim: payload_size == 0 */
+/**
+ * drbd_alloc_peer_req() - Allocate a drbd_peer_request
+ * @drbd_peer_device: peer device object
+ * @gfp_mask:	      how to allocate and whether to loop until we succeed
+ * @size:	      size (normal I/O), logical_block_size (w_same), 0 (trim)
+ * @opf:              REQ_OP_READ or REQ_OP_WRITE
+ *
+ * For REQ_OP_READ, it allocates the peer_req with a BIO and populates it
+ * entirely with buffer pages. Otherwise it allocates the peer_req with
+ * an empty BIO.
+ */
 struct drbd_peer_request *
-drbd_alloc_peer_req(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
-		    unsigned int request_size, unsigned int payload_size, gfp_t gfp_mask) __must_hold(local)
+drbd_alloc_peer_req(struct drbd_peer_device *peer_device, gfp_t gfp_mask,
+		    size_t size, blk_opf_t opf)
 {
 	struct drbd_device *device = peer_device->device;
 	struct drbd_peer_request *peer_req;
-	struct page *page = NULL;
-	unsigned int nr_pages = PFN_UP(payload_size);
+	int err;
 
+	gfp_mask &= ~__GFP_HIGHMEM;
 	if (drbd_insert_fault(device, DRBD_FAULT_AL_EE))
 		return NULL;
 
-	peer_req = mempool_alloc(&drbd_ee_mempool, gfp_mask & ~__GFP_HIGHMEM);
+	peer_req = mempool_alloc(&drbd_ee_mempool, gfp_mask);
 	if (!peer_req) {
 		if (!(gfp_mask & __GFP_NOWARN))
 			drbd_err(device, "%s: allocation failed\n", __func__);
 		return NULL;
 	}
-
-	if (nr_pages) {
-		page = drbd_alloc_pages(peer_device, nr_pages,
-					gfpflags_allow_blocking(gfp_mask));
-		if (!page)
-			goto fail;
-		if (!mempool_is_saturated(&drbd_buffer_page_pool))
-			peer_req->flags |= EE_RELEASE_TO_MEMPOOL;
-	}
-
 	memset(peer_req, 0, sizeof(*peer_req));
+
 	INIT_LIST_HEAD(&peer_req->w.list);
 	drbd_clear_interval(&peer_req->i);
-	peer_req->i.size = request_size;
-	peer_req->i.sector = sector;
+	INIT_LIST_HEAD(&peer_req->recv_order);
 	peer_req->submit_jif = jiffies;
+	kref_get(&device->kref); /* this kref holds the peer_req->peer_device object alive */
 	peer_req->peer_device = peer_device;
-	peer_req->pages = page;
-	/*
-	 * The block_id is opaque to the receiver.  It is not endianness
-	 * converted, and sent back to the sender unchanged.
-	 */
-	peer_req->block_id = id;
+	peer_req->block_id = (unsigned long) peer_req;
+
+	if (opf == REQ_NO_BIO)
+		return peer_req;
+
+	err = peer_req_alloc_bio(peer_req, size, gfp_mask, opf);
+	if (err)
+		goto out_free_peer_req;
 
 	return peer_req;
 
- fail:
+out_free_peer_req:
 	mempool_free(peer_req, &drbd_ee_mempool);
 	return NULL;
 }
 
-void drbd_free_peer_req(struct drbd_device *device, struct drbd_peer_request *peer_req)
+void drbd_free_peer_req(struct drbd_peer_request *peer_req)
 {
-	might_sleep();
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
+
+	if (peer_req->flags & EE_ON_RECV_ORDER) {
+		spin_lock_irq(&connection->peer_reqs_lock);
+		if (peer_req->i.type == INTERVAL_RESYNC_WRITE)
+			drbd_list_del_resync_request(peer_req);
+		else
+			list_del(&peer_req->recv_order);
+		spin_unlock_irq(&connection->peer_reqs_lock);
+	}
+
 	if (peer_req->flags & EE_HAS_DIGEST)
 		kfree(peer_req->digest);
-	drbd_free_pages(device, peer_req->pages);
-	D_ASSERT(device, atomic_read(&peer_req->pending_bios) == 0);
-	D_ASSERT(device, drbd_interval_empty(&peer_req->i));
-	if (!expect(device, !(peer_req->flags & EE_CALL_AL_COMPLETE_IO))) {
-		peer_req->flags &= ~EE_CALL_AL_COMPLETE_IO;
-		drbd_al_complete_io(device, &peer_req->i);
-	}
+	D_ASSERT(peer_device, atomic_read(&peer_req->pending_bios) == 0);
+	D_ASSERT(peer_device, drbd_interval_empty(&peer_req->i));
+	drbd_peer_req_strip_bio(peer_req);
+	kref_put(&peer_device->device->kref, drbd_destroy_device);
 	mempool_free(peer_req, &drbd_ee_mempool);
 }
 
-int drbd_free_peer_reqs(struct drbd_device *device, struct list_head *list)
+int drbd_free_peer_reqs(struct drbd_connection *connection, struct list_head *list)
 {
 	LIST_HEAD(work_list);
 	struct drbd_peer_request *peer_req, *t;
 	int count = 0;
 
-	spin_lock_irq(&device->resource->req_lock);
+	spin_lock_irq(&connection->peer_reqs_lock);
 	list_splice_init(list, &work_list);
-	spin_unlock_irq(&device->resource->req_lock);
+	spin_unlock_irq(&connection->peer_reqs_lock);
 
 	list_for_each_entry_safe(peer_req, t, &work_list, w.list) {
-		drbd_free_peer_req(device, peer_req);
+		drbd_free_peer_req(peer_req);
 		count++;
 	}
 	return count;
@@ -257,90 +576,58 @@ int drbd_free_peer_reqs(struct drbd_device *device, struct list_head *list)
 /*
  * See also comments in _req_mod(,BARRIER_ACKED) and receive_Barrier.
  */
-static int drbd_finish_peer_reqs(struct drbd_device *device)
+static int drbd_finish_peer_reqs(struct drbd_connection *connection)
 {
 	LIST_HEAD(work_list);
 	struct drbd_peer_request *peer_req, *t;
 	int err = 0;
+	int n = 0;
 
-	spin_lock_irq(&device->resource->req_lock);
-	list_splice_init(&device->done_ee, &work_list);
-	spin_unlock_irq(&device->resource->req_lock);
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_splice_init(&connection->done_ee, &work_list);
+	spin_unlock_irq(&connection->peer_reqs_lock);
 
 	/* possible callbacks here:
-	 * e_end_block, and e_end_resync_block, e_send_superseded.
+	 * e_end_block, and e_end_resync_block.
 	 * all ignore the last argument.
 	 */
 	list_for_each_entry_safe(peer_req, t, &work_list, w.list) {
 		int err2;
 
+		++n;
 		/* list_del not necessary, next/prev members not touched */
+		/* The callback may free peer_req. */
 		err2 = peer_req->w.cb(&peer_req->w, !!err);
 		if (!err)
 			err = err2;
-		drbd_free_peer_req(device, peer_req);
 	}
-	wake_up(&device->ee_wait);
+	if (atomic_sub_and_test(n, &connection->done_ee_cnt))
+		wake_up(&connection->ee_wait);
 
 	return err;
 }
 
-static void _drbd_wait_ee_list_empty(struct drbd_device *device,
-				     struct list_head *head)
-{
-	DEFINE_WAIT(wait);
-
-	/* avoids spin_lock/unlock
-	 * and calling prepare_to_wait in the fast path */
-	while (!list_empty(head)) {
-		prepare_to_wait(&device->ee_wait, &wait, TASK_UNINTERRUPTIBLE);
-		spin_unlock_irq(&device->resource->req_lock);
-		io_schedule();
-		finish_wait(&device->ee_wait, &wait);
-		spin_lock_irq(&device->resource->req_lock);
-	}
-}
-
-static void drbd_wait_ee_list_empty(struct drbd_device *device,
-				    struct list_head *head)
-{
-	spin_lock_irq(&device->resource->req_lock);
-	_drbd_wait_ee_list_empty(device, head);
-	spin_unlock_irq(&device->resource->req_lock);
-}
-
-static int drbd_recv_short(struct socket *sock, void *buf, size_t size, int flags)
-{
-	struct kvec iov = {
-		.iov_base = buf,
-		.iov_len = size,
-	};
-	struct msghdr msg = {
-		.msg_flags = (flags ? flags : MSG_WAITALL | MSG_NOSIGNAL)
-	};
-	iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, size);
-	return sock_recvmsg(sock, &msg, msg.msg_flags);
-}
-
-static int drbd_recv(struct drbd_connection *connection, void *buf, size_t size)
+static int drbd_recv(struct drbd_connection *connection, void **buf, size_t size, int flags)
 {
+	struct drbd_transport_ops *tr_ops = &connection->transport.class->ops;
 	int rv;
 
-	rv = drbd_recv_short(connection->data.socket, buf, size, 0);
+	rv = tr_ops->recv(&connection->transport, DATA_STREAM, buf, size, flags);
 
 	if (rv < 0) {
 		if (rv == -ECONNRESET)
 			drbd_info(connection, "sock was reset by peer\n");
 		else if (rv != -ERESTARTSYS)
-			drbd_err(connection, "sock_recvmsg returned %d\n", rv);
+			drbd_info(connection, "sock_recvmsg returned %d\n", rv);
 	} else if (rv == 0) {
-		if (test_bit(DISCONNECT_SENT, &connection->flags)) {
+		if (test_bit(DISCONNECT_EXPECTED, &connection->flags)) {
 			long t;
 			rcu_read_lock();
-			t = rcu_dereference(connection->net_conf)->ping_timeo * HZ/10;
+			t = rcu_dereference(connection->transport.net_conf)->ping_timeo * HZ/10;
 			rcu_read_unlock();
 
-			t = wait_event_timeout(connection->ping_wait, connection->cstate < C_WF_REPORT_PARAMS, t);
+			t = wait_event_timeout(connection->resource->state_wait,
+					       connection->cstate[NOW] < C_CONNECTED, t);
 
 			if (t)
 				goto out;
@@ -349,17 +636,32 @@ static int drbd_recv(struct drbd_connection *connection, void *buf, size_t size)
 	}
 
 	if (rv != size)
-		conn_request_state(connection, NS(conn, C_BROKEN_PIPE), CS_HARD);
+		change_cstate(connection, C_BROKEN_PIPE, CS_HARD);
 
 out:
 	return rv;
 }
 
-static int drbd_recv_all(struct drbd_connection *connection, void *buf, size_t size)
+static int drbd_recv_into(struct drbd_connection *connection, void *buf, size_t size)
+{
+	int err;
+
+	err = drbd_recv(connection, &buf, size, CALLER_BUFFER);
+
+	if (err != size) {
+		if (err >= 0)
+			err = -EIO;
+	} else
+		err = 0;
+	return err;
+}
+
+static int drbd_recv_all(struct drbd_connection *connection, void **buf, size_t size)
 {
 	int err;
 
-	err = drbd_recv(connection, buf, size);
+	err = drbd_recv(connection, buf, size, 0);
+
 	if (err != size) {
 		if (err >= 0)
 			err = -EIO;
@@ -368,7 +670,7 @@ static int drbd_recv_all(struct drbd_connection *connection, void *buf, size_t s
 	return err;
 }
 
-static int drbd_recv_all_warn(struct drbd_connection *connection, void *buf, size_t size)
+static int drbd_recv_all_warn(struct drbd_connection *connection, void **buf, size_t size)
 {
 	int err;
 
@@ -378,628 +680,545 @@ static int drbd_recv_all_warn(struct drbd_connection *connection, void *buf, siz
 	return err;
 }
 
-/* quoting tcp(7):
- *   On individual connections, the socket buffer size must be set prior to the
- *   listen(2) or connect(2) calls in order to have it take effect.
- * This is our wrapper to do so.
- */
-static void drbd_setbufsize(struct socket *sock, unsigned int snd,
-		unsigned int rcv)
+static int drbd_send_disconnect(struct drbd_connection *connection)
 {
-	/* open coded SO_SNDBUF, SO_RCVBUF */
-	if (snd) {
-		sock->sk->sk_sndbuf = snd;
-		sock->sk->sk_userlocks |= SOCK_SNDBUF_LOCK;
-	}
-	if (rcv) {
-		sock->sk->sk_rcvbuf = rcv;
-		sock->sk->sk_userlocks |= SOCK_RCVBUF_LOCK;
-	}
+	if (connection->agreed_pro_version < 118)
+		return 0;
+
+	if (!conn_prepare_command(connection, 0, DATA_STREAM))
+		return -EIO;
+	return send_command(connection, -1, P_DISCONNECT, DATA_STREAM);
 }
 
-static struct socket *drbd_try_connect(struct drbd_connection *connection)
+static void initialize_send_buffer(struct drbd_connection *connection, enum drbd_stream drbd_stream)
 {
-	const char *what;
-	struct socket *sock;
-	struct sockaddr_in6 src_in6;
-	struct sockaddr_in6 peer_in6;
-	struct net_conf *nc;
-	int err, peer_addr_len, my_addr_len;
-	int sndbuf_size, rcvbuf_size, connect_int;
-	int disconnect_on_error = 1;
-
-	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-	if (!nc) {
-		rcu_read_unlock();
-		return NULL;
-	}
-	sndbuf_size = nc->sndbuf_size;
-	rcvbuf_size = nc->rcvbuf_size;
-	connect_int = nc->connect_int;
-	rcu_read_unlock();
-
-	my_addr_len = min_t(int, connection->my_addr_len, sizeof(src_in6));
-	memcpy(&src_in6, &connection->my_addr, my_addr_len);
+	struct drbd_send_buffer *sbuf = &connection->send_buffer[drbd_stream];
 
-	if (((struct sockaddr *)&connection->my_addr)->sa_family == AF_INET6)
-		src_in6.sin6_port = 0;
-	else
-		((struct sockaddr_in *)&src_in6)->sin_port = 0; /* AF_INET & AF_SCI */
+	sbuf->unsent =
+	sbuf->pos = page_address(sbuf->page);
+	sbuf->allocated_size = 0;
+	sbuf->additional_size = 0;
+}
 
-	peer_addr_len = min_t(int, connection->peer_addr_len, sizeof(src_in6));
-	memcpy(&peer_in6, &connection->peer_addr, peer_addr_len);
+/* Gets called if a connection is established, or if a new minor gets created
+   in a connection */
+int drbd_connected(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+	u64 weak_nodes = 0;
+	int err;
 
-	what = "sock_create_kern";
-	err = sock_create_kern(&init_net, ((struct sockaddr *)&src_in6)->sa_family,
-			       SOCK_STREAM, IPPROTO_TCP, &sock);
-	if (err < 0) {
-		sock = NULL;
-		goto out;
-	}
+	atomic_set(&peer_device->packet_seq, 0);
+	peer_device->peer_seq = 0;
 
-	sock->sk->sk_rcvtimeo =
-	sock->sk->sk_sndtimeo = connect_int * HZ;
-	drbd_setbufsize(sock, sndbuf_size, rcvbuf_size);
-
-       /* explicitly bind to the configured IP as source IP
-	*  for the outgoing connections.
-	*  This is needed for multihomed hosts and to be
-	*  able to use lo: interfaces for drbd.
-	* Make sure to use 0 as port number, so linux selects
-	*  a free one dynamically.
-	*/
-	what = "bind before connect";
-	err = sock->ops->bind(sock, (struct sockaddr_unsized *) &src_in6, my_addr_len);
-	if (err < 0)
-		goto out;
+	if (device->resource->role[NOW] == R_PRIMARY)
+		weak_nodes = drbd_weak_nodes_device(device);
 
-	/* connect may fail, peer not yet available.
-	 * stay C_WF_CONNECTION, don't go Disconnecting! */
-	disconnect_on_error = 0;
-	what = "connect";
-	err = sock->ops->connect(sock, (struct sockaddr_unsized *) &peer_in6, peer_addr_len, 0);
+	err = drbd_send_sync_param(peer_device);
 
-out:
-	if (err < 0) {
-		if (sock) {
-			sock_release(sock);
-			sock = NULL;
-		}
-		switch (-err) {
-			/* timeout, busy, signal pending */
-		case ETIMEDOUT: case EAGAIN: case EINPROGRESS:
-		case EINTR: case ERESTARTSYS:
-			/* peer not (yet) available, network problem */
-		case ECONNREFUSED: case ENETUNREACH:
-		case EHOSTDOWN:    case EHOSTUNREACH:
-			disconnect_on_error = 0;
-			break;
-		default:
-			drbd_err(connection, "%s failed, err = %d\n", what, err);
-		}
-		if (disconnect_on_error)
-			conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
+	if (!err)
+		err = drbd_send_enable_replication_next(peer_device);
+	if (!err)
+		err = drbd_send_sizes(peer_device, 0, 0);
+	if (!err)
+		err = drbd_send_uuids(peer_device, 0, weak_nodes);
+	if (!err) {
+		set_bit(INITIAL_STATE_SENT, &peer_device->flags);
+		err = drbd_send_current_state(peer_device);
 	}
 
-	return sock;
+	clear_bit(USE_DEGR_WFC_T, &peer_device->flags);
+	clear_bit(RESIZE_PENDING, &peer_device->flags);
+	mod_timer(&device->request_timer, jiffies + HZ); /* just start it here. */
+	return err;
 }
 
-struct accept_wait_data {
-	struct drbd_connection *connection;
-	struct socket *s_listen;
-	struct completion door_bell;
-	void (*original_sk_state_change)(struct sock *sk);
-
-};
-
-static void drbd_incoming_connection(struct sock *sk)
+void conn_connect2(struct drbd_connection *connection)
 {
-	struct accept_wait_data *ad = sk->sk_user_data;
-	void (*state_change)(struct sock *sk);
+	struct drbd_peer_device *peer_device;
+	int vnr;
 
-	state_change = ad->original_sk_state_change;
-	if (sk->sk_state == TCP_ESTABLISHED)
-		complete(&ad->door_bell);
-	state_change(sk);
-}
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		struct drbd_device *device = peer_device->device;
 
-static int prepare_listen_socket(struct drbd_connection *connection, struct accept_wait_data *ad)
-{
-	int err, sndbuf_size, rcvbuf_size, my_addr_len;
-	struct sockaddr_in6 my_addr;
-	struct socket *s_listen;
-	struct net_conf *nc;
-	const char *what;
+		kref_get(&device->kref);
 
-	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-	if (!nc) {
+		/* connection cannot go away: caller holds a reference. */
 		rcu_read_unlock();
-		return -EIO;
+
+		/* In the compatibility case with protocol version < 110, that
+		 * is DRBD 8.4, we do not hold uuid_sem while exchanging the
+		 * initial UUID and state packets. There is no need because
+		 * there are no other peers which could interfere. */
+		if (connection->agreed_pro_version >= 110) {
+			down_read_non_owner(&device->uuid_sem);
+			set_bit(HOLDING_UUID_READ_LOCK, &peer_device->flags);
+			/* since drbd_connected() is also called from drbd_create_device()
+			   aquire lock here before calling drbd_connected(). */
+		}
+		drbd_connected(peer_device);
+
+		rcu_read_lock();
+		kref_put(&device->kref, drbd_destroy_device);
 	}
-	sndbuf_size = nc->sndbuf_size;
-	rcvbuf_size = nc->rcvbuf_size;
 	rcu_read_unlock();
+	drbd_uncork(connection, DATA_STREAM);
+}
 
-	my_addr_len = min_t(int, connection->my_addr_len, sizeof(struct sockaddr_in6));
-	memcpy(&my_addr, &connection->my_addr, my_addr_len);
+static bool initial_states_received(struct drbd_connection *connection)
+{
+	struct drbd_peer_device *peer_device;
+	int vnr;
+	bool rv = true;
 
-	what = "sock_create_kern";
-	err = sock_create_kern(&init_net, ((struct sockaddr *)&my_addr)->sa_family,
-			       SOCK_STREAM, IPPROTO_TCP, &s_listen);
-	if (err) {
-		s_listen = NULL;
-		goto out;
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		if (!test_bit(INITIAL_STATE_RECEIVED, &peer_device->flags)) {
+			rv = false;
+			break;
+		}
 	}
+	rcu_read_unlock();
 
-	s_listen->sk->sk_reuse = SK_CAN_REUSE; /* SO_REUSEADDR */
-	drbd_setbufsize(s_listen, sndbuf_size, rcvbuf_size);
-
-	what = "bind before listen";
-	err = s_listen->ops->bind(s_listen, (struct sockaddr_unsized *)&my_addr, my_addr_len);
-	if (err < 0)
-		goto out;
+	return rv;
+}
 
-	ad->s_listen = s_listen;
-	write_lock_bh(&s_listen->sk->sk_callback_lock);
-	ad->original_sk_state_change = s_listen->sk->sk_state_change;
-	s_listen->sk->sk_state_change = drbd_incoming_connection;
-	s_listen->sk->sk_user_data = ad;
-	write_unlock_bh(&s_listen->sk->sk_callback_lock);
+void wait_initial_states_received(struct drbd_connection *connection)
+{
+	struct net_conf *nc;
+	long timeout;
 
-	what = "listen";
-	err = s_listen->ops->listen(s_listen, 5);
-	if (err < 0)
-		goto out;
+	rcu_read_lock();
+	nc = rcu_dereference(connection->transport.net_conf);
+	timeout = nc->ping_timeo * HZ/10;
+	rcu_read_unlock();
+	wait_event_interruptible_timeout(connection->ee_wait,
+					 initial_states_received(connection),
+					 timeout);
+}
 
-	return 0;
-out:
-	if (s_listen)
-		sock_release(s_listen);
-	if (err < 0) {
-		if (err != -EAGAIN && err != -EINTR && err != -ERESTARTSYS) {
-			drbd_err(connection, "%s failed, err = %d\n", what, err);
-			conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
-		}
-	}
+void connect_timer_fn(struct timer_list *t)
+{
+	struct drbd_connection *connection = timer_container_of(connection, t, connect_timer);
 
-	return -EIO;
+	drbd_queue_work(&connection->sender_work, &connection->connect_timer_work);
 }
 
-static void unregister_state_change(struct sock *sk, struct accept_wait_data *ad)
+static void arm_connect_timer(struct drbd_connection *connection, unsigned long expires)
 {
-	write_lock_bh(&sk->sk_callback_lock);
-	sk->sk_state_change = ad->original_sk_state_change;
-	sk->sk_user_data = NULL;
-	write_unlock_bh(&sk->sk_callback_lock);
+	bool was_pending = mod_timer(&connection->connect_timer, expires);
+
+	if (was_pending) {
+		kref_put(&connection->kref, drbd_destroy_connection);
+	}
 }
 
-static struct socket *drbd_wait_for_connect(struct drbd_connection *connection, struct accept_wait_data *ad)
+static bool retry_by_rr_conflict(struct drbd_connection *connection)
 {
-	int timeo, connect_int, err = 0;
-	struct socket *s_estab = NULL;
+	enum drbd_after_sb_p rr_conflict;
 	struct net_conf *nc;
 
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-	if (!nc) {
-		rcu_read_unlock();
-		return NULL;
-	}
-	connect_int = nc->connect_int;
+	nc = rcu_dereference(connection->transport.net_conf);
+	rr_conflict = nc->rr_conflict;
 	rcu_read_unlock();
 
-	timeo = connect_int * HZ;
-	/* 28.5% random jitter */
-	timeo += get_random_u32_below(2) ? timeo / 7 : -timeo / 7;
-
-	err = wait_for_completion_interruptible_timeout(&ad->door_bell, timeo);
-	if (err <= 0)
-		return NULL;
-
-	err = kernel_accept(ad->s_listen, &s_estab, 0);
-	if (err < 0) {
-		if (err != -EAGAIN && err != -EINTR && err != -ERESTARTSYS) {
-			drbd_err(connection, "accept failed, err = %d\n", err);
-			conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
-		}
-	}
-
-	if (s_estab)
-		unregister_state_change(s_estab->sk, ad);
-
-	return s_estab;
+	return rr_conflict == ASB_RETRY_CONNECT;
 }
 
-static int decode_header(struct drbd_connection *, void *, struct packet_info *);
-
-static int send_first_packet(struct drbd_connection *connection, struct drbd_socket *sock,
-			     enum drbd_packet cmd)
+static void apply_local_state_change(struct drbd_connection *connection, enum ao_op ao_op, bool force_demote)
 {
-	if (!conn_prepare_command(connection, sock))
-		return -EIO;
-	return conn_send_command(connection, sock, cmd, 0, NULL, 0);
-}
+	/* Although the connect failed, outdate local disks if we learn from the
+	 * handshake that the peer has more recent data */
+	struct drbd_resource *resource = connection->resource;
+	unsigned long irq_flags;
+	int vnr;
 
-static int receive_first_packet(struct drbd_connection *connection, struct socket *sock)
-{
-	unsigned int header_size = drbd_header_size(connection);
-	struct packet_info pi;
-	struct net_conf *nc;
-	int err;
+	mutex_lock(&resource->open_release);
+	begin_state_change(resource, &irq_flags, CS_HARD | (force_demote ? CS_FS_IGN_OPENERS : 0));
+	if (ao_op == OUTDATE_DISKS_AND_DISCONNECT)
+		__change_cstate(connection, C_DISCONNECTING);
+	if (resource->role[NOW] == R_SECONDARY ||
+	    (resource->cached_susp && (
+		    resource->res_opts.on_no_data == OND_IO_ERROR ||
+		    resource->res_opts.on_susp_primary_outdated == SPO_FORCE_SECONDARY))) {
+		/* One day we might relax the above condition to
+		 * resource->role[NOW] == R_SECONDARY || resource->cached_susp
+		 * Right now it is that way, because we do not offer a way to gracefully
+		 * get out of a Primary/Outdated state */
+		struct drbd_peer_device *peer_device;
+		bool set_fail_io = false;
 
-	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-	if (!nc) {
-		rcu_read_unlock();
-		return -EIO;
-	}
-	sock->sk->sk_rcvtimeo = nc->ping_timeo * 4 * HZ / 10;
-	rcu_read_unlock();
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			enum drbd_repl_state r = peer_device->connect_state.conn;
+			struct drbd_device *device = peer_device->device;
 
-	err = drbd_recv_short(sock, connection->data.rbuf, header_size, 0);
-	if (err != header_size) {
-		if (err >= 0)
-			err = -EIO;
-		return err;
+			if (r == L_WF_BITMAP_T || r == L_SYNC_TARGET || r == L_PAUSED_SYNC_T)
+				__change_disk_state(device, D_OUTDATED);
+
+			if (device->open_cnt)
+				set_fail_io = true;
+		}
+		if (resource->role[NOW] == R_PRIMARY && force_demote) {
+			drbd_warn(connection, "Remote node has more recent data;"
+				  " force secondary!\n");
+			resource->role[NEW] = R_SECONDARY;
+			if (set_fail_io)
+				resource->fail_io[NEW] = true;
+		}
 	}
-	err = decode_header(connection, connection->data.rbuf, &pi);
-	if (err)
-		return err;
-	return pi.cmd;
+	end_state_change(resource, &irq_flags, "connect-failed");
+	mutex_unlock(&resource->open_release);
 }
 
-/**
- * drbd_socket_okay() - Free the socket if its connection is not okay
- * @sock:	pointer to the pointer to the socket.
- */
-static bool drbd_socket_okay(struct socket **sock)
+static int connect_work(struct drbd_work *work, int cancel)
 {
-	int rr;
-	char tb[4];
+	struct drbd_connection *connection =
+		container_of(work, struct drbd_connection, connect_timer_work);
+	struct drbd_resource *resource = connection->resource;
+	enum drbd_state_rv rv;
+	long t = resource->res_opts.auto_promote_timeout * HZ / 10;
+	bool retry = retry_by_rr_conflict(connection);
+	bool incompat_states, force_demote;
 
-	if (!*sock)
-		return false;
+	if (connection->cstate[NOW] != C_CONNECTING)
+		goto out_put;
 
-	rr = drbd_recv_short(*sock, tb, 4, MSG_DONTWAIT | MSG_PEEK);
+	if (connection->agreed_pro_version == 117)
+		wait_initial_states_received(connection);
 
-	if (rr > 0 || rr == -EAGAIN) {
-		return true;
+	do {
+		/* Carefully check if it is okay to do a two_phase_commit from sender context */
+		if (down_trylock(&resource->state_sem)) {
+			rv = SS_CONCURRENT_ST_CHG;
+			break;
+		}
+		rv = change_cstate_tag(connection, C_CONNECTED, CS_SERIALIZE |
+				   CS_ALREADY_SERIALIZED | CS_VERBOSE | CS_DONT_RETRY,
+				   "connected", NULL);
+		up(&resource->state_sem);
+		if (rv != SS_PRIMARY_READER)
+			break;
+
+		/* We have a connection established, peer is primary. On my side is a
+		   read-only opener, probably udev or some other scanning after device creating.
+		   This short lived read-only open prevents now that we can continue.
+		   Better retry after the read-only opener goes away. */
+
+		t = wait_event_interruptible_timeout(resource->state_wait,
+						     !drbd_open_ro_count(resource),
+						     t);
+	} while (t > 0);
+
+	incompat_states = (rv == SS_CW_FAILED_BY_PEER || rv == SS_TWO_PRIMARIES);
+	force_demote = resource->role[NOW] == R_PRIMARY &&
+		resource->res_opts.on_susp_primary_outdated == SPO_FORCE_SECONDARY;
+	retry = retry || force_demote;
+
+	if (rv >= SS_SUCCESS) {
+		if (connection->agreed_pro_version < 117)
+			conn_connect2(connection);
+	} else if (rv == SS_TIMEOUT || rv == SS_CONCURRENT_ST_CHG) {
+		if (connection->cstate[NOW] != C_CONNECTING)
+			goto out_put;
+		arm_connect_timer(connection, jiffies + HZ/20);
+		return 0; /* Return early. Keep the reference on the connection! */
+	} else if (rv == SS_HANDSHAKE_RETRY || (incompat_states && retry)) {
+		arm_connect_timer(connection, jiffies + HZ);
+		apply_local_state_change(connection, OUTDATE_DISKS, force_demote);
+		return 0; /* Keep reference */
+	} else if (rv == SS_HANDSHAKE_DISCONNECT || (incompat_states && !retry)) {
+		drbd_send_disconnect(connection);
+		apply_local_state_change(connection, OUTDATE_DISKS_AND_DISCONNECT, force_demote);
 	} else {
-		sock_release(*sock);
-		*sock = NULL;
-		return false;
+		drbd_info(connection, "Failure to connect: %s (%d); retrying\n",
+			  drbd_set_st_err_str(rv), rv);
+		change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
 	}
-}
-
-static bool connection_established(struct drbd_connection *connection,
-				   struct socket **sock1,
-				   struct socket **sock2)
-{
-	struct net_conf *nc;
-	int timeout;
-	bool ok;
 
-	if (!*sock1 || !*sock2)
-		return false;
-
-	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-	timeout = (nc->sock_check_timeo ?: nc->ping_timeo) * HZ / 10;
-	rcu_read_unlock();
-	schedule_timeout_interruptible(timeout);
-
-	ok = drbd_socket_okay(sock1);
-	ok = drbd_socket_okay(sock2) && ok;
-
-	return ok;
+ out_put:
+	kref_put(&connection->kref, drbd_destroy_connection);
+	return 0;
 }
 
-/* Gets called if a connection is established, or if a new minor gets created
-   in a connection */
-int drbd_connected(struct drbd_peer_device *peer_device)
+static int drbd_transport_connect(struct drbd_connection *connection)
 {
-	struct drbd_device *device = peer_device->device;
-	int err;
-
-	atomic_set(&device->packet_seq, 0);
-	device->peer_seq = 0;
+	struct drbd_transport *transport = &connection->transport;
+	struct drbd_resource *resource = connection->resource;
+	int err = 0;
 
-	device->state_mutex = peer_device->connection->agreed_pro_version < 100 ?
-		&peer_device->connection->cstate_mutex :
-		&device->own_state_mutex;
+	mutex_lock(&resource->conf_update);
+	err = transport->class->ops.prepare_connect(transport);
+	mutex_unlock(&resource->conf_update);
 
-	err = drbd_send_sync_param(peer_device);
-	if (!err)
-		err = drbd_send_sizes(peer_device, 0, 0);
-	if (!err)
-		err = drbd_send_uuids(peer_device);
 	if (!err)
-		err = drbd_send_current_state(peer_device);
-	clear_bit(USE_DEGR_WFC_T, &device->flags);
-	clear_bit(RESIZE_PENDING, &device->flags);
-	atomic_set(&device->ap_in_flight, 0);
-	mod_timer(&device->request_timer, jiffies + HZ); /* just start it here. */
+		err = transport->class->ops.connect(transport);
+
+	mutex_lock(&resource->conf_update);
+	transport->class->ops.finish_connect(transport);
+	mutex_unlock(&resource->conf_update);
+
 	return err;
 }
 
 /*
- * return values:
- *   1 yes, we have a valid connection
- *   0 oops, did not work out, please try again
- *  -1 peer talks different language,
- *     no point in trying again, please go standalone.
- *  -2 We do not have a network config...
+ * Returns true if we have a valid connection.
  */
-static int conn_connect(struct drbd_connection *connection)
+static bool conn_connect(struct drbd_connection *connection)
 {
-	struct drbd_socket sock, msock;
+	struct drbd_transport *transport = &connection->transport;
+	struct drbd_resource *resource = connection->resource;
+	int ping_timeo, ping_int, h, err, vnr;
 	struct drbd_peer_device *peer_device;
+	enum drbd_stream stream;
 	struct net_conf *nc;
-	int vnr, timeout, h;
-	bool discard_my_data, ok;
-	enum drbd_state_rv rv;
-	struct accept_wait_data ad = {
-		.connection = connection,
-		.door_bell = COMPLETION_INITIALIZER_ONSTACK(ad.door_bell),
-	};
-
-	clear_bit(DISCONNECT_SENT, &connection->flags);
-	if (conn_request_state(connection, NS(conn, C_WF_CONNECTION), CS_VERBOSE) < SS_SUCCESS)
-		return -2;
-
-	mutex_init(&sock.mutex);
-	sock.sbuf = connection->data.sbuf;
-	sock.rbuf = connection->data.rbuf;
-	sock.socket = NULL;
-	mutex_init(&msock.mutex);
-	msock.sbuf = connection->meta.sbuf;
-	msock.rbuf = connection->meta.rbuf;
-	msock.socket = NULL;
-
-	/* Assume that the peer only understands protocol 80 until we know better.  */
-	connection->agreed_pro_version = 80;
-
-	if (prepare_listen_socket(connection, &ad))
-		return 0;
+	bool discard_my_data;
+	bool have_mutex;
+	bool no_addr = false;
+
+start:
+	have_mutex = false;
+	clear_bit(PING_PENDING, &connection->flags);
+	clear_bit(DISCONNECT_EXPECTED, &connection->flags);
+	if (change_cstate_tag(connection, C_CONNECTING, CS_VERBOSE, "connecting", NULL)
+			< SS_SUCCESS) {
+		/* We do not have a network config. */
+		return false;
+	}
 
-	do {
-		struct socket *s;
-
-		s = drbd_try_connect(connection);
-		if (s) {
-			if (!sock.socket) {
-				sock.socket = s;
-				send_first_packet(connection, &sock, P_INITIAL_DATA);
-			} else if (!msock.socket) {
-				clear_bit(RESOLVE_CONFLICTS, &connection->flags);
-				msock.socket = s;
-				send_first_packet(connection, &msock, P_INITIAL_META);
-			} else {
-				drbd_err(connection, "Logic error in conn_connect()\n");
-				goto out_release_sockets;
-			}
-		}
+	/* Assume that the peer only understands our minimum supported
+	 * protocol version; until we know better. */
+	connection->agreed_pro_version = drbd_protocol_version_min;
 
-		if (connection_established(connection, &sock.socket, &msock.socket))
-			break;
+	err = drbd_transport_connect(connection);
+	if (err == -EAGAIN) {
+		enum drbd_conn_state cstate;
+		read_lock_irq(&resource->state_rwlock); /* See commit message */
+		cstate = connection->cstate[NOW];
+		read_unlock_irq(&resource->state_rwlock);
+		if (cstate == C_DISCONNECTING)
+			return false;
+		goto retry;
+	} else if (err == -EADDRNOTAVAIL) {
+		struct net_conf *nc;
+		int connect_int;
+		long t;
 
-retry:
-		s = drbd_wait_for_connect(connection, &ad);
-		if (s) {
-			int fp = receive_first_packet(connection, s);
-			drbd_socket_okay(&sock.socket);
-			drbd_socket_okay(&msock.socket);
-			switch (fp) {
-			case P_INITIAL_DATA:
-				if (sock.socket) {
-					drbd_warn(connection, "initial packet S crossed\n");
-					sock_release(sock.socket);
-					sock.socket = s;
-					goto randomize;
-				}
-				sock.socket = s;
-				break;
-			case P_INITIAL_META:
-				set_bit(RESOLVE_CONFLICTS, &connection->flags);
-				if (msock.socket) {
-					drbd_warn(connection, "initial packet M crossed\n");
-					sock_release(msock.socket);
-					msock.socket = s;
-					goto randomize;
-				}
-				msock.socket = s;
-				break;
-			default:
-				drbd_warn(connection, "Error receiving initial packet\n");
-				sock_release(s);
-randomize:
-				if (get_random_u32_below(2))
-					goto retry;
-			}
-		}
+		rcu_read_lock();
+		nc = rcu_dereference(transport->net_conf);
+		connect_int = nc ? nc->connect_int : 10;
+		rcu_read_unlock();
 
-		if (connection->cstate <= C_DISCONNECTING)
-			goto out_release_sockets;
-		if (signal_pending(current)) {
-			flush_signals(current);
-			smp_rmb();
-			if (get_t_state(&connection->receiver) == EXITING)
-				goto out_release_sockets;
+		if (!no_addr) {
+			drbd_warn(connection,
+				  "Configured local address not found, retrying every %d sec, "
+				  "err=%d\n", connect_int, err);
+			no_addr = true;
 		}
 
-		ok = connection_established(connection, &sock.socket, &msock.socket);
-	} while (!ok);
-
-	if (ad.s_listen)
-		sock_release(ad.s_listen);
-
-	sock.socket->sk->sk_reuse = SK_CAN_REUSE; /* SO_REUSEADDR */
-	msock.socket->sk->sk_reuse = SK_CAN_REUSE; /* SO_REUSEADDR */
-
-	sock.socket->sk->sk_allocation = GFP_NOIO;
-	msock.socket->sk->sk_allocation = GFP_NOIO;
-
-	sock.socket->sk->sk_use_task_frag = false;
-	msock.socket->sk->sk_use_task_frag = false;
+		t = schedule_timeout_interruptible(connect_int * HZ);
+		if (t || connection->cstate[NOW] == C_DISCONNECTING)
+			return false;
+		goto start;
+	} else if (err == -EDESTADDRREQ) {
+		/*
+		 * No destination address, we cannot possibly make a connection.
+		 * Maybe a resource was partially left over due to some other bug?
+		 * Either way, abort here and go StandAlone to prevent reconnection.
+		 */
+		drbd_err(connection, "No destination address, err=%d\n", err);
+		change_cstate_tag(connection, C_STANDALONE, CS_HARD, "no-dest-addr", NULL);
+		return false;
+	} else if (err < 0) {
+		drbd_warn(connection, "Failed to initiate connection, err=%d\n", err);
+		goto abort;
+	}
 
-	sock.socket->sk->sk_priority = TC_PRIO_INTERACTIVE_BULK;
-	msock.socket->sk->sk_priority = TC_PRIO_INTERACTIVE;
+	connection->reassemble_buffer.avail = 0;
 
-	/* NOT YET ...
-	 * sock.socket->sk->sk_sndtimeo = connection->net_conf->timeout*HZ/10;
-	 * sock.socket->sk->sk_rcvtimeo = MAX_SCHEDULE_TIMEOUT;
-	 * first set it to the P_CONNECTION_FEATURES timeout,
-	 * which we set to 4x the configured ping_timeout. */
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-
-	sock.socket->sk->sk_sndtimeo =
-	sock.socket->sk->sk_rcvtimeo = nc->ping_timeo*4*HZ/10;
-
-	msock.socket->sk->sk_rcvtimeo = nc->ping_int*HZ;
-	timeout = nc->timeout * HZ / 10;
-	discard_my_data = nc->discard_my_data;
+	nc = rcu_dereference(connection->transport.net_conf);
+	ping_timeo = nc->ping_timeo;
+	ping_int = nc->ping_int;
 	rcu_read_unlock();
 
-	msock.socket->sk->sk_sndtimeo = timeout;
-
-	/* we don't want delays.
-	 * we use TCP_CORK where appropriate, though */
-	tcp_sock_set_nodelay(sock.socket->sk);
-	tcp_sock_set_nodelay(msock.socket->sk);
+	/* Make sure we are "uncorked", otherwise we risk timeouts,
+	 * in case this is a reconnect and we had been corked before. */
+	for (stream = DATA_STREAM; stream <= CONTROL_STREAM; stream++) {
+		initialize_send_buffer(connection, stream);
+		drbd_uncork(connection, stream);
+	}
 
-	connection->data.socket = sock.socket;
-	connection->meta.socket = msock.socket;
-	connection->last_received = jiffies;
+	/* Make sure the handshake happens without interference from other threads,
+	 * or the challenge response authentication could be garbled. */
+	mutex_lock(&connection->mutex[DATA_STREAM]);
+	have_mutex = true;
+	transport->class->ops.set_rcvtimeo(transport, DATA_STREAM, ping_timeo * 4 * HZ/10);
+	transport->class->ops.set_rcvtimeo(transport, CONTROL_STREAM, ping_int * HZ);
 
 	h = drbd_do_features(connection);
-	if (h <= 0)
-		return h;
+	if (h < 0)
+		goto abort;
+	if (h == 0)
+		goto retry;
 
 	if (connection->cram_hmac_tfm) {
-		/* drbd_request_state(device, NS(conn, WFAuth)); */
 		switch (drbd_do_auth(connection)) {
 		case -1:
 			drbd_err(connection, "Authentication of peer failed\n");
-			return -1;
+			goto abort;
 		case 0:
 			drbd_err(connection, "Authentication of peer failed, trying again.\n");
-			return 0;
+			goto retry;
 		}
 	}
 
-	connection->data.socket->sk->sk_sndtimeo = timeout;
-	connection->data.socket->sk->sk_rcvtimeo = MAX_SCHEDULE_TIMEOUT;
-
-	if (drbd_send_protocol(connection) == -EOPNOTSUPP)
-		return -1;
-
-	/* Prevent a race between resync-handshake and
-	 * being promoted to Primary.
-	 *
-	 * Grab and release the state mutex, so we know that any current
-	 * drbd_set_role() is finished, and any incoming drbd_set_role
-	 * will see the STATE_SENT flag, and wait for it to be cleared.
-	 */
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr)
-		mutex_lock(peer_device->device->state_mutex);
-
-	/* avoid a race with conn_request_state( C_DISCONNECTING ) */
-	spin_lock_irq(&connection->resource->req_lock);
-	set_bit(STATE_SENT, &connection->flags);
-	spin_unlock_irq(&connection->resource->req_lock);
+	discard_my_data = test_bit(CONN_DISCARD_MY_DATA, &connection->flags);
 
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr)
-		mutex_unlock(peer_device->device->state_mutex);
+	if (__drbd_send_protocol(connection, P_PROTOCOL) == -EOPNOTSUPP)
+		goto abort;
 
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
-		kref_get(&device->kref);
-		rcu_read_unlock();
-
+		set_bit(REPLICATION_NEXT, &peer_device->flags);
 		if (discard_my_data)
-			set_bit(DISCARD_MY_DATA, &device->flags);
+			set_bit(DISCARD_MY_DATA, &peer_device->flags);
 		else
-			clear_bit(DISCARD_MY_DATA, &device->flags);
-
-		drbd_connected(peer_device);
-		kref_put(&device->kref, drbd_destroy_device);
-		rcu_read_lock();
+			clear_bit(DISCARD_MY_DATA, &peer_device->flags);
 	}
 	rcu_read_unlock();
+	mutex_unlock(&connection->mutex[DATA_STREAM]);
+	have_mutex = false;
 
-	rv = conn_request_state(connection, NS(conn, C_WF_REPORT_PARAMS), CS_VERBOSE);
-	if (rv < SS_SUCCESS || connection->cstate != C_WF_REPORT_PARAMS) {
-		clear_bit(STATE_SENT, &connection->flags);
-		return 0;
-	}
-
-	drbd_thread_start(&connection->ack_receiver);
-	/* opencoded create_singlethread_workqueue(),
-	 * to be able to use format string arguments */
 	connection->ack_sender =
-		alloc_ordered_workqueue("drbd_as_%s", WQ_MEM_RECLAIM, connection->resource->name);
+		alloc_ordered_workqueue("drbd_as_%s", WQ_MEM_RECLAIM, resource->name);
 	if (!connection->ack_sender) {
 		drbd_err(connection, "Failed to create workqueue ack_sender\n");
-		return 0;
+		schedule_timeout_uninterruptible(HZ);
+		goto retry;
 	}
 
-	mutex_lock(&connection->resource->conf_update);
-	/* The discard_my_data flag is a single-shot modifier to the next
-	 * connection attempt, the handshake of which is now well underway.
-	 * No need for rcu style copying of the whole struct
-	 * just to clear a single value. */
-	connection->net_conf->discard_my_data = 0;
-	mutex_unlock(&connection->resource->conf_update);
+	atomic_set(&connection->ap_in_flight, 0);
+	atomic_set(&connection->rs_in_flight, 0);
 
-	return h;
+	if (connection->agreed_pro_version >= 110) {
+		/* Allow 10 times the ping_timeo for two-phase commits. That is
+		 * 5 seconds by default. The unit of ping_timeo is tenths of a
+		 * second. */
+		transport->class->ops.set_rcvtimeo(transport, DATA_STREAM, ping_timeo * HZ);
 
-out_release_sockets:
-	if (ad.s_listen)
-		sock_release(ad.s_listen);
-	if (sock.socket)
-		sock_release(sock.socket);
-	if (msock.socket)
-		sock_release(msock.socket);
-	return -1;
+		if (connection->agreed_pro_version == 117)
+			conn_connect2(connection);
+
+		if (resource->res_opts.node_id < connection->peer_node_id) {
+			kref_get(&connection->kref);
+			connection->connect_timer_work.cb = connect_work;
+			arm_connect_timer(connection, jiffies);
+		}
+	} else {
+		enum drbd_state_rv rv;
+		rv = change_cstate(connection, C_CONNECTED,
+				   CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE | CS_LOCAL_ONLY);
+		if (rv < SS_SUCCESS || connection->cstate[NOW] != C_CONNECTED)
+			goto retry;
+		conn_connect2(connection);
+	}
+
+	clear_bit(PING_TIMEOUT_ACTIVE, &connection->flags);
+	return true;
+
+retry:
+	if (have_mutex)
+		mutex_unlock(&connection->mutex[DATA_STREAM]);
+	conn_disconnect(connection);
+	schedule_timeout_interruptible(HZ);
+	goto start;
+
+abort:
+	if (have_mutex)
+		mutex_unlock(&connection->mutex[DATA_STREAM]);
+	change_cstate(connection, C_DISCONNECTING, CS_HARD);
+	return false;
 }
 
-static int decode_header(struct drbd_connection *connection, void *header, struct packet_info *pi)
+static unsigned int decode_header_size(const void *header)
 {
-	unsigned int header_size = drbd_header_size(connection);
+	const u32 first_dword = *(u32 *)header;
+	const u16 first_word = *(u16 *)header;
 
-	if (header_size == sizeof(struct p_header100) &&
-	    *(__be32 *)header == cpu_to_be32(DRBD_MAGIC_100)) {
-		struct p_header100 *h = header;
-		if (h->pad != 0) {
-			drbd_err(connection, "Header padding is not zero\n");
-			return -EINVAL;
-		}
-		pi->vnr = be16_to_cpu(h->volume);
+	return first_dword == cpu_to_be32(DRBD_MAGIC_100) ? sizeof(struct p_header100) :
+		first_word == cpu_to_be16(DRBD_MAGIC_BIG) ? sizeof(struct p_header95) :
+		sizeof(struct p_header80);
+}
+
+static int __decode_header(const void *header, struct packet_info *pi)
+{
+	const u32 first_dword = *(u32 *)header;
+	const u16 first_word = *(u16 *)header;
+	unsigned int header_size;
+	int header_version;
+
+	if (first_dword == cpu_to_be32(DRBD_MAGIC_100)) {
+		const struct p_header100 *h = header;
+		u16 vnr = be16_to_cpu(h->volume);
+
+		if (h->pad != 0)
+			return -ENOENT;
+
+		pi->vnr = vnr == ((u16) 0xFFFF) ? -1 : vnr;
 		pi->cmd = be16_to_cpu(h->command);
 		pi->size = be32_to_cpu(h->length);
-	} else if (header_size == sizeof(struct p_header95) &&
-		   *(__be16 *)header == cpu_to_be16(DRBD_MAGIC_BIG)) {
-		struct p_header95 *h = header;
+		header_size = sizeof(*h);
+		header_version = 100;
+	} else if (first_word == cpu_to_be16(DRBD_MAGIC_BIG)) {
+		const struct p_header95 *h = header;
+
 		pi->cmd = be16_to_cpu(h->command);
 		pi->size = be32_to_cpu(h->length);
 		pi->vnr = 0;
-	} else if (header_size == sizeof(struct p_header80) &&
-		   *(__be32 *)header == cpu_to_be32(DRBD_MAGIC)) {
-		struct p_header80 *h = header;
+		header_size = sizeof(*h);
+		header_version = 95;
+	} else if (first_dword == cpu_to_be32(DRBD_MAGIC)) {
+		const struct p_header80 *h = header;
+
 		pi->cmd = be16_to_cpu(h->command);
 		pi->size = be16_to_cpu(h->length);
 		pi->vnr = 0;
+		header_size = sizeof(*h);
+		header_version = 80;
 	} else {
-		drbd_err(connection, "Wrong magic value 0x%08x in protocol version %d\n",
-			 be32_to_cpu(*(__be32 *)header),
-			 connection->agreed_pro_version);
 		return -EINVAL;
 	}
-	pi->data = header + header_size;
+
+	pi->data = (void *)(header + header_size); /* casting away 'const'! */
+	return header_version;
+}
+
+static bool header_version_good(int header_version, int protocol_version)
+{
+	switch (header_version) {
+	case 100: return protocol_version >= 100;
+	case 95: return protocol_version < 100;
+	case 80: return protocol_version < 95;
+	default: return false;
+	}
+}
+
+static int decode_header(struct drbd_connection *connection, const void *header,
+			 struct packet_info *pi)
+{
+	const int agreed_pro_version = connection->agreed_pro_version;
+	int header_version = __decode_header(header, pi);
+
+	if (header_version == -ENOENT) {
+		drbd_err(connection, "Header padding is not zero\n");
+		return -EINVAL;
+	} else if (header_version < 0 || !header_version_good(header_version, agreed_pro_version)) {
+		drbd_err(connection, "Wrong magic value 0x%08x in protocol version %d, %d [data]\n",
+			 be32_to_cpu(*(__be32 *)header), agreed_pro_version, header_version);
+		return -EINVAL;
+	}
 	return 0;
 }
 
@@ -1013,49 +1232,58 @@ static void drbd_unplug_all_devices(struct drbd_connection *connection)
 
 static int drbd_recv_header(struct drbd_connection *connection, struct packet_info *pi)
 {
-	void *buffer = connection->data.rbuf;
+	void *buffer;
 	int err;
 
-	err = drbd_recv_all_warn(connection, buffer, drbd_header_size(connection));
+	err = drbd_recv_all_warn(connection, &buffer, drbd_header_size(connection));
 	if (err)
 		return err;
 
 	err = decode_header(connection, buffer, pi);
-	connection->last_received = jiffies;
 
 	return err;
 }
 
 static int drbd_recv_header_maybe_unplug(struct drbd_connection *connection, struct packet_info *pi)
 {
-	void *buffer = connection->data.rbuf;
+	struct drbd_transport_ops *tr_ops = &connection->transport.class->ops;
 	unsigned int size = drbd_header_size(connection);
+	void *buffer;
 	int err;
 
-	err = drbd_recv_short(connection->data.socket, buffer, size, MSG_NOSIGNAL|MSG_DONTWAIT);
+	err = tr_ops->recv(&connection->transport, DATA_STREAM, &buffer,
+			   size, MSG_NOSIGNAL | MSG_DONTWAIT);
 	if (err != size) {
+		int rflags = 0;
+
 		/* If we have nothing in the receive buffer now, to reduce
 		 * application latency, try to drain the backend queues as
 		 * quickly as possible, and let remote TCP know what we have
 		 * received so far. */
 		if (err == -EAGAIN) {
-			tcp_sock_set_quickack(connection->data.socket->sk, 2);
+			tr_ops->hint(&connection->transport, DATA_STREAM, QUICKACK);
 			drbd_unplug_all_devices(connection);
-		}
-		if (err > 0) {
-			buffer += err;
+		} else if (err > 0) {
 			size -= err;
+			rflags |= GROW_BUFFER;
 		}
-		err = drbd_recv_all_warn(connection, buffer, size);
+
+		err = drbd_recv(connection, &buffer, size, rflags);
+		if (err != size) {
+			if (err >= 0)
+				err = -EIO;
+		} else
+			err = 0;
+
 		if (err)
 			return err;
 	}
 
-	err = decode_header(connection, connection->data.rbuf, pi);
-	connection->last_received = jiffies;
+	err = decode_header(connection, buffer, pi);
 
 	return err;
 }
+
 /* This is blkdev_issue_flush, but asynchronous.
  * We want to submit to all component volumes in parallel,
  * then wait for all completions.
@@ -1076,9 +1304,11 @@ static void one_flush_endio(struct bio *bio)
 	struct drbd_device *device = octx->device;
 	struct issue_flush_context *ctx = octx->ctx;
 
-	if (bio->bi_status) {
-		ctx->error = blk_status_to_errno(bio->bi_status);
-		drbd_info(device, "local disk FLUSH FAILED with status %d\n", bio->bi_status);
+	blk_status_t status = bio->bi_status;
+
+	if (status) {
+		ctx->error = blk_status_to_errno(status);
+		drbd_info(device, "local disk FLUSH FAILED with status %d\n", status);
 	}
 	kfree(octx);
 	bio_put(bio);
@@ -1094,7 +1324,7 @@ static void one_flush_endio(struct bio *bio)
 static void submit_one_flush(struct drbd_device *device, struct issue_flush_context *ctx)
 {
 	struct bio *bio = bio_alloc(device->ldev->backing_bdev, 0,
-				    REQ_OP_WRITE | REQ_PREFLUSH, GFP_NOIO);
+			REQ_OP_WRITE | REQ_PREFLUSH, GFP_NOIO);
 	struct one_flush_context *octx = kmalloc_obj(*octx, GFP_NOIO);
 
 	if (!octx) {
@@ -1121,10 +1351,12 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 	submit_bio(bio);
 }
 
-static void drbd_flush(struct drbd_connection *connection)
+static enum finish_epoch drbd_flush_after_epoch(struct drbd_connection *connection, struct drbd_epoch *epoch)
 {
-	if (connection->resource->write_ordering >= WO_BDEV_FLUSH) {
-		struct drbd_peer_device *peer_device;
+	struct drbd_resource *resource = connection->resource;
+
+	if (resource->write_ordering >= WO_BDEV_FLUSH) {
+		struct drbd_device *device;
 		struct issue_flush_context ctx;
 		int vnr;
 
@@ -1133,9 +1365,7 @@ static void drbd_flush(struct drbd_connection *connection)
 		init_completion(&ctx.done);
 
 		rcu_read_lock();
-		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-			struct drbd_device *device = peer_device->device;
-
+		idr_for_each_entry(&resource->devices, device, vnr) {
 			if (!get_ldev(device))
 				continue;
 			kref_get(&device->kref);
@@ -1160,6 +1390,88 @@ static void drbd_flush(struct drbd_connection *connection)
 			drbd_bump_write_ordering(connection->resource, NULL, WO_DRAIN_IO);
 		}
 	}
+
+	/* If called before sending P_CONFIRM_STABLE, we don't have the epoch
+	 * (and must not finish it yet, anyways) */
+	if (epoch == NULL)
+		return FE_STILL_LIVE;
+	return drbd_may_finish_epoch(connection, epoch, EV_BARRIER_DONE);
+}
+
+static int w_flush(struct drbd_work *w, int cancel)
+{
+	struct flush_work *fw = container_of(w, struct flush_work, w);
+	struct drbd_epoch *epoch = fw->epoch;
+	struct drbd_connection *connection = epoch->connection;
+
+	kfree(fw);
+
+	if (!test_and_set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &epoch->flags))
+		drbd_flush_after_epoch(connection, epoch);
+
+	drbd_may_finish_epoch(connection, epoch, EV_PUT |
+			      (connection->cstate[NOW] < C_CONNECTED ? EV_CLEANUP : 0));
+
+	return 0;
+}
+
+static void drbd_send_b_ack(struct drbd_connection *connection, u32 barrier_nr, u32 set_size)
+{
+	struct p_barrier_ack *p;
+
+	if (connection->cstate[NOW] < C_CONNECTED)
+		return;
+
+	p = conn_prepare_command(connection, sizeof(*p), CONTROL_STREAM);
+	if (!p)
+		return;
+	p->barrier = barrier_nr;
+	p->set_size = cpu_to_be32(set_size);
+	send_command(connection, -1, P_BARRIER_ACK, CONTROL_STREAM);
+}
+
+static void drbd_send_confirm_stable(struct drbd_peer_request *peer_req)
+{
+	struct drbd_connection *connection = peer_req->peer_device->connection;
+	struct drbd_epoch *epoch = peer_req->epoch;
+	struct drbd_peer_request *oldest, *youngest;
+	struct p_confirm_stable *p;
+	int count;
+
+	if (connection->cstate[NOW] < C_CONNECTED)
+		return;
+
+	/* peer_req is not on stable storage yet, but the only one in this epoch.
+	 * Nothing to confirm, just wait for the normal barrier_ack and peer_ack
+	 * to do their work. */
+	oldest = epoch->oldest_unconfirmed_peer_req;
+	if (oldest == peer_req)
+		return;
+
+	p = conn_prepare_command(connection, sizeof(*p), CONTROL_STREAM);
+	if (!p)
+		return;
+
+	/* peer_req has not been added to connection->peer_requests yet, so
+	 * connection->peer_requests.prev is the youngest request that should
+	 * now be on stable storage. */
+	spin_lock_irq(&connection->peer_reqs_lock);
+	youngest = list_entry(connection->peer_requests.prev, struct drbd_peer_request, recv_order);
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	count = atomic_read(&epoch->epoch_size) - atomic_read(&epoch->confirmed) - 1;
+	atomic_add(count, &epoch->confirmed);
+	epoch->oldest_unconfirmed_peer_req = peer_req;
+
+	D_ASSERT(connection, oldest->epoch == youngest->epoch);
+	D_ASSERT(connection, count > 0);
+
+	p->oldest_block_id = oldest->block_id;
+	p->youngest_block_id = youngest->block_id;
+	p->set_size = cpu_to_be32(count);
+	p->pad = 0;
+
+	send_command(connection, -1, P_CONFIRM_STABLE, CONTROL_STREAM);
 }
 
 /**
@@ -1172,13 +1484,16 @@ static enum finish_epoch drbd_may_finish_epoch(struct drbd_connection *connectio
 					       struct drbd_epoch *epoch,
 					       enum epoch_event ev)
 {
-	int epoch_size;
+	int finish, epoch_size;
 	struct drbd_epoch *next_epoch;
+	int schedule_flush = 0;
 	enum finish_epoch rv = FE_STILL_LIVE;
+	struct drbd_resource *resource = connection->resource;
 
 	spin_lock(&connection->epoch_lock);
 	do {
 		next_epoch = NULL;
+		finish = 0;
 
 		epoch_size = atomic_read(&epoch->epoch_size);
 
@@ -1188,6 +1503,16 @@ static enum finish_epoch drbd_may_finish_epoch(struct drbd_connection *connectio
 			break;
 		case EV_GOT_BARRIER_NR:
 			set_bit(DE_HAVE_BARRIER_NUMBER, &epoch->flags);
+
+			/* Special case: If we just switched from WO_BIO_BARRIER to
+			   WO_BDEV_FLUSH we should not finish the current epoch */
+			if (test_bit(DE_CONTAINS_A_BARRIER, &epoch->flags) && epoch_size == 1 &&
+			    resource->write_ordering != WO_BIO_BARRIER &&
+			    epoch == connection->current_epoch)
+				clear_bit(DE_CONTAINS_A_BARRIER, &epoch->flags);
+			break;
+		case EV_BARRIER_DONE:
+			set_bit(DE_BARRIER_IN_NEXT_EPOCH_DONE, &epoch->flags);
 			break;
 		case EV_BECAME_LAST:
 			/* nothing to do*/
@@ -1196,18 +1521,30 @@ static enum finish_epoch drbd_may_finish_epoch(struct drbd_connection *connectio
 
 		if (epoch_size != 0 &&
 		    atomic_read(&epoch->active) == 0 &&
-		    (test_bit(DE_HAVE_BARRIER_NUMBER, &epoch->flags) || ev & EV_CLEANUP)) {
+		    (test_bit(DE_HAVE_BARRIER_NUMBER, &epoch->flags) || ev & EV_CLEANUP) &&
+		    epoch->list.prev == &connection->current_epoch->list &&
+		    !test_bit(DE_IS_FINISHING, &epoch->flags)) {
+			/* Nearly all conditions are met to finish that epoch... */
+			if (test_bit(DE_BARRIER_IN_NEXT_EPOCH_DONE, &epoch->flags) ||
+			    resource->write_ordering == WO_NONE ||
+			    (epoch_size == 1 && test_bit(DE_CONTAINS_A_BARRIER, &epoch->flags)) ||
+			    ev & EV_CLEANUP) {
+				finish = 1;
+				set_bit(DE_IS_FINISHING, &epoch->flags);
+			} else if (!test_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &epoch->flags) &&
+				 resource->write_ordering == WO_BIO_BARRIER) {
+				atomic_inc(&epoch->active);
+				schedule_flush = 1;
+			}
+		}
+		if (finish) {
 			if (!(ev & EV_CLEANUP)) {
+				/* adjust for nr requests already confirmed via P_CONFIRM_STABLE, if any. */
+				epoch_size -= atomic_read(&epoch->confirmed);
 				spin_unlock(&connection->epoch_lock);
 				drbd_send_b_ack(epoch->connection, epoch->barrier_nr, epoch_size);
 				spin_lock(&connection->epoch_lock);
 			}
-#if 0
-			/* FIXME: dec unacked on connection, once we have
-			 * something to count pending connection packets in. */
-			if (test_bit(DE_HAVE_BARRIER_NUMBER, &epoch->flags))
-				dec_unacked(epoch->connection);
-#endif
 
 			if (connection->current_epoch != epoch) {
 				next_epoch = list_entry(epoch->list.next, struct drbd_epoch, list);
@@ -1219,9 +1556,11 @@ static enum finish_epoch drbd_may_finish_epoch(struct drbd_connection *connectio
 				if (rv == FE_STILL_LIVE)
 					rv = FE_DESTROYED;
 			} else {
+				epoch->oldest_unconfirmed_peer_req = NULL;
 				epoch->flags = 0;
 				atomic_set(&epoch->epoch_size, 0);
-				/* atomic_set(&epoch->active, 0); is already zero */
+				atomic_set(&epoch->confirmed, 0);
+				/* atomic_set(&epoch->active, 0); is alrady zero */
 				if (rv == FE_STILL_LIVE)
 					rv = FE_RECYCLED;
 			}
@@ -1235,6 +1574,22 @@ static enum finish_epoch drbd_may_finish_epoch(struct drbd_connection *connectio
 
 	spin_unlock(&connection->epoch_lock);
 
+	if (schedule_flush) {
+		struct flush_work *fw;
+		fw = kmalloc_obj(*fw, GFP_ATOMIC);
+		if (fw) {
+			fw->w.cb = w_flush;
+			fw->epoch = epoch;
+			drbd_queue_work(&resource->work, &fw->w);
+		} else {
+			drbd_warn(resource, "Could not kmalloc a flush_work obj\n");
+			set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &epoch->flags);
+			/* That is not a recursion, only one level */
+			drbd_may_finish_epoch(connection, epoch, EV_BARRIER_DONE);
+			drbd_may_finish_epoch(connection, epoch, EV_PUT);
+		}
+	}
+
 	return rv;
 }
 
@@ -1245,6 +1600,8 @@ max_allowed_wo(struct drbd_backing_dev *bdev, enum write_ordering_e wo)
 
 	dc = rcu_dereference(bdev->disk_conf);
 
+	if (wo == WO_BIO_BARRIER && !dc->disk_barrier)
+		wo = WO_BDEV_FLUSH;
 	if (wo == WO_BDEV_FLUSH && !dc->disk_flushes)
 		wo = WO_DRAIN_IO;
 	if (wo == WO_DRAIN_IO && !dc->disk_drain)
@@ -1262,18 +1619,22 @@ void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backin
 {
 	struct drbd_device *device;
 	enum write_ordering_e pwo;
-	int vnr;
+	int vnr, i = 0;
 	static char *write_ordering_str[] = {
 		[WO_NONE] = "none",
 		[WO_DRAIN_IO] = "drain",
 		[WO_BDEV_FLUSH] = "flush",
+		[WO_BIO_BARRIER] = "barrier",
 	};
 
 	pwo = resource->write_ordering;
-	if (wo != WO_BDEV_FLUSH)
+	if (wo != WO_BIO_BARRIER)
 		wo = min(pwo, wo);
 	rcu_read_lock();
 	idr_for_each_entry(&resource->devices, device, vnr) {
+		if (i++ == 1 && wo == WO_BIO_BARRIER)
+			wo = WO_BDEV_FLUSH; /* WO = barrier does not handle multiple volumes */
+
 		if (get_ldev(device)) {
 			wo = max_allowed_wo(device->ldev, wo);
 			if (device->ldev == bdev)
@@ -1288,21 +1649,11 @@ void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backin
 	rcu_read_unlock();
 
 	resource->write_ordering = wo;
-	if (pwo != resource->write_ordering || wo == WO_BDEV_FLUSH)
+	if (pwo != resource->write_ordering || wo == WO_BIO_BARRIER)
 		drbd_info(resource, "Method to ensure write ordering: %s\n", write_ordering_str[resource->write_ordering]);
 }
 
 /*
- * Mapping "discard" to ZEROOUT with UNMAP does not work for us:
- * Drivers have to "announce" q->limits.max_write_zeroes_sectors, or it
- * will directly go to fallback mode, submitting normal writes, and
- * never even try to UNMAP.
- *
- * And dm-thin does not do this (yet), mostly because in general it has
- * to assume that "skip_block_zeroing" is set.  See also:
- * https://www.mail-archive.com/dm-devel%40redhat.com/msg07965.html
- * https://www.redhat.com/archives/dm-devel/2018-January/msg00271.html
- *
  * We *may* ignore the discard-zeroes-data setting, if so configured.
  *
  * Assumption is that this "discard_zeroes_data=0" is only because the backend
@@ -1325,6 +1676,7 @@ void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backin
 int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, unsigned int nr_sectors, int flags)
 {
 	struct block_device *bdev = device->ldev->backing_bdev;
+	struct request_queue *q = bdev_get_queue(bdev);
 	sector_t tmp, nr;
 	unsigned int max_discard_sectors, granularity;
 	int alignment;
@@ -1334,7 +1686,7 @@ int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, u
 		goto zero_out;
 
 	/* Zero-sector (unknown) and one-sector granularities are the same.  */
-	granularity = max(bdev_discard_granularity(bdev) >> 9, 1U);
+	granularity = max(q->limits.discard_granularity >> 9, 1U);
 	alignment = (bdev_discard_alignment(bdev) >> 9) % granularity;
 
 	max_discard_sectors = min(bdev_max_discard_sectors(bdev), (1U << 22));
@@ -1361,8 +1713,7 @@ int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, u
 		start = tmp;
 	}
 	while (nr_sectors >= max_discard_sectors) {
-		err |= blkdev_issue_discard(bdev, start, max_discard_sectors,
-					    GFP_NOIO);
+		err |= blkdev_issue_discard(bdev, start, max_discard_sectors, GFP_NOIO);
 		nr_sectors -= max_discard_sectors;
 		start += max_discard_sectors;
 	}
@@ -1419,11 +1770,11 @@ static void drbd_issue_peer_discard_or_zero_out(struct drbd_device *device, stru
 
 static int peer_request_fault_type(struct drbd_peer_request *peer_req)
 {
-	if (peer_req_op(peer_req) == REQ_OP_READ) {
-		return peer_req->flags & EE_APPLICATION ?
+	if (bio_op(peer_req->bios.head) == REQ_OP_READ) {
+		return drbd_interval_is_application(&peer_req->i) ?
 			DRBD_FAULT_DT_RD : DRBD_FAULT_RS_RD;
 	} else {
-		return peer_req->flags & EE_APPLICATION ?
+		return drbd_interval_is_application(&peer_req->i) ?
 			DRBD_FAULT_DT_WR : DRBD_FAULT_RS_WR;
 	}
 }
@@ -1441,18 +1792,23 @@ static int peer_request_fault_type(struct drbd_peer_request *peer_req)
  *  single page to an empty bio (which should never happen and likely indicates
  *  that the lower level IO stack is in some way broken). This has been observed
  *  on certain Xen deployments.
+ *
+ *  When this function returns 0, it "consumes" an ldev reference; the
+ *  reference is released when the request completes.
  */
 /* TODO allocate from our own bio_set. */
 int drbd_submit_peer_request(struct drbd_peer_request *peer_req)
 {
 	struct drbd_device *device = peer_req->peer_device->device;
-	struct bio *bios = NULL;
-	struct bio *bio;
-	struct page *page = peer_req->pages;
+	struct bio *bio, *next_bio;
 	sector_t sector = peer_req->i.sector;
-	unsigned int data_size = peer_req->i.size;
-	unsigned int n_bios = 0;
-	unsigned int nr_pages = PFN_UP(data_size);
+	struct bio_list bios;
+	struct page *page;
+	int fault_type, err, nr_bios = 0;
+
+	if (peer_req->flags & EE_SET_OUT_OF_SYNC)
+		drbd_set_out_of_sync(peer_req->peer_device,
+				sector, peer_req->i.size);
 
 	/* TRIM/DISCARD: for now, always use the helper function
 	 * blkdev_issue_zeroout(..., discard=true).
@@ -1460,27 +1816,18 @@ int drbd_submit_peer_request(struct drbd_peer_request *peer_req)
 	 * Correctness first, performance later.  Next step is to code an
 	 * asynchronous variant of the same.
 	 */
-	if (peer_req->flags & (EE_TRIM | EE_ZEROOUT)) {
-		/* wait for all pending IO completions, before we start
-		 * zeroing things out. */
-		conn_wait_active_ee_empty(peer_req->peer_device->connection);
-		/* add it to the active list now,
-		 * so we can find it to present it in debugfs */
+	if (peer_req->flags & (EE_TRIM|EE_ZEROOUT)) {
 		peer_req->submit_jif = jiffies;
-		peer_req->flags |= EE_SUBMITTED;
-
-		/* If this was a resync request from receive_rs_deallocated(),
-		 * it is already on the sync_ee list */
-		if (list_empty(&peer_req->w.list)) {
-			spin_lock_irq(&device->resource->req_lock);
-			list_add_tail(&peer_req->w.list, &device->active_ee);
-			spin_unlock_irq(&device->resource->req_lock);
-		}
 
+		/* ldev_safe: a peer_req has a ldev reference */
 		drbd_issue_peer_discard_or_zero_out(device, peer_req);
 		return 0;
 	}
 
+	fault_type = peer_request_fault_type(peer_req);
+	bios = peer_req->bios;
+	bio_list_init(&peer_req->bios);
+
 	/* In most cases, we will only need one bio.  But in case the lower
 	 * level restrictions happen to be different at this offset on this
 	 * side than those of the sending peer, we may need to submit the
@@ -1489,90 +1836,167 @@ int drbd_submit_peer_request(struct drbd_peer_request *peer_req)
 	 * Plain bio_alloc is good enough here, this is no DRBD internally
 	 * generated bio, but a bio allocated on behalf of the peer.
 	 */
-next_bio:
 	/* _DISCARD, _WRITE_ZEROES handled above.
 	 * REQ_OP_FLUSH (empty flush) not expected,
 	 * should have been mapped to a "drbd protocol barrier".
 	 * REQ_OP_SECURE_ERASE: I don't see how we could ever support that.
 	 */
-	if (!(peer_req_op(peer_req) == REQ_OP_WRITE ||
-				peer_req_op(peer_req) == REQ_OP_READ)) {
-		drbd_err(device, "Invalid bio op received: 0x%x\n", peer_req->opf);
-		return -EINVAL;
+	bio = bio_list_peek(&bios);
+	if (!(bio_op(bio) == REQ_OP_WRITE || bio_op(bio) == REQ_OP_READ)) {
+		drbd_err(device, "Invalid bio op received: 0x%x\n", bio->bi_opf);
+		err = -EINVAL;
+		goto fail;
 	}
 
-	bio = bio_alloc(device->ldev->backing_bdev, nr_pages, peer_req->opf, GFP_NOIO);
-	/* > peer_req->i.sector, unless this is the first bio */
-	bio->bi_iter.bi_sector = sector;
-	bio->bi_private = peer_req;
-	bio->bi_end_io = drbd_peer_request_endio;
+	/* we special case some flags in the multi-bio case, see below
+	 * (REQ_PREFLUSH, or BIO_RW_BARRIER in older kernels) */
 
-	bio->bi_next = bios;
-	bios = bio;
-	++n_bios;
+	/* Get reference for the first bio */
+	atomic_inc(&peer_req->pending_bios);
 
-	page_chain_for_each(page) {
-		unsigned len = min_t(unsigned, data_size, PAGE_SIZE);
-		if (!bio_add_page(bio, page, len, 0))
-			goto next_bio;
-		data_size -= len;
-		sector += len >> 9;
-		--nr_pages;
-	}
-	D_ASSERT(device, data_size == 0);
-	D_ASSERT(device, page == NULL);
-
-	atomic_set(&peer_req->pending_bios, n_bios);
 	/* for debugfs: update timestamp, mark as submitted */
 	peer_req->submit_jif = jiffies;
-	peer_req->flags |= EE_SUBMITTED;
-	do {
-		bio = bios;
-		bios = bios->bi_next;
-		bio->bi_next = NULL;
+	while ((bio = bio_list_pop(&bios))) {
+		/* bio_list_pop() clears bio->bi_next; it is a kernel-private
+		 * field used during I/O; used temprorarily by DRBD pre submit
+		 * and post completion
+		 */
+		bio->bi_iter.bi_sector = sector;
+		bio->bi_private = peer_req;
+		bio->bi_end_io = drbd_peer_request_endio;
 
-		drbd_submit_bio_noacct(device, peer_request_fault_type(peer_req), bio);
-	} while (bios);
-	return 0;
-}
+		/* Store sector and size in first struct page for restoration after I/O. */
+		page = bio->bi_io_vec[0].bv_page;
+		page->private = sector - peer_req->i.sector;
+		page->lru.next = (void *)(unsigned long)bio->bi_iter.bi_size;
 
-static void drbd_remove_epoch_entry_interval(struct drbd_device *device,
-					     struct drbd_peer_request *peer_req)
-{
-	struct drbd_interval *i = &peer_req->i;
+		sector += bio_sectors(bio);
 
-	drbd_remove_interval(&device->write_requests, i);
-	drbd_clear_interval(i);
+		nr_bios++;
 
-	/* Wake up any processes waiting for this peer request to complete.  */
-	if (i->waiting)
-		wake_up(&device->misc_wait);
-}
+		/* Get reference for the next bio (if any) now to prevent premature completion */
+		next_bio = bio_list_peek(&bios);
+		if (next_bio)
+			atomic_inc(&peer_req->pending_bios);
+		drbd_submit_bio_noacct(device, fault_type, bio);
 
-static void conn_wait_active_ee_empty(struct drbd_connection *connection)
-{
-	struct drbd_peer_device *peer_device;
-	int vnr;
+		/* strip off REQ_PREFLUSH,
+		 * unless it is the first or last bio */
+		if (next_bio && next_bio->bi_next)
+			next_bio->bi_opf &= ~REQ_PREFLUSH;
+	}
+	if (nr_bios > 1)
+		device->multi_bio_cnt++;
 
-	rcu_read_lock();
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
+	return 0;
 
-		kref_get(&device->kref);
-		rcu_read_unlock();
-		drbd_wait_ee_list_empty(device, &device->active_ee);
-		kref_put(&device->kref, drbd_destroy_device);
-		rcu_read_lock();
+fail:
+	while ((bio = bio_list_pop(&bios)))
+		bio_put(bio);
+	return err;
+}
+
+void drbd_remove_peer_req_interval(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_interval *i = &peer_req->i;
+	unsigned long flags;
+
+	spin_lock_irqsave(&device->interval_lock, flags);
+	D_ASSERT(device, !drbd_interval_empty(i));
+	drbd_remove_interval(&device->requests, i);
+	drbd_clear_interval(i);
+	if (!drbd_interval_is_verify(&peer_req->i))
+		drbd_release_conflicts(device, i);
+	spin_unlock_irqrestore(&device->interval_lock, flags);
+}
+
+/**
+ * w_e_reissue() - Worker callback; Resubmit a bio
+ * @w:		work object.
+ * @cancel:	The connection will be closed anyways (unused in this callback)
+ */
+int w_e_reissue(struct drbd_work *w, int cancel)
+{
+	struct drbd_peer_request *peer_req =
+		container_of(w, struct drbd_peer_request, w);
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	int err;
+	/* We leave DE_CONTAINS_A_BARRIER and EE_IS_BARRIER in place,
+	   (and DE_BARRIER_IN_NEXT_EPOCH_ISSUED in the previous Epoch)
+	   so that we can finish that epoch in drbd_may_finish_epoch().
+	   That is necessary if we already have a long chain of Epochs, before
+	   we realize that BARRIER is actually not supported */
+
+	/* As long as the -ENOTSUPP on the barrier is reported immediately
+	   that will never trigger. If it is reported late, we will just
+	   print that warning and continue correctly for all future requests
+	   with WO_BDEV_FLUSH */
+	if (previous_epoch(connection, peer_req->epoch))
+		drbd_warn(device, "Write ordering was not enforced (one time event)\n");
+
+	/* we still have a local reference,
+	 * get_ldev was done in receive_Data. */
+
+	peer_req->w.cb = e_end_block;
+	err = drbd_submit_peer_request(peer_req);
+	switch (err) {
+	case -ENOMEM:
+		peer_req->w.cb = w_e_reissue;
+		drbd_queue_work(&connection->sender_work,
+				&peer_req->w);
+		/* retry later */
+		fallthrough;
+	case 0:
+		/* keep worker happy and connection up */
+		return 0;
+
+	case -ENOSPC:
+		/* no other error expected, but anyways: */
+	default:
+		/* forget the object,
+		 * and cause a "Network failure" */
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_al_complete_io(device, &peer_req->i);
+		drbd_may_finish_epoch(connection, peer_req->epoch, EV_PUT | EV_CLEANUP);
+		drbd_free_peer_req(peer_req);
+		drbd_err(device, "submit failed, triggering re-connect\n");
+		return err;
 	}
-	rcu_read_unlock();
+}
+
+static void conn_wait_done_ee_empty_or_disconnect(struct drbd_connection *connection)
+{
+	wait_event(connection->ee_wait,
+		atomic_read(&connection->done_ee_cnt) == 0
+		|| connection->cstate[NOW] < C_CONNECTED);
+}
+
+static void conn_wait_active_ee_empty_or_disconnect(struct drbd_connection *connection)
+{
+	if (atomic_read(&connection->active_ee_cnt) == 0)
+		return;
+
+	drbd_unplug_all_devices(connection);
+
+	wait_event(connection->ee_wait,
+		atomic_read(&connection->active_ee_cnt) == 0
+		|| connection->cstate[NOW] < C_CONNECTED);
 }
 
 static int receive_Barrier(struct drbd_connection *connection, struct packet_info *pi)
 {
-	int rv;
+	struct drbd_transport_ops *tr_ops = &connection->transport.class->ops;
+	int rv, issue_flush;
 	struct p_barrier *p = pi->data;
 	struct drbd_epoch *epoch;
 
+	tr_ops->hint(&connection->transport, DATA_STREAM, QUICKACK);
+	drbd_unplug_all_devices(connection);
+
 	/* FIXME these are unacked on connection,
 	 * not a specific (peer)device.
 	 */
@@ -1586,41 +2010,48 @@ static int receive_Barrier(struct drbd_connection *connection, struct packet_inf
 	 * Therefore we must send the barrier_ack after the barrier request was
 	 * completed. */
 	switch (connection->resource->write_ordering) {
+	case WO_BIO_BARRIER:
 	case WO_NONE:
 		if (rv == FE_RECYCLED)
 			return 0;
-
-		/* receiver context, in the writeout path of the other node.
-		 * avoid potential distributed deadlock */
-		epoch = kmalloc_obj(struct drbd_epoch, GFP_NOIO);
-		if (epoch)
-			break;
-		else
-			drbd_warn(connection, "Allocation of an epoch failed, slowing down\n");
-		fallthrough;
+		break;
 
 	case WO_BDEV_FLUSH:
 	case WO_DRAIN_IO:
-		conn_wait_active_ee_empty(connection);
-		drbd_flush(connection);
+		if (rv == FE_STILL_LIVE) {
+			set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &connection->current_epoch->flags);
+			conn_wait_active_ee_empty_or_disconnect(connection);
+			rv = drbd_flush_after_epoch(connection, connection->current_epoch);
+		}
+		if (rv == FE_RECYCLED)
+			return 0;
 
-		if (atomic_read(&connection->current_epoch->epoch_size)) {
-			epoch = kmalloc_obj(struct drbd_epoch, GFP_NOIO);
-			if (epoch)
-				break;
+		/*
+		 * The ack_sender will send all the ACKs and barrier ACKs out,
+		 * since all EEs added to done_ee. We need to provide a new
+		 * epoch object for the EEs that come in soon.
+		 */
+		break;
+	}
+
+	/* receiver context, in the writeout path of the other node.
+	 * avoid potential distributed deadlock */
+	epoch = kzalloc_obj(struct drbd_epoch, GFP_NOIO);
+	if (!epoch) {
+		drbd_warn(connection, "Allocation of an epoch failed, slowing down\n");
+		issue_flush = !test_and_set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &connection->current_epoch->flags);
+		conn_wait_active_ee_empty_or_disconnect(connection);
+		if (issue_flush) {
+			rv = drbd_flush_after_epoch(connection, connection->current_epoch);
+			if (rv == FE_RECYCLED)
+				return 0;
 		}
 
+		conn_wait_done_ee_empty_or_disconnect(connection);
+
 		return 0;
-	default:
-		drbd_err(connection, "Strangeness in connection->write_ordering %d\n",
-			 connection->resource->write_ordering);
-		return -EIO;
 	}
 
-	epoch->flags = 0;
-	atomic_set(&epoch->epoch_size, 0);
-	atomic_set(&epoch->active, 0);
-
 	spin_lock(&connection->epoch_lock);
 	if (atomic_read(&connection->current_epoch->epoch_size)) {
 		list_add(&epoch->list, &connection->current_epoch->list);
@@ -1635,15 +2066,25 @@ static int receive_Barrier(struct drbd_connection *connection, struct packet_inf
 	return 0;
 }
 
-/* quick wrapper in case payload size != request_size (write same) */
-static void drbd_csum_ee_size(struct crypto_shash *h,
-			      struct drbd_peer_request *r, void *d,
-			      unsigned int payload_size)
+/* pi->data points into some recv buffer, which may be
+ * re-used/recycled/overwritten by the next receive operation.
+ * (read_in_block via recv_resync_read) */
+static void p_req_detail_from_pi(struct drbd_connection *connection,
+		struct drbd_peer_request_details *d, struct packet_info *pi)
 {
-	unsigned int tmp = r->i.size;
-	r->i.size = payload_size;
-	drbd_csum_ee(h, r, d);
-	r->i.size = tmp;
+	struct p_trim *p = pi->data;
+	bool is_trim_or_zeroes = pi->cmd == P_TRIM || pi->cmd == P_ZEROES;
+	unsigned int digest_size =
+		pi->cmd != P_TRIM && connection->peer_integrity_tfm ?
+		crypto_shash_digestsize(connection->peer_integrity_tfm) : 0;
+
+	d->sector = be64_to_cpu(p->p_data.sector);
+	d->block_id = p->p_data.block_id;
+	d->peer_seq = be32_to_cpu(p->p_data.seq_num);
+	d->dp_flags = be32_to_cpu(p->p_data.dp_flags);
+	d->length = pi->size;
+	d->bi_size = is_trim_or_zeroes ? be32_to_cpu(p->size) : pi->size - digest_size;
+	d->digest_size = digest_size;
 }
 
 /* used from receive_RSDataReply (recv_resync_read)
@@ -1655,140 +2096,103 @@ static void drbd_csum_ee_size(struct crypto_shash *h,
  * both trim and write same have the bi_size ("data len to be affected")
  * as extra argument in the packet header.
  */
-static struct drbd_peer_request *
-read_in_block(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
-	      struct packet_info *pi) __must_hold(local)
+static int
+read_in_block(struct drbd_peer_request *peer_req, struct drbd_peer_request_details *d)
 {
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
 	struct drbd_device *device = peer_device->device;
-	const sector_t capacity = get_capacity(device->vdisk);
-	struct drbd_peer_request *peer_req;
-	struct page *page;
-	int digest_size, err;
-	unsigned int data_size = pi->size, ds;
-	void *dig_in = peer_device->connection->int_dig_in;
-	void *dig_vv = peer_device->connection->int_dig_vv;
-	unsigned long *data;
-	struct p_trim *trim = (pi->cmd == P_TRIM) ? pi->data : NULL;
-	struct p_trim *zeroes = (pi->cmd == P_ZEROES) ? pi->data : NULL;
-
-	digest_size = 0;
-	if (!trim && peer_device->connection->peer_integrity_tfm) {
-		digest_size = crypto_shash_digestsize(peer_device->connection->peer_integrity_tfm);
-		/*
-		 * FIXME: Receive the incoming digest into the receive buffer
-		 *	  here, together with its struct p_data?
-		 */
-		err = drbd_recv_all_warn(peer_device->connection, dig_in, digest_size);
+	struct drbd_connection *connection = peer_device->connection;
+	const uint64_t capacity = get_capacity(device->vdisk);
+	void *dig_in = connection->int_dig_in;
+	void *dig_vv = connection->int_dig_vv;
+	struct drbd_transport *transport = &connection->transport;
+	struct drbd_transport_ops *tr_ops = &transport->class->ops;
+	int size, err;
+
+	if (d->digest_size) {
+		err = drbd_recv_into(connection, dig_in, d->digest_size);
 		if (err)
-			return NULL;
-		data_size -= digest_size;
-	}
-
-	/* assume request_size == data_size, but special case trim. */
-	ds = data_size;
-	if (trim) {
-		if (!expect(peer_device, data_size == 0))
-			return NULL;
-		ds = be32_to_cpu(trim->size);
-	} else if (zeroes) {
-		if (!expect(peer_device, data_size == 0))
-			return NULL;
-		ds = be32_to_cpu(zeroes->size);
+			return err;
 	}
 
-	if (!expect(peer_device, IS_ALIGNED(ds, 512)))
-		return NULL;
-	if (trim || zeroes) {
-		if (!expect(peer_device, ds <= (DRBD_MAX_BBIO_SECTORS << 9)))
-			return NULL;
-	} else if (!expect(peer_device, ds <= DRBD_MAX_BIO_SIZE))
-		return NULL;
+	if (!expect(peer_device, IS_ALIGNED(d->bi_size, 512)))
+		return -EINVAL;
+	/* The WSAME mechanism was removed in Linux 5.18,
+	 * and subsequently from drbd.
+	 * In theory, a "modern" drbd will never advertise support for
+	 * WRITE_SAME, so a compliant peer should never send a DP_WSAME
+	 * packet. If we receive one anyway, that's a protocol error.
+	 */
+	if (!expect(peer_device, (d->dp_flags & DP_WSAME) == 0))
+		return -EINVAL;
+	if (d->dp_flags & (DP_DISCARD|DP_ZEROES)) {
+		if (!expect(peer_device, d->bi_size <= (DRBD_MAX_BBIO_SECTORS << 9)))
+			return -EINVAL;
+	} else if (!expect(peer_device, d->bi_size <= DRBD_MAX_BIO_SIZE))
+		return -EINVAL;
 
-	/* even though we trust out peer,
+	/* even though we trust our peer,
 	 * we sometimes have to double check. */
-	if (sector + (ds>>9) > capacity) {
+	if (d->sector + (d->bi_size>>9) > capacity) {
 		drbd_err(device, "request from peer beyond end of local disk: "
 			"capacity: %llus < sector: %llus + size: %u\n",
-			(unsigned long long)capacity,
-			(unsigned long long)sector, ds);
-		return NULL;
+			capacity, d->sector, d->bi_size);
+		return -EINVAL;
 	}
 
-	/* GFP_NOIO, because we must not cause arbitrary write-out: in a DRBD
-	 * "criss-cross" setup, that might cause write-out on some other DRBD,
-	 * which in turn might block on the other node at this very place.  */
-	peer_req = drbd_alloc_peer_req(peer_device, id, sector, ds, data_size, GFP_NOIO);
-	if (!peer_req)
-		return NULL;
+	peer_req->block_id = d->block_id;
 
-	peer_req->flags |= EE_WRITE;
-	if (trim) {
-		peer_req->flags |= EE_TRIM;
-		return peer_req;
-	}
-	if (zeroes) {
-		peer_req->flags |= EE_ZEROOUT;
-		return peer_req;
+	if (d->length == 0)
+		return 0;
+
+	size = d->length - d->digest_size;
+	if (bio_list_empty(&peer_req->bios)) {
+		/* For a checksum resync, the bio was consumed for reading. */
+		err = peer_req_alloc_bio(peer_req, size, GFP_NOIO, REQ_OP_WRITE);
+		if (err)
+			return err;
 	}
+	err = tr_ops->recv_bio(transport, &peer_req->bios, size);
+	if (err)
+		return err;
 
-	/* receive payload size bytes into page chain */
-	ds = data_size;
-	page = peer_req->pages;
-	page_chain_for_each(page) {
-		unsigned len = min_t(int, ds, PAGE_SIZE);
-		data = kmap_local_page(page);
-		err = drbd_recv_all_warn(peer_device->connection, data, len);
-		if (drbd_insert_fault(device, DRBD_FAULT_RECEIVE)) {
-			drbd_err(device, "Fault injection: Corrupting data on receive\n");
-			data[0] = data[0] ^ (unsigned long)-1;
-		}
-		kunmap_local(data);
-		if (err) {
-			drbd_free_peer_req(device, peer_req);
-			return NULL;
-		}
-		ds -= len;
+	if (drbd_insert_fault(device, DRBD_FAULT_RECEIVE)) {
+		struct bio *bio = bio_list_peek(&peer_req->bios);
+		unsigned long *data;
+
+		drbd_err(device, "Fault injection: Corrupting data on receive, sector %llu\n",
+				d->sector);
+
+		data = bvec_virt(&bio->bi_io_vec[0]);
+		data[0] = ~data[0];
 	}
 
-	if (digest_size) {
-		drbd_csum_ee_size(peer_device->connection->peer_integrity_tfm, peer_req, dig_vv, data_size);
-		if (memcmp(dig_in, dig_vv, digest_size)) {
+	if (d->digest_size) {
+		drbd_csum_bios(connection->peer_integrity_tfm, &peer_req->bios, dig_vv);
+		if (memcmp(dig_in, dig_vv, d->digest_size)) {
 			drbd_err(device, "Digest integrity check FAILED: %llus +%u\n",
-				(unsigned long long)sector, data_size);
-			drbd_free_peer_req(device, peer_req);
-			return NULL;
+				d->sector, d->bi_size);
+			return -EINVAL;
 		}
 	}
-	device->recv_cnt += data_size >> 9;
-	return peer_req;
+	peer_device->recv_cnt += d->bi_size >> 9;
+	return 0;
 }
 
-/* drbd_drain_block() just takes a data block
- * out of the socket input buffer, and discards it.
- */
-static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
+static int ignore_remaining_packet(struct drbd_connection *connection, int size)
 {
-	struct page *page;
-	int err = 0;
-	void *data;
-
-	if (!data_size)
-		return 0;
-
-	page = drbd_alloc_pages(peer_device, 1, 1);
+	void *data_to_ignore;
 
-	data = kmap_local_page(page);
-	while (data_size) {
-		unsigned int len = min_t(int, data_size, PAGE_SIZE);
+	while (size) {
+		int s = min_t(int, size, DRBD_SOCKET_BUFFER_SIZE);
+		int rv = drbd_recv(connection, &data_to_ignore, s, 0);
+		if (rv < 0)
+			return rv;
 
-		err = drbd_recv_all_warn(peer_device->connection, data, len);
-		if (err)
-			break;
-		data_size -= len;
+		size -= rv;
 	}
-	kunmap_local(data);
-	drbd_free_pages(peer_device->device, page);
-	return err;
+
+	return 0;
 }
 
 static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_request *req,
@@ -1804,7 +2208,7 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 	digest_size = 0;
 	if (peer_device->connection->peer_integrity_tfm) {
 		digest_size = crypto_shash_digestsize(peer_device->connection->peer_integrity_tfm);
-		err = drbd_recv_all_warn(peer_device->connection, dig_in, digest_size);
+		err = drbd_recv_into(peer_device->connection, dig_in, digest_size);
 		if (err)
 			return err;
 		data_size -= digest_size;
@@ -1812,7 +2216,7 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 
 	/* optimistically update recv_cnt.  if receiving fails below,
 	 * we disconnect anyways, and counters will be reset. */
-	peer_device->device->recv_cnt += data_size>>9;
+	peer_device->recv_cnt += data_size >> 9;
 
 	bio = req->master_bio;
 	D_ASSERT(peer_device->device, sector == bio->bi_iter.bi_sector);
@@ -1820,7 +2224,7 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 	bio_for_each_segment(bvec, bio, iter) {
 		void *mapped = bvec_kmap_local(&bvec);
 		expect = min_t(int, data_size, bvec.bv_len);
-		err = drbd_recv_all_warn(peer_device->connection, mapped, expect);
+		err = drbd_recv_into(peer_device->connection, mapped, expect);
 		kunmap_local(mapped);
 		if (err)
 			return err;
@@ -1839,250 +2243,662 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 	return 0;
 }
 
-/*
- * e_end_resync_block() is called in ack_sender context via
- * drbd_finish_peer_reqs().
- */
-static int e_end_resync_block(struct drbd_work *w, int unused)
+static bool bits_in_sync(struct drbd_peer_device *peer_device, sector_t sector_start, sector_t sector_end)
 {
-	struct drbd_peer_request *peer_req =
-		container_of(w, struct drbd_peer_request, w);
-	struct drbd_peer_device *peer_device = peer_req->peer_device;
 	struct drbd_device *device = peer_device->device;
-	sector_t sector = peer_req->i.sector;
-	int err;
-
-	D_ASSERT(device, drbd_interval_empty(&peer_req->i));
-
-	if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
-		drbd_set_in_sync(peer_device, sector, peer_req->i.size);
-		err = drbd_send_ack(peer_device, P_RS_WRITE_ACK, peer_req);
-	} else {
-		/* Record failure to sync */
-		drbd_rs_failed_io(peer_device, sector, peer_req->i.size);
-
-		err  = drbd_send_ack(peer_device, P_NEG_ACK, peer_req);
+	struct drbd_bitmap *bm = device->bitmap;
+
+	if (peer_device->repl_state[NOW] == L_ESTABLISHED ||
+			peer_device->repl_state[NOW] == L_SYNC_SOURCE ||
+			peer_device->repl_state[NOW] == L_SYNC_TARGET ||
+			peer_device->repl_state[NOW] == L_PAUSED_SYNC_S ||
+			peer_device->repl_state[NOW] == L_PAUSED_SYNC_T) {
+		if (drbd_bm_total_weight(peer_device) == 0)
+			return true;
+		if (drbd_bm_count_bits(device, peer_device->bitmap_index,
+					bm_sect_to_bit(bm, sector_start),
+					bm_sect_to_bit(bm, sector_end - 1)) == 0)
+			return true;
 	}
-	dec_unacked(device);
-
-	return err;
+	return false;
 }
 
-static int recv_resync_read(struct drbd_peer_device *peer_device, sector_t sector,
-			    struct packet_info *pi) __releases(local)
+static void update_peers_for_interval(struct drbd_peer_device *peer_device,
+		struct drbd_interval *interval)
 {
 	struct drbd_device *device = peer_device->device;
-	struct drbd_peer_request *peer_req;
+	struct drbd_bitmap *bm = device->bitmap;
+	u64 mask = NODE_MASK(peer_device->node_id), im;
+	struct drbd_peer_device *p;
+	sector_t sector_end = interval->sector + (interval->size >> SECTOR_SHIFT);
+
+	/* Only send P_PEERS_IN_SYNC if we are actually in sync with this peer. */
+	if (drbd_bm_count_bits(device, peer_device->bitmap_index,
+				bm_sect_to_bit(bm, interval->sector),
+				bm_sect_to_bit(bm, sector_end - 1)))
+		return;
 
-	peer_req = read_in_block(peer_device, ID_SYNCER, sector, pi);
-	if (!peer_req)
-		goto fail;
+	for_each_peer_device_ref(p, im, device) {
+		if (p == peer_device)
+			continue;
 
-	dec_rs_pending(peer_device);
+		if (bits_in_sync(p, interval->sector, sector_end))
+			mask |= NODE_MASK(p->node_id);
+	}
 
-	inc_unacked(device);
-	/* corresponding dec_unacked() in e_end_resync_block()
-	 * respective _drbd_clear_done_ee */
+	for_each_peer_device_ref(p, im, device) {
+		/* Only send to the peer whose bitmap bits have been cleared if
+		 * we are connected to that peer. The bits may have been
+		 * cleared by a P_PEERS_IN_SYNC from another peer while we are
+		 * connecting to this one. We mustn't send P_PEERS_IN_SYNC
+		 * during the initial connection handshake. */
+		if (p == peer_device && p->connection->cstate[NOW] != C_CONNECTED)
+			continue;
 
-	peer_req->w.cb = e_end_resync_block;
-	peer_req->opf = REQ_OP_WRITE;
-	peer_req->submit_jif = jiffies;
+		if (mask & NODE_MASK(p->node_id))
+			drbd_send_peers_in_sync(p, mask, interval->sector, interval->size);
+	}
+}
 
-	spin_lock_irq(&device->resource->req_lock);
-	list_add_tail(&peer_req->w.list, &device->sync_ee);
-	spin_unlock_irq(&device->resource->req_lock);
+/* Potentially send P_PEERS_IN_SYNC for a range with size that fits in an int. */
+static void update_peers_for_small_range(struct drbd_peer_device *peer_device,
+		sector_t sector, int size)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_interval interval;
 
-	atomic_add(pi->size >> 9, &device->rs_sect_ev);
-	if (drbd_submit_peer_request(peer_req) == 0)
-		return 0;
+	memset(&interval, 0, sizeof(interval));
+	drbd_clear_interval(&interval);
+	interval.sector = sector;
+	interval.size = size;
+	interval.type = INTERVAL_PEERS_IN_SYNC_LOCK;
 
-	/* don't care for the reason here */
-	drbd_err(device, "submit failed, triggering re-connect\n");
-	spin_lock_irq(&device->resource->req_lock);
-	list_del(&peer_req->w.list);
-	spin_unlock_irq(&device->resource->req_lock);
+	spin_lock_irq(&device->interval_lock);
+	if (drbd_find_conflict(device, &interval, 0)) {
+		spin_unlock_irq(&device->interval_lock);
+		return;
+	}
+	drbd_insert_interval(&device->requests, &interval);
+	/* Interval is not waiting for conflicts to resolve so mark as "submitted". */
+	set_bit(INTERVAL_SUBMITTED, &interval.flags);
+	spin_unlock_irq(&device->interval_lock);
 
-	drbd_free_peer_req(device, peer_req);
-fail:
-	put_ldev(device);
-	return -EIO;
+	/* Check for activity in the activity log extent _after_ locking the
+	 * interval. Otherwise a write might occur between checking and
+	 * locking. */
+	if (!drbd_al_active(device, sector, size))
+		update_peers_for_interval(peer_device, &interval);
+
+	spin_lock_irq(&device->interval_lock);
+	drbd_remove_interval(&device->requests, &interval);
+	drbd_release_conflicts(device, &interval);
+	spin_unlock_irq(&device->interval_lock);
 }
 
-static struct drbd_request *
-find_request(struct drbd_device *device, struct rb_root *root, u64 id,
-	     sector_t sector, bool missing_ok, const char *func)
+static void update_peers_for_range(struct drbd_peer_device *peer_device,
+		sector_t sector_start, sector_t sector_end)
 {
-	struct drbd_request *req;
+	struct drbd_device *device = peer_device->device;
+	unsigned int enr_start = sector_start >> (AL_EXTENT_SHIFT - SECTOR_SHIFT);
+	unsigned int enr_end = ((sector_end - 1) >> (AL_EXTENT_SHIFT - SECTOR_SHIFT)) + 1;
+	unsigned int enr;
 
-	/* Request object according to our peer */
-	req = (struct drbd_request *)(unsigned long)id;
-	if (drbd_contains_interval(root, sector, &req->i) && req->i.local)
-		return req;
-	if (!missing_ok) {
-		drbd_err(device, "%s: failed to find request 0x%lx, sector %llus\n", func,
-			(unsigned long)id, (unsigned long long)sector);
+	if (!get_ldev(device))
+		return;
+
+	for (enr = enr_start; enr < enr_end; enr++) {
+		sector_t enr_start_sector = max(sector_start,
+				((sector_t) enr) << (AL_EXTENT_SHIFT - SECTOR_SHIFT));
+		sector_t enr_end_sector = min(sector_end,
+				((sector_t) (enr + 1)) << (AL_EXTENT_SHIFT - SECTOR_SHIFT));
+
+		update_peers_for_small_range(peer_device,
+				enr_start_sector, (enr_end_sector - enr_start_sector) << SECTOR_SHIFT);
 	}
-	return NULL;
+
+	put_ldev(device);
 }
 
-static int receive_DataReply(struct drbd_connection *connection, struct packet_info *pi)
+static int w_update_peers(struct drbd_work *w, int unused)
 {
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct drbd_request *req;
-	sector_t sector;
-	int err;
-	struct p_data *p = pi->data;
+	struct update_peers_work *upw = container_of(w, struct update_peers_work, w);
+	struct drbd_peer_device *peer_device = upw->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	if (connection->agreed_pro_version >= 110)
+		update_peers_for_range(peer_device, upw->sector_start, upw->sector_end);
 
-	sector = be64_to_cpu(p->sector);
+	kfree(upw);
 
-	spin_lock_irq(&device->resource->req_lock);
-	req = find_request(device, &device->read_requests, p->block_id, sector, false, __func__);
-	spin_unlock_irq(&device->resource->req_lock);
-	if (unlikely(!req))
-		return -EIO;
+	kref_put(&device->kref, drbd_destroy_device);
 
-	err = recv_dless_read(peer_device, req, sector, pi->size);
-	if (!err)
-		req_mod(req, DATA_RECEIVED, peer_device);
-	/* else: nothing. handled from drbd_disconnect...
-	 * I don't think we may complete this just yet
-	 * in case we are "on-disconnect: freeze" */
+	kref_put(&connection->kref, drbd_destroy_connection);
 
-	return err;
+	return 0;
 }
 
-static int receive_RSDataReply(struct drbd_connection *connection, struct packet_info *pi)
+void drbd_queue_update_peers(struct drbd_peer_device *peer_device,
+		sector_t sector_start, sector_t sector_end)
 {
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	sector_t sector;
-	int err;
-	struct p_data *p = pi->data;
+	struct drbd_device *device = peer_device->device;
+	struct update_peers_work *upw;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	upw = kmalloc_obj(*upw, GFP_ATOMIC | __GFP_NOWARN);
+	if (upw) {
+		upw->sector_start = sector_start;
+		upw->sector_end = sector_end;
+		upw->w.cb = w_update_peers;
 
-	sector = be64_to_cpu(p->sector);
-	D_ASSERT(device, p->block_id == ID_SYNCER);
+		kref_get(&peer_device->device->kref);
 
-	if (get_ldev(device)) {
-		/* data is submitted to disk within recv_resync_read.
-		 * corresponding put_ldev done below on error,
-		 * or in drbd_peer_request_endio. */
-		err = recv_resync_read(peer_device, sector, pi);
+		kref_get(&peer_device->connection->kref);
+
+		upw->peer_device = peer_device;
+		drbd_queue_work(&device->resource->work, &upw->w);
 	} else {
 		if (drbd_ratelimit())
-			drbd_err(device, "Can not write resync data to local disk.\n");
+			drbd_warn(peer_device, "kmalloc(upw) failed.\n");
+	}
+}
 
-		err = drbd_drain_block(peer_device, pi->size);
+static void drbd_peers_in_sync_progress(struct drbd_peer_device *peer_device,
+		sector_t sector_start, sector_t sector_end)
+{
+	/* P_PEERS_IN_SYNC "steps" are represented by their start sector */
+	sector_t step = sector_start & ~PEERS_IN_SYNC_STEP_SECT_MASK;
+	sector_t end_step = sector_end & ~PEERS_IN_SYNC_STEP_SECT_MASK;
+	sector_t last_end = peer_device->last_in_sync_end;
+	sector_t last_step = last_end & ~PEERS_IN_SYNC_STEP_SECT_MASK;
+	sector_t last_step_end = min(get_capacity(peer_device->device->vdisk),
+			last_step + PEERS_IN_SYNC_STEP_SECT);
 
-		drbd_send_ack_dp(peer_device, P_NEG_ACK, p, pi->size);
-	}
+	/* Send for last request if it was part way through a different step */
+	if (last_end > last_step && step != last_step)
+		drbd_queue_update_peers(peer_device, last_step, last_step_end);
 
-	atomic_add(pi->size >> 9, &device->rs_sect_in);
+	/* Send if the request reaches or passes a step boundary */
+	if (end_step != step)
+		drbd_queue_update_peers(peer_device, step, end_step);
 
-	return err;
+	peer_device->last_in_sync_end = sector_end;
+
+	/*
+	 * Consider scheduling a bitmap update to reduce the size of the next
+	 * resync if this one is disrupted.
+	 */
+	if (drbd_lazy_bitmap_update_due(peer_device))
+		drbd_peer_device_post_work(peer_device, RS_LAZY_BM_WRITE);
 }
 
-static void restart_conflicting_writes(struct drbd_device *device,
-				       sector_t sector, int size)
+static void drbd_check_peers_in_sync_progress(struct drbd_peer_device *peer_device)
 {
-	struct drbd_interval *i;
-	struct drbd_request *req;
+	struct drbd_connection *connection = peer_device->connection;
+	LIST_HEAD(completed);
+	struct drbd_peer_request *peer_req, *tmp;
 
-	drbd_for_each_overlap(i, &device->write_requests, sector, size) {
-		if (!i->local)
-			continue;
-		req = container_of(i, struct drbd_request, i);
-		if (req->rq_state & RQ_LOCAL_PENDING ||
-		    !(req->rq_state & RQ_POSTPONED))
-			continue;
-		/* as it is RQ_POSTPONED, this will cause it to
-		 * be queued on the retry workqueue. */
-		__req_mod(req, CONFLICT_RESOLVED, NULL, NULL);
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_for_each_entry_safe(peer_req, tmp, &peer_device->resync_requests, recv_order) {
+		if (!test_bit(INTERVAL_COMPLETED, &peer_req->i.flags))
+			break;
+
+		drbd_peers_in_sync_progress(peer_device, peer_req->i.sector,
+			peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT));
+
+		drbd_list_del_resync_request(peer_req);
+		list_add_tail(&peer_req->recv_order, &completed);
 	}
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	list_for_each_entry_safe(peer_req, tmp, &completed, recv_order)
+		drbd_free_peer_req(peer_req);
 }
 
-/*
- * e_end_block() is called in ack_sender context via drbd_finish_peer_reqs().
- */
-static int e_end_block(struct drbd_work *w, int cancel)
+static void drbd_resync_request_complete(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+
+	/*
+	 * Free the pages now but leave the peer request until the
+	 * corresponding peers-in-sync has been scheduled.
+	 */
+	drbd_peer_req_strip_bio(peer_req);
+
+	/*
+	 * The interval is no longer in the tree, but use this flag anyway,
+	 * since it has an appropriate meaning. After setting the flag,
+	 * peer_req may be freed by another thread.
+	 */
+	set_bit(INTERVAL_COMPLETED, &peer_req->i.flags);
+	peer_req = NULL;
+
+	drbd_check_peers_in_sync_progress(peer_device);
+}
+
+/*
+ * e_end_resync_block() is called in ack_sender context via
+ * drbd_finish_peer_reqs().
+ */
+static int e_end_resync_block(struct drbd_work *w, int unused)
 {
 	struct drbd_peer_request *peer_req =
 		container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
-	struct drbd_device *device = peer_device->device;
 	sector_t sector = peer_req->i.sector;
-	int err = 0, pcmd;
+	unsigned int size = peer_req->requested_size;
+	u64 block_id = peer_req->block_id;
+	int err;
 
-	if (peer_req->flags & EE_SEND_WRITE_ACK) {
-		if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
-			pcmd = (device->state.conn >= C_SYNC_SOURCE &&
-				device->state.conn <= C_PAUSED_SYNC_T &&
-				peer_req->flags & EE_MAY_SET_IN_SYNC) ?
-				P_RS_WRITE_ACK : P_WRITE_ACK;
-			err = drbd_send_ack(peer_device, pcmd, peer_req);
-			if (pcmd == P_RS_WRITE_ACK)
-				drbd_set_in_sync(peer_device, sector, peer_req->i.size);
-		} else {
-			err = drbd_send_ack(peer_device, P_NEG_ACK, peer_req);
-			/* we expect it to be marked out of sync anyways...
-			 * maybe assert this?  */
-		}
-		dec_unacked(device);
+	if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
+		drbd_set_in_sync(peer_device, sector, size);
+		err = drbd_send_ack_be(peer_device, P_RS_WRITE_ACK, sector, size, block_id);
+	} else {
+		/* Record failure to sync */
+		drbd_rs_failed_io(peer_device, sector, size);
+
+		err = drbd_send_ack_be(peer_device, P_RS_NEG_ACK, sector, size, block_id);
 	}
 
-	/* we delete from the conflict detection hash _after_ we sent out the
-	 * P_WRITE_ACK / P_NEG_ACK, to get the sequence number right.  */
-	if (peer_req->flags & EE_IN_INTERVAL_TREE) {
-		spin_lock_irq(&device->resource->req_lock);
-		D_ASSERT(device, !drbd_interval_empty(&peer_req->i));
-		drbd_remove_epoch_entry_interval(device, peer_req);
-		if (peer_req->flags & EE_RESTART_REQUESTS)
-			restart_conflicting_writes(device, sector, peer_req->i.size);
-		spin_unlock_irq(&device->resource->req_lock);
-	} else
-		D_ASSERT(device, drbd_interval_empty(&peer_req->i));
+	dec_unacked(peer_device);
 
-	drbd_may_finish_epoch(peer_device->connection, peer_req->epoch, EV_PUT + (cancel ? EV_CLEANUP : 0));
+	/*
+	 * If INTERVAL_SUBMITTED is not set, this request was merged into
+	 * another discard. It has already been removed from the interval tree.
+	 */
+	if (test_bit(INTERVAL_SUBMITTED, &peer_req->i.flags))
+		drbd_remove_peer_req_interval(peer_req);
 
+	drbd_resync_request_complete(peer_req);
 	return err;
 }
 
-static int e_send_ack(struct drbd_work *w, enum drbd_packet ack)
+static struct drbd_peer_request *find_resync_request(struct drbd_peer_device *peer_device,
+		unsigned long type_mask, sector_t sector, unsigned int size, u64 block_id)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_interval *i;
+	struct drbd_peer_request *peer_req = NULL;
+
+	spin_lock_irq(&device->interval_lock);
+	drbd_for_each_overlap(i, &device->requests, sector, size) {
+		struct drbd_peer_request *pr;
+
+		if (!test_bit(INTERVAL_READY_TO_SEND, &i->flags))
+			continue;
+
+		if (!(INTERVAL_TYPE_MASK(i->type) & type_mask))
+			continue;
+
+		if (i->sector != sector || i->size != size)
+			continue;
+
+		pr = container_of(i, struct drbd_peer_request, i);
+		/* With agreed_pro_version < 122, block_id is always ID_SYNCER. */
+		if (pr->peer_device == peer_device &&
+				(block_id == ID_SYNCER || pr->block_id == block_id)) {
+			peer_req = pr;
+			break;
+		}
+	}
+	spin_unlock_irq(&device->interval_lock);
+
+	if (peer_req)
+		D_ASSERT(peer_device, peer_req->i.size == size);
+	else if (drbd_ratelimit())
+		drbd_err(peer_device, "Unexpected resync reply at %llus+%u\n",
+				(unsigned long long) sector, size);
+
+	return peer_req;
+}
+
+static void drbd_cleanup_received_resync_write(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+
+	drbd_remove_peer_req_interval(peer_req);
+
+	atomic_sub(peer_req->i.size >> SECTOR_SHIFT, &device->rs_sect_ev);
+	dec_unacked(peer_device);
+
+	drbd_free_peer_req(peer_req);
+	put_ldev(device);
+
+	if (atomic_dec_and_test(&connection->backing_ee_cnt))
+		wake_up(&connection->ee_wait);
+}
+
+void drbd_conflict_submit_resync_request(struct drbd_peer_request *peer_req)
 {
-	struct drbd_peer_request *peer_req =
-		container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	bool conflict;
+	bool canceled;
+
+	spin_lock_irq(&device->interval_lock);
+	clear_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &peer_req->i.flags);
+	canceled = test_bit(INTERVAL_CANCELED, &peer_req->i.flags);
+	set_bit(INTERVAL_RECEIVED, &peer_req->i.flags);
+	conflict = drbd_find_conflict(device, &peer_req->i, 0);
+	if (!conflict)
+		set_bit(INTERVAL_SUBMITTED, &peer_req->i.flags);
+	spin_unlock_irq(&device->interval_lock);
+
+	if (!conflict) {
+		int err = drbd_submit_peer_request(peer_req);
+		if (err) {
+			if (drbd_ratelimit())
+				drbd_err(device, "submit failed, triggering re-connect\n");
+
+			drbd_cleanup_received_resync_write(peer_req);
+			change_cstate(peer_device->connection, C_PROTOCOL_ERROR, CS_HARD);
+		}
+	} else if (canceled) {
+		drbd_cleanup_received_resync_write(peer_req);
+	}
+}
+
+static int recv_resync_read(struct drbd_peer_device *peer_device,
+			    struct drbd_peer_request *peer_req,
+			    struct drbd_peer_request_details *d)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	unsigned int size;
+	sector_t sector;
+	int err;
+	u64 im;
+
+	err = read_in_block(peer_req, d);
+	if (err)
+		return err;
+
+	if (test_bit(UNSTABLE_RESYNC, &peer_device->flags))
+		clear_bit(STABLE_RESYNC, &device->flags);
+
+	dec_rs_pending(peer_device);
+
+	inc_unacked(peer_device);
+	/* corresponding dec_unacked() in e_end_resync_block()
+	 * respective _drbd_clear_done_ee */
+
+	peer_req->w.cb = e_end_resync_block;
+	peer_req->submit_jif = jiffies;
+
+	atomic_add(d->bi_size >> 9, &device->rs_sect_ev);
+
+	sector = peer_req->i.sector;
+	size = peer_req->i.size;
+
+	/* Setting all peers out of sync here. The sync source peer will be
+	 * set in sync when the write completes. The sync source will soon
+	 * set other peers in sync with a P_PEERS_IN_SYNC packet.
+	 */
+	drbd_set_all_out_of_sync(device, sector, size);
+
+	atomic_inc(&connection->backing_ee_cnt);
+	drbd_conflict_submit_resync_request(peer_req);
+	peer_req = NULL; /* since submitted, might be destroyed already */
+
+	drbd_process_rs_discards(peer_device, false);
+
+	for_each_peer_device_ref(peer_device, im, device) {
+		enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+
+		if (repl_is_sync_source(repl_state) || repl_state == L_WF_BITMAP_S)
+			drbd_send_out_of_sync(peer_device, sector, size);
+	}
+	return 0;
+}
+
+/* caller must hold interval_lock */
+static struct drbd_request *
+find_request(struct drbd_device *device, enum drbd_interval_type type, u64 id,
+	     sector_t sector, bool missing_ok, const char *func)
+{
+	struct rb_root *root = type == INTERVAL_LOCAL_READ ? &device->read_requests : &device->requests;
+	struct drbd_request *req;
+
+	/* Request object according to our peer */
+	req = (struct drbd_request *)(unsigned long)id;
+	if (drbd_contains_interval(root, sector, &req->i) && req->i.type == type)
+		return req;
+	if (!missing_ok) {
+		drbd_err(device, "%s: failed to find request 0x%lx, sector %llus\n", func,
+			(unsigned long)id, (unsigned long long)sector);
+	}
+	return NULL;
+}
+
+static int receive_DataReply(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	struct drbd_request *req;
+	sector_t sector;
 	int err;
+	struct p_data *p = pi->data;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+	device = peer_device->device;
+
+	sector = be64_to_cpu(p->sector);
+
+	spin_lock_irq(&device->interval_lock);
+	req = find_request(device, INTERVAL_LOCAL_READ, p->block_id, sector, false, __func__);
+	spin_unlock_irq(&device->interval_lock);
+	if (unlikely(!req))
+		return -EIO;
 
-	err = drbd_send_ack(peer_device, ack, peer_req);
-	dec_unacked(peer_device->device);
+	err = recv_dless_read(peer_device, req, sector, pi->size);
+	if (!err)
+		req_mod(req, DATA_RECEIVED, peer_device);
+	/* else: nothing. handled from drbd_disconnect...
+	 * I don't think we may complete this just yet
+	 * in case we are "on-disconnect: freeze" */
 
 	return err;
 }
 
-static int e_send_superseded(struct drbd_work *w, int unused)
+/**
+ * _drbd_send_ack() - Sends an ack packet
+ * @peer_device: DRBD peer device.
+ * @cmd:	Packet command code.
+ * @sector:	sector, needs to be in big endian byte order
+ * @blksize:	size in byte, needs to be in big endian byte order
+ * @block_id:	Id, big endian byte order
+ */
+static int _drbd_send_ack(struct drbd_peer_device *peer_device, enum drbd_packet cmd,
+			  u64 sector, u32 blksize, u64 block_id)
+{
+	struct p_block_ack *p;
+
+	if (peer_device->repl_state[NOW] < L_ESTABLISHED)
+		return -EIO;
+
+	p = drbd_prepare_command(peer_device, sizeof(*p), CONTROL_STREAM);
+	if (!p)
+		return -EIO;
+	p->sector = sector;
+	p->block_id = block_id;
+	p->blksize = blksize;
+	p->seq_num = cpu_to_be32(atomic_inc_return(&peer_device->packet_seq));
+
+	if (peer_device->connection->agreed_pro_version < 122) {
+		switch (cmd) {
+		case P_RS_NEG_ACK:
+			cmd = P_NEG_ACK;
+			p->block_id = ID_SYNCER;
+			break;
+		case P_WRITE_ACK_IN_SYNC:
+			cmd = P_RS_WRITE_ACK;
+			break;
+		case P_RS_WRITE_ACK:
+			p->block_id = ID_SYNCER;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return drbd_send_command(peer_device, cmd, CONTROL_STREAM);
+}
+
+static int drbd_send_ack_dp(struct drbd_peer_device *peer_device, enum drbd_packet cmd,
+		  struct drbd_peer_request_details *d)
+{
+	return _drbd_send_ack(peer_device, cmd,
+			      cpu_to_be64(d->sector),
+			      cpu_to_be32(d->bi_size),
+			      d->block_id);
+}
+
+/* Send an ack packet wih a block ID that is already in big endian byte order. */
+int drbd_send_ack_be(struct drbd_peer_device *peer_device, enum drbd_packet cmd,
+		      sector_t sector, int size, u64 block_id)
+{
+	return _drbd_send_ack(peer_device, cmd, cpu_to_be64(sector), cpu_to_be32(size), block_id);
+}
+
+/**
+ * drbd_send_ack() - Sends an ack packet
+ * @peer_device: DRBD peer device
+ * @cmd:	packet command code
+ * @peer_req:	peer request
+ */
+int drbd_send_ack(struct drbd_peer_device *peer_device, enum drbd_packet cmd,
+		  struct drbd_peer_request *peer_req)
+{
+	return _drbd_send_ack(peer_device, cmd,
+			      cpu_to_be64(peer_req->i.sector),
+			      cpu_to_be32(peer_req->i.size),
+			      peer_req->block_id);
+}
+
+int drbd_send_ov_result(struct drbd_peer_device *peer_device, sector_t sector, int blksize,
+		u64 block_id, enum ov_result result)
+{
+	struct p_ov_result *p;
+
+	if (peer_device->connection->agreed_pro_version < 122)
+		/* Misuse the block_id field to signal if the blocks are is sync or not. */
+		return _drbd_send_ack(peer_device, P_OV_RESULT,
+				cpu_to_be64(sector),
+				cpu_to_be32(blksize),
+				cpu_to_be64(drbd_ov_result_to_block_id(result)));
+
+	if (peer_device->repl_state[NOW] < L_ESTABLISHED)
+		return -EIO;
+
+	p = drbd_prepare_command(peer_device, sizeof(*p), CONTROL_STREAM);
+	if (!p)
+		return -EIO;
+	p->sector = cpu_to_be64(sector);
+	p->block_id = block_id;
+	p->blksize = cpu_to_be32(blksize);
+	p->seq_num = cpu_to_be32(atomic_inc_return(&peer_device->packet_seq));
+	p->result = cpu_to_be32(result);
+	p->pad = 0;
+
+	return drbd_send_command(peer_device, P_OV_RESULT_ID, CONTROL_STREAM);
+}
+
+static int receive_RSDataReply(struct drbd_connection *connection, struct packet_info *pi)
 {
-	return e_send_ack(w, P_SUPERSEDED);
+	struct drbd_peer_request_details d;
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	struct drbd_peer_request *peer_req;
+	int err;
+
+	p_req_detail_from_pi(connection, &d, pi);
+	pi->data = NULL;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+	device = peer_device->device;
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_RESYNC_WRITE),
+			d.sector, d.bi_size, d.block_id);
+	if (!peer_req)
+		return -EIO;
+
+	if (get_ldev(device)) {
+		err = recv_resync_read(peer_device, peer_req, &d);
+		if (err)
+			put_ldev(device);
+	} else {
+		drbd_err_ratelimit(device, "Cannot write resync data to local disk.\n");
+
+		err = ignore_remaining_packet(connection, pi->size);
+
+		drbd_send_ack_dp(peer_device, P_RS_NEG_ACK, &d);
+
+		dec_rs_pending(peer_device);
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
+	}
+
+	rs_sectors_came_in(peer_device, d.bi_size);
+
+	return err;
 }
 
-static int e_send_retry_write(struct drbd_work *w, int unused)
+/*
+ * e_end_block() is called in ack_sender context via drbd_finish_peer_reqs().
+ */
+static int e_end_block(struct drbd_work *w, int cancel)
 {
 	struct drbd_peer_request *peer_req =
 		container_of(w, struct drbd_peer_request, w);
-	struct drbd_connection *connection = peer_req->peer_device->connection;
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+	sector_t sector = peer_req->i.sector;
+	struct drbd_epoch *epoch;
+	int err = 0, pcmd;
+
+	if (peer_req->flags & EE_IS_BARRIER) {
+		epoch = previous_epoch(connection, peer_req->epoch);
+		if (epoch)
+			drbd_may_finish_epoch(connection, epoch, EV_BARRIER_DONE + (cancel ? EV_CLEANUP : 0));
+	}
+
+	if (peer_req->flags & EE_SEND_WRITE_ACK) {
+		if (unlikely(peer_req->flags & EE_WAS_ERROR)) {
+			pcmd = P_NEG_ACK;
+			/* we expect it to be marked out of sync anyways...
+			 * maybe assert this?  */
+		} else if (peer_device->repl_state[NOW] >= L_SYNC_SOURCE &&
+			   peer_device->repl_state[NOW] <= L_PAUSED_SYNC_T &&
+			   peer_req->flags & EE_MAY_SET_IN_SYNC) {
+			pcmd = P_WRITE_ACK_IN_SYNC;
+			drbd_set_in_sync(peer_device, sector, peer_req->i.size);
+		} else
+			pcmd = P_WRITE_ACK;
+		err = drbd_send_ack(peer_device, pcmd, peer_req);
+		dec_unacked(peer_device);
+	}
+
+	drbd_remove_peer_req_interval(peer_req);
+
+	if (connection->agreed_pro_version < 110) {
+		drbd_al_complete_io(device, &peer_req->i);
+		drbd_may_finish_epoch(connection, peer_req->epoch, EV_PUT + (cancel ? EV_CLEANUP : 0));
+		drbd_free_peer_req(peer_req);
+	} else {
+		drbd_peer_req_strip_bio(peer_req);
+		drbd_may_finish_epoch(connection, peer_req->epoch, EV_PUT + (cancel ? EV_CLEANUP : 0));
+		/* Do not use peer_req after this point. We may have sent the
+		 * corresponding barrier and received the corresponding peer ack. As a
+		 * result, peer_req may have been freed. */
+	}
 
-	return e_send_ack(w, connection->agreed_pro_version >= 100 ?
-			     P_RETRY_WRITE : P_SUPERSEDED);
+	return err;
 }
 
 static bool seq_greater(u32 a, u32 b)
@@ -2102,42 +2918,17 @@ static u32 seq_max(u32 a, u32 b)
 
 static void update_peer_seq(struct drbd_peer_device *peer_device, unsigned int peer_seq)
 {
-	struct drbd_device *device = peer_device->device;
 	unsigned int newest_peer_seq;
 
-	if (test_bit(RESOLVE_CONFLICTS, &peer_device->connection->flags)) {
-		spin_lock(&device->peer_seq_lock);
-		newest_peer_seq = seq_max(device->peer_seq, peer_seq);
-		device->peer_seq = newest_peer_seq;
-		spin_unlock(&device->peer_seq_lock);
-		/* wake up only if we actually changed device->peer_seq */
+	if (test_bit(RESOLVE_CONFLICTS, &peer_device->connection->transport.flags)) {
+		spin_lock_bh(&peer_device->peer_seq_lock);
+		newest_peer_seq = seq_max(peer_device->peer_seq, peer_seq);
+		peer_device->peer_seq = newest_peer_seq;
+		spin_unlock_bh(&peer_device->peer_seq_lock);
+		/* wake up only if we actually changed peer_device->peer_seq */
 		if (peer_seq == newest_peer_seq)
-			wake_up(&device->seq_wait);
-	}
-}
-
-static inline int overlaps(sector_t s1, int l1, sector_t s2, int l2)
-{
-	return !((s1 + (l1>>9) <= s2) || (s1 >= s2 + (l2>>9)));
-}
-
-/* maybe change sync_ee into interval trees as well? */
-static bool overlapping_resync_write(struct drbd_device *device, struct drbd_peer_request *peer_req)
-{
-	struct drbd_peer_request *rs_req;
-	bool rv = false;
-
-	spin_lock_irq(&device->resource->req_lock);
-	list_for_each_entry(rs_req, &device->sync_ee, w.list) {
-		if (overlaps(peer_req->i.sector, peer_req->i.size,
-			     rs_req->i.sector, rs_req->i.size)) {
-			rv = true;
-			break;
-		}
+			wake_up(&peer_device->device->seq_wait);
 	}
-	spin_unlock_irq(&device->resource->req_lock);
-
-	return rv;
 }
 
 /* Called from receive_Data.
@@ -2149,9 +2940,9 @@ static bool overlapping_resync_write(struct drbd_device *device, struct drbd_pee
  *
  * Note: we don't care for Ack packets overtaking P_DATA packets.
  *
- * In case packet_seq is larger than device->peer_seq number, there are
+ * In case packet_seq is larger than peer_device->peer_seq number, there are
  * outstanding packets on the msock. We wait for them to arrive.
- * In case we are the logically next packet, we update device->peer_seq
+ * In case we are the logically next packet, we update peer_device->peer_seq
  * ourselves. Correctly handles 32bit wrap around.
  *
  * Assume we have a 10 GBit connection, that is about 1<<30 byte per second,
@@ -2163,18 +2954,18 @@ static bool overlapping_resync_write(struct drbd_device *device, struct drbd_pee
  * -ERESTARTSYS if we were interrupted (by disconnect signal). */
 static int wait_for_and_update_peer_seq(struct drbd_peer_device *peer_device, const u32 peer_seq)
 {
-	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
 	DEFINE_WAIT(wait);
 	long timeout;
 	int ret = 0, tp;
 
-	if (!test_bit(RESOLVE_CONFLICTS, &peer_device->connection->flags))
+	if (!test_bit(RESOLVE_CONFLICTS, &connection->transport.flags))
 		return 0;
 
-	spin_lock(&device->peer_seq_lock);
+	spin_lock_bh(&peer_device->peer_seq_lock);
 	for (;;) {
-		if (!seq_greater(peer_seq - 1, device->peer_seq)) {
-			device->peer_seq = seq_max(device->peer_seq, peer_seq);
+		if (!seq_greater(peer_seq - 1, peer_device->peer_seq)) {
+			peer_device->peer_seq = seq_max(peer_device->peer_seq, peer_seq);
 			break;
 		}
 
@@ -2184,28 +2975,28 @@ static int wait_for_and_update_peer_seq(struct drbd_peer_device *peer_device, co
 		}
 
 		rcu_read_lock();
-		tp = rcu_dereference(peer_device->connection->net_conf)->two_primaries;
+		tp = rcu_dereference(connection->transport.net_conf)->two_primaries;
 		rcu_read_unlock();
 
 		if (!tp)
 			break;
 
 		/* Only need to wait if two_primaries is enabled */
-		prepare_to_wait(&device->seq_wait, &wait, TASK_INTERRUPTIBLE);
-		spin_unlock(&device->peer_seq_lock);
+		prepare_to_wait(&peer_device->device->seq_wait, &wait, TASK_INTERRUPTIBLE);
+		spin_unlock_bh(&peer_device->peer_seq_lock);
 		rcu_read_lock();
-		timeout = rcu_dereference(peer_device->connection->net_conf)->ping_timeo*HZ/10;
+		timeout = rcu_dereference(connection->transport.net_conf)->ping_timeo*HZ/10;
 		rcu_read_unlock();
 		timeout = schedule_timeout(timeout);
-		spin_lock(&device->peer_seq_lock);
+		spin_lock_bh(&peer_device->peer_seq_lock);
 		if (!timeout) {
 			ret = -ETIMEDOUT;
-			drbd_err(device, "Timed out waiting for missing ack packets; disconnecting\n");
+			drbd_err(peer_device, "Timed out waiting for missing ack packets; disconnecting\n");
 			break;
 		}
 	}
-	spin_unlock(&device->peer_seq_lock);
-	finish_wait(&device->seq_wait, &wait);
+	spin_unlock_bh(&peer_device->peer_seq_lock);
+	finish_wait(&peer_device->device->seq_wait, &wait);
 	return ret;
 }
 
@@ -2215,182 +3006,268 @@ static enum req_op wire_flags_to_bio_op(u32 dpf)
 		return REQ_OP_WRITE_ZEROES;
 	if (dpf & DP_DISCARD)
 		return REQ_OP_DISCARD;
-	else
-		return REQ_OP_WRITE;
+	return REQ_OP_WRITE;
 }
 
 /* see also bio_flags_to_wire() */
 static blk_opf_t wire_flags_to_bio(struct drbd_connection *connection, u32 dpf)
 {
-	return wire_flags_to_bio_op(dpf) |
-		(dpf & DP_RW_SYNC ? REQ_SYNC : 0) |
-		(dpf & DP_FUA ? REQ_FUA : 0) |
-		(dpf & DP_FLUSH ? REQ_PREFLUSH : 0);
-}
+	blk_opf_t opf = wire_flags_to_bio_op(dpf) |
+		(dpf & DP_RW_SYNC ? REQ_SYNC : 0);
 
-static void fail_postponed_requests(struct drbd_device *device, sector_t sector,
-				    unsigned int size)
-{
-	struct drbd_peer_device *peer_device = first_peer_device(device);
-	struct drbd_interval *i;
+	/* we used to communicate one bit only in older DRBD */
+	if (connection->agreed_pro_version >= 95)
+		opf |= (dpf & DP_FUA ? REQ_FUA : 0) |
+			    (dpf & DP_FLUSH ? REQ_PREFLUSH : 0);
 
-    repeat:
-	drbd_for_each_overlap(i, &device->write_requests, sector, size) {
-		struct drbd_request *req;
-		struct bio_and_error m;
+	return opf;
+}
 
-		if (!i->local)
-			continue;
-		req = container_of(i, struct drbd_request, i);
-		if (!(req->rq_state & RQ_POSTPONED))
-			continue;
-		req->rq_state &= ~RQ_POSTPONED;
-		__req_mod(req, NEG_ACKED, peer_device, &m);
-		spin_unlock_irq(&device->resource->req_lock);
-		if (m.bio)
-			complete_master_bio(device, &m);
-		spin_lock_irq(&device->resource->req_lock);
-		goto repeat;
+static void drbd_wait_for_activity_log_extents(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	struct lru_cache *al;
+	int nr_al_extents;
+	int nr, used, ecnt;
+
+	/* Let the activity log know we are about to use it.
+	 * See also drbd_request_prepare() for the "request" entry point. */
+	nr_al_extents = interval_to_al_extents(&peer_req->i);
+	ecnt = atomic_add_return(nr_al_extents, &device->wait_for_actlog_ecnt);
+
+	spin_lock_irq(&device->al_lock);
+	al = device->act_log;
+	nr = al->nr_elements;
+	used = al->used;
+	spin_unlock_irq(&device->al_lock);
+
+	/* note: due to the slight delay between being accounted in "used" after
+	 * being committed to the activity log with drbd_al_begin_io_commit(),
+	 * and being subtracted from "wait_for_actlog_ecnt" in __drbd_submit_peer_request(),
+	 * this can err, but only on the conservative side (overestimating ecnt).
+	 * ecnt also includes any requests which are held due to conflicts,
+	 * conservatively overestimating the number of activity log extents
+	 * required. */
+	if (ecnt > nr - used) {
+		conn_wait_active_ee_empty_or_disconnect(connection);
+		drbd_flush_after_epoch(connection, NULL);
+		conn_wait_done_ee_empty_or_disconnect(connection);
+
+		/* would this peer even understand me? */
+		if (connection->agreed_pro_version >= 114)
+			drbd_send_confirm_stable(peer_req);
 	}
 }
 
-static int handle_write_conflicts(struct drbd_device *device,
-				  struct drbd_peer_request *peer_req)
+static int drbd_peer_write_conflicts(struct drbd_peer_request *peer_req)
 {
-	struct drbd_connection *connection = peer_req->peer_device->connection;
-	bool resolve_conflicts = test_bit(RESOLVE_CONFLICTS, &connection->flags);
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
 	sector_t sector = peer_req->i.sector;
 	const unsigned int size = peer_req->i.size;
 	struct drbd_interval *i;
-	bool equal;
-	int err;
 
-	/*
-	 * Inserting the peer request into the write_requests tree will prevent
-	 * new conflicting local requests from being added.
-	 */
-	drbd_insert_interval(&device->write_requests, &peer_req->i);
+	i = drbd_find_conflict(device, &peer_req->i, CONFLICT_FLAG_APPLICATION_ONLY);
 
-    repeat:
-	drbd_for_each_overlap(i, &device->write_requests, sector, size) {
-		if (i == &peer_req->i)
-			continue;
-		if (i->completed)
+	if (i) {
+		drbd_alert(device, "Concurrent writes detected: "
+				"local=%llus +%u, remote=%llus +%u\n",
+				(unsigned long long) i->sector, i->size,
+				(unsigned long long) sector, size);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void drbd_queue_peer_request(struct drbd_device *device, struct drbd_peer_request *peer_req)
+{
+	atomic_inc(&device->wait_for_actlog);
+	spin_lock(&device->submit.lock);
+	list_add_tail(&peer_req->w.list, &device->submit.peer_writes);
+	spin_unlock(&device->submit.lock);
+	queue_work(device->submit.wq, &device->submit.worker);
+	/* do_submit() may sleep internally on al_wait, too */
+	wake_up(&device->al_wait);
+}
+
+static struct drbd_peer_request *find_released_peer_request(struct drbd_resource *resource, unsigned int node_id, u64 dagtag)
+{
+	struct drbd_connection *connection;
+	struct drbd_peer_request *released_peer_req = NULL;
+
+	read_lock_irq(&resource->state_rwlock);
+	for_each_connection(connection, resource) {
+		struct drbd_peer_request *peer_req;
+
+		/* Skip if we are not connected. If we are in the process of
+		 * disconnecting, the requests on dagtag_wait_ee will be
+		 * cleared up. Do not interfere with that process. */
+		if (connection->cstate[NOW] < C_CONNECTED)
 			continue;
 
-		if (!i->local) {
-			/*
-			 * Our peer has sent a conflicting remote request; this
-			 * should not happen in a two-node setup.  Wait for the
-			 * earlier peer request to complete.
-			 */
-			err = drbd_wait_misc(device, i);
-			if (err)
-				goto out;
-			goto repeat;
+		spin_lock(&connection->peer_reqs_lock);
+		list_for_each_entry(peer_req, &connection->dagtag_wait_ee, w.list) {
+			if (!peer_req->depend_dagtag ||
+					peer_req->depend_dagtag_node_id != node_id ||
+					peer_req->depend_dagtag > dagtag)
+				continue;
+
+			dynamic_drbd_dbg(peer_req->peer_device, "%s at %llus+%u: Wait for dagtag %llus from peer %u complete\n",
+					drbd_interval_type_str(&peer_req->i),
+					(unsigned long long) peer_req->i.sector, peer_req->i.size,
+					(unsigned long long) peer_req->depend_dagtag,
+					peer_req->depend_dagtag_node_id);
+
+			list_del(&peer_req->w.list);
+			released_peer_req = peer_req;
+			break;
 		}
+		spin_unlock(&connection->peer_reqs_lock);
 
-		equal = i->sector == sector && i->size == size;
-		if (resolve_conflicts) {
-			/*
-			 * If the peer request is fully contained within the
-			 * overlapping request, it can be considered overwritten
-			 * and thus superseded; otherwise, it will be retried
-			 * once all overlapping requests have completed.
-			 */
-			bool superseded = i->sector <= sector && i->sector +
-				       (i->size >> 9) >= sector + (size >> 9);
-
-			if (!equal)
-				drbd_alert(device, "Concurrent writes detected: "
-					       "local=%llus +%u, remote=%llus +%u, "
-					       "assuming %s came first\n",
-					  (unsigned long long)i->sector, i->size,
-					  (unsigned long long)sector, size,
-					  superseded ? "local" : "remote");
-
-			peer_req->w.cb = superseded ? e_send_superseded :
-						   e_send_retry_write;
-			list_add_tail(&peer_req->w.list, &device->done_ee);
-			/* put is in drbd_send_acks_wf() */
-			kref_get(&device->kref);
-			if (!queue_work(connection->ack_sender,
-					&peer_req->peer_device->send_acks_work))
-				kref_put(&device->kref, drbd_destroy_device);
+		if (released_peer_req)
+			break;
+	}
+	read_unlock_irq(&resource->state_rwlock);
 
-			err = -ENOENT;
-			goto out;
-		} else {
-			struct drbd_request *req =
-				container_of(i, struct drbd_request, i);
+	return released_peer_req;
+}
 
-			if (!equal)
-				drbd_alert(device, "Concurrent writes detected: "
-					       "local=%llus +%u, remote=%llus +%u\n",
-					  (unsigned long long)i->sector, i->size,
-					  (unsigned long long)sector, size);
+static void release_dagtag_wait(struct drbd_resource *resource, unsigned int node_id, u64 dagtag)
+{
+	struct drbd_peer_request *peer_req;
 
-			if (req->rq_state & RQ_LOCAL_PENDING ||
-			    !(req->rq_state & RQ_POSTPONED)) {
-				/*
-				 * Wait for the node with the discard flag to
-				 * decide if this request has been superseded
-				 * or needs to be retried.
-				 * Requests that have been superseded will
-				 * disappear from the write_requests tree.
-				 *
-				 * In addition, wait for the conflicting
-				 * request to finish locally before submitting
-				 * the conflicting peer request.
-				 */
-				err = drbd_wait_misc(device, &req->i);
-				if (err) {
-					_conn_request_state(connection, NS(conn, C_TIMEOUT), CS_HARD);
-					fail_postponed_requests(device, sector, size);
-					goto out;
-				}
-				goto repeat;
-			}
-			/*
-			 * Remember to restart the conflicting requests after
-			 * the new peer request has completed.
-			 */
-			peer_req->flags |= EE_RESTART_REQUESTS;
-		}
+	while ((peer_req = find_released_peer_request(resource, node_id, dagtag))) {
+		atomic_inc(&peer_req->peer_device->connection->backing_ee_cnt);
+		drbd_conflict_submit_peer_read(peer_req);
 	}
-	err = 0;
+}
+
+static void set_connection_dagtag(struct drbd_connection *connection, u64 dagtag)
+{
+	atomic64_set(&connection->last_dagtag_sector, dagtag);
+	set_bit(RECEIVED_DAGTAG, &connection->flags);
+
+	release_dagtag_wait(connection->resource, connection->peer_node_id, dagtag);
+}
+
+static void submit_peer_request_activity_log(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	int err;
+	int nr_al_extents = interval_to_al_extents(&peer_req->i);
+
+	if (nr_al_extents != 1 || !drbd_al_begin_io_fastpath(device, &peer_req->i)) {
+		drbd_queue_peer_request(device, peer_req);
+		return;
+	}
+
+	peer_req->flags |= EE_IN_ACTLOG;
+	atomic_sub(nr_al_extents, &device->wait_for_actlog_ecnt);
 
-    out:
+	err = drbd_submit_peer_request(peer_req);
 	if (err)
-		drbd_remove_epoch_entry_interval(device, peer_req);
-	return err;
+		drbd_cleanup_after_failed_submit_peer_write(peer_req);
+}
+
+void drbd_conflict_submit_peer_write(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	bool conflict = false;
+
+	spin_lock_irq(&device->interval_lock);
+	clear_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &peer_req->i.flags);
+	conflict = drbd_find_conflict(device, &peer_req->i, 0);
+	if (!conflict)
+		set_bit(INTERVAL_SUBMITTED, &peer_req->i.flags);
+	spin_unlock_irq(&device->interval_lock);
+
+	if (!conflict)
+		submit_peer_request_activity_log(peer_req);
 }
 
-/* mirrored write */
+/* mirrored write
+ *
+ * Request handling flow:
+ *
+ *                      conflict
+ * receive_Data -----------------------+
+ *       |                             |
+ *       |                            ...
+ *       |                             |
+ *       |                             v
+ *       |                   drbd_do_submit_conflict
+ *       |                             |
+ *       |                             v
+ *       +------------------ drbd_conflict_submit_peer_write
+ *       |
+ *       v                         wait for AL
+ * submit_peer_request_activity_log --------> drbd_queue_peer_request
+ *       |                                         |
+ *       |                                        ...
+ *       |                                         |
+ *       |                                         v    AL extent active
+ *       |                                    do_submit ----------------+
+ *       |                                         |                    |
+ *       |                                         v                    v
+ *       |                              send_and_submit_pending   submit_fast_path
+ *       |                                         |                    |
+ *       v                                         v                    |
+ * drbd_submit_peer_request <-------- __drbd_submit_peer_request <------+
+ *       |
+ *      ... backing device
+ *       |
+ *       v
+ * drbd_peer_request_endio
+ *       |
+ *       v
+ * drbd_endio_write_sec_final
+ *       |
+ *      ... done_ee
+ *       |
+ *       v
+ * drbd_finish_peer_reqs
+ *       |
+ *       v
+ * e_end_block
+ *       |
+ *      ... via peer
+ *       |
+ *       v
+ * got_peer_ack
+ */
 static int receive_Data(struct drbd_connection *connection, struct packet_info *pi)
 {
 	struct drbd_peer_device *peer_device;
 	struct drbd_device *device;
 	struct net_conf *nc;
-	sector_t sector;
 	struct drbd_peer_request *peer_req;
-	struct p_data *p = pi->data;
-	u32 peer_seq = be32_to_cpu(p->seq_num);
-	u32 dp_flags;
+	struct drbd_peer_request_details d;
 	int err, tp;
+	bool conflict = false;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
 		return -EIO;
 	device = peer_device->device;
 
+	if (pi->cmd == P_TRIM)
+		D_ASSERT(peer_device, pi->size == 0);
+
+	p_req_detail_from_pi(connection, &d, pi);
+	pi->data = NULL;
+
 	if (!get_ldev(device)) {
 		int err2;
 
-		err = wait_for_and_update_peer_seq(peer_device, peer_seq);
-		drbd_send_ack_dp(peer_device, P_NEG_ACK, p, pi->size);
+		err = wait_for_and_update_peer_seq(peer_device, d.peer_seq);
+		drbd_send_ack_dp(peer_device, P_NEG_ACK, &d);
 		atomic_inc(&connection->current_epoch->epoch_size);
-		err2 = drbd_drain_block(peer_device, pi->size);
+		err2 = ignore_remaining_packet(connection, pi->size);
 		if (!err)
 			err = err2;
 		return err;
@@ -2402,71 +3279,107 @@ static int receive_Data(struct drbd_connection *connection, struct packet_info *
 	 * end of this function.
 	 */
 
-	sector = be64_to_cpu(p->sector);
-	peer_req = read_in_block(peer_device, p->block_id, sector, pi);
+	peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY, d.bi_size,
+				       wire_flags_to_bio(connection, d.dp_flags));
 	if (!peer_req) {
 		put_ldev(device);
 		return -EIO;
 	}
+	peer_req->i.size = d.bi_size; /* storage size */
+	peer_req->i.sector = d.sector;
+	peer_req->i.type = INTERVAL_PEER_WRITE;
+
+	err = read_in_block(peer_req, &d);
+	if (err) {
+		drbd_free_peer_req(peer_req);
+		put_ldev(device);
+		return err;
+	}
+
+	if (pi->cmd == P_TRIM)
+		peer_req->flags |= EE_TRIM;
+	else if (pi->cmd == P_ZEROES)
+		peer_req->flags |= EE_ZEROOUT;
 
 	peer_req->w.cb = e_end_block;
 	peer_req->submit_jif = jiffies;
-	peer_req->flags |= EE_APPLICATION;
 
-	dp_flags = be32_to_cpu(p->dp_flags);
-	peer_req->opf = wire_flags_to_bio(connection, dp_flags);
 	if (pi->cmd == P_TRIM) {
 		D_ASSERT(peer_device, peer_req->i.size > 0);
-		D_ASSERT(peer_device, peer_req_op(peer_req) == REQ_OP_DISCARD);
-		D_ASSERT(peer_device, peer_req->pages == NULL);
+		D_ASSERT(peer_device, d.dp_flags & DP_DISCARD);
+		D_ASSERT(peer_device, bio_op(peer_req->bios.head) == REQ_OP_DISCARD);
 		/* need to play safe: an older DRBD sender
 		 * may mean zero-out while sending P_TRIM. */
 		if (0 == (connection->agreed_features & DRBD_FF_WZEROES))
 			peer_req->flags |= EE_ZEROOUT;
 	} else if (pi->cmd == P_ZEROES) {
 		D_ASSERT(peer_device, peer_req->i.size > 0);
-		D_ASSERT(peer_device, peer_req_op(peer_req) == REQ_OP_WRITE_ZEROES);
-		D_ASSERT(peer_device, peer_req->pages == NULL);
+		D_ASSERT(peer_device, d.dp_flags & DP_ZEROES);
+		D_ASSERT(peer_device, bio_op(peer_req->bios.head) == REQ_OP_WRITE_ZEROES);
 		/* Do (not) pass down BLKDEV_ZERO_NOUNMAP? */
-		if (dp_flags & DP_DISCARD)
+		if (d.dp_flags & DP_DISCARD)
 			peer_req->flags |= EE_TRIM;
-	} else if (peer_req->pages == NULL) {
-		D_ASSERT(device, peer_req->i.size == 0);
-		D_ASSERT(device, dp_flags & DP_FLUSH);
+	} else {
+		D_ASSERT(peer_device, peer_req->i.size > 0);
+		D_ASSERT(peer_device, bio_op(peer_req->bios.head) == REQ_OP_WRITE);
 	}
 
-	if (dp_flags & DP_MAY_SET_IN_SYNC)
+	if (d.dp_flags & DP_MAY_SET_IN_SYNC)
 		peer_req->flags |= EE_MAY_SET_IN_SYNC;
 
 	spin_lock(&connection->epoch_lock);
 	peer_req->epoch = connection->current_epoch;
 	atomic_inc(&peer_req->epoch->epoch_size);
 	atomic_inc(&peer_req->epoch->active);
+	if (peer_req->epoch->oldest_unconfirmed_peer_req == NULL)
+		peer_req->epoch->oldest_unconfirmed_peer_req = peer_req;
+
+	if (connection->resource->write_ordering == WO_BIO_BARRIER &&
+	    atomic_read(&peer_req->epoch->epoch_size) == 1) {
+		struct drbd_epoch *epoch;
+		/* Issue a barrier if we start a new epoch, and the previous epoch
+		   was not a epoch containing a single request which already was
+		   a Barrier. */
+		epoch = list_entry(peer_req->epoch->list.prev, struct drbd_epoch, list);
+		if (epoch == peer_req->epoch) {
+			set_bit(DE_CONTAINS_A_BARRIER, &peer_req->epoch->flags);
+			peer_req->bios.head->bi_opf |= REQ_PREFLUSH | REQ_FUA;
+			peer_req->flags |= EE_IS_BARRIER;
+		} else {
+			if (atomic_read(&epoch->epoch_size) > 1 ||
+			    !test_bit(DE_CONTAINS_A_BARRIER, &epoch->flags)) {
+				set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &epoch->flags);
+				set_bit(DE_CONTAINS_A_BARRIER, &peer_req->epoch->flags);
+				peer_req->bios.head->bi_opf |= REQ_PREFLUSH | REQ_FUA;
+				peer_req->flags |= EE_IS_BARRIER;
+			}
+		}
+	}
 	spin_unlock(&connection->epoch_lock);
 
 	rcu_read_lock();
-	nc = rcu_dereference(peer_device->connection->net_conf);
+	nc = rcu_dereference(connection->transport.net_conf);
 	tp = nc->two_primaries;
-	if (peer_device->connection->agreed_pro_version < 100) {
+	if (connection->agreed_pro_version < 100) {
 		switch (nc->wire_protocol) {
 		case DRBD_PROT_C:
-			dp_flags |= DP_SEND_WRITE_ACK;
+			d.dp_flags |= DP_SEND_WRITE_ACK;
 			break;
 		case DRBD_PROT_B:
-			dp_flags |= DP_SEND_RECEIVE_ACK;
+			d.dp_flags |= DP_SEND_RECEIVE_ACK;
 			break;
 		}
 	}
 	rcu_read_unlock();
 
-	if (dp_flags & DP_SEND_WRITE_ACK) {
+	if (d.dp_flags & DP_SEND_WRITE_ACK) {
 		peer_req->flags |= EE_SEND_WRITE_ACK;
-		inc_unacked(device);
+		inc_unacked(peer_device);
 		/* corresponding dec_unacked() in e_end_block()
 		 * respective _drbd_clear_done_ee */
 	}
 
-	if (dp_flags & DP_SEND_RECEIVE_ACK) {
+	if (d.dp_flags & DP_SEND_RECEIVE_ACK) {
 		/* I really don't like it that the receiver thread
 		 * sends on the msock, but anyways */
 		drbd_send_ack(peer_device, P_RECV_ACK, peer_req);
@@ -2474,66 +3387,137 @@ static int receive_Data(struct drbd_connection *connection, struct packet_info *
 
 	if (tp) {
 		/* two primaries implies protocol C */
-		D_ASSERT(device, dp_flags & DP_SEND_WRITE_ACK);
-		peer_req->flags |= EE_IN_INTERVAL_TREE;
-		err = wait_for_and_update_peer_seq(peer_device, peer_seq);
+		D_ASSERT(device, d.dp_flags & DP_SEND_WRITE_ACK);
+		err = wait_for_and_update_peer_seq(peer_device, d.peer_seq);
 		if (err)
-			goto out_interrupted;
-		spin_lock_irq(&device->resource->req_lock);
-		err = handle_write_conflicts(device, peer_req);
-		if (err) {
-			spin_unlock_irq(&device->resource->req_lock);
-			if (err == -ENOENT) {
-				put_ldev(device);
-				return 0;
-			}
-			goto out_interrupted;
-		}
+			goto out;
 	} else {
-		update_peer_seq(peer_device, peer_seq);
-		spin_lock_irq(&device->resource->req_lock);
-	}
-	/* TRIM and is processed synchronously,
-	 * we wait for all pending requests, respectively wait for
-	 * active_ee to become empty in drbd_submit_peer_request();
-	 * better not add ourselves here. */
-	if ((peer_req->flags & (EE_TRIM | EE_ZEROOUT)) == 0)
-		list_add_tail(&peer_req->w.list, &device->active_ee);
-	spin_unlock_irq(&device->resource->req_lock);
-
-	if (device->state.conn == C_SYNC_TARGET)
-		wait_event(device->ee_wait, !overlapping_resync_write(device, peer_req));
-
-	if (device->state.pdsk < D_INCONSISTENT) {
-		/* In case we have the only disk of the cluster, */
-		drbd_set_out_of_sync(peer_device, peer_req->i.sector, peer_req->i.size);
-		peer_req->flags &= ~EE_MAY_SET_IN_SYNC;
-		drbd_al_begin_io(device, &peer_req->i);
-		peer_req->flags |= EE_CALL_AL_COMPLETE_IO;
+		update_peer_seq(peer_device, d.peer_seq);
 	}
 
-	err = drbd_submit_peer_request(peer_req);
-	if (!err)
-		return 0;
+	peer_req->dagtag_sector = atomic64_read(&connection->last_dagtag_sector) + (peer_req->i.size >> 9);
 
-	/* don't care for the reason here */
-	drbd_err(device, "submit failed, triggering re-connect\n");
-	spin_lock_irq(&device->resource->req_lock);
-	list_del(&peer_req->w.list);
-	drbd_remove_epoch_entry_interval(device, peer_req);
-	spin_unlock_irq(&device->resource->req_lock);
-	if (peer_req->flags & EE_CALL_AL_COMPLETE_IO) {
-		peer_req->flags &= ~EE_CALL_AL_COMPLETE_IO;
-		drbd_al_complete_io(device, &peer_req->i);
+	drbd_wait_for_activity_log_extents(peer_req);
+
+	atomic_inc(&connection->active_ee_cnt);
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_add_tail(&peer_req->recv_order, &connection->peer_requests);
+	peer_req->flags |= EE_ON_RECV_ORDER;
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	/* Note: this now may or may not be "hot" in the activity log.
+	 * Still, it is the best time to record that we need to set the
+	 * out-of-sync bit, if we delay that until drbd_submit_peer_request(),
+	 * we may introduce a race with some re-attach on the peer.
+	 * Unless we want to guarantee that we drain all in-flight IO
+	 * whenever we receive a state change. Which I'm not sure about.
+	 * Use the EE_SET_OUT_OF_SYNC flag, to be acted on just before
+	 * the actual submit, when we can be sure it is "hot".
+	 */
+	if (peer_device->disk_state[NOW] < D_INCONSISTENT) {
+		peer_req->flags &= ~EE_MAY_SET_IN_SYNC;
+		peer_req->flags |= EE_SET_OUT_OF_SYNC;
 	}
 
-out_interrupted:
-	drbd_may_finish_epoch(connection, peer_req->epoch, EV_PUT | EV_CLEANUP);
+	spin_lock_irq(&device->interval_lock);
+	if (tp) {
+		err = drbd_peer_write_conflicts(peer_req);
+		if (err) {
+			spin_unlock_irq(&device->interval_lock);
+			goto out_del_list;
+		}
+	}
+	conflict = drbd_find_conflict(device, &peer_req->i, 0);
+	drbd_insert_interval(&device->requests, &peer_req->i);
+	if (!conflict)
+		set_bit(INTERVAL_SUBMITTED, &peer_req->i.flags);
+	spin_unlock_irq(&device->interval_lock);
+
+	/* The connection dagtag may only be set after inserting the interval
+	 * into the tree, so that requests that were waiting for the dagtag
+	 * enter the interval tree after the request with the dagtag itself. */
+	set_connection_dagtag(connection, peer_req->dagtag_sector);
+
+	if (!conflict)
+		submit_peer_request_activity_log(peer_req);
+	/* ldev_ref_transfer: put_ldev in peer_req endio */
+	return 0;
+
+out_del_list:
+	spin_lock_irq(&connection->peer_reqs_lock);
+	peer_req->flags &= ~EE_ON_RECV_ORDER;
+	list_del(&peer_req->recv_order);
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	atomic_dec(&connection->active_ee_cnt);
+	atomic_sub(interval_to_al_extents(&peer_req->i), &device->wait_for_actlog_ecnt);
+
+out:
+	if (peer_req->flags & EE_SEND_WRITE_ACK)
+		dec_unacked(peer_device);
+	drbd_may_finish_epoch(connection, peer_req->epoch, EV_PUT + EV_CLEANUP);
 	put_ldev(device);
-	drbd_free_peer_req(device, peer_req);
+	drbd_free_peer_req(peer_req);
 	return err;
 }
 
+/*
+ * To be called when drbd_submit_peer_request() fails for a peer write request.
+ */
+void drbd_cleanup_after_failed_submit_peer_write(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+
+	drbd_err_ratelimit(peer_device, "submit failed, triggering re-connect\n");
+
+	if (peer_req->flags & EE_IN_ACTLOG)
+		drbd_al_complete_io(device, &peer_req->i);
+
+	drbd_remove_peer_req_interval(peer_req);
+
+	drbd_may_finish_epoch(connection, peer_req->epoch, EV_PUT + EV_CLEANUP);
+	put_ldev(device);
+	drbd_free_peer_req(peer_req);
+	change_cstate(connection, C_PROTOCOL_ERROR, CS_HARD);
+}
+
+/* Possibly "cancel" and forget about all peer_requests that had still been
+ * waiting for the activity log (wfa) when the connection to their peer failed,
+ * and pretend we never received them.
+ */
+void drbd_cleanup_peer_requests_wfa(struct drbd_device *device, struct list_head *cleanup)
+{
+	struct drbd_connection *connection;
+	struct drbd_peer_request *peer_req, *pr_tmp;
+
+	write_lock_irq(&device->resource->state_rwlock);
+	list_for_each_entry(peer_req, cleanup, w.list) {
+		atomic_dec(&peer_req->peer_device->connection->active_ee_cnt);
+		drbd_remove_peer_req_interval(peer_req);
+	}
+	write_unlock_irq(&device->resource->state_rwlock);
+
+	list_for_each_entry_safe(peer_req, pr_tmp, cleanup, w.list) {
+		atomic_sub(interval_to_al_extents(&peer_req->i), &device->wait_for_actlog_ecnt);
+		atomic_dec(&device->wait_for_actlog);
+		if (peer_req->flags & EE_SEND_WRITE_ACK)
+			dec_unacked(peer_req->peer_device);
+		list_del_init(&peer_req->w.list);
+		drbd_may_finish_epoch(peer_req->peer_device->connection, peer_req->epoch, EV_PUT | EV_CLEANUP);
+		drbd_free_peer_req(peer_req);
+		put_ldev(device);
+	}
+	/*
+	 * We changed (likely: cleared) active_ee_cnt for "at least one" connection.
+	 * We should wake potential waiters, just in case.
+	 */
+	for_each_connection(connection, device->resource)
+		wake_up(&connection->ee_wait);
+}
+
 /* We may throttle resync, if the lower device seems to be busy,
  * and current sync rate is above c_min_rate.
  *
@@ -2545,69 +3529,45 @@ static int receive_Data(struct drbd_connection *connection, struct packet_info *
  * The current sync rate used here uses only the most recent two step marks,
  * to have a short time average so we can react faster.
  */
-bool drbd_rs_should_slow_down(struct drbd_peer_device *peer_device, sector_t sector,
-		bool throttle_if_app_is_waiting)
+bool drbd_rs_c_min_rate_throttle(struct drbd_peer_device *peer_device)
 {
 	struct drbd_device *device = peer_device->device;
-	struct lc_element *tmp;
-	bool throttle = drbd_rs_c_min_rate_throttle(device);
-
-	if (!throttle || throttle_if_app_is_waiting)
-		return throttle;
-
-	spin_lock_irq(&device->al_lock);
-	tmp = lc_find(device->resync, BM_SECT_TO_EXT(sector));
-	if (tmp) {
-		struct bm_extent *bm_ext = lc_entry(tmp, struct bm_extent, lce);
-		if (test_bit(BME_PRIORITY, &bm_ext->flags))
-			throttle = false;
-		/* Do not slow down if app IO is already waiting for this extent,
-		 * and our progress is necessary for application IO to complete. */
-	}
-	spin_unlock_irq(&device->al_lock);
-
-	return throttle;
-}
-
-bool drbd_rs_c_min_rate_throttle(struct drbd_device *device)
-{
 	struct gendisk *disk = device->ldev->backing_bdev->bd_disk;
 	unsigned long db, dt, dbdt;
 	unsigned int c_min_rate;
 	int curr_events;
 
 	rcu_read_lock();
-	c_min_rate = rcu_dereference(device->ldev->disk_conf)->c_min_rate;
+	c_min_rate = rcu_dereference(peer_device->conf)->c_min_rate;
 	rcu_read_unlock();
 
 	/* feature disabled? */
 	if (c_min_rate == 0)
 		return false;
 
-	curr_events = (int)part_stat_read_accum(disk->part0, sectors) -
-			atomic_read(&device->rs_sect_ev);
+	curr_events = (int)part_stat_read_accum(disk->part0, sectors)
+		- atomic_read(&device->rs_sect_ev);
 
-	if (atomic_read(&device->ap_actlog_cnt)
-	    || curr_events - device->rs_last_events > 64) {
+	if (atomic_read(&device->ap_actlog_cnt) || curr_events - peer_device->rs_last_events > 64) {
 		unsigned long rs_left;
 		int i;
 
-		device->rs_last_events = curr_events;
+		peer_device->rs_last_events = curr_events;
 
 		/* sync speed average over the last 2*DRBD_SYNC_MARK_STEP,
 		 * approx. */
-		i = (device->rs_last_mark + DRBD_SYNC_MARKS-1) % DRBD_SYNC_MARKS;
+		i = (peer_device->rs_last_mark + DRBD_SYNC_MARKS-1) % DRBD_SYNC_MARKS;
 
-		if (device->state.conn == C_VERIFY_S || device->state.conn == C_VERIFY_T)
-			rs_left = device->ov_left;
+		if (peer_device->repl_state[NOW] == L_VERIFY_S || peer_device->repl_state[NOW] == L_VERIFY_T)
+			rs_left = atomic64_read(&peer_device->ov_left);
 		else
-			rs_left = drbd_bm_total_weight(device) - device->rs_failed;
+			rs_left = drbd_bm_total_weight(peer_device) - peer_device->rs_failed;
 
-		dt = ((long)jiffies - (long)device->rs_mark_time[i]) / HZ;
+		dt = ((long)jiffies - (long)peer_device->rs_mark_time[i]) / HZ;
 		if (!dt)
 			dt++;
-		db = device->rs_mark_left[i] - rs_left;
-		dbdt = Bit2KB(db/dt);
+		db = peer_device->rs_mark_left[i] - rs_left;
+		dbdt = device_bit_to_kb(device, db/dt);
 
 		if (dbdt > c_min_rate)
 			return true;
@@ -2615,16 +3575,199 @@ bool drbd_rs_c_min_rate_throttle(struct drbd_device *device)
 	return false;
 }
 
-static int receive_DataRequest(struct drbd_connection *connection, struct packet_info *pi)
+void drbd_verify_skipped_block(struct drbd_peer_device *peer_device,
+		const sector_t sector, const unsigned int size)
+{
+	++peer_device->ov_skipped;
+	if (peer_device->ov_last_skipped_start + peer_device->ov_last_skipped_size == sector) {
+		peer_device->ov_last_skipped_size += size>>9;
+	} else {
+		ov_skipped_print(peer_device);
+		peer_device->ov_last_skipped_start = sector;
+		peer_device->ov_last_skipped_size = size>>9;
+	}
+}
+
+static void drbd_cleanup_peer_read(
+		struct drbd_peer_request *peer_req, bool in_interval_tree)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+
+	if (in_interval_tree)
+		drbd_remove_peer_req_interval(peer_req);
+
+	if (peer_req->i.type != INTERVAL_PEER_READ)
+		atomic_sub(peer_req->i.size >> SECTOR_SHIFT, &device->rs_sect_ev);
+	dec_unacked(peer_device);
+
+	drbd_free_peer_req(peer_req);
+	put_ldev(device);
+
+	if (atomic_dec_and_test(&connection->backing_ee_cnt))
+		wake_up(&connection->ee_wait);
+}
+
+void drbd_conflict_submit_peer_read(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	bool submit = true;
+	bool interval_tree = false;
+	bool canceled = false;
+
+	/* Hold resync reads until conflicts have cleared so that we know which
+	 * bitmap bits we can safely clear. Also add verify requests on the
+	 * target to the interval tree so that conflicts can be detected.
+	 * Verify requests on the source have already been added. */
+	if (drbd_interval_is_resync(&peer_req->i) || peer_req->i.type == INTERVAL_OV_READ_TARGET) {
+		bool conflict = false;
+		interval_tree = true;
+		spin_lock_irq(&device->interval_lock);
+		clear_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &peer_req->i.flags);
+		canceled = test_bit(INTERVAL_CANCELED, &peer_req->i.flags);
+		conflict = drbd_find_conflict(device, &peer_req->i, 0);
+		if (drbd_interval_empty(&peer_req->i)) {
+			if (conflict)
+				set_bit(INTERVAL_CONFLICT, &peer_req->i.flags);
+			drbd_insert_interval(&device->requests, &peer_req->i);
+		}
+		if (!conflict || drbd_interval_is_verify(&peer_req->i))
+			set_bit(INTERVAL_SUBMITTED, &peer_req->i.flags);
+		else
+			submit = false;
+		spin_unlock_irq(&device->interval_lock);
+	}
+
+	/* Wait if there are conflicts unless this is a verify request, in
+	 * which case we submit it anyway but skip the block if it conflicted. */
+	if (submit) {
+		int err = drbd_submit_peer_request(peer_req);
+		if (err) {
+			if (drbd_ratelimit())
+				drbd_err(peer_device, "submit failed, triggering re-connect\n");
+
+			drbd_cleanup_peer_read(peer_req, interval_tree);
+			change_cstate(peer_device->connection, C_PROTOCOL_ERROR, CS_HARD);
+		}
+	} else if (canceled) {
+		drbd_cleanup_peer_read(peer_req, interval_tree);
+	}
+}
+
+static bool need_to_wait_for_dagtag_of_peer_request(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_resource *resource = device->resource;
+	struct drbd_connection *connection;
+	bool ret = false;
+
+	rcu_read_lock();
+	connection = drbd_connection_by_node_id(resource, peer_req->depend_dagtag_node_id);
+	if (connection && connection->cstate[NOW] == C_CONNECTED) {
+		if (atomic64_read(&connection->last_dagtag_sector) < peer_req->depend_dagtag)
+			ret = true;
+	}
+	/*
+	 * I am a weak node if the resync source (myself) is not connected to the
+	 * depend_dagtag_node_id. The resync target will abort this resync soon.
+	 * See check_resync_source().
+	 */
+	rcu_read_unlock();
+	return ret;
+}
+
+static void drbd_peer_resync_read_cancel(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	sector_t sector = peer_req->i.sector;
+	int size = peer_req->i.size;
+	u64 block_id = peer_req->block_id;
+
+	if (peer_req->i.type == INTERVAL_OV_READ_SOURCE) {
+		/* P_OV_REPLY */
+		dec_rs_pending(peer_device);
+		drbd_send_ov_result(peer_device, sector, size, block_id, OV_RESULT_SKIP);
+	} else if (peer_req->i.type == INTERVAL_OV_READ_TARGET) {
+		/* P_OV_REQUEST */
+		drbd_verify_skipped_block(peer_device, sector, size);
+		verify_progress(peer_device, sector, size);
+		drbd_send_ack_be(peer_device, P_RS_CANCEL, sector, size, block_id);
+	} else {
+		/* P_RS_DATA_REQUEST etc */
+		drbd_send_ack_be(peer_device, P_RS_CANCEL, sector, size, block_id);
+	}
+}
+
+static void drbd_peer_resync_read(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+	unsigned int size = peer_req->i.size;
+
+	if (connection->peer_role[NOW] != R_PRIMARY &&
+			drbd_rs_c_min_rate_throttle(peer_device))
+		schedule_timeout_uninterruptible(HZ/10);
+
+	atomic_add(size >> 9, &device->rs_sect_ev);
+
+	/* dagtag 0 means that there is no dependency to be fulfilled,
+	 * so we can ignore it.
+	 * If we are the dependent node, we can also ignore the dagtag
+	 * dependency, because the request with this dagtag must already be in
+	 * the interval tree, so the read will wait until the interval tree
+	 * conflict is resolved before being submitted. */
+	if (peer_req->depend_dagtag &&
+	    peer_req->depend_dagtag_node_id != device->resource->res_opts.node_id &&
+	    need_to_wait_for_dagtag_of_peer_request(peer_req)) {
+		dynamic_drbd_dbg(peer_device,
+				 "%s at %llus+%u: Waiting for dagtag %llus from peer %u\n",
+				 drbd_interval_type_str(&peer_req->i),
+				 (unsigned long long)peer_req->i.sector, size,
+				 (unsigned long long)peer_req->depend_dagtag,
+				 peer_req->depend_dagtag_node_id);
+		spin_lock_irq(&connection->peer_reqs_lock);
+		list_add_tail(&peer_req->w.list, &connection->dagtag_wait_ee);
+		spin_unlock_irq(&connection->peer_reqs_lock);
+		return;
+	}
+
+	atomic_inc(&connection->backing_ee_cnt);
+	drbd_conflict_submit_peer_read(peer_req);
+}
+
+static int receive_digest(struct drbd_peer_request *peer_req, int digest_size)
+{
+	struct digest_info *di = NULL;
+
+	di = kmalloc(sizeof(*di) + digest_size, GFP_NOIO);
+	if (!di)
+		return -ENOMEM;
+
+	di->digest_size = digest_size;
+	di->digest = (((char *)di)+sizeof(struct digest_info));
+
+	peer_req->digest = di;
+	peer_req->flags |= EE_HAS_DIGEST;
+
+	return drbd_recv_into(peer_req->peer_device->connection, di->digest, digest_size);
+}
+
+static int receive_common_data_request(struct drbd_connection *connection, struct packet_info *pi,
+		struct p_block_req_common *p,
+		unsigned int depend_dagtag_node_id, u64 depend_dagtag)
 {
 	struct drbd_peer_device *peer_device;
 	struct drbd_device *device;
-	sector_t sector;
+	sector_t sector = be64_to_cpu(p->sector);
 	sector_t capacity;
 	struct drbd_peer_request *peer_req;
-	struct digest_info *di = NULL;
-	int size, verb;
-	struct p_block_req *p =	pi->data;
+	int size = be32_to_cpu(p->blksize);
+	enum drbd_disk_state min_d_state;
+	int err;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
@@ -2632,67 +3775,135 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 	device = peer_device->device;
 	capacity = get_capacity(device->vdisk);
 
-	sector = be64_to_cpu(p->sector);
-	size   = be32_to_cpu(p->blksize);
-
 	if (size <= 0 || !IS_ALIGNED(size, 512) || size > DRBD_MAX_BIO_SIZE) {
-		drbd_err(device, "%s:%d: sector: %llus, size: %u\n", __FILE__, __LINE__,
+		drbd_err(peer_device, "%s:%d: sector: %llus, size: %u\n", __FILE__, __LINE__,
 				(unsigned long long)sector, size);
 		return -EINVAL;
 	}
 	if (sector + (size>>9) > capacity) {
-		drbd_err(device, "%s:%d: sector: %llus, size: %u\n", __FILE__, __LINE__,
+		drbd_err(peer_device, "%s:%d: sector: %llus, size: %u\n", __FILE__, __LINE__,
 				(unsigned long long)sector, size);
 		return -EINVAL;
 	}
 
-	if (!get_ldev_if_state(device, D_UP_TO_DATE)) {
-		verb = 1;
+	/* Tell target to have a retry, waiting for the rescheduled
+	 * drbd_start_resync to complete. Otherwise the concurrency
+	 * of send oos and resync may lead to data loss.
+	 */
+	if (peer_device->repl_state[NOW] == L_WF_BITMAP_S ||
+			peer_device->repl_state[NOW] == L_STARTING_SYNC_S) {
 		switch (pi->cmd) {
-		case P_DATA_REQUEST:
-			drbd_send_ack_rp(peer_device, P_NEG_DREPLY, p);
-			break;
-		case P_RS_THIN_REQ:
 		case P_RS_DATA_REQUEST:
+		case P_RS_DAGTAG_REQ:
 		case P_CSUM_RS_REQUEST:
-		case P_OV_REQUEST:
-			drbd_send_ack_rp(peer_device, P_NEG_RS_DREPLY , p);
-			break;
-		case P_OV_REPLY:
-			verb = 0;
-			dec_rs_pending(peer_device);
-			drbd_send_ack_ex(peer_device, P_OV_RESULT, sector, size, ID_IN_SYNC);
-			break;
+		case P_RS_CSUM_DAGTAG_REQ:
+		case P_RS_THIN_REQ:
+		case P_RS_THIN_DAGTAG_REQ:
+			drbd_send_ack_be(peer_device, P_RS_CANCEL, sector, size, p->block_id);
+			return ignore_remaining_packet(connection, pi->size);
 		default:
-			BUG();
+			break;
 		}
-		if (verb && drbd_ratelimit())
-			drbd_err(device, "Can not satisfy peer's read request, "
-			    "no local data.\n");
-
-		/* drain possibly payload */
-		return drbd_drain_block(peer_device, pi->size);
 	}
 
-	/* GFP_NOIO, because we must not cause arbitrary write-out: in a DRBD
-	 * "criss-cross" setup, that might cause write-out on some other DRBD,
-	 * which in turn might block on the other node at this very place.  */
-	peer_req = drbd_alloc_peer_req(peer_device, p->block_id, sector, size,
-			size, GFP_NOIO);
-	if (!peer_req) {
-		put_ldev(device);
-		return -ENOMEM;
+	min_d_state = pi->cmd == P_DATA_REQUEST ? D_UP_TO_DATE : D_OUTDATED;
+	if (!get_ldev_if_state(device, min_d_state)) {
+		switch (pi->cmd) {
+		case P_DATA_REQUEST:
+			drbd_send_ack_be(peer_device, P_NEG_DREPLY, sector, size, p->block_id);
+			break;
+		case P_OV_REQUEST:
+		case P_OV_DAGTAG_REQ:
+			drbd_verify_skipped_block(peer_device, sector, size);
+			verify_progress(peer_device, sector, size);
+			drbd_send_ack_be(peer_device, P_RS_CANCEL, sector, size, p->block_id);
+			break;
+		case P_RS_DATA_REQUEST:
+		case P_RS_DAGTAG_REQ:
+		case P_CSUM_RS_REQUEST:
+		case P_RS_CSUM_DAGTAG_REQ:
+		case P_RS_THIN_REQ:
+		case P_RS_THIN_DAGTAG_REQ:
+			if (peer_device->repl_state[NOW] == L_PAUSED_SYNC_S)
+				drbd_send_ack_be(peer_device, P_RS_CANCEL, sector, size, p->block_id);
+			else
+				drbd_send_ack_be(peer_device, P_NEG_RS_DREPLY, sector, size, p->block_id);
+			break;
+		default:
+			BUG();
+		}
+
+		if (peer_device->repl_state[NOW] != L_PAUSED_SYNC_S)
+			drbd_err_ratelimit(device,
+				"Can not satisfy peer's read request, no local data.\n");
+
+		/* drain possible payload */
+		return ignore_remaining_packet(connection, pi->size);
+	}
+
+	if (pi->cmd != P_DATA_REQUEST
+	&& !IS_ALIGNED(size, bm_block_size(device->bitmap))
+	&& (sector + (size >> 9) != device->bitmap->bm_dev_capacity)) {
+		drbd_warn_ratelimit(peer_device,
+			"Unaligned %s request (%u vs %u) at %llu; may lead to hung or repeating resync.\n",
+			drbd_packet_name(pi->cmd), size, bm_block_size(device->bitmap), sector);
+		/* For now, try to continue anyways */
+	}
+
+	inc_unacked(peer_device);
+
+	peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY, size, REQ_OP_READ);
+	err = -ENOMEM;
+	if (!peer_req)
+		goto fail;
+	peer_req->i.size = size;
+	peer_req->i.sector = sector;
+	peer_req->block_id = p->block_id;
+	peer_req->depend_dagtag_node_id = depend_dagtag_node_id;
+	peer_req->depend_dagtag = depend_dagtag;
+	/* no longer valid, about to call drbd_recv again for the digest... */
+	p = NULL;
+	pi->data = NULL;
+
+	if (peer_device->repl_state[NOW] == L_AHEAD) {
+		if (pi->cmd == P_DATA_REQUEST) {
+			/* P_DATA_REQUEST originates from a Primary,
+			 * so if I am "Ahead", the Primary would be "Behind":
+			 * Can not happen. */
+			drbd_err_ratelimit(peer_device, "received P_DATA_REQUEST while L_AHEAD\n");
+			err = -EINVAL;
+			goto fail2;
+		}
+		if (connection->agreed_pro_version >= 115) {
+			switch (pi->cmd) {
+			/* case P_DATA_REQUEST: see above, not based on protocol version */
+			case P_OV_REQUEST:
+			case P_OV_DAGTAG_REQ:
+				drbd_verify_skipped_block(peer_device, sector, size);
+				verify_progress(peer_device, sector, size);
+				fallthrough;
+			case P_RS_DATA_REQUEST:
+			case P_RS_DAGTAG_REQ:
+			case P_CSUM_RS_REQUEST:
+			case P_RS_CSUM_DAGTAG_REQ:
+			case P_RS_THIN_REQ:
+			case P_RS_THIN_DAGTAG_REQ:
+				err = drbd_send_ack(peer_device, P_RS_CANCEL_AHEAD, peer_req);
+				goto fail2;
+			default:
+				BUG();
+			}
+		}
 	}
-	peer_req->opf = REQ_OP_READ;
 
 	switch (pi->cmd) {
 	case P_DATA_REQUEST:
 		peer_req->w.cb = w_e_end_data_req;
-		/* application IO, don't drbd_rs_begin_io */
-		peer_req->flags |= EE_APPLICATION;
+		peer_req->i.type = INTERVAL_PEER_READ;
 		goto submit;
 
 	case P_RS_THIN_REQ:
+	case P_RS_THIN_DAGTAG_REQ:
 		/* If at some point in the future we have a smart way to
 		   find out if this data block is completely deallocated,
 		   then we would do something smarter here than reading
@@ -2700,56 +3911,44 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 		peer_req->flags |= EE_RS_THIN_REQ;
 		fallthrough;
 	case P_RS_DATA_REQUEST:
+	case P_RS_DAGTAG_REQ:
+		peer_req->i.type = INTERVAL_RESYNC_READ;
 		peer_req->w.cb = w_e_end_rsdata_req;
-		/* used in the sector offset progress display */
-		device->bm_resync_fo = BM_SECT_TO_BIT(sector);
 		break;
 
-	case P_OV_REPLY:
 	case P_CSUM_RS_REQUEST:
-		di = kmalloc(sizeof(*di) + pi->size, GFP_NOIO);
-		if (!di)
-			goto out_free_e;
-
-		di->digest_size = pi->size;
-		di->digest = (((char *)di)+sizeof(struct digest_info));
-
-		peer_req->digest = di;
-		peer_req->flags |= EE_HAS_DIGEST;
-
-		if (drbd_recv_all(peer_device->connection, di->digest, pi->size))
-			goto out_free_e;
-
-		if (pi->cmd == P_CSUM_RS_REQUEST) {
-			D_ASSERT(device, peer_device->connection->agreed_pro_version >= 89);
-			peer_req->w.cb = w_e_end_csum_rs_req;
-			/* used in the sector offset progress display */
-			device->bm_resync_fo = BM_SECT_TO_BIT(sector);
-			/* remember to report stats in drbd_resync_finished */
-			device->use_csums = true;
-		} else if (pi->cmd == P_OV_REPLY) {
-			/* track progress, we may need to throttle */
-			atomic_add(size >> 9, &device->rs_sect_in);
-			peer_req->w.cb = w_e_end_ov_reply;
-			dec_rs_pending(peer_device);
-			/* drbd_rs_begin_io done when we sent this request,
-			 * but accounting still needs to be done. */
-			goto submit_for_resync;
-		}
+	case P_RS_CSUM_DAGTAG_REQ:
+		D_ASSERT(device, connection->agreed_pro_version >= 89);
+		peer_req->i.type = INTERVAL_RESYNC_READ;
+
+		err = receive_digest(peer_req, pi->size);
+		if (err)
+			goto fail2;
+
+		peer_req->w.cb = w_e_end_rsdata_req;
+		/* remember to report stats in drbd_resync_finished */
+		peer_device->use_csums = true;
 		break;
 
 	case P_OV_REQUEST:
-		if (device->ov_start_sector == ~(sector_t)0 &&
-		    peer_device->connection->agreed_pro_version >= 90) {
+	case P_OV_DAGTAG_REQ:
+		peer_req->i.type = INTERVAL_OV_READ_TARGET;
+		peer_device->ov_position = sector;
+		if (peer_device->ov_start_sector == ~(sector_t)0 &&
+		    connection->agreed_pro_version >= 90) {
 			unsigned long now = jiffies;
 			int i;
-			device->ov_start_sector = sector;
-			device->ov_position = sector;
-			device->ov_left = drbd_bm_bits(device) - BM_SECT_TO_BIT(sector);
-			device->rs_total = device->ov_left;
+			unsigned long ov_left = drbd_bm_bits(device)
+					- bm_sect_to_bit(device->bitmap, sector);
+			atomic64_set(&peer_device->ov_left, ov_left);
+			peer_device->ov_start_sector = sector;
+			peer_device->ov_skipped = 0;
+			peer_device->rs_total = ov_left;
+			peer_device->rs_last_writeout = now;
+			peer_device->rs_last_progress_report_ts = now;
 			for (i = 0; i < DRBD_SYNC_MARKS; i++) {
-				device->rs_mark_left[i] = device->ov_left;
-				device->rs_mark_time[i] = now;
+				peer_device->rs_mark_left[i] = ov_left;
+				peer_device->rs_mark_time[i] = now;
 			}
 			drbd_info(device, "Online Verify start sector: %llu\n",
 					(unsigned long long)sector);
@@ -2761,146 +3960,372 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 		BUG();
 	}
 
-	/* Throttle, drbd_rs_begin_io and submit should become asynchronous
-	 * wrt the receiver, but it is not as straightforward as it may seem.
-	 * Various places in the resync start and stop logic assume resync
-	 * requests are processed in order, requeuing this on the worker thread
-	 * introduces a bunch of new code for synchronization between threads.
-	 *
-	 * Unlimited throttling before drbd_rs_begin_io may stall the resync
-	 * "forever", throttling after drbd_rs_begin_io will lock that extent
-	 * for application writes for the same time.  For now, just throttle
-	 * here, where the rest of the code expects the receiver to sleep for
-	 * a while, anyways.
-	 */
+submit:
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_add_tail(&peer_req->recv_order, &connection->peer_reads);
+	peer_req->flags |= EE_ON_RECV_ORDER;
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	if (pi->cmd == P_DATA_REQUEST) {
+		atomic_inc(&connection->backing_ee_cnt);
+		drbd_conflict_submit_peer_read(peer_req);
+	} else {
+		drbd_peer_resync_read(peer_req);
+	}
+	/* ldev_ref_transfer: put_ldev in peer_req endio */
+	return 0;
+fail2:
+	drbd_free_peer_req(peer_req);
+fail:
+	dec_unacked(peer_device);
+	put_ldev(device);
+	return err;
+}
 
-	/* Throttle before drbd_rs_begin_io, as that locks out application IO;
-	 * this defers syncer requests for some time, before letting at least
-	 * on request through.  The resync controller on the receiving side
-	 * will adapt to the incoming rate accordingly.
-	 *
-	 * We cannot throttle here if remote is Primary/SyncTarget:
-	 * we would also throttle its application reads.
-	 * In that case, throttling is done on the SyncTarget only.
+static int receive_data_request(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_block_req *p_block_req = pi->data;
+
+	return receive_common_data_request(connection, pi,
+			&p_block_req->req_common,
+			0, 0);
+}
+
+/* receive_dagtag_data_request() - handle a request for data with dagtag
+ * dependency initiated by the peer
+ *
+ * Request handling flow:
+ *
+ * receive_dagtag_data_request
+ *        |
+ *        V
+ * receive_common_data_request
+ *        |
+ *        v              dagtag waiting
+ * drbd_peer_resync_read --------------+
+ *        |                            |
+ *        |                           ... dagtag_wait_ee
+ *        |                            |
+ *        |                            v
+ *        +--------------- release_dagtag_wait
+ *        |
+ *        v                       conflict (resync only)
+ * drbd_conflict_submit_peer_read -----+
+ *        |          ^                 |
+ *        |          |                ...
+ *        |          |                 |
+ *        |          |                 v
+ *        |          +---- drbd_do_submit_conflict
+ *        v
+ * drbd_submit_peer_request
+ *        |
+ *       ... backing device
+ *        |
+ *        v
+ * drbd_peer_request_endio
+ *        |
+ *        v                  online verify request
+ * drbd_endio_read_sec_final ------------------+
+ *        |                                    |
+ *       ... sender_work                      ... sender_work
+ *        |                                    |
+ *        v                                    v
+ * w_e_end_rsdata_req                    w_e_end_ov_req
+ *        |                                    |
+ *       ... via peer                         ... via peer
+ *        |                                    |
+ *        v                                    v
+ * got_RSWriteAck                         got_OVResult
+ */
+static int receive_dagtag_data_request(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_rs_req *p_rs_req = pi->data;
+
+	return receive_common_data_request(connection, pi,
+			&p_rs_req->req_common,
+			be32_to_cpu(p_rs_req->dagtag_node_id), be64_to_cpu(p_rs_req->dagtag));
+}
+
+static int receive_common_ov_reply(struct drbd_connection *connection, struct packet_info *pi,
+		struct p_block_req_common *p,
+		unsigned int depend_dagtag_node_id, u64 depend_dagtag)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	sector_t sector = be64_to_cpu(p->sector);
+	struct drbd_peer_request *peer_req;
+	int size = be32_to_cpu(p->blksize);
+	int err;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+	device = peer_device->device;
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_OV_READ_SOURCE),
+			sector, size, p->block_id);
+	if (!peer_req)
+		return -EIO;
+
+	dec_rs_pending(peer_device);
+
+	if (!get_ldev_if_state(device, D_OUTDATED)) {
+		drbd_peer_resync_read_cancel(peer_req);
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
+
+		/* drain payload */
+		return ignore_remaining_packet(connection, pi->size);
+	}
+
+	err = receive_digest(peer_req, pi->size);
+	if (err)
+		goto fail;
+
+	set_bit(INTERVAL_RECEIVED, &peer_req->i.flags);
+
+	err = peer_req_alloc_bio(peer_req, size, GFP_NOIO, REQ_OP_READ);
+	if (err)
+		goto fail;
+
+	inc_unacked(peer_device);
+
+	peer_req->depend_dagtag_node_id = depend_dagtag_node_id;
+	peer_req->depend_dagtag = depend_dagtag;
+	peer_req->w.cb = w_e_end_ov_reply;
+
+	/* track progress, we may need to throttle */
+	rs_sectors_came_in(peer_device, size);
+
+	drbd_peer_resync_read(peer_req);
+	/* ldev_ref_transfer: put_ldev in peer_req endio */
+	return 0;
+fail:
+	drbd_remove_peer_req_interval(peer_req);
+	drbd_free_peer_req(peer_req);
+	put_ldev(device);
+	return err;
+}
+
+static int receive_ov_reply(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_block_req *p_block_req = pi->data;
+
+	return receive_common_ov_reply(connection, pi,
+			&p_block_req->req_common,
+			0, 0);
+}
+
+static int receive_dagtag_ov_reply(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_rs_req *p_rs_req = pi->data;
+
+	return receive_common_ov_reply(connection, pi,
+			&p_rs_req->req_common,
+			be32_to_cpu(p_rs_req->dagtag_node_id), be64_to_cpu(p_rs_req->dagtag));
+}
+
+static int receive_flush_requests(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_connection *other_connection;
+	struct p_flush_requests *p_flush_requests = pi->data;
+	u64 flush_requests_dagtag;
+
+	spin_lock_irq(&resource->tl_update_lock);
+	/*
+	 * If the current dagtag was read from the metadata then there is no
+	 * associated request. Hence there is nothing to flush. Flush up to the
+	 * preceding dagtag instead.
 	 */
+	if (resource->dagtag_sector == resource->dagtag_from_backing_dev)
+		flush_requests_dagtag = resource->dagtag_before_attach;
+	else
+		flush_requests_dagtag = resource->dagtag_sector;
+	spin_unlock_irq(&resource->tl_update_lock);
 
-	/* Even though this may be a resync request, we do add to "read_ee";
-	 * "sync_ee" is only used for resync WRITEs.
-	 * Add to list early, so debugfs can find this request
-	 * even if we have to sleep below. */
-	spin_lock_irq(&device->resource->req_lock);
-	list_add_tail(&peer_req->w.list, &device->read_ee);
-	spin_unlock_irq(&device->resource->req_lock);
-
-	update_receiver_timing_details(connection, drbd_rs_should_slow_down);
-	if (device->state.peer != R_PRIMARY
-	&& drbd_rs_should_slow_down(peer_device, sector, false))
-		schedule_timeout_uninterruptible(HZ/10);
-	update_receiver_timing_details(connection, drbd_rs_begin_io);
-	if (drbd_rs_begin_io(device, sector))
-		goto out_free_e;
+	spin_lock_irq(&connection->primary_flush_lock);
+	connection->flush_requests_dagtag = flush_requests_dagtag;
+	connection->flush_sequence = be64_to_cpu(p_flush_requests->flush_sequence);
+	connection->flush_forward_sent_mask = 0;
+	spin_unlock_irq(&connection->primary_flush_lock);
 
-submit_for_resync:
-	atomic_add(size >> 9, &device->rs_sect_ev);
+	/* Queue any request waiting for peer ack to be sent */
+	drbd_flush_peer_acks(resource);
 
-submit:
-	update_receiver_timing_details(connection, drbd_submit_peer_request);
-	inc_unacked(device);
-	if (drbd_submit_peer_request(peer_req) == 0)
+	/* For each peer, check if peer ack for this dagtag has already been sent */
+	rcu_read_lock();
+	for_each_connection_rcu(other_connection, resource) {
+		if (other_connection->cstate[NOW] == C_CONNECTED)
+			queue_work(other_connection->ack_sender, &other_connection->peer_ack_work);
+	}
+	rcu_read_unlock();
+
+	return 0;
+}
+
+static int receive_flush_requests_ack(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_connection *primary_connection;
+	struct p_flush_ack *p_flush_ack = pi->data;
+	u64 flush_sequence = be64_to_cpu(p_flush_ack->flush_sequence);
+	int primary_node_id = be32_to_cpu(p_flush_ack->primary_node_id);
+
+	spin_lock_irq(&resource->initiator_flush_lock);
+	if (flush_sequence < resource->current_flush_sequence) {
+		spin_unlock_irq(&resource->initiator_flush_lock);
 		return 0;
+	}
 
-	/* don't care for the reason here */
-	drbd_err(device, "submit failed, triggering re-connect\n");
+	rcu_read_lock();
+	primary_connection = drbd_connection_by_node_id(resource, primary_node_id);
+	if (primary_connection)
+		primary_connection->pending_flush_mask &= ~NODE_MASK(connection->peer_node_id);
+	rcu_read_unlock();
+	spin_unlock_irq(&resource->initiator_flush_lock);
+	return 0;
+}
 
-out_free_e:
-	spin_lock_irq(&device->resource->req_lock);
-	list_del(&peer_req->w.list);
-	spin_unlock_irq(&device->resource->req_lock);
-	/* no drbd_rs_complete_io(), we are dropping the connection anyways */
+/*
+ * config_unknown_volume  -  device configuration command for unknown volume
+ *
+ * When a device is added to an existing connection, the node on which the
+ * device is added first will send configuration commands to its peer but the
+ * peer will not know about the device yet.  It will warn and ignore these
+ * commands.  Once the device is added on the second node, the second node will
+ * send the same device configuration commands, but in the other direction.
+ *
+ * (We can also end up here if drbd is misconfigured.)
+ */
+static int config_unknown_volume(struct drbd_connection *connection, struct packet_info *pi)
+{
+	drbd_warn(connection, "%s packet received for volume %d, which is not configured locally\n",
+		  drbd_packet_name(pi->cmd), pi->vnr);
+	return ignore_remaining_packet(connection, pi->size);
+}
 
-	put_ldev(device);
-	drbd_free_peer_req(device, peer_req);
-	return -EIO;
+static int receive_enable_replication_next(struct drbd_connection *connection,
+		struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct p_enable_replication *p_enable_replication = pi->data;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return config_unknown_volume(connection, pi);
+
+	if (p_enable_replication->enable)
+		set_bit(REPLICATION_NEXT, &peer_device->flags);
+	else
+		clear_bit(REPLICATION_NEXT, &peer_device->flags);
+
+	return 0;
+}
+
+static int receive_enable_replication(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device;
+	struct p_enable_replication *p_enable_replication = pi->data;
+	unsigned long irq_flags;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+
+	begin_state_change(resource, &irq_flags, CS_VERBOSE);
+	peer_device->replication[NEW] = p_enable_replication->enable;
+	end_state_change(resource, &irq_flags, "enable-replication");
+	return 0;
 }
 
 /*
  * drbd_asb_recover_0p  -  Recover after split-brain with no remaining primaries
  */
-static int drbd_asb_recover_0p(struct drbd_peer_device *peer_device) __must_hold(local)
+static enum sync_strategy drbd_asb_recover_0p(struct drbd_peer_device *peer_device)
 {
-	struct drbd_device *device = peer_device->device;
-	int self, peer, rv = -100;
+	const int node_id = peer_device->device->resource->res_opts.node_id;
+	int self, peer;
+	enum sync_strategy rv = SPLIT_BRAIN_DISCONNECT;
 	unsigned long ch_self, ch_peer;
 	enum drbd_after_sb_p after_sb_0p;
 
-	self = device->ldev->md.uuid[UI_BITMAP] & 1;
-	peer = device->p_uuid[UI_BITMAP] & 1;
+	self = drbd_bitmap_uuid(peer_device) & UUID_PRIMARY;
+	peer = peer_device->bitmap_uuids[node_id] & UUID_PRIMARY;
 
-	ch_peer = device->p_uuid[UI_SIZE];
-	ch_self = device->comm_bm_set;
+	ch_peer = peer_device->dirty_bits;
+	ch_self = peer_device->comm_bm_set;
 
 	rcu_read_lock();
-	after_sb_0p = rcu_dereference(peer_device->connection->net_conf)->after_sb_0p;
+	after_sb_0p = rcu_dereference(peer_device->connection->transport.net_conf)->after_sb_0p;
 	rcu_read_unlock();
 	switch (after_sb_0p) {
 	case ASB_CONSENSUS:
 	case ASB_DISCARD_SECONDARY:
 	case ASB_CALL_HELPER:
 	case ASB_VIOLENTLY:
-		drbd_err(device, "Configuration error.\n");
+	case ASB_RETRY_CONNECT:
+	case ASB_AUTO_DISCARD:
+		drbd_err(peer_device, "Configuration error.\n");
 		break;
 	case ASB_DISCONNECT:
 		break;
 	case ASB_DISCARD_YOUNGER_PRI:
 		if (self == 0 && peer == 1) {
-			rv = -1;
+			rv = SYNC_TARGET_USE_BITMAP;
 			break;
 		}
 		if (self == 1 && peer == 0) {
-			rv =  1;
+			rv = SYNC_SOURCE_USE_BITMAP;
 			break;
 		}
 		fallthrough;	/* to one of the other strategies */
 	case ASB_DISCARD_OLDER_PRI:
 		if (self == 0 && peer == 1) {
-			rv = 1;
+			rv = SYNC_SOURCE_USE_BITMAP;
 			break;
 		}
 		if (self == 1 && peer == 0) {
-			rv = -1;
+			rv = SYNC_TARGET_USE_BITMAP;
 			break;
 		}
-		/* Else fall through to one of the other strategies... */
-		drbd_warn(device, "Discard younger/older primary did not find a decision\n"
-		     "Using discard-least-changes instead\n");
+		drbd_warn(peer_device, "Discard younger/older primary did not find a decision\n"
+			  "Using discard-least-changes instead\n");
 		fallthrough;
 	case ASB_DISCARD_ZERO_CHG:
 		if (ch_peer == 0 && ch_self == 0) {
-			rv = test_bit(RESOLVE_CONFLICTS, &peer_device->connection->flags)
-				? -1 : 1;
+			rv = test_bit(RESOLVE_CONFLICTS, &peer_device->connection->transport.flags)
+				? SYNC_TARGET_USE_BITMAP : SYNC_SOURCE_USE_BITMAP;
 			break;
 		} else {
-			if (ch_peer == 0) { rv =  1; break; }
-			if (ch_self == 0) { rv = -1; break; }
+			if (ch_peer == 0) {
+				rv = SYNC_SOURCE_USE_BITMAP;
+				break;
+			}
+			if (ch_self == 0) {
+				rv = SYNC_TARGET_USE_BITMAP;
+				break;
+			}
 		}
 		if (after_sb_0p == ASB_DISCARD_ZERO_CHG)
 			break;
 		fallthrough;
 	case ASB_DISCARD_LEAST_CHG:
 		if	(ch_self < ch_peer)
-			rv = -1;
+			rv = SYNC_TARGET_USE_BITMAP;
 		else if (ch_self > ch_peer)
-			rv =  1;
+			rv = SYNC_SOURCE_USE_BITMAP;
 		else /* ( ch_self == ch_peer ) */
 		     /* Well, then use something else. */
-			rv = test_bit(RESOLVE_CONFLICTS, &peer_device->connection->flags)
-				? -1 : 1;
+			rv = test_bit(RESOLVE_CONFLICTS, &peer_device->connection->transport.flags)
+				? SYNC_TARGET_USE_BITMAP : SYNC_SOURCE_USE_BITMAP;
 		break;
 	case ASB_DISCARD_LOCAL:
-		rv = -1;
+		rv = SYNC_TARGET_USE_BITMAP;
 		break;
 	case ASB_DISCARD_REMOTE:
-		rv =  1;
+		rv = SYNC_SOURCE_USE_BITMAP;
 	}
 
 	return rv;
@@ -2909,14 +4334,16 @@ static int drbd_asb_recover_0p(struct drbd_peer_device *peer_device) __must_hold
 /*
  * drbd_asb_recover_1p  -  Recover after split-brain with one remaining primary
  */
-static int drbd_asb_recover_1p(struct drbd_peer_device *peer_device) __must_hold(local)
+static enum sync_strategy drbd_asb_recover_1p(struct drbd_peer_device *peer_device)
 {
 	struct drbd_device *device = peer_device->device;
-	int hg, rv = -100;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_resource *resource = device->resource;
+	enum sync_strategy strategy, rv = SPLIT_BRAIN_DISCONNECT;
 	enum drbd_after_sb_p after_sb_1p;
 
 	rcu_read_lock();
-	after_sb_1p = rcu_dereference(peer_device->connection->net_conf)->after_sb_1p;
+	after_sb_1p = rcu_dereference(connection->transport.net_conf)->after_sb_1p;
 	rcu_read_unlock();
 	switch (after_sb_1p) {
 	case ASB_DISCARD_YOUNGER_PRI:
@@ -2925,39 +4352,42 @@ static int drbd_asb_recover_1p(struct drbd_peer_device *peer_device) __must_hold
 	case ASB_DISCARD_LOCAL:
 	case ASB_DISCARD_REMOTE:
 	case ASB_DISCARD_ZERO_CHG:
+	case ASB_RETRY_CONNECT:
+	case ASB_AUTO_DISCARD:
 		drbd_err(device, "Configuration error.\n");
 		break;
 	case ASB_DISCONNECT:
 		break;
 	case ASB_CONSENSUS:
-		hg = drbd_asb_recover_0p(peer_device);
-		if (hg == -1 && device->state.role == R_SECONDARY)
-			rv = hg;
-		if (hg == 1  && device->state.role == R_PRIMARY)
-			rv = hg;
+		strategy = drbd_asb_recover_0p(peer_device);
+		if (strategy == SYNC_TARGET_USE_BITMAP && resource->role[NOW] == R_SECONDARY)
+			rv = strategy;
+		if (strategy == SYNC_SOURCE_USE_BITMAP && resource->role[NOW] == R_PRIMARY)
+			rv = strategy;
 		break;
 	case ASB_VIOLENTLY:
 		rv = drbd_asb_recover_0p(peer_device);
 		break;
 	case ASB_DISCARD_SECONDARY:
-		return device->state.role == R_PRIMARY ? 1 : -1;
+		return resource->role[NOW] == R_PRIMARY ? SYNC_SOURCE_USE_BITMAP : SYNC_TARGET_USE_BITMAP;
 	case ASB_CALL_HELPER:
-		hg = drbd_asb_recover_0p(peer_device);
-		if (hg == -1 && device->state.role == R_PRIMARY) {
+		strategy = drbd_asb_recover_0p(peer_device);
+		if (strategy == SYNC_TARGET_USE_BITMAP && resource->role[NOW] == R_PRIMARY) {
 			enum drbd_state_rv rv2;
 
 			 /* drbd_change_state() does not sleep while in SS_IN_TRANSIENT_STATE,
-			  * we might be here in C_WF_REPORT_PARAMS which is transient.
+			  * we might be here in L_OFF which is transient.
 			  * we do not need to wait for the after state change work either. */
-			rv2 = drbd_change_state(device, CS_VERBOSE, NS(role, R_SECONDARY));
+			rv2 = change_role(resource, R_SECONDARY, CS_VERBOSE,
+					"after-sb-1pri", NULL);
 			if (rv2 != SS_SUCCESS) {
-				drbd_khelper(device, "pri-lost-after-sb");
+				drbd_maybe_khelper(device, connection, "pri-lost-after-sb");
 			} else {
 				drbd_warn(device, "Successfully gave up primary role.\n");
-				rv = hg;
+				rv = strategy;
 			}
 		} else
-			rv = hg;
+			rv = strategy;
 	}
 
 	return rv;
@@ -2966,14 +4396,15 @@ static int drbd_asb_recover_1p(struct drbd_peer_device *peer_device) __must_hold
 /*
  * drbd_asb_recover_2p  -  Recover after split-brain with two remaining primaries
  */
-static int drbd_asb_recover_2p(struct drbd_peer_device *peer_device) __must_hold(local)
+static enum sync_strategy drbd_asb_recover_2p(struct drbd_peer_device *peer_device)
 {
 	struct drbd_device *device = peer_device->device;
-	int hg, rv = -100;
+	struct drbd_connection *connection = peer_device->connection;
+	enum sync_strategy strategy, rv = SPLIT_BRAIN_DISCONNECT;
 	enum drbd_after_sb_p after_sb_2p;
 
 	rcu_read_lock();
-	after_sb_2p = rcu_dereference(peer_device->connection->net_conf)->after_sb_2p;
+	after_sb_2p = rcu_dereference(connection->transport.net_conf)->after_sb_2p;
 	rcu_read_unlock();
 	switch (after_sb_2p) {
 	case ASB_DISCARD_YOUNGER_PRI:
@@ -2984,6 +4415,8 @@ static int drbd_asb_recover_2p(struct drbd_peer_device *peer_device) __must_hold
 	case ASB_CONSENSUS:
 	case ASB_DISCARD_SECONDARY:
 	case ASB_DISCARD_ZERO_CHG:
+	case ASB_RETRY_CONNECT:
+	case ASB_AUTO_DISCARD:
 		drbd_err(device, "Configuration error.\n");
 		break;
 	case ASB_VIOLENTLY:
@@ -2992,440 +4425,1021 @@ static int drbd_asb_recover_2p(struct drbd_peer_device *peer_device) __must_hold
 	case ASB_DISCONNECT:
 		break;
 	case ASB_CALL_HELPER:
-		hg = drbd_asb_recover_0p(peer_device);
-		if (hg == -1) {
+		strategy = drbd_asb_recover_0p(peer_device);
+		if (strategy == SYNC_TARGET_USE_BITMAP) {
 			enum drbd_state_rv rv2;
 
 			 /* drbd_change_state() does not sleep while in SS_IN_TRANSIENT_STATE,
-			  * we might be here in C_WF_REPORT_PARAMS which is transient.
+			  * we might be here in L_OFF which is transient.
 			  * we do not need to wait for the after state change work either. */
-			rv2 = drbd_change_state(device, CS_VERBOSE, NS(role, R_SECONDARY));
+			rv2 = change_role(device->resource, R_SECONDARY, CS_VERBOSE,
+					"after-sb-2pri", NULL);
 			if (rv2 != SS_SUCCESS) {
-				drbd_khelper(device, "pri-lost-after-sb");
+				drbd_maybe_khelper(device, connection, "pri-lost-after-sb");
 			} else {
 				drbd_warn(device, "Successfully gave up primary role.\n");
-				rv = hg;
+				rv = strategy;
 			}
 		} else
-			rv = hg;
+			rv = strategy;
 	}
 
 	return rv;
 }
 
-static void drbd_uuid_dump(struct drbd_device *device, char *text, u64 *uuid,
-			   u64 bits, u64 flags)
+static void drbd_uuid_dump_self(struct drbd_peer_device *peer_device, u64 bits, u64 flags)
 {
-	if (!uuid) {
-		drbd_info(device, "%s uuid info vanished while I was looking!\n", text);
-		return;
-	}
-	drbd_info(device, "%s %016llX:%016llX:%016llX:%016llX bits:%llu flags:%llX\n",
-	     text,
-	     (unsigned long long)uuid[UI_CURRENT],
-	     (unsigned long long)uuid[UI_BITMAP],
-	     (unsigned long long)uuid[UI_HISTORY_START],
-	     (unsigned long long)uuid[UI_HISTORY_END],
-	     (unsigned long long)bits,
-	     (unsigned long long)flags);
+	struct drbd_device *device = peer_device->device;
+
+	drbd_info(peer_device, "self %016llX:%016llX:%016llX:%016llX bits:%llu flags:%llX\n",
+		  (unsigned long long)drbd_resolved_uuid(peer_device, NULL),
+		  (unsigned long long)drbd_bitmap_uuid(peer_device),
+		  (unsigned long long)drbd_history_uuid(device, 0),
+		  (unsigned long long)drbd_history_uuid(device, 1),
+		  (unsigned long long)bits,
+		  (unsigned long long)flags);
 }
 
-/*
-  100	after split brain try auto recover
-    2	C_SYNC_SOURCE set BitMap
-    1	C_SYNC_SOURCE use BitMap
-    0	no Sync
-   -1	C_SYNC_TARGET use BitMap
-   -2	C_SYNC_TARGET set BitMap
- -100	after split brain, disconnect
--1000	unrelated data
--1091   requires proto 91
--1096   requires proto 96
- */
 
-static int drbd_uuid_compare(struct drbd_peer_device *const peer_device,
-		enum drbd_role const peer_role, int *rule_nr) __must_hold(local)
+static void drbd_uuid_dump_peer(struct drbd_peer_device *peer_device, u64 bits, u64 flags)
 {
-	struct drbd_connection *const connection = peer_device->connection;
-	struct drbd_device *device = peer_device->device;
-	u64 self, peer;
-	int i, j;
+	const int node_id = peer_device->device->resource->res_opts.node_id;
 
-	self = device->ldev->md.uuid[UI_CURRENT] & ~((u64)1);
-	peer = device->p_uuid[UI_CURRENT] & ~((u64)1);
+	drbd_info(peer_device, "peer %016llX:%016llX:%016llX:%016llX bits:%llu flags:%llX\n",
+	     (unsigned long long)peer_device->current_uuid,
+	     (unsigned long long)peer_device->bitmap_uuids[node_id],
+	     (unsigned long long)peer_device->history_uuids[0],
+	     (unsigned long long)peer_device->history_uuids[1],
+	     (unsigned long long)bits,
+	     (unsigned long long)flags);
+}
 
-	*rule_nr = 10;
-	if (self == UUID_JUST_CREATED && peer == UUID_JUST_CREATED)
-		return 0;
+/* find the peer's bitmap slot for the given UUID, if they have one */
+static int drbd_find_peer_bitmap_by_uuid(struct drbd_peer_device *peer_device, u64 uuid)
+{
+	u64 peer;
+	int i;
 
-	*rule_nr = 20;
-	if ((self == UUID_JUST_CREATED || self == (u64)0) &&
-	     peer != UUID_JUST_CREATED)
-		return -2;
+	for (i = 0; i < DRBD_PEERS_MAX; i++) {
+		peer = peer_device->bitmap_uuids[i] & ~UUID_PRIMARY;
+		if (uuid == peer)
+			return i;
+	}
 
-	*rule_nr = 30;
-	if (self != UUID_JUST_CREATED &&
-	    (peer == UUID_JUST_CREATED || peer == (u64)0))
-		return 2;
+	return -1;
+}
 
-	if (self == peer) {
-		int rct, dc; /* roles at crash time */
+/* find our bitmap slot for the given UUID, if we have one */
+static int drbd_find_bitmap_by_uuid(struct drbd_peer_device *peer_device, u64 uuid)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	u64 self;
+	int i;
 
-		if (device->p_uuid[UI_BITMAP] == (u64)0 && device->ldev->md.uuid[UI_BITMAP] != (u64)0) {
+	for (i = 0; i < DRBD_NODE_ID_MAX; i++) {
+		if (i == device->ldev->md.node_id)
+			continue;
+		if (connection->agreed_pro_version < 116 &&
+		    device->ldev->md.peers[i].bitmap_index == -1)
+			continue;
+		self = device->ldev->md.peers[i].bitmap_uuid & ~UUID_PRIMARY;
+		if (self == uuid)
+			return i;
+	}
 
-			if (connection->agreed_pro_version < 91)
-				return -1091;
+	return -1;
+}
 
-			if ((device->ldev->md.uuid[UI_BITMAP] & ~((u64)1)) == (device->p_uuid[UI_HISTORY_START] & ~((u64)1)) &&
-			    (device->ldev->md.uuid[UI_HISTORY_START] & ~((u64)1)) == (device->p_uuid[UI_HISTORY_START + 1] & ~((u64)1))) {
-				drbd_info(device, "was SyncSource, missed the resync finished event, corrected myself:\n");
-				drbd_uuid_move_history(device);
-				device->ldev->md.uuid[UI_HISTORY_START] = device->ldev->md.uuid[UI_BITMAP];
-				device->ldev->md.uuid[UI_BITMAP] = 0;
+static enum sync_strategy
+uuid_fixup_resync_end(struct drbd_peer_device *peer_device, enum sync_rule *rule)
+{
+	struct drbd_device *device = peer_device->device;
+	const int node_id = device->resource->res_opts.node_id;
 
-				drbd_uuid_dump(device, "self", device->ldev->md.uuid,
-					       device->state.disk >= D_NEGOTIATING ? drbd_bm_total_weight(device) : 0, 0);
-				*rule_nr = 34;
-			} else {
-				drbd_info(device, "was SyncSource (peer failed to write sync_uuid)\n");
-				*rule_nr = 36;
-			}
+	if (peer_device->bitmap_uuids[node_id] == (u64)0 && drbd_bitmap_uuid(peer_device) != (u64)0) {
 
-			return 1;
-		}
+		if (peer_device->connection->agreed_pro_version < 91)
+			return REQUIRES_PROTO_91;
 
-		if (device->ldev->md.uuid[UI_BITMAP] == (u64)0 && device->p_uuid[UI_BITMAP] != (u64)0) {
+		if ((drbd_bitmap_uuid(peer_device) & ~UUID_PRIMARY) ==
+		    (peer_device->history_uuids[0] & ~UUID_PRIMARY) &&
+		    (drbd_history_uuid(device, 0) & ~UUID_PRIMARY) ==
+		    (peer_device->history_uuids[0] & ~UUID_PRIMARY)) {
+			struct drbd_peer_md *peer_md = &device->ldev->md.peers[peer_device->node_id];
+			u64 previous_bitmap_uuid = peer_md->bitmap_uuid;
 
-			if (connection->agreed_pro_version < 91)
-				return -1091;
+			drbd_info(device, "was SyncSource, missed the resync finished event, corrected myself:\n");
+			peer_md->bitmap_uuid = 0;
+			_drbd_uuid_push_history(device, previous_bitmap_uuid);
 
-			if ((device->ldev->md.uuid[UI_HISTORY_START] & ~((u64)1)) == (device->p_uuid[UI_BITMAP] & ~((u64)1)) &&
-			    (device->ldev->md.uuid[UI_HISTORY_START + 1] & ~((u64)1)) == (device->p_uuid[UI_HISTORY_START] & ~((u64)1))) {
-				drbd_info(device, "was SyncTarget, peer missed the resync finished event, corrected peer:\n");
+			drbd_uuid_dump_self(peer_device,
+					    device->disk_state[NOW] >= D_NEGOTIATING ? drbd_bm_total_weight(peer_device) : 0, 0);
+			*rule = RULE_SYNC_SOURCE_MISSED_FINISH;
+		} else {
+			drbd_info(device, "was SyncSource (peer failed to write sync_uuid)\n");
+			*rule = RULE_SYNC_SOURCE_PEER_MISSED_FINISH;
+		}
 
-				device->p_uuid[UI_HISTORY_START + 1] = device->p_uuid[UI_HISTORY_START];
-				device->p_uuid[UI_HISTORY_START] = device->p_uuid[UI_BITMAP];
-				device->p_uuid[UI_BITMAP] = 0UL;
+		return SYNC_SOURCE_USE_BITMAP;
+	}
 
-				drbd_uuid_dump(device, "peer", device->p_uuid, device->p_uuid[UI_SIZE], device->p_uuid[UI_FLAGS]);
-				*rule_nr = 35;
-			} else {
-				drbd_info(device, "was SyncTarget (failed to write sync_uuid)\n");
-				*rule_nr = 37;
-			}
+	if (drbd_bitmap_uuid(peer_device) == (u64)0 && peer_device->bitmap_uuids[node_id] != (u64)0) {
 
-			return -1;
-		}
+		if (peer_device->connection->agreed_pro_version < 91)
+			return REQUIRES_PROTO_91;
 
-		/* Common power [off|failure] */
-		rct = (test_bit(CRASHED_PRIMARY, &device->flags) ? 1 : 0) +
-			(device->p_uuid[UI_FLAGS] & 2);
-		/* lowest bit is set when we were primary,
-		 * next bit (weight 2) is set when peer was primary */
-		*rule_nr = 40;
+		if ((drbd_history_uuid(device, 0) & ~UUID_PRIMARY) ==
+		    (peer_device->bitmap_uuids[node_id] & ~UUID_PRIMARY) &&
+		    (drbd_history_uuid(device, 1) & ~UUID_PRIMARY) ==
+		    (peer_device->history_uuids[0] & ~UUID_PRIMARY)) {
+			int i;
 
-		/* Neither has the "crashed primary" flag set,
-		 * only a replication link hickup. */
-		if (rct == 0)
-			return 0;
+			drbd_info(device, "was SyncTarget, peer missed the resync finished event, corrected peer:\n");
 
-		/* Current UUID equal and no bitmap uuid; does not necessarily
-		 * mean this was a "simultaneous hard crash", maybe IO was
-		 * frozen, so no UUID-bump happened.
-		 * This is a protocol change, overload DRBD_FF_WSAME as flag
-		 * for "new-enough" peer DRBD version. */
-		if (device->state.role == R_PRIMARY || peer_role == R_PRIMARY) {
-			*rule_nr = 41;
-			if (!(connection->agreed_features & DRBD_FF_WSAME)) {
-				drbd_warn(peer_device, "Equivalent unrotated UUIDs, but current primary present.\n");
-				return -(0x10000 | PRO_VERSION_MAX | (DRBD_FF_WSAME << 8));
-			}
-			if (device->state.role == R_PRIMARY && peer_role == R_PRIMARY) {
-				/* At least one has the "crashed primary" bit set,
-				 * both are primary now, but neither has rotated its UUIDs?
-				 * "Can not happen." */
-				drbd_err(peer_device, "Equivalent unrotated UUIDs, but both are primary. Can not resolve this.\n");
-				return -100;
-			}
-			if (device->state.role == R_PRIMARY)
-				return 1;
-			return -1;
-		}
+			for (i = ARRAY_SIZE(peer_device->history_uuids) - 1; i > 0; i--)
+				peer_device->history_uuids[i] = peer_device->history_uuids[i - 1];
+			peer_device->history_uuids[i] = peer_device->bitmap_uuids[node_id];
+			peer_device->bitmap_uuids[node_id] = 0;
 
-		/* Both are secondary.
-		 * Really looks like recovery from simultaneous hard crash.
-		 * Check which had been primary before, and arbitrate. */
-		switch (rct) {
-		case 0: /* !self_pri && !peer_pri */ return 0; /* already handled */
-		case 1: /*  self_pri && !peer_pri */ return 1;
-		case 2: /* !self_pri &&  peer_pri */ return -1;
-		case 3: /*  self_pri &&  peer_pri */
-			dc = test_bit(RESOLVE_CONFLICTS, &connection->flags);
-			return dc ? -1 : 1;
+			drbd_uuid_dump_peer(peer_device, peer_device->dirty_bits, peer_device->uuid_flags);
+			*rule = RULE_SYNC_TARGET_PEER_MISSED_FINISH;
+		} else {
+			drbd_info(device, "was SyncTarget (failed to write sync_uuid)\n");
+			*rule = RULE_SYNC_TARGET_MISSED_FINISH;
 		}
+
+		return SYNC_TARGET_USE_BITMAP;
 	}
 
-	*rule_nr = 50;
-	peer = device->p_uuid[UI_BITMAP] & ~((u64)1);
-	if (self == peer)
-		return -1;
+	return UNDETERMINED;
+}
+
+static enum sync_strategy
+uuid_fixup_resync_start1(struct drbd_peer_device *peer_device, enum sync_rule *rule)
+{
+	struct drbd_device *device = peer_device->device;
+	const int node_id = peer_device->device->resource->res_opts.node_id;
+	u64 self, peer;
+
+	self = drbd_current_uuid(device) & ~UUID_PRIMARY;
+	peer = peer_device->history_uuids[0] & ~UUID_PRIMARY;
 
-	*rule_nr = 51;
-	peer = device->p_uuid[UI_HISTORY_START] & ~((u64)1);
 	if (self == peer) {
-		if (connection->agreed_pro_version < 96 ?
-		    (device->ldev->md.uuid[UI_HISTORY_START] & ~((u64)1)) ==
-		    (device->p_uuid[UI_HISTORY_START + 1] & ~((u64)1)) :
-		    peer + UUID_NEW_BM_OFFSET == (device->p_uuid[UI_BITMAP] & ~((u64)1))) {
+		if (peer_device->connection->agreed_pro_version < 96 ?
+		    (drbd_history_uuid(device, 0) & ~UUID_PRIMARY) ==
+		    (peer_device->history_uuids[1] & ~UUID_PRIMARY) :
+		    peer + UUID_NEW_BM_OFFSET == (peer_device->bitmap_uuids[node_id] & ~UUID_PRIMARY)) {
+			int i;
+
 			/* The last P_SYNC_UUID did not get though. Undo the last start of
 			   resync as sync source modifications of the peer's UUIDs. */
+			*rule = RULE_SYNC_TARGET_MISSED_START;
 
-			if (connection->agreed_pro_version < 91)
-				return -1091;
+			if (peer_device->connection->agreed_pro_version < 91)
+				return REQUIRES_PROTO_91;
 
-			device->p_uuid[UI_BITMAP] = device->p_uuid[UI_HISTORY_START];
-			device->p_uuid[UI_HISTORY_START] = device->p_uuid[UI_HISTORY_START + 1];
+			peer_device->bitmap_uuids[node_id] = peer_device->history_uuids[0];
+			for (i = 0; i < ARRAY_SIZE(peer_device->history_uuids) - 1; i++)
+				peer_device->history_uuids[i] = peer_device->history_uuids[i + 1];
+			peer_device->history_uuids[i] = 0;
 
 			drbd_info(device, "Lost last syncUUID packet, corrected:\n");
-			drbd_uuid_dump(device, "peer", device->p_uuid, device->p_uuid[UI_SIZE], device->p_uuid[UI_FLAGS]);
+			drbd_uuid_dump_peer(peer_device, peer_device->dirty_bits, peer_device->uuid_flags);
 
-			return -1;
+			return SYNC_TARGET_USE_BITMAP;
 		}
 	}
 
-	*rule_nr = 60;
-	self = device->ldev->md.uuid[UI_CURRENT] & ~((u64)1);
-	for (i = UI_HISTORY_START; i <= UI_HISTORY_END; i++) {
-		peer = device->p_uuid[i] & ~((u64)1);
-		if (self == peer)
-			return -2;
-	}
+	return UNDETERMINED;
+}
 
-	*rule_nr = 70;
-	self = device->ldev->md.uuid[UI_BITMAP] & ~((u64)1);
-	peer = device->p_uuid[UI_CURRENT] & ~((u64)1);
-	if (self == peer)
-		return 1;
+static enum sync_strategy
+uuid_fixup_resync_start2(struct drbd_peer_device *peer_device, enum sync_rule *rule)
+{
+	struct drbd_device *device = peer_device->device;
+	u64 self, peer;
+
+	self = drbd_history_uuid(device, 0) & ~UUID_PRIMARY;
+	peer = peer_device->current_uuid & ~UUID_PRIMARY;
 
-	*rule_nr = 71;
-	self = device->ldev->md.uuid[UI_HISTORY_START] & ~((u64)1);
 	if (self == peer) {
-		if (connection->agreed_pro_version < 96 ?
-		    (device->ldev->md.uuid[UI_HISTORY_START + 1] & ~((u64)1)) ==
-		    (device->p_uuid[UI_HISTORY_START] & ~((u64)1)) :
-		    self + UUID_NEW_BM_OFFSET == (device->ldev->md.uuid[UI_BITMAP] & ~((u64)1))) {
+		if (peer_device->connection->agreed_pro_version < 96 ?
+		    (drbd_history_uuid(device, 1) & ~UUID_PRIMARY) ==
+		    (peer_device->history_uuids[0] & ~UUID_PRIMARY) :
+		    self + UUID_NEW_BM_OFFSET == (drbd_bitmap_uuid(peer_device) & ~UUID_PRIMARY)) {
+			u64 bitmap_uuid;
+
 			/* The last P_SYNC_UUID did not get though. Undo the last start of
 			   resync as sync source modifications of our UUIDs. */
+			*rule = RULE_SYNC_SOURCE_MISSED_START;
 
-			if (connection->agreed_pro_version < 91)
-				return -1091;
+			if (peer_device->connection->agreed_pro_version < 91)
+				return REQUIRES_PROTO_91;
 
-			__drbd_uuid_set(device, UI_BITMAP, device->ldev->md.uuid[UI_HISTORY_START]);
-			__drbd_uuid_set(device, UI_HISTORY_START, device->ldev->md.uuid[UI_HISTORY_START + 1]);
+			bitmap_uuid = _drbd_uuid_pull_history(peer_device);
+			_drbd_uuid_set_bitmap(peer_device, bitmap_uuid);
 
 			drbd_info(device, "Last syncUUID did not get through, corrected:\n");
-			drbd_uuid_dump(device, "self", device->ldev->md.uuid,
-				       device->state.disk >= D_NEGOTIATING ? drbd_bm_total_weight(device) : 0, 0);
+			drbd_uuid_dump_self(peer_device,
+					    device->disk_state[NOW] >= D_NEGOTIATING ? drbd_bm_total_weight(peer_device) : 0, 0);
 
-			return 1;
+			return SYNC_SOURCE_USE_BITMAP;
 		}
 	}
 
+	return UNDETERMINED;
+}
 
-	*rule_nr = 80;
-	peer = device->p_uuid[UI_CURRENT] & ~((u64)1);
-	for (i = UI_HISTORY_START; i <= UI_HISTORY_END; i++) {
-		self = device->ldev->md.uuid[i] & ~((u64)1);
-		if (self == peer)
-			return 2;
-	}
-
-	*rule_nr = 90;
-	self = device->ldev->md.uuid[UI_BITMAP] & ~((u64)1);
-	peer = device->p_uuid[UI_BITMAP] & ~((u64)1);
-	if (self == peer && self != ((u64)0))
-		return 100;
+static enum sync_strategy drbd_uuid_compare(struct drbd_peer_device *peer_device,
+			     enum sync_rule *rule, int *peer_node_id)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	const int node_id = device->resource->res_opts.node_id;
+	bool my_current_in_peers_history, peers_current_in_my_history;
+	bool bitmap_matches, flags_matches, uuid_matches;
+	u64 resolved_uuid, bitmap_uuid;
+	u64 local_uuid_flags = 0;
+	u64 self, peer;
+	int i, j;
 
-	*rule_nr = 100;
-	for (i = UI_HISTORY_START; i <= UI_HISTORY_END; i++) {
-		self = device->ldev->md.uuid[i] & ~((u64)1);
-		for (j = UI_HISTORY_START; j <= UI_HISTORY_END; j++) {
-			peer = device->p_uuid[j] & ~((u64)1);
-			if (self == peer)
-				return -100;
+	resolved_uuid = drbd_resolved_uuid(peer_device, &local_uuid_flags) & ~UUID_PRIMARY;
+	bitmap_uuid = drbd_bitmap_uuid(peer_device);
+	local_uuid_flags |= drbd_collect_local_uuid_flags(peer_device, NULL);
+
+	uuid_matches = resolved_uuid == (peer_device->comm_current_uuid & ~UUID_PRIMARY);
+	bitmap_matches = bitmap_uuid == peer_device->comm_bitmap_uuid;
+	/* UUID_FLAG_INCONSISTENT is not relevant for the handshake, allow it to change */
+	flags_matches = !((local_uuid_flags ^ peer_device->comm_uuid_flags) & ~UUID_FLAG_INCONSISTENT);
+	if (!test_bit(INITIAL_STATE_SENT, &peer_device->flags)) {
+		drbd_warn(peer_device, "Initial UUIDs and state not sent yet. Not verifying\n");
+	} else if (!uuid_matches || !flags_matches || !bitmap_matches) {
+		if (!uuid_matches)
+			drbd_warn(peer_device, "My current UUID changed during handshake.\n");
+		if (!bitmap_matches)
+			drbd_warn(peer_device, "My bitmap UUID changed during "
+				  "handshake. 0x%llX to 0x%llX\n",
+				  (unsigned long long)peer_device->comm_bitmap_uuid,
+				  (unsigned long long)bitmap_uuid);
+		if (!flags_matches)
+			drbd_warn(peer_device,
+				  "My uuid_flags changed from 0x%llX to 0x%llX during handshake.\n",
+				  (unsigned long long)peer_device->comm_uuid_flags,
+				  (unsigned long long)local_uuid_flags);
+		if (connection->cstate[NOW] == C_CONNECTING) {
+			*rule = RULE_INITIAL_HANDSHAKE_CHANGED;
+			return RETRY_CONNECT;
 		}
 	}
 
-	return -1000;
-}
-
-/* drbd_sync_handshake() returns the new conn state on success, or
-   CONN_MASK (-1) on failure.
- */
-static enum drbd_conns drbd_sync_handshake(struct drbd_peer_device *peer_device,
-					   enum drbd_role peer_role,
-					   enum drbd_disk_state peer_disk) __must_hold(local)
-{
-	struct drbd_device *device = peer_device->device;
-	enum drbd_conns rv = C_MASK;
-	enum drbd_disk_state mydisk;
-	struct net_conf *nc;
-	int hg, rule_nr, rr_conflict, tentative, always_asbp;
+	self = resolved_uuid;
+	peer = peer_device->current_uuid & ~UUID_PRIMARY;
 
-	mydisk = device->state.disk;
-	if (mydisk == D_NEGOTIATING)
-		mydisk = device->new_state_tmp.disk;
+	/* Before DRBD 8.0.2 (from 2007), the uuid on sync targets was set to
+	 * zero during resyncs for no good reason. */
+	if (self == 0)
+		self = UUID_JUST_CREATED;
+	if (peer == 0)
+		peer = UUID_JUST_CREATED;
 
-	drbd_info(device, "drbd_sync_handshake:\n");
+	*rule = RULE_JUST_CREATED_BOTH;
+	if (self == UUID_JUST_CREATED && peer == UUID_JUST_CREATED)
+		return NO_SYNC;
 
-	spin_lock_irq(&device->ldev->md.uuid_lock);
-	drbd_uuid_dump(device, "self", device->ldev->md.uuid, device->comm_bm_set, 0);
-	drbd_uuid_dump(device, "peer", device->p_uuid,
-		       device->p_uuid[UI_SIZE], device->p_uuid[UI_FLAGS]);
+	*rule = RULE_JUST_CREATED_SELF;
+	if (self == UUID_JUST_CREATED)
+		return SYNC_TARGET_SET_BITMAP;
 
-	hg = drbd_uuid_compare(peer_device, peer_role, &rule_nr);
-	spin_unlock_irq(&device->ldev->md.uuid_lock);
+	*rule = RULE_JUST_CREATED_PEER;
+	if (peer == UUID_JUST_CREATED)
+		return SYNC_SOURCE_SET_BITMAP;
 
-	drbd_info(device, "uuid_compare()=%d by rule %d\n", hg, rule_nr);
+	if (self == peer) {
+		struct net_conf *nc;
+		int wire_protocol;
 
-	if (hg == -1000) {
-		drbd_alert(device, "Unrelated data, aborting!\n");
-		return C_MASK;
+		rcu_read_lock();
+		nc = rcu_dereference(connection->transport.net_conf);
+		wire_protocol = nc->wire_protocol;
+		rcu_read_unlock();
+
+		if (connection->agreed_pro_version < 110) {
+			enum sync_strategy rv = uuid_fixup_resync_end(peer_device, rule);
+			if (rv != UNDETERMINED)
+				return rv;
+		}
+
+		if (test_bit(RS_SOURCE_MISSED_END, &peer_device->flags)) {
+			*rule = RULE_SYNC_SOURCE_MISSED_FINISH;
+			return SYNC_SOURCE_USE_BITMAP;
+		}
+		if (test_bit(RS_PEER_MISSED_END, &peer_device->flags)) {
+			*rule = RULE_SYNC_TARGET_PEER_MISSED_FINISH;
+			return SYNC_TARGET_USE_BITMAP;
+		}
+
+		if (connection->agreed_pro_version >= 120) {
+			*rule = RULE_RECONNECTED;
+			if (peer_device->uuid_flags & UUID_FLAG_RECONNECT &&
+			    local_uuid_flags & UUID_FLAG_RECONNECT)
+				return NO_SYNC;
+		}
+
+		if (connection->agreed_pro_version >= 121 &&
+		    (wire_protocol == DRBD_PROT_A || wire_protocol == DRBD_PROT_B)) {
+			*rule = RULE_CRASHED_PRIMARY;
+			if (local_uuid_flags & UUID_FLAG_CRASHED_PRIMARY &&
+			    !(peer_device->uuid_flags & UUID_FLAG_CRASHED_PRIMARY))
+				return SYNC_SOURCE_USE_BITMAP;
+
+			if (peer_device->uuid_flags & UUID_FLAG_CRASHED_PRIMARY &&
+			    !(local_uuid_flags & UUID_FLAG_CRASHED_PRIMARY))
+				return SYNC_TARGET_USE_BITMAP;
+		}
+
+		*rule = RULE_LOST_QUORUM;
+		if (peer_device->uuid_flags & UUID_FLAG_PRIMARY_LOST_QUORUM &&
+		    !test_bit(PRIMARY_LOST_QUORUM, &device->flags))
+			return SYNC_TARGET_IF_BOTH_FAILED;
+
+		if (!(peer_device->uuid_flags & UUID_FLAG_PRIMARY_LOST_QUORUM) &&
+		    test_bit(PRIMARY_LOST_QUORUM, &device->flags))
+			return SYNC_SOURCE_IF_BOTH_FAILED;
+
+		if (peer_device->uuid_flags & UUID_FLAG_PRIMARY_LOST_QUORUM &&
+		    test_bit(PRIMARY_LOST_QUORUM, &device->flags))
+			return test_bit(RESOLVE_CONFLICTS, &connection->transport.flags) ?
+				SYNC_SOURCE_IF_BOTH_FAILED :
+				SYNC_TARGET_IF_BOTH_FAILED;
+
+		if (connection->agreed_pro_version < 120) {
+			*rule = RULE_RECONNECTED;
+			if (peer_device->uuid_flags & UUID_FLAG_RECONNECT &&
+			    local_uuid_flags & UUID_FLAG_RECONNECT)
+				return NO_SYNC;
+		}
+
+		/* Peer crashed as primary, I survived, resync from me */
+		if (peer_device->uuid_flags & UUID_FLAG_CRASHED_PRIMARY &&
+		    local_uuid_flags & UUID_FLAG_RECONNECT)
+			return SYNC_SOURCE_IF_BOTH_FAILED;
+
+		/* I am a crashed primary, peer survived, resync to me */
+		if (local_uuid_flags & UUID_FLAG_CRASHED_PRIMARY &&
+		    peer_device->uuid_flags & UUID_FLAG_RECONNECT)
+			return SYNC_TARGET_IF_BOTH_FAILED;
+
+		/* One of us had a connection to the other node before.
+		   i.e. this is not a common power failure. */
+		if (peer_device->uuid_flags & UUID_FLAG_RECONNECT ||
+		    local_uuid_flags & UUID_FLAG_RECONNECT)
+			return NO_SYNC;
+
+		/* Common power [off|failure]? */
+		*rule = RULE_BOTH_OFF;
+		if (local_uuid_flags & UUID_FLAG_CRASHED_PRIMARY) {
+			if ((peer_device->uuid_flags & UUID_FLAG_CRASHED_PRIMARY) &&
+			    test_bit(RESOLVE_CONFLICTS, &connection->transport.flags))
+				return SYNC_TARGET_IF_BOTH_FAILED;
+			return SYNC_SOURCE_IF_BOTH_FAILED;
+		} else if (peer_device->uuid_flags & UUID_FLAG_CRASHED_PRIMARY)
+				return SYNC_TARGET_IF_BOTH_FAILED;
+		else
+			return NO_SYNC;
+	}
+
+	*rule = RULE_BITMAP_PEER;
+	peer = peer_device->bitmap_uuids[node_id] & ~UUID_PRIMARY;
+	if (self == peer)
+		return SYNC_TARGET_USE_BITMAP;
+
+	*rule = RULE_BITMAP_PEER_OTHER;
+	i = drbd_find_peer_bitmap_by_uuid(peer_device, self);
+	if (i != -1) {
+		*peer_node_id = i;
+		return SYNC_TARGET_CLEAR_BITMAP;
+	}
+
+	if (connection->agreed_pro_version < 110) {
+		enum sync_strategy rv = uuid_fixup_resync_start1(peer_device, rule);
+		if (rv != UNDETERMINED)
+			return rv;
+	}
+
+	*rule = RULE_BITMAP_SELF;
+	self = bitmap_uuid & ~UUID_PRIMARY;
+	peer = peer_device->current_uuid & ~UUID_PRIMARY;
+	if (self == peer)
+		return SYNC_SOURCE_USE_BITMAP;
+
+	*rule = RULE_BITMAP_SELF_OTHER;
+	i = drbd_find_bitmap_by_uuid(peer_device, peer);
+	if (i != -1) {
+		*peer_node_id = i;
+		return SYNC_SOURCE_COPY_BITMAP;
+	}
+
+	self = resolved_uuid;
+	my_current_in_peers_history = uuid_in_peer_history(peer_device, self);
+
+	if (connection->agreed_pro_version < 110) {
+		enum sync_strategy rv = uuid_fixup_resync_start2(peer_device, rule);
+		if (rv != UNDETERMINED)
+			return rv;
+	}
+
+	peer = peer_device->current_uuid & ~UUID_PRIMARY;
+	peers_current_in_my_history = uuid_in_my_history(device, peer);
+
+	if (my_current_in_peers_history && !peers_current_in_my_history) {
+		*rule = RULE_HISTORY_PEER;
+		return SYNC_TARGET_SET_BITMAP;
+	}
+	if (!my_current_in_peers_history && peers_current_in_my_history) {
+		*rule = RULE_HISTORY_SELF;
+		return SYNC_SOURCE_SET_BITMAP;
+	}
+
+	*rule = RULE_BITMAP_BOTH;
+	self = bitmap_uuid & ~UUID_PRIMARY;
+	peer = peer_device->bitmap_uuids[node_id] & ~UUID_PRIMARY;
+	if (self == peer && self != ((u64)0))
+		return SPLIT_BRAIN_AUTO_RECOVER;
+
+	*rule = RULE_HISTORY_BOTH;
+	for (i = 0; i < HISTORY_UUIDS; i++) {
+		self = drbd_history_uuid(device, i) & ~UUID_PRIMARY;
+		/* Don't conclude to have "data divergence" from a "common ancestor"
+		 * if that common ancestor is just a not used yet slot in the history,
+		 * which is still initialized to zero on both peers. */
+		if (self == 0)
+			break;
+		for (j = 0; j < ARRAY_SIZE(peer_device->history_uuids); j++) {
+			peer = peer_device->history_uuids[j] & ~UUID_PRIMARY;
+			if (peer == 0)
+				break;
+			if (self == peer)
+				return SPLIT_BRAIN_DISCONNECT;
+		}
+	}
+
+	return UNRELATED_DATA;
+}
+
+static void log_handshake(struct drbd_peer_device *peer_device)
+{
+	u64 uuid_flags = drbd_collect_local_uuid_flags(peer_device, NULL);
+
+	drbd_info(peer_device, "drbd_sync_handshake:\n");
+	drbd_uuid_dump_self(peer_device, peer_device->comm_bm_set, uuid_flags);
+	drbd_uuid_dump_peer(peer_device, peer_device->dirty_bits, peer_device->uuid_flags);
+}
+
+static enum sync_strategy drbd_handshake(struct drbd_peer_device *peer_device,
+			  enum sync_rule *rule,
+			  int *peer_node_id,
+			  bool always_verbose)
+{
+	struct drbd_device *device = peer_device->device;
+	enum sync_strategy strategy;
+
+	spin_lock_irq(&device->ldev->md.uuid_lock);
+	if (always_verbose)
+		log_handshake(peer_device);
+
+	strategy = drbd_uuid_compare(peer_device, rule, peer_node_id);
+	if (strategy != NO_SYNC && !always_verbose)
+		log_handshake(peer_device);
+	spin_unlock_irq(&device->ldev->md.uuid_lock);
+
+	if (strategy != NO_SYNC || always_verbose)
+		drbd_info(peer_device, "uuid_compare()=%s by rule=%s\n",
+				strategy_descriptor(strategy).name,
+				drbd_sync_rule_str(*rule));
+
+	return strategy;
+}
+
+static bool is_resync_running(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device;
+	bool rv = false;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+		if (repl_state == L_SYNC_TARGET || repl_state == L_PAUSED_SYNC_T) {
+			rv = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return rv;
+}
+
+static int bitmap_mod_after_handshake(struct drbd_peer_device *peer_device, enum sync_strategy strategy, int peer_node_id)
+{
+	struct drbd_device *device = peer_device->device;
+
+	if (strategy == SYNC_SOURCE_COPY_BITMAP) {
+		int from = device->ldev->md.peers[peer_node_id].bitmap_index;
+
+		if (from == -1)
+			from = drbd_unallocated_index(device->ldev);
+
+		if (peer_device->bitmap_index == -1)
+			return 0;
+
+		if (from == -1)
+			drbd_info(peer_device,
+				  "Setting all bitmap bits, day0 bm not available node_id=%d\n",
+				  peer_node_id);
+		else
+			drbd_info(peer_device,
+				  "Copying bitmap of peer node_id=%d (bitmap_index=%d)\n",
+				  peer_node_id, from);
+
+		drbd_suspend_io(device, WRITE_ONLY);
+		drbd_bm_slot_lock(peer_device, "copy_slot/set_many sync_handshake", BM_LOCK_BULK);
+		if (from == -1)
+			drbd_bm_set_many_bits(peer_device, 0, -1UL);
+		else
+			drbd_bm_copy_slot(device, from, peer_device->bitmap_index);
+		drbd_bm_write(device, NULL);
+		drbd_bm_slot_unlock(peer_device);
+		drbd_resume_io(device);
+	} else if (strategy == SYNC_TARGET_CLEAR_BITMAP) {
+		drbd_info(peer_device, "Resync source provides bitmap (node_id=%d)\n", peer_node_id);
+		drbd_suspend_io(device, WRITE_ONLY);
+		drbd_bm_slot_lock(peer_device, "bm_clear_many_bits sync_handshake", BM_LOCK_BULK);
+		drbd_bm_clear_many_bits(peer_device, 0, -1UL);
+		drbd_bm_write(device, NULL);
+		drbd_bm_slot_unlock(peer_device);
+		drbd_resume_io(device);
+	} else if (strategy == SYNC_SOURCE_SET_BITMAP || strategy == SYNC_TARGET_SET_BITMAP) {
+		int (*io_func)(struct drbd_device *, struct drbd_peer_device *);
+		int err;
+
+		if (strategy == SYNC_TARGET_SET_BITMAP &&
+		    drbd_current_uuid(device) == UUID_JUST_CREATED &&
+		    is_resync_running(device))
+			return 0;
+
+		if (drbd_current_uuid(device) == UUID_JUST_CREATED) {
+			drbd_info(peer_device, "Setting and writing the whole bitmap, fresh node\n");
+			io_func = &drbd_bmio_set_allocated_n_write;
+		} else {
+			drbd_info(peer_device, "Setting and writing one bitmap slot, after drbd_sync_handshake\n");
+			io_func = &drbd_bmio_set_n_write;
+		}
+		err = drbd_bitmap_io(device, io_func, "set_n_write sync_handshake",
+				     BM_LOCK_CLEAR | BM_LOCK_BULK, peer_device);
+		if (err)
+			return err;
+
+		if (drbd_current_uuid(device) != UUID_JUST_CREATED &&
+		    peer_device->current_uuid != UUID_JUST_CREATED &&
+		    strategy == SYNC_SOURCE_SET_BITMAP) {
+			/*
+			 * We have just written the bitmap slot. Update the
+			 * bitmap UUID so that the resync does not start from
+			 * the beginning again if we disconnect and reconnect.
+			 *
+			 * Initial resync continuation is handled in
+			 * drbd_start_resync() at comment:
+			 * prepare to continue an interrupted initial resync later
+			 */
+			drbd_uuid_set_bitmap(peer_device, peer_device->current_uuid);
+			drbd_print_uuids(peer_device, "updated bitmap UUID");
+			drbd_md_sync(device);
+		}
+	}
+	return 0;
+}
+
+static enum drbd_repl_state strategy_to_repl_state(struct drbd_peer_device *peer_device,
+						   enum drbd_role peer_role,
+						   enum sync_strategy strategy)
+{
+	enum drbd_role role = peer_device->device->resource->role[NOW];
+	enum drbd_repl_state rv;
+
+	if (strategy == SYNC_SOURCE_IF_BOTH_FAILED || strategy == SYNC_TARGET_IF_BOTH_FAILED) {
+		if (role == R_PRIMARY || peer_role == R_PRIMARY) {
+			/* We have at least one primary, follow that with the resync decision */
+			rv = peer_role == R_SECONDARY ? L_WF_BITMAP_S :
+				role == R_SECONDARY ? L_WF_BITMAP_T :
+				L_ESTABLISHED;
+			return rv;
+		}
+		/* No current primary. Handle it as a common power failure, consider the
+		   roles at crash time */
+	}
+
+	if (strategy_descriptor(strategy).is_sync_source) {
+		rv = L_WF_BITMAP_S;
+	} else if (strategy_descriptor(strategy).is_sync_target) {
+		rv = L_WF_BITMAP_T;
+	} else {
+		rv = L_ESTABLISHED;
+	}
+
+	return rv;
+}
+
+static enum sync_strategy drbd_disk_states_source_strategy(
+		struct drbd_peer_device *peer_device,
+		int *peer_node_id)
+{
+	const int node_id = peer_device->device->resource->res_opts.node_id;
+	u64 bitmap_uuid;
+	int i = -1;
+
+	if (!(peer_device->uuid_flags & UUID_FLAG_SYNC_TARGET))
+		return SYNC_SOURCE_USE_BITMAP;
+
+	/* A resync with identical current-UUIDs -> USE_BITMAP */
+	bitmap_uuid = peer_device->bitmap_uuids[node_id];
+	if (bitmap_uuid == peer_device->current_uuid &&
+	    bitmap_uuid == drbd_current_uuid(peer_device->device))
+		return SYNC_SOURCE_USE_BITMAP;
+
+	/* When the peer is already a sync target, we actually see its
+	 * current UUID in the bitmap UUID slot towards us. We may need
+	 * to pick a different bitmap as a result. */
+	if (bitmap_uuid)
+		i = drbd_find_bitmap_by_uuid(peer_device, bitmap_uuid);
+
+	if (i == -1)
+		return SYNC_SOURCE_SET_BITMAP;
+
+	if (i == peer_device->node_id)
+		return SYNC_SOURCE_USE_BITMAP;
+
+	*peer_node_id = i;
+	return SYNC_SOURCE_COPY_BITMAP;
+}
+
+static enum sync_strategy drbd_disk_states_target_strategy(
+		struct drbd_peer_device *peer_device,
+		int *peer_node_id)
+{
+	const int node_id = peer_device->device->resource->res_opts.node_id;
+	u64 bitmap_uuid;
+	int i;
+
+	if (!(peer_device->comm_uuid_flags & UUID_FLAG_SYNC_TARGET))
+		return SYNC_TARGET_USE_BITMAP;
+
+	bitmap_uuid = drbd_bitmap_uuid(peer_device);
+	if (bitmap_uuid == peer_device->current_uuid &&
+	    bitmap_uuid == drbd_current_uuid(peer_device->device))
+		return SYNC_TARGET_USE_BITMAP;
+
+	/* When we are already a sync target, we need to choose our
+	 * strategy to mirror the peer's choice (see
+	 * drbd_disk_states_source_strategy). */
+	i = drbd_find_peer_bitmap_by_uuid(peer_device, bitmap_uuid);
+
+	if (i == -1)
+		return SYNC_TARGET_SET_BITMAP;
+
+	if (i == node_id)
+		return SYNC_TARGET_USE_BITMAP;
+
+	*peer_node_id = i;
+	return SYNC_TARGET_CLEAR_BITMAP;
+}
+
+static void disk_states_to_strategy(struct drbd_peer_device *peer_device,
+				    enum drbd_disk_state peer_disk_state,
+				    enum sync_strategy *strategy, enum sync_rule rule,
+				    int *peer_node_id)
+{
+	enum drbd_disk_state disk_state = peer_device->comm_state.disk;
+	struct drbd_device *device = peer_device->device;
+	bool decide_based_on_dstates = false;
+	bool prefer_local, either_inconsistent;
+
+	if (disk_state == D_NEGOTIATING)
+		disk_state = disk_state_from_md(device);
+
+	either_inconsistent =
+		(disk_state == D_INCONSISTENT && peer_disk_state > D_INCONSISTENT) ||
+		(peer_disk_state == D_INCONSISTENT && disk_state > D_INCONSISTENT);
+
+	if (peer_device->connection->agreed_pro_version >= 119) {
+		bool dstates_want_resync =
+			disk_state != peer_disk_state && disk_state >= D_INCONSISTENT &&
+			peer_disk_state >= D_INCONSISTENT && peer_disk_state != D_UNKNOWN;
+		bool resync_direction_arbitrary =
+			*strategy == SYNC_TARGET_IF_BOTH_FAILED ||
+			*strategy == SYNC_SOURCE_IF_BOTH_FAILED;
+
+		decide_based_on_dstates =
+			dstates_want_resync &&
+			(((rule == RULE_RECONNECTED || rule == RULE_LOST_QUORUM || rule == RULE_BOTH_OFF) &&
+			  resync_direction_arbitrary) ||
+			 (*strategy == NO_SYNC && either_inconsistent));
+
+		prefer_local = disk_state > peer_disk_state;
+		/* RULE_BOTH_OFF means that the current UUIDs are equal. The decision
+		   was found by looking at the crashed_primary bits.
+		   The current disk states might give a better basis for decision-making! */
+
+		/* RULE_LOST_QUORUM means that the current UUIDs are equal. The resync direction
+		   was found by looking if a node lost quorum while being primary */
+	} else {
+		decide_based_on_dstates =
+			(rule == RULE_BOTH_OFF || *strategy == NO_SYNC) && either_inconsistent;
+
+		prefer_local = disk_state > D_INCONSISTENT;
+	}
+
+	if (decide_based_on_dstates) {
+		*strategy = prefer_local ?
+			drbd_disk_states_source_strategy(peer_device, peer_node_id) :
+			drbd_disk_states_target_strategy(peer_device, peer_node_id);
+		drbd_info(peer_device, "strategy = %s due to disk states. (%s/%s)\n",
+			  strategy_descriptor(*strategy).name,
+			  drbd_disk_str(disk_state), drbd_disk_str(peer_disk_state));
+	}
+}
+
+static enum sync_strategy drbd_attach_handshake(struct drbd_peer_device *peer_device,
+						  enum drbd_disk_state peer_disk_state)
+{
+	enum sync_strategy strategy;
+	enum sync_rule rule;
+	int peer_node_id, err;
+
+	strategy = drbd_handshake(peer_device, &rule, &peer_node_id, true);
+
+	if (!is_strategy_determined(strategy))
+		return strategy;
+
+	disk_states_to_strategy(peer_device, peer_disk_state, &strategy, rule, &peer_node_id);
+	err = bitmap_mod_after_handshake(peer_device, strategy, peer_node_id);
+	if (err)
+		return RETRY_CONNECT;
+
+	return strategy;
+}
+
+static enum sync_strategy discard_my_data_to_strategy(struct drbd_peer_device *peer_device)
+{
+	enum sync_strategy strategy = UNDETERMINED;
+
+	if (test_bit(DISCARD_MY_DATA, &peer_device->flags) &&
+	    !(peer_device->uuid_flags & UUID_FLAG_DISCARD_MY_DATA))
+		strategy = SYNC_TARGET_USE_BITMAP;
+
+	if (!test_bit(DISCARD_MY_DATA, &peer_device->flags) &&
+	    (peer_device->uuid_flags & UUID_FLAG_DISCARD_MY_DATA))
+		strategy = SYNC_SOURCE_USE_BITMAP;
+
+	return strategy;
+}
+
+/* drbd_sync_handshake() returns the new replication state on success, and -1
+ * on failure.
+ */
+static enum sync_strategy drbd_sync_handshake(struct drbd_peer_device *peer_device,
+					      union drbd_state peer_state)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct net_conf *nc;
+	enum sync_strategy strategy;
+	enum sync_rule rule;
+	int rr_conflict, always_asbp, peer_node_id = 0, err;
+	enum drbd_role peer_role = peer_state.role;
+	enum drbd_disk_state peer_disk_state = peer_state.disk;
+	int required_protocol;
+	enum sync_strategy strategy_from_user = discard_my_data_to_strategy(peer_device);
+	bool need_full_sync_after_split_brain;
+
+	strategy = drbd_handshake(peer_device, &rule, &peer_node_id, true);
+
+	if (strategy == RETRY_CONNECT)
+		return strategy;
+
+	if (strategy == UNRELATED_DATA) {
+		drbd_alert(peer_device, "Unrelated data, aborting!\n");
+		return strategy;
 	}
-	if (hg < -0x10000) {
-		int proto, fflags;
-		hg = -hg;
-		proto = hg & 0xff;
-		fflags = (hg >> 8) & 0xff;
-		drbd_alert(device, "To resolve this both sides have to support at least protocol %d and feature flags 0x%x\n",
-					proto, fflags);
-		return C_MASK;
+	required_protocol = strategy_descriptor(strategy).required_protocol;
+	if (required_protocol) {
+		drbd_alert(peer_device, "To resolve this both sides have to support at least protocol %d\n", required_protocol);
+		return strategy;
 	}
-	if (hg < -1000) {
-		drbd_alert(device, "To resolve this both sides have to support at least protocol %d\n", -hg - 1000);
-		return C_MASK;
+
+	/* Protocol < 124 peers don't handle 0-bit missed-end-of-resync correctly.
+	 * Retry the connection to let UUID cleanup resolve it, or keep retrying
+	 * if the peer needs to be upgraded.
+	 */
+	if (connection->agreed_pro_version < 124 &&
+	    peer_device->comm_bm_set == 0 && peer_device->dirty_bits == 0) {
+		if (strategy == SYNC_SOURCE_USE_BITMAP &&
+		    rule == RULE_SYNC_SOURCE_MISSED_FINISH) {
+			drbd_info(peer_device, "Missed end of resync as sync-source with 0 bits;"
+				  " retrying to let UUID cleanup resolve it\n");
+			return RETRY_CONNECT;
+		}
+		if (strategy == SYNC_TARGET_USE_BITMAP &&
+		    rule == RULE_SYNC_TARGET_PEER_MISSED_FINISH &&
+		    device->resource->role[NOW] == R_PRIMARY) {
+			drbd_info(peer_device, "Missed end of resync as sync-target with 0 bits on Primary;"
+				  " peer needs protocol 124+ to resolve, retrying\n");
+			return REQUIRES_PROTO_124;
+		}
 	}
 
-	if    ((mydisk == D_INCONSISTENT && peer_disk > D_INCONSISTENT) ||
-	    (peer_disk == D_INCONSISTENT && mydisk    > D_INCONSISTENT)) {
-		int f = (hg == -100) || abs(hg) == 2;
-		hg = mydisk > D_INCONSISTENT ? 1 : -1;
-		if (f)
-			hg = hg*2;
-		drbd_info(device, "Becoming sync %s due to disk states.\n",
-		     hg > 0 ? "source" : "target");
+	disk_states_to_strategy(peer_device, peer_disk_state, &strategy, rule, &peer_node_id);
+
+	if (strategy == SPLIT_BRAIN_AUTO_RECOVER && (!drbd_device_stable(device, NULL) || !(peer_device->uuid_flags & UUID_FLAG_STABLE))) {
+		drbd_warn(peer_device, "Ignore Split-Brain, for now, at least one side unstable\n");
+		strategy = NO_SYNC;
 	}
 
-	if (abs(hg) == 100)
-		drbd_khelper(device, "initial-split-brain");
+	if (strategy_descriptor(strategy).is_split_brain)
+		drbd_maybe_khelper(device, connection, "initial-split-brain");
 
 	rcu_read_lock();
-	nc = rcu_dereference(peer_device->connection->net_conf);
+	nc = rcu_dereference(connection->transport.net_conf);
 	always_asbp = nc->always_asbp;
 	rr_conflict = nc->rr_conflict;
-	tentative = nc->tentative;
 	rcu_read_unlock();
 
-	if (hg == 100 || (hg == -100 && always_asbp)) {
-		int pcount = (device->state.role == R_PRIMARY)
+	/* Evaluate the original strategy,
+	 * before it is re-mapped by additional configuration below.
+	 */
+	need_full_sync_after_split_brain = (strategy == SPLIT_BRAIN_DISCONNECT);
+
+	if (strategy == SPLIT_BRAIN_AUTO_RECOVER || (strategy == SPLIT_BRAIN_DISCONNECT && always_asbp)) {
+		int pcount = (device->resource->role[NOW] == R_PRIMARY)
 			   + (peer_role == R_PRIMARY);
-		int forced = (hg == -100);
 
-		switch (pcount) {
-		case 0:
-			hg = drbd_asb_recover_0p(peer_device);
-			break;
-		case 1:
-			hg = drbd_asb_recover_1p(peer_device);
-			break;
-		case 2:
-			hg = drbd_asb_recover_2p(peer_device);
-			break;
+		if (device->resource->res_opts.quorum != QOU_OFF &&
+		    connection->agreed_pro_version >= 113) {
+			if (device->have_quorum[NOW] && !peer_state.quorum)
+				strategy = SYNC_SOURCE_USE_BITMAP;
+			else if (!device->have_quorum[NOW] && peer_state.quorum)
+				strategy = SYNC_TARGET_USE_BITMAP;
+		}
+		if (strategy_descriptor(strategy).is_split_brain) {
+			switch (pcount) {
+			case 0:
+				strategy = drbd_asb_recover_0p(peer_device);
+				break;
+			case 1:
+				strategy = drbd_asb_recover_1p(peer_device);
+				break;
+			case 2:
+				strategy = drbd_asb_recover_2p(peer_device);
+				break;
+			}
 		}
-		if (abs(hg) < 100) {
-			drbd_warn(device, "Split-Brain detected, %d primaries, "
+		if (!strategy_descriptor(strategy).is_split_brain) {
+			drbd_warn(peer_device, "Split-Brain detected, %d primaries, "
 			     "automatically solved. Sync from %s node\n",
-			     pcount, (hg < 0) ? "peer" : "this");
-			if (forced) {
-				drbd_warn(device, "Doing a full sync, since"
+			     pcount, strategy_descriptor(strategy).is_sync_target ? "peer" : "this");
+			if (need_full_sync_after_split_brain) {
+				if (!strategy_descriptor(strategy).full_sync_equivalent) {
+					drbd_alert(peer_device, "Want full sync but cannot decide direction, dropping connection!\n");
+					return SPLIT_BRAIN_DISCONNECT;
+				}
+				drbd_warn(peer_device, "Doing a full sync, since"
 				     " UUIDs where ambiguous.\n");
-				hg = hg*2;
+				strategy = strategy_descriptor(strategy).full_sync_equivalent;
 			}
 		}
 	}
 
-	if (hg == -100) {
-		if (test_bit(DISCARD_MY_DATA, &device->flags) && !(device->p_uuid[UI_FLAGS]&1))
-			hg = -1;
-		if (!test_bit(DISCARD_MY_DATA, &device->flags) && (device->p_uuid[UI_FLAGS]&1))
-			hg = 1;
+	if (strategy == SPLIT_BRAIN_DISCONNECT && strategy_from_user != UNDETERMINED) {
+		/* strategy_from_user via "--discard-my-data" is either
+		 * SYNC_TARGET_USE_BITMAP or SYNC_SOURCE_USE_BITMAP.
+		 * But here we do no longer have a relevant bitmap anymore.
+		 * Map to their "full sync equivalent".
+		 */
+		if (need_full_sync_after_split_brain)
+			strategy = strategy_descriptor(strategy_from_user).full_sync_equivalent;
+		else
+			strategy = strategy_from_user;
+		drbd_warn(peer_device, "Split-Brain detected, manually solved. %s from %s node\n",
+			  need_full_sync_after_split_brain ? "Full sync" : "Sync",
+			  strategy_descriptor(strategy).is_sync_target ? "peer" : "this");
+	}
 
-		if (abs(hg) < 100)
-			drbd_warn(device, "Split-Brain detected, manually solved. "
-			     "Sync from %s node\n",
-			     (hg < 0) ? "peer" : "this");
+	if (strategy_descriptor(strategy).is_split_brain) {
+		drbd_alert(peer_device, "Split-Brain detected but unresolved, dropping connection!\n");
+		drbd_maybe_khelper(device, connection, "split-brain");
+		return strategy;
 	}
 
-	if (hg == -100) {
-		/* FIXME this log message is not correct if we end up here
-		 * after an attempted attach on a diskless node.
-		 * We just refuse to attach -- well, we drop the "connection"
-		 * to that disk, in a way... */
-		drbd_alert(device, "Split-Brain detected but unresolved, dropping connection!\n");
-		drbd_khelper(device, "split-brain");
-		return C_MASK;
+	if (!is_strategy_determined(strategy)) {
+		drbd_alert(peer_device, "Failed to fully determine sync strategy, dropping connection!\n");
+		return strategy;
 	}
 
-	if (hg > 0 && mydisk <= D_INCONSISTENT) {
-		drbd_err(device, "I shall become SyncSource, but I am inconsistent!\n");
-		return C_MASK;
+	if (connection->agreed_pro_version >= 121 && strategy != NO_SYNC &&
+	    strategy_from_user != UNDETERMINED &&
+	    strategy_descriptor(strategy).is_sync_source != strategy_descriptor(strategy_from_user).is_sync_source) {
+		if (strategy_descriptor(strategy).reverse != UNDETERMINED) {
+			enum sync_strategy reversed = strategy_descriptor(strategy).reverse;
+			enum drbd_disk_state resync_source_disk_state =
+				strategy_descriptor(reversed).is_sync_source ? device->disk_state[NOW] : peer_disk_state;
+			if (resync_source_disk_state > D_INCONSISTENT) {
+				strategy = reversed;
+				drbd_warn(peer_device, "Resync direction reversed by --discard-my-data. Reverting to older data!\n");
+			} else {
+				drbd_warn(peer_device, "Ignoring --discard-my-data\n");
+			}
+		} else {
+			drbd_warn(peer_device, "Can not reverse resync direction (requested via --discard-my-data)\n");
+		}
 	}
 
-	if (hg < 0 && /* by intention we do not use mydisk here. */
-	    device->state.role == R_PRIMARY && device->state.disk >= D_CONSISTENT) {
+	if (strategy_descriptor(strategy).is_sync_target &&
+	    strategy != SYNC_TARGET_IF_BOTH_FAILED &&
+	    device->resource->role[NOW] == R_PRIMARY && device->disk_state[NOW] >= D_CONSISTENT &&
+	    (peer_device->comm_bm_set > 0 || peer_device->dirty_bits > 0)) {
 		switch (rr_conflict) {
 		case ASB_CALL_HELPER:
-			drbd_khelper(device, "pri-lost");
+			drbd_maybe_khelper(device, connection, "pri-lost");
 			fallthrough;
 		case ASB_DISCONNECT:
-			drbd_err(device, "I shall become SyncTarget, but I am primary!\n");
-			return C_MASK;
+		case ASB_RETRY_CONNECT:
+			drbd_err(peer_device, "I shall become SyncTarget, but I am primary!\n");
+			strategy = rr_conflict == ASB_RETRY_CONNECT ?
+				SYNC_TARGET_PRIMARY_RECONNECT : SYNC_TARGET_PRIMARY_DISCONNECT;
+			break;
 		case ASB_VIOLENTLY:
-			drbd_warn(device, "Becoming SyncTarget, violating the stable-data"
+			drbd_warn(peer_device, "Becoming SyncTarget, violating the stable-data"
 			     "assumption\n");
+			break;
+		case ASB_AUTO_DISCARD:
+			if (strategy == SYNC_TARGET_USE_BITMAP && rule == RULE_CRASHED_PRIMARY) {
+				drbd_warn(peer_device, "reversing resync by auto-discard\n");
+				strategy = SYNC_SOURCE_USE_BITMAP;
+			}
 		}
 	}
-
-	if (tentative || test_bit(CONN_DRY_RUN, &peer_device->connection->flags)) {
-		if (hg == 0)
-			drbd_info(device, "dry-run connect: No resync, would become Connected immediately.\n");
-		else
-			drbd_info(device, "dry-run connect: Would become %s, doing a %s resync.",
-				 drbd_conn_str(hg > 0 ? C_SYNC_SOURCE : C_SYNC_TARGET),
-				 abs(hg) >= 2 ? "full" : "bit-map based");
-		return C_MASK;
+	if (strategy == SYNC_SOURCE_USE_BITMAP && rule == RULE_CRASHED_PRIMARY &&
+	    peer_role == R_PRIMARY && peer_disk_state >= D_CONSISTENT &&
+	    rr_conflict == ASB_AUTO_DISCARD) {
+		drbd_warn(peer_device, "reversing resync by auto-discard\n");
+		strategy = SYNC_TARGET_USE_BITMAP;
+	}
+
+	if (rule == RULE_SYNC_SOURCE_MISSED_FINISH || rule == RULE_SYNC_SOURCE_PEER_MISSED_FINISH ||
+	    rule == RULE_SYNC_TARGET_MISSED_FINISH || rule == RULE_SYNC_TARGET_PEER_MISSED_FINISH) {
+		if (strategy == SYNC_SOURCE_USE_BITMAP) {
+			enum drbd_disk_state disk_state = peer_device->comm_state.disk;
+
+			if (disk_state == D_NEGOTIATING)
+				disk_state = disk_state_from_md(device);
+			if (disk_state != D_UP_TO_DATE) {
+				drbd_info(peer_device,
+					  "Resync (rule=%s) skipped: sync-source (%s)\n",
+					  drbd_sync_rule_str(rule), drbd_disk_str(disk_state));
+				strategy = NO_SYNC;
+			}
+		} else if (strategy == SYNC_TARGET_USE_BITMAP) {
+			if (peer_disk_state != D_UP_TO_DATE) {
+				int peer_node_id = peer_device->node_id;
+				u64 previous = device->ldev->md.peers[peer_node_id].bitmap_uuid;
+
+				if (previous) {
+					device->ldev->md.peers[peer_node_id].bitmap_uuid = 0;
+					_drbd_uuid_push_history(device, previous);
+					drbd_md_mark_dirty(device);
+				}
+				drbd_info(peer_device,
+					  "Resync (rule=%s) skipped: peer sync-source (%s)\n",
+					  drbd_sync_rule_str(rule), drbd_disk_str(peer_disk_state));
+				strategy = NO_SYNC;
+			}
+		}
 	}
 
-	if (abs(hg) >= 2) {
-		drbd_info(device, "Writing the whole bitmap, full sync required after drbd_sync_handshake.\n");
-		if (drbd_bitmap_io(device, &drbd_bmio_set_n_write, "set_n_write from sync_handshake",
-					BM_LOCKED_SET_ALLOWED, NULL))
-			return C_MASK;
+	if (test_bit(CONN_DRY_RUN, &connection->flags)) {
+		if (strategy == NO_SYNC)
+			drbd_info(peer_device, "dry-run connect: No resync, would become Connected immediately.\n");
+		else
+			drbd_info(peer_device, "dry-run connect: Would become %s, doing a %s resync.",
+				 drbd_repl_str(strategy_descriptor(strategy).is_sync_target ? L_SYNC_TARGET : L_SYNC_SOURCE),
+				 strategy_descriptor(strategy).name);
+		return -2;
 	}
 
-	if (hg > 0) { /* become sync source. */
-		rv = C_WF_BITMAP_S;
-	} else if (hg < 0) { /* become sync target */
-		rv = C_WF_BITMAP_T;
-	} else {
-		rv = C_CONNECTED;
-		if (drbd_bm_total_weight(device)) {
-			drbd_info(device, "No resync, but %lu bits in bitmap!\n",
-			     drbd_bm_total_weight(device));
-		}
-	}
+	err = bitmap_mod_after_handshake(peer_device, strategy, peer_node_id);
+	if (err)
+		return RETRY_CONNECT;
 
-	return rv;
+	return strategy;
 }
 
 static enum drbd_after_sb_p convert_after_sb(enum drbd_after_sb_p peer)
@@ -3465,20 +5479,18 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 
 		if (pi->size > sizeof(integrity_alg))
 			return -EIO;
-		err = drbd_recv_all(connection, integrity_alg, pi->size);
+		err = drbd_recv_into(connection, integrity_alg, pi->size);
 		if (err)
 			return err;
 		integrity_alg[SHARED_SECRET_MAX - 1] = 0;
 	}
 
 	if (pi->cmd != P_PROTOCOL_UPDATE) {
-		clear_bit(CONN_DRY_RUN, &connection->flags);
-
 		if (cf & CF_DRY_RUN)
 			set_bit(CONN_DRY_RUN, &connection->flags);
 
 		rcu_read_lock();
-		nc = rcu_dereference(connection->net_conf);
+		nc = rcu_dereference(connection->transport.net_conf);
 
 		if (p_proto != nc->wire_protocol) {
 			drbd_err(connection, "incompatible %s settings\n", "protocol");
@@ -3500,7 +5512,7 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 			goto disconnect_rcu_unlock;
 		}
 
-		if (p_discard_my_data && nc->discard_my_data) {
+		if (p_discard_my_data && test_bit(CONN_DISCARD_MY_DATA, &connection->flags)) {
 			drbd_err(connection, "incompatible %s settings\n", "discard-my-data");
 			goto disconnect_rcu_unlock;
 		}
@@ -3551,9 +5563,13 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 	if (!new_net_conf)
 		goto disconnect;
 
-	mutex_lock(&connection->data.mutex);
-	mutex_lock(&connection->resource->conf_update);
-	old_net_conf = connection->net_conf;
+	if (mutex_lock_interruptible(&connection->resource->conf_update)) {
+		drbd_err(connection, "Interrupted while waiting for conf_update\n");
+		goto disconnect;
+	}
+
+	mutex_lock(&connection->mutex[DATA_STREAM]);
+	old_net_conf = connection->transport.net_conf;
 	*new_net_conf = *old_net_conf;
 
 	new_net_conf->wire_protocol = p_proto;
@@ -3562,9 +5578,9 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 	new_net_conf->after_sb_2p = convert_after_sb(p_after_sb_2p);
 	new_net_conf->two_primaries = p_two_primaries;
 
-	rcu_assign_pointer(connection->net_conf, new_net_conf);
+	rcu_assign_pointer(connection->transport.net_conf, new_net_conf);
+	mutex_unlock(&connection->mutex[DATA_STREAM]);
 	mutex_unlock(&connection->resource->conf_update);
-	mutex_unlock(&connection->data.mutex);
 
 	crypto_free_shash(connection->peer_integrity_tfm);
 	kfree(connection->int_dig_in);
@@ -3583,10 +5599,11 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 disconnect_rcu_unlock:
 	rcu_read_unlock();
 disconnect:
+	kfree(new_net_conf);
 	crypto_free_shash(peer_integrity_tfm);
 	kfree(int_dig_in);
 	kfree(int_dig_vv);
-	conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
+	change_cstate(connection, C_DISCONNECTING, CS_HARD);
 	return -EIO;
 }
 
@@ -3595,8 +5612,7 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
  * return: NULL (alg name was "")
  *         ERR_PTR(error) if something goes wrong
  *         or the crypto hash ptr, if it worked out ok. */
-static struct crypto_shash *drbd_crypto_alloc_digest_safe(
-		const struct drbd_device *device,
+static struct crypto_shash *drbd_crypto_alloc_digest_safe(const struct drbd_device *device,
 		const char *alg, const char *name)
 {
 	struct crypto_shash *tfm;
@@ -3613,44 +5629,11 @@ static struct crypto_shash *drbd_crypto_alloc_digest_safe(
 	return tfm;
 }
 
-static int ignore_remaining_packet(struct drbd_connection *connection, struct packet_info *pi)
-{
-	void *buffer = connection->data.rbuf;
-	int size = pi->size;
-
-	while (size) {
-		int s = min_t(int, size, DRBD_SOCKET_BUFFER_SIZE);
-		s = drbd_recv(connection, buffer, s);
-		if (s <= 0) {
-			if (s < 0)
-				return s;
-			break;
-		}
-		size -= s;
-	}
-	if (size)
-		return -EIO;
-	return 0;
-}
-
-/*
- * config_unknown_volume  -  device configuration command for unknown volume
- *
- * When a device is added to an existing connection, the node on which the
- * device is added first will send configuration commands to its peer but the
- * peer will not know about the device yet.  It will warn and ignore these
- * commands.  Once the device is added on the second node, the second node will
- * send the same device configuration commands, but in the other direction.
- *
- * (We can also end up here if drbd is misconfigured.)
- */
-static int config_unknown_volume(struct drbd_connection *connection, struct packet_info *pi)
-{
-	drbd_warn(connection, "%s packet received for volume %u, which is not configured locally\n",
-		  cmdname(pi->cmd), pi->vnr);
-	return ignore_remaining_packet(connection, pi);
-}
-
+/* Receive P_SYNC_PARAM89 and the older P_SYNC_PARAM. The peer_device fields
+ * related to resync configuration are ignored. These include resync_rate,
+ * c_max_rate and the like. We ignore them because applying them to our own
+ * configuration would be confusing. It would cause us to swap configuration
+ * with our peer each time we connected. */
 static int receive_SyncParam(struct drbd_connection *connection, struct packet_info *pi)
 {
 	struct drbd_peer_device *peer_device;
@@ -3660,10 +5643,10 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 	struct crypto_shash *verify_tfm = NULL;
 	struct crypto_shash *csums_tfm = NULL;
 	struct net_conf *old_net_conf, *new_net_conf = NULL;
-	struct disk_conf *old_disk_conf = NULL, *new_disk_conf = NULL;
+	struct peer_device_conf *old_peer_device_conf = NULL;
 	const int apv = connection->agreed_pro_version;
 	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
-	unsigned int fifo_size = 0;
+	struct drbd_resource *resource = connection->resource;
 	int err;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
@@ -3696,48 +5679,26 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 		D_ASSERT(device, data_size == 0);
 	}
 
-	/* initialize verify_alg and csums_alg */
-	p = pi->data;
-	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
-	memset(&p->algs, 0, sizeof(p->algs));
-
-	err = drbd_recv_all(peer_device->connection, p, header_size);
+	err = drbd_recv_all(connection, (void **)&p, header_size + data_size);
 	if (err)
 		return err;
 
-	mutex_lock(&connection->resource->conf_update);
-	old_net_conf = peer_device->connection->net_conf;
-	if (get_ldev(device)) {
-		new_disk_conf = kzalloc_obj(struct disk_conf);
-		if (!new_disk_conf) {
-			put_ldev(device);
-			mutex_unlock(&connection->resource->conf_update);
-			drbd_err(device, "Allocation of new disk_conf failed\n");
-			return -ENOMEM;
-		}
-
-		old_disk_conf = device->ldev->disk_conf;
-		*new_disk_conf = *old_disk_conf;
-
-		new_disk_conf->resync_rate = be32_to_cpu(p->resync_rate);
+	err = mutex_lock_interruptible(&resource->conf_update);
+	if (err) {
+		drbd_err(connection, "Interrupted while waiting for conf_update\n");
+		return err;
 	}
+	old_net_conf = connection->transport.net_conf;
 
 	if (apv >= 88) {
 		if (apv == 88) {
 			if (data_size > SHARED_SECRET_MAX || data_size == 0) {
-				drbd_err(device, "verify-alg of wrong size, "
-					"peer wants %u, accepting only up to %u byte\n",
-					data_size, SHARED_SECRET_MAX);
+				drbd_err(device, "verify-alg too long, "
+					 "peer wants %u, accepting only %u byte\n",
+					 data_size, SHARED_SECRET_MAX);
 				goto reconnect;
 			}
-
-			err = drbd_recv_all(peer_device->connection, p->verify_alg, data_size);
-			if (err)
-				goto reconnect;
-			/* we expect NUL terminated string */
-			/* but just in case someone tries to be evil */
-			D_ASSERT(device, p->verify_alg[data_size-1] == 0);
-			p->verify_alg[data_size-1] = 0;
+			p->verify_alg[data_size] = 0;
 
 		} else /* apv >= 89 */ {
 			/* we still expect NUL terminated strings */
@@ -3749,7 +5710,7 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 		}
 
 		if (strcmp(old_net_conf->verify_alg, p->verify_alg)) {
-			if (device->state.conn == C_WF_REPORT_PARAMS) {
+			if (peer_device->repl_state[NOW] == L_OFF) {
 				drbd_err(device, "Different verify-alg settings. me=\"%s\" peer=\"%s\"\n",
 				    old_net_conf->verify_alg, p->verify_alg);
 				goto disconnect;
@@ -3763,7 +5724,7 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 		}
 
 		if (apv >= 89 && strcmp(old_net_conf->csums_alg, p->csums_alg)) {
-			if (device->state.conn == C_WF_REPORT_PARAMS) {
+			if (peer_device->repl_state[NOW] == L_OFF) {
 				drbd_err(device, "Different csums-alg settings. me=\"%s\" peer=\"%s\"\n",
 				    old_net_conf->csums_alg, p->csums_alg);
 				goto disconnect;
@@ -3776,23 +5737,6 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 			}
 		}
 
-		if (apv > 94 && new_disk_conf) {
-			new_disk_conf->c_plan_ahead = be32_to_cpu(p->c_plan_ahead);
-			new_disk_conf->c_delay_target = be32_to_cpu(p->c_delay_target);
-			new_disk_conf->c_fill_target = be32_to_cpu(p->c_fill_target);
-			new_disk_conf->c_max_rate = be32_to_cpu(p->c_max_rate);
-
-			fifo_size = (new_disk_conf->c_plan_ahead * 10 * SLEEP_TIME) / HZ;
-			if (fifo_size != device->rs_plan_s->size) {
-				new_plan = fifo_alloc(fifo_size);
-				if (!new_plan) {
-					drbd_err(device, "kmalloc of fifo_buffer failed");
-					put_ldev(device);
-					goto disconnect;
-				}
-			}
-		}
-
 		if (verify_tfm || csums_tfm) {
 			new_net_conf = kzalloc_obj(struct net_conf);
 			if (!new_net_conf)
@@ -3803,66 +5747,58 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 			if (verify_tfm) {
 				strscpy(new_net_conf->verify_alg, p->verify_alg);
 				new_net_conf->verify_alg_len = strlen(p->verify_alg) + 1;
-				crypto_free_shash(peer_device->connection->verify_tfm);
-				peer_device->connection->verify_tfm = verify_tfm;
+				crypto_free_shash(connection->verify_tfm);
+				connection->verify_tfm = verify_tfm;
 				drbd_info(device, "using verify-alg: \"%s\"\n", p->verify_alg);
 			}
 			if (csums_tfm) {
 				strscpy(new_net_conf->csums_alg, p->csums_alg);
 				new_net_conf->csums_alg_len = strlen(p->csums_alg) + 1;
-				crypto_free_shash(peer_device->connection->csums_tfm);
-				peer_device->connection->csums_tfm = csums_tfm;
+				crypto_free_shash(connection->csums_tfm);
+				connection->csums_tfm = csums_tfm;
 				drbd_info(device, "using csums-alg: \"%s\"\n", p->csums_alg);
 			}
-			rcu_assign_pointer(connection->net_conf, new_net_conf);
+			rcu_assign_pointer(connection->transport.net_conf, new_net_conf);
 		}
 	}
 
-	if (new_disk_conf) {
-		rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
-		put_ldev(device);
-	}
-
-	if (new_plan) {
-		old_plan = device->rs_plan_s;
-		rcu_assign_pointer(device->rs_plan_s, new_plan);
-	}
+	if (new_plan)
+		rcu_assign_pointer(peer_device->rs_plan_s, new_plan);
 
-	mutex_unlock(&connection->resource->conf_update);
+	mutex_unlock(&resource->conf_update);
 	synchronize_rcu();
 	if (new_net_conf)
 		kfree(old_net_conf);
-	kfree(old_disk_conf);
-	kfree(old_plan);
+	kfree(old_peer_device_conf);
+	if (new_plan)
+		kfree(old_plan);
 
 	return 0;
 
 reconnect:
-	if (new_disk_conf) {
-		put_ldev(device);
-		kfree(new_disk_conf);
-	}
-	mutex_unlock(&connection->resource->conf_update);
+	mutex_unlock(&resource->conf_update);
 	return -EIO;
 
 disconnect:
 	kfree(new_plan);
-	if (new_disk_conf) {
-		put_ldev(device);
-		kfree(new_disk_conf);
-	}
-	mutex_unlock(&connection->resource->conf_update);
+	mutex_unlock(&resource->conf_update);
 	/* just for completeness: actually not needed,
 	 * as this is not reached if csums_tfm was ok. */
 	crypto_free_shash(csums_tfm);
 	/* but free the verify_tfm again, if csums_tfm did not work out */
 	crypto_free_shash(verify_tfm);
-	conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
+	change_cstate(connection, C_DISCONNECTING, CS_HARD);
 	return -EIO;
 }
 
+static void drbd_setup_order_type(struct drbd_device *device, int peer)
+{
+	/* sorry, we currently have no working implementation
+	 * of distributed TCQ */
+}
+
 /* warn if the arguments differ by more than 12.5% */
-static void warn_if_differ_considerably(struct drbd_device *device,
+static void warn_if_differ_considerably(struct drbd_peer_device *peer_device,
 	const char *s, sector_t a, sector_t b)
 {
 	sector_t d;
@@ -3870,135 +5806,325 @@ static void warn_if_differ_considerably(struct drbd_device *device,
 		return;
 	d = (a > b) ? (a - b) : (b - a);
 	if (d > (a>>3) || d > (b>>3))
-		drbd_warn(device, "Considerable difference in %s: %llus vs. %llus\n", s,
+		drbd_warn(peer_device, "Considerable difference in %s: %llus vs. %llus\n", s,
 		     (unsigned long long)a, (unsigned long long)b);
 }
 
-static int receive_sizes(struct drbd_connection *connection, struct packet_info *pi)
+static bool drbd_other_peer_smaller(struct drbd_peer_device *reference_peer_device, uint64_t new_size)
 {
+	struct drbd_device *device = reference_peer_device->device;
 	struct drbd_peer_device *peer_device;
+	bool smaller = false;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		if (peer_device == reference_peer_device)
+			continue;
+
+		/* Ignore peers without an attached disk. */
+		if (peer_device->disk_state[NOW] < D_INCONSISTENT)
+			continue;
+
+		if (peer_device->d_size != 0 && peer_device->d_size < new_size)
+			smaller = true;
+	}
+	rcu_read_unlock();
+
+	return smaller;
+}
+
+/* Maximum bio size that a protocol version supports. */
+static unsigned int conn_max_bio_size(struct drbd_connection *connection)
+{
+	if (connection->agreed_pro_version >= 100)
+		return DRBD_MAX_BIO_SIZE;
+	else if (connection->agreed_pro_version >= 95)
+		return DRBD_MAX_BIO_SIZE_P95;
+	else
+		return DRBD_MAX_SIZE_H80_PACKET;
+}
+
+static struct drbd_peer_device *get_neighbor_device(struct drbd_device *device,
+		enum drbd_neighbor neighbor)
+{
+	s32 self_id, peer_id, pivot;
+	struct drbd_peer_device *peer_device, *peer_device_ret = NULL;
+
+	if (!get_ldev(device))
+		return NULL;
+	self_id = device->ldev->md.node_id;
+	put_ldev(device);
+
+	pivot = neighbor == NEXT_LOWER ? 0 : neighbor == NEXT_HIGHER ? S32_MAX : -1;
+	if (pivot == -1)
+		return NULL;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		bool found_new = false;
+		peer_id = peer_device->node_id;
+
+		if (neighbor == NEXT_LOWER && peer_id < self_id && peer_id >= pivot)
+			found_new = true;
+		else if (neighbor == NEXT_HIGHER && peer_id > self_id && peer_id <= pivot)
+			found_new = true;
+
+		if (found_new && peer_device->disk_state[NOW] >= D_INCONSISTENT) {
+			pivot = peer_id;
+			peer_device_ret = peer_device;
+		}
+	}
+	rcu_read_unlock();
+
+	return peer_device_ret;
+}
+
+static void maybe_trigger_resync(struct drbd_device *device, struct drbd_peer_device *peer_device, bool grew, bool skip)
+{
+	if (!peer_device)
+		return;
+	if (peer_device->repl_state[NOW] <= L_OFF)
+		return;
+	if (test_and_clear_bit(RESIZE_PENDING, &peer_device->flags) ||
+	    (grew && peer_device->repl_state[NOW] == L_ESTABLISHED)) {
+		if (peer_device->disk_state[NOW] >= D_INCONSISTENT &&
+		    device->disk_state[NOW] >= D_INCONSISTENT) {
+			if (skip)
+				drbd_info(peer_device, "Resync of new storage suppressed with --assume-clean\n");
+			else
+				resync_after_online_grow(peer_device);
+		} else
+			set_bit(RESYNC_AFTER_NEG, &peer_device->flags);
+	}
+}
+
+static int receive_sizes(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device, *peer_device_it = NULL;
 	struct drbd_device *device;
 	struct p_sizes *p = pi->data;
-	struct o_qlim *o = (connection->agreed_features & DRBD_FF_WSAME) ? p->qlim : NULL;
+	uint64_t p_size, p_usize, p_csize;
+	uint64_t my_usize, my_max_size, cur_size;
 	enum determine_dev_size dd = DS_UNCHANGED;
-	sector_t p_size, p_usize, p_csize, my_usize;
-	sector_t new_size, cur_size;
-	int ldsc = 0; /* local disk size changed */
+	bool should_send_sizes = false;
 	enum dds_flags ddsf;
+	unsigned int protocol_max_bio_size;
+	bool have_ldev = false;
+	bool have_mutex = false;
+	bool is_handshake;
+	int err;
+	u64 im;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
 		return config_unknown_volume(connection, pi);
 	device = peer_device->device;
-	cur_size = get_capacity(device->vdisk);
 
+	err = mutex_lock_interruptible(&connection->resource->conf_update);
+	if (err) {
+		drbd_err(connection, "Interrupted while waiting for conf_update\n");
+		goto out;
+	}
+	have_mutex = true;
+
+	/* just store the peer's disk size for now.
+	 * we still need to figure out whether we accept that. */
 	p_size = be64_to_cpu(p->d_size);
 	p_usize = be64_to_cpu(p->u_size);
 	p_csize = be64_to_cpu(p->c_size);
 
-	/* just store the peer's disk size for now.
-	 * we still need to figure out whether we accept that. */
-	device->p_size = p_size;
+	peer_device->d_size = p_size;
+	peer_device->u_size = p_usize;
+	peer_device->c_size = p_csize;
+
+	/* Ignore "current" size for calculating "max" size. */
+	/* If it used to have a disk, but now is detached, don't revert back to zero. */
+	if (p_size)
+		peer_device->max_size = p_size;
+
+	cur_size = get_capacity(device->vdisk);
+	dynamic_drbd_dbg(device, "current_size: %llu\n", (unsigned long long)cur_size);
+	dynamic_drbd_dbg(peer_device, "c_size: %llu u_size: %llu d_size: %llu max_size: %llu\n",
+			(unsigned long long)p_csize,
+			(unsigned long long)p_usize,
+			(unsigned long long)p_size,
+			(unsigned long long)peer_device->max_size);
+
+	if ((p_size && p_csize > p_size) || (p_usize && p_csize > p_usize)) {
+		drbd_warn(peer_device, "Peer sent bogus sizes, disconnecting\n");
+		goto disconnect;
+	}
+
+	/* The protocol version limits how big requests can be.  In addition,
+	 * peers before protocol version 94 cannot split large requests into
+	 * multiple bios; their reported max_bio_size is a hard limit.
+	 */
+	protocol_max_bio_size = conn_max_bio_size(connection);
+	peer_device->q_limits.max_bio_size = min(be32_to_cpu(p->max_bio_size),
+						 protocol_max_bio_size);
+	ddsf = be16_to_cpu(p->dds_flags);
+	is_handshake = (peer_device->repl_state[NOW] == L_OFF);
+	set_bit(HAVE_SIZES, &peer_device->flags);
 
 	if (get_ldev(device)) {
+		sector_t new_size;
+
+		have_ldev = true;
+
 		rcu_read_lock();
 		my_usize = rcu_dereference(device->ldev->disk_conf)->disk_size;
 		rcu_read_unlock();
 
-		warn_if_differ_considerably(device, "lower level device sizes",
-			   p_size, drbd_get_max_capacity(device->ldev));
-		warn_if_differ_considerably(device, "user requested size",
+		my_max_size = drbd_get_max_capacity(device, device->ldev, false);
+		dynamic_drbd_dbg(peer_device, "la_size: %llu my_usize: %llu my_max_size: %llu\n",
+			(unsigned long long)device->ldev->md.effective_size,
+			(unsigned long long)my_usize,
+			(unsigned long long)my_max_size);
+
+		if (peer_device->disk_state[NOW] > D_DISKLESS)
+			warn_if_differ_considerably(peer_device, "lower level device sizes",
+				   p_size, my_max_size);
+		warn_if_differ_considerably(peer_device, "user requested size",
 					    p_usize, my_usize);
 
-		/* if this is the first connect, or an otherwise expected
-		 * param exchange, choose the minimum */
-		if (device->state.conn == C_WF_REPORT_PARAMS)
+		if (is_handshake)
 			p_usize = min_not_zero(my_usize, p_usize);
 
+		if (p_usize == 0) {
+			/* Peer may reset usize to zero only if it has a backend.
+			 * Because a diskless node has no disk config,
+			 * and always sends zero. */
+			if (p_size == 0)
+				p_usize = my_usize;
+		}
+
+		new_size = drbd_new_dev_size(device, p_csize, p_usize, ddsf);
+
 		/* Never shrink a device with usable data during connect,
 		 * or "attach" on the peer.
 		 * But allow online shrinking if we are connected. */
-		new_size = drbd_new_dev_size(device, device->ldev, p_usize, 0);
 		if (new_size < cur_size &&
-		    device->state.disk >= D_OUTDATED &&
-		    (device->state.conn < C_CONNECTED || device->state.pdsk == D_DISKLESS)) {
-			drbd_err(device, "The peer's disk size is too small! (%llu < %llu sectors)\n",
+		    device->disk_state[NOW] >= D_OUTDATED &&
+		    (peer_device->repl_state[NOW] < L_ESTABLISHED || peer_device->disk_state[NOW] == D_DISKLESS)) {
+			drbd_err(peer_device, "The peer's disk size is too small! (%llu < %llu sectors)\n",
 					(unsigned long long)new_size, (unsigned long long)cur_size);
-			conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
-			put_ldev(device);
-			return -EIO;
+			goto disconnect;
+		}
+
+		/* Disconnect, if we cannot grow to the peer's current size */
+		if (my_max_size < p_csize && !is_handshake) {
+			drbd_err(peer_device, "Peer's size larger than my maximum capacity (%llu < %llu sectors)\n",
+					(unsigned long long)my_max_size, (unsigned long long)p_csize);
+			goto disconnect;
 		}
 
 		if (my_usize != p_usize) {
-			struct disk_conf *old_disk_conf, *new_disk_conf = NULL;
+			struct disk_conf *old_disk_conf, *new_disk_conf;
 
 			new_disk_conf = kzalloc_obj(struct disk_conf);
 			if (!new_disk_conf) {
-				put_ldev(device);
-				return -ENOMEM;
+				err = -ENOMEM;
+				goto out;
 			}
 
-			mutex_lock(&connection->resource->conf_update);
 			old_disk_conf = device->ldev->disk_conf;
 			*new_disk_conf = *old_disk_conf;
 			new_disk_conf->disk_size = p_usize;
 
 			rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
-			mutex_unlock(&connection->resource->conf_update);
 			kvfree_rcu_mightsleep(old_disk_conf);
 
-			drbd_info(device, "Peer sets u_size to %lu sectors (old: %lu)\n",
-				 (unsigned long)p_usize, (unsigned long)my_usize);
+			drbd_info(peer_device, "Peer sets u_size to %llu sectors (old: %llu)\n",
+				 (unsigned long long)p_usize, (unsigned long long)my_usize);
+			/* Do not set should_send_sizes here. That might cause packet storms */
 		}
+	}
 
-		put_ldev(device);
+	if (connection->agreed_features & DRBD_FF_WSAME) {
+		struct o_qlim *qlim = p->qlim;
+
+		peer_device->q_limits.physical_block_size = be32_to_cpu(qlim->physical_block_size);
+		peer_device->q_limits.logical_block_size = be32_to_cpu(qlim->logical_block_size);
+		peer_device->q_limits.alignment_offset = be32_to_cpu(qlim->alignment_offset);
+		peer_device->q_limits.io_min = be32_to_cpu(qlim->io_min);
+		peer_device->q_limits.io_opt = be32_to_cpu(qlim->io_opt);
+	}
+
+	if (connection->agreed_features & DRBD_FF_BM_BLOCK_SHIFT) {
+		peer_device->bm_block_shift =
+			p->qlim->bm_block_shift_minus_12 + BM_BLOCK_SHIFT_4k;
+	} else {
+		int bbs = have_ldev ? bm_block_size(device->bitmap) : BM_BLOCK_SIZE_4k;
+		/* May work as long as this one is SyncTarget. May result in
+		 * funny never ending / repeating resyncs if the other guy is
+		 * SyncTarget, but unaware of bitmap granularity issues.
+		 */
+		if (bbs != BM_BLOCK_SIZE_4k)
+			drbd_warn(peer_device,
+				"My bitmap granularity is %u. Upgrade this peer to make it aware.\n",
+				bbs);
+		peer_device->bm_block_shift = BM_BLOCK_SHIFT_4k;
 	}
 
-	device->peer_max_bio_size = be32_to_cpu(p->max_bio_size);
 	/* Leave drbd_reconsider_queue_parameters() before drbd_determine_dev_size().
 	   In case we cleared the QUEUE_FLAG_DISCARD from our queue in
 	   drbd_reconsider_queue_parameters(), we can be sure that after
-	   drbd_determine_dev_size() no REQ_DISCARDs are in the queue. */
+	   drbd_determine_dev_size() no REQ_OP_DISCARDs are in the queue. */
+	if (have_ldev) {
+		enum dds_flags local_ddsf = ddsf;
+		drbd_reconsider_queue_parameters(device, device->ldev);
 
-	ddsf = be16_to_cpu(p->dds_flags);
-	if (get_ldev(device)) {
-		drbd_reconsider_queue_parameters(device, device->ldev, o);
-		dd = drbd_determine_dev_size(device, ddsf, NULL);
-		put_ldev(device);
-		if (dd == DS_ERROR)
-			return -EIO;
-		drbd_md_sync(device);
+		/* To support thinly provisioned nodes (partial resync) joining later,
+		   clear all bitmap slots, including the unused ones. */
+		if (device->ldev->md.effective_size == 0)
+			local_ddsf |= DDSF_NO_RESYNC;
+
+		dd = drbd_determine_dev_size(device, p_csize, local_ddsf, NULL);
+
+		if (dd == DS_GREW || dd == DS_SHRUNK)
+			should_send_sizes = true;
+
+		if (dd == DS_ERROR) {
+			err = -EIO;
+			goto out;
+		}
+		drbd_md_sync_if_dirty(device);
 	} else {
-		/*
-		 * I am diskless, need to accept the peer's *current* size.
-		 * I must NOT accept the peers backing disk size,
-		 * it may have been larger than mine all along...
+		uint64_t new_size = 0;
+
+		drbd_reconsider_queue_parameters(device, NULL);
+		/* In case I am diskless, need to accept the peer's *current* size.
 		 *
 		 * At this point, the peer knows more about my disk, or at
 		 * least about what we last agreed upon, than myself.
 		 * So if his c_size is less than his d_size, the most likely
-		 * reason is that *my* d_size was smaller last time we checked.
-		 *
-		 * However, if he sends a zero current size,
-		 * take his (user-capped or) backing disk size anyways.
+		 * reason is that *my* d_size was smaller last time we checked,
+		 * or some other peer does not (yet) have enough room.
 		 *
 		 * Unless of course he does not have a disk himself.
 		 * In which case we ignore this completely.
 		 */
-		sector_t new_size = p_csize ?: p_usize ?: p_size;
-		drbd_reconsider_queue_parameters(device, NULL, o);
+		new_size = p_csize;
+		new_size = min_not_zero(new_size, p_usize);
+		new_size = min_not_zero(new_size, p_size);
+
 		if (new_size == 0) {
 			/* Ignore, peer does not know nothing. */
 		} else if (new_size == cur_size) {
 			/* nothing to do */
 		} else if (cur_size != 0 && p_size == 0) {
-			drbd_warn(device, "Ignored diskless peer device size (peer:%llu != me:%llu sectors)!\n",
+			dynamic_drbd_dbg(peer_device,
+					"Ignored diskless peer device size (peer:%llu != me:%llu sectors)!\n",
 					(unsigned long long)new_size, (unsigned long long)cur_size);
-		} else if (new_size < cur_size && device->state.role == R_PRIMARY) {
-			drbd_err(device, "The peer's device size is too small! (%llu < %llu sectors); demote me first!\n",
-					(unsigned long long)new_size, (unsigned long long)cur_size);
-			conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
-			return -EIO;
+		} else if (new_size < cur_size && device->resource->role[NOW] == R_PRIMARY) {
+			drbd_err(peer_device,
+				"The peer's device size is too small! (%llu < %llu sectors); demote me first!\n",
+				(unsigned long long)new_size, (unsigned long long)cur_size);
+			goto disconnect;
+		} else if (drbd_other_peer_smaller(peer_device, new_size)) {
+			dynamic_drbd_dbg(peer_device,
+					"Ignored peer device size (peer:%llu sectors); other peer smaller!\n",
+					(unsigned long long)new_size);
 		} else {
 			/* I believe the peer, if
 			 *  - I don't have a current size myself
@@ -4009,1071 +6135,3893 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 			 *    and he has the only disk,
 			 *    which is larger than my current size
 			 */
+			should_send_sizes = true;
 			drbd_set_my_capacity(device, new_size);
 		}
 	}
 
-	if (get_ldev(device)) {
+	if (device->device_conf.max_bio_size > protocol_max_bio_size ||
+	    (connection->agreed_pro_version < 94 &&
+	     device->device_conf.max_bio_size > peer_device->q_limits.max_bio_size)) {
+		drbd_err(device, "Peer cannot deal with requests bigger than %u. "
+			 "Please reduce max_bio_size in the configuration.\n",
+			 peer_device->q_limits.max_bio_size);
+		goto disconnect;
+	}
+
+	if (have_ldev) {
 		if (device->ldev->known_size != drbd_get_capacity(device->ldev->backing_bdev)) {
 			device->ldev->known_size = drbd_get_capacity(device->ldev->backing_bdev);
-			ldsc = 1;
+			should_send_sizes = true;
 		}
 
+		drbd_setup_order_type(device, be16_to_cpu(p->queue_order_type));
+	}
+
+	cur_size = get_capacity(device->vdisk);
+
+	for_each_peer_device_ref(peer_device_it, im, device) {
+		struct drbd_connection *con_it = peer_device_it->connection;
+
+		/* drop cached max_size, if we already grew beyond it */
+		if (peer_device_it->max_size < cur_size)
+			peer_device_it->max_size = 0;
+
+		if (con_it->cstate[NOW] < C_CONNECTED)
+			continue;
+
+		/* Send size updates only if something relevant has changed.
+		 * TODO: only tell the sender thread to do so,
+		 * or we may end up in a distributed deadlock on congestion. */
+
+		if (should_send_sizes)
+			drbd_send_sizes(peer_device_it, p_usize, ddsf);
+	}
+
+	maybe_trigger_resync(device, get_neighbor_device(device, NEXT_HIGHER),
+					dd == DS_GREW, ddsf & DDSF_NO_RESYNC);
+	maybe_trigger_resync(device, get_neighbor_device(device, NEXT_LOWER),
+					dd == DS_GREW, ddsf & DDSF_NO_RESYNC);
+	err = 0;
+
+out:
+	if (have_ldev)
 		put_ldev(device);
+	if (have_mutex)
+		mutex_unlock(&connection->resource->conf_update);
+	return err;
+
+disconnect:
+	/* don't let a rejected peer confuse future handshakes with different peers. */
+	peer_device->max_size = 0;
+
+	if (connection->resource->remote_state_change)
+		set_bit(TWOPC_RECV_SIZES_ERR, &connection->resource->flags);
+	else
+		err = -EIO;
+	goto out;
+}
+
+static enum sync_strategy resolve_splitbrain_from_disk_states(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+	enum drbd_disk_state peer_disk_state = peer_device->disk_state[NOW];
+	enum drbd_disk_state disk_state = device->disk_state[NOW];
+
+	return  disk_state <= D_UP_TO_DATE && peer_disk_state == D_UP_TO_DATE ? SYNC_TARGET_USE_BITMAP :
+		disk_state == D_UP_TO_DATE && peer_disk_state <= D_UP_TO_DATE ? SYNC_SOURCE_USE_BITMAP :
+		SPLIT_BRAIN_AUTO_RECOVER;
+}
+
+static void drbd_resync(struct drbd_peer_device *peer_device,
+			enum resync_reason reason)
+{
+	enum drbd_role peer_role = peer_device->connection->peer_role[NOW];
+	enum drbd_repl_state new_repl_state;
+	enum drbd_disk_state peer_disk_state;
+	enum sync_strategy strategy;
+	enum sync_rule rule;
+	int peer_node_id;
+	enum drbd_state_rv rv;
+	const char *tag = reason == AFTER_UNSTABLE ? "after-unstable" : "diskless-primary";
+
+	strategy = drbd_handshake(peer_device, &rule, &peer_node_id, reason == DISKLESS_PRIMARY);
+	if (strategy == SPLIT_BRAIN_AUTO_RECOVER && reason == AFTER_UNSTABLE)
+		strategy = resolve_splitbrain_from_disk_states(peer_device);
+
+	if (!is_strategy_determined(strategy)) {
+		drbd_info(peer_device, "Unexpected result of handshake() %s!\n", strategy_descriptor(strategy).name);
+		return;
 	}
 
-	if (device->state.conn > C_WF_REPORT_PARAMS) {
-		if (be64_to_cpu(p->c_size) != get_capacity(device->vdisk) ||
-		    ldsc) {
-			/* we have different sizes, probably peer
-			 * needs to know my new size... */
-			drbd_send_sizes(peer_device, 0, ddsf);
-		}
-		if (test_and_clear_bit(RESIZE_PENDING, &device->flags) ||
-		    (dd == DS_GREW && device->state.conn == C_CONNECTED)) {
-			if (device->state.pdsk >= D_INCONSISTENT &&
-			    device->state.disk >= D_INCONSISTENT) {
-				if (ddsf & DDSF_NO_RESYNC)
-					drbd_info(device, "Resync of new storage suppressed with --assume-clean\n");
-				else
-					resync_after_online_grow(device);
-			} else
-				set_bit(RESYNC_AFTER_NEG, &device->flags);
+	peer_disk_state = peer_device->disk_state[NOW];
+	if (reason == DISKLESS_PRIMARY)
+		disk_states_to_strategy(peer_device, peer_disk_state, &strategy, rule, &peer_node_id);
+
+	new_repl_state = strategy_to_repl_state(peer_device, peer_role, strategy);
+	if (new_repl_state != L_ESTABLISHED) {
+		bitmap_mod_after_handshake(peer_device, strategy, peer_node_id);
+		drbd_info(peer_device, "Becoming %s %s\n", drbd_repl_str(new_repl_state),
+			  reason == AFTER_UNSTABLE ? "after unstable" : "because primary is diskless");
+	}
+
+	if (new_repl_state == L_ESTABLISHED && peer_disk_state >= D_CONSISTENT &&
+	    peer_device->device->disk_state[NOW] == D_OUTDATED) {
+		/* No resync with up-to-date peer -> I should be consistent or up-to-date as well.
+		   Note: Former unstable (but up-to-date) nodes become consistent for a short
+		   time after loosing their primary peer. Therefore consider consistent here
+		   as well. */
+		drbd_info(peer_device, "Upgrading local disk to %s after unstable/weak (and no resync).\n",
+			  drbd_disk_str(peer_disk_state));
+		change_disk_state(peer_device->device, peer_disk_state, CS_VERBOSE, tag, NULL);
+		return;
+	}
+
+	rv = change_repl_state(peer_device, new_repl_state, CS_VERBOSE, tag);
+	if ((rv == SS_NOTHING_TO_DO || rv == SS_RESYNC_RUNNING) &&
+	    (new_repl_state == L_WF_BITMAP_S || new_repl_state == L_WF_BITMAP_T)) {
+		/* Those events might happen very quickly. In case we are still processing
+		   the previous resync we need to re-enter that state. Schedule sending of
+		   the bitmap here explicitly */
+		peer_device->resync_again++;
+		drbd_info(peer_device, "...postponing this until current resync finished\n");
+	}
+}
+
+static void update_bitmap_slot_of_peer(struct drbd_peer_device *peer_device, int node_id, u64 bitmap_uuid)
+{
+	struct drbd_device *device = peer_device->device;
+
+	if (peer_device->bitmap_uuids[node_id] && bitmap_uuid == 0) {
+		/* If we learn from a neighbor that it no longer has a bitmap
+		   against a third node, we need to deduce from that knowledge
+		   that in the other direction the bitmap was cleared as well.
+		 */
+		struct drbd_peer_device *peer_device2;
+
+		rcu_read_lock();
+		peer_device2 = peer_device_by_node_id(peer_device->device, node_id);
+		if (peer_device2) {
+			int node_id2 = peer_device->connection->peer_node_id;
+			peer_device2->bitmap_uuids[node_id2] = 0;
 		}
+		rcu_read_unlock();
 	}
 
-	return 0;
+	if (node_id != device->resource->res_opts.node_id && bitmap_uuid != -1 && get_ldev(device)) {
+		_drbd_uuid_push_history(device, bitmap_uuid);
+		put_ldev(device);
+	}
+	peer_device->bitmap_uuids[node_id] = bitmap_uuid;
 }
 
-static int receive_uuids(struct drbd_connection *connection, struct packet_info *pi)
+static void propagate_skip_initial_to_diskless(struct drbd_device *device)
 {
 	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct p_uuids *p = pi->data;
-	u64 *p_uuid;
-	int i, updated_uuids = 0;
-
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return config_unknown_volume(connection, pi);
-	device = peer_device->device;
+	u64 im;
 
-	p_uuid = kmalloc_array(UI_EXTENDED_SIZE, sizeof(*p_uuid), GFP_NOIO);
-	if (!p_uuid)
-		return false;
+	for_each_peer_device_ref(peer_device, im, device) {
+		if (peer_device->disk_state[NOW] == D_DISKLESS)
+			drbd_send_uuids(peer_device, UUID_FLAG_SKIP_INITIAL_SYNC, 0);
+	}
+}
 
-	for (i = UI_CURRENT; i < UI_EXTENDED_SIZE; i++)
-		p_uuid[i] = be64_to_cpu(p->uuid[i]);
+static int __receive_uuids(struct drbd_peer_device *peer_device, u64 node_mask)
+{
+	enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+	struct drbd_device *device = peer_device->device;
+	struct drbd_resource *resource = device->resource;
+	int updated_uuids = 0, err = 0;
+	bool bad_server, uuid_match;
+	struct net_conf *nc;
+	bool two_primaries_allowed;
 
-	kfree(device->p_uuid);
-	device->p_uuid = p_uuid;
+	uuid_match =
+		(device->exposed_data_uuid & ~UUID_PRIMARY) ==
+		(peer_device->current_uuid & ~UUID_PRIMARY);
+	bad_server =
+		repl_state < L_ESTABLISHED &&
+		device->disk_state[NOW] < D_INCONSISTENT &&
+		device->resource->role[NOW] == R_PRIMARY && !uuid_match;
 
-	if ((device->state.conn < C_CONNECTED || device->state.pdsk == D_DISKLESS) &&
-	    device->state.disk < D_INCONSISTENT &&
-	    device->state.role == R_PRIMARY &&
-	    (device->ed_uuid & ~((u64)1)) != (p_uuid[UI_CURRENT] & ~((u64)1))) {
+	if (peer_device->connection->agreed_pro_version < 110 && bad_server) {
 		drbd_err(device, "Can only connect to data with current UUID=%016llX\n",
-		    (unsigned long long)device->ed_uuid);
-		conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
+		    (unsigned long long)device->exposed_data_uuid);
+		change_cstate(peer_device->connection, C_DISCONNECTING, CS_HARD);
 		return -EIO;
 	}
 
+	rcu_read_lock();
+	nc = rcu_dereference(peer_device->connection->transport.net_conf);
+	two_primaries_allowed = nc && nc->two_primaries;
+	rcu_read_unlock();
+
 	if (get_ldev(device)) {
-		int skip_initial_sync =
-			device->state.conn == C_CONNECTED &&
+		bool skip_initial_sync =
+			repl_state == L_ESTABLISHED &&
 			peer_device->connection->agreed_pro_version >= 90 &&
-			device->ldev->md.uuid[UI_CURRENT] == UUID_JUST_CREATED &&
-			(p_uuid[UI_FLAGS] & 8);
+			drbd_current_uuid(device) == UUID_JUST_CREATED &&
+			(peer_device->uuid_flags & UUID_FLAG_SKIP_INITIAL_SYNC);
 		if (skip_initial_sync) {
+			unsigned long irq_flags;
+
 			drbd_info(device, "Accepted new current UUID, preparing to skip initial sync\n");
-			drbd_bitmap_io(device, &drbd_bmio_clear_n_write,
+			drbd_bitmap_io(device, &drbd_bmio_clear_all_n_write,
 					"clear_n_write from receive_uuids",
-					BM_LOCKED_TEST_ALLOWED, NULL);
-			_drbd_uuid_set(device, UI_CURRENT, p_uuid[UI_CURRENT]);
-			_drbd_uuid_set(device, UI_BITMAP, 0);
-			_drbd_set_state(_NS2(device, disk, D_UP_TO_DATE, pdsk, D_UP_TO_DATE),
-					CS_VERBOSE, NULL);
-			drbd_md_sync(device);
+					BM_LOCK_SET | BM_LOCK_CLEAR | BM_LOCK_BULK, NULL);
+			_drbd_uuid_set_current(device, peer_device->current_uuid);
+			peer_device->comm_current_uuid = peer_device->current_uuid;
+			peer_device->comm_uuid_flags = peer_device->uuid_flags;
+			peer_device->comm_bitmap_uuid = 0;
+			_drbd_uuid_set_bitmap(peer_device, 0);
+			begin_state_change(device->resource, &irq_flags, CS_VERBOSE);
+			__change_disk_state(device, D_UP_TO_DATE);
+			__change_peer_disk_state(peer_device, D_UP_TO_DATE);
+			end_state_change(device->resource, &irq_flags, "skip-initial-sync");
 			updated_uuids = 1;
+			propagate_skip_initial_to_diskless(device);
 		}
+
+		if (peer_device->uuid_flags & UUID_FLAG_NEW_DATAGEN) {
+			drbd_warn(peer_device, "received new current UUID: %016llX "
+				  "weak_nodes=%016llX\n", peer_device->current_uuid, node_mask);
+			drbd_uuid_received_new_current(peer_device, peer_device->current_uuid, node_mask);
+		}
+
+		drbd_uuid_detect_finished_resyncs(peer_device);
+
+		drbd_md_sync_if_dirty(device);
 		put_ldev(device);
-	} else if (device->state.disk < D_INCONSISTENT &&
-		   device->state.role == R_PRIMARY) {
-		/* I am a diskless primary, the peer just created a new current UUID
-		   for me. */
-		updated_uuids = drbd_set_ed_uuid(device, p_uuid[UI_CURRENT]);
-	}
-
-	/* Before we test for the disk state, we should wait until an eventually
-	   ongoing cluster wide state change is finished. That is important if
-	   we are primary and are detaching from our disk. We need to see the
-	   new disk state... */
-	mutex_lock(device->state_mutex);
-	mutex_unlock(device->state_mutex);
-	if (device->state.conn >= C_CONNECTED && device->state.disk < D_INCONSISTENT)
-		updated_uuids |= drbd_set_ed_uuid(device, p_uuid[UI_CURRENT]);
+	} else if (device->disk_state[NOW] < D_INCONSISTENT && repl_state >= L_ESTABLISHED &&
+		   peer_device->disk_state[NOW] == D_UP_TO_DATE && !uuid_match &&
+		   (resource->role[NOW] == R_SECONDARY ||
+		    (two_primaries_allowed && test_and_clear_bit(NEW_CUR_UUID, &device->flags)))) {
+
+		write_lock_irq(&resource->state_rwlock);
+		if (resource->remote_state_change) {
+			drbd_info(peer_device, "Delaying update of exposed data uuid\n");
+			device->next_exposed_data_uuid = peer_device->current_uuid;
+		} else {
+			updated_uuids =
+				drbd_uuid_set_exposed(device, peer_device->current_uuid, false);
+		}
+		write_unlock_irq(&resource->state_rwlock);
+
+	}
+
+	if (device->disk_state[NOW] == D_DISKLESS && uuid_match &&
+	    peer_device->disk_state[NOW] == D_CONSISTENT) {
+		drbd_info(peer_device, "Peer is on same UUID now\n");
+		change_peer_disk_state(peer_device, D_UP_TO_DATE, CS_VERBOSE, "receive-uuids");
+	}
 
 	if (updated_uuids)
-		drbd_print_uuids(device, "receiver updated UUIDs to");
+		drbd_print_uuids(peer_device, "receiver updated UUIDs to");
 
-	return 0;
+	peer_device->uuid_node_mask = node_mask;
+
+	if ((repl_state == L_SYNC_TARGET || repl_state == L_PAUSED_SYNC_T) &&
+	    !(peer_device->uuid_flags & UUID_FLAG_STABLE) &&
+	    !drbd_stable_sync_source_present(peer_device, NOW))
+		set_bit(UNSTABLE_RESYNC, &peer_device->flags);
+
+	/* send notification in case UUID flags have changed */
+	drbd_broadcast_peer_device_state(peer_device);
+
+	return err;
 }
 
-/**
- * convert_state() - Converts the peer's view of the cluster state to our point of view
- * @ps:		The state as seen by the peer.
- */
-static union drbd_state convert_state(union drbd_state ps)
+/* drbd 8.4 compat */
+static int receive_uuids(struct drbd_connection *connection, struct packet_info *pi)
 {
-	union drbd_state ms;
-
-	static enum drbd_conns c_tab[] = {
-		[C_WF_REPORT_PARAMS] = C_WF_REPORT_PARAMS,
-		[C_CONNECTED] = C_CONNECTED,
+	const int node_id = connection->resource->res_opts.node_id;
+	struct drbd_peer_device *peer_device;
+	struct p_uuids *p = pi->data;
+	int history_uuids, i;
 
-		[C_STARTING_SYNC_S] = C_STARTING_SYNC_T,
-		[C_STARTING_SYNC_T] = C_STARTING_SYNC_S,
-		[C_DISCONNECTING] = C_TEAR_DOWN, /* C_NETWORK_FAILURE, */
-		[C_VERIFY_S]       = C_VERIFY_T,
-		[C_MASK]   = C_MASK,
-	};
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return config_unknown_volume(connection, pi);
 
-	ms.i = ps.i;
+	history_uuids = min_t(int, HISTORY_UUIDS_V08,
+			      ARRAY_SIZE(peer_device->history_uuids));
 
-	ms.conn = c_tab[ps.conn];
-	ms.peer = ps.role;
-	ms.role = ps.peer;
-	ms.pdsk = ps.disk;
-	ms.disk = ps.pdsk;
-	ms.peer_isp = (ps.aftr_isp | ps.user_isp);
+	peer_device->current_uuid = be64_to_cpu(p->current_uuid);
+	peer_device->bitmap_uuids[node_id] = be64_to_cpu(p->bitmap_uuid);
+	for (i = 0; i < history_uuids; i++)
+		peer_device->history_uuids[i] = be64_to_cpu(p->history_uuids[i]);
+	for (; i < ARRAY_SIZE(peer_device->history_uuids); i++)
+		peer_device->history_uuids[i] = 0;
+	peer_device->dirty_bits = be64_to_cpu(p->dirty_bits);
+	peer_device->uuid_flags = be64_to_cpu(p->uuid_flags) | UUID_FLAG_STABLE;
+	set_bit(UUIDS_RECEIVED, &peer_device->flags);
 
-	return ms;
+	return __receive_uuids(peer_device, 0);
 }
 
-static int receive_req_state(struct drbd_connection *connection, struct packet_info *pi)
+static int receive_uuids110(struct drbd_connection *connection, struct packet_info *pi)
 {
 	struct drbd_peer_device *peer_device;
+	struct p_uuids110 *p = pi->data;
+	int bitmap_uuids, history_uuids, rest, i, pos, err;
+	u64 bitmap_uuids_mask, node_mask;
+	struct drbd_peer_md *peer_md = NULL;
 	struct drbd_device *device;
-	struct p_req_state *p = pi->data;
-	union drbd_state mask, val;
-	enum drbd_state_rv rv;
+	int not_allocated = -1;
+
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
-		return -EIO;
+		return config_unknown_volume(connection, pi);
+
 	device = peer_device->device;
+	bitmap_uuids_mask = be64_to_cpu(p->bitmap_uuids_mask);
+	if (bitmap_uuids_mask & ~(NODE_MASK(DRBD_PEERS_MAX) - 1))
+		return -EIO;
+	bitmap_uuids = hweight64(bitmap_uuids_mask);
+
+	if (pi->size / sizeof(p->other_uuids[0]) < bitmap_uuids)
+		return -EIO;
+	history_uuids = pi->size / sizeof(p->other_uuids[0]) - bitmap_uuids;
+	if (history_uuids > ARRAY_SIZE(peer_device->history_uuids))
+		history_uuids = ARRAY_SIZE(peer_device->history_uuids);
 
-	mask.i = be32_to_cpu(p->mask);
-	val.i = be32_to_cpu(p->val);
+	err = drbd_recv_into(connection, p->other_uuids,
+			     (bitmap_uuids + history_uuids) *
+			     sizeof(p->other_uuids[0]));
+	if (err)
+		return err;
 
-	if (test_bit(RESOLVE_CONFLICTS, &peer_device->connection->flags) &&
-	    mutex_is_locked(device->state_mutex)) {
-		drbd_send_sr_reply(peer_device, SS_CONCURRENT_ST_CHG);
-		return 0;
+	rest = pi->size - (bitmap_uuids + history_uuids) * sizeof(p->other_uuids[0]);
+	if (rest) {
+		err = ignore_remaining_packet(connection, rest);
+		if (err)
+			return err;
 	}
 
-	mask = convert_state(mask);
-	val = convert_state(val);
+	if (get_ldev(device)) {
+		peer_md = device->ldev->md.peers;
+		spin_lock_irq(&device->ldev->md.uuid_lock);
+	}
 
-	rv = drbd_change_state(device, CS_VERBOSE, mask, val);
-	drbd_send_sr_reply(peer_device, rv);
+	if (device->resource->role[NOW] != R_PRIMARY ||
+	    device->disk_state[NOW] != D_DISKLESS ||
+	    (peer_device->current_uuid & ~UUID_PRIMARY) !=
+						(device->exposed_data_uuid & ~UUID_PRIMARY) ||
+	    (peer_device->comm_current_uuid & ~UUID_PRIMARY) !=
+						(device->exposed_data_uuid & ~UUID_PRIMARY))
+		peer_device->current_uuid = be64_to_cpu(p->current_uuid);
 
-	drbd_md_sync(device);
+	peer_device->dirty_bits = be64_to_cpu(p->dirty_bits);
+	peer_device->uuid_flags = be64_to_cpu(p->uuid_flags);
+	if (peer_device->uuid_flags & UUID_FLAG_HAS_UNALLOC) {
+		not_allocated = peer_device->uuid_flags >> UUID_FLAG_UNALLOC_SHIFT;
+		peer_device->uuid_flags &= ~UUID_FLAG_UNALLOC_MASK;
+	}
 
-	return 0;
-}
+	pos = 0;
+	for (i = 0; i < ARRAY_SIZE(peer_device->bitmap_uuids); i++) {
+		u64 bitmap_uuid;
 
-static int receive_req_conn_state(struct drbd_connection *connection, struct packet_info *pi)
-{
-	struct p_req_state *p = pi->data;
-	union drbd_state mask, val;
-	enum drbd_state_rv rv;
+		if (bitmap_uuids_mask & NODE_MASK(i)) {
+			bitmap_uuid = be64_to_cpu(p->other_uuids[pos++]);
 
-	mask.i = be32_to_cpu(p->mask);
-	val.i = be32_to_cpu(p->val);
+			if (peer_md && !(peer_md[i].flags & MDF_HAVE_BITMAP) &&
+			    i != not_allocated)
+				peer_md[i].flags |= MDF_NODE_EXISTS;
+		} else {
+			bitmap_uuid = -1;
+		}
 
-	if (test_bit(RESOLVE_CONFLICTS, &connection->flags) &&
-	    mutex_is_locked(&connection->cstate_mutex)) {
-		conn_send_sr_reply(connection, SS_CONCURRENT_ST_CHG);
-		return 0;
+		update_bitmap_slot_of_peer(peer_device, i, bitmap_uuid);
 	}
 
-	mask = convert_state(mask);
-	val = convert_state(val);
-
-	rv = conn_request_state(connection, mask, val, CS_VERBOSE | CS_LOCAL_ONLY | CS_IGN_OUTD_FAIL);
-	conn_send_sr_reply(connection, rv);
+	for (i = 0; i < history_uuids; i++)
+		peer_device->history_uuids[i] = be64_to_cpu(p->other_uuids[pos++]);
+	while (i < ARRAY_SIZE(peer_device->history_uuids))
+		peer_device->history_uuids[i++] = 0;
+	set_bit(UUIDS_RECEIVED, &peer_device->flags);
+	if (peer_md) {
+		spin_unlock_irq(&device->ldev->md.uuid_lock);
+		put_ldev(device);
+	}
 
-	return 0;
-}
+	node_mask = be64_to_cpu(p->node_mask);
 
-static int receive_state(struct drbd_connection *connection, struct packet_info *pi)
-{
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct p_state *p = pi->data;
-	union drbd_state os, ns, peer_state;
-	enum drbd_disk_state real_peer_disk;
-	enum chg_state_flags cs_flags;
-	int rv;
+	if (peer_device->connection->peer_role[NOW] == R_PRIMARY &&
+	    peer_device->uuid_flags & UUID_FLAG_STABLE)
+		check_resync_source(device, node_mask);
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return config_unknown_volume(connection, pi);
-	device = peer_device->device;
+	err = __receive_uuids(peer_device, node_mask);
 
-	peer_state.i = be32_to_cpu(p->state);
+	if (!test_bit(RECONCILIATION_RESYNC, &peer_device->flags)) {
+		if (peer_device->uuid_flags & UUID_FLAG_GOT_STABLE) {
+			struct drbd_device *device = peer_device->device;
 
-	real_peer_disk = peer_state.disk;
-	if (peer_state.disk == D_NEGOTIATING) {
-		real_peer_disk = device->p_uuid[UI_FLAGS] & 4 ? D_INCONSISTENT : D_CONSISTENT;
-		drbd_info(device, "real peer disk state = %s\n", drbd_disk_str(real_peer_disk));
-	}
+			if (peer_device->repl_state[NOW] == L_ESTABLISHED &&
+			    drbd_device_stable(device, NULL) && get_ldev(device)) {
+				drbd_send_uuids(peer_device, UUID_FLAG_RESYNC, 0);
+				drbd_resync(peer_device, AFTER_UNSTABLE);
+				put_ldev(device);
+			}
+		}
 
-	spin_lock_irq(&device->resource->req_lock);
- retry:
-	os = ns = drbd_read_state(device);
-	spin_unlock_irq(&device->resource->req_lock);
+		if (peer_device->uuid_flags & UUID_FLAG_RESYNC) {
+			if (get_ldev(device)) {
+				bool dp = peer_device->uuid_flags & UUID_FLAG_DISKLESS_PRIMARY;
+				drbd_resync(peer_device, dp ? DISKLESS_PRIMARY : AFTER_UNSTABLE);
+				put_ldev(device);
+			}
+		}
+	}
 
-	/* If some other part of the code (ack_receiver thread, timeout)
-	 * already decided to close the connection again,
-	 * we must not "re-establish" it here. */
-	if (os.conn <= C_TEAR_DOWN)
-		return -ECONNRESET;
+	return err;
+}
 
-	/* If this is the "end of sync" confirmation, usually the peer disk
-	 * transitions from D_INCONSISTENT to D_UP_TO_DATE. For empty (0 bits
-	 * set) resync started in PausedSyncT, or if the timing of pause-/
-	 * unpause-sync events has been "just right", the peer disk may
-	 * transition from D_CONSISTENT to D_UP_TO_DATE as well.
-	 */
-	if ((os.pdsk == D_INCONSISTENT || os.pdsk == D_CONSISTENT) &&
-	    real_peer_disk == D_UP_TO_DATE &&
-	    os.conn > C_CONNECTED && os.disk == D_UP_TO_DATE) {
-		/* If we are (becoming) SyncSource, but peer is still in sync
-		 * preparation, ignore its uptodate-ness to avoid flapping, it
-		 * will change to inconsistent once the peer reaches active
-		 * syncing states.
-		 * It may have changed syncer-paused flags, however, so we
-		 * cannot ignore this completely. */
-		if (peer_state.conn > C_CONNECTED &&
-		    peer_state.conn < C_SYNC_SOURCE)
-			real_peer_disk = D_INCONSISTENT;
+/**
+ * check_resync_source() - Abort resync if the source is weak
+ * @device: The device to check
+ * @weak_nodes: Mask of currently weak nodes in the cluster
+ *
+ * If a primary loses connection to a SYNC_SOURCE node from us, then we
+ * need to abort that resync. Why?
+ *
+ * When the primary sends a write, we get that and write that as well. With
+ * the peer_ack packet, we will set that as out-of-sync towards the sync
+ * source node.
+ * When the resync process finds such bits, we request outdated
+ * data from the sync source!
+ * We are stopping the resync from such an outdated source here and waiting
+ * until all the resync activity has drained (P_RS_DATA_REPLY packets).
+ */
+static void check_resync_source(struct drbd_device *device, u64 weak_nodes)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_connection *connection;
 
-		/* if peer_state changes to connected at the same time,
-		 * it explicitly notifies us that it finished resync.
-		 * Maybe we should finish it up, too? */
-		else if (os.conn >= C_SYNC_SOURCE &&
-			 peer_state.conn == C_CONNECTED) {
-			if (drbd_bm_total_weight(device) <= device->rs_failed)
-				drbd_resync_finished(peer_device);
-			return 0;
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+		if ((repl_state == L_SYNC_TARGET || repl_state == L_PAUSED_SYNC_T) &&
+		    NODE_MASK(peer_device->node_id) & weak_nodes) {
+			rcu_read_unlock();
+			goto abort;
 		}
 	}
+	rcu_read_unlock();
+	return;
+abort:
+	connection = peer_device->connection;
+	drbd_info(peer_device, "My sync source became a weak node, aborting resync!\n");
+	change_repl_state(peer_device, L_ESTABLISHED, CS_VERBOSE, "abort-resync");
+	drbd_flush_workqueue(&connection->sender_work);
+	drbd_cancel_conflicting_resync_requests(peer_device);
 
-	/* explicit verify finished notification, stop sector reached. */
-	if (os.conn == C_VERIFY_T && os.disk == D_UP_TO_DATE &&
-	    peer_state.conn == C_CONNECTED && real_peer_disk == D_UP_TO_DATE) {
-		ov_out_of_sync_print(peer_device);
-		drbd_resync_finished(peer_device);
-		return 0;
-	}
+	wait_event_interruptible(connection->ee_wait,
+				 peer_device->repl_state[NOW] <= L_ESTABLISHED ||
+				 atomic_read(&connection->backing_ee_cnt) == 0);
+	wait_event_interruptible(device->misc_wait,
+				 peer_device->repl_state[NOW] <= L_ESTABLISHED ||
+				 atomic_read(&peer_device->rs_pending_cnt) == 0);
 
-	/* peer says his disk is inconsistent, while we think it is uptodate,
-	 * and this happens while the peer still thinks we have a sync going on,
-	 * but we think we are already done with the sync.
-	 * We ignore this to avoid flapping pdsk.
-	 * This should not happen, if the peer is a recent version of drbd. */
-	if (os.pdsk == D_UP_TO_DATE && real_peer_disk == D_INCONSISTENT &&
-	    os.conn == C_CONNECTED && peer_state.conn > C_SYNC_SOURCE)
-		real_peer_disk = D_UP_TO_DATE;
+	peer_device->rs_total  = 0;
+	peer_device->rs_failed = 0;
+	peer_device->rs_paused = 0;
+}
 
-	if (ns.conn == C_WF_REPORT_PARAMS)
-		ns.conn = C_CONNECTED;
+/**
+ * convert_state() - Converts the peer's view of the cluster state to our point of view
+ * @peer_state:	The state as seen by the peer.
+ */
+static union drbd_state convert_state(union drbd_state peer_state)
+{
+	union drbd_state state;
 
-	if (peer_state.conn == C_AHEAD)
-		ns.conn = C_BEHIND;
+	static unsigned int c_tab[] = {
+		[L_OFF] = L_OFF,
+		[L_ESTABLISHED] = L_ESTABLISHED,
 
-	/* TODO:
-	 * if (primary and diskless and peer uuid != effective uuid)
-	 *     abort attach on peer;
-	 *
-	 * If this node does not have good data, was already connected, but
-	 * the peer did a late attach only now, trying to "negotiate" with me,
-	 * AND I am currently Primary, possibly frozen, with some specific
-	 * "effective" uuid, this should never be reached, really, because
-	 * we first send the uuids, then the current state.
-	 *
-	 * In this scenario, we already dropped the connection hard
-	 * when we received the unsuitable uuids (receive_uuids().
-	 *
-	 * Should we want to change this, that is: not drop the connection in
-	 * receive_uuids() already, then we would need to add a branch here
-	 * that aborts the attach of "unsuitable uuids" on the peer in case
-	 * this node is currently Diskless Primary.
-	 */
+		[L_STARTING_SYNC_S] = L_STARTING_SYNC_T,
+		[L_STARTING_SYNC_T] = L_STARTING_SYNC_S,
+		[L_WF_BITMAP_S] = L_WF_BITMAP_T,
+		[L_WF_BITMAP_T] = L_WF_BITMAP_S,
+		[C_DISCONNECTING] = C_TEAR_DOWN, /* C_NETWORK_FAILURE, */
+		[C_CONNECTING] = C_CONNECTING,
+		[L_VERIFY_S] = L_VERIFY_T,
+		[C_MASK] = C_MASK,
+	};
 
-	if (device->p_uuid && peer_state.disk >= D_NEGOTIATING &&
-	    get_ldev_if_state(device, D_NEGOTIATING)) {
-		int cr; /* consider resync */
+	state.i = peer_state.i;
 
-		/* if we established a new connection */
-		cr  = (os.conn < C_CONNECTED);
-		/* if we had an established connection
-		 * and one of the nodes newly attaches a disk */
-		cr |= (os.conn == C_CONNECTED &&
-		       (peer_state.disk == D_NEGOTIATING ||
-			os.disk == D_NEGOTIATING));
-		/* if we have both been inconsistent, and the peer has been
-		 * forced to be UpToDate with --force */
-		cr |= test_bit(CONSIDER_RESYNC, &device->flags);
-		/* if we had been plain connected, and the admin requested to
-		 * start a sync by "invalidate" or "invalidate-remote" */
-		cr |= (os.conn == C_CONNECTED &&
-				(peer_state.conn >= C_STARTING_SYNC_S &&
-				 peer_state.conn <= C_WF_BITMAP_T));
+	state.conn = c_tab[peer_state.conn];
+	state.peer = peer_state.role;
+	state.role = peer_state.peer;
+	state.pdsk = peer_state.disk;
+	state.disk = peer_state.pdsk;
+	state.peer_isp = (peer_state.aftr_isp | peer_state.user_isp);
 
-		if (cr)
-			ns.conn = drbd_sync_handshake(peer_device, peer_state.role, real_peer_disk);
+	return state;
+}
 
-		put_ldev(device);
-		if (ns.conn == C_MASK) {
-			ns.conn = C_CONNECTED;
-			if (device->state.disk == D_NEGOTIATING) {
-				drbd_force_state(device, NS(disk, D_FAILED));
-			} else if (peer_state.disk == D_NEGOTIATING) {
-				drbd_err(device, "Disk attach process on the peer node was aborted.\n");
-				peer_state.disk = D_DISKLESS;
-				real_peer_disk = D_DISKLESS;
-			} else {
-				if (test_and_clear_bit(CONN_DRY_RUN, &peer_device->connection->flags))
-					return -EIO;
-				D_ASSERT(device, os.conn == C_WF_REPORT_PARAMS);
-				conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
-				return -EIO;
-			}
-		}
-	}
+static enum drbd_state_rv
+__change_connection_state(struct drbd_connection *connection,
+			  union drbd_state mask, union drbd_state val,
+			  enum chg_state_flags flags)
+{
+	struct drbd_resource *resource = connection->resource;
 
-	spin_lock_irq(&device->resource->req_lock);
-	if (os.i != drbd_read_state(device).i)
-		goto retry;
-	clear_bit(CONSIDER_RESYNC, &device->flags);
-	ns.peer = peer_state.role;
-	ns.pdsk = real_peer_disk;
-	ns.peer_isp = (peer_state.aftr_isp | peer_state.user_isp);
-	if ((ns.conn == C_CONNECTED || ns.conn == C_WF_BITMAP_S) && ns.disk == D_NEGOTIATING)
-		ns.disk = device->new_state_tmp.disk;
-	cs_flags = CS_VERBOSE + (os.conn < C_CONNECTED && ns.conn >= C_CONNECTED ? 0 : CS_HARD);
-	if (ns.pdsk == D_CONSISTENT && drbd_suspended(device) && ns.conn == C_CONNECTED && os.conn < C_CONNECTED &&
-	    test_bit(NEW_CUR_UUID, &device->flags)) {
-		/* Do not allow tl_restart(RESEND) for a rebooted peer. We can only allow this
-		   for temporal network outages! */
-		spin_unlock_irq(&device->resource->req_lock);
-		drbd_err(device, "Aborting Connect, can not thaw IO with an only Consistent peer\n");
-		tl_clear(peer_device->connection);
-		drbd_uuid_new_current(device);
-		clear_bit(NEW_CUR_UUID, &device->flags);
-		conn_request_state(peer_device->connection, NS2(conn, C_PROTOCOL_ERROR, susp, 0), CS_HARD);
-		return -EIO;
+	if (mask.role) {
+		/* not allowed */
+	}
+	if (mask.susp) {
+		mask.susp ^= -1;
+		__change_io_susp_user(resource, val.susp);
+	}
+	if (mask.susp_nod) {
+		mask.susp_nod ^= -1;
+		__change_io_susp_no_data(resource, val.susp_nod);
+	}
+	if (mask.susp_fen) {
+		mask.susp_fen ^= -1;
+		__change_io_susp_fencing(connection, val.susp_fen);
+	}
+	if (mask.disk) {
+		/* Handled in __change_peer_device_state(). */
+		mask.disk ^= -1;
 	}
-	rv = _drbd_set_state(device, ns, cs_flags, NULL);
-	ns = drbd_read_state(device);
-	spin_unlock_irq(&device->resource->req_lock);
+	if (mask.conn) {
+		mask.conn ^= -1;
+		__change_cstate(connection,
+				min_t(enum drbd_conn_state, val.conn, C_CONNECTED));
+	}
+	if (mask.pdsk) {
+		/* Handled in __change_peer_device_state(). */
+		mask.pdsk ^= -1;
+	}
+	if (mask.peer) {
+		mask.peer ^= -1;
+		__change_peer_role(connection, val.peer);
+	}
+	if (mask.i) {
+		drbd_info(connection, "Remote state change: request %u/%u not "
+		"understood\n", mask.i, val.i & mask.i);
+		return SS_NOT_SUPPORTED;
+	}
+	return SS_SUCCESS;
+}
 
-	if (rv < SS_SUCCESS) {
-		conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
-		return -EIO;
+static enum drbd_state_rv
+__change_peer_device_state(struct drbd_peer_device *peer_device,
+			   union drbd_state mask, union drbd_state val)
+{
+	struct drbd_device *device = peer_device->device;
+
+	if (mask.peer) {
+		/* Handled in __change_connection_state(). */
+		mask.peer ^= -1;
+	}
+	if (mask.disk) {
+		mask.disk ^= -1;
+		__change_disk_state(device, val.disk);
 	}
 
-	if (os.conn > C_WF_REPORT_PARAMS) {
-		if (ns.conn > C_CONNECTED && peer_state.conn <= C_CONNECTED &&
-		    peer_state.disk != D_NEGOTIATING ) {
-			/* we want resync, peer has not yet decided to sync... */
-			/* Nowadays only used when forcing a node into primary role and
-			   setting its disk to UpToDate with that */
-			drbd_send_uuids(peer_device);
-			drbd_send_current_state(peer_device);
-		}
+	if (mask.conn) {
+		mask.conn ^= -1;
+		__change_repl_state(peer_device,
+				max_t(enum drbd_repl_state, val.conn, L_OFF));
 	}
+	if (mask.pdsk) {
+		mask.pdsk ^= -1;
+		__change_peer_disk_state(peer_device, val.pdsk);
+	}
+	if (mask.user_isp) {
+		mask.user_isp ^= -1;
+		__change_resync_susp_user(peer_device, val.user_isp);
+	}
+	if (mask.peer_isp) {
+		mask.peer_isp ^= -1;
+		__change_resync_susp_peer(peer_device, val.peer_isp);
+	}
+	if (mask.aftr_isp) {
+		mask.aftr_isp ^= -1;
+		__change_resync_susp_dependency(peer_device, val.aftr_isp);
+	}
+	if (mask.i) {
+		drbd_info(peer_device, "Remote state change: request %u/%u not "
+		"understood\n", mask.i, val.i & mask.i);
+		return SS_NOT_SUPPORTED;
+	}
+	return SS_SUCCESS;
+}
 
-	clear_bit(DISCARD_MY_DATA, &device->flags);
+static union drbd_state
+sanitize_outdate(struct drbd_peer_device *peer_device,
+		 union drbd_state mask,
+		 union drbd_state val)
+{
+	struct drbd_device *device = peer_device->device;
+	union drbd_state result_mask = mask;
 
-	drbd_md_sync(device); /* update connected indicator, la_size_sect, ... */
+	if (val.pdsk == D_OUTDATED && peer_device->disk_state[NEW] < D_OUTDATED)
+		result_mask.pdsk = 0;
+	if (val.disk == D_OUTDATED && device->disk_state[NEW] < D_OUTDATED)
+		result_mask.disk = 0;
 
-	return 0;
+	return result_mask;
 }
 
-static int receive_sync_uuid(struct drbd_connection *connection, struct packet_info *pi)
+static void log_openers(struct drbd_resource *resource)
 {
-	struct drbd_peer_device *peer_device;
 	struct drbd_device *device;
-	struct p_rs_uuid *p = pi->data;
+	int vnr;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		struct opener *opener;
 
-	wait_event(device->misc_wait,
-		   device->state.conn == C_WF_SYNC_UUID ||
-		   device->state.conn == C_BEHIND ||
-		   device->state.conn < C_CONNECTED ||
-		   device->state.disk < D_NEGOTIATING);
+		spin_lock(&device->openers_lock);
+		opener = list_first_entry_or_null(&device->openers, struct opener, list);
+		if (opener)
+			drbd_warn(device, "Held open by %s(%d)\n", opener->comm, opener->pid);
+		spin_unlock(&device->openers_lock);
+	}
+	rcu_read_unlock();
+}
 
-	/* D_ASSERT(device,  device->state.conn == C_WF_SYNC_UUID ); */
+/**
+ * change_connection_state()  -  change state of a connection and all its peer devices
+ * @connection: DRBD connection to operate on
+ * @state_change: Prepared state change
+ * @reply: Two phase commit reply
+ * @flags: State change flags
+ *
+ * Also changes the state of the peer devices' devices and of the resource.
+ * Cluster-wide state changes are not supported.
+ */
+static enum drbd_state_rv
+change_connection_state(struct drbd_connection *connection,
+			struct twopc_state_change *state_change,
+			struct twopc_reply *reply,
+			enum chg_state_flags flags)
+{
+	struct drbd_resource *resource = connection->resource;
+	long t = resource->res_opts.auto_promote_timeout * HZ / 10;
+	union drbd_state mask = state_change->mask;
+	union drbd_state val = state_change->val;
+	bool is_disconnect = false;
+	bool is_connect = false;
+	bool abort = flags & CS_ABORT;
+	struct drbd_peer_device *peer_device;
+	unsigned long irq_flags;
+	enum drbd_state_rv rv;
+	int vnr;
 
-	/* Here the _drbd_uuid_ functions are right, current should
-	   _not_ be rotated into the history */
-	if (get_ldev_if_state(device, D_NEGOTIATING)) {
-		_drbd_uuid_set(device, UI_CURRENT, be64_to_cpu(p->uuid));
-		_drbd_uuid_set(device, UI_BITMAP, 0UL);
+	if (reply) {
+		is_disconnect = reply->is_disconnect;
+		is_connect = reply->is_connect;
+	} else if (mask.conn == conn_MASK) {
+		is_connect = val.conn == C_CONNECTED;
+		is_disconnect = val.conn == C_DISCONNECTING;
+	}
 
-		drbd_print_uuids(device, "updated sync uuid");
-		drbd_start_resync(device, C_SYNC_TARGET);
+	mask = convert_state(mask);
+	val = convert_state(val);
 
-		put_ldev(device);
-	} else
-		drbd_err(device, "Ignoring SyncUUID packet!\n");
+	if (is_connect && connection->agreed_pro_version >= 118) {
+		if (flags & CS_PREPARE)
+			conn_connect2(connection);
+		if (abort)
+			abort_connect(connection);
+	}
+retry:
+	begin_state_change(resource, &irq_flags, flags & ~CS_VERBOSE);
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		union drbd_state l_mask;
+		l_mask = is_disconnect ? sanitize_outdate(peer_device, mask, val) : mask;
+		rv = __change_peer_device_state(peer_device, l_mask, val);
+		if (rv < SS_SUCCESS)
+			goto fail;
+	}
+	rv = __change_connection_state(connection, mask, val, flags);
+	if (rv < SS_SUCCESS)
+		goto fail;
 
-	return 0;
+	if (reply && !abort) {
+		u64 directly_reachable = directly_connected_nodes(resource, NEW) |
+			NODE_MASK(resource->res_opts.node_id);
+
+		if (reply->primary_nodes & ~directly_reachable)
+			__outdate_myself(resource);
+	}
+
+	if (is_connect && connection->agreed_pro_version >= 117)
+		apply_connect(connection, (flags & CS_PREPARED) && !abort);
+	rv = end_state_change(resource, &irq_flags, "remote");
+out:
+
+	if ((rv == SS_NO_UP_TO_DATE_DISK && resource->role[NOW] != R_PRIMARY) ||
+	    rv == SS_PRIMARY_READER) {
+		/* Most probably udev opened it read-only. That might happen
+		   if it was demoted very recently. Wait up to one second. */
+		t = wait_event_interruptible_timeout(resource->state_wait,
+						     drbd_open_ro_count(resource) == 0,
+						     t);
+		if (t > 0)
+			goto retry;
+	}
+
+	if (rv < SS_SUCCESS) {
+		drbd_err(resource, "State change failed: %s (%d)\n", drbd_set_st_err_str(rv), rv);
+		if (rv == SS_PRIMARY_READER)
+			log_openers(resource);
+	}
+
+	return rv;
+fail:
+	abort_state_change(resource, &irq_flags);
+	goto out;
 }
 
-/*
- * receive_bitmap_plain
+/**
+ * change_peer_device_state()  -  change state of a peer and its connection
+ * @peer_device: DRBD peer device
+ * @state_change: Prepared state change
+ * @flags: State change flags
  *
- * Return 0 when done, 1 when another iteration is needed, and a negative error
- * code upon failure.
+ * Also changes the state of the peer device's device and of the resource.
+ * Cluster-wide state changes are not supported.
  */
-static int
-receive_bitmap_plain(struct drbd_peer_device *peer_device, unsigned int size,
-		     unsigned long *p, struct bm_xfer_ctx *c)
+static enum drbd_state_rv
+change_peer_device_state(struct drbd_peer_device *peer_device,
+			 struct twopc_state_change *state_change,
+			 enum chg_state_flags flags)
 {
-	unsigned int data_size = DRBD_SOCKET_BUFFER_SIZE -
-				 drbd_header_size(peer_device->connection);
-	unsigned int num_words = min_t(size_t, data_size / sizeof(*p),
-				       c->bm_words - c->word_offset);
-	unsigned int want = num_words * sizeof(*p);
-	int err;
+	struct drbd_connection *connection = peer_device->connection;
+	union drbd_state mask = state_change->mask;
+	union drbd_state val = state_change->val;
+	unsigned long irq_flags;
+	enum drbd_state_rv rv;
 
-	if (want != size) {
-		drbd_err(peer_device, "%s:want (%u) != size (%u)\n", __func__, want, size);
+	mask = convert_state(mask);
+	val = convert_state(val);
+
+	begin_state_change(connection->resource, &irq_flags, flags);
+	rv = __change_peer_device_state(peer_device, mask, val);
+	if (rv < SS_SUCCESS)
+		goto fail;
+	rv = __change_connection_state(connection, mask, val, flags);
+	if (rv < SS_SUCCESS)
+		goto fail;
+	rv = end_state_change(connection->resource, &irq_flags, "remote");
+out:
+	return rv;
+fail:
+	abort_state_change(connection->resource, &irq_flags);
+	goto out;
+}
+
+static int receive_req_state(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct twopc_state_change *state_change = &resource->twopc.state_change;
+	struct drbd_peer_device *peer_device = NULL;
+	struct p_req_state *p = pi->data;
+	enum chg_state_flags flags = CS_VERBOSE | CS_LOCAL_ONLY | CS_TWOPC;
+	enum drbd_state_rv rv;
+	int vnr = -1;
+
+	if (!expect(connection, connection->agreed_pro_version < 110)) {
+		drbd_err(connection, "Packet %s not allowed in protocol version %d\n",
+			 drbd_packet_name(pi->cmd),
+			 connection->agreed_pro_version);
 		return -EIO;
 	}
-	if (want == 0)
+
+	state_change->mask.i = be32_to_cpu(p->mask);
+	state_change->val.i = be32_to_cpu(p->val);
+
+	/* P_STATE_CHG_REQ packets must have a valid vnr.  P_CONN_ST_CHG_REQ
+	 * packets have an undefined vnr. */
+	if (pi->cmd == P_STATE_CHG_REQ) {
+		peer_device = conn_peer_device(connection, pi->vnr);
+		if (!peer_device) {
+			const union drbd_state conn_mask = { .conn = conn_MASK };
+			const union drbd_state val_off = { .conn = L_OFF };
+
+			if (state_change->mask.i == conn_mask.i &&
+			    state_change->val.i == val_off.i) {
+				/* The peer removed this volume, we do not have it... */
+				drbd_send_sr_reply(connection, vnr, SS_NOTHING_TO_DO);
+				return 0;
+			}
+
+			return -EIO;
+		}
+		vnr = peer_device->device->vnr;
+	}
+
+	rv = SS_SUCCESS;
+	write_lock_irq(&resource->state_rwlock);
+	if (resource->remote_state_change)
+		rv = SS_CONCURRENT_ST_CHG;
+	else
+		resource->remote_state_change = true;
+	write_unlock_irq(&resource->state_rwlock);
+
+	if (rv != SS_SUCCESS) {
+		drbd_info(connection, "Rejecting concurrent remote state change\n");
+		drbd_send_sr_reply(connection, vnr, rv);
 		return 0;
-	err = drbd_recv_all(peer_device->connection, p, want);
-	if (err)
-		return err;
+	}
 
-	drbd_bm_merge_lel(peer_device->device, c->word_offset, num_words, p);
+	/* Send the reply before carrying out the state change: this is needed
+	 * for connection state changes which close the network connection.  */
+	if (peer_device) {
+		rv = change_peer_device_state(peer_device, state_change, flags | CS_PREPARE);
+		drbd_send_sr_reply(connection, vnr, rv);
+		rv = change_peer_device_state(peer_device, state_change, flags | CS_PREPARED);
+		if (rv >= SS_SUCCESS)
+			drbd_md_sync_if_dirty(peer_device->device);
+	} else {
+		flags |= CS_IGN_OUTD_FAIL;
+		rv = change_connection_state(connection, state_change, NULL, flags | CS_PREPARE);
+		drbd_send_sr_reply(connection, vnr, rv);
+		change_connection_state(connection, state_change, NULL, flags | CS_PREPARED);
+	}
 
-	c->word_offset += num_words;
-	c->bit_offset = c->word_offset * BITS_PER_LONG;
-	if (c->bit_offset > c->bm_bits)
-		c->bit_offset = c->bm_bits;
+	write_lock_irq(&resource->state_rwlock);
+	resource->remote_state_change = false;
+	write_unlock_irq(&resource->state_rwlock);
+	wake_up_all(&resource->twopc_wait);
 
-	return 1;
+	return 0;
 }
 
-static enum drbd_bitmap_code dcbp_get_code(struct p_compressed_bm *p)
+static void drbd_abort_twopc(struct drbd_resource *resource)
 {
-	return (enum drbd_bitmap_code)(p->encoding & 0x0f);
+	struct drbd_connection *connection;
+	int initiator_node_id;
+	bool is_connect;
+
+	initiator_node_id = resource->twopc_reply.initiator_node_id;
+	if (initiator_node_id != -1) {
+		connection = drbd_get_connection_by_node_id(resource, initiator_node_id);
+		is_connect = resource->twopc_reply.is_connect &&
+			resource->twopc_reply.target_node_id == resource->res_opts.node_id;
+		resource->remote_state_change = false;
+		resource->twopc_reply.initiator_node_id = -1;
+		resource->twopc_parent_nodes = 0;
+
+		if (connection) {
+			if (is_connect)
+				abort_connect(connection);
+			kref_put(&connection->kref, drbd_destroy_connection);
+			connection = NULL;
+		}
+
+		/* Aborting a prepared state change. Give up the state mutex! */
+		up(&resource->state_sem);
+	}
+
+	wake_up_all(&resource->twopc_wait);
 }
 
-static int dcbp_get_start(struct p_compressed_bm *p)
+void twopc_timer_fn(struct timer_list *t)
 {
-	return (p->encoding & 0x80) != 0;
+	struct drbd_resource *resource = timer_container_of(resource, t, twopc_timer);
+	unsigned long irq_flags;
+
+	write_lock_irqsave(&resource->state_rwlock, irq_flags);
+	if (!test_bit(TWOPC_WORK_PENDING, &resource->flags)) {
+		drbd_err(resource, "Two-phase commit %u timeout\n",
+			   resource->twopc_reply.tid);
+		drbd_abort_twopc(resource);
+	} else {
+		mod_timer(&resource->twopc_timer, jiffies + HZ/10);
+	}
+	write_unlock_irqrestore(&resource->state_rwlock, irq_flags);
 }
 
-static int dcbp_get_pad_bits(struct p_compressed_bm *p)
+bool drbd_have_local_disk(struct drbd_resource *resource)
 {
-	return (p->encoding >> 4) & 0x7;
+	struct drbd_device *device;
+	int vnr;
+
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		if (device->disk_state[NOW] > D_DISKLESS) {
+			rcu_read_unlock();
+			return true;
+		}
+	}
+	rcu_read_unlock();
+	return false;
 }
 
-/*
- * recv_bm_rle_bits
- *
- * Return 0 when done, 1 when another iteration is needed, and a negative error
- * code upon failure.
- */
-static int
-recv_bm_rle_bits(struct drbd_peer_device *peer_device,
-		struct p_compressed_bm *p,
-		 struct bm_xfer_ctx *c,
-		 unsigned int len)
+static enum drbd_state_rv
+far_away_change(struct drbd_connection *connection,
+		struct twopc_request *request,
+		struct twopc_reply *reply,
+		enum chg_state_flags flags)
 {
-	struct bitstream bs;
-	u64 look_ahead;
-	u64 rl;
-	u64 tmp;
-	unsigned long s = c->bit_offset;
-	unsigned long e;
-	int toggle = dcbp_get_start(p);
-	int have;
-	int bits;
+	struct drbd_resource *resource = connection->resource;
+	struct twopc_state_change *state_change = &resource->twopc.state_change;
+	u64 directly_reachable = directly_connected_nodes(resource, NOW) |
+		NODE_MASK(resource->res_opts.node_id);
+	union drbd_state mask = state_change->mask;
+	union drbd_state val = state_change->val;
+	int vnr = resource->twopc_reply.vnr;
+	struct drbd_device *device;
+	unsigned long irq_flags;
+	int iterate_vnr;
 
-	bitstream_init(&bs, p->code, len, dcbp_get_pad_bits(p));
 
-	bits = bitstream_get_bits(&bs, &look_ahead, 64);
-	if (bits < 0)
-		return -EIO;
+	if (flags & CS_PREPARE && mask.role == role_MASK && val.role == R_PRIMARY &&
+	    resource->role[NOW] == R_PRIMARY) {
+		struct net_conf *nc;
+		bool two_primaries_allowed = false;
 
-	for (have = bits; have > 0; s += rl, toggle = !toggle) {
-		bits = vli_decode_bits(&rl, look_ahead);
-		if (bits <= 0)
-			return -EIO;
+		rcu_read_lock();
+		nc = rcu_dereference(connection->transport.net_conf);
+		if (nc)
+			two_primaries_allowed = nc->two_primaries;
+		rcu_read_unlock();
+		if (!two_primaries_allowed)
+			return SS_TWO_PRIMARIES;
 
-		if (toggle) {
-			e = s + rl -1;
-			if (e >= c->bm_bits) {
-				drbd_err(peer_device, "bitmap overflow (e:%lu) while decoding bm RLE packet\n", e);
-				return -EIO;
+		/* A node further away wants to become primary. In case I am primary allow it only
+		 * when I am diskless. See also check_primaries_distances() in drbd_state.c
+		 */
+		if (drbd_have_local_disk(resource))
+			return SS_WEAKLY_CONNECTED;
+	}
+
+	begin_state_change(resource, &irq_flags, flags);
+	if (mask.i == 0 && val.i == 0 &&
+	    resource->role[NOW] == R_PRIMARY && vnr == -1) {
+		/* A node far away test if there are primaries. I am the guy he is concerned
+		 * about... He learned about me in the CS_PREPARE phase. Since he is committing it
+		 * I know that he is outdated now...
+		 */
+		struct drbd_connection *affected_connection;
+		int initiator_node_id = resource->twopc_reply.initiator_node_id;
+
+		affected_connection = drbd_get_connection_by_node_id(resource, initiator_node_id);
+		if (affected_connection) {
+			__downgrade_peer_disk_states(affected_connection, D_OUTDATED);
+			kref_put(&affected_connection->kref, drbd_destroy_connection);
+		} else if (flags & CS_PREPARED) {
+			idr_for_each_entry(&resource->devices, device, iterate_vnr) {
+				struct drbd_peer_md *peer_md;
+
+				if (!get_ldev(device))
+					continue;
+
+				peer_md = &device->ldev->md.peers[initiator_node_id];
+				peer_md->flags |= MDF_PEER_OUTDATED;
+				put_ldev(device);
+				drbd_md_mark_dirty(device);
 			}
-			_drbd_bm_set_bits(peer_device->device, s, e);
 		}
+	}
 
-		if (have < bits) {
-			drbd_err(peer_device, "bitmap decoding error: h:%d b:%d la:0x%08llx l:%u/%u\n",
-				have, bits, look_ahead,
-				(unsigned int)(bs.cur.b - p->code),
-				(unsigned int)bs.buf_len);
-			return -EIO;
-		}
-		/* if we consumed all 64 bits, assign 0; >> 64 is "undefined"; */
-		if (likely(bits < 64))
-			look_ahead >>= bits;
-		else
-			look_ahead = 0;
-		have -= bits;
+	if (state_change->primary_nodes & ~directly_reachable &&
+	    !(request->flags & TWOPC_PRI_INCAPABLE))
+		__outdate_myself(resource);
 
-		bits = bitstream_get_bits(&bs, &tmp, 64 - have);
-		if (bits < 0)
-			return -EIO;
-		look_ahead |= tmp << have;
-		have += bits;
+	idr_for_each_entry(&resource->devices, device, iterate_vnr) {
+		if (test_bit(OUTDATE_ON_2PC_COMMIT, &device->flags) &&
+		    device->disk_state[NEW] > D_OUTDATED)
+			__change_disk_state(device, D_OUTDATED);
 	}
 
-	c->bit_offset = s;
-	bm_xfer_ctx_bit_to_word_offset(c);
+	/* even if no outdate happens, CS_FORCE_RECALC might be set here */
+	return end_state_change(resource, &irq_flags, "far-away");
+}
+
+static void handle_neighbor_demotion(struct drbd_connection *connection,
+				     struct twopc_state_change *state_change,
+				     struct twopc_reply *reply)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_device *device;
+	int vnr;
+
+	if (reply->initiator_node_id != connection->peer_node_id ||
+	    connection->peer_role[NOW] != R_PRIMARY ||
+	    state_change->mask.role != role_MASK || state_change->val.role != R_SECONDARY)
+		return;
+
+	/* A directly connected neighbor that was primary demotes to secondary */
+
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		kref_get(&device->kref);
+		rcu_read_unlock();
+		if (get_ldev(device)) {
+			drbd_bitmap_io(device, &drbd_bm_write, "peer demote",
+				       BM_LOCK_SET | BM_LOCK_CLEAR | BM_LOCK_BULK, NULL);
+			put_ldev(device);
+		}
+		rcu_read_lock();
+		kref_put(&device->kref, drbd_destroy_device);
+	}
+	rcu_read_unlock();
+}
 
-	return (s != c->bm_bits);
+static void peer_device_init_connect_state(struct drbd_peer_device *peer_device)
+{
+	clear_bit(INITIAL_STATE_SENT, &peer_device->flags);
+	clear_bit(INITIAL_STATE_RECEIVED, &peer_device->flags);
+	clear_bit(HAVE_SIZES, &peer_device->flags);
+	clear_bit(UUIDS_RECEIVED, &peer_device->flags);
+	clear_bit(CURRENT_UUID_RECEIVED, &peer_device->flags);
+	clear_bit(PEER_QUORATE, &peer_device->flags);
+	peer_device->connect_state = (union drbd_state) {{ .disk = D_MASK }};
 }
 
-/*
- * decode_bitmap_c
+
+/**
+ * drbd_init_connect_state() - Prepare twopc that establishes the connection
+ * @connection:	The connection this is about
  *
- * Return 0 when done, 1 when another iteration is needed, and a negative error
- * code upon failure.
+ * After a transport implementation has established the lower-level aspects
+ * of a connection, DRBD executes a two-phase commit so that the membership
+ * information changes in a cluster-wide, consistent way. During that
+ * two-phase commit, DRBD exchanges the UUIDs, size information, and the
+ * initial state. A two-phase commit might be aborted, which needs to be
+ * retried. This function re-initializes the struct members for this. The
+ * callsites are at the beginning of a two-phase connect commit, active and
+ * passive side.
  */
-static int
-decode_bitmap_c(struct drbd_peer_device *peer_device,
-		struct p_compressed_bm *p,
-		struct bm_xfer_ctx *c,
-		unsigned int len)
+void drbd_init_connect_state(struct drbd_connection *connection)
+{
+	struct drbd_peer_device *peer_device;
+	int vnr;
+
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr)
+		peer_device_init_connect_state(peer_device);
+	rcu_read_unlock();
+	clear_bit(CONN_HANDSHAKE_DISCONNECT, &connection->flags);
+	clear_bit(CONN_HANDSHAKE_RETRY, &connection->flags);
+	clear_bit(CONN_HANDSHAKE_READY, &connection->flags);
+}
+
+enum csc_rv {
+	CSC_CLEAR,
+	CSC_REJECT,
+	CSC_ABORT_LOCAL,
+	CSC_TID_MISS,
+	CSC_MATCH,
+};
+
+static enum csc_rv
+check_concurrent_transactions(struct drbd_resource *resource, struct twopc_reply *new_r)
 {
-	if (dcbp_get_code(p) == RLE_VLI_Bits)
-		return recv_bm_rle_bits(peer_device, p, c, len - sizeof(*p));
+	struct twopc_reply *ongoing = &resource->twopc_reply;
 
-	/* other variants had been implemented for evaluation,
-	 * but have been dropped as this one turned out to be "best"
-	 * during all our tests. */
+	if (!resource->remote_state_change)
+		return CSC_CLEAR;
 
-	drbd_err(peer_device, "receive_bitmap_c: unknown encoding %u\n", p->encoding);
-	conn_request_state(peer_device->connection, NS(conn, C_PROTOCOL_ERROR), CS_HARD);
-	return -EIO;
+	if (new_r->initiator_node_id < ongoing->initiator_node_id) {
+		if (ongoing->initiator_node_id == resource->res_opts.node_id)
+			return CSC_ABORT_LOCAL;
+		else
+			return CSC_REJECT;
+	} else if (new_r->initiator_node_id > ongoing->initiator_node_id) {
+		return CSC_REJECT;
+	}
+	if (new_r->tid != ongoing->tid)
+		return CSC_TID_MISS;
+
+	return CSC_MATCH;
 }
 
-void INFO_bm_xfer_stats(struct drbd_peer_device *peer_device,
-		const char *direction, struct bm_xfer_ctx *c)
+
+enum alt_rv {
+	ALT_LOCKED,
+	ALT_MATCH,
+	ALT_TIMEOUT,
+};
+
+static enum alt_rv when_done_lock(struct drbd_resource *resource, unsigned int for_tid)
 {
-	/* what would it take to transfer it "plaintext" */
-	unsigned int header_size = drbd_header_size(peer_device->connection);
-	unsigned int data_size = DRBD_SOCKET_BUFFER_SIZE - header_size;
-	unsigned int plain =
-		header_size * (DIV_ROUND_UP(c->bm_words, data_size) + 1) +
-		c->bm_words * sizeof(unsigned long);
-	unsigned int total = c->bytes[0] + c->bytes[1];
-	unsigned int r;
+	write_lock_irq(&resource->state_rwlock);
+	if (!resource->remote_state_change)
+		return ALT_LOCKED;
+	write_unlock_irq(&resource->state_rwlock);
+	if (resource->twopc_reply.tid == for_tid)
+		return ALT_MATCH;
 
-	/* total can not be zero. but just in case: */
-	if (total == 0)
-		return;
+	return ALT_TIMEOUT;
+}
+static enum alt_rv abort_local_transaction(struct drbd_connection *connection, unsigned int for_tid)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct net_conf *nc;
+	enum alt_rv rv;
+	long t;
 
-	/* don't report if not compressed */
-	if (total >= plain)
-		return;
+	rcu_read_lock();
+	nc = rcu_dereference(connection->transport.net_conf);
+	t = nc->ping_timeo * HZ/10 * 3 / 2;
+	rcu_read_unlock();
 
-	/* total < plain. check for overflow, still */
-	r = (total > UINT_MAX/1000) ? (total / (plain/1000))
-		                    : (1000 * total / plain);
+	set_bit(TWOPC_ABORT_LOCAL, &resource->flags);
+	write_unlock_irq(&resource->state_rwlock);
+	wake_up_all(&resource->state_wait);
+	wait_event_timeout(resource->twopc_wait,
+			   (rv = when_done_lock(resource, for_tid)) != ALT_TIMEOUT, t);
+	clear_bit(TWOPC_ABORT_LOCAL, &resource->flags);
+	return rv;
+}
 
-	if (r > 1000)
-		r = 1000;
+static int receive_twopc(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct p_twopc_request *p = pi->data;
+	struct twopc_reply reply = {0};
 
-	r = 1000 - r;
-	drbd_info(peer_device, "%s bitmap stats [Bytes(packets)]: plain %u(%u), RLE %u(%u), "
-	     "total %u; compression: %u.%u%%\n",
-			direction,
-			c->bytes[1], c->packets[1],
-			c->bytes[0], c->packets[0],
-			total, r/10, r % 10);
+	reply.vnr = pi->vnr;
+	reply.tid = be32_to_cpu(p->tid);
+	if (connection->agreed_features & DRBD_FF_2PC_V2) {
+		reply.initiator_node_id = p->s8_initiator_node_id;
+		reply.target_node_id = p->s8_target_node_id;
+	} else {
+		reply.initiator_node_id = be32_to_cpu(p->u32_initiator_node_id);
+		reply.target_node_id = be32_to_cpu(p->u32_target_node_id);
+	}
+	reply.reachable_nodes = directly_connected_nodes(resource, NOW) |
+				NODE_MASK(resource->res_opts.node_id);
+
+	if (pi->cmd == P_TWOPC_PREPARE)
+		clear_bit(TWOPC_RECV_SIZES_ERR, &resource->flags);
+
+	process_twopc(connection, &reply, pi, jiffies);
+
+	return 0;
 }
 
-/* Since we are processing the bitfield from lower addresses to higher,
-   it does not matter if the process it in 32 bit chunks or 64 bit
-   chunks as long as it is little endian. (Understand it as byte stream,
-   beginning with the lowest byte...) If we would use big endian
-   we would need to process it from the highest address to the lowest,
-   in order to be agnostic to the 32 vs 64 bits issue.
+static void nested_twopc_abort(struct drbd_resource *resource, struct twopc_request *request)
+{
+	struct drbd_connection *connection;
+	u64 nodes_to_reach, reach_immediately, im;
 
-   returns 0 on failure, 1 if we successfully received it. */
-static int receive_bitmap(struct drbd_connection *connection, struct packet_info *pi)
+	read_lock_irq(&resource->state_rwlock);
+	nodes_to_reach = request->nodes_to_reach;
+	reach_immediately = directly_connected_nodes(resource, NOW) & nodes_to_reach;
+	nodes_to_reach &= ~(reach_immediately | NODE_MASK(resource->res_opts.node_id));
+	request->nodes_to_reach = nodes_to_reach;
+	read_unlock_irq(&resource->state_rwlock);
+
+	for_each_connection_ref(connection, im, resource) {
+		u64 mask = NODE_MASK(connection->peer_node_id);
+		if (reach_immediately & mask)
+			conn_send_twopc_request(connection, request);
+	}
+}
+
+static bool is_prepare(enum drbd_packet cmd)
+{
+	return cmd == P_TWOPC_PREP_RSZ || cmd == P_TWOPC_PREPARE;
+}
+
+
+enum determine_dev_size
+drbd_commit_size_change(struct drbd_device *device, struct resize_parms *rs, u64 nodes_to_reach)
 {
+	struct twopc_resize *tr = &device->resource->twopc.resize;
 	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct bm_xfer_ctx c;
-	int err;
+	enum determine_dev_size dd;
+	uint64_t my_usize;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		/* update cached sizes, relevant for the next handshake */
+		peer_device->c_size = tr->new_size;
+		peer_device->u_size = tr->user_size;
 
-	drbd_bm_lock(device, "receive bitmap", BM_LOCKED_SET_ALLOWED);
-	/* you are supposed to send additional out-of-sync information
-	 * if you actually set bits during this phase */
+		if (peer_device->d_size)
+			peer_device->d_size = tr->new_size;
+		peer_device->max_size = tr->new_size;
+	}
+	rcu_read_unlock();
 
-	c = (struct bm_xfer_ctx) {
-		.bm_bits = drbd_bm_bits(device),
-		.bm_words = drbd_bm_words(device),
-	};
+	if (!get_ldev(device)) {
+		drbd_set_my_capacity(device, tr->new_size);
+		return DS_UNCHANGED; /* Not entirely true, but we are diskless... */
+	}
 
-	for(;;) {
-		if (pi->cmd == P_BITMAP)
-			err = receive_bitmap_plain(peer_device, pi->size, pi->data, &c);
-		else if (pi->cmd == P_COMPRESSED_BITMAP) {
-			/* MAYBE: sanity check that we speak proto >= 90,
-			 * and the feature is enabled! */
-			struct p_compressed_bm *p = pi->data;
+	rcu_read_lock();
+	my_usize = rcu_dereference(device->ldev->disk_conf)->disk_size;
+	rcu_read_unlock();
 
-			if (pi->size > DRBD_SOCKET_BUFFER_SIZE - drbd_header_size(connection)) {
-				drbd_err(device, "ReportCBitmap packet too large\n");
-				err = -EIO;
-				goto out;
-			}
-			if (pi->size <= sizeof(*p)) {
-				drbd_err(device, "ReportCBitmap packet too small (l:%u)\n", pi->size);
-				err = -EIO;
-				goto out;
-			}
-			err = drbd_recv_all(peer_device->connection, p, pi->size);
-			if (err)
-			       goto out;
-			err = decode_bitmap_c(peer_device, p, &c, pi->size);
-		} else {
-			drbd_warn(device, "receive_bitmap: cmd neither ReportBitMap nor ReportCBitMap (is 0x%x)", pi->cmd);
-			err = -EIO;
-			goto out;
-		}
+	if (my_usize != tr->user_size) {
+		struct disk_conf *old_disk_conf, *new_disk_conf;
 
-		c.packets[pi->cmd == P_BITMAP]++;
-		c.bytes[pi->cmd == P_BITMAP] += drbd_header_size(connection) + pi->size;
+		drbd_info(device, "New u_size %llu sectors\n",
+			  (unsigned long long)tr->user_size);
 
-		if (err <= 0) {
-			if (err < 0)
-				goto out;
-			break;
+		new_disk_conf = kzalloc_obj(struct disk_conf);
+		if (!new_disk_conf) {
+			device->ldev->disk_conf->disk_size = tr->user_size;
+			goto cont;
 		}
-		err = drbd_recv_header(peer_device->connection, pi);
-		if (err)
-			goto out;
+
+		old_disk_conf = device->ldev->disk_conf;
+		*new_disk_conf = *old_disk_conf;
+		new_disk_conf->disk_size = tr->user_size;
+
+		rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
+		kvfree_rcu_mightsleep(old_disk_conf);
 	}
+cont:
+	dd = drbd_determine_dev_size(device, tr->new_size, tr->dds_flags | DDSF_2PC, rs);
 
-	INFO_bm_xfer_stats(peer_device, "receive", &c);
+	if (dd == DS_GREW && !(tr->dds_flags & DDSF_NO_RESYNC)) {
+		struct drbd_resource *resource = device->resource;
+		const int my_node_id = resource->res_opts.node_id;
+		struct drbd_peer_device *peer_device;
+		u64 im;
 
-	if (device->state.conn == C_WF_BITMAP_T) {
-		enum drbd_state_rv rv;
+		for_each_peer_device_ref(peer_device, im, device) {
+			if (peer_device->repl_state[NOW] != L_ESTABLISHED ||
+			    peer_device->disk_state[NOW] < D_INCONSISTENT)
+				continue;
 
-		err = drbd_send_bitmap(device, peer_device);
-		if (err)
-			goto out;
-		/* Omit CS_ORDERED with this state transition to avoid deadlocks. */
-		rv = _drbd_request_state(device, NS(conn, C_WF_SYNC_UUID), CS_VERBOSE);
-		D_ASSERT(device, rv == SS_SUCCESS);
-	} else if (device->state.conn != C_WF_BITMAP_S) {
-		/* admin may have requested C_DISCONNECTING,
-		 * other threads may have noticed network errors */
-		drbd_info(device, "unexpected cstate (%s) in receive_bitmap\n",
-		    drbd_conn_str(device->state.conn));
+			if (tr->diskful_primary_nodes) {
+				if (tr->diskful_primary_nodes & NODE_MASK(my_node_id)) {
+					enum drbd_repl_state resync;
+					if (tr->diskful_primary_nodes & NODE_MASK(peer_device->node_id)) {
+						/* peer is also primary */
+						resync = peer_device->node_id < my_node_id ?
+							L_SYNC_TARGET : L_SYNC_SOURCE;
+					} else {
+						/* peer is secondary */
+						resync = L_SYNC_SOURCE;
+					}
+					drbd_start_resync(peer_device, resync, "resize");
+				} else {
+					if (tr->diskful_primary_nodes & NODE_MASK(peer_device->node_id))
+						drbd_start_resync(peer_device, L_SYNC_TARGET,
+								"resize");
+					/* else  no resync */
+				}
+			} else {
+				if (resource->twopc_parent_nodes & NODE_MASK(peer_device->node_id))
+					drbd_start_resync(peer_device, L_SYNC_TARGET, "resize");
+				else if (nodes_to_reach & NODE_MASK(peer_device->node_id))
+					drbd_start_resync(peer_device, L_SYNC_SOURCE, "resize");
+				/* else  no resync */
+			}
+		}
 	}
-	err = 0;
 
- out:
-	drbd_bm_unlock(device);
-	if (!err && device->state.conn == C_WF_BITMAP_S)
-		drbd_start_resync(device, C_SYNC_SOURCE);
-	return err;
+	put_ldev(device);
+	return dd;
 }
 
-static int receive_skip(struct drbd_connection *connection, struct packet_info *pi)
+enum drbd_state_rv drbd_support_2pc_resize(struct drbd_resource *resource)
 {
-	drbd_warn(connection, "skipping unknown optional packet type %d, l: %d!\n",
-		 pi->cmd, pi->size);
+	struct drbd_connection *connection;
+	enum drbd_state_rv rv = SS_SUCCESS;
 
-	return ignore_remaining_packet(connection, pi);
-}
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		if (connection->cstate[NOW] == C_CONNECTED &&
+		    connection->agreed_pro_version < 112) {
+			rv = SS_NOT_SUPPORTED;
+			break;
+		}
+	}
+	rcu_read_unlock();
 
-static int receive_UnplugRemote(struct drbd_connection *connection, struct packet_info *pi)
-{
-	/* Make sure we've acked all the TCP data associated
-	 * with the data requests being unplugged */
-	tcp_sock_set_quickack(connection->data.socket->sk, 2);
-	return 0;
+	return rv;
 }
 
-static int receive_out_of_sync(struct drbd_connection *connection, struct packet_info *pi)
+static bool any_neighbor_quorate(struct drbd_resource *resource)
 {
 	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct p_block_desc *p = pi->data;
+	struct drbd_connection *connection;
+	bool peer_with_quorum = false;
+	int vnr;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		peer_with_quorum = true;
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			if (test_bit(PEER_QUORATE, &peer_device->flags))
+				continue;
+			peer_with_quorum = false;
+			break;
+		}
 
-	switch (device->state.conn) {
-	case C_WF_SYNC_UUID:
-	case C_WF_BITMAP_T:
-	case C_BEHIND:
+		if (peer_with_quorum)
 			break;
-	default:
-		drbd_err(device, "ASSERT FAILED cstate = %s, expected: WFSyncUUID|WFBitMapT|Behind\n",
-				drbd_conn_str(device->state.conn));
 	}
+	rcu_read_unlock();
 
-	drbd_set_out_of_sync(peer_device, be64_to_cpu(p->sector), be32_to_cpu(p->blksize));
+	return peer_with_quorum;
+}
+
+static void process_twopc(struct drbd_connection *connection,
+			 struct twopc_reply *reply,
+			 struct packet_info *pi,
+			 unsigned long receive_jif)
+{
+	struct drbd_connection *affected_connection = connection;
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device = NULL;
+	struct p_twopc_request *p = pi->data;
+	struct twopc_state_change *state_change = &resource->twopc.state_change;
+	enum chg_state_flags flags = CS_VERBOSE | CS_LOCAL_ONLY;
+	enum drbd_state_rv rv = SS_SUCCESS;
+	struct twopc_request request;
+	bool waiting_allowed = true;
+	enum csc_rv csc_rv;
+
+	request.tid = be32_to_cpu(p->tid);
+	if (connection->agreed_features & DRBD_FF_2PC_V2) {
+		request.flags = be32_to_cpu(p->flags);
+		request.initiator_node_id = p->s8_initiator_node_id;
+		request.target_node_id = p->s8_target_node_id;
+	} else {
+		request.flags = 0;
+		request.initiator_node_id = be32_to_cpu(p->u32_initiator_node_id);
+		request.target_node_id = be32_to_cpu(p->u32_target_node_id);
+	}
+	request.nodes_to_reach = be64_to_cpu(p->nodes_to_reach);
+	request.cmd = pi->cmd;
+	request.vnr = pi->vnr;
 
-	return 0;
-}
+	/* Check for concurrent transactions and duplicate packets. */
+retry:
+	write_lock_irq(&resource->state_rwlock);
 
-static int receive_rs_deallocated(struct drbd_connection *connection, struct packet_info *pi)
-{
-	struct drbd_peer_device *peer_device;
+	csc_rv = check_concurrent_transactions(resource, reply);
+
+	if (csc_rv == CSC_CLEAR && pi->cmd != P_TWOPC_ABORT) {
+		struct drbd_device *device;
+		int iterate_vnr;
+
+		if (!is_prepare(pi->cmd)) {
+			/* We have committed or aborted this transaction already. */
+			write_unlock_irq(&resource->state_rwlock);
+			dynamic_drbd_dbg(connection, "Ignoring %s packet %u\n",
+				   drbd_packet_name(pi->cmd),
+				   reply->tid);
+			return;
+		}
+		if (reply->is_aborted) {
+			write_unlock_irq(&resource->state_rwlock);
+			return;
+		}
+		resource->remote_state_change = true;
+		resource->twopc.type =
+			pi->cmd == P_TWOPC_PREPARE ? TWOPC_STATE_CHANGE : TWOPC_RESIZE;
+		resource->twopc_prepare_reply_cmd = 0;
+		resource->twopc_parent_nodes = NODE_MASK(connection->peer_node_id);
+		clear_bit(TWOPC_EXECUTED, &resource->flags);
+		idr_for_each_entry(&resource->devices, device, iterate_vnr)
+			clear_bit(OUTDATE_ON_2PC_COMMIT, &device->flags);
+	} else if (csc_rv == CSC_MATCH && !is_prepare(pi->cmd)) {
+		flags |= CS_PREPARED;
+
+		if (test_and_set_bit(TWOPC_EXECUTED, &resource->flags)) {
+			write_unlock_irq(&resource->state_rwlock);
+			drbd_info(connection, "Ignoring redundant %s packet %u.\n",
+				  drbd_packet_name(pi->cmd),
+				  reply->tid);
+			return;
+		}
+	} else if (csc_rv == CSC_ABORT_LOCAL && is_prepare(pi->cmd)) {
+		enum alt_rv alt_rv;
+
+		drbd_info(connection, "Aborting local state change %u to yield to remote "
+			  "state change %u.\n",
+			  resource->twopc_reply.tid,
+			  reply->tid);
+		alt_rv = abort_local_transaction(connection, reply->tid);
+		if (alt_rv == ALT_MATCH) {
+			/* abort_local_transaction() comes back unlocked in this case... */
+			goto match;
+		} else if (alt_rv == ALT_TIMEOUT) {
+			/* abort_local_transaction() comes back unlocked in this case... */
+			drbd_info(connection, "Aborting local state change %u "
+				  "failed. Rejecting remote state change %u.\n",
+				  resource->twopc_reply.tid,
+				  reply->tid);
+			drbd_send_twopc_reply(connection, P_TWOPC_RETRY, reply);
+			return;
+		}
+		/* abort_local_transaction() returned with the state_rwlock write lock */
+		if (reply->is_aborted) {
+			write_unlock_irq(&resource->state_rwlock);
+			return;
+		}
+		resource->remote_state_change = true;
+		resource->twopc.type =
+			pi->cmd == P_TWOPC_PREPARE ? TWOPC_STATE_CHANGE : TWOPC_RESIZE;
+		resource->twopc_parent_nodes = NODE_MASK(connection->peer_node_id);
+		resource->twopc_prepare_reply_cmd = 0;
+		clear_bit(TWOPC_EXECUTED, &resource->flags);
+	} else if (pi->cmd == P_TWOPC_ABORT) {
+		/* crc_rc != CRC_MATCH */
+		write_unlock_irq(&resource->state_rwlock);
+		nested_twopc_abort(resource, &request);
+		return;
+	} else {
+		write_unlock_irq(&resource->state_rwlock);
+
+		if (csc_rv == CSC_TID_MISS && is_prepare(pi->cmd) && waiting_allowed) {
+			/* CSC_TID_MISS implies the two transactions are from the same initiator */
+			if (!(resource->twopc_parent_nodes & NODE_MASK(connection->peer_node_id))) {
+				long timeout = twopc_timeout(resource) / 20; /* usually 1.5 sec */
+				/*
+				 * We are expecting the P_TWOPC_COMMIT or P_TWOPC_ABORT through
+				 * another connection. So we can wait without deadlocking.
+				 */
+				wait_event_interruptible_timeout(resource->twopc_wait,
+						!resource->remote_state_change, timeout);
+				waiting_allowed = false; /* retry only once */
+				goto retry;
+			}
+		}
+
+		if (csc_rv == CSC_REJECT ||
+		    (csc_rv == CSC_TID_MISS && is_prepare(pi->cmd))) {
+			drbd_info(connection, "Rejecting concurrent "
+				  "remote state change %u because of "
+				  "state change %u\n",
+				  reply->tid,
+				  resource->twopc_reply.tid);
+			drbd_send_twopc_reply(connection, P_TWOPC_RETRY, reply);
+			return;
+		}
+
+		if (is_prepare(pi->cmd)) {
+			if (csc_rv == CSC_MATCH) {
+				/* We have prepared this transaction already. */
+				enum drbd_packet reply_cmd;
+
+			match:
+				drbd_info(connection,
+						"Duplicate prepare for remote state change %u\n",
+						reply->tid);
+				write_lock_irq(&resource->state_rwlock);
+				resource->twopc_parent_nodes |= NODE_MASK(connection->peer_node_id);
+				reply_cmd = resource->twopc_prepare_reply_cmd;
+				write_unlock_irq(&resource->state_rwlock);
+
+				if (reply_cmd) {
+					drbd_send_twopc_reply(connection, reply_cmd,
+							      &resource->twopc_reply);
+				} else {
+					/* if a node sends us a prepare, that means he has
+					   prepared this himsilf successfully. */
+					write_lock_irq(&resource->state_rwlock);
+					set_bit(TWOPC_YES, &connection->flags);
+					drbd_maybe_cluster_wide_reply(resource);
+					write_unlock_irq(&resource->state_rwlock);
+				}
+			}
+		} else {
+			drbd_info(connection, "Ignoring %s packet %u "
+				  "current processing state change %u\n",
+				  drbd_packet_name(pi->cmd),
+				  reply->tid,
+				  resource->twopc_reply.tid);
+		}
+		return;
+	}
+
+	if (reply->initiator_node_id != connection->peer_node_id) {
+		/*
+		 * This is an indirect request.  Unless we are directly
+		 * connected to the initiator as well as indirectly, we don't
+		 * have connection or peer device objects for this peer.
+		 */
+		affected_connection = drbd_connection_by_node_id(resource, reply->initiator_node_id);
+	}
+
+	if (reply->target_node_id != -1 &&
+	    reply->target_node_id != resource->res_opts.node_id) {
+		affected_connection = NULL;
+	}
+
+	switch (resource->twopc.type) {
+	case TWOPC_STATE_CHANGE:
+		if (pi->cmd == P_TWOPC_PREPARE) {
+			state_change->mask.i = be32_to_cpu(p->mask);
+			state_change->val.i = be32_to_cpu(p->val);
+		} else { /* P_TWOPC_COMMIT */
+			state_change->primary_nodes = be64_to_cpu(p->primary_nodes);
+			state_change->reachable_nodes = be64_to_cpu(p->reachable_nodes);
+		}
+		break;
+	case TWOPC_RESIZE:
+		if (request.cmd == P_TWOPC_PREP_RSZ) {
+			resource->twopc.resize.user_size = be64_to_cpu(p->user_size);
+			resource->twopc.resize.dds_flags = be16_to_cpu(p->dds_flags);
+		} else { /* P_TWOPC_COMMIT */
+			resource->twopc.resize.diskful_primary_nodes =
+				be64_to_cpu(p->diskful_primary_nodes);
+			resource->twopc.resize.new_size = be64_to_cpu(p->exposed_size);
+		}
+	}
+
+	if (affected_connection && affected_connection->cstate[NOW] < C_CONNECTED &&
+	    state_change->mask.conn == 0)
+		affected_connection = NULL;
+
+	if (pi->vnr != -1 && affected_connection) {
+		peer_device = conn_peer_device(affected_connection, pi->vnr);
+		/* If we do not know the peer_device, then we are fine with
+		   whatever is going on in the cluster. E.g. detach and del-minor
+		   one each node, one after the other */
+
+		affected_connection = NULL; /* It is intended for a peer_device! */
+	}
+
+	if (state_change->mask.conn == conn_MASK) {
+		u64 m = NODE_MASK(reply->initiator_node_id);
+
+		if (state_change->val.conn == C_CONNECTED) {
+			reply->reachable_nodes |= m;
+			if (affected_connection) {
+				reply->is_connect = 1;
+
+				if (pi->cmd == P_TWOPC_PREPARE)
+					drbd_init_connect_state(connection);
+			}
+		}
+		if (state_change->val.conn == C_DISCONNECTING) {
+			reply->reachable_nodes &= ~m;
+			reply->is_disconnect = 1;
+		}
+	}
+
+	if (pi->cmd == P_TWOPC_PREPARE) {
+		reply->primary_nodes = be64_to_cpu(p->primary_nodes);
+		if (resource->role[NOW] == R_PRIMARY) {
+			reply->primary_nodes |= NODE_MASK(resource->res_opts.node_id);
+
+			if (drbd_res_data_accessible(resource))
+				reply->weak_nodes = ~reply->reachable_nodes;
+		}
+	}
+	if (pi->cmd == P_TWOPC_PREP_RSZ) {
+		struct drbd_device *device;
+
+		device = (peer_device ?: conn_peer_device(connection, pi->vnr))->device;
+		if (get_ldev(device)) {
+			if (resource->role[NOW] == R_PRIMARY)
+				reply->diskful_primary_nodes = NODE_MASK(resource->res_opts.node_id);
+			reply->max_possible_size = drbd_local_max_size(device);
+			put_ldev(device);
+		} else {
+			reply->max_possible_size = DRBD_MAX_SECTORS;
+			reply->diskful_primary_nodes = 0;
+		}
+	}
+
+	resource->twopc_reply = *reply;
+	write_unlock_irq(&resource->state_rwlock);
+
+	if (affected_connection && affected_connection != connection &&
+	    affected_connection->cstate[NOW] == C_CONNECTED) {
+		drbd_ping_peer(affected_connection);
+		if (affected_connection->cstate[NOW] < C_CONNECTED)
+			affected_connection = NULL;
+	}
+
+	switch (pi->cmd) {
+	case P_TWOPC_PREPARE:
+		drbd_print_cluster_wide_state_change(resource, "Preparing remote state change",
+				reply->tid, reply->initiator_node_id, reply->target_node_id,
+				state_change->mask, state_change->val);
+		flags |= CS_PREPARE;
+		break;
+	case P_TWOPC_PREP_RSZ:
+		drbd_info(connection, "Preparing remote state change %u "
+			  "(local_max_size = %llu KiB)\n",
+			  reply->tid, (unsigned long long)reply->max_possible_size >> 1);
+		flags |= CS_PREPARE;
+		break;
+	case P_TWOPC_ABORT:
+		drbd_info(connection, "Aborting remote state change %u\n",
+			  reply->tid);
+		flags |= CS_ABORT;
+		break;
+	case P_TWOPC_COMMIT:
+		drbd_info(connection, "Committing remote state change %u (primary_nodes=%llX)\n",
+			  reply->tid, be64_to_cpu(p->primary_nodes));
+		break;
+	default:
+		BUG();
+	}
+
+	switch (resource->twopc.type) {
+	case TWOPC_STATE_CHANGE:
+		if (flags & CS_PREPARED && !(flags & CS_ABORT)) {
+			reply->primary_nodes = state_change->primary_nodes;
+			handle_neighbor_demotion(connection, state_change, reply);
+
+			if ((resource->cached_all_devices_have_quorum ||
+			     any_neighbor_quorate(resource)) &&
+			    request.flags & TWOPC_HAS_REACHABLE) {
+				resource->members = state_change->reachable_nodes;
+				if (!resource->cached_all_devices_have_quorum)
+					flags |= CS_FORCE_RECALC;
+			}
+			if (state_change->mask.conn == conn_MASK &&
+			    state_change->val.conn == C_CONNECTED) {
+				/* Add nodes connecting "far away" to members */
+				u64 add_mask = NODE_MASK(reply->initiator_node_id) |
+					NODE_MASK(reply->target_node_id);
+
+				resource->members |= add_mask;
+			}
+		}
+
+		if (peer_device)
+			rv = change_peer_device_state(peer_device, state_change, flags);
+		else if (affected_connection)
+			rv = change_connection_state(affected_connection, state_change, reply,
+						     flags | CS_IGN_OUTD_FAIL);
+		else
+			rv = far_away_change(connection, &request, reply, flags);
+		break;
+	case TWOPC_RESIZE:
+		if (flags & CS_PREPARE)
+			rv = drbd_support_2pc_resize(resource);
+		break;
+	}
+
+	if (flags & CS_PREPARE) {
+		mod_timer(&resource->twopc_timer, receive_jif + twopc_timeout(resource));
+
+		/* Retry replies can be sent immediately. Otherwise use the
+		 * nested twopc path. This waits for the state handshake to
+		 * complete in the case of a twopc for transitioning to
+		 * C_CONNECTED. */
+		if (rv == SS_IN_TRANSIENT_STATE) {
+			resource->twopc_prepare_reply_cmd = P_TWOPC_RETRY;
+			drbd_send_twopc_reply(connection, P_TWOPC_RETRY, reply);
+		} else {
+			resource->twopc_reply.state_change_failed = rv < SS_SUCCESS;
+			nested_twopc_request(resource, &request);
+		}
+	} else {
+		if (flags & CS_PREPARED) {
+			if (rv < SS_SUCCESS)
+				drbd_err(resource, "FATAL: Local commit of prepared %u failed! \n",
+					 reply->tid);
+
+			timer_delete(&resource->twopc_timer);
+		}
+
+		nested_twopc_request(resource, &request);
+
+		if (resource->twopc.type == TWOPC_RESIZE && flags & CS_PREPARED &&
+		    !(flags & CS_ABORT)) {
+			struct drbd_device *device;
+
+			device = (peer_device ?: conn_peer_device(connection, pi->vnr))->device;
+
+			drbd_commit_size_change(device, NULL, request.nodes_to_reach);
+			rv = SS_SUCCESS;
+		}
+
+		clear_remote_state_change(resource);
+
+		if (peer_device && rv >= SS_SUCCESS && !(flags & CS_ABORT))
+			drbd_md_sync_if_dirty(peer_device->device);
+
+		if (connection->agreed_pro_version < 117 &&
+		    rv >= SS_SUCCESS && !(flags & CS_ABORT) &&
+		    affected_connection &&
+		    state_change->mask.conn == conn_MASK && state_change->val.conn == C_CONNECTED)
+			conn_connect2(connection);
+	}
+}
+
+void drbd_try_to_get_resynced(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device, *best_peer_device = NULL;
+	enum sync_strategy best_strategy = UNDETERMINED;
+	int best_preference = 0;
+
+	if (!get_ldev(device))
+		return;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		enum sync_strategy strategy;
+		enum sync_rule rule;
+		int peer_node_id;
+
+		if (peer_device->disk_state[NOW] != D_UP_TO_DATE)
+			continue;
+
+		strategy = drbd_uuid_compare(peer_device, &rule, &peer_node_id);
+		disk_states_to_strategy(peer_device, peer_device->disk_state[NOW], &strategy, rule,
+					&peer_node_id);
+		drbd_info(peer_device, "strategy = %s\n", strategy_descriptor(strategy).name);
+		if (strategy_descriptor(strategy).resync_peer_preference > best_preference) {
+			best_preference = strategy_descriptor(strategy).resync_peer_preference;
+			best_peer_device = peer_device;
+			best_strategy = strategy;
+		}
+	}
+	rcu_read_unlock();
+	peer_device = best_peer_device;
+
+	if (best_strategy == NO_SYNC) {
+		change_disk_state(device, D_UP_TO_DATE, CS_VERBOSE, "get-resync", NULL);
+	} else if (peer_device &&
+		   (!repl_is_sync_target(peer_device->repl_state[NOW]) ||
+		    test_bit(UNSTABLE_RESYNC, &peer_device->flags))) {
+		drbd_resync(peer_device, DISKLESS_PRIMARY);
+		drbd_send_uuids(peer_device, UUID_FLAG_RESYNC | UUID_FLAG_DISKLESS_PRIMARY, 0);
+	}
+	put_ldev(device);
+}
+
+static void finish_nested_twopc(struct drbd_connection *connection)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device;
+	int vnr = 0;
+
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		if (!test_bit(INITIAL_STATE_RECEIVED, &peer_device->flags))
+			return;
+	}
+
+	set_bit(CONN_HANDSHAKE_READY, &connection->flags);
+
+	wake_up_all(&resource->state_wait);
+
+	write_lock_irq(&resource->state_rwlock);
+	drbd_maybe_cluster_wide_reply(resource);
+	write_unlock_irq(&resource->state_rwlock);
+}
+
+static bool uuid_in_peer_history(struct drbd_peer_device *peer_device, u64 uuid)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(peer_device->history_uuids); i++)
+		if ((peer_device->history_uuids[i] & ~UUID_PRIMARY) == uuid)
+			return true;
+
+	return false;
+}
+
+static bool uuid_in_my_history(struct drbd_device *device, u64 uuid)
+{
+	int i;
+
+	for (i = 0; i < HISTORY_UUIDS; i++) {
+		if ((drbd_history_uuid(device, i) & ~UUID_PRIMARY) == uuid)
+			return true;
+	}
+
+	return false;
+}
+
+static bool peer_data_is_successor_of_mine(struct drbd_peer_device *peer_device)
+{
+	u64 exposed = peer_device->device->exposed_data_uuid & ~UUID_PRIMARY;
+	int i;
+
+	i = drbd_find_peer_bitmap_by_uuid(peer_device, exposed);
+	if (i != -1)
+		return true;
+
+	return uuid_in_peer_history(peer_device, exposed);
+}
+
+static bool peer_data_is_ancestor_of_mine(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+	u64 peer_uuid = peer_device->current_uuid;
+	struct drbd_peer_device *p2;
+	bool rv = false;
+	int i;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(p2, device) {
+		if (peer_device == p2)
+			continue;
+		i = drbd_find_peer_bitmap_by_uuid(p2, peer_uuid);
+		if (i != -1 || uuid_in_peer_history(peer_device, peer_uuid)) {
+			rv = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return rv;
+}
+
+static void propagate_exposed_uuid(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device;
+	u64 im;
+
+	for_each_peer_device_ref(peer_device, im, device) {
+		if (!test_bit(INITIAL_STATE_SENT, &peer_device->flags))
+			continue;
+		drbd_send_current_uuid(peer_device, device->exposed_data_uuid, 0);
+	}
+}
+
+static void maybe_force_secondary(struct drbd_peer_device *peer_device)
+{
+	struct drbd_resource *resource = peer_device->device->resource;
+	unsigned long irq_flags;
+
+	if (!resource->fail_io[NOW] && resource->cached_susp &&
+	    resource->res_opts.on_susp_primary_outdated == SPO_FORCE_SECONDARY) {
+		drbd_warn(peer_device, "force secondary!\n");
+		begin_state_change(resource, &irq_flags,
+				   CS_VERBOSE | CS_HARD | CS_FS_IGN_OPENERS);
+		resource->role[NEW] = R_SECONDARY;
+		/* resource->fail_io[NEW] gets set via CS_FS_IGN_OPENERS */
+		end_state_change(resource, &irq_flags, "peer-state");
+	}
+}
+
+static void diskless_with_peers_different_current_uuids(struct drbd_peer_device *peer_device,
+							enum drbd_disk_state *peer_disk_state)
+{
+	bool data_successor = peer_data_is_successor_of_mine(peer_device);
+	bool data_ancestor = peer_data_is_ancestor_of_mine(peer_device);
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_device *device = peer_device->device;
+
+	if (data_successor && resource->role[NOW] == R_PRIMARY) {
+		drbd_warn(peer_device, "Remote node has more recent data\n");
+		maybe_force_secondary(peer_device);
+		set_bit(CONN_HANDSHAKE_RETRY, &connection->flags);
+	} else if (data_successor && resource->role[NOW] == R_SECONDARY) {
+		drbd_uuid_set_exposed(device, peer_device->current_uuid, true);
+		propagate_exposed_uuid(device);
+	} else if (data_ancestor) {
+		drbd_warn(peer_device, "Downgrading joining peer's disk as its data is older\n");
+		if (*peer_disk_state > D_OUTDATED)
+			*peer_disk_state = D_OUTDATED;
+			/* See "Do not trust this guy!" in sanitize_state() */
+	} else {
+		drbd_warn(peer_device, "Current UUID of peer does not match my exposed UUID.");
+		set_bit(CONN_HANDSHAKE_DISCONNECT, &connection->flags);
+	}
+}
+
+static int receive_state(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device = NULL;
+	enum drbd_repl_state *repl_state;
+	struct drbd_device *device = NULL;
+	struct p_state *p = pi->data;
+	union drbd_state old_peer_state, peer_state;
+	enum drbd_disk_state peer_disk_state;
+	enum drbd_repl_state new_repl_state;
+	bool peer_was_resync_target, do_handshake = false;
+	enum chg_state_flags begin_state_chg_flags = CS_VERBOSE | CS_WAIT_COMPLETE;
+	unsigned long irq_flags;
+	int rv;
+
+	if (pi->vnr != -1) {
+		peer_device = conn_peer_device(connection, pi->vnr);
+		if (!peer_device)
+			return config_unknown_volume(connection, pi);
+		device = peer_device->device;
+	}
+
+	peer_state.i = be32_to_cpu(p->state);
+
+	if (connection->agreed_pro_version < 110) {
+		/* Before drbd-9.0 there was no D_DETACHING it was D_FAILED... */
+		if (peer_state.disk >= D_DETACHING)
+			peer_state.disk++;
+		if (peer_state.pdsk >= D_DETACHING)
+			peer_state.pdsk++;
+	}
+
+	if (pi->vnr == -1) {
+		if (peer_state.role == R_SECONDARY) {
+			begin_state_change(resource, &irq_flags, CS_HARD | CS_VERBOSE);
+			__change_peer_role(connection, R_SECONDARY);
+			rv = end_state_change(resource, &irq_flags, "peer-state");
+			if (rv < SS_SUCCESS)
+				goto fail;
+		}
+		return 0;
+	}
+
+	peer_disk_state = peer_state.disk;
+
+	if (peer_disk_state > D_DISKLESS && !want_bitmap(peer_device)) {
+		drbd_warn(peer_device, "The peer is configured to be diskless but presents %s\n",
+			  drbd_disk_str(peer_disk_state));
+		goto fail;
+	}
+
+	if (peer_state.disk == D_NEGOTIATING) {
+		peer_disk_state = peer_device->uuid_flags & UUID_FLAG_INCONSISTENT ?
+			D_INCONSISTENT : D_CONSISTENT;
+		drbd_info(peer_device, "real peer disk state = %s\n", drbd_disk_str(peer_disk_state));
+	}
+
+	read_lock_irq(&resource->state_rwlock);
+	old_peer_state = drbd_get_peer_device_state(peer_device, NOW);
+	read_unlock_irq(&resource->state_rwlock);
+ retry:
+	new_repl_state = max_t(enum drbd_repl_state, old_peer_state.conn, L_OFF);
+
+	/* If some other part of the code (ack_receiver thread, timeout)
+	 * already decided to close the connection again,
+	 * we must not "re-establish" it here. */
+	if (old_peer_state.conn <= C_TEAR_DOWN)
+		return -ECONNRESET;
+
+	if (!test_bit(INITIAL_STATE_RECEIVED, &peer_device->flags) &&
+	    peer_state.role == R_PRIMARY && peer_device->uuid_flags & UUID_FLAG_STABLE)
+		check_resync_source(device, peer_device->uuid_node_mask);
+
+	peer_was_resync_target =
+		connection->agreed_pro_version >= 110 ?
+		peer_device->last_repl_state == L_SYNC_TARGET ||
+		peer_device->last_repl_state == L_PAUSED_SYNC_T
+		:
+		true;
+	/* If this is the "end of sync" confirmation, usually the peer disk
+	 * was D_INCONSISTENT or D_CONSISTENT. (Since the peer might be
+	 * weak we do not know anything about its new disk state)
+	 */
+	if (peer_was_resync_target &&
+	    (old_peer_state.pdsk == D_INCONSISTENT || old_peer_state.pdsk == D_CONSISTENT) &&
+	    old_peer_state.conn > L_ESTABLISHED && old_peer_state.disk >= D_INCONSISTENT) {
+		/* If we are (becoming) SyncSource, but peer is still in sync
+		 * preparation, ignore its uptodate-ness to avoid flapping, it
+		 * will change to inconsistent once the peer reaches active
+		 * syncing states.
+		 * It may have changed syncer-paused flags, however, so we
+		 * cannot ignore this completely. */
+		if (peer_state.conn > L_ESTABLISHED &&
+		    peer_state.conn < L_SYNC_SOURCE)
+			peer_disk_state = D_INCONSISTENT;
+
+		/* if peer_state changes to connected at the same time,
+		 * it explicitly notifies us that it finished resync.
+		 * Maybe we should finish it up, too? */
+		else if (peer_state.conn == L_ESTABLISHED) {
+			bool finish_now = false;
+
+			if (old_peer_state.conn == L_WF_BITMAP_S) {
+				read_lock_irq(&resource->state_rwlock);
+				if (peer_device->repl_state[NOW] == L_WF_BITMAP_S)
+					peer_device->resync_finished_pdsk = peer_state.disk;
+				else if (peer_device->repl_state[NOW] == L_SYNC_SOURCE)
+					finish_now = true;
+				read_unlock_irq(&resource->state_rwlock);
+			}
+
+			if (finish_now || old_peer_state.conn == L_SYNC_SOURCE ||
+			    old_peer_state.conn == L_PAUSED_SYNC_S) {
+				drbd_resync_finished(peer_device, peer_state.disk);
+				peer_device->last_repl_state = peer_state.conn;
+			}
+			return 0;
+		}
+	}
+
+	/* explicit verify finished notification, stop sector reached. */
+	if (old_peer_state.conn == L_VERIFY_T && old_peer_state.disk == D_UP_TO_DATE &&
+	    peer_state.conn == L_ESTABLISHED && peer_disk_state == D_UP_TO_DATE) {
+		ov_out_of_sync_print(peer_device);
+		drbd_resync_finished(peer_device, D_MASK);
+		peer_device->last_repl_state = peer_state.conn;
+		return 0;
+	}
+
+	/* Start resync after AHEAD/BEHIND */
+	if (connection->agreed_pro_version >= 110 &&
+	    peer_state.conn == L_SYNC_SOURCE && old_peer_state.conn == L_BEHIND) {
+		/*
+		 * Become Inconsistent immediately because we may now receive
+		 * data. Delay the start of the resync itself until any
+		 * previous resync is no longer active.
+		 */
+		rv = change_disk_state(device, D_INCONSISTENT, CS_VERBOSE,
+				"resync-after-behind", NULL);
+		if (rv < SS_SUCCESS)
+			goto fail;
+
+		peer_device->start_resync_side = L_SYNC_TARGET;
+		drbd_peer_device_post_work(peer_device, RS_START);
+		return 0;
+	}
+
+	/* peer says his disk is inconsistent, while we think it is uptodate,
+	 * and this happens while the peer still thinks we have a sync going on,
+	 * but we think we are already done with the sync.
+	 * We ignore this to avoid flapping pdsk.
+	 * This should not happen, if the peer is a recent version of drbd. */
+	if (old_peer_state.pdsk == D_UP_TO_DATE && peer_disk_state == D_INCONSISTENT &&
+	    old_peer_state.conn == L_ESTABLISHED && peer_state.conn > L_SYNC_SOURCE)
+		peer_disk_state = D_UP_TO_DATE;
+
+	if (new_repl_state == L_OFF)
+		new_repl_state = L_ESTABLISHED;
+
+	if (peer_state.conn == L_AHEAD)
+		new_repl_state = L_BEHIND;
+
+	/* with protocol >= 118 uuid & state packets come after the 2PC prepare packet */
+	do_handshake =
+		(test_bit(UUIDS_RECEIVED, &peer_device->flags) ||
+			test_bit(CURRENT_UUID_RECEIVED, &peer_device->flags)) &&
+		(connection->agreed_pro_version < 118 ||
+			drbd_twopc_between_peer_and_me(connection)) &&
+		old_peer_state.conn < L_ESTABLISHED;
+
+	if (test_bit(UUIDS_RECEIVED, &peer_device->flags) &&
+	    peer_state.disk >= D_NEGOTIATING &&
+	    get_ldev_if_state(device, D_NEGOTIATING)) {
+		enum sync_strategy strategy = UNDETERMINED;
+		bool consider_resync;
+
+		/* clear CONN_DISCARD_MY_DATA so late, to not lose it if peer
+		   gets aborted before we are able to do the resync handshake. */
+		clear_bit(CONN_DISCARD_MY_DATA, &connection->flags);
+
+		/* if we established a new connection */
+		consider_resync = do_handshake &&
+					!test_bit(INITIAL_STATE_RECEIVED, &peer_device->flags);
+		/* if we have both been inconsistent, and the peer has been
+		 * forced to be UpToDate with --force */
+		consider_resync |= test_bit(CONSIDER_RESYNC, &peer_device->flags);
+		/* if we had been plain connected, and the admin requested to
+		 * start a sync by "invalidate" or "invalidate-remote" */
+		consider_resync |= (old_peer_state.conn == L_ESTABLISHED &&
+				    (peer_state.conn == L_STARTING_SYNC_S ||
+				     peer_state.conn == L_STARTING_SYNC_T));
+
+		consider_resync |= peer_state.conn == L_WF_BITMAP_T &&
+				   peer_device->flags & UUID_FLAG_CRASHED_PRIMARY;
+
+		if (consider_resync) {
+			strategy = drbd_sync_handshake(peer_device, peer_state);
+			new_repl_state = strategy_to_repl_state(peer_device, peer_state.role, strategy);
+		} else if (old_peer_state.conn == L_ESTABLISHED &&
+			   (peer_state.disk == D_NEGOTIATING ||
+			    old_peer_state.disk == D_NEGOTIATING)) {
+			strategy = drbd_attach_handshake(peer_device, peer_disk_state);
+			new_repl_state = strategy_to_repl_state(peer_device, peer_state.role, strategy);
+			if (new_repl_state == L_ESTABLISHED && device->disk_state[NOW] == D_UP_TO_DATE)
+				peer_disk_state = D_UP_TO_DATE;
+		}
+
+		put_ldev(device);
+		if (strategy_descriptor(strategy).reconnect) { /* retry connect */
+			maybe_force_secondary(peer_device);
+			if (connection->agreed_pro_version >= 118)
+				set_bit(CONN_HANDSHAKE_RETRY, &connection->flags);
+			else
+				return -EIO; /* retry connect */
+		} else if (strategy_descriptor(strategy).disconnect) {
+			if (device->disk_state[NOW] == D_NEGOTIATING) {
+				new_repl_state = L_NEG_NO_RESULT;
+			} else if (peer_state.disk == D_NEGOTIATING) {
+				if (connection->agreed_pro_version < 110) {
+					drbd_err(device, "Disk attach process on the peer node was aborted.\n");
+					peer_state.disk = D_DISKLESS;
+					peer_disk_state = D_DISKLESS;
+				} else {
+					/* The peer will decide later and let us know... */
+					peer_disk_state = D_NEGOTIATING;
+				}
+			} else {
+				if (test_and_clear_bit(CONN_DRY_RUN, &connection->flags))
+					return -EIO;
+				if (connection->agreed_pro_version >= 118)
+					set_bit(CONN_HANDSHAKE_DISCONNECT, &connection->flags);
+				else
+					goto fail;
+			}
+		}
+
+		if (device->disk_state[NOW] == D_NEGOTIATING) {
+			begin_state_chg_flags |= CS_FORCE_RECALC;
+			peer_device->negotiation_result = new_repl_state;
+		}
+	}
+
+	if (test_bit(UUIDS_RECEIVED, &peer_device->flags) &&
+	    peer_device->repl_state[NOW] == L_OFF && device->disk_state[NOW] == D_DISKLESS) {
+		u64 exposed_data_uuid = device->exposed_data_uuid;
+		u64 peer_current_uuid = peer_device->current_uuid;
+
+		drbd_info(peer_device, "my exposed UUID: %016llX\n", exposed_data_uuid);
+		drbd_uuid_dump_peer(peer_device, peer_device->dirty_bits, peer_device->uuid_flags);
+
+		/* I am diskless connecting to a peer with disk, check that UUID match
+		   We only check if the peer claims to have D_UP_TO_DATE data. Only then is the
+		   peer a source for my data anyways. */
+		if (exposed_data_uuid && peer_state.disk == D_UP_TO_DATE &&
+		    (exposed_data_uuid & ~UUID_PRIMARY) != (peer_current_uuid & ~UUID_PRIMARY))
+			diskless_with_peers_different_current_uuids(peer_device, &peer_disk_state);
+		if (!exposed_data_uuid && peer_state.disk == D_UP_TO_DATE) {
+			drbd_uuid_set_exposed(device, peer_current_uuid, true);
+			propagate_exposed_uuid(device);
+		}
+	}
+	if (peer_device->repl_state[NOW] == L_OFF && peer_state.disk == D_DISKLESS && get_ldev(device)) {
+		u64 uuid_flags = 0;
+
+		drbd_collect_local_uuid_flags(peer_device, NULL);
+		drbd_uuid_dump_self(peer_device, peer_device->comm_bm_set, uuid_flags);
+		drbd_info(peer_device, "peer's exposed UUID: %016llX\n", peer_device->current_uuid);
+
+		if (peer_state.role == R_PRIMARY &&
+		    (peer_device->current_uuid & ~UUID_PRIMARY) ==
+		    (drbd_current_uuid(device) & ~UUID_PRIMARY)) {
+			/* Connecting to diskless primary peer. When the state change is committed,
+			 * sanitize_state might set me D_UP_TO_DATE. Make sure the
+			 * effective_size is set. */
+			peer_device->max_size = peer_device->c_size;
+			drbd_determine_dev_size(device, peer_device->max_size, 0, NULL);
+		}
+
+		put_ldev(device);
+	}
+
+	if (test_bit(HOLDING_UUID_READ_LOCK, &peer_device->flags) ||
+			connection->agreed_pro_version < 110) {
+		struct drbd_transport *transport = &connection->transport;
+		/* Last packet of handshake received, disarm receive timeout */
+		transport->class->ops.set_rcvtimeo(transport, DATA_STREAM, MAX_SCHEDULE_TIMEOUT);
+	}
+
+	if (new_repl_state == L_ESTABLISHED && peer_disk_state == D_CONSISTENT &&
+	    drbd_suspended(device) && peer_device->repl_state[NOW] < L_ESTABLISHED &&
+	    test_and_clear_bit(NEW_CUR_UUID, &device->flags)) {
+		/* Do not allow RESEND for a rebooted peer. We can only allow this
+	 * for temporary network outages! */
+		drbd_err(peer_device, "Aborting Connect, can not thaw IO with an only Consistent peer\n");
+		drbd_uuid_new_current(device, false);
+		begin_state_change(resource, &irq_flags, CS_HARD);
+		__change_cstate(connection, C_PROTOCOL_ERROR);
+		__change_io_susp_user(resource, false);
+		end_state_change(resource, &irq_flags, "abort-connect");
+		return -EIO;
+	}
+
+	clear_bit(RS_SOURCE_MISSED_END, &peer_device->flags);
+	clear_bit(RS_PEER_MISSED_END, &peer_device->flags);
+
+	if (peer_state.quorum)
+		set_bit(PEER_QUORATE, &peer_device->flags);
+	else
+		clear_bit(PEER_QUORATE, &peer_device->flags);
+
+	if (do_handshake) {
+		/* Ignoring state packets before the 2PC; they are from aborted 2PCs */
+		bool done = test_bit(INITIAL_STATE_RECEIVED, &peer_device->flags);
+
+		set_bit(INITIAL_STATE_RECEIVED, &peer_device->flags);
+		if (connection->cstate[NOW] == C_CONNECTING) {
+			peer_device->connect_state.peer_isp =
+				peer_state.aftr_isp | peer_state.user_isp;
+
+			if (!done) {
+				peer_device->connect_state.conn = new_repl_state;
+				peer_device->connect_state.peer = peer_state.role;
+				peer_device->connect_state.pdsk = peer_disk_state;
+			}
+			wake_up(&connection->ee_wait);
+			finish_nested_twopc(connection);
+		}
+	}
+
+	/* State change will be performed when the two-phase commit is committed. */
+	if (connection->cstate[NOW] == C_CONNECTING)
+		return 0;
+
+	if (peer_state.conn == L_OFF) {
+		/* device/minor hot add on the peer of a minor already locally known */
+		if (peer_device->repl_state[NOW] == L_NEGOTIATING) {
+			drbd_send_enable_replication_next(peer_device);
+			drbd_send_sizes(peer_device, 0, 0);
+			drbd_send_uuids(peer_device, 0, 0);
+		}
+		drbd_send_current_state(peer_device);
+	}
+
+	begin_state_change(resource, &irq_flags, begin_state_chg_flags);
+	if (old_peer_state.i != drbd_get_peer_device_state(peer_device, NOW).i) {
+		old_peer_state = drbd_get_peer_device_state(peer_device, NOW);
+		abort_state_change_locked(resource);
+		write_unlock_irq(&resource->state_rwlock);
+		goto retry;
+	}
+	clear_bit(CONSIDER_RESYNC, &peer_device->flags);
+	if (device->disk_state[NOW] != D_NEGOTIATING)
+		__change_repl_state(peer_device, new_repl_state);
+	__change_peer_role(connection, peer_state.role);
+	if (peer_state.disk != D_NEGOTIATING)
+		__change_peer_disk_state(peer_device, peer_disk_state);
+	__change_resync_susp_peer(peer_device, peer_state.aftr_isp | peer_state.user_isp);
+	repl_state = peer_device->repl_state;
+	if (repl_state[OLD] < L_ESTABLISHED && repl_state[NEW] >= L_ESTABLISHED)
+		resource->state_change_flags |= CS_HARD;
+
+	rv = end_state_change(resource, &irq_flags, "peer-state");
+	new_repl_state = peer_device->repl_state[NOW];
+
+	if (rv < SS_SUCCESS)
+		goto fail;
+
+	if (old_peer_state.conn > L_OFF) {
+		if (new_repl_state > L_ESTABLISHED && peer_state.conn <= L_ESTABLISHED &&
+		    peer_state.disk != D_NEGOTIATING) {
+			/* we want resync, peer has not yet decided to sync... */
+			/* Nowadays only used when forcing a node into primary role and
+			   setting its disk to UpToDate with that */
+			drbd_send_uuids(peer_device, 0, 0);
+			drbd_send_current_state(peer_device);
+		}
+	}
+
+	clear_bit(DISCARD_MY_DATA, &peer_device->flags); /* Only relevant for agreed_pro_version < 117 */
+
+	drbd_md_sync(device); /* update connected indicator, effective_size, ... */
+
+	peer_device->last_repl_state = peer_state.conn;
+	return 0;
+fail:
+	change_cstate(connection, C_DISCONNECTING, CS_HARD);
+	return -EIO;
+}
+
+static int receive_sync_uuid(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	struct p_uuid *p = pi->data;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+	device = peer_device->device;
+
+	wait_event(device->misc_wait,
+		   peer_device->repl_state[NOW] == L_WF_SYNC_UUID ||
+		   peer_device->repl_state[NOW] == L_BEHIND ||
+		   peer_device->repl_state[NOW] < L_ESTABLISHED ||
+		   device->disk_state[NOW] < D_NEGOTIATING);
+
+	/* D_ASSERT(device,  peer_device->repl_state[NOW] == L_WF_SYNC_UUID ); */
+
+	/* Here the _drbd_uuid_ functions are right, current should
+	   _not_ be rotated into the history */
+	if (get_ldev_if_state(device, D_NEGOTIATING)) {
+		_drbd_uuid_set_current(device, be64_to_cpu(p->uuid));
+		_drbd_uuid_set_bitmap(peer_device, 0UL);
+
+		drbd_print_uuids(peer_device, "updated sync uuid");
+		drbd_start_resync(peer_device, L_SYNC_TARGET, "peer-sync-uuid");
+
+		put_ldev(device);
+	} else
+		drbd_err(device, "Ignoring SyncUUID packet!\n");
+
+	return 0;
+}
+
+static void scale_bits(unsigned long *base, unsigned int num_4k, unsigned int scale)
+{
+	unsigned int bits = num_4k * BITS_PER_LONG;
+	unsigned int sbit;
+
+	if (scale == 0)
+		return;
+
+	for (sbit = 0; sbit < bits; sbit++)
+		if (test_bit(sbit, base))
+			__set_bit(sbit >> scale, base);
+}
+
+/*
+ * receive_bitmap_plain
+ *
+ * Return 0 when done, 1 when another iteration is needed, and a negative error
+ * code upon failure.
+ *
+ * Received bitmap is 4k per bit, need to aggregate by c->scale.
+ */
+static int
+receive_bitmap_plain(struct drbd_peer_device *peer_device, unsigned int size,
+		     struct bm_xfer_ctx *c)
+{
+	unsigned long *p;
+	unsigned int data_size = DRBD_SOCKET_BUFFER_SIZE -
+				 drbd_header_size(peer_device->connection);
+	unsigned int num_words_4k = min_t(size_t, data_size / sizeof(*p),
+				       (c->bm_words - c->word_offset) << c->scale);
+	unsigned int want = num_words_4k * sizeof(*p);
+	int err;
+
+	if (want != size) {
+		drbd_err(peer_device, "%s:want (%u) != size (%u)\n", __func__, want, size);
+		return -EIO;
+	}
+	if (want == 0)
+		return 0;
+	err = drbd_recv_all(peer_device->connection, (void **)&p, want);
+	if (err)
+		return err;
+
+	if ((num_words_4k & ((1 << c->scale)-1)) != 0) {
+		drbd_err(peer_device,
+			"number of words %u not aligned to scale %u while receiving bitmap\n",
+			num_words_4k, c->scale);
+		return -ERANGE;
+	}
+
+	if (get_ldev(peer_device->device)) {
+		scale_bits(p, num_words_4k, c->scale);
+		drbd_bm_merge_lel(peer_device, c->word_offset, num_words_4k >> c->scale, p);
+		put_ldev(peer_device->device);
+	} else {
+		drbd_err(peer_device, "lost backend device while receiving bitmap\n");
+		return -EIO;
+	}
+
+	c->word_offset += num_words_4k >> c->scale;
+	c->bit_offset = c->word_offset * BITS_PER_LONG;
+	c->bit_offset_4k = (c->word_offset << c->scale) * BITS_PER_LONG;
+	if (c->bit_offset > c->bm_bits)
+		c->bit_offset = c->bm_bits;
+
+	return 1;
+}
+
+static enum drbd_bitmap_code dcbp_get_code(struct p_compressed_bm *p)
+{
+	return (enum drbd_bitmap_code)(p->encoding & 0x0f);
+}
+
+static int dcbp_get_start(struct p_compressed_bm *p)
+{
+	return (p->encoding & 0x80) != 0;
+}
+
+static int dcbp_get_pad_bits(struct p_compressed_bm *p)
+{
+	return (p->encoding >> 4) & 0x7;
+}
+
+/*
+ * recv_bm_rle_bits
+ *
+ * Return 0 when done, 1 when another iteration is needed, and a negative error
+ * code upon failure.
+ */
+static int
+recv_bm_rle_bits(struct drbd_peer_device *peer_device,
+		struct p_compressed_bm *p,
+		 struct bm_xfer_ctx *c,
+		 unsigned int len)
+{
+	struct bitstream bs;
+	u64 look_ahead;
+	u64 rl_4k;
+	u64 tmp;
+	unsigned long s_4k = c->bit_offset_4k;
+	int toggle = dcbp_get_start(p);
+	int have;
+	int bits;
+
+	bitstream_init(&bs, p->code, len, dcbp_get_pad_bits(p));
+
+	bits = bitstream_get_bits(&bs, &look_ahead, 64);
+	if (bits < 0)
+		return -EIO;
+
+	for (have = bits; have > 0; s_4k += rl_4k, toggle = !toggle) {
+		bits = vli_decode_bits(&rl_4k, look_ahead);
+		if (bits <= 0)
+			return -EIO;
+
+		if (toggle) {
+			/* If peers bm_block_size is smaller than ours,
+			 * this may be a "partially" set bit ;-)
+			 * there is no such thing. Round down s, round up e.
+			 */
+			unsigned long s = s_4k >> c->scale;
+			unsigned long e = ((s_4k + rl_4k + (1UL << c->scale)-1) >> c->scale) - 1;
+
+			if (e >= c->bm_bits) {
+				drbd_err(peer_device, "bitmap overflow (e:%lu) while decoding bm RLE packet\n", e);
+				return -EIO;
+			}
+			drbd_bm_set_many_bits(peer_device, s, e);
+		}
+
+		if (have < bits) {
+			drbd_err(peer_device, "bitmap decoding error: h:%d b:%d la:0x%08llx l:%u/%u\n",
+				have, bits, look_ahead,
+				(unsigned int)(bs.cur.b - p->code),
+				(unsigned int)bs.buf_len);
+			return -EIO;
+		}
+		/* if we consumed all 64 bits, assign 0; >> 64 is "undefined"; */
+		if (likely(bits < 64))
+			look_ahead >>= bits;
+		else
+			look_ahead = 0;
+		have -= bits;
+
+		bits = bitstream_get_bits(&bs, &tmp, 64 - have);
+		if (bits < 0)
+			return -EIO;
+		look_ahead |= tmp << have;
+		have += bits;
+	}
+
+	c->bit_offset_4k = s_4k;
+	c->bit_offset = s_4k >> c->scale;
+	bm_xfer_ctx_bit_to_word_offset(c);
+
+	return (c->bit_offset_4k != c->bm_bits_4k);
+}
+
+/*
+ * decode_bitmap_c
+ *
+ * Return 0 when done, 1 when another iteration is needed, and a negative error
+ * code upon failure.
+ */
+static int
+decode_bitmap_c(struct drbd_peer_device *peer_device,
+		struct p_compressed_bm *p,
+		struct bm_xfer_ctx *c,
+		unsigned int len)
+{
+	if (dcbp_get_code(p) == RLE_VLI_Bits) {
+		struct drbd_device *device = peer_device->device;
+		int res;
+
+		if (!get_ldev(device)) {
+			drbd_err(peer_device, "lost backend device while receiving bitmap\n");
+			return -EIO;
+		}
+
+		res = recv_bm_rle_bits(peer_device, p, c, len - sizeof(*p));
+		put_ldev(device);
+		return res;
+	}
+
+	/* other variants had been implemented for evaluation,
+	 * but have been dropped as this one turned out to be "best"
+	 * during all our tests.
+	 */
+
+	drbd_err(peer_device, "receive_bitmap_c: unknown encoding %u\n", p->encoding);
+	change_cstate(peer_device->connection, C_PROTOCOL_ERROR, CS_HARD);
+	return -EIO;
+}
+
+void INFO_bm_xfer_stats(struct drbd_peer_device *peer_device,
+		const char *direction, struct bm_xfer_ctx *c)
+{
+	/* what would it take to transfer it "plaintext" */
+	unsigned int header_size = drbd_header_size(peer_device->connection);
+	unsigned int data_size = DRBD_SOCKET_BUFFER_SIZE - header_size;
+	unsigned int plain =
+		header_size * (DIV_ROUND_UP(c->bm_words, data_size) + 1) +
+		c->bm_words * sizeof(unsigned long);
+	unsigned int total = c->bytes[0] + c->bytes[1];
+	unsigned int r;
+
+	/* total can not be zero. but just in case: */
+	if (total == 0)
+		return;
+
+	/* don't report if not compressed */
+	if (total >= plain)
+		return;
+
+	/* total < plain. check for overflow, still */
+	r = (total > UINT_MAX/1000) ? (total / (plain/1000))
+				    : (1000 * total / plain);
+
+	if (r > 1000)
+		r = 1000;
+
+	r = 1000 - r;
+	drbd_info(peer_device, "%s bitmap stats [Bytes(packets)]: plain %u(%u), RLE %u(%u), "
+	     "total %u; compression: %u.%u%%\n",
+			direction,
+			c->bytes[1], c->packets[1],
+			c->bytes[0], c->packets[0],
+			total, r/10, r % 10);
+}
+
+static bool ready_for_bitmap(struct drbd_device *device)
+{
+	struct drbd_resource *resource = device->resource;
+	bool ready = true;
+
+	read_lock_irq(&resource->state_rwlock);
+	if (device->disk_state[NOW] == D_NEGOTIATING)
+		ready = false;
+	if (test_bit(TWOPC_STATE_CHANGE_PENDING, &resource->flags))
+		ready = false;
+	read_unlock_irq(&resource->state_rwlock);
+
+	return ready;
+}
+
+/* Since we are processing the bitfield from lower addresses to higher,
+   it does not matter if the process it in 32 bit chunks or 64 bit
+   chunks as long as it is little endian. (Understand it as byte stream,
+   beginning with the lowest byte...) If we would use big endian
+   we would need to process it from the highest address to the lowest,
+   in order to be agnostic to the 32 vs 64 bits issue.
+
+   returns 0 on failure, 1 if we successfully received it. */
+static int receive_bitmap(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	enum drbd_repl_state repl_state;
+	struct drbd_device *device;
+	struct bm_xfer_ctx c;
+	int err = -EIO;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+	if (peer_device->bitmap_index == -1) {
+		drbd_err(peer_device, "No bitmap allocated in receive_bitmap()!\n");
+		return -EIO;
+	}
+	device = peer_device->device;
+
+	/* Final repl_states become visible when the disk leaves NEGOTIATING state */
+	wait_event_interruptible(device->resource->state_wait,
+				 ready_for_bitmap(device));
+
+	if (!get_ldev(device)) {
+		drbd_err(device, "Cannot receive bitmap, local disk gone\n");
+		return -EIO;
+	}
+
+	drbd_bm_slot_lock(peer_device, "receive bitmap", BM_LOCK_CLEAR | BM_LOCK_BULK);
+	/* you are supposed to send additional out-of-sync information
+	 * if you actually set bits during this phase */
+
+	if (!get_ldev(device))
+		goto out;
+
+	c = (struct bm_xfer_ctx) {
+		.bm_bits_4k = drbd_bm_bits_4k(device),
+		.bm_bits = drbd_bm_bits(device),
+		.bm_words = drbd_bm_words(device),
+		.scale = device->bitmap->bm_block_shift - BM_BLOCK_SHIFT_4k,
+	};
+	put_ldev(device);
+
+	for (;;) {
+		if (pi->cmd == P_BITMAP)
+			err = receive_bitmap_plain(peer_device, pi->size, &c);
+		else if (pi->cmd == P_COMPRESSED_BITMAP) {
+			/* MAYBE: sanity check that we speak proto >= 90,
+			 * and the feature is enabled! */
+			struct p_compressed_bm *p;
+
+			if (pi->size > DRBD_SOCKET_BUFFER_SIZE - drbd_header_size(connection)) {
+				drbd_err(device, "ReportCBitmap packet too large\n");
+				err = -EIO;
+				goto out;
+			}
+			if (pi->size <= sizeof(*p)) {
+				drbd_err(device, "ReportCBitmap packet too small (l:%u)\n", pi->size);
+				err = -EIO;
+				goto out;
+			}
+			err = drbd_recv_all(connection, (void **)&p, pi->size);
+			if (err)
+			       goto out;
+			err = decode_bitmap_c(peer_device, p, &c, pi->size);
+		} else {
+			drbd_warn(device, "receive_bitmap: cmd neither ReportBitMap nor ReportCBitMap (is 0x%x)", pi->cmd);
+			err = -EIO;
+			goto out;
+		}
+
+		c.packets[pi->cmd == P_BITMAP]++;
+		c.bytes[pi->cmd == P_BITMAP] += drbd_header_size(connection) + pi->size;
+
+		if (err <= 0) {
+			if (err < 0)
+				goto out;
+			break;
+		}
+		err = drbd_recv_header(connection, pi);
+		if (err)
+			goto out;
+	}
+
+	INFO_bm_xfer_stats(peer_device, "receive", &c);
+
+	repl_state = peer_device->repl_state[NOW];
+	if (repl_state == L_WF_BITMAP_T) {
+		err = drbd_send_bitmap(device, peer_device);
+		if (err)
+			goto out;
+	}
+
+	drbd_bm_slot_unlock(peer_device);
+	put_ldev(device);
+
+	if (test_bit(B_RS_H_DONE, &peer_device->flags)) {
+		/* We have entered drbd_start_resync() since starting the bitmap exchange. */
+		drbd_warn(peer_device, "Received bitmap more than once; ignoring\n");
+	} else if (repl_state == L_WF_BITMAP_S) {
+		drbd_start_resync(peer_device, L_SYNC_SOURCE, "receive-bitmap");
+	} else if (repl_state == L_WF_BITMAP_T) {
+		if (connection->agreed_pro_version < 110) {
+			enum drbd_state_rv rv;
+
+			/* Omit CS_WAIT_COMPLETE and CS_SERIALIZE with this state
+			 * transition to avoid deadlocks. */
+			rv = stable_change_repl_state(peer_device, L_WF_SYNC_UUID, CS_VERBOSE,
+					"receive-bitmap");
+			D_ASSERT(device, rv == SS_SUCCESS);
+		} else {
+			drbd_start_resync(peer_device, L_SYNC_TARGET, "receive-bitmap");
+		}
+	} else {
+		/* admin may have requested C_DISCONNECTING,
+		 * other threads may have noticed network errors */
+		drbd_info(peer_device, "unexpected repl_state (%s) in receive_bitmap\n",
+			  drbd_repl_str(repl_state));
+	}
+
+	return 0;
+ out:
+	drbd_bm_slot_unlock(peer_device);
+	put_ldev(device);
+	return err;
+}
+
+static int receive_skip(struct drbd_connection *connection, struct packet_info *pi)
+{
+	drbd_warn(connection, "skipping unknown optional packet type %d, l: %d!\n",
+		 pi->cmd, pi->size);
+
+	return ignore_remaining_packet(connection, pi->size);
+}
+
+static int receive_UnplugRemote(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_transport *transport = &connection->transport;
+
+	/* Make sure we've acked all the data associated
+	 * with the data requests being unplugged */
+	transport->class->ops.hint(transport, DATA_STREAM, QUICKACK);
+
+	/* just unplug all devices always, regardless which volume number */
+	drbd_unplug_all_devices(connection);
+
+	return 0;
+}
+
+static int receive_out_of_sync(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
 	struct p_block_desc *p = pi->data;
+	sector_t sector;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+
+	sector = be64_to_cpu(p->sector);
+
+	/* see also process_one_request(), before drbd_send_out_of_sync().
+	 * Make sure any pending write requests that potentially may
+	 * set in-sync have drained, before setting it out-of-sync.
+	 * That should be implicit, because of the "epoch" and P_BARRIER logic,
+	 * But let's just double-check.
+	 */
+	conn_wait_active_ee_empty_or_disconnect(connection);
+	conn_wait_done_ee_empty_or_disconnect(connection);
+
+	drbd_set_out_of_sync(peer_device, sector, be32_to_cpu(p->blksize));
+
+	return 0;
+}
+
+static int receive_dagtag(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_dagtag *p = pi->data;
+
+	set_connection_dagtag(connection, be64_to_cpu(p->dagtag));
+	return 0;
+}
+
+struct drbd_connection *drbd_connection_by_node_id(struct drbd_resource *resource, int node_id)
+{
+	/* Caller needs to hold rcu_read_lock(), conf_update */
+	struct drbd_connection *connection;
+
+	for_each_connection_rcu(connection, resource) {
+		if (connection->peer_node_id == node_id)
+			return connection;
+	}
+
+	return NULL;
+}
+
+struct drbd_connection *drbd_get_connection_by_node_id(struct drbd_resource *resource, int node_id)
+{
+	struct drbd_connection *connection;
+
+	rcu_read_lock();
+	connection = drbd_connection_by_node_id(resource, node_id);
+	if (connection)
+		kref_get(&connection->kref);
+	rcu_read_unlock();
+
+	return connection;
+}
+
+static int receive_peer_dagtag(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device;
+	enum drbd_repl_state new_repl_state;
+	struct p_peer_dagtag *p = pi->data;
+	struct drbd_connection *lost_peer;
+	enum sync_strategy strategy = NO_SYNC;
+	s64 dagtag_offset;
+	int vnr = 0;
+
+	lost_peer = drbd_get_connection_by_node_id(resource, be32_to_cpu(p->node_id));
+	if (!lost_peer)
+		return 0;
+
+
+	if (lost_peer->cstate[NOW] == C_CONNECTED) {
+		drbd_ping_peer(lost_peer);
+		if (lost_peer->cstate[NOW] == C_CONNECTED)
+			goto out;
+	}
+
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		enum sync_strategy ps;
+		enum sync_rule rule;
+		int unused;
+
+		if (peer_device->repl_state[NOW] > L_ESTABLISHED)
+			goto out;
+		if (peer_device->device->disk_state[NOW] != D_CONSISTENT &&
+		    peer_device->device->disk_state[NOW] != D_UP_TO_DATE)
+			goto out;
+		if (!get_ldev(peer_device->device))
+			continue;
+		ps = drbd_uuid_compare(peer_device, &rule, &unused);
+		put_ldev(peer_device->device);
+
+		if (strategy == NO_SYNC) {
+			strategy = ps;
+			if (strategy != NO_SYNC &&
+			    strategy != SYNC_SOURCE_USE_BITMAP &&
+			    strategy != SYNC_TARGET_USE_BITMAP) {
+				drbd_info(peer_device,
+					  "%s(): %s by rule=%s\n",
+					  __func__,
+					  strategy_descriptor(strategy).name,
+					  drbd_sync_rule_str(rule));
+				goto out;
+			}
+		} else if (ps != strategy) {
+			drbd_err(peer_device,
+				 "%s(): Inconsistent resync directions %s %s\n",
+				 __func__,
+				 strategy_descriptor(strategy).name, strategy_descriptor(ps).name);
+			goto out;
+		}
+	}
+
+	/* We must wait until the other receiver thread has called the
+	 * cleanup_unacked_peer_requests() and drbd_notify_peers_lost_primary() functions. If we
+	 * become a resync target, the peer would complain about being in the wrong state when he
+	 * gets the bitmap before the P_PEER_DAGTAG packet.
+	 */
+	wait_event(resource->state_wait,
+		   !test_bit(NOTIFY_PEERS_LOST_PRIMARY, &lost_peer->flags));
+
+	dagtag_offset = atomic64_read(&lost_peer->last_dagtag_sector) - (s64)be64_to_cpu(p->dagtag);
+	if (strategy == SYNC_SOURCE_USE_BITMAP)  {
+		new_repl_state = L_WF_BITMAP_S;
+	} else if (strategy == SYNC_TARGET_USE_BITMAP)  {
+		new_repl_state = L_WF_BITMAP_T;
+	} else {
+		if (dagtag_offset > 0)
+			new_repl_state = L_WF_BITMAP_S;
+		else if (dagtag_offset < 0)
+			new_repl_state = L_WF_BITMAP_T;
+		else
+			new_repl_state = L_ESTABLISHED;
+	}
+
+	if (new_repl_state != L_ESTABLISHED) {
+		unsigned long irq_flags;
+		enum drbd_state_rv rv;
+
+		if (new_repl_state == L_WF_BITMAP_T) {
+			connection->after_reconciliation.dagtag_sector = be64_to_cpu(p->dagtag);
+			connection->after_reconciliation.lost_node_id = be32_to_cpu(p->node_id);
+		}
+
+		begin_state_change(resource, &irq_flags, CS_VERBOSE);
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			__change_repl_state(peer_device, new_repl_state);
+			set_bit(RECONCILIATION_RESYNC, &peer_device->flags);
+		}
+		rv = end_state_change(resource, &irq_flags, "receive-peer-dagtag");
+		if (rv == SS_SUCCESS)
+			drbd_info(connection, "Reconciliation resync because \'%s\' disappeared. (o=%d)\n",
+				  lost_peer->transport.net_conf->name, (int)dagtag_offset);
+		else if (rv == SS_NOTHING_TO_DO)
+			drbd_info(connection, "\'%s\' disappeared (o=%d), no reconciliation since one diskless\n",
+				  lost_peer->transport.net_conf->name, (int)dagtag_offset);
+			/* sanitize_state() silently removes the resync and the RECONCILIATION_RESYNC bit */
+		else
+			drbd_info(connection, "rv = %d", rv);
+	} else {
+		drbd_info(connection, "No reconciliation resync even though \'%s\' disappeared. (o=%d)\n",
+			  lost_peer->transport.net_conf->name, (int)dagtag_offset);
+
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			if (get_ldev(peer_device->device)) {
+				drbd_bm_clear_many_bits(peer_device, 0, -1UL);
+				put_ldev(peer_device->device);
+			}
+		}
+	}
+
+out:
+	kref_put(&lost_peer->kref, drbd_destroy_connection);
+	return 0;
+}
+
+static bool drbd_diskless_moved_on(struct drbd_peer_device *peer_device, u64 current_uuid)
+{
+	struct drbd_device *device = peer_device->device;
+	u64 previous = peer_device->current_uuid;
+	bool from_the_past = false;
+
+	/* No exposed UUID => did not move on. */
+	if (!current_uuid)
+		return false;
+
+	/* Same as last time => did not move on. */
+	if ((previous & ~UUID_PRIMARY) == (current_uuid & ~UUID_PRIMARY))
+		return false;
+
+	/* Only consider the peer to have moved on if we were on the same UUID. */
+	if ((previous & ~UUID_PRIMARY) != (drbd_current_uuid(device) & ~UUID_PRIMARY))
+		return false;
+
+	if (get_ldev(device)) {
+		from_the_past =
+			drbd_find_bitmap_by_uuid(peer_device, current_uuid & ~UUID_PRIMARY) != -1;
+		if (!from_the_past)
+			from_the_past = uuid_in_my_history(device, current_uuid & ~UUID_PRIMARY);
+		put_ldev(device);
+	}
+
+	/* It is an old UUID => did not move on. */
+	if (from_the_past)
+		return false;
+
+	return true;
+}
+
+/* Accept a new current UUID generated on a diskless node, that just became primary
+   (or during handshake) */
+static int receive_current_uuid(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	struct p_current_uuid *p = pi->data;
+	u64 current_uuid, weak_nodes;
+	bool moved_on;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return config_unknown_volume(connection, pi);
+	device = peer_device->device;
+
+	current_uuid = be64_to_cpu(p->uuid);
+	weak_nodes = be64_to_cpu(p->weak_nodes);
+	weak_nodes |= NODE_MASK(peer_device->node_id);
+	moved_on = drbd_diskless_moved_on(peer_device, current_uuid);
+
+	peer_device->current_uuid = current_uuid;
+
+	if (get_ldev(device)) {
+		struct drbd_peer_md *peer_md = &device->ldev->md.peers[peer_device->node_id];
+		peer_md->flags |= MDF_NODE_EXISTS;
+		put_ldev(device);
+	}
+	if (connection->peer_role[NOW] == R_PRIMARY)
+		check_resync_source(device, weak_nodes);
+
+	if (connection->peer_role[NOW] == R_UNKNOWN) {
+		set_bit(CURRENT_UUID_RECEIVED, &peer_device->flags);
+		if (moved_on && device->disk_state[NOW] > D_OUTDATED)
+			peer_device->connect_state.disk = D_OUTDATED;
+		return 0;
+	}
+
+	if (current_uuid == drbd_current_uuid(device))
+		return 0;
+
+	if (peer_device->repl_state[NOW] >= L_ESTABLISHED &&
+	    get_ldev_if_state(device, D_UP_TO_DATE)) {
+		if (connection->peer_role[NOW] == R_PRIMARY) {
+			drbd_warn(peer_device, "received new current UUID: %016llX "
+				  "weak_nodes=%016llX\n", current_uuid, weak_nodes);
+			drbd_uuid_received_new_current(peer_device, current_uuid, weak_nodes);
+			drbd_md_sync_if_dirty(device);
+		} else if (moved_on) {
+			if (resource->remote_state_change)
+				set_bit(OUTDATE_ON_2PC_COMMIT, &device->flags);
+			else
+				change_disk_state(device, D_OUTDATED, CS_VERBOSE,
+						"receive-current-uuid", NULL);
+		}
+		put_ldev(device);
+	} else if (device->disk_state[NOW] == D_DISKLESS && resource->role[NOW] == R_PRIMARY) {
+		drbd_uuid_set_exposed(device, peer_device->current_uuid, true);
+	}
+
+	return 0;
+}
+
+static bool interval_is_adjacent(const struct drbd_interval *i1, const struct drbd_interval *i2)
+{
+	return i1->sector + (i1->size >> SECTOR_SHIFT) == i2->sector;
+}
+
+/* Advance caching pointers received_last and discard_last. Return next discard to be submitted. */
+static struct drbd_peer_request *drbd_advance_to_next_rs_discard(
+		struct drbd_peer_device *peer_device, unsigned int align, bool submit_all)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_peer_request *peer_req;
+	struct drbd_peer_request *discard_last = peer_device->discard_last;
+	bool discard_range_end = false;
+
+	/* Advance received_last. */
+	peer_req = list_prepare_entry(peer_device->received_last,
+			&peer_device->resync_requests, recv_order);
+	list_for_each_entry_continue(peer_req, &peer_device->resync_requests, recv_order) {
+		if (!test_bit(INTERVAL_RECEIVED, &peer_req->i.flags) && !submit_all)
+			break;
+
+		if (peer_req->flags & EE_TRIM)
+			break;
+
+		peer_device->received_last = peer_req;
+	}
+
+	/* Advance discard_last. */
+	peer_req = discard_last ? discard_last :
+		list_prepare_entry(peer_device->received_last,
+				&peer_device->resync_requests, recv_order);
+	list_for_each_entry_continue(peer_req, &peer_device->resync_requests, recv_order) {
+		/* Consider submitting previous discards. */
+		if (discard_last && !interval_is_adjacent(&discard_last->i, &peer_req->i)) {
+			discard_range_end = true;
+			break;
+		}
+
+		if (!(peer_req->flags & EE_TRIM)) {
+			discard_range_end =
+				test_bit(INTERVAL_RECEIVED, &peer_req->i.flags) || submit_all;
+			break;
+		}
+
+		discard_last = peer_req;
+
+		if (IS_ALIGNED(peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT), align)) {
+			discard_range_end = true;
+			break;
+		}
+	}
+
+	/*
+	 * If we haven't found a discard range, or that range is not
+	 * finished, then there is nothing to submit.
+	 */
+	if (!discard_last || !(discard_range_end || discard_last->flags & EE_LAST_RESYNC_REQUEST)) {
+		peer_device->discard_last = discard_last;
+		return NULL;
+	}
+
+	/* Find start of discard range. */
+	peer_req = list_next_entry(list_prepare_entry(peer_device->received_last,
+				&peer_device->resync_requests, recv_order), recv_order);
+
+	spin_lock(&device->interval_lock); /* irqs already disabled */
+	if (peer_req != discard_last) {
+		struct drbd_peer_request *peer_req_merged = peer_req;
+
+		list_for_each_entry_continue(peer_req_merged,
+				&peer_device->resync_requests, recv_order) {
+			drbd_remove_interval(&device->requests, &peer_req_merged->i);
+			drbd_clear_interval(&peer_req_merged->i);
+			peer_req_merged->w.cb = e_end_resync_block;
+			if (peer_req_merged == discard_last)
+				break;
+		}
+	}
+	drbd_update_interval_size(&peer_req->i,
+			discard_last->i.size +
+			((discard_last->i.sector - peer_req->i.sector) << SECTOR_SHIFT));
+	spin_unlock(&device->interval_lock);
+
+	peer_device->received_last = discard_last;
+	peer_device->discard_last = NULL;
+
+	return peer_req;
+}
+
+static void drbd_submit_rs_discard(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+
+	if (get_ldev(device)) {
+		list_del(&peer_req->w.list);
+
+		peer_req->w.cb = e_end_resync_block;
+		peer_req->bios.head->bi_opf = REQ_OP_DISCARD;
+
+		atomic_inc(&connection->backing_ee_cnt);
+		drbd_conflict_submit_resync_request(peer_req);
+
+		/* No put_ldev() here. Gets called in drbd_endio_write_sec_final(). */
+	} else {
+		LIST_HEAD(free_list);
+		struct drbd_peer_request *t;
+
+		if (drbd_ratelimit())
+			drbd_err(device, "Cannot discard on local disk.\n");
+
+		drbd_send_ack(peer_device, P_RS_NEG_ACK, peer_req);
+
+		drbd_remove_peer_req_interval(peer_req);
+		list_move_tail(&peer_req->w.list, &free_list);
+
+		spin_lock_irq(&connection->peer_reqs_lock);
+		drbd_unmerge_discard(peer_req, &free_list);
+		spin_unlock_irq(&connection->peer_reqs_lock);
+
+		list_for_each_entry_safe(peer_req, t, &free_list, w.list)
+			drbd_free_peer_req(peer_req);
+	}
+}
+
+/* Find and submit discards in resync_requests which are ready. */
+void drbd_process_rs_discards(struct drbd_peer_device *peer_device, bool submit_all)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_peer_request *peer_req;
+	struct drbd_peer_request *pr_tmp;
+	unsigned int align = DRBD_MAX_RS_DISCARD_SIZE;
+	LIST_HEAD(work_list);
+
+	if (get_ldev(device)) {
+		/*
+		 * Limit the size of the merged requests. We want to allow the size to
+		 * increase up to the backing discard granularity.  If that is smaller
+		 * than DRBD_MAX_RS_DISCARD_SIZE, then allow merging up to a size of
+		 * DRBD_MAX_RS_DISCARD_SIZE.
+		 */
+		align = max(DRBD_MAX_RS_DISCARD_SIZE, bdev_discard_granularity(
+					device->ldev->backing_bdev)) >> SECTOR_SHIFT;
+		put_ldev(device);
+	}
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	while (true) {
+		peer_req = drbd_advance_to_next_rs_discard(peer_device, align, submit_all);
+		if (!peer_req)
+			break;
+
+		list_add_tail(&peer_req->w.list, &work_list);
+	}
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	list_for_each_entry_safe(peer_req, pr_tmp, &work_list, w.list)
+		drbd_submit_rs_discard(peer_req); /* removes it from the work_list */
+}
+
+static int receive_rs_deallocated(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
 	struct drbd_device *device;
+	struct drbd_peer_request *peer_req;
 	sector_t sector;
 	int size, err = 0;
+	u64 block_id;
+	u64 im;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
 		return -EIO;
 	device = peer_device->device;
 
-	sector = be64_to_cpu(p->sector);
-	size = be32_to_cpu(p->blksize);
+	if (pi->cmd == P_RS_DEALLOCATED) {
+		struct p_block_desc *p = pi->data;
+
+		sector = be64_to_cpu(p->sector);
+		size = be32_to_cpu(p->blksize);
+		block_id = ID_SYNCER;
+	} else { /* P_RS_DEALLOCATED_ID */
+		struct p_block_ack *p = pi->data;
+
+		sector = be64_to_cpu(p->sector);
+		size = be32_to_cpu(p->blksize);
+		block_id = p->block_id;
+	}
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_RESYNC_WRITE),
+			sector, size, block_id);
+	if (!peer_req)
+		return -EIO;
+
+	dec_rs_pending(peer_device);
+	inc_unacked(peer_device);
+	atomic_add(size >> 9, &device->rs_sect_ev);
+	peer_req->flags |= EE_TRIM;
+
+	/* Setting all peers out of sync here. The sync source peer will be
+	 * set in sync when the discard completes. The sync source will soon
+	 * set other peers in sync with a P_PEERS_IN_SYNC packet.
+	 */
+	drbd_set_all_out_of_sync(device, sector, size);
+	drbd_process_rs_discards(peer_device, false);
+	rs_sectors_came_in(peer_device, size);
+
+	for_each_peer_device_ref(peer_device, im, device) {
+		enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+
+		if (repl_is_sync_source(repl_state) || repl_state == L_WF_BITMAP_S)
+			drbd_send_out_of_sync(peer_device, sector, size);
+	}
+
+	return err;
+}
+
+void drbd_last_resync_request(struct drbd_peer_device *peer_device, bool submit_all)
+{
+	struct drbd_connection *connection = peer_device->connection;
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	if (!list_empty(&peer_device->resync_requests)) {
+		struct drbd_peer_request *peer_req = list_last_entry(&peer_device->resync_requests,
+				struct drbd_peer_request, recv_order);
+		peer_req->flags |= EE_LAST_RESYNC_REQUEST;
+	}
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	drbd_process_rs_discards(peer_device, submit_all);
+}
+
+static int receive_disconnect(struct drbd_connection *connection, struct packet_info *pi)
+{
+	change_cstate_tag(connection, C_DISCONNECTING, CS_HARD, "receive-disconnect", NULL);
+	return 0;
+}
+
+struct data_cmd {
+	int expect_payload;
+	unsigned int pkt_size;
+	int (*fn)(struct drbd_connection *, struct packet_info *);
+};
+
+static struct data_cmd drbd_cmd_handler[] = {
+	[P_DATA]	    = { 1, sizeof(struct p_data), receive_Data },
+	[P_DATA_REPLY]	    = { 1, sizeof(struct p_data), receive_DataReply },
+	[P_RS_DATA_REPLY]   = { 1, sizeof(struct p_data), receive_RSDataReply },
+	[P_BARRIER]	    = { 0, sizeof(struct p_barrier), receive_Barrier },
+	[P_BITMAP]	    = { 1, 0, receive_bitmap },
+	[P_COMPRESSED_BITMAP] = { 1, 0, receive_bitmap },
+	[P_UNPLUG_REMOTE]   = { 0, 0, receive_UnplugRemote },
+	[P_DATA_REQUEST]    = { 0, sizeof(struct p_block_req), receive_data_request },
+	[P_RS_DATA_REQUEST] = { 0, sizeof(struct p_block_req), receive_data_request },
+	[P_SYNC_PARAM]	    = { 1, 0, receive_SyncParam },
+	[P_SYNC_PARAM89]    = { 1, 0, receive_SyncParam },
+	[P_PROTOCOL]        = { 1, sizeof(struct p_protocol), receive_protocol },
+	[P_UUIDS]	    = { 0, sizeof(struct p_uuids), receive_uuids },
+	[P_SIZES]	    = { 0, sizeof(struct p_sizes), receive_sizes },
+	[P_STATE]	    = { 0, sizeof(struct p_state), receive_state },
+	[P_STATE_CHG_REQ]   = { 0, sizeof(struct p_req_state), receive_req_state },
+	[P_SYNC_UUID]       = { 0, sizeof(struct p_uuid), receive_sync_uuid },
+	[P_OV_REQUEST]      = { 0, sizeof(struct p_block_req), receive_data_request },
+	[P_OV_REPLY]        = { 1, sizeof(struct p_block_req), receive_ov_reply },
+	[P_CSUM_RS_REQUEST] = { 1, sizeof(struct p_block_req), receive_data_request },
+	[P_RS_THIN_REQ]     = { 0, sizeof(struct p_block_req), receive_data_request },
+	[P_DELAY_PROBE]     = { 0, sizeof(struct p_delay_probe93), receive_skip },
+	[P_OUT_OF_SYNC]     = { 0, sizeof(struct p_block_desc), receive_out_of_sync },
+	[P_CONN_ST_CHG_REQ] = { 0, sizeof(struct p_req_state), receive_req_state },
+	[P_PROTOCOL_UPDATE] = { 1, sizeof(struct p_protocol), receive_protocol },
+	[P_TWOPC_PREPARE] = { 0, sizeof(struct p_twopc_request), receive_twopc },
+	[P_TWOPC_PREP_RSZ]  = { 0, sizeof(struct p_twopc_request), receive_twopc },
+	[P_TWOPC_ABORT] = { 0, sizeof(struct p_twopc_request), receive_twopc },
+	[P_DAGTAG]	    = { 0, sizeof(struct p_dagtag), receive_dagtag },
+	[P_UUIDS110]	    = { 1, sizeof(struct p_uuids110), receive_uuids110 },
+	[P_PEER_DAGTAG]     = { 0, sizeof(struct p_peer_dagtag), receive_peer_dagtag },
+	[P_CURRENT_UUID]    = { 0, sizeof(struct p_current_uuid), receive_current_uuid },
+	[P_TWOPC_COMMIT]    = { 0, sizeof(struct p_twopc_request), receive_twopc },
+	[P_TRIM]	    = { 0, sizeof(struct p_trim), receive_Data },
+	[P_ZEROES]	    = { 0, sizeof(struct p_trim), receive_Data },
+	[P_RS_DEALLOCATED]  = { 0, sizeof(struct p_block_desc), receive_rs_deallocated },
+	[P_RS_DEALLOCATED_ID] = { 0, sizeof(struct p_block_ack), receive_rs_deallocated },
+	[P_DISCONNECT]      = { 0, 0, receive_disconnect },
+	[P_RS_DAGTAG_REQ]   = { 0, sizeof(struct p_rs_req), receive_dagtag_data_request },
+	[P_RS_CSUM_DAGTAG_REQ]   = { 1, sizeof(struct p_rs_req), receive_dagtag_data_request },
+	[P_RS_THIN_DAGTAG_REQ]   = { 0, sizeof(struct p_rs_req), receive_dagtag_data_request },
+	[P_OV_DAGTAG_REQ]   = { 0, sizeof(struct p_rs_req), receive_dagtag_data_request },
+	[P_OV_DAGTAG_REPLY]   = { 1, sizeof(struct p_rs_req), receive_dagtag_ov_reply },
+	[P_FLUSH_REQUESTS]  = { 0, sizeof(struct p_flush_requests), receive_flush_requests },
+	[P_FLUSH_REQUESTS_ACK] = { 0, sizeof(struct p_flush_ack), receive_flush_requests_ack },
+	[P_ENABLE_REPLICATION_NEXT] = { 0, sizeof(struct p_enable_replication),
+		receive_enable_replication_next },
+	[P_ENABLE_REPLICATION] = { 0, sizeof(struct p_enable_replication),
+		receive_enable_replication },
+};
+
+static void drbdd(struct drbd_connection *connection)
+{
+	struct packet_info pi;
+	size_t shs; /* sub header size */
+	int err;
+
+	while (get_t_state(&connection->receiver) == RUNNING) {
+		struct data_cmd const *cmd;
+
+		drbd_thread_current_set_cpu(&connection->receiver);
+		update_receiver_timing_details(connection, drbd_recv_header_maybe_unplug);
+		if (drbd_recv_header_maybe_unplug(connection, &pi))
+			goto err_out;
+
+		cmd = &drbd_cmd_handler[pi.cmd];
+		if (unlikely(pi.cmd >= ARRAY_SIZE(drbd_cmd_handler) || !cmd->fn)) {
+			drbd_err(connection, "Unexpected data packet %s (0x%04x)",
+				 drbd_packet_name(pi.cmd), pi.cmd);
+			goto err_out;
+		}
+
+		shs = cmd->pkt_size;
+		if (pi.cmd == P_SIZES && connection->agreed_features & DRBD_FF_WSAME)
+			shs += sizeof(struct o_qlim);
+		if (pi.size > shs && !cmd->expect_payload) {
+			drbd_err(connection, "No payload expected %s l:%d\n",
+				 drbd_packet_name(pi.cmd), pi.size);
+			goto err_out;
+		}
+		if (pi.size < shs) {
+			drbd_err(connection, "%s: unexpected packet size, expected:%d received:%d\n",
+				 drbd_packet_name(pi.cmd), (int)shs, pi.size);
+			goto err_out;
+		}
+
+		if (shs) {
+			update_receiver_timing_details(connection, drbd_recv_all_warn);
+			err = drbd_recv_all_warn(connection, &pi.data, shs);
+			if (err)
+				goto err_out;
+			pi.size -= shs;
+		}
+
+		update_receiver_timing_details(connection, cmd->fn);
+		err = cmd->fn(connection, &pi);
+		if (err) {
+			drbd_err(connection, "error receiving %s, e: %d l: %d!\n",
+				 drbd_packet_name(pi.cmd), err, pi.size);
+			goto err_out;
+		}
+	}
+	return;
+
+    err_out:
+	change_cstate(connection, C_PROTOCOL_ERROR, CS_HARD);
+}
+
+static void drbd_cancel_conflicting_resync_requests(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+	struct conflict_worker *submit_conflict = &device->submit_conflict;
+	struct rb_node *node;
+	bool any_queued = false;
+
+	spin_lock_irq(&device->interval_lock);
+	for (node = rb_first(&device->requests); node; node = rb_next(node)) {
+		struct drbd_interval *i = rb_entry(node, struct drbd_interval, rb);
+		struct drbd_peer_request *peer_req;
+
+		if (!drbd_interval_is_resync(i))
+			continue;
+
+		peer_req = container_of(i, struct drbd_peer_request, i);
+
+		if (peer_req->peer_device != peer_device)
+			continue;
+
+		/* Only cancel requests which are waiting for conflicts to resolve. */
+		if (test_bit(INTERVAL_SUBMITTED, &i->flags) ||
+				(test_bit(INTERVAL_READY_TO_SEND, &i->flags) &&
+				 !test_bit(INTERVAL_RECEIVED, &i->flags)) ||
+				test_bit(INTERVAL_CANCELED, &i->flags))
+			continue;
+
+		set_bit(INTERVAL_CANCELED, &i->flags);
+
+		dynamic_drbd_dbg(device,
+				"Cancel %s %s request at %llus+%u (sent=%d)\n",
+				test_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &i->flags) ?
+					"already queued" : "unqueued",
+				drbd_interval_type_str(i),
+				(unsigned long long) i->sector, i->size,
+				test_bit(INTERVAL_READY_TO_SEND, &i->flags));
+
+		if (test_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &i->flags))
+			continue;
+
+		set_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &i->flags);
+
+		spin_lock(&submit_conflict->lock);
+		switch (i->type) {
+		case INTERVAL_RESYNC_WRITE:
+			list_add_tail(&peer_req->w.list, &submit_conflict->resync_writes);
+			break;
+		case INTERVAL_RESYNC_READ:
+			list_add_tail(&peer_req->w.list, &submit_conflict->resync_reads);
+			break;
+		default:
+			drbd_err(peer_device, "Unexpected interval type in %s\n", __func__);
+		}
+		spin_unlock(&submit_conflict->lock);
+
+		any_queued = true;
+	}
+	spin_unlock_irq(&device->interval_lock);
+
+	if (any_queued)
+		queue_work(submit_conflict->wq, &submit_conflict->worker);
+}
+
+static void cancel_dagtag_dependent_requests(struct drbd_resource *resource, unsigned int node_id)
+{
+	struct drbd_connection *connection;
+	LIST_HEAD(work_list);
+	struct drbd_peer_request *peer_req, *t;
+
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		spin_lock_irq(&connection->peer_reqs_lock);
+		list_for_each_entry(peer_req, &connection->dagtag_wait_ee, w.list) {
+			if (peer_req->depend_dagtag_node_id != node_id)
+				continue;
+
+			dynamic_drbd_dbg(peer_req->peer_device, "%s at %llus+%u: Wait for dagtag %llus from peer %u cancelled\n",
+					drbd_interval_type_str(&peer_req->i),
+					(unsigned long long) peer_req->i.sector, peer_req->i.size,
+					(unsigned long long) peer_req->depend_dagtag,
+					node_id);
+
+			list_move_tail(&peer_req->w.list, &work_list);
+			break;
+		}
+		spin_unlock_irq(&connection->peer_reqs_lock);
+	}
+	rcu_read_unlock();
+
+	list_for_each_entry_safe(peer_req, t, &work_list, w.list) {
+		drbd_peer_resync_read_cancel(peer_req);
+		drbd_free_peer_req(peer_req);
+	}
+}
+
+static void cleanup_resync_leftovers(struct drbd_peer_device *peer_device)
+{
+	peer_device->rs_total = 0;
+	peer_device->rs_failed = 0;
+	D_ASSERT(peer_device, atomic_read(&peer_device->rs_pending_cnt) == 0);
+
+	timer_delete_sync(&peer_device->resync_timer);
+	resync_timer_fn(&peer_device->resync_timer);
+	timer_delete_sync(&peer_device->start_resync_timer);
+}
+
+static void free_waiting_resync_requests(struct drbd_connection *connection)
+{
+	LIST_HEAD(free_list);
+	struct drbd_peer_device *peer_device;
+	struct drbd_peer_request *peer_req, *t;
+	int vnr;
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		list_for_each_entry_safe(peer_req, t, &peer_device->resync_requests, recv_order) {
+			drbd_list_del_resync_request(peer_req);
+			list_add_tail(&peer_req->w.list, &free_list);
+		}
+	}
+	rcu_read_unlock();
+
+	list_for_each_entry_safe(peer_req, t, &connection->peer_reads, recv_order) {
+		if (peer_req->i.type == INTERVAL_PEER_READ)
+			continue;
+
+		peer_req->flags &= ~EE_ON_RECV_ORDER;
+		list_del(&peer_req->recv_order);
+
+		list_add_tail(&peer_req->w.list, &free_list);
+	}
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	list_for_each_entry_safe(peer_req, t, &free_list, w.list) {
+		/*
+		 * Resync write requests waiting for peers-in-sync to be sent
+		 * just need to be freed.
+		 */
+		if (test_bit(INTERVAL_COMPLETED, &peer_req->i.flags)) {
+			drbd_free_peer_req(peer_req);
+			continue;
+		}
+
+		D_ASSERT(connection, test_bit(INTERVAL_READY_TO_SEND, &peer_req->i.flags));
+		D_ASSERT(connection, !test_bit(INTERVAL_RECEIVED, &peer_req->i.flags));
+		D_ASSERT(connection, !(peer_req->flags & EE_TRIM));
+
+		if (peer_req->i.type == INTERVAL_RESYNC_READ)
+			atomic_sub(peer_req->i.size >> 9, &connection->rs_in_flight);
+
+		dec_rs_pending(peer_req->peer_device);
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
+	}
+}
+
+static void free_dagtag_wait_requests(struct drbd_connection *connection)
+{
+	LIST_HEAD(dagtag_wait_work_list);
+	struct drbd_peer_request *peer_req, *t;
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_splice_init(&connection->dagtag_wait_ee, &dagtag_wait_work_list);
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	list_for_each_entry_safe(peer_req, t, &dagtag_wait_work_list, w.list) {
+		struct drbd_peer_device *peer_device = peer_req->peer_device;
+
+		/* Verify requests are placed in the interval tree when
+		 * the request is made, so they need to be removed if
+		 * the reply was waiting for a dagtag to be reached. */
+		if (peer_req->i.type == INTERVAL_OV_READ_SOURCE)
+			drbd_remove_peer_req_interval(peer_req);
+
+		drbd_free_peer_req(peer_req);
+		dec_unacked(peer_device);
+		put_ldev(peer_device->device);
+	}
+}
+
+static void drain_resync_activity(struct drbd_connection *connection)
+{
+	struct drbd_peer_device *peer_device;
+	int vnr;
+
+	/*
+	 * In order to understand this function, refer to the flow diagrams in
+	 * the comments for make_resync_request(), make_ov_request() and
+	 * receive_dagtag_data_request().
+	 */
+
+	/*
+	 * We could receive data from a peer at any point. This might release a
+	 * request that is waiting for a dagtag. That would cause it to
+	 * progress to waiting for conflicts or the backing disk. So we need to
+	 * remove these requests before flushing the other stages.
+	 */
+	free_dagtag_wait_requests(connection);
+
+	/* Wait for w_resync_timer/w_e_send_csum to finish, if running. */
+	drbd_flush_workqueue(&connection->sender_work);
+
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		struct drbd_device *device = peer_device->device;
+
+		kref_get(&device->kref);
+		rcu_read_unlock();
+
+		/* Cause remaining discards to be submitted. */
+		drbd_last_resync_request(peer_device, true);
+		/* Cause requests waiting due to conflicts to be canceled. */
+		drbd_cancel_conflicting_resync_requests(peer_device);
+
+		kref_put(&device->kref, drbd_destroy_device);
+		rcu_read_lock();
+	}
+	rcu_read_unlock();
+
+	/* Drain conflicting and backing requests. */
+	wait_event(connection->ee_wait, atomic_read(&connection->backing_ee_cnt) == 0);
+
+	/* Wait for work queued when backing requests finished. */
+	drbd_flush_workqueue(&connection->sender_work);
+
+	/* Clear up and remove requests that have progressed to done_ee. */
+	drbd_finish_peer_reqs(connection);
+
+	/*
+	 * Requests that are waiting for a resync reply must be removed from
+	 * the interval tree and then freed.
+	 */
+	free_waiting_resync_requests(connection);
+
+	/* Requests that are waiting for a dagtag on this connection must be
+	 * cancelled, because the dependency will never be fulfilled. */
+	cancel_dagtag_dependent_requests(connection->resource, connection->peer_node_id);
+
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		struct drbd_device *device = peer_device->device;
+
+		kref_get(&device->kref);
+		rcu_read_unlock();
+
+		cleanup_resync_leftovers(peer_device);
+
+		kref_put(&device->kref, drbd_destroy_device);
+		rcu_read_lock();
+	}
+	rcu_read_unlock();
+}
 
-	dec_rs_pending(peer_device);
+static void peer_device_disconnected(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
 
-	if (get_ldev(device)) {
-		struct drbd_peer_request *peer_req;
+	if (test_and_clear_bit(HOLDING_UUID_READ_LOCK, &peer_device->flags))
+		up_read_non_owner(&device->uuid_sem);
 
-		peer_req = drbd_alloc_peer_req(peer_device, ID_SYNCER, sector,
-					       size, 0, GFP_NOIO);
-		if (!peer_req) {
-			put_ldev(device);
-			return -ENOMEM;
-		}
+	peer_device_init_connect_state(peer_device);
 
-		peer_req->w.cb = e_end_resync_block;
-		peer_req->opf = REQ_OP_DISCARD;
-		peer_req->submit_jif = jiffies;
-		peer_req->flags |= EE_TRIM;
+	/* No need to start additional resyncs after reconnection. */
+	peer_device->resync_again = 0;
 
-		spin_lock_irq(&device->resource->req_lock);
-		list_add_tail(&peer_req->w.list, &device->sync_ee);
-		spin_unlock_irq(&device->resource->req_lock);
+	if (!drbd_suspended(device)) {
+		struct drbd_resource *resource = device->resource;
 
-		atomic_add(pi->size >> 9, &device->rs_sect_ev);
-		err = drbd_submit_peer_request(peer_req);
+		/* We need to create the new UUID immediately when we finish
+		   requests that did not reach the lost peer.
+		   But when we lost quorum we are going to finish those
+		   requests with error, therefore do not create the new UUID
+		   immediately! */
+		if (!list_empty(&resource->transfer_log) &&
+		    drbd_data_accessible(device, NOW) &&
+		    !test_bit(PRIMARY_LOST_QUORUM, &device->flags) &&
+		    test_and_clear_bit(NEW_CUR_UUID, &device->flags))
+			drbd_check_peers_new_current_uuid(device);
+	}
 
-		if (err) {
-			spin_lock_irq(&device->resource->req_lock);
-			list_del(&peer_req->w.list);
-			spin_unlock_irq(&device->resource->req_lock);
+	drbd_md_sync(device);
 
-			drbd_free_peer_req(device, peer_req);
-			put_ldev(device);
-			err = 0;
-			goto fail;
-		}
+	if (get_ldev(device)) {
+		drbd_bitmap_io(device, &drbd_bm_write_copy_pages, "write from disconnected",
+				BM_LOCK_BULK | BM_LOCK_SINGLE_SLOT, peer_device);
+		put_ldev(device);
+	}
+}
 
-		inc_unacked(device);
+static bool initiator_can_commit_or_abort(struct drbd_connection *connection)
+{
+	struct drbd_resource *resource = connection->resource;
+	bool remote = resource->twopc_reply.initiator_node_id != resource->res_opts.node_id;
 
-		/* No put_ldev() here. Gets called in drbd_endio_write_sec_final(),
-		   as well as drbd_rs_complete_io() */
-	} else {
-	fail:
-		drbd_rs_complete_io(device, sector);
-		drbd_send_ack_ex(peer_device, P_NEG_ACK, sector, size, ID_SYNCER);
+	if (remote) {
+		u64 parents = resource->twopc_parent_nodes & ~NODE_MASK(connection->peer_node_id);
+
+		if (!parents)
+			return false;
+		resource->twopc_parent_nodes = parents;
 	}
 
-	atomic_add(size >> 9, &device->rs_sect_in);
+	if (test_bit(TWOPC_PREPARED, &connection->flags) &&
+	    !(test_bit(TWOPC_YES, &connection->flags) ||
+	      test_bit(TWOPC_NO, &connection->flags) ||
+	      test_bit(TWOPC_RETRY, &connection->flags)))
+		return false;
 
-	return err;
+	return true;
 }
 
-struct data_cmd {
-	int expect_payload;
-	unsigned int pkt_size;
-	int (*fn)(struct drbd_connection *, struct packet_info *);
-};
+static void cleanup_remote_state_change(struct drbd_connection *connection)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct twopc_reply *reply = &resource->twopc_reply;
+	struct twopc_request request;
+	bool remote = false;
 
-static struct data_cmd drbd_cmd_handler[] = {
-	[P_DATA]	    = { 1, sizeof(struct p_data), receive_Data },
-	[P_DATA_REPLY]	    = { 1, sizeof(struct p_data), receive_DataReply },
-	[P_RS_DATA_REPLY]   = { 1, sizeof(struct p_data), receive_RSDataReply } ,
-	[P_BARRIER]	    = { 0, sizeof(struct p_barrier), receive_Barrier } ,
-	[P_BITMAP]	    = { 1, 0, receive_bitmap } ,
-	[P_COMPRESSED_BITMAP] = { 1, 0, receive_bitmap } ,
-	[P_UNPLUG_REMOTE]   = { 0, 0, receive_UnplugRemote },
-	[P_DATA_REQUEST]    = { 0, sizeof(struct p_block_req), receive_DataRequest },
-	[P_RS_DATA_REQUEST] = { 0, sizeof(struct p_block_req), receive_DataRequest },
-	[P_SYNC_PARAM]	    = { 1, 0, receive_SyncParam },
-	[P_SYNC_PARAM89]    = { 1, 0, receive_SyncParam },
-	[P_PROTOCOL]        = { 1, sizeof(struct p_protocol), receive_protocol },
-	[P_UUIDS]	    = { 0, sizeof(struct p_uuids), receive_uuids },
-	[P_SIZES]	    = { 0, sizeof(struct p_sizes), receive_sizes },
-	[P_STATE]	    = { 0, sizeof(struct p_state), receive_state },
-	[P_STATE_CHG_REQ]   = { 0, sizeof(struct p_req_state), receive_req_state },
-	[P_SYNC_UUID]       = { 0, sizeof(struct p_rs_uuid), receive_sync_uuid },
-	[P_OV_REQUEST]      = { 0, sizeof(struct p_block_req), receive_DataRequest },
-	[P_OV_REPLY]        = { 1, sizeof(struct p_block_req), receive_DataRequest },
-	[P_CSUM_RS_REQUEST] = { 1, sizeof(struct p_block_req), receive_DataRequest },
-	[P_RS_THIN_REQ]     = { 0, sizeof(struct p_block_req), receive_DataRequest },
-	[P_DELAY_PROBE]     = { 0, sizeof(struct p_delay_probe93), receive_skip },
-	[P_OUT_OF_SYNC]     = { 0, sizeof(struct p_block_desc), receive_out_of_sync },
-	[P_CONN_ST_CHG_REQ] = { 0, sizeof(struct p_req_state), receive_req_conn_state },
-	[P_PROTOCOL_UPDATE] = { 1, sizeof(struct p_protocol), receive_protocol },
-	[P_TRIM]	    = { 0, sizeof(struct p_trim), receive_Data },
-	[P_ZEROES]	    = { 0, sizeof(struct p_trim), receive_Data },
-	[P_RS_DEALLOCATED]  = { 0, sizeof(struct p_block_desc), receive_rs_deallocated },
-};
+	write_lock_irq(&resource->state_rwlock);
+	if (resource->remote_state_change && !initiator_can_commit_or_abort(connection)) {
+		remote = reply->initiator_node_id != resource->res_opts.node_id;
 
-static void drbdd(struct drbd_connection *connection)
+		if (remote)
+			request = (struct twopc_request) {
+				.nodes_to_reach = ~0,
+				.cmd = P_TWOPC_ABORT,
+				.tid = reply->tid,
+				.initiator_node_id = reply->initiator_node_id,
+				.target_node_id = reply->target_node_id,
+				.vnr = reply->vnr,
+			};
+
+		drbd_info(connection, "Aborting %s state change %u commit not possible\n",
+			  remote ? "remote" : "local", reply->tid);
+		if (remote) {
+			timer_delete(&resource->twopc_timer);
+			__clear_remote_state_change(resource);
+		} else {
+			enum alt_rv alt_rv = abort_local_transaction(connection, 0);
+			if (alt_rv != ALT_LOCKED)
+				return;
+		}
+	}
+	write_unlock_irq(&resource->state_rwlock);
+
+	/* for a local transaction, change_cluster_wide_state() sends the P_TWOPC_ABORTs */
+	if (remote)
+		nested_twopc_abort(resource, &request);
+}
+
+static void drbd_notify_peers_lost_primary(struct drbd_connection *lost_peer)
 {
-	struct packet_info pi;
-	size_t shs; /* sub header size */
-	int err;
+	struct drbd_resource *resource = lost_peer->resource;
+	struct drbd_connection *connection;
+	u64 im;
 
-	while (get_t_state(&connection->receiver) == RUNNING) {
-		struct data_cmd const *cmd;
+	for_each_connection_ref(connection, im, resource) {
+		struct drbd_peer_device *peer_device;
+		bool send_dagtag = false;
+		int vnr;
 
-		drbd_thread_current_set_cpu(&connection->receiver);
-		update_receiver_timing_details(connection, drbd_recv_header_maybe_unplug);
-		if (drbd_recv_header_maybe_unplug(connection, &pi))
-			goto err_out;
+		if (connection == lost_peer)
+			continue;
+		if (connection->cstate[NOW] != C_CONNECTED)
+			continue;
 
-		cmd = &drbd_cmd_handler[pi.cmd];
-		if (unlikely(pi.cmd >= ARRAY_SIZE(drbd_cmd_handler) || !cmd->fn)) {
-			drbd_err(connection, "Unexpected data packet %s (0x%04x)",
-				 cmdname(pi.cmd), pi.cmd);
-			goto err_out;
-		}
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			struct drbd_device *device = peer_device->device;
+			u64 current_uuid = drbd_current_uuid(device);
+			u64 weak_nodes = drbd_weak_nodes_device(device);
 
-		shs = cmd->pkt_size;
-		if (pi.cmd == P_SIZES && connection->agreed_features & DRBD_FF_WSAME)
-			shs += sizeof(struct o_qlim);
-		if (pi.size > shs && !cmd->expect_payload) {
-			drbd_err(connection, "No payload expected %s l:%d\n",
-				 cmdname(pi.cmd), pi.size);
-			goto err_out;
-		}
-		if (pi.size < shs) {
-			drbd_err(connection, "%s: unexpected packet size, expected:%d received:%d\n",
-				 cmdname(pi.cmd), (int)shs, pi.size);
-			goto err_out;
-		}
+			if (device->disk_state[NOW] < D_INCONSISTENT ||
+			    peer_device->disk_state[NOW] < D_INCONSISTENT)
+				continue; /* Ignore if one side is diskless */
 
-		if (shs) {
-			update_receiver_timing_details(connection, drbd_recv_all_warn);
-			err = drbd_recv_all_warn(connection, pi.data, shs);
-			if (err)
-				goto err_out;
-			pi.size -= shs;
+			drbd_send_current_uuid(peer_device, current_uuid, weak_nodes);
+			send_dagtag = true;
 		}
 
-		update_receiver_timing_details(connection, cmd->fn);
-		err = cmd->fn(connection, &pi);
-		if (err) {
-			drbd_err(connection, "error receiving %s, e: %d l: %d!\n",
-				 cmdname(pi.cmd), err, pi.size);
-			goto err_out;
-		}
+		if (send_dagtag)
+			drbd_send_peer_dagtag(connection, lost_peer);
 	}
-	return;
-
-    err_out:
-	conn_request_state(connection, NS(conn, C_PROTOCOL_ERROR), CS_HARD);
 }
 
 static void conn_disconnect(struct drbd_connection *connection)
 {
+	struct drbd_resource *resource = connection->resource;
 	struct drbd_peer_device *peer_device;
-	enum drbd_conns oc;
-	int vnr;
+	enum drbd_conn_state oc;
+	unsigned long irq_flags;
+	int vnr, i;
 
-	if (connection->cstate == C_STANDALONE)
+	clear_bit(CONN_DRY_RUN, &connection->flags);
+	clear_bit(CONN_CONGESTED, &connection->flags);
+
+	if (connection->cstate[NOW] == C_STANDALONE)
 		return;
 
 	/* We are about to start the cleanup after connection loss.
-	 * Make sure drbd_make_request knows about that.
+	 * Make sure drbd_submit_bio knows about that.
 	 * Usually we should be in some network failure state already,
 	 * but just in case we are not, we fix it up here.
 	 */
-	conn_request_state(connection, NS(conn, C_NETWORK_FAILURE), CS_HARD);
+	change_cstate_tag(connection, C_NETWORK_FAILURE, CS_HARD, "disconnected", NULL);
+
+	del_connect_timer(connection);
 
 	/* ack_receiver does not clean up anything. it must not interfere, either */
-	drbd_thread_stop(&connection->ack_receiver);
 	if (connection->ack_sender) {
 		destroy_workqueue(connection->ack_sender);
 		connection->ack_sender = NULL;
 	}
-	drbd_free_sock(connection);
+
+	/* restart sender thread,
+	 * potentially get it out of blocking network operations */
+	drbd_thread_stop(&connection->sender);
+	drbd_thread_start(&connection->sender);
+
+	mutex_lock(&resource->conf_update);
+	drbd_transport_shutdown(connection, CLOSE_CONNECTION);
+	mutex_unlock(&resource->conf_update);
+
+	cleanup_remote_state_change(connection);
+
+	drain_resync_activity(connection);
+
+	connection->after_reconciliation.lost_node_id = -1;
+
+	/* Wait for current activity to cease.  This includes waiting for
+	 * peer_request queued to the submitter workqueue. */
+	wait_event(connection->ee_wait,
+		atomic_read(&connection->active_ee_cnt) == 0);
+
+	/* wait for all w_e_end_data_req, w_e_end_rsdata_req, w_send_barrier,
+	 * etc. which may still be on the worker queue to be "canceled" */
+	drbd_flush_workqueue(&connection->sender_work);
+
+	drbd_finish_peer_reqs(connection);
+
+	/* This second workqueue flush is necessary, since drbd_finish_peer_reqs()
+	   might have issued a work again. The one before drbd_finish_peer_reqs() is
+	   necessary to reclaim net_ee in drbd_finish_peer_reqs(). */
+	drbd_flush_workqueue(&connection->sender_work);
 
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
+
 		kref_get(&device->kref);
 		rcu_read_unlock();
-		drbd_disconnected(peer_device);
+
+		peer_device_disconnected(peer_device);
+		if (get_ldev(device)) {
+			drbd_reconsider_queue_parameters(device, device->ldev);
+			put_ldev(device);
+		} else {
+			drbd_reconsider_queue_parameters(device, NULL);
+		}
+
 		kref_put(&device->kref, drbd_destroy_device);
 		rcu_read_lock();
 	}
 	rcu_read_unlock();
 
+	/* Apply these changes after peer_device_disconnected() because that
+	 * may cause the loss of other connections to be detected, which can
+	 * change the suspended state. */
+	tl_walk(connection, &connection->req_not_net_done,
+			resource->cached_susp ? CONNECTION_LOST_WHILE_SUSPENDED : CONNECTION_LOST);
+
+	i = drbd_free_peer_reqs(connection, &connection->done_ee);
+	if (i)
+		drbd_info(connection, "done_ee not empty, killed %u entries\n", i);
+	i = drbd_free_peer_reqs(connection, &connection->dagtag_wait_ee);
+	if (i)
+		drbd_info(connection, "dagtag_wait_ee not empty, killed %u entries\n", i);
+
+	cleanup_unacked_peer_requests(connection);
+	cleanup_peer_ack_list(connection);
+
+	i = atomic_read(&connection->pp_in_use);
+	if (i)
+		drbd_info(connection, "pp_in_use = %d, expected 0\n", i);
+	i = atomic_read(&connection->pp_in_use_by_net);
+	if (i)
+		drbd_info(connection, "pp_in_use_by_net = %d, expected 0\n", i);
+
 	if (!list_empty(&connection->current_epoch->list))
 		drbd_err(connection, "ASSERTION FAILED: connection->current_epoch->list not empty\n");
 	/* ok, no more ee's on the fly, it is safe to reset the epoch_size */
 	atomic_set(&connection->current_epoch->epoch_size, 0);
 	connection->send.seen_any_write_yet = false;
+	connection->send.current_dagtag_sector =
+		resource->dagtag_sector - ((BIO_MAX_VECS << PAGE_SHIFT) >> SECTOR_SHIFT) - 1;
+	connection->current_epoch->oldest_unconfirmed_peer_req = NULL;
+
+	/* Indicate that last_dagtag_sector may no longer be up-to-date. We
+	 * need to keep last_dagtag_sector because we may still need it to
+	 * resolve a reconciliation resync. However, we need to avoid issuing a
+	 * resync request dependent on that dagtag because the resync source
+	 * may not be aware of the dagtag, even though it has newer data. This
+	 * can occur if the peer has been re-started since the request with the
+	 * dagtag.
+	 * */
+	clear_bit(RECEIVED_DAGTAG, &connection->flags);
+
+	/* Release any threads waiting for a barrier to be acked. */
+	clear_bit(BARRIER_ACK_PENDING, &connection->flags);
+	wake_up(&resource->barrier_wait);
 
 	drbd_info(connection, "Connection closed\n");
 
-	if (conn_highest_role(connection) == R_PRIMARY && conn_highest_pdsk(connection) >= D_UNKNOWN)
+	if (resource->role[NOW] == R_PRIMARY &&
+	    connection->fencing_policy != FP_DONT_CARE &&
+	    conn_highest_pdsk(connection) >= D_UNKNOWN)
 		conn_try_outdate_peer_async(connection);
 
-	spin_lock_irq(&connection->resource->req_lock);
-	oc = connection->cstate;
-	if (oc >= C_UNCONNECTED)
-		_conn_request_state(connection, NS(conn, C_UNCONNECTED), CS_VERBOSE);
-
-	spin_unlock_irq(&connection->resource->req_lock);
-
-	if (oc == C_DISCONNECTING)
-		conn_request_state(connection, NS(conn, C_STANDALONE), CS_VERBOSE | CS_HARD);
-}
-
-static int drbd_disconnected(struct drbd_peer_device *peer_device)
-{
-	struct drbd_device *device = peer_device->device;
-	unsigned int i;
-
-	/* wait for current activity to cease. */
-	spin_lock_irq(&device->resource->req_lock);
-	_drbd_wait_ee_list_empty(device, &device->active_ee);
-	_drbd_wait_ee_list_empty(device, &device->sync_ee);
-	_drbd_wait_ee_list_empty(device, &device->read_ee);
-	spin_unlock_irq(&device->resource->req_lock);
-
-	/* We do not have data structures that would allow us to
-	 * get the rs_pending_cnt down to 0 again.
-	 *  * On C_SYNC_TARGET we do not have any data structures describing
-	 *    the pending RSDataRequest's we have sent.
-	 *  * On C_SYNC_SOURCE there is no data structure that tracks
-	 *    the P_RS_DATA_REPLY blocks that we sent to the SyncTarget.
-	 *  And no, it is not the sum of the reference counts in the
-	 *  resync_LRU. The resync_LRU tracks the whole operation including
-	 *  the disk-IO, while the rs_pending_cnt only tracks the blocks
-	 *  on the fly. */
-	drbd_rs_cancel_all(device);
-	device->rs_total = 0;
-	device->rs_failed = 0;
-	atomic_set(&device->rs_pending_cnt, 0);
-	wake_up(&device->misc_wait);
-
-	timer_delete_sync(&device->resync_timer);
-	resync_timer_fn(&device->resync_timer);
-
-	/* wait for all w_e_end_data_req, w_e_end_rsdata_req, w_send_barrier,
-	 * w_make_resync_request etc. which may still be on the worker queue
-	 * to be "canceled" */
-	drbd_flush_workqueue(&peer_device->connection->sender_work);
-
-	drbd_finish_peer_reqs(device);
-
-	/* This second workqueue flush is necessary, since drbd_finish_peer_reqs()
-	   might have issued a work again. The one before drbd_finish_peer_reqs() is
-	   necessary to reclain net_ee in drbd_finish_peer_reqs(). */
-	drbd_flush_workqueue(&peer_device->connection->sender_work);
-
-	/* need to do it again, drbd_finish_peer_reqs() may have populated it
-	 * again via drbd_try_clear_on_disk_bm(). */
-	drbd_rs_cancel_all(device);
-
-	kfree(device->p_uuid);
-	device->p_uuid = NULL;
-
-	if (!drbd_suspended(device))
-		tl_clear(peer_device->connection);
-
-	drbd_md_sync(device);
+	drbd_maybe_khelper(NULL, connection, "disconnected");
 
-	if (get_ldev(device)) {
-		drbd_bitmap_io(device, &drbd_bm_write_copy_pages,
-				"write from disconnected", BM_LOCKED_CHANGE_ALLOWED, NULL);
-		put_ldev(device);
+	begin_state_change(resource, &irq_flags, CS_VERBOSE | CS_LOCAL_ONLY);
+	oc = connection->cstate[NOW];
+	if (oc >= C_UNCONNECTED) {
+		__change_cstate(connection, C_UNCONNECTED);
+		/* drbd_receiver() has to be restarted after it returns */
+		drbd_thread_restart_nowait(&connection->receiver);
 	}
+	end_state_change(resource, &irq_flags, "disconnected");
 
-	i = atomic_read(&device->pp_in_use_by_net);
-	if (i)
-		drbd_info(device, "pp_in_use_by_net = %d, expected 0\n", i);
-	i = atomic_read(&device->pp_in_use);
-	if (i)
-		drbd_info(device, "pp_in_use = %d, expected 0\n", i);
-
-	D_ASSERT(device, list_empty(&device->read_ee));
-	D_ASSERT(device, list_empty(&device->active_ee));
-	D_ASSERT(device, list_empty(&device->sync_ee));
-	D_ASSERT(device, list_empty(&device->done_ee));
+	if (test_bit(NOTIFY_PEERS_LOST_PRIMARY, &connection->flags)) {
+		drbd_notify_peers_lost_primary(connection);
+		clear_bit(NOTIFY_PEERS_LOST_PRIMARY, &connection->flags);
+	}
 
-	return 0;
+	if (oc == C_DISCONNECTING)
+		change_cstate_tag(connection, C_STANDALONE, CS_VERBOSE | CS_HARD | CS_LOCAL_ONLY,
+				"disconnected", NULL);
 }
 
 /*
- * We support PRO_VERSION_MIN to PRO_VERSION_MAX. The protocol version
- * we can agree on is stored in agreed_pro_version.
+ * We support PRO_VERSION_MIN to PRO_VERSION_MAX.
+ * But see also drbd_protocol_version_acceptable() and module parameter
+ * drbd_protocol_version_min.
+ * The protocol version we can agree on is stored in agreed_pro_version.
  *
  * feature flags and the reserved array should be enough room for future
  * enhancements of the handshake protocol, and possible plugins...
+ * See also PRO_FEATURES.
  *
- * for now, they are expected to be zero, but ignored.
  */
 static int drbd_send_features(struct drbd_connection *connection)
 {
-	struct drbd_socket *sock;
 	struct p_connection_features *p;
 
-	sock = &connection->data;
-	p = conn_prepare_command(connection, sock);
+	p = __conn_prepare_command(connection, sizeof(*p), DATA_STREAM);
 	if (!p)
 		return -EIO;
 	memset(p, 0, sizeof(*p));
-	p->protocol_min = cpu_to_be32(PRO_VERSION_MIN);
+	p->protocol_min = cpu_to_be32(drbd_protocol_version_min);
 	p->protocol_max = cpu_to_be32(PRO_VERSION_MAX);
+	p->sender_node_id = cpu_to_be32(connection->resource->res_opts.node_id);
+	p->receiver_node_id = cpu_to_be32(connection->peer_node_id);
 	p->feature_flags = cpu_to_be32(PRO_FEATURES);
-	return conn_send_command(connection, sock, P_CONNECTION_FEATURES, sizeof(*p), NULL, 0);
+	return __send_command(connection, -1, P_CONNECTION_FEATURES, DATA_STREAM);
 }
 
 /*
@@ -5083,9 +10031,10 @@ static int drbd_send_features(struct drbd_connection *connection)
  *  -1 peer talks different language,
  *     no point in trying again, please go standalone.
  */
-static int drbd_do_features(struct drbd_connection *connection)
+int drbd_do_features(struct drbd_connection *connection)
 {
 	/* ASSERT current == connection->receiver ... */
+	struct drbd_resource *resource = connection->resource;
 	struct p_connection_features *p;
 	const int expect = sizeof(struct p_connection_features);
 	struct packet_info pi;
@@ -5096,12 +10045,15 @@ static int drbd_do_features(struct drbd_connection *connection)
 		return 0;
 
 	err = drbd_recv_header(connection, &pi);
-	if (err)
+	if (err) {
+		if (err == -EAGAIN)
+			drbd_err(connection, "timeout while waiting for feature packet\n");
 		return 0;
+	}
 
 	if (pi.cmd != P_CONNECTION_FEATURES) {
 		drbd_err(connection, "expected ConnectionFeatures packet, received: %s (0x%04x)\n",
-			 cmdname(pi.cmd), pi.cmd);
+			 drbd_packet_name(pi.cmd), pi.cmd);
 		return -1;
 	}
 
@@ -5111,8 +10063,7 @@ static int drbd_do_features(struct drbd_connection *connection)
 		return -1;
 	}
 
-	p = pi.data;
-	err = drbd_recv_all_warn(connection, p, expect);
+	err = drbd_recv_all_warn(connection, (void **)&p, expect);
 	if (err)
 		return 0;
 
@@ -5122,42 +10073,102 @@ static int drbd_do_features(struct drbd_connection *connection)
 		p->protocol_max = p->protocol_min;
 
 	if (PRO_VERSION_MAX < p->protocol_min ||
-	    PRO_VERSION_MIN > p->protocol_max)
-		goto incompat;
+	    drbd_protocol_version_min > p->protocol_max) {
+		drbd_err(connection, "incompatible DRBD dialects: "
+		    "I support %d-%d, peer supports %d-%d\n",
+		    drbd_protocol_version_min, PRO_VERSION_MAX,
+		    p->protocol_min, p->protocol_max);
+		return -1;
+	}
+	/* Older DRBD will always expect us to agree to their max,
+	 * if it falls within our [min, max] range.
+	 * But we have a gap in there that we do not support.
+	 */
+	if (p->protocol_max > PRO_VERSION_8_MAX &&
+	    p->protocol_max < PRO_VERSION_MIN) {
+		drbd_err(connection, "incompatible DRBD 9 dialects: I support %u-%u, peer supports %u-%u\n",
+		    PRO_VERSION_MIN, PRO_VERSION_MAX,
+		    p->protocol_min, p->protocol_max);
+		return -1;
+	}
 
 	connection->agreed_pro_version = min_t(int, PRO_VERSION_MAX, p->protocol_max);
 	connection->agreed_features = PRO_FEATURES & be32_to_cpu(p->feature_flags);
 
-	drbd_info(connection, "Handshake successful: "
-	     "Agreed network protocol version %d\n", connection->agreed_pro_version);
+	if (connection->agreed_pro_version == 121 &&
+			(connection->agreed_features & DRBD_FF_RESYNC_DAGTAG)) {
+		/*
+		 * Releases drbd-9.2.0, drbd-9.2.1 and drbd-9.2.2 used an
+		 * implementation of discard merging which caused one
+		 * P_RS_WRITE_ACK to be sent for the whole merged interval.
+		 * These are precisely the releases with PRO_VERSION_MAX == 121
+		 * and feature DRBD_FF_RESYNC_DAGTAG.
+		 *
+		 * We do no support this case, so reject the connection.
+		 */
+		drbd_err(connection, "incompatible DRBD 9 dialects: protocol 121 with feature RESYNC_DAGTAG; upgrade via DRBD 9.2.16\n");
+		return -1;
+	}
+
+	if (connection->agreed_pro_version < 110) {
+		struct drbd_connection *connection2;
+		bool multiple = false;
+
+		rcu_read_lock();
+		for_each_connection_rcu(connection2, resource) {
+			if (connection == connection2)
+				continue;
+			multiple = true;
+		}
+		rcu_read_unlock();
+
+		if (multiple) {
+			drbd_err(connection, "Peer supports protocols %d-%d, but "
+				 "multiple connections are only supported in protocol "
+				 "110 and above\n", p->protocol_min, p->protocol_max);
+			return -1;
+		}
+	}
 
-	drbd_info(connection, "Feature flags enabled on protocol level: 0x%x%s%s%s%s.\n",
+	if (connection->agreed_pro_version >= 110) {
+		if (be32_to_cpu(p->sender_node_id) != connection->peer_node_id) {
+			drbd_err(connection, "Peer presented a node_id of %d instead of %d\n",
+				 be32_to_cpu(p->sender_node_id), connection->peer_node_id);
+			return 0;
+		}
+		if (be32_to_cpu(p->receiver_node_id) != resource->res_opts.node_id) {
+			drbd_err(connection, "Peer expects me to have a node_id of %d instead of %d\n",
+				 be32_to_cpu(p->receiver_node_id), resource->res_opts.node_id);
+			return 0;
+		}
+	}
+
+	drbd_info(connection, "Handshake to peer %d successful: "
+			"Agreed network protocol version %d\n",
+			connection->peer_node_id,
+			connection->agreed_pro_version);
+
+	drbd_info(connection, "Feature flags enabled on protocol level: 0x%x%s%s%s%s%s\n",
 		  connection->agreed_features,
 		  connection->agreed_features & DRBD_FF_TRIM ? " TRIM" : "",
 		  connection->agreed_features & DRBD_FF_THIN_RESYNC ? " THIN_RESYNC" : "",
 		  connection->agreed_features & DRBD_FF_WSAME ? " WRITE_SAME" : "",
-		  connection->agreed_features & DRBD_FF_WZEROES ? " WRITE_ZEROES" :
+		  connection->agreed_features & DRBD_FF_WZEROES ? " WRITE_ZEROES" : "",
+		  connection->agreed_features & DRBD_FF_RESYNC_DAGTAG ? " RESYNC_DAGTAG" :
 		  connection->agreed_features ? "" : " none");
 
 	return 1;
-
- incompat:
-	drbd_err(connection, "incompatible DRBD dialects: "
-	    "I support %d-%d, peer supports %d-%d\n",
-	    PRO_VERSION_MIN, PRO_VERSION_MAX,
-	    p->protocol_min, p->protocol_max);
-	return -1;
 }
 
 #if !defined(CONFIG_CRYPTO_HMAC) && !defined(CONFIG_CRYPTO_HMAC_MODULE)
-static int drbd_do_auth(struct drbd_connection *connection)
+int drbd_do_auth(struct drbd_connection *connection)
 {
 	drbd_err(connection, "This kernel was build without CONFIG_CRYPTO_HMAC.\n");
 	drbd_err(connection, "You need to disable 'cram-hmac-alg' in drbd.conf.\n");
 	return -1;
 }
 #else
-#define CHALLENGE_LEN 64
+#define CHALLENGE_LEN 64 /* must be multiple of 4 */
 
 /* Return value:
 	1 - auth succeeded,
@@ -5165,25 +10176,28 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	-1 - auth failed, don't try again.
 */
 
-static int drbd_do_auth(struct drbd_connection *connection)
+struct auth_challenge {
+	char d[CHALLENGE_LEN];
+	u32 i;
+} __attribute__((packed));
+
+int drbd_do_auth(struct drbd_connection *connection)
 {
-	struct drbd_socket *sock;
-	char my_challenge[CHALLENGE_LEN];  /* 64 Bytes... */
-	char *response = NULL;
+	struct auth_challenge my_challenge, *peers_ch = NULL;
+	void *response;
 	char *right_response = NULL;
-	char *peers_ch = NULL;
 	unsigned int key_len;
 	char secret[SHARED_SECRET_MAX]; /* 64 byte */
 	unsigned int resp_size;
 	struct shash_desc *desc;
 	struct packet_info pi;
 	struct net_conf *nc;
-	int err, rv;
-
-	/* FIXME: Put the challenge/response into the preallocated socket buffer.  */
+	int err, rv, dig_size;
+	bool peer_is_drbd_9 = connection->agreed_pro_version >= 110;
+	void *packet_body;
 
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
+	nc = rcu_dereference(connection->transport.net_conf);
 	key_len = strlen(nc->shared_secret);
 	memcpy(secret, nc->shared_secret, key_len);
 	rcu_read_unlock();
@@ -5204,15 +10218,16 @@ static int drbd_do_auth(struct drbd_connection *connection)
 		goto fail;
 	}
 
-	get_random_bytes(my_challenge, CHALLENGE_LEN);
+	get_random_bytes(my_challenge.d, sizeof(my_challenge.d));
 
-	sock = &connection->data;
-	if (!conn_prepare_command(connection, sock)) {
+	packet_body = __conn_prepare_command(connection, sizeof(my_challenge.d), DATA_STREAM);
+	if (!packet_body) {
 		rv = 0;
 		goto fail;
 	}
-	rv = !conn_send_command(connection, sock, P_AUTH_CHALLENGE, 0,
-				my_challenge, CHALLENGE_LEN);
+	memcpy(packet_body, my_challenge.d, sizeof(my_challenge.d));
+
+	rv = !__send_command(connection, -1, P_AUTH_CHALLENGE, DATA_STREAM);
 	if (!rv)
 		goto fail;
 
@@ -5224,61 +10239,56 @@ static int drbd_do_auth(struct drbd_connection *connection)
 
 	if (pi.cmd != P_AUTH_CHALLENGE) {
 		drbd_err(connection, "expected AuthChallenge packet, received: %s (0x%04x)\n",
-			 cmdname(pi.cmd), pi.cmd);
-		rv = -1;
-		goto fail;
-	}
-
-	if (pi.size > CHALLENGE_LEN * 2) {
-		drbd_err(connection, "expected AuthChallenge payload too big.\n");
+			 drbd_packet_name(pi.cmd), pi.cmd);
 		rv = -1;
 		goto fail;
 	}
 
-	if (pi.size < CHALLENGE_LEN) {
-		drbd_err(connection, "AuthChallenge payload too small.\n");
+	if (pi.size != sizeof(peers_ch->d)) {
+		drbd_err(connection, "unexpected AuthChallenge payload.\n");
 		rv = -1;
 		goto fail;
 	}
 
-	peers_ch = kmalloc(pi.size, GFP_NOIO);
+	peers_ch = kmalloc_obj(*peers_ch, GFP_NOIO);
 	if (!peers_ch) {
 		rv = -1;
 		goto fail;
 	}
 
-	err = drbd_recv_all_warn(connection, peers_ch, pi.size);
+	err = drbd_recv_into(connection, peers_ch->d, sizeof(peers_ch->d));
 	if (err) {
 		rv = 0;
 		goto fail;
 	}
 
-	if (!memcmp(my_challenge, peers_ch, CHALLENGE_LEN)) {
+	if (!memcmp(my_challenge.d, peers_ch->d, sizeof(my_challenge.d))) {
 		drbd_err(connection, "Peer presented the same challenge!\n");
 		rv = -1;
 		goto fail;
 	}
 
 	resp_size = crypto_shash_digestsize(connection->cram_hmac_tfm);
-	response = kmalloc(resp_size, GFP_NOIO);
+	response = __conn_prepare_command(connection, resp_size, DATA_STREAM);
 	if (!response) {
-		rv = -1;
+		rv = 0;
 		goto fail;
 	}
 
-	rv = crypto_shash_digest(desc, peers_ch, pi.size, response);
+	dig_size = pi.size;
+	if (peer_is_drbd_9) {
+		peers_ch->i = cpu_to_be32(connection->resource->res_opts.node_id);
+		dig_size += sizeof(peers_ch->i);
+	}
+
+	rv = crypto_shash_digest(desc, peers_ch->d, dig_size, response);
 	if (rv) {
-		drbd_err(connection, "crypto_hash_digest() failed with %d\n", rv);
+		drbd_err(connection, "crypto_shash_digest() failed with %d\n", rv);
 		rv = -1;
 		goto fail;
 	}
 
-	if (!conn_prepare_command(connection, sock)) {
-		rv = 0;
-		goto fail;
-	}
-	rv = !conn_send_command(connection, sock, P_AUTH_RESPONSE, 0,
-				response, resp_size);
+	rv = !__send_command(connection, -1, P_AUTH_RESPONSE, DATA_STREAM);
 	if (!rv)
 		goto fail;
 
@@ -5290,18 +10300,19 @@ static int drbd_do_auth(struct drbd_connection *connection)
 
 	if (pi.cmd != P_AUTH_RESPONSE) {
 		drbd_err(connection, "expected AuthResponse packet, received: %s (0x%04x)\n",
-			 cmdname(pi.cmd), pi.cmd);
+			 drbd_packet_name(pi.cmd), pi.cmd);
 		rv = 0;
 		goto fail;
 	}
 
 	if (pi.size != resp_size) {
-		drbd_err(connection, "expected AuthResponse payload of wrong size\n");
+		drbd_err(connection, "expected AuthResponse payload of %u bytes, received %u\n",
+				resp_size, pi.size);
 		rv = 0;
 		goto fail;
 	}
 
-	err = drbd_recv_all_warn(connection, response , resp_size);
+	err = drbd_recv_all(connection, &response, resp_size);
 	if (err) {
 		rv = 0;
 		goto fail;
@@ -5313,10 +10324,15 @@ static int drbd_do_auth(struct drbd_connection *connection)
 		goto fail;
 	}
 
-	rv = crypto_shash_digest(desc, my_challenge, CHALLENGE_LEN,
-				 right_response);
+	dig_size = sizeof(my_challenge.d);
+	if (peer_is_drbd_9) {
+		my_challenge.i = cpu_to_be32(connection->peer_node_id);
+		dig_size += sizeof(my_challenge.i);
+	}
+
+	rv = crypto_shash_digest(desc, my_challenge.d, dig_size, right_response);
 	if (rv) {
-		drbd_err(connection, "crypto_hash_digest() failed with %d\n", rv);
+		drbd_err(connection, "crypto_shash_digest() failed with %d\n", rv);
 		rv = -1;
 		goto fail;
 	}
@@ -5331,7 +10347,6 @@ static int drbd_do_auth(struct drbd_connection *connection)
 
  fail:
 	kfree(peers_ch);
-	kfree(response);
 	kfree(right_response);
 	if (desc) {
 		shash_desc_zero(desc);
@@ -5345,94 +10360,260 @@ static int drbd_do_auth(struct drbd_connection *connection)
 int drbd_receiver(struct drbd_thread *thi)
 {
 	struct drbd_connection *connection = thi->connection;
-	int h;
 
-	drbd_info(connection, "receiver (re)started\n");
+	if (conn_connect(connection)) {
+		blk_start_plug(&connection->receiver_plug);
+		drbdd(connection);
+		blk_finish_plug(&connection->receiver_plug);
+	}
+
+	conn_disconnect(connection);
+	return 0;
+}
+
+/* ********* acknowledge sender ******** */
+
+static void drbd_check_flush_dagtag_reached(struct drbd_connection *peer_ack_connection)
+{
+	struct drbd_resource *resource = peer_ack_connection->resource;
+	struct drbd_connection *flush_requests_connection;
+	u64 peer_ack_node_mask = NODE_MASK(peer_ack_connection->peer_node_id);
+	u64 last_peer_ack_dagtag_seen = peer_ack_connection->last_peer_ack_dagtag_seen;
+	u64 im;
+
+	for_each_connection_ref(flush_requests_connection, im, resource) {
+		u64 flush_sequence;
+		u64 *sent_mask;
+		u64 flush_requests_dagtag;
+
+		spin_lock_irq(&flush_requests_connection->primary_flush_lock);
+		flush_requests_dagtag = flush_requests_connection->flush_requests_dagtag;
+		flush_sequence = flush_requests_connection->flush_sequence;
+		sent_mask = &flush_requests_connection->flush_forward_sent_mask;
+
+		if (!flush_sequence || /* Active flushes use non-zero sequence numbers */
+				*sent_mask & peer_ack_node_mask ||
+				last_peer_ack_dagtag_seen < flush_requests_dagtag) {
+			spin_unlock_irq(&flush_requests_connection->primary_flush_lock);
+			continue;
+		}
+
+		*sent_mask |= peer_ack_node_mask;
+		spin_unlock_irq(&flush_requests_connection->primary_flush_lock);
+
+		if (peer_ack_connection == flush_requests_connection)
+			drbd_send_flush_requests_ack(peer_ack_connection,
+					flush_sequence,
+					resource->res_opts.node_id);
+		else
+			drbd_send_flush_forward(peer_ack_connection,
+					flush_sequence,
+					flush_requests_connection->peer_node_id);
+	}
+}
+
+static int process_peer_ack_list(struct drbd_connection *connection)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_ack *peer_ack, *tmp;
+	u64 node_id_mask;
+	int err = 0;
+
+	node_id_mask = NODE_MASK(connection->peer_node_id);
+
+	spin_lock_irq(&resource->peer_ack_lock);
+	peer_ack = list_first_entry(&resource->peer_ack_list, struct drbd_peer_ack, list);
+	while (&peer_ack->list != &resource->peer_ack_list) {
+		u64 pending_mask = peer_ack->pending_mask;
+		u64 mask = peer_ack->mask;
+		u64 dagtag_sector = peer_ack->dagtag_sector;
+
+		tmp = list_next_entry(peer_ack, list);
+
+		if (!(peer_ack->queued_mask & node_id_mask)) {
+			peer_ack = tmp;
+			continue;
+		}
+
+		/*
+		 * After disconnecting, queue_peer_ack_send() sets
+		 * last_peer_ack_dagtag_seen directly. Do not jump back if we
+		 * process a peer ack with a lower dagtag here shortly after.
+		 */
+		connection->last_peer_ack_dagtag_seen =
+			max(connection->last_peer_ack_dagtag_seen, dagtag_sector);
+
+		peer_ack->queued_mask &= ~node_id_mask;
+		drbd_destroy_peer_ack_if_done(peer_ack);
+		peer_ack = tmp;
+
+		if (!(pending_mask & node_id_mask))
+			continue;
+		spin_unlock_irq(&resource->peer_ack_lock);
+
+		err = drbd_send_peer_ack(connection, mask, dagtag_sector);
+
+		spin_lock_irq(&resource->peer_ack_lock);
+		if (err)
+			break;
+	}
+	spin_unlock_irq(&resource->peer_ack_lock);
+
+	if (!err && connection->agreed_pro_version >= 123)
+		drbd_check_flush_dagtag_reached(connection);
+
+	return err;
+}
+
+static int got_peers_in_sync(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	struct p_peer_block_desc *p = pi->data;
+	sector_t sector;
+	u64 in_sync_b;
+	int size;
 
-	do {
-		h = conn_connect(connection);
-		if (h == 0) {
-			conn_disconnect(connection);
-			schedule_timeout_interruptible(HZ);
-		}
-		if (h == -1) {
-			drbd_warn(connection, "Discarding network configuration.\n");
-			conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
-		}
-	} while (h == 0);
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
 
-	if (h > 0) {
-		blk_start_plug(&connection->receiver_plug);
-		drbdd(connection);
-		blk_finish_plug(&connection->receiver_plug);
-	}
+	device = peer_device->device;
 
-	conn_disconnect(connection);
+	if (get_ldev(device)) {
+		unsigned long modified;
 
-	drbd_info(connection, "receiver terminated\n");
-	return 0;
-}
+		sector = be64_to_cpu(p->sector);
+		size = be32_to_cpu(p->size);
+		in_sync_b = node_ids_to_bitmap(device, be64_to_cpu(p->mask));
 
-/* ********* acknowledge sender ******** */
+		modified = drbd_set_sync(device, sector, size, 0, in_sync_b);
 
-static int got_conn_RqSReply(struct drbd_connection *connection, struct packet_info *pi)
-{
-	struct p_req_state_reply *p = pi->data;
-	int retcode = be32_to_cpu(p->retcode);
+		/* If we are SyncSource then we rely on P_PEERS_IN_SYNC from
+		 * the peer to inform us of sync progress. Otherwise only send
+		 * peers-in-sync when we have actually cleared some bits.
+		 * This prevents an infinite loop with the peer. */
+		if (modified || peer_device->repl_state[NOW] == L_SYNC_SOURCE)
+			drbd_queue_update_peers(peer_device, sector, sector + (size >> SECTOR_SHIFT));
 
-	if (retcode >= SS_SUCCESS) {
-		set_bit(CONN_WD_ST_CHG_OKAY, &connection->flags);
-	} else {
-		set_bit(CONN_WD_ST_CHG_FAIL, &connection->flags);
-		drbd_err(connection, "Requested state change failed by peer: %s (%d)\n",
-			 drbd_set_st_err_str(retcode), retcode);
+		put_ldev(device);
 	}
-	wake_up(&connection->ping_wait);
 
 	return 0;
 }
 
 static int got_RqSReply(struct drbd_connection *connection, struct packet_info *pi)
 {
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
 	struct p_req_state_reply *p = pi->data;
 	int retcode = be32_to_cpu(p->retcode);
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
-
-	if (test_bit(CONN_WD_ST_CHG_REQ, &connection->flags)) {
-		D_ASSERT(device, connection->agreed_pro_version < 100);
-		return got_conn_RqSReply(connection, pi);
+	if (retcode >= SS_SUCCESS)
+		set_bit(TWOPC_YES, &connection->flags);
+	else {
+		set_bit(TWOPC_NO, &connection->flags);
+		dynamic_drbd_dbg(connection, "Requested state change failed by peer: %s (%d)\n",
+			   drbd_set_st_err_str(retcode), retcode);
 	}
 
-	if (retcode >= SS_SUCCESS) {
-		set_bit(CL_ST_CHG_SUCCESS, &device->flags);
+	wake_up_all(&connection->resource->state_wait);
+
+	return 0;
+}
+
+static int got_twopc_reply(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct p_twopc_reply *p = pi->data;
+
+	write_lock_irq(&resource->state_rwlock);
+	if (resource->twopc_reply.initiator_node_id == be32_to_cpu(p->initiator_node_id) &&
+	    resource->twopc_reply.tid == be32_to_cpu(p->tid)) {
+		dynamic_drbd_dbg(connection, "Got a %s reply for state change %u\n",
+			   drbd_packet_name(pi->cmd),
+			   resource->twopc_reply.tid);
+
+		if (pi->cmd == P_TWOPC_YES) {
+			struct drbd_peer_device *peer_device;
+			u64 reachable_nodes;
+			u64 max_size;
+
+			reachable_nodes = be64_to_cpu(p->reachable_nodes);
+
+			switch (resource->twopc.type) {
+			case TWOPC_STATE_CHANGE:
+				if (resource->res_opts.node_id ==
+				    resource->twopc_reply.initiator_node_id &&
+				    connection->peer_node_id ==
+				    resource->twopc_reply.target_node_id) {
+					resource->twopc_reply.target_reachable_nodes |=
+						reachable_nodes;
+				} else {
+					resource->twopc_reply.reachable_nodes |=
+						reachable_nodes;
+				}
+				resource->twopc_reply.primary_nodes |=
+					be64_to_cpu(p->primary_nodes);
+				resource->twopc_reply.weak_nodes |=
+					be64_to_cpu(p->weak_nodes);
+				break;
+			case TWOPC_RESIZE:
+				resource->twopc_reply.reachable_nodes |= reachable_nodes;
+				resource->twopc_reply.diskful_primary_nodes |=
+					be64_to_cpu(p->diskful_primary_nodes);
+				max_size = be64_to_cpu(p->max_possible_size);
+				resource->twopc_reply.max_possible_size =
+					min_t(sector_t, resource->twopc_reply.max_possible_size,
+					      max_size);
+				peer_device = conn_peer_device(connection, resource->twopc_reply.vnr);
+				if (peer_device)
+					peer_device->max_size = max_size;
+				break;
+			}
+		}
+
+		if (pi->cmd == P_TWOPC_YES)
+			set_bit(TWOPC_YES, &connection->flags);
+		else if (pi->cmd == P_TWOPC_NO)
+			set_bit(TWOPC_NO, &connection->flags);
+		else if (pi->cmd == P_TWOPC_RETRY)
+			set_bit(TWOPC_RETRY, &connection->flags);
+		drbd_maybe_cluster_wide_reply(resource);
 	} else {
-		set_bit(CL_ST_CHG_FAIL, &device->flags);
-		drbd_err(device, "Requested state change failed by peer: %s (%d)\n",
-			drbd_set_st_err_str(retcode), retcode);
+		dynamic_drbd_dbg(connection, "Ignoring %s reply for state change %u\n",
+			   drbd_packet_name(pi->cmd),
+			   be32_to_cpu(p->tid));
 	}
-	wake_up(&device->state_wait);
+	write_unlock_irq(&resource->state_rwlock);
 
 	return 0;
 }
 
-static int got_Ping(struct drbd_connection *connection, struct packet_info *pi)
+void twopc_connection_down(struct drbd_connection *connection)
 {
-	return drbd_send_ping_ack(connection);
+	struct drbd_resource *resource = connection->resource;
 
+	if (resource->twopc_reply.initiator_node_id != -1 &&
+	    test_bit(TWOPC_PREPARED, &connection->flags)) {
+		set_bit(TWOPC_RETRY, &connection->flags);
+		drbd_maybe_cluster_wide_reply(resource);
+	}
+}
+
+static int got_Ping(struct drbd_connection *connection, struct packet_info *pi)
+{
+	queue_work(ping_ack_sender, &connection->send_ping_ack_work);
+	return 0;
 }
 
 static int got_PingAck(struct drbd_connection *connection, struct packet_info *pi)
 {
-	/* restore idle timeout */
-	connection->meta.socket->sk->sk_rcvtimeo = connection->net_conf->ping_int*HZ;
-	if (!test_and_set_bit(GOT_PING_ACK, &connection->flags))
-		wake_up(&connection->ping_wait);
+	clear_bit(PING_TIMEOUT_ACTIVE, &connection->flags);
+	set_rcvtimeo(connection, REGULAR_TIMEOUT);
+
+	if (test_bit(PING_PENDING, &connection->flags)) {
+		clear_bit(PING_PENDING, &connection->flags);
+		wake_up_all(&connection->resource->state_wait);
+	}
 
 	return 0;
 }
@@ -5441,6 +10622,7 @@ static int got_IsInSync(struct drbd_connection *connection, struct packet_info *
 {
 	struct drbd_peer_device *peer_device;
 	struct drbd_device *device;
+	struct drbd_peer_request *peer_req;
 	struct p_block_ack *p = pi->data;
 	sector_t sector = be64_to_cpu(p->sector);
 	int blksize = be32_to_cpu(p->blksize);
@@ -5450,69 +10632,74 @@ static int got_IsInSync(struct drbd_connection *connection, struct packet_info *
 		return -EIO;
 	device = peer_device->device;
 
-	D_ASSERT(device, peer_device->connection->agreed_pro_version >= 89);
+	D_ASSERT(device, connection->agreed_pro_version >= 89);
 
 	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
 
+	/* Do not rely on the block_id from older peers. */
+	if (connection->agreed_pro_version < 122)
+		p->block_id = ID_SYNCER;
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_RESYNC_WRITE),
+			sector, blksize, p->block_id);
+	if (!peer_req)
+		return -EIO;
+
+	dec_rs_pending(peer_device);
+
+	set_bit(INTERVAL_RECEIVED, &peer_req->i.flags);
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_del(&peer_req->w.list);
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
 	if (get_ldev(device)) {
-		drbd_rs_complete_io(device, sector);
 		drbd_set_in_sync(peer_device, sector, blksize);
 		/* rs_same_csums is supposed to count in units of BM_BLOCK_SIZE */
-		device->rs_same_csum += (blksize >> BM_BLOCK_SHIFT);
+		peer_device->rs_same_csum += (blksize >> device->ldev->md.bm_block_shift);
 		put_ldev(device);
 	}
-	dec_rs_pending(peer_device);
-	atomic_add(blksize >> 9, &device->rs_sect_in);
+	rs_sectors_came_in(peer_device, blksize);
 
+	drbd_remove_peer_req_interval(peer_req);
+	drbd_resync_request_complete(peer_req);
 	return 0;
 }
 
 static int
 validate_req_change_req_state(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
-			      struct rb_root *root, const char *func,
+			      enum drbd_interval_type type, const char *func,
 			      enum drbd_req_event what, bool missing_ok)
 {
 	struct drbd_device *device = peer_device->device;
 	struct drbd_request *req;
-	struct bio_and_error m;
 
-	spin_lock_irq(&device->resource->req_lock);
-	req = find_request(device, root, id, sector, missing_ok, func);
-	if (unlikely(!req)) {
-		spin_unlock_irq(&device->resource->req_lock);
+	spin_lock_irq(&device->interval_lock);
+	req = find_request(device, type, id, sector, missing_ok, func);
+	spin_unlock_irq(&device->interval_lock);
+	if (unlikely(!req))
 		return -EIO;
-	}
-	__req_mod(req, what, peer_device, &m);
-	spin_unlock_irq(&device->resource->req_lock);
+	req_mod(req, what, peer_device);
 
-	if (m.bio)
-		complete_master_bio(device, &m);
 	return 0;
 }
 
 static int got_BlockAck(struct drbd_connection *connection, struct packet_info *pi)
 {
 	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
 	struct p_block_ack *p = pi->data;
 	sector_t sector = be64_to_cpu(p->sector);
-	int blksize = be32_to_cpu(p->blksize);
 	enum drbd_req_event what;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
 		return -EIO;
-	device = peer_device->device;
 
 	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
 
-	if (p->block_id == ID_SYNCER) {
-		drbd_set_in_sync(peer_device, sector, blksize);
-		dec_rs_pending(peer_device);
-		return 0;
-	}
 	switch (pi->cmd) {
-	case P_RS_WRITE_ACK:
+	case P_RS_WRITE_ACK: /* agreed_pro_version < 122 */
+	case P_WRITE_ACK_IN_SYNC:
 		what = WRITE_ACKED_BY_PEER_AND_SIS;
 		break;
 	case P_WRITE_ACK:
@@ -5521,209 +10708,591 @@ static int got_BlockAck(struct drbd_connection *connection, struct packet_info *
 	case P_RECV_ACK:
 		what = RECV_ACKED_BY_PEER;
 		break;
-	case P_SUPERSEDED:
-		what = CONFLICT_RESOLVED;
-		break;
-	case P_RETRY_WRITE:
-		what = POSTPONE_WRITE;
-		break;
 	default:
 		BUG();
 	}
 
-	return validate_req_change_req_state(peer_device, p->block_id, sector,
-					     &device->write_requests, __func__,
-					     what, false);
+	return validate_req_change_req_state(peer_device, p->block_id, sector,
+					     INTERVAL_LOCAL_WRITE, __func__,
+					     what, false);
+}
+
+/* Process acks for resync writes. */
+static int got_RSWriteAck(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct p_block_ack *p = pi->data;
+	bool is_neg_ack = pi->cmd == P_NEG_ACK || pi->cmd == P_RS_NEG_ACK;
+	sector_t sector = be64_to_cpu(p->sector);
+	int size = be32_to_cpu(p->blksize);
+	struct drbd_peer_request *peer_req;
+
+	/* P_RS_WRITE_ACK used to be used instead of P_WRITE_ACK_IN_SYNC. */
+	if (connection->agreed_pro_version < 122 && p->block_id != ID_SYNCER)
+		return got_BlockAck(connection, pi);
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+
+	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+
+	if (is_neg_ack && peer_device->disk_state[NOW] == D_UP_TO_DATE)
+		set_bit(GOT_NEG_ACK, &peer_device->flags);
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_RESYNC_READ),
+			sector, size, p->block_id);
+	if (!peer_req)
+		return -EIO;
+
+	if (is_neg_ack)
+		drbd_rs_failed_io(peer_device, sector, size);
+	else
+		drbd_set_in_sync(peer_device, sector, size);
+
+	atomic_sub(size >> 9, &connection->rs_in_flight);
+
+	dec_rs_pending(peer_device);
+
+	/*
+	 * Remove from the interval tree now so that
+	 * find_resync_request() cannot find this request again
+	 * if we get another ack for this interval.
+	 */
+	drbd_remove_peer_req_interval(peer_req);
+
+	drbd_resync_read_req_mod(peer_req, INTERVAL_RECEIVED);
+	return 0;
+}
+
+static int got_NegAck(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct p_block_ack *p = pi->data;
+	sector_t sector = be64_to_cpu(p->sector);
+	int size = be32_to_cpu(p->blksize);
+	int err;
+
+	/* P_NEG_ACK used to be used instead of P_RS_NEG_ACK. */
+	if (p->block_id == ID_SYNCER)
+		return got_RSWriteAck(connection, pi);
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+
+	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+
+	if (peer_device->disk_state[NOW] == D_UP_TO_DATE)
+		set_bit(GOT_NEG_ACK, &peer_device->flags);
+
+	err = validate_req_change_req_state(peer_device, p->block_id, sector,
+			INTERVAL_LOCAL_WRITE, __func__, NEG_ACKED, true);
+	if (err) {
+		/* Protocol A has no P_WRITE_ACKs, but has P_NEG_ACKs.
+		   The master bio might already be completed, therefore the
+		   request is no longer in the collision hash. */
+		/* In Protocol B we might already have got a P_RECV_ACK
+		   but then get a P_NEG_ACK afterwards. */
+		drbd_set_out_of_sync(peer_device, sector, size);
+	}
+	return 0;
+}
+
+static int got_NegDReply(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct p_block_ack *p = pi->data;
+	sector_t sector = be64_to_cpu(p->sector);
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+
+	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+
+	drbd_warn_ratelimit(peer_device, "Got NegDReply; Sector %llus, len %u.\n",
+			(unsigned long long)sector, be32_to_cpu(p->blksize));
+
+	return validate_req_change_req_state(peer_device, p->block_id, sector,
+					     INTERVAL_LOCAL_READ, __func__,
+					     NEG_ACKED, false);
+}
+
+void drbd_unsuccessful_resync_request(struct drbd_peer_request *peer_req, bool failed)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+
+	if (get_ldev_if_state(device, D_DETACHING)) {
+		if (failed) {
+			drbd_rs_failed_io(peer_device, peer_req->i.sector, peer_req->i.size);
+		} else {
+			if (drbd_interval_is_verify(&peer_req->i)) {
+				drbd_verify_skipped_block(peer_device, peer_req->i.sector, peer_req->i.size);
+				verify_progress(peer_device, peer_req->i.sector, peer_req->i.size);
+			} else {
+				set_bit(RS_REQUEST_UNSUCCESSFUL, &peer_device->flags);
+			}
+		}
+
+		rs_sectors_came_in(peer_device, peer_req->i.size);
+		mod_timer(&peer_device->resync_timer, jiffies + RS_MAKE_REQS_INTV);
+		put_ldev(device);
+	}
+
+	drbd_remove_peer_req_interval(peer_req);
+	drbd_free_peer_req(peer_req);
+}
+
+static int got_NegRSDReply(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_peer_request *peer_req;
+	sector_t sector;
+	int size;
+	u64 block_id;
+	struct p_block_ack *p = pi->data;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+
+	sector = be64_to_cpu(p->sector);
+	size = be32_to_cpu(p->blksize);
+
+	/* Prior to protocol version 122, block_id may be meaningless. */
+	block_id = peer_device->connection->agreed_pro_version >= 122 ? p->block_id : ID_SYNCER;
+
+	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_RESYNC_WRITE) |
+			INTERVAL_TYPE_MASK(INTERVAL_OV_READ_SOURCE),
+			sector, size, block_id);
+	if (!peer_req)
+		return -EIO;
+
+	dec_rs_pending(peer_device);
+
+	if (pi->cmd == P_RS_CANCEL_AHEAD)
+		set_bit(SYNC_TARGET_TO_BEHIND, &peer_device->flags);
+
+	drbd_unsuccessful_resync_request(peer_req, pi->cmd == P_NEG_RS_DREPLY);
+	return 0;
+}
+
+static int got_BarrierAck(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_barrier_ack *p = pi->data;
+
+	return tl_release(connection, 0, 0, p->barrier, be32_to_cpu(p->set_size));
+}
+
+static int got_confirm_stable(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct p_confirm_stable *p = pi->data;
+
+	return tl_release(connection, p->oldest_block_id, p->youngest_block_id, 0,
+			  be32_to_cpu(p->set_size));
+}
+
+static int got_OVResult(struct drbd_connection *connection, struct packet_info *pi)
+{
+	struct drbd_peer_device *peer_device;
+	struct drbd_device *device;
+	struct drbd_peer_request *peer_req;
+	sector_t sector;
+	int size;
+	u64 block_id;
+	u32 seq_num;
+	enum ov_result result;
+
+	peer_device = conn_peer_device(connection, pi->vnr);
+	if (!peer_device)
+		return -EIO;
+	device = peer_device->device;
+
+	if (pi->cmd == P_OV_RESULT) {
+		struct p_block_ack *p = pi->data;
+
+		sector = be64_to_cpu(p->sector);
+		size = be32_to_cpu(p->blksize);
+		block_id = ID_SYNCER;
+		seq_num = be32_to_cpu(p->seq_num);
+		result = drbd_block_id_to_ov_result(be64_to_cpu(p->block_id));
+	} else { /* P_OV_RESULT_ID */
+		struct p_ov_result *p = pi->data;
+
+		sector = be64_to_cpu(p->sector);
+		size = be32_to_cpu(p->blksize);
+		block_id = p->block_id;
+		seq_num = be32_to_cpu(p->seq_num);
+		result = be32_to_cpu(p->result);
+	}
+
+	update_peer_seq(peer_device, seq_num);
+
+	peer_req = find_resync_request(peer_device, INTERVAL_TYPE_MASK(INTERVAL_OV_READ_TARGET),
+			sector, size, block_id);
+	if (!peer_req)
+		return -EIO;
+
+	drbd_remove_peer_req_interval(peer_req);
+
+	/* This may be a request that we could not cancel because the peer does
+	 * not understand P_RS_CANCEL. Treat it as a skipped block. */
+	if (connection->agreed_pro_version < 110 && test_bit(INTERVAL_CONFLICT, &peer_req->i.flags))
+		result = OV_RESULT_SKIP;
+
+	drbd_free_peer_req(peer_req);
+	peer_req = NULL;
+
+	if (result == OV_RESULT_SKIP)
+		drbd_verify_skipped_block(peer_device, sector, size);
+	if (result == OV_RESULT_OUT_OF_SYNC)
+		drbd_ov_out_of_sync_found(peer_device, sector, size);
+	else
+		ov_out_of_sync_print(peer_device);
+
+	if (!get_ldev(device))
+		return 0;
+
+	dec_rs_pending(peer_device);
+
+	verify_progress(peer_device, sector, size);
+
+	put_ldev(device);
+	return 0;
+}
+
+static int got_skip(struct drbd_connection *connection, struct packet_info *pi)
+{
+	return 0;
+}
+
+static u64 node_id_to_mask(struct drbd_peer_md *peer_md, int node_id)
+{
+	int bitmap_bit = peer_md[node_id].bitmap_index;
+	return (bitmap_bit >= 0) ? NODE_MASK(bitmap_bit) : 0;
+}
+
+static u64 node_ids_to_bitmap(struct drbd_device *device, u64 node_ids)
+{
+	struct drbd_peer_md *peer_md = device->ldev->md.peers;
+	u64 bitmap_bits = 0;
+	int node_id;
+
+	for_each_set_bit(node_id, (unsigned long *)&node_ids, DRBD_NODE_ID_MAX)
+		bitmap_bits |= node_id_to_mask(peer_md, node_id);
+	return bitmap_bits;
+}
+
+static struct drbd_peer_request *drbd_send_oos_next_req(struct drbd_connection *peer_ack_connection,
+		int oos_node_id, struct drbd_peer_request *peer_req)
+{
+	lockdep_assert_held(&peer_ack_connection->send_oos_lock);
+
+	if (peer_req == NULL)
+		peer_req = list_entry(&peer_ack_connection->send_oos,
+				struct drbd_peer_request, recv_order);
+
+	list_for_each_entry_continue(peer_req, &peer_ack_connection->send_oos, recv_order) {
+		if (NODE_MASK(oos_node_id) & peer_req->send_oos_pending)
+			return peer_req;
+	}
+
+	return NULL;
 }
 
-static int got_NegAck(struct drbd_connection *connection, struct packet_info *pi)
+static void drbd_send_oos_from(struct drbd_connection *oos_connection, int peer_ack_node_id)
 {
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct p_block_ack *p = pi->data;
-	sector_t sector = be64_to_cpu(p->sector);
-	int size = be32_to_cpu(p->blksize);
-	int err;
+	int oos_node_id = oos_connection->peer_node_id;
+	struct drbd_resource *resource = oos_connection->resource;
+	struct drbd_connection *peer_ack_connection;
+	struct drbd_peer_request *peer_req;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	rcu_read_lock();
+	peer_ack_connection = drbd_connection_by_node_id(resource, peer_ack_node_id);
+	/* Valid to use peer_ack_connection after unlock because we have kref */
+	rcu_read_unlock();
 
-	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+	spin_lock_irq(&peer_ack_connection->send_oos_lock);
+	peer_req = drbd_send_oos_next_req(peer_ack_connection, oos_node_id, NULL);
+	spin_unlock_irq(&peer_ack_connection->send_oos_lock);
 
-	if (p->block_id == ID_SYNCER) {
-		dec_rs_pending(peer_device);
-		drbd_rs_failed_io(peer_device, sector, size);
-		return 0;
+	while (peer_req) {
+		struct drbd_peer_device *peer_device =
+			conn_peer_device(oos_connection, peer_req->peer_device->device->vnr);
+		struct drbd_peer_request *free_peer_req = NULL;
+
+		/* Ignore errors and keep iterating to clear up list */
+		drbd_send_out_of_sync(peer_device, peer_req->i.sector, peer_req->i.size);
+
+		spin_lock_irq(&peer_ack_connection->send_oos_lock);
+		peer_req->send_oos_pending &= ~NODE_MASK(oos_node_id);
+		if (!peer_req->send_oos_pending)
+			free_peer_req = peer_req;
+
+		peer_req = drbd_send_oos_next_req(peer_ack_connection, oos_node_id, peer_req);
+		spin_unlock_irq(&peer_ack_connection->send_oos_lock);
+
+		if (free_peer_req)
+			drbd_free_peer_req(free_peer_req);
 	}
 
-	err = validate_req_change_req_state(peer_device, p->block_id, sector,
-					    &device->write_requests, __func__,
-					    NEG_ACKED, true);
-	if (err) {
-		/* Protocol A has no P_WRITE_ACKs, but has P_NEG_ACKs.
-		   The master bio might already be completed, therefore the
-		   request is no longer in the collision hash. */
-		/* In Protocol B we might already have got a P_RECV_ACK
-		   but then get a P_NEG_ACK afterwards. */
-		drbd_set_out_of_sync(peer_device, sector, size);
+	kref_put(&peer_ack_connection->kref, drbd_destroy_connection);
+}
+
+int drbd_send_out_of_sync_wf(struct drbd_work *w, int cancel)
+{
+	struct drbd_connection *oos_connection = container_of(w, struct drbd_connection,
+			send_oos_work);
+	unsigned long send_oos_from_mask = READ_ONCE(oos_connection->send_oos_from_mask);
+	int peer_ack_node_id;
+
+	for_each_set_bit(peer_ack_node_id, &send_oos_from_mask, sizeof(unsigned long)) {
+		clear_bit(peer_ack_node_id, &oos_connection->send_oos_from_mask);
+		drbd_send_oos_from(oos_connection, peer_ack_node_id);
 	}
+
 	return 0;
 }
 
-static int got_NegDReply(struct drbd_connection *connection, struct packet_info *pi)
+static bool is_sync_source(struct drbd_peer_device *peer_device)
+{
+	return is_sync_source_state(peer_device, NOW) ||
+		peer_device->repl_state[NOW] == L_WF_BITMAP_S;
+}
+
+static u64 drbd_calculate_send_oos_pending(struct drbd_device *device, u64 in_sync)
 {
 	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct p_block_ack *p = pi->data;
-	sector_t sector = be64_to_cpu(p->sector);
+	u64 send_oos_pending = 0;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		if (!(NODE_MASK(peer_device->node_id) & in_sync) &&
+				is_sync_source(peer_device))
+			send_oos_pending |= NODE_MASK(peer_device->node_id);
+	}
+	rcu_read_unlock();
 
-	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+	return send_oos_pending;
+}
 
-	drbd_err(device, "Got NegDReply; Sector %llus, len %u.\n",
-	    (unsigned long long)sector, be32_to_cpu(p->blksize));
+static void drbd_queue_send_out_of_sync(struct drbd_connection *peer_ack_connection,
+		struct list_head *send_oos_peer_req_list, u64 any_send_oos_pending)
+{
+	struct drbd_resource *resource = peer_ack_connection->resource;
+	int peer_ack_node_id = peer_ack_connection->peer_node_id;
+	struct drbd_connection *oos_connection;
 
-	return validate_req_change_req_state(peer_device, p->block_id, sector,
-					     &device->read_requests, __func__,
-					     NEG_ACKED, false);
+	if (!any_send_oos_pending)
+		return;
+
+	spin_lock_irq(&peer_ack_connection->send_oos_lock);
+	list_splice_tail(send_oos_peer_req_list, &peer_ack_connection->send_oos);
+	spin_unlock_irq(&peer_ack_connection->send_oos_lock);
+
+	/* Take state_rwlock to ensure work is queued on sender that is still running */
+	read_lock_irq(&resource->state_rwlock);
+	for_each_connection(oos_connection, resource) {
+		if (!(NODE_MASK(oos_connection->peer_node_id) & any_send_oos_pending) ||
+				oos_connection->cstate[NOW] < C_CONNECTED)
+			continue;
+
+		if (test_and_set_bit(peer_ack_node_id, &oos_connection->send_oos_from_mask))
+			continue; /* Only get kref if we set the bit here */
+
+		kref_get(&peer_ack_connection->kref);
+		drbd_queue_work_if_unqueued(&oos_connection->sender_work,
+				&oos_connection->send_oos_work);
+	}
+	read_unlock_irq(&resource->state_rwlock);
 }
 
-static int got_NegRSDReply(struct drbd_connection *connection, struct packet_info *pi)
+static int got_peer_ack(struct drbd_connection *connection, struct packet_info *pi)
 {
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	sector_t sector;
-	int size;
-	struct p_block_ack *p = pi->data;
+	struct p_peer_ack *p = pi->data;
+	u64 dagtag, in_sync;
+	struct drbd_peer_request *peer_req, *tmp;
+	struct list_head work_list;
+	u64 any_send_oos_pending = 0;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	dagtag = be64_to_cpu(p->dagtag);
+	in_sync = be64_to_cpu(p->mask);
 
-	sector = be64_to_cpu(p->sector);
-	size = be32_to_cpu(p->blksize);
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_for_each_entry(peer_req, &connection->peer_requests, recv_order) {
+		if (dagtag == peer_req->dagtag_sector)
+			goto found;
+	}
+	spin_unlock_irq(&connection->peer_reqs_lock);
 
-	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+	drbd_err(connection, "peer request with dagtag %llu not found\n", dagtag);
+	return -EIO;
 
-	dec_rs_pending(peer_device);
+found:
+	list_cut_position(&work_list, &connection->peer_requests, &peer_req->recv_order);
+	spin_unlock_irq(&connection->peer_reqs_lock);
 
-	if (get_ldev_if_state(device, D_FAILED)) {
-		drbd_rs_complete_io(device, sector);
-		switch (pi->cmd) {
-		case P_NEG_RS_DREPLY:
-			drbd_rs_failed_io(peer_device, sector, size);
-			break;
-		case P_RS_CANCEL:
-			break;
-		default:
-			BUG();
+	list_for_each_entry_safe(peer_req, tmp, &work_list, recv_order) {
+		struct drbd_peer_device *peer_device = peer_req->peer_device;
+		struct drbd_device *device = peer_device->device;
+		u64 in_sync_b, mask;
+
+		D_ASSERT(peer_device, peer_req->flags & EE_IN_ACTLOG);
+
+		if (get_ldev(device)) {
+			if ((peer_req->flags & EE_WAS_ERROR) == 0)
+				in_sync_b = node_ids_to_bitmap(device, in_sync);
+			else
+				in_sync_b = 0;
+			mask = ~node_id_to_mask(device->ldev->md.peers,
+						connection->peer_node_id);
+
+			drbd_set_sync(device, peer_req->i.sector,
+				      peer_req->i.size, ~in_sync_b, mask);
+			drbd_al_complete_io(device, &peer_req->i);
+			put_ldev(device);
 		}
-		put_ldev(device);
+
+		peer_req->send_oos_pending = drbd_calculate_send_oos_pending(device, in_sync);
+		any_send_oos_pending |= peer_req->send_oos_pending;
+		if (!peer_req->send_oos_pending)
+			drbd_free_peer_req(peer_req);
 	}
 
+	drbd_queue_send_out_of_sync(connection, &work_list, any_send_oos_pending);
 	return 0;
 }
 
-static int got_BarrierAck(struct drbd_connection *connection, struct packet_info *pi)
+void apply_unacked_peer_requests(struct drbd_connection *connection)
 {
-	struct p_barrier_ack *p = pi->data;
-	struct drbd_peer_device *peer_device;
-	int vnr;
-
-	tl_release(connection, p->barrier, be32_to_cpu(p->set_size));
+	struct drbd_peer_request *peer_req;
+	unsigned long flags;
 
-	rcu_read_lock();
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+	spin_lock_irqsave(&connection->peer_reqs_lock, flags);
+	list_for_each_entry(peer_req, &connection->peer_requests, recv_order) {
+		struct drbd_peer_device *peer_device = peer_req->peer_device;
 		struct drbd_device *device = peer_device->device;
+		int bitmap_index = peer_device->bitmap_index;
+		u64 mask = ~(bitmap_index != -1 ? 1UL << bitmap_index : 0UL);
 
-		if (device->state.conn == C_AHEAD &&
-		    atomic_read(&device->ap_in_flight) == 0 &&
-		    !test_and_set_bit(AHEAD_TO_SYNC_SOURCE, &device->flags)) {
-			device->start_resync_timer.expires = jiffies + HZ;
-			add_timer(&device->start_resync_timer);
-		}
+		drbd_set_sync(device, peer_req->i.sector, peer_req->i.size,
+			      mask, mask);
 	}
-	rcu_read_unlock();
-
-	return 0;
+	spin_unlock_irqrestore(&connection->peer_reqs_lock, flags);
 }
 
-static int got_OVResult(struct drbd_connection *connection, struct packet_info *pi)
+static void cleanup_unacked_peer_requests(struct drbd_connection *connection)
 {
-	struct drbd_peer_device *peer_device;
-	struct drbd_device *device;
-	struct p_block_ack *p = pi->data;
-	struct drbd_device_work *dw;
-	sector_t sector;
-	int size;
+	struct drbd_peer_request *peer_req, *tmp;
+	LIST_HEAD(work_list);
+	u64 any_send_oos_pending = 0;
 
-	peer_device = conn_peer_device(connection, pi->vnr);
-	if (!peer_device)
-		return -EIO;
-	device = peer_device->device;
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_splice_init(&connection->peer_requests, &work_list);
+	spin_unlock_irq(&connection->peer_reqs_lock);
 
-	sector = be64_to_cpu(p->sector);
-	size = be32_to_cpu(p->blksize);
+	list_for_each_entry_safe(peer_req, tmp, &work_list, recv_order) {
+		struct drbd_peer_device *peer_device = peer_req->peer_device;
+		struct drbd_device *device = peer_device->device;
+		int bitmap_index = peer_device->bitmap_index;
+		u64 mask = ~(bitmap_index != -1 ? 1UL << bitmap_index : 0UL);
 
-	update_peer_seq(peer_device, be32_to_cpu(p->seq_num));
+		if (get_ldev(device)) {
+			drbd_set_sync(device, peer_req->i.sector, peer_req->i.size,
+				      mask, mask);
+			drbd_al_complete_io(device, &peer_req->i);
+			put_ldev(device);
+		}
 
-	if (be64_to_cpu(p->block_id) == ID_OUT_OF_SYNC)
-		drbd_ov_out_of_sync_found(peer_device, sector, size);
-	else
-		ov_out_of_sync_print(peer_device);
+		peer_req->send_oos_pending = drbd_calculate_send_oos_pending(device, 0);
+		any_send_oos_pending |= peer_req->send_oos_pending;
+		if (!peer_req->send_oos_pending)
+			drbd_free_peer_req(peer_req);
+	}
 
-	if (!get_ldev(device))
-		return 0;
+	drbd_queue_send_out_of_sync(connection, &work_list, any_send_oos_pending);
+}
 
-	drbd_rs_complete_io(device, sector);
-	dec_rs_pending(peer_device);
+static void cleanup_peer_ack_list(struct drbd_connection *connection)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_ack *peer_ack, *tmp;
+	struct drbd_request *req;
+	int idx = connection->peer_node_id;
+	u64 node_id_mask = NODE_MASK(idx);
+
+	spin_lock_irq(&resource->peer_ack_lock);
+	list_for_each_entry_safe(peer_ack, tmp, &resource->peer_ack_list, list) {
+		if (!(peer_ack->queued_mask & node_id_mask))
+			continue;
+		peer_ack->queued_mask &= ~node_id_mask;
+		drbd_destroy_peer_ack_if_done(peer_ack);
+	}
+	req = resource->peer_ack_req;
+	if (req)
+		req->net_rq_state[idx] &= ~RQ_NET_SENT;
+	spin_unlock_irq(&resource->peer_ack_lock);
+}
+
+int drbd_flush_ack_wf(struct drbd_work *w, int unused)
+{
+	struct drbd_connection *connection =
+		container_of(w, struct drbd_connection, flush_ack_work);
+	int primary_node_id;
 
-	--device->ov_left;
+	for (primary_node_id = 0; primary_node_id < DRBD_PEERS_MAX; primary_node_id++) {
+		u64 flush_sequence;
 
-	/* let's advance progress step marks only for every other megabyte */
-	if ((device->ov_left & 0x200) == 0x200)
-		drbd_advance_rs_marks(peer_device, device->ov_left);
+		spin_lock_irq(&connection->flush_ack_lock);
+		flush_sequence = connection->flush_ack_sequence[primary_node_id];
+		connection->flush_ack_sequence[primary_node_id] = 0;
+		spin_unlock_irq(&connection->flush_ack_lock);
 
-	if (device->ov_left == 0) {
-		dw = kmalloc_obj(*dw, GFP_NOIO);
-		if (dw) {
-			dw->w.cb = w_ov_finished;
-			dw->device = device;
-			drbd_queue_work(&peer_device->connection->sender_work, &dw->w);
-		} else {
-			drbd_err(device, "kmalloc(dw) failed.");
-			ov_out_of_sync_print(peer_device);
-			drbd_resync_finished(peer_device);
-		}
+		if (flush_sequence) /* Active flushes use non-zero sequence numbers */
+			drbd_send_flush_requests_ack(connection, flush_sequence, primary_node_id);
 	}
-	put_ldev(device);
+
 	return 0;
 }
 
-static int got_skip(struct drbd_connection *connection, struct packet_info *pi)
+static int got_flush_forward(struct drbd_connection *connection, struct packet_info *pi)
 {
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_connection *initiator_connection;
+	struct p_flush_forward *p = pi->data;
+	u64 flush_sequence = be64_to_cpu(p->flush_sequence);
+	int initiator_node_id = be32_to_cpu(p->initiator_node_id);
+
+	rcu_read_lock();
+	initiator_connection = drbd_connection_by_node_id(resource, initiator_node_id);
+	if (!initiator_connection) {
+		rcu_read_unlock();
+		return 0;
+	}
+
+	spin_lock_irq(&initiator_connection->flush_ack_lock);
+	initiator_connection->flush_ack_sequence[connection->peer_node_id] = flush_sequence;
+	drbd_queue_work_if_unqueued(&initiator_connection->sender_work,
+			&initiator_connection->flush_ack_work);
+	spin_unlock_irq(&initiator_connection->flush_ack_lock);
+	rcu_read_unlock();
 	return 0;
 }
 
-struct meta_sock_cmd {
-	size_t pkt_size;
-	int (*fn)(struct drbd_connection *connection, struct packet_info *);
-};
-
-static void set_rcvtimeo(struct drbd_connection *connection, bool ping_timeout)
+static void set_rcvtimeo(struct drbd_connection *connection, enum rcv_timeou_kind kind)
 {
-	long t;
+	struct drbd_transport *transport = &connection->transport;
+	struct drbd_transport_ops *tr_ops = &transport->class->ops;
+	bool ping_timeout = kind == PING_TIMEOUT;
 	struct net_conf *nc;
+	long t;
 
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
+	nc = rcu_dereference(transport->net_conf);
 	t = ping_timeout ? nc->ping_timeo : nc->ping_int;
 	rcu_read_unlock();
 
@@ -5731,202 +11300,263 @@ static void set_rcvtimeo(struct drbd_connection *connection, bool ping_timeout)
 	if (ping_timeout)
 		t /= 10;
 
-	connection->meta.socket->sk->sk_rcvtimeo = t;
+	tr_ops->set_rcvtimeo(transport, CONTROL_STREAM, t);
 }
 
-static void set_ping_timeout(struct drbd_connection *connection)
+void drbd_send_ping_wf(struct work_struct *ws)
 {
-	set_rcvtimeo(connection, 1);
-}
+	struct drbd_connection *connection =
+		container_of(ws, struct drbd_connection, send_ping_work);
+	int err;
 
-static void set_idle_timeout(struct drbd_connection *connection)
-{
-	set_rcvtimeo(connection, 0);
+	set_rcvtimeo(connection, PING_TIMEOUT);
+	set_bit(PING_TIMEOUT_ACTIVE, &connection->flags);
+	err = drbd_send_ping(connection);
+	if (err)
+		change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
 }
 
+struct meta_sock_cmd {
+	size_t pkt_size;
+	int (*fn)(struct drbd_connection *connection, struct packet_info *);
+};
+
 static struct meta_sock_cmd ack_receiver_tbl[] = {
-	[P_PING]	    = { 0, got_Ping },
-	[P_PING_ACK]	    = { 0, got_PingAck },
-	[P_RECV_ACK]	    = { sizeof(struct p_block_ack), got_BlockAck },
-	[P_WRITE_ACK]	    = { sizeof(struct p_block_ack), got_BlockAck },
-	[P_RS_WRITE_ACK]    = { sizeof(struct p_block_ack), got_BlockAck },
-	[P_SUPERSEDED]   = { sizeof(struct p_block_ack), got_BlockAck },
-	[P_NEG_ACK]	    = { sizeof(struct p_block_ack), got_NegAck },
-	[P_NEG_DREPLY]	    = { sizeof(struct p_block_ack), got_NegDReply },
-	[P_NEG_RS_DREPLY]   = { sizeof(struct p_block_ack), got_NegRSDReply },
-	[P_OV_RESULT]	    = { sizeof(struct p_block_ack), got_OVResult },
-	[P_BARRIER_ACK]	    = { sizeof(struct p_barrier_ack), got_BarrierAck },
-	[P_STATE_CHG_REPLY] = { sizeof(struct p_req_state_reply), got_RqSReply },
-	[P_RS_IS_IN_SYNC]   = { sizeof(struct p_block_ack), got_IsInSync },
-	[P_DELAY_PROBE]     = { sizeof(struct p_delay_probe93), got_skip },
-	[P_RS_CANCEL]       = { sizeof(struct p_block_ack), got_NegRSDReply },
-	[P_CONN_ST_CHG_REPLY]={ sizeof(struct p_req_state_reply), got_conn_RqSReply },
-	[P_RETRY_WRITE]	    = { sizeof(struct p_block_ack), got_BlockAck },
+	[P_PING]	      = { 0, got_Ping },
+	[P_PING_ACK]	      = { 0, got_PingAck },
+	[P_RECV_ACK]	      = { sizeof(struct p_block_ack), got_BlockAck },
+	[P_WRITE_ACK]	      = { sizeof(struct p_block_ack), got_BlockAck },
+	[P_WRITE_ACK_IN_SYNC] = { sizeof(struct p_block_ack), got_BlockAck },
+	[P_NEG_ACK]	      = { sizeof(struct p_block_ack), got_NegAck },
+	[P_NEG_DREPLY]	      = { sizeof(struct p_block_ack), got_NegDReply },
+	[P_NEG_RS_DREPLY]     = { sizeof(struct p_block_ack), got_NegRSDReply },
+	[P_RS_WRITE_ACK]      = { sizeof(struct p_block_ack), got_RSWriteAck },
+	[P_RS_NEG_ACK]	      = { sizeof(struct p_block_ack), got_RSWriteAck },
+	[P_OV_RESULT]	      = { sizeof(struct p_block_ack), got_OVResult },
+	[P_OV_RESULT_ID]      = { sizeof(struct p_ov_result), got_OVResult },
+	[P_BARRIER_ACK]	      = { sizeof(struct p_barrier_ack), got_BarrierAck },
+	[P_CONFIRM_STABLE]    = { sizeof(struct p_confirm_stable), got_confirm_stable },
+	[P_STATE_CHG_REPLY]   = { sizeof(struct p_req_state_reply), got_RqSReply },
+	[P_RS_IS_IN_SYNC]     = { sizeof(struct p_block_ack), got_IsInSync },
+	[P_DELAY_PROBE]	      = { sizeof(struct p_delay_probe93), got_skip },
+	[P_RS_CANCEL]	      = { sizeof(struct p_block_ack), got_NegRSDReply },
+	[P_RS_CANCEL_AHEAD]   = { sizeof(struct p_block_ack), got_NegRSDReply },
+	[P_CONN_ST_CHG_REPLY] = { sizeof(struct p_req_state_reply), got_RqSReply },
+	[P_PEER_ACK]	      = { sizeof(struct p_peer_ack), got_peer_ack },
+	[P_PEERS_IN_SYNC]     = { sizeof(struct p_peer_block_desc), got_peers_in_sync },
+	[P_TWOPC_YES]	      = { sizeof(struct p_twopc_reply), got_twopc_reply },
+	[P_TWOPC_NO]	      = { sizeof(struct p_twopc_reply), got_twopc_reply },
+	[P_TWOPC_RETRY]	      = { sizeof(struct p_twopc_reply), got_twopc_reply },
+	[P_FLUSH_FORWARD]     = { sizeof(struct p_flush_forward), got_flush_forward },
 };
 
-int drbd_ack_receiver(struct drbd_thread *thi)
+static void fillup_buffer_from(struct drbd_mutable_buffer *to_fill, unsigned int need, struct drbd_const_buffer *pool)
 {
-	struct drbd_connection *connection = thi->connection;
-	struct meta_sock_cmd *cmd = NULL;
+	if (to_fill->avail < need) {
+		unsigned int missing = min(need - to_fill->avail, pool->avail);
+
+		memcpy(to_fill->buffer + to_fill->avail, pool->buffer, missing);
+		pool->buffer += missing;
+		pool->avail -= missing;
+		to_fill->avail += missing;
+	}
+}
+
+static int decode_meta_cmd(struct drbd_connection *connection, const u8 *pos, struct packet_info *pi)
+{
+	int header_version, payload_size;
+	struct meta_sock_cmd *cmd;
+
+	/*
+	 * A ping packet (via the control stream) can overtake the
+	 * feature packet. We might get it with a different header version
+	 * than expected since we will agree on the protocol version
+	 * by receiving the feature packet.
+	 */
+	header_version = __decode_header(pos, pi);
+	if (header_version < 0) {
+		drbd_err(connection, "Wrong magic value 0x%08x in protocol version %d [control]\n",
+			 be32_to_cpu(*(__be32 *)pos), header_version);
+		return -EINVAL;
+	}
+
+	if (pi->cmd >= ARRAY_SIZE(ack_receiver_tbl)) {
+		drbd_err(connection, "Unexpected meta packet %s (0x%04x)\n",
+			 drbd_packet_name(pi->cmd), pi->cmd);
+		return -ENOENT;
+	}
+
+	cmd = &ack_receiver_tbl[pi->cmd];
+	payload_size = cmd->pkt_size;
+	if (pi->size != payload_size) {
+		drbd_err(connection, "Wrong packet size on meta (c: %d, l: %d)\n",
+			 pi->cmd, pi->size);
+		return -EINVAL;
+	}
+
+	return payload_size;
+}
+
+static int process_previous_part(struct drbd_connection *connection, struct drbd_const_buffer *pool)
+{
+	struct drbd_mutable_buffer *buffer = &connection->reassemble_buffer;
+	int payload_size, packet_size;
+	unsigned int header_size;
 	struct packet_info pi;
-	unsigned long pre_recv_jif;
-	int rv;
-	void *buf    = connection->meta.rbuf;
-	int received = 0;
-	unsigned int header_size = drbd_header_size(connection);
-	int expect   = header_size;
-	bool ping_timeout_active = false;
+	int err;
+
+	fillup_buffer_from(buffer, sizeof(u32), pool);
+	if (buffer->avail < sizeof(u32))
+		return 0;
 
-	sched_set_fifo_low(current);
+	header_size = decode_header_size(buffer->buffer);
+	fillup_buffer_from(buffer, header_size, pool);
+	if (buffer->avail < header_size)
+		return 0;
 
-	while (get_t_state(thi) == RUNNING) {
-		drbd_thread_current_set_cpu(thi);
+	payload_size = decode_meta_cmd(connection, buffer->buffer, &pi);
+	if (payload_size < 0)
+		return payload_size;
 
-		if (test_and_clear_bit(SEND_PING, &connection->flags)) {
-			if (drbd_send_ping(connection)) {
-				drbd_err(connection, "drbd_send_ping has failed\n");
-				goto reconnect;
-			}
-			set_ping_timeout(connection);
-			ping_timeout_active = true;
-		}
-
-		pre_recv_jif = jiffies;
-		rv = drbd_recv_short(connection->meta.socket, buf, expect-received, 0);
-
-		/* Note:
-		 * -EINTR	 (on meta) we got a signal
-		 * -EAGAIN	 (on meta) rcvtimeo expired
-		 * -ECONNRESET	 other side closed the connection
-		 * -ERESTARTSYS  (on data) we got a signal
-		 * rv <  0	 other than above: unexpected error!
-		 * rv == expected: full header or command
-		 * rv <  expected: "woken" by signal during receive
-		 * rv == 0	 : "connection shut down by peer"
-		 */
-		if (likely(rv > 0)) {
-			received += rv;
-			buf	 += rv;
-		} else if (rv == 0) {
-			if (test_bit(DISCONNECT_SENT, &connection->flags)) {
-				long t;
-				rcu_read_lock();
-				t = rcu_dereference(connection->net_conf)->ping_timeo * HZ/10;
-				rcu_read_unlock();
-
-				t = wait_event_timeout(connection->ping_wait,
-						       connection->cstate < C_WF_REPORT_PARAMS,
-						       t);
-				if (t)
-					break;
-			}
-			drbd_err(connection, "meta connection shut down by peer.\n");
+	packet_size = header_size + payload_size;
+	fillup_buffer_from(buffer, packet_size, pool);
+	if (buffer->avail < packet_size)
+		return 0;
+
+	err = ack_receiver_tbl[pi.cmd].fn(connection, &pi);
+	connection->reassemble_buffer.avail = 0;
+	return err;
+}
+
+void drbd_control_data_ready(struct drbd_transport *transport, struct drbd_const_buffer *pool)
+{
+	struct drbd_connection *connection =
+		container_of(transport, struct drbd_connection, transport);
+	unsigned int header_size;
+	int err;
+
+	if (connection->cstate[NOW] < C_TEAR_DOWN)
+		return;
+
+	if (connection->reassemble_buffer.avail) {
+		err = process_previous_part(connection, pool);
+		if (err < 0)
 			goto reconnect;
-		} else if (rv == -EAGAIN) {
-			/* If the data socket received something meanwhile,
-			 * that is good enough: peer is still alive. */
-			if (time_after(connection->last_received, pre_recv_jif))
-				continue;
-			if (ping_timeout_active) {
-				drbd_err(connection, "PingAck did not arrive in time.\n");
-				goto reconnect;
-			}
-			set_bit(SEND_PING, &connection->flags);
-			continue;
-		} else if (rv == -EINTR) {
-			/* maybe drbd_thread_stop(): the while condition will notice.
-			 * maybe woken for send_ping: we'll send a ping above,
-			 * and change the rcvtimeo */
-			flush_signals(current);
-			continue;
-		} else {
-			drbd_err(connection, "sock_recvmsg returned %d\n", rv);
+	}
+
+	while (pool->avail >= sizeof(u32)) {
+		int payload_size, packet_size;
+		struct packet_info pi;
+
+		header_size = decode_header_size(pool->buffer);
+		if (header_size > pool->avail)
+			goto keep_part;
+
+		payload_size = decode_meta_cmd(connection, pool->buffer, &pi);
+		if (payload_size < 0) {
+			err = payload_size;
 			goto reconnect;
 		}
 
-		if (received == expect && cmd == NULL) {
-			if (decode_header(connection, connection->meta.rbuf, &pi))
-				goto reconnect;
-			cmd = &ack_receiver_tbl[pi.cmd];
-			if (pi.cmd >= ARRAY_SIZE(ack_receiver_tbl) || !cmd->fn) {
-				drbd_err(connection, "Unexpected meta packet %s (0x%04x)\n",
-					 cmdname(pi.cmd), pi.cmd);
-				goto disconnect;
-			}
-			expect = header_size + cmd->pkt_size;
-			if (pi.size != expect - header_size) {
-				drbd_err(connection, "Wrong packet size on meta (c: %d, l: %d)\n",
-					pi.cmd, pi.size);
-				goto reconnect;
-			}
-		}
-		if (received == expect) {
-			bool err;
+		packet_size = header_size + payload_size;
+		if (packet_size > pool->avail)
+			goto keep_part;
 
-			err = cmd->fn(connection, &pi);
-			if (err) {
-				drbd_err(connection, "%ps failed\n", cmd->fn);
-				goto reconnect;
-			}
+		err = ack_receiver_tbl[pi.cmd].fn(connection, &pi);
+		if (err)
+			goto reconnect;
 
-			connection->last_received = jiffies;
+		pool->buffer += packet_size;
+		pool->avail -= packet_size;
+	}
+	if (pool->avail > 0) {
+keep_part:
+		memcpy(connection->reassemble_buffer.buffer, pool->buffer, pool->avail);
+		connection->reassemble_buffer.avail = pool->avail;
+		pool->avail = 0;
+	}
+	return;
 
-			if (cmd == &ack_receiver_tbl[P_PING_ACK]) {
-				set_idle_timeout(connection);
-				ping_timeout_active = false;
-			}
+reconnect:
+	change_cstate(connection, err == -EPROTO ? C_PROTOCOL_ERROR : C_NETWORK_FAILURE, CS_HARD);
+}
+EXPORT_SYMBOL(drbd_control_data_ready);
+
+void drbd_control_event(struct drbd_transport *transport, enum drbd_tr_event event)
+{
+	struct drbd_connection *connection =
+		container_of(transport, struct drbd_connection, transport);
 
-			buf	 = connection->meta.rbuf;
-			received = 0;
-			expect	 = header_size;
-			cmd	 = NULL;
+	if (event == TIMEOUT) {
+		if (!test_bit(PING_TIMEOUT_ACTIVE, &connection->flags)) {
+			schedule_work(&connection->send_ping_work);
+			return;
+		} else {
+			if (connection->cstate[NOW] == C_CONNECTED)
+				drbd_warn(connection, "PingAck did not arrive in time.\n");
 		}
+	} else /* event == CLOSED_BY_PEER */ {
+		if (connection->cstate[NOW] == C_CONNECTED && disconnect_expected(connection))
+			return;
+		drbd_warn(connection, "meta connection shut down by peer.\n");
 	}
 
-	if (0) {
-reconnect:
-		conn_request_state(connection, NS(conn, C_NETWORK_FAILURE), CS_HARD);
-		conn_md_sync(connection);
-	}
-	if (0) {
-disconnect:
-		conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
-	}
+	change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
+}
+EXPORT_SYMBOL(drbd_control_event);
 
-	drbd_info(connection, "ack_receiver terminated\n");
+static bool disconnect_expected(struct drbd_connection *connection)
+{
+	struct drbd_resource *resource = connection->resource;
+	bool expect_disconnect;
 
-	return 0;
+	/* We are reacting to a not-committed state change! The disconnect might
+	   get aborted. This is not a problem worth much more complex code.
+	   In the unlikely case, it happens that a two-phase-commit of a graceful
+	   disconnect gets aborted and the control connection breaks in exactly
+	   this time window, we will notice it as soon as sending something on the
+	   control stream. */
+	read_lock_irq(&resource->state_rwlock);
+	expect_disconnect = resource->remote_state_change &&
+		drbd_twopc_between_peer_and_me(connection) &&
+		resource->twopc_reply.is_disconnect;
+	read_unlock_irq(&resource->state_rwlock);
+	return expect_disconnect;
 }
 
 void drbd_send_acks_wf(struct work_struct *ws)
 {
-	struct drbd_peer_device *peer_device =
-		container_of(ws, struct drbd_peer_device, send_acks_work);
-	struct drbd_connection *connection = peer_device->connection;
-	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection =
+		container_of(ws, struct drbd_connection, send_acks_work);
+	struct drbd_transport *transport = &connection->transport;
 	struct net_conf *nc;
 	int tcp_cork, err;
 
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
+	nc = rcu_dereference(transport->net_conf);
 	tcp_cork = nc->tcp_cork;
 	rcu_read_unlock();
 
+	/* TODO: conditionally cork; it may hurt latency if we cork without
+	   much to send */
 	if (tcp_cork)
-		tcp_sock_set_cork(connection->meta.socket->sk, true);
+		drbd_cork(connection, CONTROL_STREAM);
+	err = drbd_finish_peer_reqs(connection);
 
-	err = drbd_finish_peer_reqs(device);
-	kref_put(&device->kref, drbd_destroy_device);
-	/* get is in drbd_endio_write_sec_final(). That is necessary to keep the
-	   struct work_struct send_acks_work alive, which is in the peer_device object */
+	/* but unconditionally uncork unless disabled */
+	if (err)
+		change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
+	else if (tcp_cork)
+		drbd_uncork(connection, CONTROL_STREAM);
 
-	if (err) {
-		conn_request_state(connection, NS(conn, C_NETWORK_FAILURE), CS_HARD);
-		return;
-	}
+}
 
-	if (tcp_cork)
-		tcp_sock_set_cork(connection->meta.socket->sk, false);
+void drbd_send_peer_ack_wf(struct work_struct *ws)
+{
+	struct drbd_connection *connection =
+		container_of(ws, struct drbd_connection, peer_ack_work);
 
-	return;
+	if (process_peer_ack_list(connection))
+		change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
 }
+
diff --git a/drivers/block/drbd/drbd_transport.h b/drivers/block/drbd/drbd_transport.h
index ff393e8d12dc..b65950796f52 100644
--- a/drivers/block/drbd/drbd_transport.h
+++ b/drivers/block/drbd/drbd_transport.h
@@ -57,6 +57,7 @@
 struct drbd_resource;
 struct drbd_listener;
 struct drbd_transport;
+struct bio;
 
 enum drbd_stream {
 	DATA_STREAM,
@@ -136,12 +137,6 @@ struct drbd_transport_stats {
 	int send_buffer_used;
 };
 
-/* argument to ->recv_pages() */
-struct drbd_page_chain_head {
-	struct page *head;
-	unsigned int nr_pages;
-};
-
 struct drbd_const_buffer {
 	const u8 *buffer;
 	unsigned int avail;
@@ -208,18 +203,19 @@ struct drbd_transport_ops {
 	int (*recv)(struct drbd_transport *, enum drbd_stream, void **buf, size_t size, int flags);
 
 /**
- * recv_pages() - Receive bulk data via the transport's DATA_STREAM
+ * recv_bio() - Receive bulk data via the transport's DATA_STREAM into bios
  * @peer_device: Identify the transport and the device
- * @page_chain:	Here recv_pages() will place the page chain head and length
+ * @bios:	the bio_list to add received data to
  * @size:	Number of bytes to receive
  *
- * recv_pages() will return the requested amount of data from DATA_STREAM,
- * and place it into pages allocated with drbd_alloc_pages().
+ * recv_bio() receives the requested amount of data from DATA_STREAM. It
+ * allocates pages by using drbd_alloc_pages() and adds them to bios in the
+ * bio_list.
  *
  * Upon success the function returns 0. Upon error the function returns a
  * negative value
  */
-	int (*recv_pages)(struct drbd_transport *, struct drbd_page_chain_head *, size_t size);
+	int (*recv_bio)(struct drbd_transport *, struct bio_list *bios, size_t size);
 
 	void (*stats)(struct drbd_transport *, struct drbd_transport_stats *stats);
 /**
@@ -240,7 +236,7 @@ struct drbd_transport_ops {
 	long (*get_rcvtimeo)(struct drbd_transport *, enum drbd_stream);
 	int (*send_page)(struct drbd_transport *, enum drbd_stream, struct page *,
 			 int offset, size_t size, unsigned msg_flags);
-	int (*send_zc_bio)(struct drbd_transport *, struct bio *bio);
+	int (*send_bio)(struct drbd_transport *, struct bio *bio, unsigned int msg_flags);
 	bool (*stream_ok)(struct drbd_transport *, enum drbd_stream);
 	bool (*hint)(struct drbd_transport *, enum drbd_stream, enum drbd_tr_hints hint);
 	void (*debugfs_show)(struct drbd_transport *, struct seq_file *m);
@@ -324,6 +320,8 @@ void drbd_path_event(struct drbd_transport *transport, struct drbd_path *path);
 void drbd_listener_destroy(struct kref *kref);
 struct drbd_path *__drbd_next_path_ref(struct drbd_path *drbd_path,
 				       struct drbd_transport *transport);
+int drbd_bio_add_page(struct drbd_transport *transport, struct bio_list *bios,
+		      struct page *page, unsigned int len, unsigned int offset);
 
 /* Might restart iteration, if current element is removed from list!! */
 #define for_each_path_ref(path, transport)			\
@@ -332,112 +330,11 @@ struct drbd_path *__drbd_next_path_ref(struct drbd_path *drbd_path,
 	     path = __drbd_next_path_ref(path, transport))
 
 /* drbd_receiver.c*/
-struct page *drbd_alloc_pages(struct drbd_transport *transport,
-			      unsigned int number, gfp_t gfp_mask);
-void drbd_free_pages(struct drbd_transport *transport, struct page *page);
+struct page *drbd_alloc_pages(struct drbd_transport *transport, gfp_t gfp_mask, unsigned int size);
+void drbd_free_page(struct drbd_transport *transport, struct page *page);
 void drbd_control_data_ready(struct drbd_transport *transport,
 			     struct drbd_const_buffer *pool);
 void drbd_control_event(struct drbd_transport *transport,
 			enum drbd_tr_event event);
 
-static inline void drbd_alloc_page_chain(struct drbd_transport *t,
-	struct drbd_page_chain_head *chain, unsigned int nr, gfp_t gfp_flags)
-{
-	chain->head = drbd_alloc_pages(t, nr, gfp_flags);
-	chain->nr_pages = chain->head ? nr : 0;
-}
-
-static inline void drbd_free_page_chain(struct drbd_transport *transport,
-					struct drbd_page_chain_head *chain)
-{
-	drbd_free_pages(transport, chain->head);
-	chain->head = NULL;
-	chain->nr_pages = 0;
-}
-
-/*
- * Some helper functions to deal with our page chains.
- */
-/* Our transports may sometimes need to only partially use a page.
- * We need to express that somehow.  Use this struct, and "graft" it into
- * struct page at page->lru.
- *
- * According to include/linux/mm.h:
- *  | A page may be used by anyone else who does a __get_free_page().
- *  | In this case, page_count still tracks the references, and should only
- *  | be used through the normal accessor functions. The top bits of page->flags
- *  | and page->virtual store page management information, but all other fields
- *  | are unused and could be used privately, carefully. The management of this
- *  | page is the responsibility of the one who allocated it, and those who have
- *  | subsequently been given references to it.
- * (we do alloc_page(), that is equivalent).
- *
- * Red Hat struct page is different from upstream (layout and members) :(
- * So I am not too sure about the "all other fields", and it is not as easy to
- * find a place where sizeof(struct drbd_page_chain) would fit on all archs and
- * distribution-changed layouts.
- *
- * But (upstream) struct page also says:
- *  | struct list_head lru;   * ...
- *  |       * Can be used as a generic list
- *  |       * by the page owner.
- *
- * On 32bit, use unsigned short for offset and size,
- * to still fit in sizeof(page->lru).
- */
-
-/* grafted over struct page.lru */
-struct drbd_page_chain {
-	struct page *next;	/* next page in chain, if any */
-#ifdef CONFIG_64BIT
-	unsigned int offset;	/* start offset of data within this page */
-	unsigned int size;	/* number of data bytes within this page */
-#else
-#if PAGE_SIZE > (1U<<16)
-#error "won't work."
-#endif
-	unsigned short offset;	/* start offset of data within this page */
-	unsigned short size;	/* number of data bytes within this page */
-#endif
-};
-
-static inline void dummy_for_buildbug(void)
-{
-	struct page *dummy;
-	BUILD_BUG_ON(sizeof(struct drbd_page_chain) > sizeof(dummy->lru));
-}
-
-#define page_chain_next(page) \
-	(((struct drbd_page_chain *)&(page)->lru)->next)
-#define page_chain_size(page) \
-	(((struct drbd_page_chain *)&(page)->lru)->size)
-#define page_chain_offset(page) \
-	(((struct drbd_page_chain *)&(page)->lru)->offset)
-#define set_page_chain_next(page, v) \
-	(((struct drbd_page_chain *)&(page)->lru)->next = (v))
-#define set_page_chain_size(page, v) \
-	(((struct drbd_page_chain *)&(page)->lru)->size = (v))
-#define set_page_chain_offset(page, v) \
-	(((struct drbd_page_chain *)&(page)->lru)->offset = (v))
-#define set_page_chain_next_offset_size(page, n, o, s)		\
-	(*((struct drbd_page_chain *)&(page)->lru) =		\
-	((struct drbd_page_chain) {				\
-		.next = (n),					\
-		.offset = (o),					\
-		.size = (s),					\
-	 }))
-
-#define page_chain_for_each(page) \
-	for (; page && ({ prefetch(page_chain_next(page)); 1; }); \
-			page = page_chain_next(page))
-#define page_chain_for_each_safe(page, n) \
-	for (; page && ({ n = page_chain_next(page); 1; }); page = n)
-
-#ifndef SK_CAN_REUSE
-/* This constant was introduced by Pavel Emelyanov <xemul@parallels.com> on
-   Thu Apr 19 03:39:36 2012 +0000. Before the release of linux-3.5
-   commit 4a17fd52 sock: Introduce named constants for sk_reuse */
-#define SK_CAN_REUSE   1
-#endif
-
 #endif
diff --git a/drivers/block/drbd/drbd_transport_lb-tcp.c b/drivers/block/drbd/drbd_transport_lb-tcp.c
index 29f18df2be88..03ea93e7352f 100644
--- a/drivers/block/drbd/drbd_transport_lb-tcp.c
+++ b/drivers/block/drbd/drbd_transport_lb-tcp.c
@@ -121,7 +121,6 @@ struct dtl_path {
 	struct dtl_flow flow[2];
 };
 
-
 static int dtl_init(struct drbd_transport *transport);
 static void dtl_free(struct drbd_transport *transport, enum drbd_tr_free_op free_op);
 static void dtl_socket_free(struct drbd_transport *transport, struct socket **sock);
@@ -130,8 +129,7 @@ static int dtl_connect(struct drbd_transport *transport);
 static void dtl_finish_connect(struct drbd_transport *transport);
 static int dtl_recv(struct drbd_transport *transport, enum drbd_stream stream, void **buf,
 		    size_t size, int flags);
-static int dtl_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain,
-			  size_t size);
+static int dtl_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size);
 static void dtl_stats(struct drbd_transport *transport, struct drbd_transport_stats *stats);
 static int dtl_net_conf_change(struct drbd_transport *transport, struct net_conf *new_net_conf);
 static void dtl_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream,
@@ -139,7 +137,7 @@ static void dtl_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream
 static long dtl_get_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream);
 static int dtl_send_page(struct drbd_transport *transport, enum drbd_stream, struct page *page,
 		int offset, size_t size, unsigned int msg_flags);
-static int dtl_send_zc_bio(struct drbd_transport *, struct bio *bio);
+static int dtl_send_bio(struct drbd_transport *, struct bio *bio, unsigned int msg_flags);
 static bool dtl_stream_ok(struct drbd_transport *transport, enum drbd_stream stream);
 static bool dtl_hint(struct drbd_transport *transport, enum drbd_stream stream,
 		     enum drbd_tr_hints hint);
@@ -173,13 +171,13 @@ static struct drbd_transport_class dtl_transport_class = {
 		.connect = dtl_connect,
 		.finish_connect = dtl_finish_connect,
 		.recv = dtl_recv,
-		.recv_pages = dtl_recv_pages,
+		.recv_bio = dtl_recv_bio,
 		.stats = dtl_stats,
 		.net_conf_change = dtl_net_conf_change,
 		.set_rcvtimeo = dtl_set_rcvtimeo,
 		.get_rcvtimeo = dtl_get_rcvtimeo,
 		.send_page = dtl_send_page,
-		.send_zc_bio = dtl_send_zc_bio,
+		.send_bio = dtl_send_bio,
 		.stream_ok = dtl_stream_ok,
 		.hint = dtl_hint,
 		.debugfs_show = dtl_debugfs_show,
@@ -470,7 +468,7 @@ _dtl_recv_page(struct dtl_transport *dtl_transport, struct page *page, int size)
 		if (err)
 			goto out;
 
-		err = dtl_recv_short(flow->sock, data, min(size, flow->recv_bytes), 0);
+		err = dtl_recv_short(flow->sock, pos, min(size, flow->recv_bytes), 0);
 		if (err < 0)
 			goto out;
 		size -= err;
@@ -484,36 +482,37 @@ _dtl_recv_page(struct dtl_transport *dtl_transport, struct page *page, int size)
 }
 
 static int
-dtl_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain, size_t size)
+dtl_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size)
 {
 	struct dtl_transport *dtl_transport =
 		container_of(transport, struct dtl_transport, transport);
 	struct page *page;
 	int err;
 
-	drbd_alloc_page_chain(transport, chain, DIV_ROUND_UP(size, PAGE_SIZE), GFP_TRY);
-	page = chain->head;
-	if (!page)
-		return -ENOMEM;
+	do {
+		size_t len;
 
-	page_chain_for_each(page) {
-		size_t len = min_t(int, size, PAGE_SIZE);
+		page = drbd_alloc_pages(transport, GFP_KERNEL, size);
+		if (!page)
+			return -ENOMEM;
+		len = min(PAGE_SIZE << compound_order(page), size);
 
 		err = _dtl_recv_page(dtl_transport, page, len);
 		if (err < 0)
 			goto fail;
-		set_page_chain_offset(page, 0);
-		set_page_chain_size(page, len);
 		size -= err;
-	}
+		err = drbd_bio_add_page(transport, bios, page, len, 0);
+		if (err < 0)
+			goto fail;
+	} while (size > 0);
+
 	if (unlikely(size)) {
 		tr_warn(transport, "Not enough data received; missing %zu bytes\n", size);
-		err = -ENODATA;
-		goto fail;
+		return -ENODATA;
 	}
 	return 0;
 fail:
-	drbd_free_page_chain(transport, chain);
+	drbd_free_page(transport, page);
 	return err;
 }
 
@@ -1631,7 +1630,7 @@ static int dtl_select_send_flow(struct dtl_transport *dtl_transport,
 static int _dtl_send_page(struct dtl_transport *dtl_transport, struct dtl_flow *flow,
 			  struct page *page, int offset, size_t size, unsigned int msg_flags)
 {
-	struct msghdr msg = { .msg_flags = msg_flags | MSG_NOSIGNAL | MSG_SPLICE_PAGES };
+	struct msghdr msg = { .msg_flags = msg_flags | MSG_NOSIGNAL };
 	struct drbd_transport *transport = &dtl_transport->transport;
 	struct socket *sock = flow->sock;
 	struct bio_vec bvec;
@@ -1716,7 +1715,7 @@ static int dtl_bio_chunk_size_available(struct bio *bio, int wmem_available,
 }
 
 static int dtl_send_bio_pages(struct dtl_transport *dtl_transport, struct dtl_flow *flow,
-		struct bio *bio, struct bvec_iter *iter, int chunk)
+			struct bio *bio, struct bvec_iter *iter, int chunk, unsigned int msg_flags)
 {
 	struct bio_vec bvec;
 
@@ -1726,7 +1725,7 @@ static int dtl_send_bio_pages(struct dtl_transport *dtl_transport, struct dtl_fl
 		bvec = bio_iter_iovec(bio, *iter);
 		err = _dtl_send_page(dtl_transport, flow, bvec.bv_page,
 				bvec.bv_offset, bvec.bv_len,
-				bio_iter_last(bvec, *iter) ? 0 : MSG_MORE);
+				msg_flags | (bio_iter_last(bvec, *iter) ? 0 : MSG_MORE));
 		if (err)
 			return err;
 		chunk -= bvec.bv_len;
@@ -1736,7 +1735,8 @@ static int dtl_send_bio_pages(struct dtl_transport *dtl_transport, struct dtl_fl
 	return 0;
 }
 
-static int dtl_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
+static int dtl_send_bio(struct drbd_transport *transport, struct bio *bio,
+			   unsigned int msg_flags)
 {
 	struct dtl_transport *dtl_transport =
 		container_of(transport, struct dtl_transport, transport);
@@ -1777,7 +1777,7 @@ static int dtl_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
 				goto out;
 		}
 
-		err = dtl_send_bio_pages(dtl_transport, flow, bio, &iter, chunk);
+		err = dtl_send_bio_pages(dtl_transport, flow, bio, &iter, chunk, msg_flags);
 		if (err)
 			goto out;
 	} while (iter.bi_size);
diff --git a/drivers/block/drbd/drbd_transport_rdma.c b/drivers/block/drbd/drbd_transport_rdma.c
index fbdf6a4bcda9..69850bef34f8 100644
--- a/drivers/block/drbd/drbd_transport_rdma.c
+++ b/drivers/block/drbd/drbd_transport_rdma.c
@@ -322,8 +322,8 @@ static void dtr_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream
 static long dtr_get_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream);
 static int dtr_send_page(struct drbd_transport *transport, enum drbd_stream stream, struct page *page,
 		int offset, size_t size, unsigned msg_flags);
-static int dtr_send_zc_bio(struct drbd_transport *, struct bio *bio);
-static int dtr_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain, size_t size);
+static int dtr_send_bio(struct drbd_transport *, struct bio *bio, unsigned int msg_flags);
+static int dtr_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size);
 static bool dtr_stream_ok(struct drbd_transport *transport, enum drbd_stream stream);
 static bool dtr_hint(struct drbd_transport *transport, enum drbd_stream stream, enum drbd_tr_hints hint);
 static void dtr_debugfs_show(struct drbd_transport *, struct seq_file *m);
@@ -392,8 +392,8 @@ static struct drbd_transport_class rdma_transport_class = {
 		.set_rcvtimeo = dtr_set_rcvtimeo,
 		.get_rcvtimeo = dtr_get_rcvtimeo,
 		.send_page = dtr_send_page,
-		.send_zc_bio = dtr_send_zc_bio,
-		.recv_pages = dtr_recv_pages,
+		.send_bio = dtr_send_bio,
+		.recv_bio = dtr_recv_bio,
 		.stream_ok = dtr_stream_ok,
 		.hint = dtr_hint,
 		.debugfs_show = dtr_debugfs_show,
@@ -609,13 +609,13 @@ static int dtr_send(struct dtr_path *path, void *buf, size_t size, gfp_t gfp_mas
 }
 
 
-static int dtr_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain, size_t size)
+static int dtr_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size)
 {
 	struct dtr_transport *rdma_transport =
 		container_of(transport, struct dtr_transport, transport);
 	struct dtr_stream *rdma_stream = &rdma_transport->stream[DATA_STREAM];
-	struct page *page, *head = NULL, *tail = NULL;
-	int i = 0;
+	struct page *page;
+	int err, i = 0;
 
 	if (!dtr_transport_ok(transport))
 		return -ECONNRESET;
@@ -633,15 +633,8 @@ static int dtr_recv_pages(struct drbd_transport *transport, struct drbd_page_cha
 					dtr_receive_rx_desc(rdma_transport, DATA_STREAM, &rx_desc),
 					rdma_stream->recv_timeout);
 
-		if (t <= 0) {
-			/*
-			 * Cannot give back pages that may still be in use!
-			 * (More reason why we only have one rx_desc per page,
-			 * and don't get_page() in dtr_create_rx_desc).
-			 */
-			drbd_free_pages(transport, head);
+		if (t <= 0)
 			return t == 0 ? -EAGAIN : -EINTR;
-		}
 
 		page = rx_desc->page;
 		/* put_page() if we would get_page() in
@@ -655,24 +648,10 @@ static int dtr_recv_pages(struct drbd_transport *transport, struct drbd_page_cha
 		 * unaligned bvecs (as xfs often creates), rx_desc->size and
 		 * offset may well be not the PAGE_SIZE and 0 we hope for.
 		 */
-		if (tail) {
-			/* See also dtr_create_rx_desc().
-			 * For PAGE_SIZE > 4k, we may create several RR per page.
-			 * We cannot link a page to itself, though.
-			 *
-			 * Adding to size would be easy enough.
-			 * But what do we do about possible holes?
-			 * FIXME
-			 */
-			BUG_ON(page == tail);
 
-			set_page_chain_next(tail, page);
-			tail = page;
-		} else
-			head = tail = page;
-
-		set_page_chain_offset(page, 0);
-		set_page_chain_size(page, rx_desc->size);
+		err = drbd_bio_add_page(transport, bios, page, rx_desc->size, 0);
+		if (err < 0)
+			return err;
 
 		atomic_dec(&rx_desc->cm->path->flow[DATA_STREAM].rx_descs_allocated);
 		dtr_free_rx_desc(rx_desc);
@@ -682,8 +661,6 @@ static int dtr_recv_pages(struct drbd_transport *transport, struct drbd_page_cha
 	}
 
 	// pr_info("%s: rcvd %d pages\n", rdma_stream->name, i);
-	chain->head = head;
-	chain->nr_pages = i;
 	return 0;
 }
 
@@ -2023,7 +2000,7 @@ static void dtr_free_rx_desc(struct dtr_rx_desc *rx_desc)
 
 		/* put_page(), if we had more than one rx_desc per page,
 		 * but see comments in dtr_create_rx_desc */
-		drbd_free_pages(transport, rx_desc->page);
+		drbd_free_page(transport, rx_desc->page);
 	}
 	kfree(rx_desc);
 }
@@ -2032,23 +2009,17 @@ static int dtr_create_rx_desc(struct dtr_flow *flow, gfp_t gfp_mask, bool connec
 {
 	struct dtr_path *path = flow->path;
 	struct drbd_transport *transport = path->path.transport;
-	struct dtr_transport *rdma_transport =
-		container_of(transport, struct dtr_transport, transport);
 	struct dtr_rx_desc *rx_desc;
 	struct page *page;
-	int err, alloc_size = rdma_transport->rx_allocation_size;
-	int nr_pages = alloc_size / PAGE_SIZE;
+	int err;
 	struct dtr_cm *cm;
 
 	rx_desc = kzalloc_obj(*rx_desc, gfp_mask);
 	if (!rx_desc)
 		return -ENOMEM;
 
-	/* As of now, this MUST NEVER return a highmem page!
-	 * Which means no other user may ever have requested and then given
-	 * back a highmem page!
-	 */
-	page = drbd_alloc_pages(transport, nr_pages, gfp_mask);
+	/* Ignoring rdma_transport->rx_allocation_size for now! */
+	page = drbd_alloc_pages(transport, gfp_mask, PAGE_SIZE);
 	if (!page) {
 		kfree(rx_desc);
 		return -ENOMEM;
@@ -2066,14 +2037,14 @@ static int dtr_create_rx_desc(struct dtr_flow *flow, gfp_t gfp_mask, bool connec
 	rx_desc->page = page;
 	rx_desc->size = 0;
 	rx_desc->sge.lkey = dtr_cm_to_lkey(cm);
-	rx_desc->sge.addr = ib_dma_map_single(cm->id->device, page_address(page), alloc_size,
+	rx_desc->sge.addr = ib_dma_map_single(cm->id->device, page_address(page), PAGE_SIZE,
 					      DMA_FROM_DEVICE);
 	err = ib_dma_mapping_error(cm->id->device, rx_desc->sge.addr);
 	if (err) {
 		tr_err(transport, "ib_dma_map_single() failed %d\n", err);
 		goto out_put;
 	}
-	rx_desc->sge.length = alloc_size;
+	rx_desc->sge.length = PAGE_SIZE;
 
 	atomic_inc(&flow->rx_descs_allocated);
 	atomic_inc(&flow->rx_descs_posted);
@@ -2090,7 +2061,7 @@ static int dtr_create_rx_desc(struct dtr_flow *flow, gfp_t gfp_mask, bool connec
 	kref_put(&cm->kref, dtr_destroy_cm);
 out:
 	kfree(rx_desc);
-	drbd_free_pages(transport, page);
+	drbd_free_page(transport, page);
 	return err;
 }
 
@@ -3170,11 +3141,12 @@ static void dtr_update_congested(struct drbd_transport *transport)
 }
 
 static int dtr_send_page(struct drbd_transport *transport, enum drbd_stream stream,
-			 struct page *page, int offset, size_t size, unsigned msg_flags)
+			 struct page *caller_page, int offset, size_t size, unsigned int msg_flags)
 {
 	struct dtr_transport *rdma_transport =
 		container_of(transport, struct dtr_transport, transport);
 	struct dtr_tx_desc *tx_desc;
+	struct page *page;
 	int err;
 
 	// pr_info("%s: in send_page, size: %zu\n", rdma_stream->name, size);
@@ -3311,7 +3283,7 @@ static int dtr_send_bio_part(struct dtr_transport *rdma_transport,
 }
 #endif
 
-static int dtr_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
+static int dtr_send_bio(struct drbd_transport *transport, struct bio *bio, unsigned int msg_flags)
 {
 #if SENDER_COMPACTS_BVECS
 	struct dtr_transport *rdma_transport =
@@ -3329,6 +3301,7 @@ static int dtr_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
 		return -ECONNRESET;
 
 #if SENDER_COMPACTS_BVECS
+	/* TODO obey !MSG_SPLICE_PAGES in msg_flags */
 	bio_for_each_segment(bvec, bio, iter) {
 		size_tx_desc += bvec.bv_len;
 		//tr_info(transport, " bvec len = %d\n", bvec.bv_len);
@@ -3358,8 +3331,7 @@ static int dtr_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
 #else
 	bio_for_each_segment(bvec, bio, iter) {
 		err = dtr_send_page(transport, DATA_STREAM,
-			bvec.bv_page, bvec.bv_offset, bvec.bv_len,
-			0 /* flags currently unused by dtr_send_page */);
+			bvec.bv_page, bvec.bv_offset, bvec.bv_len, msg_flags);
 		if (err)
 			break;
 	}
diff --git a/drivers/block/drbd/drbd_transport_tcp.c b/drivers/block/drbd/drbd_transport_tcp.c
index 5faa6b82c358..51169d7a5902 100644
--- a/drivers/block/drbd/drbd_transport_tcp.c
+++ b/drivers/block/drbd/drbd_transport_tcp.c
@@ -115,14 +115,14 @@ static int dtt_prepare_connect(struct drbd_transport *transport);
 static int dtt_connect(struct drbd_transport *transport);
 static void dtt_finish_connect(struct drbd_transport *transport);
 static int dtt_recv(struct drbd_transport *transport, enum drbd_stream stream, void **buf, size_t size, int flags);
-static int dtt_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain, size_t size);
+static int dtt_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size);
 static void dtt_stats(struct drbd_transport *transport, struct drbd_transport_stats *stats);
 static int dtt_net_conf_change(struct drbd_transport *transport, struct net_conf *new_net_conf);
 static void dtt_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream, long timeout);
 static long dtt_get_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream);
 static int dtt_send_page(struct drbd_transport *transport, enum drbd_stream, struct page *page,
-		int offset, size_t size, unsigned msg_flags);
-static int dtt_send_zc_bio(struct drbd_transport *, struct bio *bio);
+		int offset, size_t size, unsigned int msg_flags);
+static int dtt_send_bio(struct drbd_transport *, struct bio *bio, unsigned int msg_flags);
 static bool dtt_stream_ok(struct drbd_transport *transport, enum drbd_stream stream);
 static bool dtt_hint(struct drbd_transport *transport, enum drbd_stream stream, enum drbd_tr_hints hint);
 static void dtt_debugfs_show(struct drbd_transport *transport, struct seq_file *m);
@@ -146,13 +146,13 @@ static struct drbd_transport_class tcp_transport_class = {
 		.connect = dtt_connect,
 		.finish_connect = dtt_finish_connect,
 		.recv = dtt_recv,
-		.recv_pages = dtt_recv_pages,
+		.recv_bio = dtt_recv_bio,
 		.stats = dtt_stats,
 		.net_conf_change = dtt_net_conf_change,
 		.set_rcvtimeo = dtt_set_rcvtimeo,
 		.get_rcvtimeo = dtt_get_rcvtimeo,
 		.send_page = dtt_send_page,
-		.send_zc_bio = dtt_send_zc_bio,
+		.send_bio = dtt_send_bio,
 		.stream_ok = dtt_stream_ok,
 		.hint = dtt_hint,
 		.debugfs_show = dtt_debugfs_show,
@@ -357,7 +357,8 @@ static int dtt_recv(struct drbd_transport *transport, enum drbd_stream stream, v
 	return rv;
 }
 
-static int dtt_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain, size_t size)
+
+static int dtt_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size)
 {
 	struct drbd_tcp_transport *tcp_transport =
 		container_of(transport, struct drbd_tcp_transport, transport);
@@ -368,30 +369,30 @@ static int dtt_recv_pages(struct drbd_transport *transport, struct drbd_page_cha
 	if (!socket)
 		return -ENOTCONN;
 
-	drbd_alloc_page_chain(transport, chain, DIV_ROUND_UP(size, PAGE_SIZE), GFP_TRY);
-	page = chain->head;
-	if (!page)
-		return -ENOMEM;
+	do {
+		size_t len;
+
+		page = drbd_alloc_pages(transport, GFP_KERNEL, size);
+		if (!page)
+			return -ENOMEM;
+		len = min(PAGE_SIZE << compound_order(page), size);
 
-	page_chain_for_each(page) {
-		size_t len = min_t(int, size, PAGE_SIZE);
-		void *data = kmap(page);
-		err = dtt_recv_short(socket, data, len, 0);
-		kunmap(page);
-		set_page_chain_offset(page, 0);
-		set_page_chain_size(page, len);
+		err = dtt_recv_short(socket, page_address(page), len, 0);
 		if (err < 0)
 			goto fail;
 		size -= err;
-	}
+		err = drbd_bio_add_page(transport, bios, page, len, 0);
+		if (err < 0)
+			goto fail;
+	} while (size > 0);
+
 	if (unlikely(size)) {
 		tr_warn(transport, "Not enough data received; missing %zu bytes\n", size);
-		err = -ENODATA;
-		goto fail;
+		return -ENODATA;
 	}
 	return 0;
 fail:
-	drbd_free_page_chain(transport, chain);
+	drbd_free_page(transport, page);
 	return err;
 }
 
@@ -1492,7 +1493,7 @@ static int dtt_send_page(struct drbd_transport *transport, enum drbd_stream stre
 	struct drbd_tcp_transport *tcp_transport =
 		container_of(transport, struct drbd_tcp_transport, transport);
 	struct socket *socket = tcp_transport->stream[stream];
-	struct msghdr msg = { .msg_flags = msg_flags | MSG_NOSIGNAL | MSG_SPLICE_PAGES };
+	struct msghdr msg = { .msg_flags = msg_flags | MSG_NOSIGNAL };
 	struct bio_vec bvec;
 	int len = size;
 	int err = -EIO;
@@ -1537,7 +1538,7 @@ static int dtt_send_page(struct drbd_transport *transport, enum drbd_stream stre
 	return err;
 }
 
-static int dtt_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
+static int dtt_send_bio(struct drbd_transport *transport, struct bio *bio, unsigned int msg_flags)
 {
 	struct bio_vec bvec;
 	struct bvec_iter iter;
@@ -1547,7 +1548,7 @@ static int dtt_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
 
 		err = dtt_send_page(transport, DATA_STREAM, bvec.bv_page,
 				      bvec.bv_offset, bvec.bv_len,
-				      bio_iter_last(bvec, iter) ? 0 : MSG_MORE);
+				      msg_flags | (bio_iter_last(bvec, iter) ? 0 : MSG_MORE));
 		if (err)
 			return err;
 	}
-- 
2.53.0

