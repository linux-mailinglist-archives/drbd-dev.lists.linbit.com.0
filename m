Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHzjI9UIx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:46:45 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 25D5834C1BD
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:46:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CB39163162;
	Fri, 27 Mar 2026 23:46:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1799716312E
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:13 +0100 (CET)
Received: by mail-wm1-f41.google.com with SMTP id
	5b1f17b1804b1-48540d21f7dso29193385e9.0
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651153;
	x=1775255953; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=EO40XGAiJVFy3Bek+iAAHusHuijoNpcbNwlwORwqTQM=;
	b=JpFkZbFz1/57AEWEiSqFQ37oNg2lh4tbPsLJuXYXubyz/TkDA4MbynpiOmgydSX5J7
	p4uTSCBJjRjCDbRDBIJR576kdgwb0ERec+TfVbzhKRgAtR8tOiblVlZOd4wENsvBh2ZY
	qoAMxqJHlxI0dR0AEmeSCkP9/nfxLfbttTljR0uq5nH3qxeba+9f8wYGyaYvHzjd7xNH
	pnsucFnaueADsu9fXIPAoZVshAL9zZ/DjrX/U1tT+rh5nvptRWi8k9rOkpaHcx1sro50
	fsx1tR8x9QtsW7oujAM69k7wyWXGm6TvSHNfOEJjjzflaHtFBPR3bbaRhSBvUbWMfbMZ
	XN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651153; x=1775255953;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=EO40XGAiJVFy3Bek+iAAHusHuijoNpcbNwlwORwqTQM=;
	b=DbkD1x74Jp0L7Ye5ke2L5dVh7vpTp4DHl8lltgifE5k+Yz+izxwW5g8nAOmcf0W3Xv
	FVc2Nob3SgDARRDnbuQk4CXC4MWQiqSTwTS0GJT4TlvKIvyprZwE8xBqHq25Jx1Yy1VE
	68KLmfJiJh3hMcU3TFwvOJHr1LUS5AejWY5ZjJZGC1OMXsNAL6P7tNYnFNd46vXmxyQ9
	OEUOu0/Pv6VtejKKK9VykPuvfi+cCdppkZ5YEc4rEMi8kM4NJ0wmP7OG1jxsQwoaymCo
	N+PpVV95FEm9/OpWr5QXzLiyamhtJ4k5h0H5nmT44L1/Zn+OA9JmS+L1uZ1zyrQYMe3y
	QPpw==
X-Gm-Message-State: AOJu0YxDWPft6L3RBrlypCr67QiDDKs5TGZJYlJgy8YCmDrCN/zwU+Yn
	qVqPzqkKxENbXYhkoX3+ee2tzqKgWQh+l77SDY8f94MUbD7cveA63mB+sBDMZLg+s4EBhoBW2m2
	6JbbPNt8=
X-Gm-Gg: ATEYQzwE3sQypThwHZU+gCOyOYH0fIMAGGLqKTnuxDudpWhI7ytliz51DPnKIuGDBwK
	UCp09yN25Vrz/3lAJOiIsbY6BT09JduNUrDRkzg0AjXH/U0AJgVxKNMd+XwrEgKHag4e2AF2dqB
	18cxBRlmWWlI/Gv2bcWbh8Ws7Nym4zg/fk+0eg+K/KXmgdcqKJB4Xgux1/E3+U/jX6ibRu9MdkE
	/M1b1hCTFwXu9pAb1NSljXsh0ZOnX8eC39j4xgRQFEeo5xqdfDeCqNGsrlaFmtwwc0M3kEUtjUU
	o56ptT+n/wTM8TtcSgTZ17jqvRvcPYcpbUuHYqUKrgboWLlLjksJ/7TrHVOn4d/ZjGxt0Snt3Rh
	BJ8COH8oCaeCZgpuK4ZZFamDpKM2/3pXu2c6hjSNfbDH3n44Ly0EDaVry3JmKXx7ZmI2PKfACT8
	TiFLXAn21+hNGS9xN127rorO+x61P3pewV3Jvsao5KcnLLDspNVg6yYWy8snxKYSuwIlnSA9jcN
	slcjS9KeVsTj5lSFHcZEA==
X-Received: by 2002:a05:600c:6487:b0:485:3d00:efd with SMTP id
	5b1f17b1804b1-48727d679e5mr68489265e9.7.1774651152167; 
	Fri, 27 Mar 2026 15:39:12 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:09 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/20] drbd: replace per-device state model with multi-peer
	data structures
Date: Fri, 27 Mar 2026 23:38:12 +0100
Message-ID: <20260327223820.2244227-13-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 23:46:22 +0100
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	NEURAL_SPAM(0.00)[0.608];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m.bio:url,mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:email,linbit.com:mid]
X-Rspamd-Queue-Id: 25D5834C1BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Overhaul the internal header definitions to support DRBD 9's
multi-peer replication model.
The fundamental shift is that per-peer state (replication progress,
UUIDs, resync bookkeeping) moves from per-device to per-peer-device
scope, and all mutable state is now tracked as a [NOW]/[NEW] pair
on each object to support atomic, cluster-visible state transitions.

Redesign the locking model to match: remove the coarse per-resource
spinlock in favor of a resource-level rwlock for state, a
per-connection lock for peer request lists, and a per-device lock
for interval tree operations.

Replace direct socket members on the connection wth the transport
abstraction.
Move the transfer log with its peer-ack machinery up to the resource
level so that writes can be serialized and acknowledged across all
peers consistently.

Move the state change API to a two-phase commit model at the
resource level, enabling cluster-wide coordinated transitions for
connect, disconnect, role change, and resize operations.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_buildtag.c            |    2 +-
 drivers/block/drbd/drbd_config.h              |   38 +
 drivers/block/drbd/drbd_debugfs.h             |    2 +
 .../block/drbd}/drbd_genl_api.h               |   19 +-
 drivers/block/drbd/drbd_int.h                 | 3278 +++++++++++------
 drivers/block/drbd/drbd_interval.h            |  156 +-
 drivers/block/drbd/drbd_nl.c                  |    2 +-
 drivers/block/drbd/drbd_nla.c                 |    2 +-
 drivers/block/drbd/drbd_nla.h                 |    7 +-
 drivers/block/drbd/drbd_polymorph_printk.h    |  265 +-
 drivers/block/drbd/drbd_req.h                 |  303 +-
 drivers/block/drbd/drbd_state.h               |  298 +-
 drivers/block/drbd/drbd_state_change.h        |   66 +-
 drivers/block/drbd/drbd_strings.h             |   25 +-
 drivers/block/drbd/drbd_transport_lb-tcp.c    |    4 +-
 drivers/block/drbd/drbd_transport_rdma.c      |    4 +-
 drivers/block/drbd/drbd_transport_tcp.c       |    4 +-
 include/linux/drbd.h                          |  190 +-
 include/linux/drbd_config.h                   |   16 -
 include/linux/drbd_genl.h                     |  350 +-
 include/linux/drbd_limits.h                   |  105 +-
 include/linux/genl_magic_func.h               |   50 +-
 22 files changed, 3361 insertions(+), 1825 deletions(-)
 create mode 100644 drivers/block/drbd/drbd_config.h
 rename {include/linux => drivers/block/drbd}/drbd_genl_api.h (68%)
 delete mode 100644 include/linux/drbd_config.h

diff --git a/drivers/block/drbd/drbd_buildtag.c b/drivers/block/drbd/drbd_buildtag.c
index cb1aa66d7d5d..812f78070a0b 100644
--- a/drivers/block/drbd/drbd_buildtag.c
+++ b/drivers/block/drbd/drbd_buildtag.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <linux/drbd_config.h>
 #include <linux/module.h>
+#include "drbd_config.h"
 
 const char *drbd_buildtag(void)
 {
diff --git a/drivers/block/drbd/drbd_config.h b/drivers/block/drbd/drbd_config.h
new file mode 100644
index 000000000000..62fc91dc529a
--- /dev/null
+++ b/drivers/block/drbd/drbd_config.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+  drbd_config.h
+  DRBD's compile time configuration.
+*/
+
+#ifndef DRBD_CONFIG_H
+#define DRBD_CONFIG_H
+
+#include "drbd_protocol.h"
+
+const char *drbd_buildtag(void);
+
+#define REL_VERSION "9.3.0"
+#define PRO_VERSION_MIN 118 /* 9.0.26 */
+#define PRO_VERSION_MAX 124
+#define PRO_FEATURES (DRBD_FF_TRIM | DRBD_FF_THIN_RESYNC | DRBD_FF_WSAME | DRBD_FF_WZEROES | \
+		      DRBD_FF_RESYNC_DAGTAG | \
+		      DRBD_FF_2PC_V2 | DRBD_FF_RS_SKIP_UUID | \
+		      DRBD_FF_RESYNC_WITHOUT_REPLICATION)
+
+#define PRO_VERSION_8_MIN 86
+#define PRO_VERSION_8_MAX 101
+
+/* We support two ranges of DRBD protocol version:
+ *  86-101: accepted DRBD 8 protocol versions as "rolling upgrade" path
+ * 102-109: never defined
+ * 110-117: _rejected_ because of bugs in the backward compat path
+ *	in more recent DRBD versions.  That is 9.0.0 to 9.0.25 inclusive.
+ *	"Rolling" upgrade path for those versions:
+ *	first upgrade to 9.0.latest, then connect to 9.1/9.2 or later.
+ * 118-PRO_VERSION_MAX: accepted DRBD 9 protocol versions.
+ *
+ * Note that we also reject connections with protocol version 121 and feature
+ * DRBD_FF_RESYNC_DAGTAG.
+ */
+
+#endif
diff --git a/drivers/block/drbd/drbd_debugfs.h b/drivers/block/drbd/drbd_debugfs.h
index ee3d66eb40c6..37037b196e4a 100644
--- a/drivers/block/drbd/drbd_debugfs.h
+++ b/drivers/block/drbd/drbd_debugfs.h
@@ -11,6 +11,7 @@ void drbd_debugfs_cleanup(void);
 
 void drbd_debugfs_resource_add(struct drbd_resource *resource);
 void drbd_debugfs_resource_cleanup(struct drbd_resource *resource);
+void drbd_debugfs_resource_rename(struct drbd_resource *resource, const char *new_name);
 
 void drbd_debugfs_connection_add(struct drbd_connection *connection);
 void drbd_debugfs_connection_cleanup(struct drbd_connection *connection);
@@ -27,6 +28,7 @@ static inline void drbd_debugfs_cleanup(void) { }
 
 static inline void drbd_debugfs_resource_add(struct drbd_resource *resource) { }
 static inline void drbd_debugfs_resource_cleanup(struct drbd_resource *resource) { }
+static inline void drbd_debugfs_resource_rename(struct drbd_resource *resource, const char *new_name) { }
 
 static inline void drbd_debugfs_connection_add(struct drbd_connection *connection) { }
 static inline void drbd_debugfs_connection_cleanup(struct drbd_connection *connection) { }
diff --git a/include/linux/drbd_genl_api.h b/drivers/block/drbd/drbd_genl_api.h
similarity index 68%
rename from include/linux/drbd_genl_api.h
rename to drivers/block/drbd/drbd_genl_api.h
index 70682c058027..7096b9c4f6dc 100644
--- a/include/linux/drbd_genl_api.h
+++ b/drivers/block/drbd/drbd_genl_api.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef DRBD_GENL_STRUCT_H
 #define DRBD_GENL_STRUCT_H
 
@@ -13,12 +13,6 @@
  *     is used instead.
  * @flags: possible operation modifiers (relevant only for user->kernel):
  *     DRBD_GENL_F_SET_DEFAULTS
- * @volume:
- *     When creating a new minor (adding it to a resource), the resource needs
- *     to know which volume number within the resource this is supposed to be.
- *     The volume number corresponds to the same volume number on the remote side,
- *     whereas the minor number on the remote side may be different
- *     (union with flags).
  * @ret_code: kernel->userland unicast cfg reply return code (union with flags);
  */
 struct drbd_genlmsghdr {
@@ -34,20 +28,13 @@ enum {
 	DRBD_GENL_F_SET_DEFAULTS = 1,
 };
 
-enum drbd_state_info_bcast_reason {
-	SIB_GET_STATUS_REPLY = 1,
-	SIB_STATE_CHANGE = 2,
-	SIB_HELPER_PRE = 3,
-	SIB_HELPER_POST = 4,
-	SIB_SYNC_PROGRESS = 5,
-};
-
 /* hack around predefined gcc/cpp "linux=1",
  * we cannot possibly include <1/drbd_genl.h> */
 #undef linux
 
 #include <linux/drbd.h>
-#define GENL_MAGIC_VERSION	1
+#include "drbd_config.h"
+#define GENL_MAGIC_VERSION	2
 #define GENL_MAGIC_FAMILY	drbd
 #define GENL_MAGIC_FAMILY_HDRSZ	sizeof(struct drbd_genlmsghdr)
 #define GENL_MAGIC_INCLUDE_FILE <linux/drbd_genl.h>
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index f6d6276974ee..b7dc630cf784 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -18,55 +18,101 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include <linux/list.h>
+#include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
 #include <linux/ratelimit.h>
-#include <linux/tcp.h>
 #include <linux/mutex.h>
 #include <linux/major.h>
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
 #include <linux/idr.h>
-#include <linux/dynamic_debug.h>
-#include <net/tcp.h>
 #include <linux/lru_cache.h>
 #include <linux/prefetch.h>
-#include <linux/drbd_genl_api.h>
+#include "drbd_genl_api.h"
 #include <linux/drbd.h>
-#include <linux/drbd_config.h>
+
+#include "drbd_config.h"
 #include "drbd_strings.h"
 #include "drbd_state.h"
+#include "drbd_state_change.h"
 #include "drbd_protocol.h"
+#include "drbd_transport.h"
 #include "drbd_polymorph_printk.h"
 
-/* shared module parameters, defined in drbd_main.c */
+/* module parameter, defined in drbd_main.c */
+extern unsigned int drbd_minor_count;
+extern unsigned int drbd_protocol_version_min;
+extern bool drbd_strict_names;
+
+static inline bool drbd_protocol_version_acceptable(unsigned int pv)
+{
+	return	/* DRBD 9 */ (pv >= PRO_VERSION_MIN && pv <= PRO_VERSION_MAX) ||
+		/* DRBD 8 */ (pv >= PRO_VERSION_8_MIN && pv <= PRO_VERSION_8_MAX);
+}
+
 #ifdef CONFIG_DRBD_FAULT_INJECTION
 extern int drbd_enable_faults;
 extern int drbd_fault_rate;
 #endif
 
-extern unsigned int drbd_minor_count;
 extern char drbd_usermode_helper[];
-extern int drbd_proc_details;
+enum {
+	/* drbd_khelper returns >= 0, we can use negative values as flags for drbd_maybe_khelper */
+	DRBD_UMH_DISABLED = INT_MIN,
+};
 
+#ifndef DRBD_MAJOR
+# define DRBD_MAJOR 147
+#endif
 
 /* This is used to stop/restart our threads.
  * Cannot use SIGTERM nor SIGKILL, since these
  * are sent out by init on runlevel changes
  * I choose SIGHUP for now.
+ *
+ * FIXME btw, we should register some reboot notifier.
  */
 #define DRBD_SIGKILL SIGHUP
 
+/* For compatibility with protocol < 122 */
+#define ID_SKIP         (4710ULL)
 #define ID_IN_SYNC      (4711ULL)
 #define ID_OUT_OF_SYNC  (4712ULL)
 #define ID_SYNCER (-1ULL)
 
+static inline enum ov_result drbd_block_id_to_ov_result(u64 block_id)
+{
+	switch (block_id) {
+	case ID_IN_SYNC:
+		return OV_RESULT_IN_SYNC;
+	case ID_OUT_OF_SYNC:
+		return OV_RESULT_OUT_OF_SYNC;
+	default:
+		return OV_RESULT_SKIP;
+	}
+}
+
+static inline u64 drbd_ov_result_to_block_id(enum ov_result result)
+{
+	switch (result) {
+	case OV_RESULT_IN_SYNC:
+		return ID_IN_SYNC;
+	case OV_RESULT_OUT_OF_SYNC:
+		return ID_OUT_OF_SYNC;
+	default:
+		return ID_SKIP;
+	}
+}
+
 #define UUID_NEW_BM_OFFSET ((u64)0x0001000000000000ULL)
 
 struct drbd_device;
 struct drbd_connection;
-struct drbd_peer_device;
+
+/* I want to be able to grep for "drbd $resource_name"
+ * and get all relevant log lines. */
 
 /* Defines to control fault insertion */
 enum {
@@ -80,11 +126,12 @@ enum {
 	DRBD_FAULT_BM_ALLOC = 7,	/* bitmap allocation */
 	DRBD_FAULT_AL_EE = 8,	/* alloc ee */
 	DRBD_FAULT_RECEIVE = 9, /* Changes some bytes upon receiving a [rs]data block */
+	DRBD_FAULT_BIO_TOO_SMALL = 10, /* Allocate smaller bios to trigger bio chaining */
 
 	DRBD_FAULT_MAX,
 };
 
-extern unsigned int
+unsigned int
 _drbd_insert_fault(struct drbd_device *device, unsigned int type);
 
 static inline int
@@ -98,28 +145,31 @@ drbd_insert_fault(struct drbd_device *device, unsigned int type) {
 #endif
 }
 
-/* integer division, round _UP_ to the next integer */
-#define div_ceil(A, B) ((A)/(B) + ((A)%(B) ? 1 : 0))
-/* usual integer division */
-#define div_floor(A, B) ((A)/(B))
-
-extern struct ratelimit_state drbd_ratelimit_state;
-extern struct idr drbd_devices; /* RCU, updates: genl_lock() */
-extern struct list_head drbd_resources; /* RCU, updates: genl_lock() */
+/*
+ * our structs
+ *************************/
 
-extern const char *cmdname(enum drbd_packet cmd);
+extern struct idr drbd_devices; /* RCU, updates: drbd_devices_lock */
+extern struct list_head drbd_resources; /* RCU, updates: resources_mutex */
+extern struct mutex resources_mutex;
 
 /* for sending/receiving the bitmap,
- * possibly in some encoding scheme */
+ * possibly in some encoding scheme.
+ * For compatibility, we transfer as if bm_block_size was 4k.
+ */
 struct bm_xfer_ctx {
 	/* "const"
 	 * stores total bits and long words
 	 * of the bitmap, so we don't need to
 	 * call the accessor functions over and again. */
+	unsigned long bm_bits_4k; /* unused on sending side */
 	unsigned long bm_bits;
 	unsigned long bm_words;
+	unsigned int scale; /* against BM_BLOCK_SHIFT_4k */
 	/* during xfer, current position within the bitmap */
 	unsigned long bit_offset;
+	/* receiving "partial" bits; unused on sending side. */
+	unsigned long bit_offset_4k;
 	unsigned long word_offset;
 
 	/* statistics; index: (h->command == P_BITMAP) */
@@ -127,8 +177,8 @@ struct bm_xfer_ctx {
 	unsigned bytes[2];
 };
 
-extern void INFO_bm_xfer_stats(struct drbd_peer_device *peer_device,
-			       const char *direction, struct bm_xfer_ctx *c);
+void INFO_bm_xfer_stats(struct drbd_peer_device *peer_device,
+			const char *direction, struct bm_xfer_ctx *c);
 
 static inline void bm_xfer_ctx_bit_to_word_offset(struct bm_xfer_ctx *c)
 {
@@ -149,7 +199,7 @@ static inline void bm_xfer_ctx_bit_to_word_offset(struct bm_xfer_ctx *c)
 #endif
 }
 
-extern unsigned int drbd_header_size(struct drbd_connection *connection);
+unsigned int drbd_header_size(struct drbd_connection *connection);
 
 /**********************************************************************/
 enum drbd_thread_state {
@@ -164,7 +214,7 @@ struct drbd_thread {
 	struct task_struct *task;
 	struct completion stop;
 	enum drbd_thread_state t_state;
-	int (*function) (struct drbd_thread *);
+	int (*function)(struct drbd_thread *thi);
 	struct drbd_resource *resource;
 	struct drbd_connection *connection;
 	int reset_cpu_mask;
@@ -183,31 +233,61 @@ static inline enum drbd_thread_state get_t_state(struct drbd_thread *thi)
 
 struct drbd_work {
 	struct list_head list;
-	int (*cb)(struct drbd_work *, int cancel);
+	int (*cb)(struct drbd_work *w, int cancel);
 };
 
-struct drbd_device_work {
+struct drbd_peer_device_work {
 	struct drbd_work w;
-	struct drbd_device *device;
+	struct drbd_peer_device *peer_device;
 };
 
-#include "drbd_interval.h"
-
-extern int drbd_wait_misc(struct drbd_device *, struct drbd_interval *);
+enum drbd_stream;
 
-extern void lock_all_resources(void);
-extern void unlock_all_resources(void);
+#include "drbd_interval.h"
 
+void lock_all_resources(void);
+void unlock_all_resources(void);
+
+enum drbd_disk_state disk_state_from_md(struct drbd_device *device);
+bool want_bitmap(struct drbd_peer_device *peer_device);
+long twopc_timeout(struct drbd_resource *resource);
+long twopc_retry_timeout(struct drbd_resource *resource, int retries);
+void twopc_connection_down(struct drbd_connection *connection);
+u64 directly_connected_nodes(struct drbd_resource *resource,
+			     enum which_state which);
+
+/* sequence arithmetic for dagtag (data generation tag) sector numbers.
+ * dagtag_newer_eq: true, if a is newer than b */
+#define dagtag_newer_eq(a, b)      \
+	(typecheck(u64, a) && \
+	 typecheck(u64, b) && \
+	((s64)(a) - (s64)(b) >= 0))
+
+#define dagtag_newer(a, b)      \
+	(typecheck(u64, a) && \
+	 typecheck(u64, b) && \
+	((s64)(a) - (s64)(b) > 0))
+
+/* An application I/O request.
+ *
+ * Fields marked as "immutable" may only be modified when the request is
+ * exclusively owned, e.g. when the request is created or is being retried.
+ */
 struct drbd_request {
-	struct drbd_work w;
+	/* "immutable" */
 	struct drbd_device *device;
 
 	/* if local IO is not allowed, will be NULL.
 	 * if local IO _is_ allowed, holds the locally submitted bio clone,
 	 * or, after local IO completion, the ERR_PTR(error).
-	 * see drbd_request_endio(). */
+	 * see drbd_request_endio().
+	 *
+	 * Only accessed by app/submitter/endio - strictly sequential,
+	 * no serialization required. */
 	struct bio *private_bio;
 
+	/* Fields sector and size are "immutable". Other fields protected
+	 * by interval_lock. */
 	struct drbd_interval i;
 
 	/* epoch: used to check on "completion" whether this req was in
@@ -217,96 +297,152 @@ struct drbd_request {
 	 * This corresponds to "barrier" in struct p_barrier[_ack],
 	 * and to "barrier_nr" in struct drbd_epoch (and various
 	 * comments/function parameters/local variable names).
+	 *
+	 * "immutable"
 	 */
 	unsigned int epoch;
 
-	struct list_head tl_requests; /* ring list in the transfer log */
-	struct bio *master_bio;       /* master bio pointer */
+	/* Position of this request in the serialized per-resource change
+	 * stream. Can be used to serialize with other events when
+	 * communicating the change stream via multiple connections.
+	 * Assigned from device->resource->dagtag_sector.
+	 *
+	 * Given that some IO backends write several GB per second meanwhile,
+	 * lets just use a 64bit sequence space.
+	 *
+	 * "immutable"
+	 */
+	u64 dagtag_sector;
+
+	/* list entry in transfer log (protected by RCU) */
+	struct list_head tl_requests;
+
+	/* list entry in submitter lists, peer ack list, or retry lists;
+	 * protected by the locks for those lists */
+	struct list_head list;
+
+	/* master bio pointer; "immutable" */
+	struct bio *master_bio;
 
 	/* see struct drbd_device */
 	struct list_head req_pending_master_completion;
 	struct list_head req_pending_local;
 
-	/* for generic IO accounting */
+	/* for generic IO accounting; "immutable" */
 	unsigned long start_jif;
 
-	/* for DRBD internal statistics */
+	/* for request_timer_fn() */
+	unsigned long pre_submit_jif;
+	unsigned long pre_send_jif[DRBD_PEERS_MAX];
 
-	/* Minimal set of time stamps to determine if we wait for activity log
-	 * transactions, local disk or peer.  32 bit "jiffies" are good enough,
-	 * we don't expect a DRBD request to be stalled for several month.
-	 */
+#ifdef CONFIG_DRBD_TIMING_STATS
+	/* for DRBD internal statistics */
+	ktime_t start_kt;
 
 	/* before actual request processing */
-	unsigned long in_actlog_jif;
+	ktime_t in_actlog_kt;
 
 	/* local disk */
-	unsigned long pre_submit_jif;
+	ktime_t pre_submit_kt;
 
 	/* per connection */
-	unsigned long pre_send_jif;
-	unsigned long acked_jif;
-	unsigned long net_done_jif;
-
+	ktime_t pre_send_kt[DRBD_PEERS_MAX];
+	ktime_t acked_kt[DRBD_PEERS_MAX];
+	ktime_t net_done_kt[DRBD_PEERS_MAX];
+#endif
 	/* Possibly even more detail to track each phase:
-	 *  master_completion_jif
+	 *  master_completion_kt
 	 *      how long did it take to complete the master bio
 	 *      (application visible latency)
-	 *  allocated_jif
+	 *  allocated_kt
 	 *      how long the master bio was blocked until we finally allocated
 	 *      a tracking struct
-	 *  in_actlog_jif
+	 *  in_actlog_kt
 	 *      how long did we wait for activity log transactions
 	 *
-	 *  net_queued_jif
+	 *  net_queued_kt
 	 *      when did we finally queue it for sending
-	 *  pre_send_jif
+	 *  pre_send_kt
 	 *      when did we start sending it
-	 *  post_send_jif
+	 *  post_send_kt
 	 *      how long did we block in the network stack trying to send it
-	 *  acked_jif
+	 *  acked_kt
 	 *      when did we receive (or fake, in protocol A) a remote ACK
-	 *  net_done_jif
+	 *  net_done_kt
 	 *      when did we receive final acknowledgement (P_BARRIER_ACK),
 	 *      or decide, e.g. on connection loss, that we do no longer expect
 	 *      anything from this peer for this request.
 	 *
-	 *  pre_submit_jif
-	 *  post_sub_jif
+	 *  pre_submit_kt
+	 *  post_sub_kt
 	 *      when did we start submiting to the lower level device,
 	 *      and how long did we block in that submit function
-	 *  local_completion_jif
+	 *  local_completion_kt
 	 *      how long did it take the lower level device to complete this request
 	 */
 
 
 	/* once it hits 0, we may complete the master_bio */
 	atomic_t completion_ref;
+	/* once it hits 0, we may remove the request from the interval tree and activity log */
+	refcount_t done_ref;
+	/* once it hits 0, we may remove from transfer log and send a corresponding peer ack */
+	refcount_t oos_send_ref;
 	/* once it hits 0, we may destroy this drbd_request object */
 	struct kref kref;
 
-	unsigned rq_state; /* see comments above _req_mod() */
+	/* Creates a dependency chain between writes so that we know that a
+	 * peer ack can be sent when done_ref reaches zero.
+	 *
+	 * If not NULL, when this drbd_request is done, one done_ref reference
+	 * of ->done_next will be put.
+	 *
+	 * "immutable" */
+	struct drbd_request *next_write;
+
+	/* lock to protect state flags */
+	spinlock_t rq_lock;
+	unsigned int local_rq_state;
+	u16 net_rq_state[DRBD_NODE_ID_MAX];
+
+	/* for reclaim from transfer log */
+	struct rcu_head rcu;
+};
+
+/* Used to multicast peer acks. */
+struct drbd_peer_ack {
+	struct drbd_resource *resource;
+	struct list_head list;
+	/*
+	 * Keeps track of which connections have not yet processed this peer
+	 * ack. Peer acks are queued for connections on which they are not sent
+	 * so that last_peer_ack_dagtag_seen is updated at the correct moment.
+	 */
+	u64 queued_mask;
+	u64 pending_mask; /* Peer ack is sent to these nodes */
+	u64 mask; /* Nodes which successfully wrote the requests covered by this peer ack */
+	u64 dagtag_sector;
 };
 
+/* Tracks received writes grouped in epochs. Protected by epoch_lock. */
 struct drbd_epoch {
 	struct drbd_connection *connection;
+	struct drbd_peer_request *oldest_unconfirmed_peer_req;
 	struct list_head list;
 	unsigned int barrier_nr;
 	atomic_t epoch_size; /* increased on every request added. */
 	atomic_t active;     /* increased on every req. added, and dec on every finished. */
+	atomic_t confirmed;  /* adjusted for every P_CONFIRM_STABLE */
 	unsigned long flags;
 };
 
 /* drbd_epoch flag bits */
 enum {
+	DE_BARRIER_IN_NEXT_EPOCH_ISSUED,
+	DE_BARRIER_IN_NEXT_EPOCH_DONE,
+	DE_CONTAINS_A_BARRIER,
 	DE_HAVE_BARRIER_NUMBER,
-};
-
-enum epoch_event {
-	EV_PUT,
-	EV_GOT_BARRIER_NR,
-	EV_BECAME_LAST,
-	EV_CLEANUP = 32, /* used as flag */
+	DE_IS_FINISHING,
 };
 
 struct digest_info {
@@ -317,23 +453,36 @@ struct digest_info {
 struct drbd_peer_request {
 	struct drbd_work w;
 	struct drbd_peer_device *peer_device;
-	struct drbd_epoch *epoch; /* for writes */
-	struct page *pages;
-	blk_opf_t opf;
+	struct list_head recv_order; /* see peer_requests, peer_reads, resync_requests */
+
+	union {
+		struct { /* read requests */
+			unsigned int depend_dagtag_node_id;
+			u64 depend_dagtag;
+		};
+		struct { /* resync target requests */
+			unsigned int requested_size;
+		};
+	};
+
+	struct bio_list bios;
 	atomic_t pending_bios;
 	struct drbd_interval i;
-	/* see comments on ee flag bits below */
-	unsigned long flags;
-	unsigned long submit_jif;
+	unsigned long flags;	/* see comments on ee flag bits below */
 	union {
-		u64 block_id;
-		struct digest_info *digest;
+		struct { /* regular peer_request */
+			struct drbd_epoch *epoch; /* for writes */
+			unsigned long submit_jif;
+			u64 block_id;
+			struct digest_info *digest;
+			u64 dagtag_sector;
+		};
+		struct { /* reused object for sending OOS to other nodes */
+			u64 send_oos_pending;
+		};
 	};
 };
 
-/* Equivalent to bio_op and req_op. */
-#define peer_req_op(peer_req) \
-	((peer_req)->opf & REQ_OP_MASK)
 
 /* ee flag bits.
  * While corresponding bios are in flight, the only modification will be
@@ -342,9 +491,19 @@ struct drbd_peer_request {
  * non-atomic modification to ee->flags is ok.
  */
 enum {
-	__EE_CALL_AL_COMPLETE_IO,
+	/* If successfully written,
+	 * we may clear the corresponding out-of-sync bits */
 	__EE_MAY_SET_IN_SYNC,
 
+	/* Peer did not write this one, we must set-out-of-sync
+	 * before actually submitting ourselves */
+	__EE_SET_OUT_OF_SYNC,
+
+	/* This peer request closes an epoch using a barrier.
+	 * On successful completion, the epoch is released,
+	 * and the P_BARRIER_ACK send. */
+	__EE_IS_BARRIER,
+
 	/* is this a TRIM aka REQ_OP_DISCARD? */
 	__EE_TRIM,
 	/* explicit zero-out requested, or
@@ -364,125 +523,201 @@ enum {
 	/* This ee has a pointer to a digest instead of a block id */
 	__EE_HAS_DIGEST,
 
-	/* Conflicting local requests need to be restarted after this request */
-	__EE_RESTART_REQUESTS,
-
 	/* The peer wants a write ACK for this (wire proto C) */
 	__EE_SEND_WRITE_ACK,
 
-	/* Is set when net_conf had two_primaries set while creating this peer_req */
-	__EE_IN_INTERVAL_TREE,
-
-	/* for debugfs: */
-	/* has this been submitted, or does it still wait for something else? */
-	__EE_SUBMITTED,
-
-	/* this is/was a write request */
-	__EE_WRITE,
-
 	/* hand back using mempool_free(e, drbd_buffer_page_pool) */
 	__EE_RELEASE_TO_MEMPOOL,
 
 	/* this is/was a write same request */
 	__EE_WRITE_SAME,
 
-	/* this originates from application on peer
-	 * (not some resync or verify or other DRBD internal request) */
-	__EE_APPLICATION,
-
-	/* If it contains only 0 bytes, send back P_RS_DEALLOCATED */
+	/* On target: Send P_RS_THIN_REQ.
+	 * On source: If it contains only 0 bytes, send back P_RS_DEALLOCATED. */
 	__EE_RS_THIN_REQ,
+
+	/* Hold reference in activity log */
+	__EE_IN_ACTLOG,
+
+	/* SyncTarget: This is the last resync request. */
+	__EE_LAST_RESYNC_REQUEST,
+
+	/* This peer_req->recv_order is on some list */
+	__EE_ON_RECV_ORDER,
 };
-#define EE_CALL_AL_COMPLETE_IO (1<<__EE_CALL_AL_COMPLETE_IO)
 #define EE_MAY_SET_IN_SYNC     (1<<__EE_MAY_SET_IN_SYNC)
+#define EE_SET_OUT_OF_SYNC     (1<<__EE_SET_OUT_OF_SYNC)
+#define EE_IS_BARRIER          (1<<__EE_IS_BARRIER)
 #define EE_TRIM                (1<<__EE_TRIM)
 #define EE_ZEROOUT             (1<<__EE_ZEROOUT)
 #define EE_RESUBMITTED         (1<<__EE_RESUBMITTED)
 #define EE_WAS_ERROR           (1<<__EE_WAS_ERROR)
 #define EE_HAS_DIGEST          (1<<__EE_HAS_DIGEST)
-#define EE_RESTART_REQUESTS	(1<<__EE_RESTART_REQUESTS)
 #define EE_SEND_WRITE_ACK	(1<<__EE_SEND_WRITE_ACK)
-#define EE_IN_INTERVAL_TREE	(1<<__EE_IN_INTERVAL_TREE)
-#define EE_SUBMITTED		(1<<__EE_SUBMITTED)
-#define EE_WRITE		(1<<__EE_WRITE)
 #define EE_RELEASE_TO_MEMPOOL	(1<<__EE_RELEASE_TO_MEMPOOL)
 #define EE_WRITE_SAME		(1<<__EE_WRITE_SAME)
-#define EE_APPLICATION		(1<<__EE_APPLICATION)
 #define EE_RS_THIN_REQ		(1<<__EE_RS_THIN_REQ)
+#define EE_IN_ACTLOG		(1<<__EE_IN_ACTLOG)
+#define EE_LAST_RESYNC_REQUEST	(1<<__EE_LAST_RESYNC_REQUEST)
+#define EE_ON_RECV_ORDER	(1<<__EE_ON_RECV_ORDER)
+
+#define REQ_NO_BIO (REQ_OP_DRV_OUT) /* exception for drbd_alloc_peer_request(), DRBD private */
 
 /* flag bits per device */
-enum {
-	UNPLUG_REMOTE,		/* sending a "UnplugRemote" could help */
+enum device_flag {
 	MD_DIRTY,		/* current uuids and flags not yet on disk */
-	USE_DEGR_WFC_T,		/* degr-wfc-timeout instead of wfc-timeout. */
-	CL_ST_CHG_SUCCESS,
-	CL_ST_CHG_FAIL,
 	CRASHED_PRIMARY,	/* This node was a crashed primary.
 				 * Gets cleared when the state.conn
-				 * goes into C_CONNECTED state. */
-	CONSIDER_RESYNC,
-
-	MD_NO_FUA,		/* Users wants us to not use FUA/FLUSH on meta data dev */
-
-	BITMAP_IO,		/* suspend application io;
-				   once no more io in flight, start bitmap io */
-	BITMAP_IO_QUEUED,       /* Started bitmap IO */
-	WAS_IO_ERROR,		/* Local disk failed, returned IO error */
-	WAS_READ_ERROR,		/* Local disk READ failed (set additionally to the above) */
+				 * goes into L_ESTABLISHED state. */
+	MD_NO_FUA,		/* meta data device does not support barriers,
+				   so don't even try */
 	FORCE_DETACH,		/* Force-detach from local disk, aborting any pending local IO */
-	RESYNC_AFTER_NEG,       /* Resync after online grow after the attach&negotiate finished. */
-	RESIZE_PENDING,		/* Size change detected locally, waiting for the response from
-				 * the peer, if it changed there as well. */
-	NEW_CUR_UUID,		/* Create new current UUID when thawing IO */
+	ABORT_MDIO,		/* Interrupt ongoing meta-data I/O */
+	NEW_CUR_UUID,		/* Create new current UUID when thawing IO or issuing local IO */
+	__NEW_CUR_UUID,		/* Set NEW_CUR_UUID as soon as state change visible */
+	WRITING_NEW_CUR_UUID,	/* Set while the new current ID gets generated. */
 	AL_SUSPENDED,		/* Activity logging is currently suspended. */
-	AHEAD_TO_SYNC_SOURCE,   /* Ahead -> SyncSource queued */
-	B_RS_H_DONE,		/* Before resync handler done (already executed) */
-	DISCARD_MY_DATA,	/* discard_my_data flag per volume */
-	READ_BALANCE_RR,
-
+	UNREGISTERED,
 	FLUSH_PENDING,		/* if set, device->flush_jif is when we submitted that flush
 				 * from drbd_flush_after_epoch() */
 
 	/* cleared only after backing device related structures have been destroyed. */
-	GOING_DISKLESS,		/* Disk is being detached, because of io-error, or admin request. */
+	GOING_DISKLESS,         /* Disk is being detached, because of io-error, or admin request. */
 
 	/* to be used in drbd_device_post_work() */
-	GO_DISKLESS,		/* tell worker to schedule cleanup before detach */
-	DESTROY_DISK,		/* tell worker to close backing devices and destroy related structures. */
+	GO_DISKLESS,            /* tell worker to schedule cleanup before detach */
 	MD_SYNC,		/* tell worker to call drbd_md_sync() */
+	MAKE_NEW_CUR_UUID,	/* tell worker to ping peers and eventually write new current uuid */
+
+	STABLE_RESYNC,		/* One peer_device finished the resync stable! */
+	READ_BALANCE_RR,
+	PRIMARY_LOST_QUORUM,
+	TIEBREAKER_QUORUM,	/* Tiebreaker keeps quorum; used to avoid too verbose logging */
+	DESTROYING_DEV,
+	TRY_TO_GET_RESYNC,
+	OUTDATE_ON_2PC_COMMIT,
+	RESTORE_QUORUM,		/* Restore quorum when we have the same members as before */
+	RESTORING_QUORUM,	/* sanitize_state() -> finish_state_change() */
+	LEGACY_84_MD,
+	BDEV_FROZEN,		/* called bdev_freeze(), needs bdev_thaw() on resume-io */
+};
+
+/* flag bits per peer device */
+enum peer_device_flag {
+	CONSIDER_RESYNC,
+	RESYNC_AFTER_NEG,       /* Resync after online grow after the attach&negotiate finished. */
+	RESIZE_PENDING,		/* Size change detected locally, waiting for the response from
+				 * the peer, if it changed there as well. */
 	RS_START,		/* tell worker to start resync/OV */
 	RS_PROGRESS,		/* tell worker that resync made significant progress */
+	RS_LAZY_BM_WRITE,	/*  -"- and bitmap writeout should be efficient now */
 	RS_DONE,		/* tell worker that resync is done */
+	B_RS_H_DONE,		/* Before resync handler done (already executed) */
+	DISCARD_MY_DATA,	/* discard_my_data flag per volume */
+	USE_DEGR_WFC_T,		/* degr-wfc-timeout instead of wfc-timeout. */
+	INITIAL_STATE_SENT,
+	INITIAL_STATE_RECEIVED,
+	RECONCILIATION_RESYNC,
+	UNSTABLE_RESYNC,	/* Sync source went unstable during resync. */
+	SEND_STATE_AFTER_AHEAD,
+	GOT_NEG_ACK,		/* got a neg_ack while primary, wait until peer_disk is lower than
+				   D_UP_TO_DATE before becoming secondary! */
+	AHEAD_TO_SYNC_SOURCE,   /* Ahead -> SyncSource queued */
+	SYNC_TARGET_TO_BEHIND,  /* SyncTarget, wait for Behind */
+	HANDLING_CONGESTION,    /* Set while testing for congestion and handling it */
+	HANDLE_CONGESTION,      /* tell worker to change state due to congestion */
+	HOLDING_UUID_READ_LOCK, /* did a down_read(&device->uuid_sem) */
+	RS_SOURCE_MISSED_END,   /* SyncSource did not got P_UUIDS110 */
+	RS_PEER_MISSED_END,     /* Peer (which was SyncSource) did not got P_UUIDS110 after resync */
+	SYNC_SRC_CRASHED_PRI,   /* Source of this resync was a crashed primary */
+	HAVE_SIZES,		/* Cleared when connection gets lost; set when sizes received */
+	UUIDS_RECEIVED,		/* Have recent UUIDs from the peer */
+	CURRENT_UUID_RECEIVED,	/* Got a p_current_uuid packet */
+	PEER_QUORATE,		/* Peer has quorum */
+	RS_REQUEST_UNSUCCESSFUL, /* Some resync request was unsuccessful in current cycle */
+	REPLICATION_NEXT, /* If unset, do not replicate writes when next Inconsistent */
+	PEER_REPLICATION_NEXT, /* We have instructed peer not to replicate writes */
 };
 
-struct drbd_bitmap; /* opaque for drbd_device */
+/* We could make these currently hardcoded constants configurable
+ * variables at create-md time (or even re-configurable at runtime?).
+ * Which will require some more changes to the DRBD "super block"
+ * and attach code.
+ *
+ * updates per transaction:
+ *   This many changes to the active set can be logged with one transaction.
+ *   This number is arbitrary.
+ * context per transaction:
+ *   This many context extent numbers are logged with each transaction.
+ *   This number is resulting from the transaction block size (4k), the layout
+ *   of the transaction header, and the number of updates per transaction.
+ *   See drbd_actlog.c:struct al_transaction_on_disk
+ * */
+#define AL_UPDATES_PER_TRANSACTION	 64	// arbitrary
+#define AL_CONTEXT_PER_TRANSACTION	919	// (4096 - 36 - 6*64)/4
 
 /* definition of bits in bm_flags to be used in drbd_bm_lock
  * and drbd_bitmap_io and friends. */
 enum bm_flag {
-	/* currently locked for bulk operation */
-	BM_LOCKED_MASK = 0xf,
-
-	/* in detail, that is: */
-	BM_DONT_CLEAR = 0x1,
-	BM_DONT_SET   = 0x2,
-	BM_DONT_TEST  = 0x4,
+	/*
+	 * The bitmap can be locked to prevent others from clearing, setting,
+	 * and/or testing bits.  The following combinations of lock flags make
+	 * sense:
+	 *
+	 *   BM_LOCK_CLEAR,
+	 *   BM_LOCK_SET, | BM_LOCK_CLEAR,
+	 *   BM_LOCK_TEST | BM_LOCK_SET | BM_LOCK_CLEAR.
+	 */
 
-	/* so we can mark it locked for bulk operation,
-	 * and still allow all non-bulk operations */
-	BM_IS_LOCKED  = 0x8,
+	BM_LOCK_TEST = 0x1,
+	BM_LOCK_SET = 0x2,
+	BM_LOCK_CLEAR = 0x4,
+	BM_LOCK_BULK = 0x8, /* locked for bulk operation, allow all non-bulk operations */
 
-	/* (test bit, count bit) allowed (common case) */
-	BM_LOCKED_TEST_ALLOWED = BM_DONT_CLEAR | BM_DONT_SET | BM_IS_LOCKED,
+	BM_LOCK_ALL = BM_LOCK_TEST | BM_LOCK_SET | BM_LOCK_CLEAR | BM_LOCK_BULK,
 
-	/* testing bits, as well as setting new bits allowed, but clearing bits
-	 * would be unexpected.  Used during bitmap receive.  Setting new bits
-	 * requires sending of "out-of-sync" information, though. */
-	BM_LOCKED_SET_ALLOWED = BM_DONT_CLEAR | BM_IS_LOCKED,
+	BM_LOCK_SINGLE_SLOT = 0x10,
+	BM_ON_DAX_PMEM = 0x10000,
+};
 
-	/* for drbd_bm_write_copy_pages, everything is allowed,
-	 * only concurrent bulk operations are locked out. */
-	BM_LOCKED_CHANGE_ALLOWED = BM_IS_LOCKED,
+struct drbd_bitmap {
+	union {
+		struct page **bm_pages;
+		void *bm_on_pmem;
+	};
+	spinlock_t bm_lock;		/* fine-grain lock (TODO: per slot) */
+	spinlock_t bm_all_slots_lock;	/* all bitmap slots lock */
+
+	unsigned long bm_set[DRBD_PEERS_MAX]; /* number of bits set */
+	unsigned long bm_bits;  /* bits per peer */
+	unsigned long bm_bits_4k;  /* bits per peer, if we had bm_block_size of 4k */
+	size_t   bm_words; /* platform specitif word size; not 32bit!! */
+	size_t   bm_number_of_pages;
+	sector_t bm_dev_capacity;
+	struct mutex bm_change; /* serializes resize operations */
+
+	wait_queue_head_t bm_io_wait; /* used to serialize IO of single pages */
+
+	enum bm_flag bm_flags;
+	unsigned int bm_max_peers;
+	unsigned int bm_block_shift; /* ln2 of bytes per bit for this bitmap */
+
+	/* exclusively to be used by __al_write_transaction(),
+	 * and drbd_bm_write_hinted() -> bm_rw() called from there.
+	 * One activity log extent represents 4MB of storage, which are 1024
+	 * bits (at 4k per bit), times at most DRBD_PEERS_MAX (currently 32).
+	 * The bitmap is created interleaved, with a potentially odd number
+	 * of peer slots determined at create-md time.  Which means that one
+	 * AL-extent may be associated with one or two bitmap pages.
+	 */
+	unsigned int n_bitmap_hints;
+	unsigned int al_bitmap_hints[2*AL_UPDATES_PER_TRANSACTION];
+
+	/* debugging aid, in case we are still racy somewhere */
+	const char    *bm_why;
+	char          bm_task_comm[TASK_COMM_LEN];
+	pid_t         bm_task_pid;
+	struct drbd_peer_device *bm_locked_peer;
 };
 
 struct drbd_work_queue {
@@ -491,29 +726,37 @@ struct drbd_work_queue {
 	wait_queue_head_t q_wait;
 };
 
-struct drbd_socket {
-	struct mutex mutex;
-	struct socket    *socket;
-	/* this way we get our
-	 * send/receive buffers off the stack */
-	void *sbuf;
-	void *rbuf;
+struct drbd_peer_md {
+	u64 bitmap_uuid;
+	u64 bitmap_dagtag;
+	u32 flags;
+	s32 bitmap_index;
 };
 
 struct drbd_md {
 	u64 md_offset;		/* sector offset to 'super' block */
 
-	u64 la_size_sect;	/* last agreed size, unit sectors */
+	u64 effective_size;	/* last agreed size (sectors) */
+	u64 prev_members;	/* read from the meta-data */
+	u64 members;		/* current member mask for writing meta-data */
 	spinlock_t uuid_lock;
-	u64 uuid[UI_SIZE];
+	u64 current_uuid;
 	u64 device_uuid;
 	u32 flags;
+	s32 node_id;
 	u32 md_size_sect;
 
 	s32 al_offset;	/* signed relative sector offset to activity log */
 	s32 bm_offset;	/* signed relative sector offset to bitmap */
 
-	/* cached value of bdev->disk_conf->meta_dev_idx (see below) */
+	u32 max_peers;
+	u32 bm_block_size;
+	u32 bm_block_shift; /* ilog2(bm_block_size) */
+
+	struct drbd_peer_md peers[DRBD_NODE_ID_MAX];
+	u64 history_uuids[HISTORY_UUIDS];
+
+	/* cached value of bdev->disk_conf->meta_dev_idx */
 	s32 meta_dev_idx;
 
 	/* see al_tr_number_to_on_disk_sector() */
@@ -528,8 +771,13 @@ struct drbd_backing_dev {
 	struct block_device *md_bdev;
 	struct file *f_md_bdev;
 	struct drbd_md md;
-	struct disk_conf *disk_conf; /* RCU, for updates: resource->conf_update */
+	struct disk_conf __rcu *disk_conf; /* RCU, for updates: resource->conf_update */
 	sector_t known_size; /* last known size of that backing device */
+#if IS_ENABLED(CONFIG_DEV_DAX_PMEM)
+	struct dax_device *dax_dev;
+	struct meta_data_on_disk_9 *md_on_pmem; /* address of md_offset */
+	struct al_on_pmem *al_on_pmem;
+#endif
 };
 
 struct drbd_md_io {
@@ -544,43 +792,151 @@ struct drbd_md_io {
 
 struct bm_io_work {
 	struct drbd_work w;
+	struct drbd_device *device;
 	struct drbd_peer_device *peer_device;
 	char *why;
 	enum bm_flag flags;
-	int (*io_fn)(struct drbd_device *device, struct drbd_peer_device *peer_device);
-	void (*done)(struct drbd_device *device, int rv);
+	int (*io_fn)(struct drbd_device *device,
+		     struct drbd_peer_device *peer_device);
+	void (*done)(struct drbd_device *device,
+		     struct drbd_peer_device *peer_device,
+		     int rv);
 };
 
 struct fifo_buffer {
+	/* singly linked list to accumulate multiple such struct fifo_buffers,
+	 * to be freed after a single syncronize_rcu(),
+	 * outside a critical section. */
+	struct fifo_buffer *next;
 	unsigned int head_index;
 	unsigned int size;
 	int total; /* sum of all values */
 	int values[] __counted_by(size);
 };
-extern struct fifo_buffer *fifo_alloc(unsigned int fifo_size);
+struct fifo_buffer *fifo_alloc(unsigned int fifo_size);
 
 /* flag bits per connection */
-enum {
-	NET_CONGESTED,		/* The data socket is congested */
-	RESOLVE_CONFLICTS,	/* Set on one node, cleared on the peer! */
-	SEND_PING,
-	GOT_PING_ACK,		/* set when we receive a ping_ack packet, ping_wait gets woken */
-	CONN_WD_ST_CHG_REQ,	/* A cluster wide state change on the connection is active */
-	CONN_WD_ST_CHG_OKAY,
-	CONN_WD_ST_CHG_FAIL,
+enum connection_flag {
+	PING_PENDING,		/* cleared upon receiveing a ping_ack packet, wakes state_wait */
+	TWOPC_PREPARED,
+	TWOPC_YES,
+	TWOPC_NO,
+	TWOPC_RETRY,
 	CONN_DRY_RUN,		/* Expect disconnect after resync handshake. */
-	CREATE_BARRIER,		/* next P_DATA is preceded by a P_BARRIER */
-	STATE_SENT,		/* Do not change state/UUIDs while this is set */
+	DISCONNECT_EXPECTED,
+	BARRIER_ACK_PENDING,
+	CORKED,
+	DATA_CORKED = CORKED,	/* used as computed value CORKED + DATA_STREAM */
+	CONTROL_CORKED,		/* used as computed value CORKED + CONTROL_STREAM */
+	C_UNREGISTERED,
+	RECONNECT,
+	CONN_DISCARD_MY_DATA,
+	SEND_STATE_AFTER_AHEAD_C,
+	NOTIFY_PEERS_LOST_PRIMARY,
+	CHECKING_PEER,		/* used by make_new_urrent_uuid() to check liveliness */
+	CONN_CONGESTED,
+	CONN_HANDSHAKE_DISCONNECT,
+	CONN_HANDSHAKE_RETRY,
+	CONN_HANDSHAKE_READY,
+	RECEIVED_DAGTAG, /* Whether we received any write or dagtag since connecting. */
+	PING_TIMEOUT_ACTIVE,
+};
+
+/* flag bits per resource */
+enum resource_flag {
+	EXPLICIT_PRIMARY,
 	CALLBACK_PENDING,	/* Whether we have a call_usermodehelper(, UMH_WAIT_PROC)
 				 * pending, from drbd worker context.
 				 */
-	DISCONNECT_SENT,
+	TWOPC_ABORT_LOCAL,
+	TWOPC_WORK_PENDING,     /* Set while work for sending reply is scheduled */
+	TWOPC_EXECUTED,         /* Commited or aborted */
+	TWOPC_STATE_CHANGE_PENDING, /* set between sending commit and changing local state */
+
+	TRY_BECOME_UP_TO_DATE_PENDING,
 
 	DEVICE_WORK_PENDING,	/* tell worker that some device has pending work */
+	PEER_DEVICE_WORK_PENDING,/* tell worker that some peer_device has pending work */
+
+	/* to be used in drbd_post_work() */
+	R_UNREGISTERED,
+	DOWN_IN_PROGRESS,
+	CHECKING_PEERS,
+	WRONG_MDF_EXISTS,	/* Warned about MDF_EXISTS flag on all peer slots */
+	TWOPC_RECV_SIZES_ERR,	/* Error processing sizes packet during 2PC connect */
 };
 
 enum which_state { NOW, OLD = NOW, NEW };
 
+enum twopc_type {
+	TWOPC_STATE_CHANGE,
+	TWOPC_RESIZE,
+};
+
+struct twopc_reply {
+	int vnr;
+	unsigned int tid;  /* transaction identifier */
+	int initiator_node_id;  /* initiator of the transaction */
+	int target_node_id;  /* target of the transaction (or -1) */
+	u64 target_reachable_nodes;  /* behind the target node */
+	u64 reachable_nodes;  /* behind other nodes */
+	union {
+		struct { /* type == TWOPC_STATE_CHANGE */
+			u64 primary_nodes;
+			u64 weak_nodes;
+		};
+		struct { /* type == TWOPC_RESIZE */
+			u64 diskful_primary_nodes;
+			u64 max_possible_size;
+		};
+	};
+	unsigned int is_disconnect:1;
+	unsigned int is_connect:1;
+	unsigned int is_aborted:1;
+	/* Whether the state change on receiving the twopc failed. When this is
+	 * a twopc for transitioning to C_CONNECTED, we cannot immediately
+	 * reply with P_TWOPC_NO. The state handshake must complete first to
+	 * decide the appropriate reply. */
+	unsigned int state_change_failed:1;
+};
+
+struct twopc_request {
+	u64 nodes_to_reach;
+	enum drbd_packet cmd;
+	unsigned int tid;
+	int initiator_node_id;
+	int target_node_id;
+	int vnr;
+	u32 flags;
+};
+
+struct drbd_thread_timing_details {
+	unsigned long start_jif;
+	void *cb_addr;
+	const char *caller_fn;
+	unsigned int line;
+	unsigned int cb_nr;
+};
+#define DRBD_THREAD_DETAILS_HIST	16
+
+struct drbd_send_buffer {
+	struct page *page;  /* current buffer page for sending data */
+	char *unsent;  /* start of unsent area != pos if corked... */
+	char *pos; /* position within that page */
+	int allocated_size; /* currently allocated space */
+	int additional_size;  /* additional space to be added to next packet's size */
+};
+
+struct drbd_mutable_buffer {
+	u8 *buffer;
+	unsigned int avail;
+};
+
+enum drbd_per_resource_ratelimit {
+	D_RL_R_NOLIMIT = -1,
+	D_RL_R_GENERIC,
+};
+
 struct drbd_resource {
 	char *name;
 #ifdef CONFIG_DEBUG_FS
@@ -588,32 +944,141 @@ struct drbd_resource {
 	struct dentry *debugfs_res_volumes;
 	struct dentry *debugfs_res_connections;
 	struct dentry *debugfs_res_in_flight_summary;
+	struct dentry *debugfs_res_state_twopc;
+	struct dentry *debugfs_res_worker_pid;
+	struct dentry *debugfs_res_members;
 #endif
 	struct kref kref;
-	struct idr devices;		/* volume number to device mapping */
+
+	/* Volume number to device mapping. Updates protected by conf_update. */
+	struct idr devices;
+
+	struct ratelimit_state ratelimit[1];
+
+	/* RCU list. Updates protected by adm_mutex, conf_update and state_rwlock. */
 	struct list_head connections;
-	struct list_head resources;
+
+	struct list_head resources;     /* list entry in global resources list */
 	struct res_opts res_opts;
-	struct mutex conf_update;	/* mutex for ready-copy-update of net_conf and disk_conf */
+	int max_node_id;
+	/*
+	 * For read-copy-update of net_conf and disk_conf and devices,
+	 * connection, peer_devices and paths lists.
+	 */
+	struct mutex conf_update;
 	struct mutex adm_mutex;		/* mutex to serialize administrative requests */
-	spinlock_t req_lock;
+	struct mutex open_release;	/* serialize open/release */
+	struct {
+		char comm[TASK_COMM_LEN];
+		unsigned int minor;
+		pid_t pid;
+		ktime_t opened;
+	} auto_promoted_by;
+
+	rwlock_t state_rwlock;          /* serialize state changes */
+	u64 dagtag_sector;		/* Protected by tl_update_lock.
+					 * See also dagtag_sector in
+					 * &drbd_request */
+	u64 dagtag_from_backing_dev;
+	u64 dagtag_before_attach;
+	u64 members;			/* mask of online nodes */
+	unsigned long flags;
+
+	/* Protects updates to the transfer log and related counters. */
+	spinlock_t tl_update_lock;
+	struct list_head transfer_log;	/* all requests not yet fully processed */
+	struct drbd_request *tl_previous_write;
+
+	spinlock_t peer_ack_lock;
+	struct list_head peer_ack_req_list;  /* requests to send peer acks for */
+	struct list_head peer_ack_list;  /* peer acks to send */
+	struct drbd_work peer_ack_work;
+	u64 last_peer_acked_dagtag;  /* dagtag of last PEER_ACK'ed request */
+	struct drbd_request *peer_ack_req;  /* last request not yet PEER_ACK'ed */
 
-	unsigned susp:1;		/* IO suspended by user */
-	unsigned susp_nod:1;		/* IO suspended because no data */
-	unsigned susp_fen:1;		/* IO suspended because fence peer handler runs */
+	/* Protects current_flush_sequence and pending_flush_mask (connection) */
+	spinlock_t initiator_flush_lock;
+	u64 current_flush_sequence;
+
+	struct semaphore state_sem;
+	wait_queue_head_t state_wait;  /* upon each state change. */
+	enum chg_state_flags state_change_flags;
+	const char **state_change_err_str;
+	bool remote_state_change;  /* remote state change in progress */
+	enum drbd_packet twopc_prepare_reply_cmd; /* this node's answer to the prepare phase or 0 */
+	u64 twopc_parent_nodes;
+	struct twopc_reply twopc_reply;
+	struct timer_list twopc_timer;
+	struct work_struct twopc_work;
+	wait_queue_head_t twopc_wait;
+	struct {
+		enum twopc_type type;
+		union {
+			struct twopc_resize {
+				int dds_flags;		   /* from prepare phase */
+				sector_t user_size;	   /* from prepare phase */
+				u64 diskful_primary_nodes; /* added in commit phase */
+				u64 new_size;		   /* added in commit phase */
+			} resize;
+			struct twopc_state_change {
+				union drbd_state mask;	/* from prepare phase */
+				union drbd_state val;	/* from prepare phase */
+				u64 primary_nodes;	/* added in commit phase */
+				u64 reachable_nodes;	/* added in commit phase */
+			} state_change;
+		};
+	} twopc;
+	enum drbd_role role[2];
+	bool susp_user[2];			/* IO suspended by user */
+	bool susp_nod[2];		/* IO suspended because no data */
+	bool susp_quorum[2];		/* IO suspended because no quorum */
+	bool susp_uuid[2];		/* IO suspended because waiting new current UUID */
+	bool fail_io[2];		/* Fail all IO requests because forced a demote */
+	bool cached_susp;		/* cached result of looking at all different suspend bits */
+	bool cached_all_devices_have_quorum;
 
 	enum write_ordering_e write_ordering;
 
+	/* Protects the current transfer log (tle) fields. */
+	spinlock_t current_tle_lock;
+	atomic_t current_tle_nr;	/* transfer log epoch number */
+	unsigned current_tle_writes;	/* writes seen within this tl epoch */
+
+	unsigned cached_min_aggreed_protocol_version;
+
 	cpumask_var_t cpu_mask;
+
+	struct drbd_work_queue work;
+	struct drbd_thread worker;
+
+	struct list_head listeners;
+	spinlock_t listeners_lock;
+
+	struct timer_list peer_ack_timer; /* send a P_PEER_ACK after last completion */
+
+	unsigned int w_cb_nr; /* keeps counting up */
+	struct drbd_thread_timing_details w_timing_details[DRBD_THREAD_DETAILS_HIST];
+	wait_queue_head_t barrier_wait;  /* upon each state change. */
+	struct rcu_head rcu;
+
+	struct list_head suspended_reqs;
+	/*
+	 * The side effects of an empty state change two-phase commit are:
+	 *
+	 * * A local consistent disk can upgrade to up-to-date when no primary is reachable
+	 *   (or become outdated if the prepare packets reach a primary).
+	 *
+	 * * resource->members are updates
+	 *
+	 * * Faraway nodes might outdate themselves if they learn about the existence of a primary
+	 *   (with access to data) node.
+	 */
+	struct work_struct empty_twopc;
 };
 
-struct drbd_thread_timing_details
-{
-	unsigned long start_jif;
-	void *cb_addr;
-	const char *caller_fn;
-	unsigned int line;
-	unsigned int cb_nr;
+enum drbd_per_connection_ratelimit {
+	D_RL_C_NOLIMIT = -1,
+	D_RL_C_GENERIC,
 };
 
 struct drbd_connection {
@@ -623,36 +1088,49 @@ struct drbd_connection {
 	struct dentry *debugfs_conn;
 	struct dentry *debugfs_conn_callback_history;
 	struct dentry *debugfs_conn_oldest_requests;
+	struct dentry *debugfs_conn_transport;
+	struct dentry *debugfs_conn_debug;
+	struct dentry *debugfs_conn_receiver_pid;
+	struct dentry *debugfs_conn_sender_pid;
 #endif
 	struct kref kref;
 	struct idr peer_devices;	/* volume number to peer device mapping */
-	enum drbd_conns cstate;		/* Only C_STANDALONE to C_WF_REPORT_PARAMS */
-	struct mutex cstate_mutex;	/* Protects graceful disconnects */
-	unsigned int connect_cnt;	/* Inc each time a connection is established */
+	enum drbd_conn_state cstate[2];
+	enum drbd_role peer_role[2];
+	bool susp_fen[2];		/* IO suspended because fence peer handler runs */
+
+	struct ratelimit_state ratelimit[1];
 
 	unsigned long flags;
-	struct net_conf *net_conf;	/* content protected by rcu */
-	wait_queue_head_t ping_wait;	/* Woken upon reception of a ping, and a state change */
+	enum drbd_fencing_policy fencing_policy;
 
-	struct sockaddr_storage my_addr;
-	int my_addr_len;
-	struct sockaddr_storage peer_addr;
-	int peer_addr_len;
+	struct drbd_send_buffer send_buffer[2];
+	struct mutex mutex[2]; /* Protect assembling of new packet until sending it (in send_buffer) */
+	/* scratch buffers for use while "owning" the DATA_STREAM send_buffer,
+	 * to avoid larger on-stack temporary variables,
+	 * introduced for holding digests in drbd_send_dblock() */
+	union {
+		/* MAX_DIGEST_SIZE in the linux kernel at this point is 64 byte, afaik */
+		struct {
+			char before[64];
+			char after[64];
+		} d;
+	} scratch_buffer;
 
-	struct drbd_socket data;	/* data/barrier/cstate/parameter packets */
-	struct drbd_socket meta;	/* ping/ack (metadata) packets */
 	int agreed_pro_version;		/* actually used protocol version */
 	u32 agreed_features;
-	unsigned long last_received;	/* in jiffies, either socket */
-	unsigned int ko_count;
+	atomic_t ap_in_flight; /* App sectors in flight (waiting for ack) */
+	atomic_t rs_in_flight; /* Resync sectors in flight */
 
-	struct list_head transfer_log;	/* all requests not yet fully processed */
+	struct drbd_work connect_timer_work;
+	struct timer_list connect_timer;
 
 	struct crypto_shash *cram_hmac_tfm;
-	struct crypto_shash *integrity_tfm;  /* checksums we compute, updates protected by connection->data->mutex */
+	struct crypto_shash *integrity_tfm;  /* checksums we compute, updates protected by connection->mutex[DATA_STREAM] */
 	struct crypto_shash *peer_integrity_tfm;  /* checksums we verify, only accessed from receiver thread  */
 	struct crypto_shash *csums_tfm;
 	struct crypto_shash *verify_tfm;
+
 	void *int_dig_in;
 	void *int_dig_vv;
 
@@ -660,35 +1138,137 @@ struct drbd_connection {
 	struct drbd_epoch *current_epoch;
 	spinlock_t epoch_lock;
 	unsigned int epochs;
-	atomic_t current_tle_nr;	/* transfer log epoch number */
-	unsigned current_tle_writes;	/* writes seen within this tl epoch */
 
 	unsigned long last_reconnect_jif;
 	/* empty member on older kernels without blk_start_plug() */
 	struct blk_plug receiver_plug;
 	struct drbd_thread receiver;
-	struct drbd_thread worker;
-	struct drbd_thread ack_receiver;
+	struct drbd_thread sender;
 	struct workqueue_struct *ack_sender;
+	struct work_struct peer_ack_work;
+
+	/* Work for sending P_OUT_OF_SYNC due to P_PEER_ACK */
+	struct drbd_work send_oos_work;
+	/*
+	 * These peers have sent us a P_PEER_ACK for which we need to send
+	 * P_OUT_OF_SYNC on this connection.
+	 */
+	unsigned long send_oos_from_mask;
+
+	atomic64_t last_dagtag_sector;
+	/* Record of last peer ack to determine whether we can ack flush */
+	u64 last_peer_ack_dagtag_seen;
+
+	/* Mask of nodes from which we are waiting for a flush ack corresponding to this Primary */
+	u64 pending_flush_mask;
+
+	/* Protects the flush members below for this connection */
+	spinlock_t primary_flush_lock;
+	/* For handling P_FLUSH_REQUESTS from this peer */
+	u64 flush_requests_dagtag;
+	u64 flush_sequence;
+	u64 flush_forward_sent_mask;
+
+	/* For handling forwarded flushes. On connection to initiator node. */
+	spinlock_t flush_ack_lock;
+	struct drbd_work flush_ack_work;
+	/* For forwarded flushes. On connection to initiator node. Indexed by primary node ID */
+	u64 flush_ack_sequence[DRBD_PEERS_MAX];
+
+	atomic_t active_ee_cnt; /* Peer write requests waiting for activity log or backing disk. */
+	atomic_t backing_ee_cnt; /* Other peer requests waiting for conflicts or backing disk. */
+	atomic_t done_ee_cnt;
+	spinlock_t peer_reqs_lock;
+	spinlock_t send_oos_lock; /* Protects send_oos list */
+
+	/* Lists using drbd_peer_request.recv_order (see also drbd_peer_device.resync_requests) */
+	struct list_head peer_requests; /* All peer writes in the order we received them */
+	struct list_head peer_reads; /* All reads in the order we received them */
+	/*
+	 * Peer writes for which we need to send some P_OUT_OF_SYNC. These peer
+	 * writes continue to be stored on the connection over which the writes
+	 * and the P_PEER_ACK are received. They are accessed by the sender for
+	 * each relevant peer. Protected by send_oos_lock on this connection.
+	 */
+	struct list_head send_oos;
+
+	/* Lists using drbd_peer_request.w.list */
+	struct list_head done_ee;   /* Need to send P_WRITE_ACK/P_RS_WRITE_ACK */
+	struct list_head dagtag_wait_ee; /* Resync read waiting for dagtag to be reached */
+
+	struct work_struct send_acks_work;
+	struct work_struct send_ping_ack_work;
+	struct work_struct send_ping_work;
+	wait_queue_head_t ee_wait;
+
+	atomic_t pp_in_use;		/* allocated from page pool */
+	atomic_t pp_in_use_by_net;	/* sendpage()d, still referenced by transport */
+	/* sender side */
+	struct drbd_work_queue sender_work;
+
+	struct drbd_work send_dagtag_work;
+	u64 send_dagtag;
+
+	struct sender_todo {
+		struct list_head work_list;
+
+		/* If upper layers trigger an unplug on this side, we want to
+		 * send and unplug hint over to the peer.  Sending it too
+		 * early, or missing it completely, causes a potential latency
+		 * penalty (requests idling too long in the remote queue).
+		 * There is no harm done if we occasionally send one too many
+		 * such unplug hints.
+		 *
+		 * We have two slots, which are used in an alternating fashion:
+		 * If a new unplug event happens while the current pending one
+		 * has not even been processed yet, we overwrite the next
+		 * pending slot: there is not much point in unplugging on the
+		 * remote side, if we have a full request queue to be send on
+		 * this side still, and not even reached the position in the
+		 * change stream when the previous local unplug happened.
+		 */
+		u64 unplug_dagtag_sector[2];
+		unsigned int unplug_slot; /* 0 or 1 */
+
+		/* the currently (or last) processed request,
+		 * see process_sender_todo() */
+		struct drbd_request *req;
+
+		/* Points to the next request on the resource->transfer_log,
+		 * which is RQ_NET_QUEUED for this connection, and so can
+		 * safely be used as next starting point for the list walk
+		 * in tl_next_request_for_connection().
+		 *
+		 * If it is NULL (we walked off the tail last time), it will be
+		 * set by __req_mod( QUEUE_FOR.* ), so fast connections don't
+		 * need to walk the full transfer_log list every time, even if
+		 * the list is kept long by some slow connections.
+		 *
+		 * req_next is only accessed by drbd_sender thread, in
+		 * case of a resend from some worker, but then regular IO
+		 * is suspended.
+		 */
+		struct drbd_request *req_next;
+	} todo;
 
 	/* cached pointers,
 	 * so we can look up the oldest pending requests more quickly.
-	 * protected by resource->req_lock */
-	struct drbd_request *req_next; /* DRBD 9: todo.req_next */
+	 * TODO: RCU */
 	struct drbd_request *req_ack_pending;
+	/* The oldest request that is or was queued for this peer, but is not
+	 * done towards it. */
 	struct drbd_request *req_not_net_done;
+	/* Protects the caching pointers from being advanced concurrently. */
+	spinlock_t advance_cache_ptr_lock;
 
-	/* sender side */
-	struct drbd_work_queue sender_work;
-
-#define DRBD_THREAD_DETAILS_HIST	16
-	unsigned int w_cb_nr; /* keeps counting up */
+	unsigned int s_cb_nr; /* keeps counting up */
 	unsigned int r_cb_nr; /* keeps counting up */
-	struct drbd_thread_timing_details w_timing_details[DRBD_THREAD_DETAILS_HIST];
+	struct drbd_thread_timing_details s_timing_details[DRBD_THREAD_DETAILS_HIST];
 	struct drbd_thread_timing_details r_timing_details[DRBD_THREAD_DETAILS_HIST];
 
 	struct {
 		unsigned long last_sent_barrier_jif;
+		int last_sent_epoch_nr;
 
 		/* whether this sender thread
 		 * has processed a single write yet. */
@@ -701,52 +1281,245 @@ struct drbd_connection {
 		 * with req->epoch == current_epoch_nr.
 		 * If none, no P_BARRIER will be sent. */
 		unsigned current_epoch_writes;
-	} send;
-};
 
-static inline bool has_net_conf(struct drbd_connection *connection)
-{
-	bool has_net_conf;
+		/* Position in change stream of last write sent. */
+		u64 current_dagtag_sector;
 
-	rcu_read_lock();
-	has_net_conf = rcu_dereference(connection->net_conf);
-	rcu_read_unlock();
+		/* Position in change stream of last ready request seen. */
+		u64 seen_dagtag_sector;
+	} send;
 
-	return has_net_conf;
-}
+	struct {
+		u64 dagtag_sector;
+		int lost_node_id;
+	} after_reconciliation;
 
-void __update_timing_details(
-		struct drbd_thread_timing_details *tdp,
-		unsigned int *cb_nr,
-		void *cb,
-		const char *fn, const unsigned int line);
+	unsigned int peer_node_id;
 
-#define update_worker_timing_details(c, cb) \
-	__update_timing_details(c->w_timing_details, &c->w_cb_nr, cb, __func__ , __LINE__ )
-#define update_receiver_timing_details(c, cb) \
-	__update_timing_details(c->r_timing_details, &c->r_cb_nr, cb, __func__ , __LINE__ )
+	struct drbd_mutable_buffer reassemble_buffer;
+	union {
+		u8 bytes[8];
+		struct p_block_ack block_ack;
+		struct p_barrier_ack barrier_ack;
+		struct p_confirm_stable confirm_stable;
+		struct p_peer_ack peer_ack;
+		struct p_peer_block_desc peer_block_desc;
+		struct p_twopc_reply twopc_reply;
+	} reassemble_buffer_bytes;
+
+	/* Used when a network namespace is removed to track all connections
+	 * that need disconnecting. */
+	struct list_head remove_net_list;
+
+	struct rcu_head rcu;
+
+	unsigned int ctl_packets;
+	unsigned int ctl_bytes;
+
+	struct drbd_transport transport; /* The transport needs to be the last member. The acutal
+					    implementation might have more members than the
+					    abstract one. */
+};
 
-struct submit_worker {
-	struct workqueue_struct *wq;
-	struct work_struct worker;
+/* used to get the next lower or next higher peer_device depending on device node-id */
+enum drbd_neighbor {
+	NEXT_LOWER,
+	NEXT_HIGHER
+};
 
-	/* protected by ..->resource->req_lock */
-	struct list_head writes;
+enum drbd_per_peer_device_ratelimit {
+	D_RL_PD_NOLIMIT = -1,
+	D_RL_PD_GENERIC,
 };
 
 struct drbd_peer_device {
 	struct list_head peer_devices;
 	struct drbd_device *device;
 	struct drbd_connection *connection;
-	struct work_struct send_acks_work;
+	struct peer_device_conf __rcu *conf; /* RCU, for updates: resource->conf_update */
+	enum drbd_disk_state disk_state[2];
+	enum drbd_repl_state repl_state[2];
+	bool resync_susp_user[2];
+	bool resync_susp_peer[2];
+	bool resync_susp_dependency[2];
+	bool resync_susp_other_c[2];
+	bool resync_active[2];
+	bool replication[2]; /* Only while peer is Inconsistent: Is replication enabled? */
+	bool peer_replication[2]; /* Whether we have instructed peer to replicate to us */
+	enum drbd_repl_state negotiation_result; /* To find disk state after attach */
+	unsigned int send_cnt;
+	unsigned int recv_cnt;
+	atomic_t packet_seq;
+	unsigned int peer_seq;
+	spinlock_t peer_seq_lock;
+	uint64_t d_size;  /* size of disk */
+	uint64_t u_size;  /* user requested size */
+	uint64_t c_size;  /* current exported size */
+	uint64_t max_size;
+	int bitmap_index;
+	int node_id;
+
+	struct ratelimit_state ratelimit[1];
+
+	unsigned long flags;
+
+	enum drbd_repl_state start_resync_side;
+	enum drbd_repl_state last_repl_state; /* What we received from the peer */
+	struct timer_list start_resync_timer;
+	struct drbd_work resync_work;
+	struct timer_list resync_timer;
+	struct drbd_work propagate_uuids_work;
+
+	enum drbd_disk_state resync_finished_pdsk; /* Finished while starting resync */
+	int resync_again; /* decided to resync again while resync running */
+	sector_t last_in_sync_end; /* sector after end of last completed resync request */
+	unsigned long resync_next_bit; /* bitmap bit to search from for next resync request */
+	unsigned long last_resync_pass_bits; /* bitmap weight at end of previous pass */
+
+	atomic_t ap_pending_cnt; /* AP data packets on the wire, ack expected (RQ_NET_PENDING set) */
+	atomic_t unacked_cnt;	 /* Need to send replies for */
+	atomic_t rs_pending_cnt; /* RS request/data packets on the wire */
+
+	/* Protected by connection->peer_reqs_lock */
+	struct list_head resync_requests; /* Resync requests in the order we sent them */
+	/*
+	 * If not NULL, all requests in resync_requests until this one have
+	 * been received. Discards are only counted as "received" once merging
+	 * is complete.
+	 */
+	struct drbd_peer_request *received_last;
+	/*
+	 * If not NULL, all requests in resync_requests after received_last
+	 * until this one are discards.
+	 */
+	struct drbd_peer_request *discard_last;
+
+	/* use checksums for *this* resync */
+	bool use_csums;
+	/* blocks to resync in this run [unit BM_BLOCK_SIZE] */
+	unsigned long rs_total;
+	/* number of resync blocks that failed in this run */
+	unsigned long rs_failed;
+	/* Syncer's start time [unit jiffies] */
+	unsigned long rs_start;
+	/* cumulated time in PausedSyncX state [unit jiffies] */
+	unsigned long rs_paused;
+	/* skipped because csum was equal [unit BM_BLOCK_SIZE] */
+	unsigned long rs_same_csum;
+	unsigned long rs_last_progress_report_ts;
+#define DRBD_SYNC_MARKS 8
+#define DRBD_SYNC_MARK_STEP (3*HZ)
+	/* block not up-to-date at mark [unit BM_BLOCK_SIZE] */
+	unsigned long rs_mark_left[DRBD_SYNC_MARKS];
+	/* marks's time [unit jiffies] */
+	unsigned long rs_mark_time[DRBD_SYNC_MARKS];
+	/* current index into rs_mark_{left,time} */
+	int rs_last_mark;
+	unsigned long rs_last_writeout;
+
+	/* where does the admin want us to start? (sector) */
+	sector_t ov_start_sector;
+	sector_t ov_stop_sector;
+	/* where are we now? (sector) */
+	sector_t ov_position;
+	/* Start sector of out of sync range (to merge printk reporting). */
+	sector_t ov_last_oos_start;
+	/* size of out-of-sync range in sectors. */
+	sector_t ov_last_oos_size;
+	/* Start sector of skipped range (to merge printk reporting). */
+	sector_t ov_last_skipped_start;
+	/* size of skipped range in sectors. */
+	sector_t ov_last_skipped_size;
+	int c_sync_rate; /* current resync rate after syncer throttle magic */
+	struct fifo_buffer __rcu *rs_plan_s; /* correction values of resync planer (RCU, connection->conn_update) */
+	atomic_t rs_sect_in; /* for incoming resync data rate, SyncTarget */
+	int rs_last_events;  /* counter of read or write "events" (unit sectors)
+			      * on the lower level device when we last looked. */
+	int rs_in_flight; /* resync sectors in flight (to proxy, in proxy and from proxy) */
+	ktime_t rs_last_mk_req_kt;
+	atomic64_t ov_left; /* in bits */
+	unsigned long ov_skipped; /* in bits */
+	u64 rs_start_uuid;
+
+	u64 current_uuid;
+	u64 bitmap_uuids[DRBD_PEERS_MAX];
+	u64 history_uuids[HISTORY_UUIDS];
+	u64 dirty_bits;
+	u64 uuid_flags;
+	u64 uuid_node_mask; /* might be authoritative_nodes or weak_nodes */
+
+	unsigned long comm_bm_set; /* communicated number of set bits. */
+	u64 comm_current_uuid; /* communicated current UUID */
+	u64 comm_uuid_flags; /* communicated UUID flags */
+	u64 comm_bitmap_uuid;
+	union drbd_state comm_state;
+
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_peer_dev;
+	struct dentry *debugfs_peer_dev_proc_drbd;
 #endif
+	ktime_t pre_send_kt;
+	ktime_t acked_kt;
+	ktime_t net_done_kt;
+
+	struct {/* sender todo per peer_device */
+		bool was_sending_out_of_sync;
+	} todo;
+	union drbd_state connect_state;
+	struct {
+		unsigned int	physical_block_size;
+		unsigned int	logical_block_size;
+		unsigned int	alignment_offset;
+		unsigned int	io_min;
+		unsigned int	io_opt;
+		unsigned int	max_bio_size;
+	} q_limits;
+	/* communicated as part of o_qlim, if agreed on DRBD_FF_BM_BLOCK_SHIFT */
+	unsigned int bm_block_shift;
+};
+
+struct conflict_worker {
+	struct workqueue_struct *wq;
+	struct work_struct worker;
+
+	spinlock_t lock;
+	struct list_head resync_writes;
+	struct list_head resync_reads;
+	struct list_head writes;
+	struct list_head peer_writes;
+};
+
+struct submit_worker {
+	struct workqueue_struct *wq;
+	struct work_struct worker;
+
+	spinlock_t lock;
+	struct list_head writes;
+	struct list_head peer_writes;
+};
+
+struct opener {
+	struct list_head list;
+	char comm[TASK_COMM_LEN];
+	pid_t pid;
+	ktime_t opened;
+};
+
+enum drbd_per_device_ratelimit {
+	D_RL_D_NOLIMIT = -1,
+	D_RL_D_GENERIC,
+	D_RL_D_METADATA,
+	D_RL_D_BACKEND,
+	__D_RL_D_N
 };
 
 struct drbd_device {
 	struct drbd_resource *resource;
+
+	/* RCU list. Updates protected by adm_mutex, conf_update and state_rwlock. */
 	struct list_head peer_devices;
+
+	spinlock_t pending_bmio_lock;
 	struct list_head pending_bitmap_io;
 
 	unsigned long flush_jif;
@@ -755,12 +1528,22 @@ struct drbd_device {
 	struct dentry *debugfs_vol;
 	struct dentry *debugfs_vol_oldest_requests;
 	struct dentry *debugfs_vol_act_log_extents;
-	struct dentry *debugfs_vol_resync_extents;
+	struct dentry *debugfs_vol_act_log_histogram;
 	struct dentry *debugfs_vol_data_gen_id;
+	struct dentry *debugfs_vol_io_frozen;
 	struct dentry *debugfs_vol_ed_gen_id;
+	struct dentry *debugfs_vol_openers;
+	struct dentry *debugfs_vol_md_io;
+	struct dentry *debugfs_vol_interval_tree;
+	struct dentry *debugfs_vol_al_updates;
+	struct dentry *debugfs_vol_multi_bio_cnt;
+#ifdef CONFIG_DRBD_TIMING_STATS
+	struct dentry *debugfs_vol_req_timing;
+#endif
 #endif
+	struct ratelimit_state ratelimit[__D_RL_D_N];
 
-	unsigned int vnr;	/* volume number within the connection */
+	unsigned int vnr;	/* volume number within the resource */
 	unsigned int minor;	/* device minor number */
 
 	struct kref kref;
@@ -769,148 +1552,126 @@ struct drbd_device {
 	unsigned long flags;
 
 	/* configured by drbdsetup */
-	struct drbd_backing_dev *ldev;
+	struct drbd_backing_dev *ldev; /* enclose accessing code in get_ldev() / put_ldev() */
+
+	/* Used to close backing devices and destroy related structures. */
+	struct work_struct ldev_destroy_work;
 
-	sector_t p_size;     /* partner's disk size */
 	struct request_queue *rq_queue;
 	struct gendisk	    *vdisk;
 
 	unsigned long last_reattach_jif;
-	struct drbd_work resync_work;
-	struct drbd_work unplug_work;
-	struct timer_list resync_timer;
 	struct timer_list md_sync_timer;
-	struct timer_list start_resync_timer;
 	struct timer_list request_timer;
 
-	/* Used after attach while negotiating new disk state. */
-	union drbd_state new_state_tmp;
-
-	union drbd_dev_state state;
+	enum drbd_disk_state disk_state[2];
 	wait_queue_head_t misc_wait;
-	wait_queue_head_t state_wait;  /* upon each state change. */
-	unsigned int send_cnt;
-	unsigned int recv_cnt;
 	unsigned int read_cnt;
 	unsigned int writ_cnt;
 	unsigned int al_writ_cnt;
 	unsigned int bm_writ_cnt;
-	atomic_t ap_bio_cnt;	 /* Requests we need to complete */
-	atomic_t ap_actlog_cnt;  /* Requests waiting for activity log */
-	atomic_t ap_pending_cnt; /* AP data packets on the wire, ack expected */
-	atomic_t rs_pending_cnt; /* RS request/data packets on the wire */
-	atomic_t unacked_cnt;	 /* Need to send replies for */
+	unsigned int multi_bio_cnt; /* peer_reqs that needed multiple bios */
+	atomic_t ap_bio_cnt[2];	 /* Requests we need to complete. [READ] and [WRITE] */
 	atomic_t local_cnt;	 /* Waiting for local completion */
-	atomic_t suspend_cnt;
+	atomic_t ap_actlog_cnt;  /* Requests waiting for activity log */
+	atomic_t wait_for_actlog; /* Peer requests waiting for activity log */
+	/* worst case extent count needed to satisfy both requests and peer requests
+	 * currently waiting for the activity log */
+	atomic_t wait_for_actlog_ecnt;
+
+	atomic_t suspend_cnt;	/* recursive suspend counter, if non-zero, IO will be blocked. */
 
-	/* Interval tree of pending local requests */
-	struct rb_root read_requests;
-	struct rb_root write_requests;
+	/* Interval trees of pending requests */
+	spinlock_t interval_lock;
+	struct rb_root read_requests; /* Local reads */
+	struct rb_root requests; /* Local and peer writes, resync operations etc. */
 
 	/* for statistics and timeouts */
 	/* [0] read, [1] write */
+	spinlock_t pending_completion_lock;
 	struct list_head pending_master_completion[2];
 	struct list_head pending_completion[2];
 
-	/* use checksums for *this* resync */
-	bool use_csums;
-	/* blocks to resync in this run [unit BM_BLOCK_SIZE] */
-	unsigned long rs_total;
-	/* number of resync blocks that failed in this run */
-	unsigned long rs_failed;
-	/* Syncer's start time [unit jiffies] */
-	unsigned long rs_start;
-	/* cumulated time in PausedSyncX state [unit jiffies] */
-	unsigned long rs_paused;
-	/* skipped because csum was equal [unit BM_BLOCK_SIZE] */
-	unsigned long rs_same_csum;
-#define DRBD_SYNC_MARKS 8
-#define DRBD_SYNC_MARK_STEP (3*HZ)
-	/* block not up-to-date at mark [unit BM_BLOCK_SIZE] */
-	unsigned long rs_mark_left[DRBD_SYNC_MARKS];
-	/* marks's time [unit jiffies] */
-	unsigned long rs_mark_time[DRBD_SYNC_MARKS];
-	/* current index into rs_mark_{left,time} */
-	int rs_last_mark;
-	unsigned long rs_last_bcast; /* [unit jiffies] */
-
-	/* where does the admin want us to start? (sector) */
-	sector_t ov_start_sector;
-	sector_t ov_stop_sector;
-	/* where are we now? (sector) */
-	sector_t ov_position;
-	/* Start sector of out of sync range (to merge printk reporting). */
-	sector_t ov_last_oos_start;
-	/* size of out-of-sync range in sectors. */
-	sector_t ov_last_oos_size;
-	unsigned long ov_left; /* in bits */
-
-	struct drbd_bitmap *bitmap;
-	unsigned long bm_resync_fo; /* bit offset for drbd_bm_find_next */
-
-	/* Used to track operations of resync... */
-	struct lru_cache *resync;
-	/* Number of locked elements in resync LRU */
-	unsigned int resync_locked;
-	/* resync extent number waiting for application requests */
-	unsigned int resync_wenr;
+	struct drbd_bitmap *bitmap; /* enclose accessing code in get_ldev() / put_ldev() */
+	/* We may want to report on resync progress
+	 * even after we detached again (bitmap == NULL).
+	 * Cache the last bitmap block size here.
+	 */
+	unsigned int last_bm_block_shift;
 
 	int open_cnt;
-	u64 *p_uuid;
+	bool writable;
+	/* FIXME clean comments, restructure so it is more obvious which
+	 * members are protected by what */
 
-	struct list_head active_ee; /* IO in progress (P_DATA gets written to disk) */
-	struct list_head sync_ee;   /* IO in progress (P_RS_DATA_REPLY gets written to disk) */
-	struct list_head done_ee;   /* need to send P_WRITE_ACK */
-	struct list_head read_ee;   /* [RS]P_DATA_REQUEST being read */
-
-	struct list_head resync_reads;
-	atomic_t pp_in_use;		/* allocated from page pool */
-	atomic_t pp_in_use_by_net;	/* sendpage()d, still referenced by tcp */
-	wait_queue_head_t ee_wait;
 	struct drbd_md_io md_io;
 	spinlock_t al_lock;
 	wait_queue_head_t al_wait;
 	struct lru_cache *act_log;	/* activity log */
+	unsigned al_histogram[AL_UPDATES_PER_TRANSACTION+1];
 	unsigned int al_tr_number;
 	int al_tr_cycle;
 	wait_queue_head_t seq_wait;
-	atomic_t packet_seq;
-	unsigned int peer_seq;
-	spinlock_t peer_seq_lock;
-	unsigned long comm_bm_set; /* communicated number of set bits. */
-	struct bm_io_work bm_io_work;
-	u64 ed_uuid; /* UUID of the exposed data */
-	struct mutex own_state_mutex;
-	struct mutex *state_mutex; /* either own_state_mutex or first_peer_device(device)->connection->cstate_mutex */
-	char congestion_reason;  /* Why we where congested... */
-	atomic_t rs_sect_in; /* for incoming resync data rate, SyncTarget */
+	u64 exposed_data_uuid; /* UUID of the exposed data */
+	u64 next_exposed_data_uuid;
+	struct rw_semaphore uuid_sem;
 	atomic_t rs_sect_ev; /* for submitted resync data rate, both */
-	int rs_last_sect_ev; /* counter to compare with */
-	int rs_last_events;  /* counter of read or write "events" (unit sectors)
-			      * on the lower level device when we last looked. */
-	int c_sync_rate; /* current resync rate after syncer throttle magic */
-	struct fifo_buffer *rs_plan_s; /* correction values of resync planer (RCU, connection->conn_update) */
-	int rs_in_flight; /* resync sectors in flight (to proxy, in proxy and from proxy) */
-	atomic_t ap_in_flight; /* App sectors in flight (waiting for ack) */
-	unsigned int peer_max_bio_size;
-	unsigned int local_max_bio_size;
-
-	/* any requests that would block in drbd_make_request()
-	 * are deferred to this single-threaded work queue */
+	struct pending_bitmap_work_s {
+		atomic_t n;		/* inc when queued here, */
+		spinlock_t q_lock;	/* dec only once finished. */
+		struct list_head q;	/* n > 0 even if q already empty */
+	} pending_bitmap_work;
+	struct device_conf device_conf;
+
+	/* any requests that were blocked due to conflicts with other requests
+	 * or resync are submitted on this ordered work queue */
+	struct conflict_worker submit_conflict;
+	/* any requests that would block due to the activity log
+	 * are deferred to this ordered work queue */
 	struct submit_worker submit;
+	u64 read_nodes; /* used for balancing read requests among peers */
+	bool have_quorum[2];	/* no quorum -> suspend IO or error IO */
+	bool cached_state_unstable; /* updates with each state change */
+	bool cached_err_io; /* complete all IOs with error */
+
+#ifdef CONFIG_DRBD_TIMING_STATS
+	spinlock_t timing_lock;
+	unsigned long reqs;
+	ktime_t in_actlog_kt;
+	ktime_t pre_submit_kt; /* sum over over all reqs */
+
+	ktime_t before_queue_kt; /* sum over all al_misses */
+	ktime_t before_al_begin_io_kt;
+
+	ktime_t al_before_bm_write_hinted_kt; /* sum over all al_writ_cnt */
+	ktime_t al_mid_kt;
+	ktime_t al_after_sync_page_kt;
+#endif
+	struct list_head openers;
+	spinlock_t openers_lock;
+	spinlock_t peer_req_bio_completion_lock;
+
+	struct rcu_head rcu;
+	struct work_struct finalize_work;
 };
 
 struct drbd_bm_aio_ctx {
 	struct drbd_device *device;
-	struct list_head list; /* on device->pending_bitmap_io */;
+	struct list_head list; /* on device->pending_bitmap_io */
 	unsigned long start_jif;
+	struct blk_plug bm_aio_plug;
 	atomic_t in_flight;
 	unsigned int done;
 	unsigned flags;
 #define BM_AIO_COPY_PAGES	1
 #define BM_AIO_WRITE_HINTED	2
 #define BM_AIO_WRITE_ALL_PAGES	4
-#define BM_AIO_READ		8
+#define BM_AIO_READ	        8
+#define BM_AIO_WRITE_LAZY      16
+	/* only report stats for global read, write, write all */
+#define BM_AIO_NO_STATS (BM_AIO_COPY_PAGES\
+			|BM_AIO_WRITE_HINTED\
+			|BM_AIO_WRITE_LAZY)
 	int error;
 	struct kref kref;
 };
@@ -921,12 +1682,14 @@ struct drbd_config_context {
 	/* assigned from request attributes, if present */
 	unsigned int volume;
 #define VOLUME_UNSPECIFIED		(-1U)
+	unsigned int peer_node_id;
+#define PEER_NODE_ID_UNSPECIFIED	(-1U)
 	/* pointer into the request skb,
 	 * limited lifetime! */
 	char *resource_name;
-	struct nlattr *my_addr;
-	struct nlattr *peer_addr;
 
+	/* network namespace of the sending socket */
+	struct net *net;
 	/* reply buffer */
 	struct sk_buff *reply_skb;
 	/* pointer into reply buffer */
@@ -935,6 +1698,7 @@ struct drbd_config_context {
 	struct drbd_device *device;
 	struct drbd_resource *resource;
 	struct drbd_connection *connection;
+	struct drbd_peer_device *peer_device;
 };
 
 static inline struct drbd_device *minor_to_device(unsigned int minor)
@@ -942,10 +1706,6 @@ static inline struct drbd_device *minor_to_device(unsigned int minor)
 	return (struct drbd_device *)idr_find(&drbd_devices, minor);
 }
 
-static inline struct drbd_peer_device *first_peer_device(struct drbd_device *device)
-{
-	return list_first_entry_or_null(&device->peer_devices, struct drbd_peer_device, peer_devices);
-}
 
 static inline struct drbd_peer_device *
 conn_peer_device(struct drbd_connection *connection, int volume_number)
@@ -959,18 +1719,19 @@ conn_peer_device(struct drbd_connection *connection, int volume_number)
 #define for_each_resource_rcu(resource, _resources) \
 	list_for_each_entry_rcu(resource, _resources, resources)
 
-#define for_each_resource_safe(resource, tmp, _resources) \
-	list_for_each_entry_safe(resource, tmp, _resources, resources)
-
+/* see drbd_resource.connections for locking requirements */
 #define for_each_connection(connection, resource) \
 	list_for_each_entry(connection, &resource->connections, connections)
 
 #define for_each_connection_rcu(connection, resource) \
 	list_for_each_entry_rcu(connection, &resource->connections, connections)
 
-#define for_each_connection_safe(connection, tmp, resource) \
-	list_for_each_entry_safe(connection, tmp, &resource->connections, connections)
+#define for_each_connection_ref(connection, m, resource)		\
+	for (connection = __drbd_next_connection_ref(&m, NULL, resource); \
+	     connection;						\
+	     connection = __drbd_next_connection_ref(&m, connection, resource))
 
+/* see drbd_device.peer_devices for locking requirements */
 #define for_each_peer_device(peer_device, device) \
 	list_for_each_entry(peer_device, &device->peer_devices, peer_devices)
 
@@ -980,10 +1741,10 @@ conn_peer_device(struct drbd_connection *connection, int volume_number)
 #define for_each_peer_device_safe(peer_device, tmp, device) \
 	list_for_each_entry_safe(peer_device, tmp, &device->peer_devices, peer_devices)
 
-static inline unsigned int device_to_minor(struct drbd_device *device)
-{
-	return device->minor;
-}
+#define for_each_peer_device_ref(peer_device, m, device)		\
+	for (peer_device = __drbd_next_peer_device_ref(&m, NULL, device); \
+	     peer_device;						\
+	     peer_device = __drbd_next_peer_device_ref(&m, peer_device, device))
 
 /*
  * function declarations
@@ -992,97 +1753,163 @@ static inline unsigned int device_to_minor(struct drbd_device *device)
 /* drbd_main.c */
 
 enum dds_flags {
-	DDSF_FORCED    = 1,
+	/* This enum is part of the wire protocol!
+	 * See P_SIZES, struct p_sizes; */
+	DDSF_ASSUME_UNCONNECTED_PEER_HAS_SPACE    = 1,
 	DDSF_NO_RESYNC = 2, /* Do not run a resync for the new space */
+	DDSF_IGNORE_PEER_CONSTRAINTS = 4, /* no longer used */
+	DDSF_2PC = 8, /* local only, not on the wire */
 };
+struct meta_data_on_disk_9;
 
-extern void drbd_init_set_defaults(struct drbd_device *device);
-extern int  drbd_thread_start(struct drbd_thread *thi);
-extern void _drbd_thread_stop(struct drbd_thread *thi, int restart, int wait);
+int drbd_thread_start(struct drbd_thread *thi);
+void _drbd_thread_stop(struct drbd_thread *thi, int restart, int wait);
 #ifdef CONFIG_SMP
-extern void drbd_thread_current_set_cpu(struct drbd_thread *thi);
+void drbd_thread_current_set_cpu(struct drbd_thread *thi);
 #else
 #define drbd_thread_current_set_cpu(A) ({})
 #endif
-extern void tl_release(struct drbd_connection *, unsigned int barrier_nr,
-		       unsigned int set_size);
-extern void tl_clear(struct drbd_connection *);
-extern void drbd_free_sock(struct drbd_connection *connection);
-extern int drbd_send(struct drbd_connection *connection, struct socket *sock,
-		     void *buf, size_t size, unsigned msg_flags);
-extern int drbd_send_all(struct drbd_connection *, struct socket *, void *, size_t,
-			 unsigned);
-
-extern int __drbd_send_protocol(struct drbd_connection *connection, enum drbd_packet cmd);
-extern int drbd_send_protocol(struct drbd_connection *connection);
-extern int drbd_send_uuids(struct drbd_peer_device *);
-extern int drbd_send_uuids_skip_initial_sync(struct drbd_peer_device *);
-extern void drbd_gen_and_send_sync_uuid(struct drbd_peer_device *);
-extern int drbd_send_sizes(struct drbd_peer_device *, int trigger_reply, enum dds_flags flags);
-extern int drbd_send_state(struct drbd_peer_device *, union drbd_state s);
-extern int drbd_send_current_state(struct drbd_peer_device *);
-extern int drbd_send_sync_param(struct drbd_peer_device *);
-extern void drbd_send_b_ack(struct drbd_connection *connection, u32 barrier_nr,
-			    u32 set_size);
-extern int drbd_send_ack(struct drbd_peer_device *, enum drbd_packet,
-			 struct drbd_peer_request *);
-extern void drbd_send_ack_rp(struct drbd_peer_device *, enum drbd_packet,
-			     struct p_block_req *rp);
-extern void drbd_send_ack_dp(struct drbd_peer_device *, enum drbd_packet,
-			     struct p_data *dp, int data_size);
-extern int drbd_send_ack_ex(struct drbd_peer_device *, enum drbd_packet,
-			    sector_t sector, int blksize, u64 block_id);
-extern int drbd_send_out_of_sync(struct drbd_peer_device *, struct drbd_request *);
-extern int drbd_send_block(struct drbd_peer_device *, enum drbd_packet,
-			   struct drbd_peer_request *);
-extern int drbd_send_dblock(struct drbd_peer_device *, struct drbd_request *req);
-extern int drbd_send_drequest(struct drbd_peer_device *, int cmd,
-			      sector_t sector, int size, u64 block_id);
-extern int drbd_send_drequest_csum(struct drbd_peer_device *, sector_t sector,
-				   int size, void *digest, int digest_size,
-				   enum drbd_packet cmd);
-extern int drbd_send_ov_request(struct drbd_peer_device *, sector_t sector, int size);
-
-extern int drbd_send_bitmap(struct drbd_device *device, struct drbd_peer_device *peer_device);
-extern void drbd_send_sr_reply(struct drbd_peer_device *, enum drbd_state_rv retcode);
-extern void conn_send_sr_reply(struct drbd_connection *connection, enum drbd_state_rv retcode);
-extern int drbd_send_rs_deallocated(struct drbd_peer_device *, struct drbd_peer_request *);
-extern void drbd_backing_dev_free(struct drbd_device *device, struct drbd_backing_dev *ldev);
-extern void drbd_device_cleanup(struct drbd_device *device);
-extern void drbd_print_uuids(struct drbd_device *device, const char *text);
-extern void drbd_queue_unplug(struct drbd_device *device);
-
-extern void conn_md_sync(struct drbd_connection *connection);
-extern void drbd_md_write(struct drbd_device *device, void *buffer);
-extern void drbd_md_sync(struct drbd_device *device);
-extern int  drbd_md_read(struct drbd_device *device, struct drbd_backing_dev *bdev);
-extern void drbd_uuid_set(struct drbd_device *device, int idx, u64 val) __must_hold(local);
-extern void _drbd_uuid_set(struct drbd_device *device, int idx, u64 val) __must_hold(local);
-extern void drbd_uuid_new_current(struct drbd_device *device) __must_hold(local);
-extern void drbd_uuid_set_bm(struct drbd_device *device, u64 val) __must_hold(local);
-extern void drbd_uuid_move_history(struct drbd_device *device) __must_hold(local);
-extern void __drbd_uuid_set(struct drbd_device *device, int idx, u64 val) __must_hold(local);
-extern void drbd_md_set_flag(struct drbd_device *device, int flags) __must_hold(local);
-extern void drbd_md_clear_flag(struct drbd_device *device, int flags)__must_hold(local);
-extern int drbd_md_test_flag(struct drbd_backing_dev *, int);
-extern void drbd_md_mark_dirty(struct drbd_device *device);
-extern void drbd_queue_bitmap_io(struct drbd_device *device,
-				 int (*io_fn)(struct drbd_device *, struct drbd_peer_device *),
-				 void (*done)(struct drbd_device *, int),
-				 char *why, enum bm_flag flags,
-				 struct drbd_peer_device *peer_device);
-extern int drbd_bitmap_io(struct drbd_device *device,
-		int (*io_fn)(struct drbd_device *, struct drbd_peer_device *),
-		char *why, enum bm_flag flags,
-		struct drbd_peer_device *peer_device);
-extern int drbd_bitmap_io_from_worker(struct drbd_device *device,
-		int (*io_fn)(struct drbd_device *, struct drbd_peer_device *),
-		char *why, enum bm_flag flags,
-		struct drbd_peer_device *peer_device);
-extern int drbd_bmio_set_n_write(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local);
-extern int drbd_bmio_clear_n_write(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local);
+int tl_release(struct drbd_connection *connection, uint64_t o_block_id,
+	       uint64_t y_block_id, unsigned int barrier_nr,
+	       unsigned int set_size);
+
+int __drbd_send_protocol(struct drbd_connection *connection,
+			 enum drbd_packet cmd);
+u64 drbd_collect_local_uuid_flags(struct drbd_peer_device *peer_device,
+				  u64 *authoritative_mask);
+u64 drbd_resolved_uuid(struct drbd_peer_device *peer_device_base,
+		       u64 *uuid_flags);
+int drbd_send_uuids(struct drbd_peer_device *peer_device, u64 uuid_flags,
+		    u64 node_mask);
+void drbd_gen_and_send_sync_uuid(struct drbd_peer_device *peer_device);
+int drbd_send_sizes(struct drbd_peer_device *peer_device,
+		    uint64_t u_size_diskless, enum dds_flags flags);
+int conn_send_state(struct drbd_connection *connection,
+		    union drbd_state state);
+int drbd_send_state(struct drbd_peer_device *peer_device,
+		    union drbd_state state);
+int drbd_send_current_state(struct drbd_peer_device *peer_device);
+int drbd_send_sync_param(struct drbd_peer_device *peer_device);
+int drbd_send_out_of_sync(struct drbd_peer_device *peer_device,
+			  sector_t sector, unsigned int size);
+int drbd_send_block(struct drbd_peer_device *peer_device,
+		    enum drbd_packet cmd, struct drbd_peer_request *peer_req);
+int drbd_send_dblock(struct drbd_peer_device *peer_device,
+		     struct drbd_request *req);
+int drbd_send_drequest(struct drbd_peer_device *peer_device, sector_t sector,
+		       int size, u64 block_id);
+int drbd_send_rs_request(struct drbd_peer_device *peer_device,
+			 enum drbd_packet cmd, sector_t sector, int size,
+			 u64 block_id, unsigned int dagtag_node_id,
+			 u64 dagtag);
+void *drbd_prepare_drequest_csum(struct drbd_peer_request *peer_req,
+				 enum drbd_packet cmd, int digest_size,
+				 unsigned int dagtag_node_id, u64 dagtag);
+
+int drbd_send_bitmap(struct drbd_device *device,
+		     struct drbd_peer_device *peer_device);
+int drbd_send_dagtag(struct drbd_connection *connection, u64 dagtag);
+void drbd_send_sr_reply(struct drbd_connection *connection, int vnr,
+			enum drbd_state_rv retcode);
+int drbd_send_rs_deallocated(struct drbd_peer_device *peer_device,
+			     struct drbd_peer_request *peer_req);
+void drbd_send_twopc_reply(struct drbd_connection *connection,
+			   enum drbd_packet cmd, struct twopc_reply *reply);
+void drbd_send_peers_in_sync(struct drbd_peer_device *peer_device, u64 mask,
+			     sector_t sector, int size);
+int drbd_send_peer_dagtag(struct drbd_connection *connection,
+			  struct drbd_connection *lost_peer);
+int drbd_send_flush_requests(struct drbd_connection *connection,
+			     u64 flush_sequence);
+int drbd_send_flush_forward(struct drbd_connection *connection,
+			    u64 flush_sequence, int initiator_node_id);
+int drbd_send_flush_requests_ack(struct drbd_connection *connection,
+				 u64 flush_sequence, int primary_node_id);
+int drbd_send_enable_replication_next(struct drbd_peer_device *peer_device);
+int drbd_send_enable_replication(struct drbd_peer_device *peer_device, bool enable);
+int drbd_send_current_uuid(struct drbd_peer_device *peer_device,
+			   u64 current_uuid, u64 weak_nodes);
+void drbd_backing_dev_free(struct drbd_device *device,
+			   struct drbd_backing_dev *ldev);
+void drbd_print_uuids(struct drbd_peer_device *peer_device, const char *text);
+void drbd_queue_unplug(struct drbd_device *device);
+
+u64 drbd_capacity_to_on_disk_bm_sect(u64 capacity_sect, const struct drbd_md *md);
+void drbd_md_set_sector_offsets(struct drbd_backing_dev *bdev);
+int drbd_md_write(struct drbd_device *device,
+		  struct meta_data_on_disk_9 *buffer);
+int drbd_md_sync(struct drbd_device *device);
+int drbd_md_sync_if_dirty(struct drbd_device *device);
+void drbd_uuid_received_new_current(struct drbd_peer_device *from_pd, u64 val,
+				    u64 weak_nodes);
+void drbd_uuid_set_bitmap(struct drbd_peer_device *peer_device, u64 uuid);
+void _drbd_uuid_set_bitmap(struct drbd_peer_device *peer_device, u64 val);
+void _drbd_uuid_set_current(struct drbd_device *device, u64 val);
+void drbd_uuid_new_current(struct drbd_device *device, bool forced);
+void drbd_uuid_new_current_by_user(struct drbd_device *device);
+void _drbd_uuid_push_history(struct drbd_device *device, u64 val);
+u64 _drbd_uuid_pull_history(struct drbd_peer_device *peer_device);
+void drbd_uuid_resync_starting(struct drbd_peer_device *peer_device);
+u64 drbd_uuid_resync_finished(struct drbd_peer_device *peer_device);
+void drbd_uuid_detect_finished_resyncs(struct drbd_peer_device *peer_device);
+bool drbd_uuid_set_exposed(struct drbd_device *device, u64 val, bool log);
+u64 drbd_weak_nodes_device(struct drbd_device *device);
+bool drbd_uuid_is_day0(struct drbd_device *device);
+int drbd_md_test_flag(struct drbd_backing_dev *bdev, enum mdf_flag flag);
+void drbd_md_set_peer_flag(struct drbd_peer_device *peer_device,
+			   enum mdf_peer_flag flag);
+void drbd_md_clear_peer_flag(struct drbd_peer_device *peer_device,
+			     enum mdf_peer_flag flag);
+bool drbd_md_test_peer_flag(struct drbd_peer_device *peer_device,
+			    enum mdf_peer_flag flag);
+void drbd_md_mark_dirty(struct drbd_device *device);
+void drbd_queue_bitmap_io(struct drbd_device *device,
+			  int (*io_fn)(struct drbd_device *device,
+				       struct drbd_peer_device *peer_device),
+			  void (*done)(struct drbd_device *device,
+				       struct drbd_peer_device *peer_device,
+				       int rv),
+			  char *why, enum bm_flag flags,
+			  struct drbd_peer_device *peer_device);
+int drbd_bitmap_io(struct drbd_device *device,
+		   int (*io_fn)(struct drbd_device *, struct drbd_peer_device *),
+		   char *why, enum bm_flag flags,
+		   struct drbd_peer_device *peer_device);
+int drbd_bitmap_io_from_worker(struct drbd_device *device,
+			       int (*io_fn)(struct drbd_device *, struct drbd_peer_device *),
+			       char *why, enum bm_flag flags,
+			       struct drbd_peer_device *peer_device);
+int drbd_bmio_set_n_write(struct drbd_device *device,
+			  struct drbd_peer_device *peer_device);
+int drbd_bmio_clear_all_n_write(struct drbd_device *device,
+				struct drbd_peer_device *peer_device);
+int drbd_bmio_set_all_n_write(struct drbd_device *device,
+			      struct drbd_peer_device *peer_device);
+int drbd_bmio_set_allocated_n_write(struct drbd_device *device,
+				    struct drbd_peer_device *peer_device);
+int drbd_bmio_clear_one_peer(struct drbd_device *device,
+			     struct drbd_peer_device *peer_device);
+bool drbd_device_stable(struct drbd_device *device, u64 *authoritative_ptr);
+void drbd_flush_peer_acks(struct drbd_resource *resource);
+void drbd_cork(struct drbd_connection *connection, enum drbd_stream stream);
+int drbd_uncork(struct drbd_connection *connection, enum drbd_stream stream);
+void drbd_open_counts(struct drbd_resource *resource, int *rw_count_ptr,
+		      int *ro_count_ptr);
+
+struct drbd_connection *
+__drbd_next_connection_ref(u64 *visited, struct drbd_connection *connection,
+			   struct drbd_resource *resource);
+
+struct drbd_peer_device *
+__drbd_next_peer_device_ref(u64 *visited,
+			    struct drbd_peer_device *peer_device,
+			    struct drbd_device *device);
+
+void tl_abort_disk_io(struct drbd_device *device);
+
+sector_t drbd_get_max_capacity(struct drbd_device *device,
+			       struct drbd_backing_dev *bdev, bool warn);
+sector_t drbd_partition_data_capacity(struct drbd_device *device);
 
 /* Meta data layout
  *
@@ -1114,59 +1941,10 @@ extern int drbd_bmio_clear_n_write(struct drbd_device *device,
  *  but is about to become configurable.
  */
 
-/* Our old fixed size meta data layout
- * allows up to about 3.8TB, so if you want more,
- * you need to use the "flexible" meta data format. */
-#define MD_128MB_SECT (128LLU << 11)  /* 128 MB, unit sectors */
-#define MD_4kB_SECT	 8
-#define MD_32kB_SECT	64
-
 /* One activity log extent represents 4M of storage */
 #define AL_EXTENT_SHIFT 22
 #define AL_EXTENT_SIZE (1<<AL_EXTENT_SHIFT)
 
-/* We could make these currently hardcoded constants configurable
- * variables at create-md time (or even re-configurable at runtime?).
- * Which will require some more changes to the DRBD "super block"
- * and attach code.
- *
- * updates per transaction:
- *   This many changes to the active set can be logged with one transaction.
- *   This number is arbitrary.
- * context per transaction:
- *   This many context extent numbers are logged with each transaction.
- *   This number is resulting from the transaction block size (4k), the layout
- *   of the transaction header, and the number of updates per transaction.
- *   See drbd_actlog.c:struct al_transaction_on_disk
- * */
-#define AL_UPDATES_PER_TRANSACTION	 64	// arbitrary
-#define AL_CONTEXT_PER_TRANSACTION	919	// (4096 - 36 - 6*64)/4
-
-#if BITS_PER_LONG == 32
-#define LN2_BPL 5
-#define cpu_to_lel(A) cpu_to_le32(A)
-#define lel_to_cpu(A) le32_to_cpu(A)
-#elif BITS_PER_LONG == 64
-#define LN2_BPL 6
-#define cpu_to_lel(A) cpu_to_le64(A)
-#define lel_to_cpu(A) le64_to_cpu(A)
-#else
-#error "LN2 of BITS_PER_LONG unknown!"
-#endif
-
-/* resync bitmap */
-/* 16MB sized 'bitmap extent' to track syncer usage */
-struct bm_extent {
-	int rs_left; /* number of bits set (out of sync) in this extent. */
-	int rs_failed; /* number of failed resync requests in this extent. */
-	unsigned long flags;
-	struct lc_element lce;
-};
-
-#define BME_NO_WRITES  0  /* bm_extent.flags: no more requests on this one! */
-#define BME_LOCKED     1  /* bm_extent.flags: syncer active on this one. */
-#define BME_PRIORITY   2  /* finish resync IO on this extent ASAP! App IO waiting! */
-
 /* drbd_bitmap.c */
 /*
  * We need to store one bit for a block.
@@ -1175,94 +1953,87 @@ struct bm_extent {
  * Bit 1 ==> local node thinks this block needs to be synced.
  */
 
-#define SLEEP_TIME (HZ/10)
+#define RS_MAKE_REQS_INTV    (HZ/10)
+#define RS_MAKE_REQS_INTV_NS (NSEC_PER_SEC/10)
 
-/* We do bitmap IO in units of 4k blocks.
- * We also still have a hardcoded 4k per bit relation. */
-#define BM_BLOCK_SHIFT	12			 /* 4k per bit */
-#define BM_BLOCK_SIZE	 (1<<BM_BLOCK_SHIFT)
-/* mostly arbitrarily set the represented size of one bitmap extent,
- * aka resync extent, to 16 MiB (which is also 512 Byte worth of bitmap
- * at 4k per bit resolution) */
-#define BM_EXT_SHIFT	 24	/* 16 MiB per resync extent */
-#define BM_EXT_SIZE	 (1<<BM_EXT_SHIFT)
-
-#if (BM_EXT_SHIFT != 24) || (BM_BLOCK_SHIFT != 12)
-#error "HAVE YOU FIXED drbdmeta AS WELL??"
-#endif
-
-/* thus many _storage_ sectors are described by one bit */
-#define BM_SECT_TO_BIT(x)   ((x)>>(BM_BLOCK_SHIFT-9))
-#define BM_BIT_TO_SECT(x)   ((sector_t)(x)<<(BM_BLOCK_SHIFT-9))
-#define BM_SECT_PER_BIT     BM_BIT_TO_SECT(1)
-
-/* bit to represented kilo byte conversion */
-#define Bit2KB(bits) ((bits)<<(BM_BLOCK_SHIFT-10))
-
-/* in which _bitmap_ extent (resp. sector) the bit for a certain
- * _storage_ sector is located in */
-#define BM_SECT_TO_EXT(x)   ((x)>>(BM_EXT_SHIFT-9))
-#define BM_BIT_TO_EXT(x)    ((x) >> (BM_EXT_SHIFT - BM_BLOCK_SHIFT))
-
-/* first storage sector a bitmap extent corresponds to */
-#define BM_EXT_TO_SECT(x)   ((sector_t)(x) << (BM_EXT_SHIFT-9))
-/* how much _storage_ sectors we have per bitmap extent */
-#define BM_SECT_PER_EXT     BM_EXT_TO_SECT(1)
-/* how many bits are covered by one bitmap extent (resync extent) */
-#define BM_BITS_PER_EXT     (1UL << (BM_EXT_SHIFT - BM_BLOCK_SHIFT))
-
-#define BM_BLOCKS_PER_BM_EXT_MASK  (BM_BITS_PER_EXT - 1)
+#define LEGACY_BM_EXT_SHIFT	 27	/* 128 MiB per resync extent */
+#define LEGACY_BM_EXT_SECT_MASK ((1UL << (LEGACY_BM_EXT_SHIFT - SECTOR_SHIFT)) - 1)
 
+static inline unsigned int bm_block_size(const struct drbd_bitmap *bm)
+{
+	return 1 << bm->bm_block_shift;
+}
+static inline sector_t bm_bit_to_kb(const struct drbd_bitmap *bm, unsigned long bit)
+{
+	return (sector_t)bit << (bm->bm_block_shift - 10);
+}
+static inline unsigned long bm_sect_to_bit(const struct drbd_bitmap *bm, sector_t s)
+{
+	return s >> (bm->bm_block_shift - 9);
+}
+static inline sector_t bm_bit_to_sect(const struct drbd_bitmap *bm, unsigned long bit)
+{
+	return (sector_t)bit << (bm->bm_block_shift - 9);
+}
+static inline sector_t bm_sect_per_bit(const struct drbd_bitmap *bm)
+{
+	return (sector_t)1 << (bm->bm_block_shift - 9);
+}
 
-/* in one sector of the bitmap, we have this many activity_log extents. */
-#define AL_EXT_PER_BM_SECT  (1 << (BM_EXT_SHIFT - AL_EXTENT_SHIFT))
+static inline sector_t bit_to_kb(unsigned long bit, unsigned int bm_block_shift)
+{
+	return (sector_t)bit << (bm_block_shift - 10);
+}
+static inline unsigned long sect_to_bit(sector_t s, unsigned int bm_block_shift)
+{
+	return s >> (bm_block_shift - 9);
+}
+static inline sector_t bit_to_sect(unsigned long bit, unsigned int bm_block_shift)
+{
+	return (sector_t)bit << (bm_block_shift - 9);
+}
+static inline sector_t sect_per_bit(unsigned int bm_block_shift)
+{
+	return (sector_t)1 << (bm_block_shift - 9);
+}
 
-/* the extent in "PER_EXTENT" below is an activity log extent
- * we need that many (long words/bytes) to store the bitmap
- *		     of one AL_EXTENT_SIZE chunk of storage.
- * we can store the bitmap for that many AL_EXTENTS within
- * one sector of the _on_disk_ bitmap:
- * bit	 0	  bit 37   bit 38	     bit (512*8)-1
- *	     ...|........|........|.. // ..|........|
- * sect. 0	 `296	  `304			   ^(512*8*8)-1
- *
-#define BM_WORDS_PER_EXT    ( (AL_EXT_SIZE/BM_BLOCK_SIZE) / BITS_PER_LONG )
-#define BM_BYTES_PER_EXT    ( (AL_EXT_SIZE/BM_BLOCK_SIZE) / 8 )  // 128
-#define BM_EXT_PER_SECT	    ( 512 / BM_BYTES_PER_EXTENT )	 //   4
+/* We may have just lost our backing device, and with it ->ldev and ->bitmap.
+ * But we can still report sync progress and similar based on our last known
+ * bitmap block size.
  */
+static inline sector_t device_bit_to_kb(struct drbd_device *device, unsigned long bit)
+{
+	return bit_to_kb(bit, device->last_bm_block_shift);
+}
 
-#define DRBD_MAX_SECTORS_32 (0xffffffffLU)
-/* we have a certain meta data variant that has a fixed on-disk size of 128
- * MiB, of which 4k are our "superblock", and 32k are the fixed size activity
+/* Send P_PEERS_IN_SYNC in steps defined by this shift. Set to the activity log
+ * extent shift since the P_PEERS_IN_SYNC intervals are broken up based on
+ * activity log extents anyway. */
+#define PEERS_IN_SYNC_STEP_SHIFT AL_EXTENT_SHIFT
+#define PEERS_IN_SYNC_STEP_SECT      (1UL << (PEERS_IN_SYNC_STEP_SHIFT - SECTOR_SHIFT))
+#define PEERS_IN_SYNC_STEP_SECT_MASK (PEERS_IN_SYNC_STEP_SECT - 1)
+
+/* Indexed external meta data has a fixed on-disk size of 128MiB, of which
+ * 4KiB are our "superblock", and 32KiB are the fixed size activity
  * log, leaving this many sectors for the bitmap.
  */
+#define DRBD_BM_SECTORS_INDEXED \
+	  (((128 << 20) - (32 << 10) - (4 << 10)) >> SECTOR_SHIFT)
 
-#define DRBD_MAX_SECTORS_FIXED_BM \
-	  ((MD_128MB_SECT - MD_32kB_SECT - MD_4kB_SECT) * (1LL<<(BM_EXT_SHIFT-9)))
-#define DRBD_MAX_SECTORS      DRBD_MAX_SECTORS_FIXED_BM
-/* 16 TB in units of sectors */
 #if BITS_PER_LONG == 32
-/* adjust by one page worth of bitmap,
- * so we won't wrap around in drbd_bm_find_next_bit.
- * you should use 64bit OS for that much storage, anyways. */
-#define DRBD_MAX_SECTORS_FLEX BM_BIT_TO_SECT(0xffff7fff)
+#if !defined(CONFIG_LBDAF) && !defined(CONFIG_LBD)
+#define DRBD_MAX_SECTORS (0xffffffffLU)
 #else
-/* we allow up to 1 PiB now on 64bit architecture with "flexible" meta data */
-#define DRBD_MAX_SECTORS_FLEX (1UL << 51)
-/* corresponds to (1UL << 38) bits right now. */
+/* With large block device support, the size is limited by the fact that we
+ * want to be able to address bitmap bits with a long. Additionally adjust by
+ * one page worth of bitmap, so we don't wrap around when iterating. */
+#define DRBD_MAX_SECTORS BM_BIT_TO_SECT(0xffff7fff)
 #endif
-
-/* Estimate max bio size as 256 * PAGE_SIZE,
- * so for typical PAGE_SIZE of 4k, that is (1<<20) Byte.
- * Since we may live in a mixed-platform cluster,
- * we limit us to a platform agnostic constant here for now.
- * A followup commit may allow even bigger BIO sizes,
- * once we thought that through. */
-#define DRBD_MAX_BIO_SIZE (1U << 20)
-#if DRBD_MAX_BIO_SIZE > (BIO_MAX_VECS << PAGE_SHIFT)
-#error Architecture not supported: DRBD_MAX_BIO_SIZE > BIO_MAX_SIZE
+#else
+/* We allow up to 1 PiB on 64 bit architectures as long as our meta data
+ * is large enough. */
+#define DRBD_MAX_SECTORS (1UL << (50 - SECTOR_SHIFT))
 #endif
-#define DRBD_MAX_BIO_SIZE_SAFE (1U << 12)       /* Works always = 4k */
 
 #define DRBD_MAX_SIZE_H80_PACKET (1U << 15) /* Header 80 only allows packets up to 32KiB data */
 #define DRBD_MAX_BIO_SIZE_P95    (1U << 17) /* Protocol 95 to 99 allows bios up to 128KiB */
@@ -1273,61 +2044,91 @@ struct bm_extent {
 #define DRBD_MAX_BATCH_BIO_SIZE	 (AL_UPDATES_PER_TRANSACTION/2*AL_EXTENT_SIZE)
 #define DRBD_MAX_BBIO_SECTORS    (DRBD_MAX_BATCH_BIO_SIZE >> 9)
 
-extern int  drbd_bm_init(struct drbd_device *device);
-extern int  drbd_bm_resize(struct drbd_device *device, sector_t sectors, int set_new_bits);
-extern void drbd_bm_cleanup(struct drbd_device *device);
-extern void drbd_bm_set_all(struct drbd_device *device);
-extern void drbd_bm_clear_all(struct drbd_device *device);
+/* This gets ignored if the backing device has a larger discard granularity */
+#define DRBD_MAX_RS_DISCARD_SIZE (1U << 27) /* 128MiB; arbitrary */
+
+/* how many activity log extents are touched by this interval? */
+static inline int interval_to_al_extents(struct drbd_interval *i)
+{
+	unsigned int first = i->sector >> (AL_EXTENT_SHIFT-9);
+	unsigned int last = i->size == 0 ? first : (i->sector + (i->size >> 9) - 1) >> (AL_EXTENT_SHIFT-9);
+	return 1 + last - first; /* worst case: all touched extends are cold. */
+}
+
+struct drbd_bitmap *drbd_bm_alloc(unsigned int max_peers, unsigned int bm_block_shift);
+int  drbd_bm_resize(struct drbd_device *device, sector_t capacity,
+		    bool set_new_bits);
+void drbd_bm_free(struct drbd_device *device);
+void drbd_bm_set_all(struct drbd_device *device);
+void drbd_bm_clear_all(struct drbd_device *device);
 /* set/clear/test only a few bits at a time */
-extern int  drbd_bm_set_bits(
-		struct drbd_device *device, unsigned long s, unsigned long e);
-extern int  drbd_bm_clear_bits(
-		struct drbd_device *device, unsigned long s, unsigned long e);
-extern int drbd_bm_count_bits(
-	struct drbd_device *device, const unsigned long s, const unsigned long e);
+unsigned int drbd_bm_set_bits(struct drbd_device *device,
+			      unsigned int bitmap_index, unsigned long start,
+			      unsigned long end);
+unsigned int drbd_bm_clear_bits(struct drbd_device *device,
+				unsigned int bitmap_index,
+				unsigned long start, unsigned long end);
+int drbd_bm_count_bits(struct drbd_device *device, unsigned int bitmap_index,
+		       unsigned long s, unsigned long e);
 /* bm_set_bits variant for use while holding drbd_bm_lock,
  * may process the whole bitmap in one go */
-extern void _drbd_bm_set_bits(struct drbd_device *device,
-		const unsigned long s, const unsigned long e);
-extern int  drbd_bm_test_bit(struct drbd_device *device, unsigned long bitnr);
-extern int  drbd_bm_e_weight(struct drbd_device *device, unsigned long enr);
-extern int  drbd_bm_read(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local);
-extern void drbd_bm_mark_for_writeout(struct drbd_device *device, int page_nr);
-extern int  drbd_bm_write(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local);
-extern void drbd_bm_reset_al_hints(struct drbd_device *device) __must_hold(local);
-extern int  drbd_bm_write_hinted(struct drbd_device *device) __must_hold(local);
-extern int  drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_hold(local);
-extern int drbd_bm_write_all(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local);
-extern int  drbd_bm_write_copy_pages(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local);
-extern size_t	     drbd_bm_words(struct drbd_device *device);
-extern unsigned long drbd_bm_bits(struct drbd_device *device);
-extern sector_t      drbd_bm_capacity(struct drbd_device *device);
+void drbd_bm_set_many_bits(struct drbd_peer_device *peer_device,
+			   unsigned long start, unsigned long end);
+void drbd_bm_clear_many_bits(struct drbd_peer_device *peer_device,
+			     unsigned long start, unsigned long end);
+void _drbd_bm_clear_many_bits(struct drbd_device *device, int bitmap_index,
+			      unsigned long start, unsigned long end);
+void _drbd_bm_set_many_bits(struct drbd_device *device, int bitmap_index,
+			    unsigned long start, unsigned long end);
+int  drbd_bm_read(struct drbd_device *device,
+		  struct drbd_peer_device *peer_device);
+void drbd_bm_reset_al_hints(struct drbd_device *device);
+void drbd_bm_mark_range_for_writeout(struct drbd_device *device,
+				     unsigned long start, unsigned long end);
+int  drbd_bm_write(struct drbd_device *device,
+		   struct drbd_peer_device *peer_device);
+int  drbd_bm_write_hinted(struct drbd_device *device);
+int  drbd_bm_write_lazy(struct drbd_device *device, unsigned int upper_idx);
+int drbd_bm_write_all(struct drbd_device *device,
+		      struct drbd_peer_device *peer_device);
+int drbd_bm_write_copy_pages(struct drbd_device *device,
+			     struct drbd_peer_device *peer_device);
+size_t	     drbd_bm_words(struct drbd_device *device);
+unsigned long drbd_bm_bits(struct drbd_device *device);
+unsigned long drbd_bm_bits_4k(struct drbd_device *device);
+sector_t      drbd_bm_capacity(struct drbd_device *device);
 
 #define DRBD_END_OF_BITMAP	(~(unsigned long)0)
-extern unsigned long drbd_bm_find_next(struct drbd_device *device, unsigned long bm_fo);
+unsigned long drbd_bm_find_next(struct drbd_peer_device *peer_device,
+				unsigned long start);
 /* bm_find_next variants for use while you hold drbd_bm_lock() */
-extern unsigned long _drbd_bm_find_next(struct drbd_device *device, unsigned long bm_fo);
-extern unsigned long _drbd_bm_find_next_zero(struct drbd_device *device, unsigned long bm_fo);
-extern unsigned long _drbd_bm_total_weight(struct drbd_device *device);
-extern unsigned long drbd_bm_total_weight(struct drbd_device *device);
+unsigned long _drbd_bm_find_next(struct drbd_peer_device *peer_device,
+				 unsigned long start);
+unsigned long _drbd_bm_find_next_zero(struct drbd_peer_device *peer_device,
+				      unsigned long start);
+unsigned long _drbd_bm_total_weight(struct drbd_device *device,
+				    int bitmap_index);
+unsigned long drbd_bm_total_weight(struct drbd_peer_device *peer_device);
 /* for receive_bitmap */
-extern void drbd_bm_merge_lel(struct drbd_device *device, size_t offset,
-		size_t number, unsigned long *buffer);
+void drbd_bm_merge_lel(struct drbd_peer_device *peer_device, size_t offset,
+		       size_t number, unsigned long *buffer);
 /* for _drbd_send_bitmap */
-extern void drbd_bm_get_lel(struct drbd_device *device, size_t offset,
-		size_t number, unsigned long *buffer);
-
-extern void drbd_bm_lock(struct drbd_device *device, char *why, enum bm_flag flags);
-extern void drbd_bm_unlock(struct drbd_device *device);
+void drbd_bm_get_lel(struct drbd_peer_device *peer_device, size_t offset,
+		     size_t number, unsigned long *buffer);
+
+void drbd_bm_lock(struct drbd_device *device, const char *why,
+		  enum bm_flag flags);
+void drbd_bm_unlock(struct drbd_device *device);
+void drbd_bm_slot_lock(struct drbd_peer_device *peer_device, char *why,
+		       enum bm_flag flags);
+void drbd_bm_slot_unlock(struct drbd_peer_device *peer_device);
+void drbd_bm_copy_slot(struct drbd_device *device, unsigned int from_index,
+		       unsigned int to_index);
 /* drbd_main.c */
 
+extern struct workqueue_struct *ping_ack_sender;
 extern struct kmem_cache *drbd_request_cache;
 extern struct kmem_cache *drbd_ee_cache;	/* peer requests */
-extern struct kmem_cache *drbd_bm_ext_cache;	/* bitmap extents */
 extern struct kmem_cache *drbd_al_ext_cache;	/* activity log extents */
 extern mempool_t drbd_request_mempool;
 extern mempool_t drbd_ee_mempool;
@@ -1348,38 +2149,69 @@ extern struct bio_set drbd_md_io_bio_set;
 /* And a bio_set for cloning */
 extern struct bio_set drbd_io_bio_set;
 
-extern struct mutex resources_mutex;
-
-extern enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsigned int minor);
-extern void drbd_destroy_device(struct kref *kref);
-extern void drbd_delete_device(struct drbd_device *device);
-
-extern struct drbd_resource *drbd_create_resource(const char *name);
-extern void drbd_free_resource(struct drbd_resource *resource);
-
-extern int set_resource_options(struct drbd_resource *resource, struct res_opts *res_opts);
-extern struct drbd_connection *conn_create(const char *name, struct res_opts *res_opts);
-extern void drbd_destroy_connection(struct kref *kref);
-extern struct drbd_connection *conn_get_by_addrs(void *my_addr, int my_addr_len,
-					    void *peer_addr, int peer_addr_len);
-extern struct drbd_resource *drbd_find_resource(const char *name);
-extern void drbd_destroy_resource(struct kref *kref);
-extern void conn_free_crypto(struct drbd_connection *connection);
+struct drbd_peer_device *create_peer_device(struct drbd_device *device,
+					    struct drbd_connection *connection);
+enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx,
+				      unsigned int minor,
+				      struct device_conf *device_conf,
+				      struct drbd_device **p_device);
+void drbd_unregister_device(struct drbd_device *device);
+void drbd_reclaim_device(struct rcu_head *rp);
+void drbd_unregister_connection(struct drbd_connection *connection);
+void drbd_reclaim_connection(struct rcu_head *rp);
+void drbd_reclaim_path(struct rcu_head *rp);
+void del_connect_timer(struct drbd_connection *connection);
+
+struct drbd_resource *drbd_create_resource(const char *name,
+					   struct res_opts *res_opts);
+void drbd_reclaim_resource(struct rcu_head *rp);
+struct drbd_resource *drbd_find_resource(const char *name);
+void drbd_destroy_resource(struct kref *kref);
+
+void drbd_destroy_device(struct kref *kref);
+
+int set_resource_options(struct drbd_resource *resource,
+			 struct res_opts *res_opts, const char *tag);
+struct drbd_connection *drbd_create_connection(struct drbd_resource *resource,
+					       struct drbd_transport_class *tc);
+void drbd_transport_shutdown(struct drbd_connection *connection,
+			     enum drbd_tr_free_op op);
+void drbd_destroy_connection(struct kref *kref);
+void conn_free_crypto(struct drbd_connection *connection);
 
 /* drbd_req */
-extern void do_submit(struct work_struct *ws);
-extern void __drbd_make_request(struct drbd_device *, struct bio *);
+void drbd_do_submit_conflict(struct work_struct *ws);
+void do_submit(struct work_struct *ws);
+#ifndef CONFIG_DRBD_TIMING_STATS
+#define __drbd_make_request(d, b, k, j) __drbd_make_request(d, b, j)
+#endif
+void __drbd_make_request(struct drbd_device *device, struct bio *bio,
+			 ktime_t start_kt, unsigned long start_jif);
 void drbd_submit_bio(struct bio *bio);
 
-/* drbd_nl.c */
-
-extern struct mutex notification_mutex;
+enum drbd_force_detach_flags {
+	DRBD_READ_ERROR,
+	DRBD_WRITE_ERROR,
+	DRBD_META_IO_ERROR,
+	DRBD_FORCE_DETACH,
+};
+#define drbd_handle_io_error(m, f) drbd_handle_io_error_(m, f,  __func__)
+void drbd_handle_io_error_(struct drbd_device *device,
+			   enum drbd_force_detach_flags df, const char *where);
 
-extern void drbd_suspend_io(struct drbd_device *device);
-extern void drbd_resume_io(struct drbd_device *device);
-extern char *ppsize(char *buf, unsigned long long size);
-extern sector_t drbd_new_dev_size(struct drbd_device *, struct drbd_backing_dev *, sector_t, int);
+/* drbd_nl.c */
+enum suspend_scope {
+	READ_AND_WRITE,
+	WRITE_ONLY
+};
+void drbd_suspend_io(struct drbd_device *device, enum suspend_scope ss);
+void drbd_resume_io(struct drbd_device *device);
+char *ppsize(char *buf, unsigned long long size);
+sector_t drbd_new_dev_size(struct drbd_device *device, sector_t current_size,
+			   sector_t user_capped_size, enum dds_flags flags);
 enum determine_dev_size {
+	DS_2PC_ERR = -5,
+	DS_2PC_NOT_SUPPORTED = -4,
 	DS_ERROR_SHRINK = -3,
 	DS_ERROR_SPACE_MD = -2,
 	DS_ERROR = -1,
@@ -1388,96 +2220,225 @@ enum determine_dev_size {
 	DS_GREW = 2,
 	DS_GREW_FROM_ZERO = 3,
 };
-extern enum determine_dev_size
-drbd_determine_dev_size(struct drbd_device *, enum dds_flags, struct resize_parms *) __must_hold(local);
-extern void resync_after_online_grow(struct drbd_device *);
-extern void drbd_reconsider_queue_parameters(struct drbd_device *device,
-			struct drbd_backing_dev *bdev, struct o_qlim *o);
-extern enum drbd_state_rv drbd_set_role(struct drbd_device *device,
-					enum drbd_role new_role,
-					int force);
-extern bool conn_try_outdate_peer(struct drbd_connection *connection);
-extern void conn_try_outdate_peer_async(struct drbd_connection *connection);
-extern enum drbd_peer_state conn_khelper(struct drbd_connection *connection, char *cmd);
-extern int drbd_khelper(struct drbd_device *device, char *cmd);
-
-/* drbd_worker.c */
-/* bi_end_io handlers */
-extern void drbd_md_endio(struct bio *bio);
-extern void drbd_peer_request_endio(struct bio *bio);
-extern void drbd_request_endio(struct bio *bio);
-extern int drbd_worker(struct drbd_thread *thi);
+enum determine_dev_size
+drbd_determine_dev_size(struct drbd_device *device,
+			sector_t peer_current_size, enum dds_flags flags,
+			struct resize_parms *rs);
+void resync_after_online_grow(struct drbd_peer_device *peer_device);
+void drbd_reconsider_queue_parameters(struct drbd_device *device,
+				      struct drbd_backing_dev *bdev);
+bool barrier_pending(struct drbd_resource *resource);
+enum drbd_state_rv
+drbd_set_role(struct drbd_resource *resource, enum drbd_role role, bool force,
+	      const char *tag, struct sk_buff *reply_skb);
+void conn_try_outdate_peer_async(struct drbd_connection *connection);
+int drbd_maybe_khelper(struct drbd_device *device,
+		       struct drbd_connection *connection, char *cmd);
+int drbd_create_peer_device_default_config(struct drbd_peer_device *peer_device);
+int drbd_unallocated_index(struct drbd_backing_dev *bdev);
+void youngest_and_oldest_opener_to_str(struct drbd_device *device, char *buf,
+				       size_t len);
+int param_set_drbd_strict_names(const char *val,
+				const struct kernel_param *kp);
+void drbd_enable_netns(void);
+
+/* drbd_sender.c */
+int drbd_sender(struct drbd_thread *thi);
+int drbd_worker(struct drbd_thread *thi);
 enum drbd_ret_code drbd_resync_after_valid(struct drbd_device *device, int o_minor);
 void drbd_resync_after_changed(struct drbd_device *device);
-extern void drbd_start_resync(struct drbd_device *device, enum drbd_conns side);
-extern void resume_next_sg(struct drbd_device *device);
-extern void suspend_other_sg(struct drbd_device *device);
-extern int drbd_resync_finished(struct drbd_peer_device *peer_device);
+bool drbd_stable_sync_source_present(struct drbd_peer_device *except_peer_device,
+				     enum which_state which);
+void drbd_start_resync(struct drbd_peer_device *peer_device,
+		       enum drbd_repl_state side, const char *tag);
+void resume_next_sg(struct drbd_device *device);
+void suspend_other_sg(struct drbd_device *device);
+void drbd_resync_finished(struct drbd_peer_device *peer_device,
+			  enum drbd_disk_state new_peer_disk_state);
+void verify_progress(struct drbd_peer_device *peer_device,
+		     const sector_t sector, const unsigned int size);
 /* maybe rather drbd_main.c ? */
-extern void *drbd_md_get_buffer(struct drbd_device *device, const char *intent);
-extern void drbd_md_put_buffer(struct drbd_device *device);
-extern int drbd_md_sync_page_io(struct drbd_device *device,
-		struct drbd_backing_dev *bdev, sector_t sector, enum req_op op);
-extern void drbd_ov_out_of_sync_found(struct drbd_peer_device *peer_device,
-		sector_t sector, int size);
-extern void wait_until_done_or_force_detached(struct drbd_device *device,
-		struct drbd_backing_dev *bdev, unsigned int *done);
-extern void drbd_rs_controller_reset(struct drbd_peer_device *peer_device);
+void *drbd_md_get_buffer(struct drbd_device *device, const char *intent);
+void drbd_md_put_buffer(struct drbd_device *device);
+int drbd_md_sync_page_io(struct drbd_device *device,
+			 struct drbd_backing_dev *bdev, sector_t sector,
+			 enum req_op op);
+bool drbd_al_active(struct drbd_device *device, sector_t sector,
+		    unsigned int size);
+void drbd_ov_out_of_sync_found(struct drbd_peer_device *peer_device,
+			       sector_t sector, int size);
+void wait_until_done_or_force_detached(struct drbd_device *device,
+				       struct drbd_backing_dev *bdev,
+				       unsigned int *done);
+void drbd_rs_controller_reset(struct drbd_peer_device *peer_device);
+void drbd_rs_all_in_flight_came_back(struct drbd_peer_device *peer_device,
+				     int rs_sect_in);
+void drbd_check_peers(struct drbd_resource *resource);
+void drbd_check_peers_new_current_uuid(struct drbd_device *device);
+void drbd_conflict_send_resync_request(struct drbd_peer_request *peer_req);
+void drbd_ping_peer(struct drbd_connection *connection);
+struct drbd_peer_device *peer_device_by_node_id(struct drbd_device *device,
+						int node_id);
+void drbd_update_mdf_al_disabled(struct drbd_device *device,
+				 enum which_state which);
 
 static inline void ov_out_of_sync_print(struct drbd_peer_device *peer_device)
 {
-	struct drbd_device *device = peer_device->device;
-
-	if (device->ov_last_oos_size) {
+	if (peer_device->ov_last_oos_size) {
 		drbd_err(peer_device, "Out of sync: start=%llu, size=%lu (sectors)\n",
-		     (unsigned long long)device->ov_last_oos_start,
-		     (unsigned long)device->ov_last_oos_size);
+		     (unsigned long long)peer_device->ov_last_oos_start,
+		     (unsigned long)peer_device->ov_last_oos_size);
 	}
-	device->ov_last_oos_size = 0;
+	peer_device->ov_last_oos_size = 0;
 }
 
+static inline void ov_skipped_print(struct drbd_peer_device *peer_device)
+{
+	if (peer_device->ov_last_skipped_size) {
+		drbd_info(peer_device, "Skipped verify, too busy: start=%llu, size=%lu (sectors)\n",
+		     (unsigned long long)peer_device->ov_last_skipped_start,
+		     (unsigned long)peer_device->ov_last_skipped_size);
+	}
+	peer_device->ov_last_skipped_size = 0;
+}
+
+void drbd_csum_bios(struct crypto_shash *tfm, struct bio_list *bios, void *digest);
+void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest);
+void drbd_resync_read_req_mod(struct drbd_peer_request *peer_req,
+			      enum drbd_interval_flags bit_to_set);
 
-extern void drbd_csum_bio(struct crypto_shash *, struct bio *, void *);
-extern void drbd_csum_ee(struct crypto_shash *, struct drbd_peer_request *,
-			 void *);
 /* worker callbacks */
-extern int w_e_end_data_req(struct drbd_work *, int);
-extern int w_e_end_rsdata_req(struct drbd_work *, int);
-extern int w_e_end_csum_rs_req(struct drbd_work *, int);
-extern int w_e_end_ov_reply(struct drbd_work *, int);
-extern int w_e_end_ov_req(struct drbd_work *, int);
-extern int w_ov_finished(struct drbd_work *, int);
-extern int w_resync_timer(struct drbd_work *, int);
-extern int w_send_write_hint(struct drbd_work *, int);
-extern int w_send_dblock(struct drbd_work *, int);
-extern int w_send_read_req(struct drbd_work *, int);
-extern int w_restart_disk_io(struct drbd_work *, int);
-extern int w_send_out_of_sync(struct drbd_work *, int);
-
-extern void resync_timer_fn(struct timer_list *t);
-extern void start_resync_timer_fn(struct timer_list *t);
-
-extern void drbd_endio_write_sec_final(struct drbd_peer_request *peer_req);
+int w_e_end_data_req(struct drbd_work *w, int cancel);
+int w_e_end_rsdata_req(struct drbd_work *w, int cancel);
+int w_e_end_ov_reply(struct drbd_work *w, int cancel);
+int w_e_end_ov_req(struct drbd_work *w, int cancel);
+int w_resync_timer(struct drbd_work *w, int cancel);
+int w_e_reissue(struct drbd_work *w, int cancel);
+int w_send_dagtag(struct drbd_work *w, int cancel);
+int w_send_uuids(struct drbd_work *w, int cancel);
+
+bool drbd_any_flush_pending(struct drbd_resource *resource);
+void resync_timer_fn(struct timer_list *t);
+void start_resync_timer_fn(struct timer_list *t);
+
+int drbd_unmerge_discard(struct drbd_peer_request *peer_req_main,
+			 struct list_head *list);
+void drbd_endio_write_sec_final(struct drbd_peer_request *peer_req);
+
+/* bi_end_io handlers */
+void drbd_md_endio(struct bio *bio);
+void drbd_peer_request_endio(struct bio *bio);
+void drbd_request_endio(struct bio *bio);
+
+void __update_timing_details(
+		struct drbd_thread_timing_details *tdp,
+		unsigned int *cb_nr,
+		void *cb,
+		const char *fn, const unsigned int line);
+
+#define update_sender_timing_details(c, cb) \
+	__update_timing_details(c->s_timing_details, &c->s_cb_nr, cb, __func__, __LINE__)
+#define update_receiver_timing_details(c, cb) \
+	__update_timing_details(c->r_timing_details, &c->r_cb_nr, cb, __func__, __LINE__)
+#define update_worker_timing_details(r, cb) \
+	__update_timing_details(r->w_timing_details, &r->w_cb_nr, cb, __func__, __LINE__)
 
 /* drbd_receiver.c */
-extern int drbd_issue_discard_or_zero_out(struct drbd_device *device,
-		sector_t start, unsigned int nr_sectors, int flags);
-extern int drbd_receiver(struct drbd_thread *thi);
-extern int drbd_ack_receiver(struct drbd_thread *thi);
-extern void drbd_send_acks_wf(struct work_struct *ws);
-extern bool drbd_rs_c_min_rate_throttle(struct drbd_device *device);
-extern bool drbd_rs_should_slow_down(struct drbd_peer_device *peer_device, sector_t sector,
-		bool throttle_if_app_is_waiting);
-extern int drbd_submit_peer_request(struct drbd_peer_request *peer_req);
-extern int drbd_free_peer_reqs(struct drbd_device *, struct list_head *);
-extern struct drbd_peer_request *drbd_alloc_peer_req(struct drbd_peer_device *, u64,
-						     sector_t, unsigned int,
-						     unsigned int,
-						     gfp_t) __must_hold(local);
-extern void drbd_free_peer_req(struct drbd_device *device, struct drbd_peer_request *req);
-extern struct page *drbd_alloc_pages(struct drbd_peer_device *, unsigned int, bool);
-extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
-extern int drbd_connected(struct drbd_peer_device *);
+struct packet_info {
+	enum drbd_packet cmd;
+	unsigned int size;
+	int vnr;
+	void *data;
+};
+
+/* packet_info->data is just a pointer into some temporary buffer
+ * owned by the transport. As soon as we call into the transport for
+ * any further receive operation, the data it points to is undefined.
+ * The buffer may be freed/recycled/re-used already.
+ * Convert and store the relevant information for any incoming data
+ * in drbd_peer_request_detail.
+ */
+
+struct drbd_peer_request_details {
+	uint64_t sector;	/* be64_to_cpu(p_data.sector) */
+	uint64_t block_id;	/* unmodified p_data.block_id */
+	uint32_t peer_seq;	/* be32_to_cpu(p_data.seq_num) */
+	uint32_t dp_flags;	/* be32_to_cpu(p_data.dp_flags) */
+	uint32_t length;	/* endian converted p_head*.length */
+	uint32_t bi_size;	/* resulting bio size */
+	/* for non-discards: bi_size = length - digest_size */
+	uint32_t digest_size;
+};
+
+
+void drbd_queue_update_peers(struct drbd_peer_device *peer_device,
+			     sector_t sector_start, sector_t sector_end);
+int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start,
+				   unsigned int nr_sectors, int flags);
+int drbd_send_ack_be(struct drbd_peer_device *peer_device,
+		     enum drbd_packet cmd, sector_t sector, int size,
+		     u64 block_id);
+int drbd_send_ack(struct drbd_peer_device *peer_device, enum drbd_packet cmd,
+		  struct drbd_peer_request *peer_req);
+int drbd_send_ov_result(struct drbd_peer_device *peer_device, sector_t sector,
+			int blksize, u64 block_id, enum ov_result result);
+int drbd_receiver(struct drbd_thread *thi);
+void drbd_unsuccessful_resync_request(struct drbd_peer_request *peer_req,
+				      bool failed);
+int drbd_send_out_of_sync_wf(struct drbd_work *w, int cancel);
+int drbd_flush_ack_wf(struct drbd_work *w, int unused);
+void drbd_send_ping_wf(struct work_struct *ws);
+void drbd_send_acks_wf(struct work_struct *ws);
+void drbd_send_peer_ack_wf(struct work_struct *ws);
+bool drbd_rs_c_min_rate_throttle(struct drbd_peer_device *peer_device);
+void drbd_verify_skipped_block(struct drbd_peer_device *peer_device,
+			       const sector_t sector, const unsigned int size);
+void drbd_conflict_submit_resync_request(struct drbd_peer_request *peer_req);
+void drbd_conflict_submit_peer_read(struct drbd_peer_request *peer_req);
+void drbd_conflict_submit_peer_write(struct drbd_peer_request *peer_req);
+int drbd_submit_peer_request(struct drbd_peer_request *peer_req);
+void drbd_cleanup_after_failed_submit_peer_write(struct drbd_peer_request *peer_req);
+void drbd_cleanup_peer_requests_wfa(struct drbd_device *device,
+				    struct list_head *cleanup);
+void drbd_remove_peer_req_interval(struct drbd_peer_request *peer_req);
+int drbd_free_peer_reqs(struct drbd_connection *connection,
+			struct list_head *list);
+struct drbd_peer_request *drbd_alloc_peer_req(struct drbd_peer_device *peer_device, gfp_t gfp_mask,
+					      size_t size, blk_opf_t opf);
+void drbd_free_peer_req(struct drbd_peer_request *peer_req);
+void drbd_peer_req_strip_bio(struct drbd_peer_request *peer_req);
+int drbd_connected(struct drbd_peer_device *peer_device);
+void conn_connect2(struct drbd_connection *connection);
+void wait_initial_states_received(struct drbd_connection *connection);
+void abort_connect(struct drbd_connection *connection);
+void drbd_print_cluster_wide_state_change(struct drbd_resource *resource,
+					  const char *message,
+					  unsigned int tid,
+					  unsigned int initiator_node_id,
+					  int target_node_id,
+					  union drbd_state mask,
+					  union drbd_state val);
+void apply_unacked_peer_requests(struct drbd_connection *connection);
+struct drbd_connection *drbd_connection_by_node_id(struct drbd_resource *resource,
+						   int node_id);
+struct drbd_connection *drbd_get_connection_by_node_id(struct drbd_resource *resource,
+						       int node_id);
+bool drbd_have_local_disk(struct drbd_resource *resource);
+enum drbd_state_rv drbd_support_2pc_resize(struct drbd_resource *resource);
+enum determine_dev_size
+drbd_commit_size_change(struct drbd_device *device, struct resize_parms *rs,
+			u64 nodes_to_reach);
+void drbd_try_to_get_resynced(struct drbd_device *device);
+void drbd_process_rs_discards(struct drbd_peer_device *peer_device,
+			      bool submit_all);
+void drbd_last_resync_request(struct drbd_peer_device *peer_device,
+			      bool submit_all);
+void drbd_init_connect_state(struct drbd_connection *connection);
+
+static inline sector_t drbd_get_capacity(struct block_device *bdev)
+{
+	return bdev ? bdev_nr_sectors(bdev) : 0;
+}
 
 /* sets the number of 512 byte sectors of our virtual device */
 void drbd_set_my_capacity(struct drbd_device *device, sector_t size);
@@ -1488,207 +2449,108 @@ void drbd_set_my_capacity(struct drbd_device *device, sector_t size);
 static inline void drbd_submit_bio_noacct(struct drbd_device *device,
 					     int fault_type, struct bio *bio)
 {
-	__release(local);
-	if (!bio->bi_bdev) {
-		drbd_err(device, "drbd_submit_bio_noacct: bio->bi_bdev == NULL\n");
+	if (drbd_insert_fault(device, fault_type)) {
 		bio->bi_status = BLK_STS_IOERR;
 		bio_endio(bio);
-		return;
-	}
-
-	if (drbd_insert_fault(device, fault_type))
-		bio_io_error(bio);
-	else
+	} else {
 		submit_bio_noacct(bio);
+	}
 }
 
 void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backing_dev *bdev,
 			      enum write_ordering_e wo);
 
+void twopc_timer_fn(struct timer_list *t);
+void connect_timer_fn(struct timer_list *t);
+
 /* drbd_proc.c */
 extern struct proc_dir_entry *drbd_proc;
 int drbd_seq_show(struct seq_file *seq, void *v);
 
 /* drbd_actlog.c */
-extern bool drbd_al_begin_io_prepare(struct drbd_device *device, struct drbd_interval *i);
-extern int drbd_al_begin_io_nonblock(struct drbd_device *device, struct drbd_interval *i);
-extern void drbd_al_begin_io_commit(struct drbd_device *device);
-extern bool drbd_al_begin_io_fastpath(struct drbd_device *device, struct drbd_interval *i);
-extern void drbd_al_begin_io(struct drbd_device *device, struct drbd_interval *i);
-extern void drbd_al_complete_io(struct drbd_device *device, struct drbd_interval *i);
-extern void drbd_rs_complete_io(struct drbd_device *device, sector_t sector);
-extern int drbd_rs_begin_io(struct drbd_device *device, sector_t sector);
-extern int drbd_try_rs_begin_io(struct drbd_peer_device *peer_device, sector_t sector);
-extern void drbd_rs_cancel_all(struct drbd_device *device);
-extern int drbd_rs_del_all(struct drbd_device *device);
-extern void drbd_rs_failed_io(struct drbd_peer_device *peer_device,
-		sector_t sector, int size);
-extern void drbd_advance_rs_marks(struct drbd_peer_device *peer_device, unsigned long still_to_go);
-
+bool drbd_al_try_lock(struct drbd_device *device);
+bool drbd_al_try_lock_for_transaction(struct drbd_device *device);
+int drbd_al_begin_io_nonblock(struct drbd_device *device,
+			      struct drbd_interval *i);
+void drbd_al_begin_io_commit(struct drbd_device *device);
+bool drbd_al_begin_io_fastpath(struct drbd_device *device,
+			       struct drbd_interval *i);
+bool drbd_al_complete_io(struct drbd_device *device, struct drbd_interval *i);
+void drbd_advance_rs_marks(struct drbd_peer_device *peer_device,
+			   unsigned long still_to_go);
+bool drbd_lazy_bitmap_update_due(struct drbd_peer_device *peer_device);
+unsigned long drbd_set_all_out_of_sync(struct drbd_device *device, sector_t sector,
+			     int size);
+unsigned long drbd_set_sync(struct drbd_device *device, sector_t sector, int size,
+		  unsigned long bits, unsigned long mask);
 enum update_sync_bits_mode { RECORD_RS_FAILED, SET_OUT_OF_SYNC, SET_IN_SYNC };
-extern int __drbd_change_sync(struct drbd_peer_device *peer_device, sector_t sector, int size,
-		enum update_sync_bits_mode mode);
+int __drbd_change_sync(struct drbd_peer_device *peer_device, sector_t sector,
+		       int size, enum update_sync_bits_mode mode);
 #define drbd_set_in_sync(peer_device, sector, size) \
 	__drbd_change_sync(peer_device, sector, size, SET_IN_SYNC)
 #define drbd_set_out_of_sync(peer_device, sector, size) \
 	__drbd_change_sync(peer_device, sector, size, SET_OUT_OF_SYNC)
 #define drbd_rs_failed_io(peer_device, sector, size) \
 	__drbd_change_sync(peer_device, sector, size, RECORD_RS_FAILED)
-extern void drbd_al_shrink(struct drbd_device *device);
-extern int drbd_al_initialize(struct drbd_device *, void *);
+void drbd_al_shrink(struct drbd_device *device);
+int drbd_al_initialize(struct drbd_device *device, void *buffer);
 
 /* drbd_nl.c */
-/* state info broadcast */
-struct sib_info {
-	enum drbd_state_info_bcast_reason sib_reason;
-	union {
-		struct {
-			char *helper_name;
-			unsigned helper_exit_code;
-		};
-		struct {
-			union drbd_state os;
-			union drbd_state ns;
-		};
-	};
-};
-void drbd_bcast_event(struct drbd_device *device, const struct sib_info *sib);
-
-extern int notify_resource_state(struct sk_buff *,
-				  unsigned int,
-				  struct drbd_resource *,
-				  struct resource_info *,
-				  enum drbd_notification_type);
-extern int notify_device_state(struct sk_buff *,
-				unsigned int,
-				struct drbd_device *,
-				struct device_info *,
-				enum drbd_notification_type);
-extern int notify_connection_state(struct sk_buff *,
-				    unsigned int,
-				    struct drbd_connection *,
-				    struct connection_info *,
-				    enum drbd_notification_type);
-extern int notify_peer_device_state(struct sk_buff *,
-				     unsigned int,
-				     struct drbd_peer_device *,
-				     struct peer_device_info *,
-				     enum drbd_notification_type);
-extern void notify_helper(enum drbd_notification_type, struct drbd_device *,
-			  struct drbd_connection *, const char *, int);
 
+extern struct mutex notification_mutex;
+extern atomic_t drbd_genl_seq;
+
+int notify_resource_state(struct sk_buff *skb, unsigned int seq,
+			  struct drbd_resource *resource,
+			  struct resource_info *resource_info,
+			  struct rename_resource_info *rename_resource_info,
+			  enum drbd_notification_type type);
+int notify_device_state(struct sk_buff *skb, unsigned int seq,
+			struct drbd_device *device,
+			struct device_info *device_info,
+			enum drbd_notification_type type);
+int notify_connection_state(struct sk_buff *skb, unsigned int seq,
+			    struct drbd_connection *connection,
+			    struct connection_info *connection_info,
+			    enum drbd_notification_type type);
+int notify_peer_device_state(struct sk_buff *skb, unsigned int seq,
+			     struct drbd_peer_device *peer_device,
+			     struct peer_device_info *peer_device_info,
+			     enum drbd_notification_type type);
+void notify_helper(enum drbd_notification_type type,
+		   struct drbd_device *device,
+		   struct drbd_connection *connection, const char *name,
+		   int status);
+int notify_path(struct drbd_connection *connection, struct drbd_path *path,
+		enum drbd_notification_type type);
+void drbd_broadcast_peer_device_state(struct drbd_peer_device *peer_device);
+
+sector_t drbd_local_max_size(struct drbd_device *device);
+int drbd_open_ro_count(struct drbd_resource *resource);
+
+void device_to_info(struct device_info *info, struct drbd_device *device);
+void device_state_change_to_info(struct device_info *info,
+				 struct drbd_device_state_change *state_change);
+void peer_device_state_change_to_info(struct peer_device_info *info,
+				      struct drbd_peer_device_state_change *state_change);
 /*
  * inline helper functions
  *************************/
 
-/* see also page_chain_add and friends in drbd_receiver.c */
-static inline struct page *page_chain_next(struct page *page)
-{
-	return (struct page *)page_private(page);
-}
-#define page_chain_for_each(page) \
-	for (; page && ({ prefetch(page_chain_next(page)); 1; }); \
-			page = page_chain_next(page))
-#define page_chain_for_each_safe(page, n) \
-	for (; page && ({ n = page_chain_next(page); 1; }); page = n)
-
-
-static inline union drbd_state drbd_read_state(struct drbd_device *device)
-{
-	struct drbd_resource *resource = device->resource;
-	union drbd_state rv;
-
-	rv.i = device->state.i;
-	rv.susp = resource->susp;
-	rv.susp_nod = resource->susp_nod;
-	rv.susp_fen = resource->susp_fen;
-
-	return rv;
-}
-
-enum drbd_force_detach_flags {
-	DRBD_READ_ERROR,
-	DRBD_WRITE_ERROR,
-	DRBD_META_IO_ERROR,
-	DRBD_FORCE_DETACH,
-};
-
-#define __drbd_chk_io_error(m,f) __drbd_chk_io_error_(m,f, __func__)
-static inline void __drbd_chk_io_error_(struct drbd_device *device,
-		enum drbd_force_detach_flags df,
-		const char *where)
-{
-	enum drbd_io_error_p ep;
-
-	rcu_read_lock();
-	ep = rcu_dereference(device->ldev->disk_conf)->on_io_error;
-	rcu_read_unlock();
-	switch (ep) {
-	case EP_PASS_ON: /* FIXME would this be better named "Ignore"? */
-		if (df == DRBD_READ_ERROR || df == DRBD_WRITE_ERROR) {
-			if (drbd_ratelimit())
-				drbd_err(device, "Local IO failed in %s.\n", where);
-			if (device->state.disk > D_INCONSISTENT)
-				_drbd_set_state(_NS(device, disk, D_INCONSISTENT), CS_HARD, NULL);
-			break;
-		}
-		fallthrough;	/* for DRBD_META_IO_ERROR or DRBD_FORCE_DETACH */
-	case EP_DETACH:
-	case EP_CALL_HELPER:
-		/* Remember whether we saw a READ or WRITE error.
-		 *
-		 * Recovery of the affected area for WRITE failure is covered
-		 * by the activity log.
-		 * READ errors may fall outside that area though. Certain READ
-		 * errors can be "healed" by writing good data to the affected
-		 * blocks, which triggers block re-allocation in lower layers.
-		 *
-		 * If we can not write the bitmap after a READ error,
-		 * we may need to trigger a full sync (see w_go_diskless()).
-		 *
-		 * Force-detach is not really an IO error, but rather a
-		 * desperate measure to try to deal with a completely
-		 * unresponsive lower level IO stack.
-		 * Still it should be treated as a WRITE error.
-		 *
-		 * Meta IO error is always WRITE error:
-		 * we read meta data only once during attach,
-		 * which will fail in case of errors.
-		 */
-		set_bit(WAS_IO_ERROR, &device->flags);
-		if (df == DRBD_READ_ERROR)
-			set_bit(WAS_READ_ERROR, &device->flags);
-		if (df == DRBD_FORCE_DETACH)
-			set_bit(FORCE_DETACH, &device->flags);
-		if (device->state.disk > D_FAILED) {
-			_drbd_set_state(_NS(device, disk, D_FAILED), CS_HARD, NULL);
-			drbd_err(device,
-				"Local IO failed in %s. Detaching...\n", where);
-		}
-		break;
-	}
-}
-
-/**
- * drbd_chk_io_error: Handle the on_io_error setting, should be called from all io completion handlers
- * @device:	 DRBD device.
- * @error:	 Error code passed to the IO completion callback
- * @forcedetach: Force detach. I.e. the error happened while accessing the meta data
- *
- * See also drbd_main.c:after_state_ch() if (os.disk > D_FAILED && ns.disk == D_FAILED)
+/*
+ * When a device has a replication state above L_OFF, it must be
+ * connected.  Otherwise, we report the connection state, which has values up
+ * to C_CONNECTED == L_OFF.
  */
-#define drbd_chk_io_error(m,e,f) drbd_chk_io_error_(m,e,f, __func__)
-static inline void drbd_chk_io_error_(struct drbd_device *device,
-	int error, enum drbd_force_detach_flags forcedetach, const char *where)
+static inline int combined_conn_state(struct drbd_peer_device *peer_device, enum which_state which)
 {
-	if (error) {
-		unsigned long flags;
-		spin_lock_irqsave(&device->resource->req_lock, flags);
-		__drbd_chk_io_error_(device, forcedetach, where);
-		spin_unlock_irqrestore(&device->resource->req_lock, flags);
-	}
-}
+	enum drbd_repl_state repl_state = peer_device->repl_state[which];
 
+	if (repl_state > L_OFF)
+		return repl_state;
+	else
+		return peer_device->connection->cstate[which];
+}
 
 /**
  * drbd_md_first_sector() - Returns the first sector number of the meta data area
@@ -1718,54 +2580,13 @@ static inline sector_t drbd_md_last_sector(struct drbd_backing_dev *bdev)
 	switch (bdev->md.meta_dev_idx) {
 	case DRBD_MD_INDEX_INTERNAL:
 	case DRBD_MD_INDEX_FLEX_INT:
-		return bdev->md.md_offset + MD_4kB_SECT -1;
+		return bdev->md.md_offset + (4096 >> 9) - 1;
 	case DRBD_MD_INDEX_FLEX_EXT:
 	default:
-		return bdev->md.md_offset + bdev->md.md_size_sect -1;
+		return bdev->md.md_offset + bdev->md.md_size_sect - 1;
 	}
 }
 
-/* Returns the number of 512 byte sectors of the device */
-static inline sector_t drbd_get_capacity(struct block_device *bdev)
-{
-	return bdev ? bdev_nr_sectors(bdev) : 0;
-}
-
-/**
- * drbd_get_max_capacity() - Returns the capacity we announce to out peer
- * @bdev:	Meta data block device.
- *
- * returns the capacity we announce to out peer.  we clip ourselves at the
- * various MAX_SECTORS, because if we don't, current implementation will
- * oops sooner or later
- */
-static inline sector_t drbd_get_max_capacity(struct drbd_backing_dev *bdev)
-{
-	sector_t s;
-
-	switch (bdev->md.meta_dev_idx) {
-	case DRBD_MD_INDEX_INTERNAL:
-	case DRBD_MD_INDEX_FLEX_INT:
-		s = drbd_get_capacity(bdev->backing_bdev)
-			? min_t(sector_t, DRBD_MAX_SECTORS_FLEX,
-				drbd_md_first_sector(bdev))
-			: 0;
-		break;
-	case DRBD_MD_INDEX_FLEX_EXT:
-		s = min_t(sector_t, DRBD_MAX_SECTORS_FLEX,
-				drbd_get_capacity(bdev->backing_bdev));
-		/* clip at maximum size the meta device can support */
-		s = min_t(sector_t, s,
-			BM_EXT_TO_SECT(bdev->md.md_size_sect
-				     - bdev->md.bm_offset));
-		break;
-	default:
-		s = min_t(sector_t, DRBD_MAX_SECTORS,
-				drbd_get_capacity(bdev->backing_bdev));
-	}
-	return s;
-}
-
 /**
  * drbd_md_ss() - Return the sector number of our meta data super block
  * @bdev:	Meta data block device.
@@ -1784,18 +2605,10 @@ static inline sector_t drbd_md_ss(struct drbd_backing_dev *bdev)
 		return (drbd_get_capacity(bdev->backing_bdev) & ~7ULL) - 8;
 
 	/* external, some index; this is the old fixed size layout */
-	return MD_128MB_SECT * bdev->md.meta_dev_idx;
+	return (128 << 20 >> 9) * bdev->md.meta_dev_idx;
 }
 
-static inline void
-drbd_queue_work(struct drbd_work_queue *q, struct drbd_work *w)
-{
-	unsigned long flags;
-	spin_lock_irqsave(&q->q_lock, flags);
-	list_add_tail(&w->list, &q->q);
-	spin_unlock_irqrestore(&q->q_lock, flags);
-	wake_up(&q->q_wait);
-}
+void drbd_queue_work(struct drbd_work_queue *, struct drbd_work *);
 
 static inline void
 drbd_queue_work_if_unqueued(struct drbd_work_queue *q, struct drbd_work *w)
@@ -1812,46 +2625,48 @@ static inline void
 drbd_device_post_work(struct drbd_device *device, int work_bit)
 {
 	if (!test_and_set_bit(work_bit, &device->flags)) {
-		struct drbd_connection *connection =
-			first_peer_device(device)->connection;
-		struct drbd_work_queue *q = &connection->sender_work;
-		if (!test_and_set_bit(DEVICE_WORK_PENDING, &connection->flags))
+		struct drbd_resource *resource = device->resource;
+		struct drbd_work_queue *q = &resource->work;
+		if (!test_and_set_bit(DEVICE_WORK_PENDING, &resource->flags))
 			wake_up(&q->q_wait);
 	}
 }
 
-extern void drbd_flush_workqueue(struct drbd_work_queue *work_queue);
-
-/* To get the ack_receiver out of the blocking network stack,
- * so it can change its sk_rcvtimeo from idle- to ping-timeout,
- * and send a ping, we need to send a signal.
- * Which signal we send is irrelevant. */
-static inline void wake_ack_receiver(struct drbd_connection *connection)
-{
-	struct task_struct *task = connection->ack_receiver.task;
-	if (task && get_t_state(&connection->ack_receiver) == RUNNING)
-		send_sig(SIGXCPU, task, 1);
-}
-
-static inline void request_ping(struct drbd_connection *connection)
+static inline void
+drbd_peer_device_post_work(struct drbd_peer_device *peer_device, int work_bit)
 {
-	set_bit(SEND_PING, &connection->flags);
-	wake_ack_receiver(connection);
+	if (!test_and_set_bit(work_bit, &peer_device->flags)) {
+		struct drbd_resource *resource = peer_device->device->resource;
+		struct drbd_work_queue *q = &resource->work;
+		if (!test_and_set_bit(PEER_DEVICE_WORK_PENDING, &resource->flags))
+			wake_up(&q->q_wait);
+	}
 }
 
-extern void *conn_prepare_command(struct drbd_connection *, struct drbd_socket *);
-extern void *drbd_prepare_command(struct drbd_peer_device *, struct drbd_socket *);
-extern int conn_send_command(struct drbd_connection *, struct drbd_socket *,
-			     enum drbd_packet, unsigned int, void *,
-			     unsigned int);
-extern int drbd_send_command(struct drbd_peer_device *, struct drbd_socket *,
-			     enum drbd_packet, unsigned int, void *,
-			     unsigned int);
-
-extern int drbd_send_ping(struct drbd_connection *connection);
-extern int drbd_send_ping_ack(struct drbd_connection *connection);
-extern int drbd_send_state_req(struct drbd_peer_device *, union drbd_state, union drbd_state);
-extern int conn_send_state_req(struct drbd_connection *, union drbd_state, union drbd_state);
+void drbd_flush_workqueue(struct drbd_work_queue *work_queue);
+void drbd_flush_workqueue_interruptible(struct drbd_device *device);
+
+void *__conn_prepare_command(struct drbd_connection *connection, int size,
+			     enum drbd_stream drbd_stream);
+void *conn_prepare_command(struct drbd_connection *connection, int size,
+			   enum drbd_stream drbd_stream);
+void *drbd_prepare_command(struct drbd_peer_device *peer_device, int size,
+			   enum drbd_stream drbd_stream);
+int __send_command(struct drbd_connection *connection, int vnr,
+		   enum drbd_packet cmd, int stream_and_flags);
+int send_command(struct drbd_connection *connection, int vnr,
+		 enum drbd_packet cmd, int stream_and_flags);
+int drbd_send_command(struct drbd_peer_device *peer_device,
+		      enum drbd_packet cmd, enum drbd_stream drbd_stream);
+
+int drbd_send_ping(struct drbd_connection *connection);
+int conn_send_state_req(struct drbd_connection *connection, int vnr,
+			enum drbd_packet cmd, union drbd_state mask,
+			union drbd_state val);
+int conn_send_twopc_request(struct drbd_connection *connection,
+			    struct twopc_request *request);
+int drbd_send_peer_ack(struct drbd_connection *connection, u64 mask,
+		       u64 dagtag_sector);
 
 static inline void drbd_thread_stop(struct drbd_thread *thi)
 {
@@ -1868,59 +2683,37 @@ static inline void drbd_thread_restart_nowait(struct drbd_thread *thi)
 	_drbd_thread_stop(thi, true, false);
 }
 
-/* counts how many answer packets packets we expect from our peer,
- * for either explicit application requests,
- * or implicit barrier packets as necessary.
- * increased:
- *  w_send_barrier
- *  _req_mod(req, QUEUE_FOR_NET_WRITE or QUEUE_FOR_NET_READ);
- *    it is much easier and equally valid to count what we queue for the
- *    worker, even before it actually was queued or send.
- *    (drbd_make_request_common; recovery path on read io-error)
- * decreased:
- *  got_BarrierAck (respective tl_clear, tl_clear_barrier)
- *  _req_mod(req, DATA_RECEIVED)
- *     [from receive_DataReply]
- *  _req_mod(req, WRITE_ACKED_BY_PEER or RECV_ACKED_BY_PEER or NEG_ACKED)
- *     [from got_BlockAck (P_WRITE_ACK, P_RECV_ACK)]
- *     for some reason it is NOT decreased in got_NegAck,
- *     but in the resulting cleanup code from report_params.
- *     we should try to remember the reason for that...
- *  _req_mod(req, SEND_FAILED or SEND_CANCELED)
- *  _req_mod(req, CONNECTION_LOST_WHILE_PENDING)
- *     [from tl_clear_barrier]
- */
-static inline void inc_ap_pending(struct drbd_device *device)
+static inline void inc_ap_pending(struct drbd_peer_device *peer_device)
 {
-	atomic_inc(&device->ap_pending_cnt);
+	atomic_inc(&peer_device->ap_pending_cnt);
 }
 
-#define dec_ap_pending(device) ((void)expect((device), __dec_ap_pending(device) >= 0))
-static inline int __dec_ap_pending(struct drbd_device *device)
+#define dec_ap_pending(peer_device) \
+	((void)expect((peer_device), __dec_ap_pending(peer_device) >= 0))
+static inline int __dec_ap_pending(struct drbd_peer_device *peer_device)
 {
-	int ap_pending_cnt = atomic_dec_return(&device->ap_pending_cnt);
-
+	int ap_pending_cnt = atomic_dec_return(&peer_device->ap_pending_cnt);
 	if (ap_pending_cnt == 0)
-		wake_up(&device->misc_wait);
+		wake_up(&peer_device->device->misc_wait);
 	return ap_pending_cnt;
 }
 
 /* counts how many resync-related answers we still expect from the peer
  *		     increase			decrease
- * C_SYNC_TARGET sends P_RS_DATA_REQUEST (and expects P_RS_DATA_REPLY)
- * C_SYNC_SOURCE sends P_RS_DATA_REPLY   (and expects P_WRITE_ACK with ID_SYNCER)
+ * L_SYNC_TARGET sends P_RS_DATA_REQUEST (and expects P_RS_DATA_REPLY)
+ * L_SYNC_SOURCE sends P_RS_DATA_REPLY   (and expects P_WRITE_ACK with ID_SYNCER)
  *					   (or P_NEG_ACK with ID_SYNCER)
  */
 static inline void inc_rs_pending(struct drbd_peer_device *peer_device)
 {
-	atomic_inc(&peer_device->device->rs_pending_cnt);
+	atomic_inc(&peer_device->rs_pending_cnt);
 }
 
 #define dec_rs_pending(peer_device) \
 	((void)expect((peer_device), __dec_rs_pending(peer_device) >= 0))
 static inline int __dec_rs_pending(struct drbd_peer_device *peer_device)
 {
-	return atomic_dec_return(&peer_device->device->rs_pending_cnt);
+	return atomic_dec_return(&peer_device->rs_pending_cnt);
 }
 
 /* counts how many answers we still need to send to the peer.
@@ -1929,42 +2722,82 @@ static inline int __dec_rs_pending(struct drbd_peer_device *peer_device)
  *			we need to send a P_RECV_ACK (proto B)
  *			or P_WRITE_ACK (proto C)
  *  receive_RSDataReply (recv_resync_read) we need to send a P_WRITE_ACK
- *  receive_DataRequest (receive_RSDataRequest) we need to send back P_DATA
+ *  receive_data_request etc we need to send back P_DATA
  *  receive_Barrier_*	we need to send a P_BARRIER_ACK
  */
-static inline void inc_unacked(struct drbd_device *device)
+static inline void inc_unacked(struct drbd_peer_device *peer_device)
+{
+	atomic_inc(&peer_device->unacked_cnt);
+}
+
+#define dec_unacked(peer_device) \
+	((void)expect(peer_device, __dec_unacked(peer_device) >= 0))
+static inline int __dec_unacked(struct drbd_peer_device *peer_device)
+{
+	return atomic_dec_return(&peer_device->unacked_cnt);
+}
+
+static inline bool repl_is_sync_target(enum drbd_repl_state repl_state)
 {
-	atomic_inc(&device->unacked_cnt);
+	return repl_state == L_SYNC_TARGET || repl_state == L_PAUSED_SYNC_T;
 }
 
-#define dec_unacked(device) ((void)expect(device, __dec_unacked(device) >= 0))
-static inline int __dec_unacked(struct drbd_device *device)
+static inline bool repl_is_sync_source(enum drbd_repl_state repl_state)
 {
-	return atomic_dec_return(&device->unacked_cnt);
+	return repl_state == L_SYNC_SOURCE || repl_state == L_PAUSED_SYNC_S;
 }
 
-#define sub_unacked(device, n) ((void)expect(device, __sub_unacked(device) >= 0))
-static inline int __sub_unacked(struct drbd_device *device, int n)
+static inline bool repl_is_sync(enum drbd_repl_state repl_state)
 {
-	return atomic_sub_return(n, &device->unacked_cnt);
+	return repl_is_sync_source(repl_state) ||
+		repl_is_sync_target(repl_state);
 }
 
-static inline bool is_sync_target_state(enum drbd_conns connection_state)
+static inline bool is_sync_target_state(struct drbd_peer_device *peer_device,
+					enum which_state which)
 {
-	return	connection_state == C_SYNC_TARGET ||
-		connection_state == C_PAUSED_SYNC_T;
+	return repl_is_sync_target(peer_device->repl_state[which]);
 }
 
-static inline bool is_sync_source_state(enum drbd_conns connection_state)
+static inline bool is_sync_source_state(struct drbd_peer_device *peer_device,
+					enum which_state which)
 {
-	return	connection_state == C_SYNC_SOURCE ||
-		connection_state == C_PAUSED_SYNC_S;
+	return repl_is_sync_source(peer_device->repl_state[which]);
 }
 
-static inline bool is_sync_state(enum drbd_conns connection_state)
+static inline bool is_sync_state(struct drbd_peer_device *peer_device,
+				 enum which_state which)
 {
-	return	is_sync_source_state(connection_state) ||
-		is_sync_target_state(connection_state);
+	return repl_is_sync(peer_device->repl_state[which]);
+}
+
+static inline bool is_verify_state(struct drbd_peer_device *peer_device,
+				   enum which_state which)
+{
+	enum drbd_repl_state repl_state = peer_device->repl_state[which];
+	return repl_state == L_VERIFY_S || repl_state == L_VERIFY_T;
+}
+
+static inline bool resync_susp_comb_dep(struct drbd_peer_device *peer_device, enum which_state which)
+{
+	struct drbd_device *device = peer_device->device;
+
+	return peer_device->resync_susp_dependency[which] || peer_device->resync_susp_other_c[which] ||
+		(is_sync_source_state(peer_device, which) && device->disk_state[which] <= D_INCONSISTENT);
+}
+
+static inline int
+drbd_insert_fault_conn(struct drbd_connection *connection, unsigned int type) {
+#ifdef CONFIG_DRBD_FAULT_INJECTION
+	int id = 0;
+	struct drbd_device *device = idr_get_next(&connection->resource->devices, &id);
+
+	return device && drbd_fault_rate &&
+		(drbd_enable_faults & (1<<type)) &&
+		_drbd_insert_fault(device, type);
+#else
+	return 0;
+#endif
 }
 
 /**
@@ -1974,14 +2807,11 @@ static inline bool is_sync_state(enum drbd_conns connection_state)
  *
  * You have to call put_ldev() when finished working with device->ldev.
  */
-#define get_ldev_if_state(_device, _min_state)				\
-	(_get_ldev_if_state((_device), (_min_state)) ?			\
-	 ({ __acquire(x); true; }) : false)
 #define get_ldev(_device) get_ldev_if_state(_device, D_INCONSISTENT)
 
 static inline void put_ldev(struct drbd_device *device)
 {
-	enum drbd_disk_state disk_state = device->state.disk;
+	enum drbd_disk_state disk_state = device->disk_state[NOW];
 	/* We must check the state *before* the atomic_dec becomes visible,
 	 * or we have a theoretical race where someone hitting zero,
 	 * while state still D_FAILED, will then see D_DISKLESS in the
@@ -1991,13 +2821,14 @@ static inline void put_ldev(struct drbd_device *device)
 	/* This may be called from some endio handler,
 	 * so we must not sleep here. */
 
-	__release(local);
 	D_ASSERT(device, i >= 0);
 	if (i == 0) {
-		if (disk_state == D_DISKLESS)
+		if (disk_state == D_DISKLESS) {
 			/* even internal references gone, safe to destroy */
-			drbd_device_post_work(device, DESTROY_DISK);
-		if (disk_state == D_FAILED)
+			kref_get(&device->kref);
+			schedule_work(&device->ldev_destroy_work);
+		}
+		if (disk_state == D_FAILED || disk_state == D_DETACHING)
 			/* all application IO references gone. */
 			if (!test_and_set_bit(GOING_DISKLESS, &device->flags))
 				drbd_device_post_work(device, GO_DISKLESS);
@@ -2005,122 +2836,53 @@ static inline void put_ldev(struct drbd_device *device)
 	}
 }
 
-#ifndef __CHECKER__
-static inline int _get_ldev_if_state(struct drbd_device *device, enum drbd_disk_state mins)
+static inline int get_ldev_if_state(struct drbd_device *device, enum drbd_disk_state mins)
 {
 	int io_allowed;
 
 	/* never get a reference while D_DISKLESS */
-	if (device->state.disk == D_DISKLESS)
+	if (device->disk_state[NOW] == D_DISKLESS)
 		return 0;
 
 	atomic_inc(&device->local_cnt);
-	io_allowed = (device->state.disk >= mins);
+	io_allowed = (device->disk_state[NOW] >= mins);
 	if (!io_allowed)
 		put_ldev(device);
 	return io_allowed;
 }
-#else
-extern int _get_ldev_if_state(struct drbd_device *device, enum drbd_disk_state mins);
-#endif
 
-/* this throttles on-the-fly application requests
- * according to max_buffers settings;
- * maybe re-implement using semaphores? */
-static inline int drbd_get_max_buffers(struct drbd_device *device)
-{
-	struct net_conf *nc;
-	int mxb;
+void drbd_queue_pending_bitmap_work(struct drbd_device *device);
 
-	rcu_read_lock();
-	nc = rcu_dereference(first_peer_device(device)->connection->net_conf);
-	mxb = nc ? nc->max_buffers : 1000000;  /* arbitrary limit on open requests */
-	rcu_read_unlock();
-
-	return mxb;
-}
-
-static inline int drbd_state_is_stable(struct drbd_device *device)
+/* rw = READ or WRITE (0 or 1); nothing else. */
+static inline void dec_ap_bio(struct drbd_device *device, int rw)
 {
-	union drbd_dev_state s = device->state;
-
-	/* DO NOT add a default clause, we want the compiler to warn us
-	 * for any newly introduced state we may have forgotten to add here */
-
-	switch ((enum drbd_conns)s.conn) {
-	/* new io only accepted when there is no connection, ... */
-	case C_STANDALONE:
-	case C_WF_CONNECTION:
-	/* ... or there is a well established connection. */
-	case C_CONNECTED:
-	case C_SYNC_SOURCE:
-	case C_SYNC_TARGET:
-	case C_VERIFY_S:
-	case C_VERIFY_T:
-	case C_PAUSED_SYNC_S:
-	case C_PAUSED_SYNC_T:
-	case C_AHEAD:
-	case C_BEHIND:
-		/* transitional states, IO allowed */
-	case C_DISCONNECTING:
-	case C_UNCONNECTED:
-	case C_TIMEOUT:
-	case C_BROKEN_PIPE:
-	case C_NETWORK_FAILURE:
-	case C_PROTOCOL_ERROR:
-	case C_TEAR_DOWN:
-	case C_WF_REPORT_PARAMS:
-	case C_STARTING_SYNC_S:
-	case C_STARTING_SYNC_T:
-		break;
-
-		/* Allow IO in BM exchange states with new protocols */
-	case C_WF_BITMAP_S:
-		if (first_peer_device(device)->connection->agreed_pro_version < 96)
-			return 0;
-		break;
+	unsigned int nr_requests = device->resource->res_opts.nr_requests;
+	int ap_bio = atomic_dec_return(&device->ap_bio_cnt[rw]);
 
-		/* no new io accepted in these states */
-	case C_WF_BITMAP_T:
-	case C_WF_SYNC_UUID:
-	case C_MASK:
-		/* not "stable" */
-		return 0;
-	}
-
-	switch ((enum drbd_disk_state)s.disk) {
-	case D_DISKLESS:
-	case D_INCONSISTENT:
-	case D_OUTDATED:
-	case D_CONSISTENT:
-	case D_UP_TO_DATE:
-	case D_FAILED:
-		/* disk state is stable as well. */
-		break;
+	D_ASSERT(device, ap_bio >= 0);
 
-	/* no new io accepted during transitional states */
-	case D_ATTACHING:
-	case D_NEGOTIATING:
-	case D_UNKNOWN:
-	case D_MASK:
-		/* not "stable" */
-		return 0;
-	}
+	/* Check for list_empty outside the lock is ok.  Worst case it queues
+	 * nothing because someone else just now did.  During list_add, a
+	 * refcount on ap_bio_cnt[WRITE] is held, so the bitmap work will be
+	 * queued when that is released if we miss it here.
+	 * Checking pending_bitmap_work.n is not correct,
+	 * it has a different lifetime. */
+	if (ap_bio == 0 && rw == WRITE && !list_empty(&device->pending_bitmap_work.q))
+		drbd_queue_pending_bitmap_work(device);
 
-	return 1;
+	if (ap_bio == 0 || ap_bio == nr_requests-1)
+		wake_up(&device->misc_wait);
 }
 
-static inline int drbd_suspended(struct drbd_device *device)
+static inline bool drbd_suspended(struct drbd_device *device)
 {
-	struct drbd_resource *resource = device->resource;
-
-	return resource->susp || resource->susp_fen || resource->susp_nod;
+	return device->resource->cached_susp;
 }
 
 static inline bool may_inc_ap_bio(struct drbd_device *device)
 {
-	int mxb = drbd_get_max_buffers(device);
-
+	if (device->cached_err_io)
+		return true;
 	if (drbd_suspended(device))
 		return false;
 	if (atomic_read(&device->suspend_cnt))
@@ -2131,76 +2893,45 @@ static inline bool may_inc_ap_bio(struct drbd_device *device)
 	 * to start during "stable" states. */
 
 	/* no new io accepted when attaching or detaching the disk */
-	if (!drbd_state_is_stable(device))
+	if (device->cached_state_unstable)
 		return false;
 
-	/* since some older kernels don't have atomic_add_unless,
-	 * and we are within the spinlock anyways, we have this workaround.  */
-	if (atomic_read(&device->ap_bio_cnt) > mxb)
-		return false;
-	if (test_bit(BITMAP_IO, &device->flags))
+	if (atomic_read(&device->pending_bitmap_work.n))
 		return false;
 	return true;
 }
 
-static inline bool inc_ap_bio_cond(struct drbd_device *device)
+static inline u64 drbd_current_uuid(struct drbd_device *device)
 {
-	bool rv = false;
-
-	spin_lock_irq(&device->resource->req_lock);
-	rv = may_inc_ap_bio(device);
-	if (rv)
-		atomic_inc(&device->ap_bio_cnt);
-	spin_unlock_irq(&device->resource->req_lock);
-
-	return rv;
+	if (!device->ldev)
+		return 0;
+	return device->ldev->md.current_uuid;
 }
 
-static inline void inc_ap_bio(struct drbd_device *device)
+static inline bool verify_can_do_stop_sector(struct drbd_peer_device *peer_device)
 {
-	/* we wait here
-	 *    as long as the device is suspended
-	 *    until the bitmap is no longer on the fly during connection
-	 *    handshake as long as we would exceed the max_buffer limit.
-	 *
-	 * to avoid races with the reconnect code,
-	 * we need to atomic_inc within the spinlock. */
-
-	wait_event(device->misc_wait, inc_ap_bio_cond(device));
+	return peer_device->connection->agreed_pro_version >= 97 &&
+		peer_device->connection->agreed_pro_version != 100;
 }
 
-static inline void dec_ap_bio(struct drbd_device *device)
+static inline u64 drbd_bitmap_uuid(struct drbd_peer_device *peer_device)
 {
-	int mxb = drbd_get_max_buffers(device);
-	int ap_bio = atomic_dec_return(&device->ap_bio_cnt);
-
-	D_ASSERT(device, ap_bio >= 0);
+	struct drbd_device *device = peer_device->device;
+	struct drbd_peer_md *peer_md;
 
-	if (ap_bio == 0 && test_bit(BITMAP_IO, &device->flags)) {
-		if (!test_and_set_bit(BITMAP_IO_QUEUED, &device->flags))
-			drbd_queue_work(&first_peer_device(device)->
-				connection->sender_work,
-				&device->bm_io_work.w);
-	}
+	if (!device->ldev)
+		return 0;
 
-	/* this currently does wake_up for every dec_ap_bio!
-	 * maybe rather introduce some type of hysteresis?
-	 * e.g. (ap_bio == mxb/2 || ap_bio == 0) ? */
-	if (ap_bio < mxb)
-		wake_up(&device->misc_wait);
+	peer_md = &device->ldev->md.peers[peer_device->node_id];
+	return peer_md->bitmap_uuid;
 }
 
-static inline bool verify_can_do_stop_sector(struct drbd_device *device)
+static inline u64 drbd_history_uuid(struct drbd_device *device, int i)
 {
-	return first_peer_device(device)->connection->agreed_pro_version >= 97 &&
-		first_peer_device(device)->connection->agreed_pro_version != 100;
-}
+	if (!device->ldev || i >= ARRAY_SIZE(device->ldev->md.history_uuids))
+		return 0;
 
-static inline int drbd_set_ed_uuid(struct drbd_device *device, u64 val)
-{
-	int changed = device->ed_uuid != val;
-	device->ed_uuid = val;
-	return changed;
+	return device->ldev->md.history_uuids[i];
 }
 
 static inline int drbd_queue_order_type(struct drbd_device *device)
@@ -2219,4 +2950,215 @@ static inline struct drbd_connection *first_connection(struct drbd_resource *res
 				struct drbd_connection, connections);
 }
 
+static inline struct net *drbd_net_assigned_to_connection(struct drbd_connection *connection)
+{
+	struct drbd_path *path;
+	struct net *net;
+
+	rcu_read_lock();
+	path = list_first_or_null_rcu(&connection->transport.paths, struct drbd_path, list);
+	net = path ? path->net : NULL;
+	rcu_read_unlock();
+
+	return net;
+}
+
+#define NODE_MASK(id) ((u64)1 << (id))
+
+static inline void drbd_list_del_resync_request(struct drbd_peer_request *peer_req)
+{
+	peer_req->flags &= ~EE_ON_RECV_ORDER;
+	list_del(&peer_req->recv_order);
+
+	if (peer_req == peer_req->peer_device->received_last)
+		peer_req->peer_device->received_last = NULL;
+
+	if (peer_req == peer_req->peer_device->discard_last)
+		peer_req->peer_device->discard_last = NULL;
+}
+
+/*
+ * drbd_interval_same_peer - determine whether "interval" is for the same peer as "i"
+ *
+ * "i" must be an interval corresponding to a drbd_peer_request.
+ */
+static inline bool drbd_interval_same_peer(struct drbd_interval *interval, struct drbd_interval *i)
+{
+	struct drbd_peer_request *interval_peer_req, *i_peer_req;
+
+	/* Ensure we only call "container_of" if it is actually a peer request. */
+	if (interval->type == INTERVAL_LOCAL_WRITE ||
+			interval->type == INTERVAL_LOCAL_READ ||
+			interval->type == INTERVAL_PEERS_IN_SYNC_LOCK)
+		return false;
+
+	interval_peer_req = container_of(interval, struct drbd_peer_request, i);
+	i_peer_req = container_of(i, struct drbd_peer_request, i);
+	return interval_peer_req->peer_device == i_peer_req->peer_device;
+}
+
+/*
+ * drbd_should_defer_to_resync - determine whether "interval" should defer to
+ * "i" in order to ensure that resync makes progress
+ */
+static inline bool drbd_should_defer_to_resync(struct drbd_interval *interval, struct drbd_interval *i)
+{
+	if (!drbd_interval_is_resync(i))
+		return false;
+
+	/* Always defer to resync requests once the reply has been received.
+	 * These just need to wait for conflicting local I/O to complete. This
+	 * is necessary to ensure that resync replies received before
+	 * application writes are submitted first, so that the resync writes do
+	 * not overwrite newer data. */
+	if (test_bit(INTERVAL_RECEIVED, &i->flags))
+		return true;
+
+	/* If we are still waiting for a reply from the peer, only defer to the
+	 * request if it is towards a different peer. The exclusivity between
+	 * resync requests and application writes from another peer is
+	 * necessary to avoid overwriting newer data with older in the resync.
+	 * When the data in both cases is coming from the same peer, this is
+	 * not necessary. The peer ensures that the data stream is correctly
+	 * ordered. */
+	return !drbd_interval_same_peer(interval, i);
+}
+
+/*
+ * drbd_should_defer_to_interval - determine whether "interval" should defer to "i"
+ */
+static inline bool drbd_should_defer_to_interval(struct drbd_interval *interval,
+		struct drbd_interval *i, bool defer_to_resync)
+{
+	if (test_bit(INTERVAL_SUBMITTED, &i->flags))
+		return true;
+
+	if (defer_to_resync && drbd_should_defer_to_resync(interval, i))
+		return true;
+
+	/*
+	 * We do not send conflicting resync requests because that causes
+	 * difficulties associating the replies to the requests.
+	 */
+	if (interval->type == INTERVAL_RESYNC_WRITE &&
+			i->type == INTERVAL_RESYNC_WRITE &&
+			test_bit(INTERVAL_READY_TO_SEND, &i->flags))
+		return true;
+
+	return false;
+}
+
+/* Find conflicts at application level instead of at disk level. */
+#define CONFLICT_FLAG_APPLICATION_ONLY (1 << 0)
+
+/*
+ * Ignore peer writes from the peer that this request relates to. This is only
+ * used for determining whether to send a request. It must not be used for
+ * determining whether to submit a request, because that would allow concurrent
+ * writes to the backing disk.
+ */
+#define CONFLICT_FLAG_IGNORE_SAME_PEER (1 << 1)
+
+/*
+ * drbd_find_conflict - find conflicting interval, if any
+ */
+static inline struct drbd_interval *drbd_find_conflict(struct drbd_device *device,
+		struct drbd_interval *interval, unsigned long flags)
+{
+	struct drbd_interval *i;
+	sector_t sector = interval->sector;
+	int size = interval->size;
+	bool application_only = flags & CONFLICT_FLAG_APPLICATION_ONLY;
+	bool defer_to_resync =
+		(interval->type == INTERVAL_LOCAL_WRITE || interval->type == INTERVAL_PEER_WRITE) &&
+		!application_only;
+	bool exclusive_until_completed = interval->type == INTERVAL_LOCAL_WRITE || application_only;
+	bool ignore_same_peer = flags & CONFLICT_FLAG_IGNORE_SAME_PEER;
+
+	lockdep_assert_held(&device->interval_lock);
+
+	drbd_for_each_overlap(i, &device->requests, sector, size) {
+		/* Ignore the interval itself. */
+		if (i == interval)
+			continue;
+
+		if (exclusive_until_completed) {
+			/* Ignore, if already completed to upper layers. */
+			if (test_bit(INTERVAL_COMPLETED, &i->flags))
+				continue;
+		} else {
+			/* Ignore, if already completed by the backing disk. */
+			if (test_bit(INTERVAL_BACKING_COMPLETED, &i->flags))
+				continue;
+		}
+
+		/* Ignore, if there is no need to defer to it. */
+		if (!drbd_should_defer_to_interval(interval, i, defer_to_resync))
+			continue;
+
+		/*
+		 * Ignore peer writes from the peer that this request relates
+		 * to, if requested.
+		 */
+		if (ignore_same_peer && i->type == INTERVAL_PEER_WRITE && drbd_interval_same_peer(interval, i))
+			continue;
+
+		if (unlikely(application_only)) {
+			/* Ignore, if not an application request. */
+			if (!drbd_interval_is_application(i))
+				continue;
+		}
+
+		if (drbd_interval_is_write(interval)) {
+			/*
+			 * Mark verify requests as conflicting rather than
+			 * treating them as conflicts for us.
+			 */
+			if (drbd_interval_is_verify(i)) {
+				set_bit(INTERVAL_CONFLICT, &i->flags);
+				continue;
+			}
+		} else {
+			/* Ignore other resync reads. */
+			if (i->type == INTERVAL_RESYNC_READ)
+				continue;
+
+			/* Ignore verify requests, since they are always reads. */
+			if (drbd_interval_is_verify(i))
+				continue;
+
+			/* Ignore peers-in-sync intervals, since they are always reads. */
+			if (i->type == INTERVAL_PEERS_IN_SYNC_LOCK)
+				continue;
+		}
+
+		dynamic_drbd_dbg(device,
+				"%s at %llus+%u conflicts with %s at %llus+%u\n",
+				drbd_interval_type_str(interval),
+				(unsigned long long) sector, size,
+				drbd_interval_type_str(i),
+				(unsigned long long) i->sector, i->size);
+
+		break;
+	}
+
+	return i;
+}
+
+#ifdef CONFIG_DRBD_TIMING_STATS
+#define ktime_aggregate_delta(D, ST, M) (D->M = ktime_add(D->M, ktime_sub(ktime_get(), ST)))
+#define ktime_aggregate(D, R, M) (D->M = ktime_add(D->M, ktime_sub(R->M, R->start_kt)))
+#define ktime_aggregate_pd(P, N, R, M) (P->M = ktime_add(P->M, ktime_sub(R->M[N], R->start_kt)))
+#define ktime_get_accounting(V) (V = ktime_get())
+#define ktime_get_accounting_assign(V, T) (V = T)
+#define ktime_var_for_accounting(V) ktime_t V = ktime_get()
+#else
+#define ktime_aggregate_delta(D, ST, M)
+#define ktime_aggregate(D, R, M)
+#define ktime_aggregate_pd(P, N, R, M)
+#define ktime_get_accounting(V)
+#define ktime_get_accounting_assign(V, T)
+#define ktime_var_for_accounting(V)
+#endif
+
 #endif
diff --git a/drivers/block/drbd/drbd_interval.h b/drivers/block/drbd/drbd_interval.h
index 5d3213b81eed..a6ef04f89885 100644
--- a/drivers/block/drbd/drbd_interval.h
+++ b/drivers/block/drbd/drbd_interval.h
@@ -5,20 +5,149 @@
 #include <linux/types.h>
 #include <linux/rbtree.h>
 
+/* Interval types stored directly in drbd_interval so that we can handle
+ * conflicts without having to inspect the containing object. The value 0 is
+ * reserved for uninitialized intervals. */
+enum drbd_interval_type {
+	INTERVAL_LOCAL_WRITE = 1,
+	INTERVAL_PEER_WRITE,
+	INTERVAL_LOCAL_READ,
+	INTERVAL_PEER_READ,
+	INTERVAL_RESYNC_WRITE, /* L_SYNC_TARGET */
+	INTERVAL_RESYNC_READ, /* L_SYNC_SOURCE */
+	INTERVAL_OV_READ_SOURCE, /* L_VERIFY_S */
+	INTERVAL_OV_READ_TARGET, /* L_VERIFY_T */
+	INTERVAL_PEERS_IN_SYNC_LOCK,
+};
+
+#define INTERVAL_TYPE_MASK(type) (1 << (type))
+
+enum drbd_interval_flags {
+	/* Whether this peer request may be sent. */
+	INTERVAL_READY_TO_SEND,
+
+	/*
+	 * Used for resync reads. This flag is set after sending and is used to
+	 * manage the lifetime of the request. When INTERVAL_SENT is not set,
+	 * the sending path still has a reference to the request.
+	 */
+	INTERVAL_SENT,
+
+	/*
+	 * Whether this peer request has been received yet.
+	 *
+	 * For resync reads, this flag is set when the corresponding ack has
+	 * been received and is used to manage the lifetime of the request.
+	 * When INTERVAL_RECEIVED is not set, the receiving path has a
+	 * reference to the request. This reference counting is protected by
+	 * peer_reqs_lock.
+	 */
+	INTERVAL_RECEIVED,
+
+	/* Whether this has been queued after conflict. */
+	INTERVAL_SUBMIT_CONFLICT_QUEUED,
+
+	/* Whether this has been submitted already. */
+	INTERVAL_SUBMITTED,
+
+	/* Whether the local backing device bio is complete. */
+	INTERVAL_BACKING_COMPLETED,
+
+	/* This has been completed already; ignore for conflict detection. */
+	INTERVAL_COMPLETED,
+
+	/* For verify requests: whether this has conflicts. */
+	INTERVAL_CONFLICT,
+
+	/* For resync requests: whether this was canceled while waiting for conflict resolution. */
+	INTERVAL_CANCELED,
+
+	/*
+	 * For local requests: whether this is done.
+	 *
+	 * Included here instead of in local_rq_state to allow access with
+	 * atomic bit operations instead of taking rq_lock.
+	 */
+	INTERVAL_DONE,
+
+	/*
+	 * For local requests: when we put the AL extent for this request, it
+	 * was the last in that extent.
+	 *
+	 * Included here instead of in local_rq_state to allow access with
+	 * atomic bit operations instead of taking rq_lock.
+	 */
+	INTERVAL_AL_EXTENT_LAST,
+};
+
+/* Intervals used to manage conflicts between application requests and various
+ * internal requests, so that the disk content is deterministic.
+ *
+ * The requests progress through states indicated by successively setting the
+ * flags "INTERVAL_SUBMITTED", "INTERVAL_BACKING_COMPLETED" and
+ * "INTERVAL_COMPLETED".
+ *
+ * Application and resync requests wait to be submitted until any conflicts
+ * that are "INTERVAL_SUBMITTED" have reached "INTERVAL_BACKING_COMPLETED"
+ * state. Application requests also wait for conflicting application requests
+ * to ensure consistency between the replicated copies. In addition,
+ * application requests wait for resync requests that have not yet been
+ * submitted. Resync takes priority over application writes in this way because
+ * a resync locks each block at most once, so it will finish at some point,
+ * whereas the application may repeatedly write the same blocks, which would
+ * potentially lock out resync indefinitely.
+ *
+ * Resync read requests do not conflict with each other, but they are
+ * nevertheless mutually exclusive with writes, so that the bitmap can be
+ * updated reliably.
+ *
+ * Verify requests do not wait for other requests. If there are conflicts, they
+ * are simply cancelled. Futhermore, they do not lock out other requests;
+ * instead they are simply marked as having conflicts and ignored.
+ *
+ * Application write request intervals are retained even when they are
+ * "INTERVAL_COMPLETED", so that they can be used to look up remote replies
+ * that are still pending.
+ */
 struct drbd_interval {
 	struct rb_node rb;
 	sector_t sector;		/* start sector of the interval */
 	sector_t end;			/* highest interval end in subtree */
 	unsigned int size;		/* size in bytes */
-	unsigned int local:1		/* local or remote request? */;
-	unsigned int waiting:1;		/* someone is waiting for completion */
-	unsigned int completed:1;	/* this has been completed already;
-					 * ignore for conflict detection */
+	enum drbd_interval_type type;	/* what type of interval this is */
+	unsigned long flags;
 
 	/* to resume a partially successful drbd_al_begin_io_nonblock(); */
 	unsigned int partially_in_al_next_enr;
 };
 
+static inline bool drbd_interval_is_application(struct drbd_interval *i)
+{
+	return i->type == INTERVAL_LOCAL_WRITE || i->type == INTERVAL_PEER_WRITE ||
+		i->type == INTERVAL_LOCAL_READ || i->type == INTERVAL_PEER_READ;
+}
+
+static inline bool drbd_interval_is_write(struct drbd_interval *i)
+{
+	return i->type == INTERVAL_LOCAL_WRITE || i->type == INTERVAL_PEER_WRITE ||
+		i->type == INTERVAL_RESYNC_WRITE;
+}
+
+static inline bool drbd_interval_is_resync(struct drbd_interval *i)
+{
+	return i->type == INTERVAL_RESYNC_WRITE || i->type == INTERVAL_RESYNC_READ;
+}
+
+static inline bool drbd_interval_is_verify(struct drbd_interval *i)
+{
+	return i->type == INTERVAL_OV_READ_SOURCE || i->type == INTERVAL_OV_READ_TARGET;
+}
+
+static inline bool drbd_interval_is_local(struct drbd_interval *i)
+{
+	return i->type == INTERVAL_LOCAL_READ || i->type == INTERVAL_LOCAL_WRITE;
+}
+
 static inline void drbd_clear_interval(struct drbd_interval *i)
 {
 	RB_CLEAR_NODE(&i->rb);
@@ -29,14 +158,17 @@ static inline bool drbd_interval_empty(struct drbd_interval *i)
 	return RB_EMPTY_NODE(&i->rb);
 }
 
-extern bool drbd_insert_interval(struct rb_root *, struct drbd_interval *);
-extern bool drbd_contains_interval(struct rb_root *, sector_t,
-				   struct drbd_interval *);
-extern void drbd_remove_interval(struct rb_root *, struct drbd_interval *);
-extern struct drbd_interval *drbd_find_overlap(struct rb_root *, sector_t,
-					unsigned int);
-extern struct drbd_interval *drbd_next_overlap(struct drbd_interval *, sector_t,
-					unsigned int);
+const char *drbd_interval_type_str(struct drbd_interval *i);
+bool drbd_insert_interval(struct rb_root *root, struct drbd_interval *this);
+bool drbd_contains_interval(struct rb_root *root, sector_t sector,
+			    struct drbd_interval *interval);
+void drbd_remove_interval(struct rb_root *root, struct drbd_interval *this);
+struct drbd_interval *drbd_find_overlap(struct rb_root *root, sector_t sector,
+					unsigned int size);
+struct drbd_interval *drbd_next_overlap(struct drbd_interval *i,
+					sector_t sector, unsigned int size);
+void drbd_update_interval_size(struct drbd_interval *this,
+			       unsigned int new_size);
 
 #define drbd_for_each_overlap(i, root, sector, size)		\
 	for (i = drbd_find_overlap(root, sector, size);		\
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index e201f0087a0f..463f57d33204 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -73,7 +73,7 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb);
 int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb);
 
-#include <linux/drbd_genl_api.h>
+#include "drbd_genl_api.h"
 #include "drbd_nla.h"
 #include <linux/genl_magic_func.h>
 
diff --git a/drivers/block/drbd/drbd_nla.c b/drivers/block/drbd/drbd_nla.c
index df0d241d3f6a..2dd6dc99823a 100644
--- a/drivers/block/drbd/drbd_nla.c
+++ b/drivers/block/drbd/drbd_nla.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/kernel.h>
 #include <net/netlink.h>
-#include <linux/drbd_genl_api.h>
+#include "drbd_genl_api.h"
 #include "drbd_nla.h"
 
 static int drbd_nla_check_mandatory(int maxtype, struct nlattr *nla)
diff --git a/drivers/block/drbd/drbd_nla.h b/drivers/block/drbd/drbd_nla.h
index d3555df0d353..4463657c020d 100644
--- a/drivers/block/drbd/drbd_nla.h
+++ b/drivers/block/drbd/drbd_nla.h
@@ -2,8 +2,9 @@
 #ifndef __DRBD_NLA_H
 #define __DRBD_NLA_H
 
-extern int drbd_nla_parse_nested(struct nlattr *tb[], int maxtype, struct nlattr *nla,
-				 const struct nla_policy *policy);
-extern struct nlattr *drbd_nla_find_nested(int maxtype, struct nlattr *nla, int attrtype);
+int drbd_nla_parse_nested(struct nlattr *tb[], int maxtype,
+			  struct nlattr *nla, const struct nla_policy *policy);
+struct nlattr *drbd_nla_find_nested(int maxtype, struct nlattr *nla,
+				    int attrtype);
 
 #endif  /* __DRBD_NLA_H */
diff --git a/drivers/block/drbd/drbd_polymorph_printk.h b/drivers/block/drbd/drbd_polymorph_printk.h
index 8e0082d139ba..7b0873d2980e 100644
--- a/drivers/block/drbd/drbd_polymorph_printk.h
+++ b/drivers/block/drbd/drbd_polymorph_printk.h
@@ -11,104 +11,188 @@
 #define DYNAMIC_DEBUG_BRANCH(D) false
 #endif
 
+#define __drbd_printk(level, fmt, args...)				\
+	printk(level fmt, ## args)
+#define __drbd_dyn_dbg(descriptor, fmt, args...)			\
+	__dynamic_pr_debug(descriptor, fmt, ## args)
+
+#define ___drbd_printk_device(prmacro, rlt, device, lvl_or_desc, fmt, args...)\
+({									\
+	const struct drbd_device *__d =					\
+		(const struct drbd_device *)(device);			\
+	const struct drbd_resource *__r = __d->resource;		\
+	const char *__unregistered = "";				\
+	if (test_bit(UNREGISTERED, &__d->flags))			\
+		__unregistered = "/unregistered/";			\
+	if (drbd_device_ratelimit(__d, rlt))				\
+		prmacro(lvl_or_desc, "drbd %s%s/%u drbd%u: " fmt,	\
+			__unregistered, __r->name, __d->vnr, __d->minor,\
+			## args);					\
+})
+
+#define ___drbd_printk_resource(prmacro, rlt, resource, lvl_or_desc, fmt, args...)\
+({									\
+	const struct drbd_resource *__r =				\
+		(const struct drbd_resource *)(resource);		\
+	const char *__unregistered = "";				\
+	if (test_bit(R_UNREGISTERED, &__r->flags))			\
+		__unregistered = "/unregistered/";			\
+	if (drbd_resource_ratelimit(__r, rlt))				\
+		prmacro(lvl_or_desc, "drbd %s%s: " fmt,			\
+			__unregistered, __r->name, ## args);		\
+})
+
+// As long as the connection is still "registered", the resource
+// can not yet be "unregistered", no need to test R_UNREGISTERED
+#define ___drbd_printk_peer_device(prmacro, rlt, peer_device, lvl_or_desc, fmt, args...)\
+({									\
+	const struct drbd_peer_device *__pd;				\
+	const struct drbd_device *__d;					\
+	const struct drbd_connection *__c;				\
+	const struct drbd_resource *__r;				\
+	const char *__cn;						\
+	const char *__unregistered = "";				\
+	rcu_read_lock();						\
+	__pd = (const struct drbd_peer_device *)(peer_device);		\
+	__d = __pd->device;						\
+	__c = __pd->connection;						\
+	__r = __d->resource;						\
+	__cn = rcu_dereference(__c->transport.net_conf)->name;		\
+	if (test_bit(C_UNREGISTERED, &__c->flags))			\
+		__unregistered = "/unregistered/";			\
+	if (drbd_peer_device_ratelimit(__pd, rlt))			\
+		prmacro(lvl_or_desc, "drbd %s%s/%u drbd%u %s: " fmt,		\
+			__unregistered, __r->name, __d->vnr, __d->minor, __cn,	\
+			 ## args);					\
+	rcu_read_unlock();						\
+})
+
+#define ___drbd_printk_connection(prmacro, rlt, connection, lvl_or_desc, fmt, args...)	\
+({									\
+	const struct drbd_connection *__c =				\
+		(const struct drbd_connection *)(connection);		\
+	const struct drbd_resource *__r = __c->resource;		\
+	const char *__cn;						\
+	const char *__unregistered = "";				\
+	rcu_read_lock();						\
+	__cn = rcu_dereference(__c->transport.net_conf)->name;		\
+	if (test_bit(C_UNREGISTERED, &__c->flags))			\
+		__unregistered = "/unregistered/";			\
+	if (drbd_connection_ratelimit(__c, rlt))			\
+		prmacro(lvl_or_desc, "drbd %s%s %s: " fmt,		\
+			__unregistered, __r->name, __cn, ## args);	\
+	rcu_read_unlock();						\
+})
 
-#define __drbd_printk_drbd_device_prep(device)			\
-	const struct drbd_device *__d = (device);		\
-	const struct drbd_resource *__r = __d->resource
-#define __drbd_printk_drbd_device_fmt(fmt)	"drbd %s/%u drbd%u: " fmt
-#define __drbd_printk_drbd_device_args()	__r->name, __d->vnr, __d->minor
-#define __drbd_printk_drbd_device_unprep()
-
-#define __drbd_printk_drbd_peer_device_prep(peer_device)	\
-	const struct drbd_device *__d;				\
-	const struct drbd_resource *__r;			\
-	__d = (peer_device)->device;				\
-	__r = __d->resource
-#define __drbd_printk_drbd_peer_device_fmt(fmt) \
-	"drbd %s/%u drbd%u: " fmt
-#define __drbd_printk_drbd_peer_device_args() \
-	__r->name, __d->vnr, __d->minor
-#define __drbd_printk_drbd_peer_device_unprep()
-
-#define __drbd_printk_drbd_resource_prep(resource) \
-	const struct drbd_resource *__r = resource
-#define __drbd_printk_drbd_resource_fmt(fmt) "drbd %s: " fmt
-#define __drbd_printk_drbd_resource_args()	__r->name
-#define __drbd_printk_drbd_resource_unprep(resource)
-
-#define __drbd_printk_drbd_connection_prep(connection)		\
-	const struct drbd_connection *__c = (connection);	\
-	const struct drbd_resource *__r = __c->resource
-#define __drbd_printk_drbd_connection_fmt(fmt)			\
-	"drbd %s: " fmt
-#define __drbd_printk_drbd_connection_args()			\
-	__r->name
-#define __drbd_printk_drbd_connection_unprep()
+#define __drbd_printk_device(rlt, device, level, fmt, args...)\
+	___drbd_printk_device(__drbd_printk, rlt, device, level, fmt, ## args)
+#define __drbd_printk_resource(rlt, resource, level, fmt, args...)\
+	 ___drbd_printk_resource(__drbd_printk, rlt, resource, level, fmt, ## args)
+#define __drbd_printk_peer_device(rlt, peer_device, level, fmt, args...)\
+	 ___drbd_printk_peer_device(__drbd_printk, rlt, peer_device, level, fmt, ## args)
+#define __drbd_printk_connection(rlt, connection, level, fmt, args...)\
+	 ___drbd_printk_connection(__drbd_printk, rlt, connection, level, fmt, ## args)
 
 void drbd_printk_with_wrong_object_type(void);
 void drbd_dyn_dbg_with_wrong_object_type(void);
 
 #define __drbd_printk_choose_cond(obj, struct_name) \
-	(__builtin_types_compatible_p(typeof(obj), struct struct_name *) || \
-	 __builtin_types_compatible_p(typeof(obj), const struct struct_name *))
-#define __drbd_printk_if_same_type(obj, struct_name, level, fmt, args...) \
-	__drbd_printk_choose_cond(obj, struct_name), \
-({ \
-	__drbd_printk_ ## struct_name ## _prep((const struct struct_name *)(obj)); \
-	printk(level __drbd_printk_ ## struct_name ## _fmt(fmt), \
-		__drbd_printk_ ## struct_name ## _args(), ## args); \
-	__drbd_printk_ ## struct_name ## _unprep(); \
-})
-
-#define drbd_printk(level, obj, fmt, args...) \
-	__builtin_choose_expr( \
-	  __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
-	  __builtin_choose_expr( \
-	    __drbd_printk_if_same_type(obj, drbd_resource, level, fmt, ## args), \
-	    __builtin_choose_expr( \
-	      __drbd_printk_if_same_type(obj, drbd_connection, level, fmt, ## args), \
-	      __builtin_choose_expr( \
-		__drbd_printk_if_same_type(obj, drbd_peer_device, level, fmt, ## args), \
-		drbd_printk_with_wrong_object_type()))))
+	(__builtin_types_compatible_p(typeof(obj), struct drbd_ ## struct_name *) || \
+	 __builtin_types_compatible_p(typeof(obj), const struct drbd_ ## struct_name *))
+
+#define __drbd_obj_ratelimit(struct_name, obj, rlt)		\
+	({							\
+	int __rlt = (rlt);					\
+	BUILD_BUG_ON(!__drbd_printk_choose_cond(obj, struct_name)); \
+	BUILD_BUG_ON(__rlt < -1);				\
+	BUILD_BUG_ON(__rlt >= (int)ARRAY_SIZE(obj->ratelimit)); \
+	__rlt == -1 ? 1						\
+	: __ratelimit(/* unconst cast ratelimit state */	\
+		(struct ratelimit_state *)(unsigned long)	\
+		&obj->ratelimit[__rlt]);			\
+	})
+
+#define drbd_device_ratelimit(obj, rlt)		\
+	__drbd_obj_ratelimit(device, obj, D_RL_D_ ## rlt)
+#define drbd_resource_ratelimit(obj, rlt)	\
+	__drbd_obj_ratelimit(resource, obj, D_RL_R_ ## rlt)
+#define drbd_connection_ratelimit(obj, rlt)	\
+	__drbd_obj_ratelimit(connection, obj, D_RL_C_ ## rlt)
+#define drbd_peer_device_ratelimit(obj, rlt)	\
+	__drbd_obj_ratelimit(peer_device, obj, D_RL_PD_ ## rlt)
+
+#define drbd_printk(ratelimit_type, level, obj, fmt, args...) \
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, device), \
+	__drbd_printk_device(ratelimit_type, obj, level, fmt, ## args), \
+	\
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, resource), \
+	__drbd_printk_resource(ratelimit_type, obj, level, fmt, ## args), \
+	\
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, connection), \
+	__drbd_printk_connection(ratelimit_type, obj, level, fmt, ## args), \
+	\
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, peer_device), \
+	__drbd_printk_peer_device(ratelimit_type, obj, level, fmt, ## args), \
+	\
+	drbd_printk_with_wrong_object_type() \
+	))))
 
 #define __drbd_dyn_dbg_if_same_type(obj, struct_name, fmt, args...) \
-	__drbd_printk_choose_cond(obj, struct_name), \
 ({ \
 	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(descriptor)) {			\
-		__drbd_printk_ ## struct_name ## _prep((const struct struct_name *)(obj)); \
-		__dynamic_pr_debug(&descriptor, __drbd_printk_ ## struct_name ## _fmt(fmt), \
-			__drbd_printk_ ## struct_name ## _args(), ## args); \
-		__drbd_printk_ ## struct_name ## _unprep();	\
+		___drbd_printk_ ## struct_name(			\
+			__drbd_dyn_dbg,				\
+				NOLIMIT, obj,			\
+				&descriptor, fmt, ## args);	\
 	}							\
 })
 
 #define dynamic_drbd_dbg(obj, fmt, args...) \
-	__builtin_choose_expr( \
-	  __drbd_dyn_dbg_if_same_type(obj, drbd_device, fmt, ## args), \
-	  __builtin_choose_expr( \
-	    __drbd_dyn_dbg_if_same_type(obj, drbd_resource, fmt, ## args), \
-	    __builtin_choose_expr( \
-	      __drbd_dyn_dbg_if_same_type(obj, drbd_connection, fmt, ## args), \
-	      __builtin_choose_expr( \
-		__drbd_dyn_dbg_if_same_type(obj, drbd_peer_device, fmt, ## args), \
-		drbd_dyn_dbg_with_wrong_object_type()))))
-
-#define drbd_emerg(device, fmt, args...) \
-	drbd_printk(KERN_EMERG, device, fmt, ## args)
-#define drbd_alert(device, fmt, args...) \
-	drbd_printk(KERN_ALERT, device, fmt, ## args)
-#define drbd_crit(device, fmt, args...) \
-	drbd_printk(KERN_CRIT, device, fmt, ## args)
-#define drbd_err(device, fmt, args...) \
-	drbd_printk(KERN_ERR, device, fmt, ## args)
-#define drbd_warn(device, fmt, args...) \
-	drbd_printk(KERN_WARNING, device, fmt, ## args)
-#define drbd_notice(device, fmt, args...) \
-	drbd_printk(KERN_NOTICE, device, fmt, ## args)
-#define drbd_info(device, fmt, args...) \
-	drbd_printk(KERN_INFO, device, fmt, ## args)
-
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, device), \
+	__drbd_dyn_dbg_if_same_type(obj, device, fmt, ## args), \
+	\
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, resource), \
+	__drbd_dyn_dbg_if_same_type(obj, resource, fmt, ## args), \
+	\
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, connection), \
+	__drbd_dyn_dbg_if_same_type(obj, connection, fmt, ## args), \
+	\
+	__builtin_choose_expr(__drbd_printk_choose_cond(obj, peer_device), \
+	__drbd_dyn_dbg_if_same_type(obj, peer_device, fmt, ## args), \
+	\
+	drbd_dyn_dbg_with_wrong_object_type() \
+	))))
+
+#define drbd_emerg_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_EMERG, obj, fmt, ## args)
+#define drbd_alert_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_ALERT, obj, fmt, ## args)
+#define drbd_crit_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_CRIT, obj, fmt, ## args)
+#define drbd_err_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_ERR, obj, fmt, ## args)
+#define drbd_warn_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_WARNING, obj, fmt, ## args)
+#define drbd_notice_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_NOTICE, obj, fmt, ## args)
+#define drbd_info_ratelimit(obj, fmt, args...) \
+	drbd_printk(GENERIC, KERN_INFO, obj, fmt, ## args)
+
+#define drbd_emerg(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_EMERG, obj, fmt,  ## args)
+#define drbd_alert(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_ALERT, obj, fmt,  ## args)
+#define drbd_crit(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_CRIT, obj, fmt,  ## args)
+#define drbd_err(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_ERR, obj, fmt,  ## args)
+#define drbd_warn(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_WARNING, obj, fmt,  ## args)
+#define drbd_notice(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_NOTICE, obj, fmt,  ## args)
+#define drbd_info(obj, fmt, args...) \
+	drbd_printk(NOLIMIT, KERN_INFO, obj, fmt,  ## args)
 
 #define drbd_ratelimit() \
 ({						\
@@ -122,7 +206,7 @@ void drbd_dyn_dbg_with_wrong_object_type(void);
 	do {									\
 		if (!(exp))							\
 			drbd_err(x, "ASSERTION %s FAILED in %s\n",		\
-				#exp, __func__);				\
+				 #exp, __func__);				\
 	} while (0)
 
 /**
@@ -130,12 +214,13 @@ void drbd_dyn_dbg_with_wrong_object_type(void);
  *
  * Unlike the assert macro, this macro returns a boolean result.
  */
-#define expect(x, exp) ({							\
-		bool _bool = (exp);						\
-		if (!_bool && drbd_ratelimit())					\
-			drbd_err(x, "ASSERTION %s FAILED in %s\n",		\
-				#exp, __func__);				\
-		_bool;								\
+#define expect(x, exp) ({					\
+		bool _bool = (exp);				\
+		if (!_bool)					\
+			drbd_err_ratelimit(x,			\
+				"ASSERTION %s FAILED in %s\n",	\
+				#exp, __func__);		\
+		_bool;						\
 		})
 
 #endif
diff --git a/drivers/block/drbd/drbd_req.h b/drivers/block/drbd/drbd_req.h
index 9ae860e7591b..e5770401cb7a 100644
--- a/drivers/block/drbd/drbd_req.h
+++ b/drivers/block/drbd/drbd_req.h
@@ -64,36 +64,31 @@
  */
 
 enum drbd_req_event {
-	CREATED,
-	TO_BE_SENT,
 	TO_BE_SUBMITTED,
 
-	/* XXX yes, now I am inconsistent...
-	 * these are not "events" but "actions"
-	 * oh, well... */
-	QUEUE_FOR_NET_WRITE,
-	QUEUE_FOR_NET_READ,
-	QUEUE_FOR_SEND_OOS,
+	NEW_NET_READ,
+	NEW_NET_WRITE,
+	NEW_NET_OOS,
+	READY_FOR_NET,
+	SKIP_OOS,
 
-	/* An empty flush is queued as P_BARRIER,
-	 * which will cause it to complete "successfully",
-	 * even if the local disk flush failed.
+	/* For an empty flush, mark that a corresponding barrier has been sent
+	 * to this peer. This causes it to complete "successfully", even if the
+	 * local disk flush failed.
 	 *
 	 * Just like "real" requests, empty flushes (blkdev_issue_flush()) will
 	 * only see an error if neither local nor remote data is reachable. */
-	QUEUE_AS_DRBD_BARRIER,
+	BARRIER_SENT,
 
 	SEND_CANCELED,
 	SEND_FAILED,
 	HANDED_OVER_TO_NETWORK,
 	OOS_HANDED_TO_NETWORK,
-	CONNECTION_LOST_WHILE_PENDING,
-	READ_RETRY_REMOTE_CANCELED,
+	CONNECTION_LOST,
+	CONNECTION_LOST_WHILE_SUSPENDED,
 	RECV_ACKED_BY_PEER,
 	WRITE_ACKED_BY_PEER,
 	WRITE_ACKED_BY_PEER_AND_SIS, /* and set_in_sync */
-	CONFLICT_RESOLVED,
-	POSTPONE_WRITE,
 	NEG_ACKED,
 	BARRIER_ACKED, /* in protocol A and B */
 	DATA_RECEIVED, /* (remote read) */
@@ -107,82 +102,93 @@ enum drbd_req_event {
 
 	ABORT_DISK_IO,
 	RESEND,
-	FAIL_FROZEN_DISK_IO,
-	RESTART_FROZEN_DISK_IO,
+	CANCEL_SUSPENDED_IO,
+	COMPLETION_RESUMED,
 	NOTHING,
 };
 
-/* encoding of request states for now.  we don't actually need that many bits.
- * we don't need to do atomic bit operations either, since most of the time we
- * need to look at the connection state and/or manipulate some lists at the
- * same time, so we should hold the request lock anyways.
+/*
+ * Encoding of request states. Modifications are protected by rq_lock. We don't
+ * do atomic bit operations.
  */
 enum drbd_req_state_bits {
-	/* 3210
-	 * 0000: no local possible
-	 * 0001: to be submitted
-	 *    UNUSED, we could map: 011: submitted, completion still pending
-	 * 0110: completed ok
-	 * 0010: completed with error
-	 * 1001: Aborted (before completion)
-	 * 1x10: Aborted and completed -> free
-	 */
-	__RQ_LOCAL_PENDING,
-	__RQ_LOCAL_COMPLETED,
-	__RQ_LOCAL_OK,
-	__RQ_LOCAL_ABORTED,
-
-	/* 87654
-	 * 00000: no network possible
-	 * 00001: to be send
-	 * 00011: to be send, on worker queue
-	 * 00101: sent, expecting recv_ack (B) or write_ack (C)
-	 * 11101: sent,
-	 *        recv_ack (B) or implicit "ack" (A),
-	 *        still waiting for the barrier ack.
-	 *        master_bio may already be completed and invalidated.
-	 * 11100: write acked (C),
-	 *        data received (for remote read, any protocol)
-	 *        or finally the barrier ack has arrived (B,A)...
-	 *        request can be freed
-	 * 01100: neg-acked (write, protocol C)
-	 *        or neg-d-acked (read, any protocol)
-	 *        or killed from the transfer log
-	 *        during cleanup after connection loss
-	 *        request can be freed
-	 * 01000: canceled or send failed...
-	 *        request can be freed
+	/*
+	 * Here are the possible combinations of the core net flags pending, pending-oos,
+	 * queued, ready, sent, done, ok.
+	 *
+	 * <none>:
+	 *   No network required, or not yet processed.
+	 * pending,queued:
+	 *   To be sent, must not be processed yet.
+	 * pending,queued,ready:
+	 *   To be sent, processing allowed.
+	 * pending,ready,sent:
+	 *   Sent, expecting P_RECV_ACK (B) or P_WRITE_ACK (C).
+	 * queued,ready,ok:
+	 *   P_RECV_ACK (B) or P_WRITE_ACK (C) received before request marked
+	 *   as having been sent.
+	 * ready,sent,ok:
+	 *   Sent, implicit "ack" (A), P_RECV_ACK (B) or P_WRITE_ACK (C) received.
+	 *   Still waiting for the barrier ack.
+	 *   master_bio may already be completed and invalidated.
+	 * pending:
+	 *   Intended for this peer, but connection lost before processing
+	 *   allowed.
+	 * pending,ready:
+	 *   Intended for this peer, but connection lost. If
+	 *   IO is suspended, it will stay in this state until the connection
+	 *   is restored or IO is resumed.
+	 * ready,sent,done,ok:
+	 *   Data received (for remote read, any protocol),
+	 *   or finally the barrier ack has arrived.
+	 * ready,sent,done:
+	 *   Received P_NEG_ACK for write (protocol C, or we are SyncSource),
+	 *   or P_NEG_DREPLY for read (any protocol).
+	 *   Or cleaned up after connection loss after send.
+	 * pending-oos,queued,done:
+	 *   P_OUT_OF_SYNC to be sent, must not be processed yet.
+	 * pending-oos,queued,ready,done:
+	 *   P_OUT_OF_SYNC to be sent, processing allowed.
+	 * queued,ready,done:
+	 *   P_OUT_OF_SYNC was intended, but skipped.
+	 * done:
+	 *   P_OUT_OF_SYNC was intended, but connection lost before processing
+	 *   allowed.
+	 * ready,done:
+	 *   P_OUT_OF_SYNC sent.
+	 *   Or cleaned up after connection loss, either before send or when
+	 *   only P_OUT_OF_SYNC was intended.
 	 */
 
-	/* if "SENT" is not set, yet, this can still fail or be canceled.
-	 * if "SENT" is set already, we still wait for an Ack packet.
-	 * when cleared, the master_bio may be completed.
-	 * in (B,A) the request object may still linger on the transaction log
-	 * until the corresponding barrier ack comes in */
+	/* Pending some network interaction towards the peer apart from
+	 * barriers or P_OUT_OF_SYNC.
+	 * If "sent" is not yet set, this can still fail or be canceled.
+	 * While set, the master_bio may not be completed. */
 	__RQ_NET_PENDING,
 
-	/* If it is QUEUED, and it is a WRITE, it is also registered in the
-	 * transfer log. Currently we need this flag to avoid conflicts between
-	 * worker canceling the request and tl_clear_barrier killing it from
-	 * transfer log.  We should restructure the code so this conflict does
-	 * no longer occur. */
+	/* Pending send of P_OUT_OF_SYNC */
+	__RQ_NET_PENDING_OOS,
+
+	/* The sender might store pointers to it */
 	__RQ_NET_QUEUED,
 
-	/* well, actually only "handed over to the network stack".
-	 *
-	 * TODO can potentially be dropped because of the similar meaning
-	 * of RQ_NET_SENT and ~RQ_NET_QUEUED.
-	 * however it is not exactly the same. before we drop it
-	 * we must ensure that we can tell a request with network part
-	 * from a request without, regardless of what happens to it. */
+	/* Ready for processing by the sender */
+	__RQ_NET_READY,
+
+	/* Well, actually only "handed over to the network stack". */
 	__RQ_NET_SENT,
 
-	/* when set, the request may be freed (if RQ_NET_QUEUED is clear).
-	 * basically this means the corresponding P_BARRIER_ACK was received */
+	/* When set, the data stage is done, as far as interaction with this
+	 * peer is concerned. Basically this means the corresponding
+	 * P_BARRIER_ACK was received. */
 	__RQ_NET_DONE,
 
-	/* whether or not we know (C) or pretend (B,A) that the write
-	 * was successfully written on the peer.
+	/* Set when the request was successful. That is, the corresponding
+	 * condition is fulfilled:
+	 * - The write was sent (A)
+	 * - Receipt of the write was acknowledged (B)
+	 * - The write was successfully written on the peer (C)
+	 * - Read data was received
 	 */
 	__RQ_NET_OK,
 
@@ -192,6 +198,29 @@ enum drbd_req_state_bits {
 	/* keep this last, its for the RQ_NET_MASK */
 	__RQ_NET_MAX,
 
+	/* We expect a receive ACK (wire proto B) */
+	__RQ_EXP_RECEIVE_ACK,
+
+	/* We expect a write ACK (wite proto C) */
+	__RQ_EXP_WRITE_ACK,
+
+	/* waiting for a barrier ack, did an extra kref_get */
+	__RQ_EXP_BARR_ACK,
+
+	/* 4321
+	 * 0000: no local possible
+	 * 0001: to be submitted
+	 *    UNUSED, we could map: 011: submitted, completion still pending
+	 * 0110: completed ok
+	 * 0010: completed with error
+	 * 1001: Aborted (before completion)
+	 * 1x10: Aborted and completed -> free
+	 */
+	__RQ_LOCAL_PENDING,
+	__RQ_LOCAL_COMPLETED,
+	__RQ_LOCAL_OK,
+	__RQ_LOCAL_ABORTED,
+
 	/* Set when this is a write, clear for a read */
 	__RQ_WRITE,
 	__RQ_WSAME,
@@ -212,26 +241,11 @@ enum drbd_req_state_bits {
 	/* would have been completed,
 	 * but was not, because of drbd_suspended() */
 	__RQ_COMPLETION_SUSP,
-
-	/* We expect a receive ACK (wire proto B) */
-	__RQ_EXP_RECEIVE_ACK,
-
-	/* We expect a write ACK (wite proto C) */
-	__RQ_EXP_WRITE_ACK,
-
-	/* waiting for a barrier ack, did an extra kref_get */
-	__RQ_EXP_BARR_ACK,
 };
-
-#define RQ_LOCAL_PENDING   (1UL << __RQ_LOCAL_PENDING)
-#define RQ_LOCAL_COMPLETED (1UL << __RQ_LOCAL_COMPLETED)
-#define RQ_LOCAL_OK        (1UL << __RQ_LOCAL_OK)
-#define RQ_LOCAL_ABORTED   (1UL << __RQ_LOCAL_ABORTED)
-
-#define RQ_LOCAL_MASK      ((RQ_LOCAL_ABORTED << 1)-1)
-
 #define RQ_NET_PENDING     (1UL << __RQ_NET_PENDING)
+#define RQ_NET_PENDING_OOS (1UL << __RQ_NET_PENDING_OOS)
 #define RQ_NET_QUEUED      (1UL << __RQ_NET_QUEUED)
+#define RQ_NET_READY       (1UL << __RQ_NET_READY)
 #define RQ_NET_SENT        (1UL << __RQ_NET_SENT)
 #define RQ_NET_DONE        (1UL << __RQ_NET_DONE)
 #define RQ_NET_OK          (1UL << __RQ_NET_OK)
@@ -239,6 +253,18 @@ enum drbd_req_state_bits {
 
 #define RQ_NET_MASK        (((1UL << __RQ_NET_MAX)-1) & ~RQ_LOCAL_MASK)
 
+#define RQ_EXP_RECEIVE_ACK (1UL << __RQ_EXP_RECEIVE_ACK)
+#define RQ_EXP_WRITE_ACK   (1UL << __RQ_EXP_WRITE_ACK)
+#define RQ_EXP_BARR_ACK    (1UL << __RQ_EXP_BARR_ACK)
+
+#define RQ_LOCAL_PENDING   (1UL << __RQ_LOCAL_PENDING)
+#define RQ_LOCAL_COMPLETED (1UL << __RQ_LOCAL_COMPLETED)
+#define RQ_LOCAL_OK        (1UL << __RQ_LOCAL_OK)
+#define RQ_LOCAL_ABORTED   (1UL << __RQ_LOCAL_ABORTED)
+
+#define RQ_LOCAL_MASK      \
+	(RQ_LOCAL_ABORTED | RQ_LOCAL_OK | RQ_LOCAL_COMPLETED | RQ_LOCAL_PENDING)
+
 #define RQ_WRITE           (1UL << __RQ_WRITE)
 #define RQ_WSAME           (1UL << __RQ_WSAME)
 #define RQ_UNMAP           (1UL << __RQ_UNMAP)
@@ -247,14 +273,25 @@ enum drbd_req_state_bits {
 #define RQ_UNPLUG          (1UL << __RQ_UNPLUG)
 #define RQ_POSTPONED	   (1UL << __RQ_POSTPONED)
 #define RQ_COMPLETION_SUSP (1UL << __RQ_COMPLETION_SUSP)
-#define RQ_EXP_RECEIVE_ACK (1UL << __RQ_EXP_RECEIVE_ACK)
-#define RQ_EXP_WRITE_ACK   (1UL << __RQ_EXP_WRITE_ACK)
-#define RQ_EXP_BARR_ACK    (1UL << __RQ_EXP_BARR_ACK)
 
-/* For waking up the frozen transfer log mod_req() has to return if the request
-   should be counted in the epoch object*/
-#define MR_WRITE       1
-#define MR_READ        2
+
+/* these flags go into local_rq_state,
+ * orhter flags go into their respective net_rq_state[idx] */
+#define RQ_STATE_0_MASK	\
+	(RQ_LOCAL_MASK  |\
+	 RQ_WRITE       |\
+	 RQ_WSAME       |\
+	 RQ_UNMAP       |\
+	 RQ_ZEROES      |\
+	 RQ_IN_ACT_LOG  |\
+	 RQ_UNPLUG      |\
+	 RQ_POSTPONED   |\
+	 RQ_COMPLETION_SUSP)
+
+static inline bool drbd_req_is_write(struct drbd_request *req)
+{
+	return req->local_rq_state & RQ_WRITE;
+}
 
 /* Short lived temporary struct on the stack.
  * We could squirrel the error to be returned into
@@ -264,61 +301,63 @@ struct bio_and_error {
 	int error;
 };
 
-extern void start_new_tl_epoch(struct drbd_connection *connection);
-extern void drbd_req_destroy(struct kref *kref);
-extern int __req_mod(struct drbd_request *req, enum drbd_req_event what,
-		struct drbd_peer_device *peer_device,
-		struct bio_and_error *m);
-extern void complete_master_bio(struct drbd_device *device,
-		struct bio_and_error *m);
-extern void request_timer_fn(struct timer_list *t);
-extern void tl_restart(struct drbd_connection *connection, enum drbd_req_event what);
-extern void _tl_restart(struct drbd_connection *connection, enum drbd_req_event what);
-extern void tl_abort_disk_io(struct drbd_device *device);
+bool start_new_tl_epoch(struct drbd_resource *resource);
+void drbd_req_destroy(struct kref *kref);
+void __req_mod(struct drbd_request *req, enum drbd_req_event what,
+	       struct drbd_peer_device *peer_device, struct bio_and_error *m);
+void complete_master_bio(struct drbd_device *device, struct bio_and_error *m);
+void drbd_release_conflicts(struct drbd_device *device,
+			    struct drbd_interval *release_interval);
+void drbd_put_ref_tl_walk(struct drbd_request *req, int done_put, int oos_send_put);
+void drbd_set_pending_out_of_sync(struct drbd_peer_device *peer_device);
+void request_timer_fn(struct timer_list *t);
+void tl_walk(struct drbd_connection *connection,
+	     struct drbd_request **from_req, enum drbd_req_event what);
+void __tl_walk(struct drbd_resource * const resource,
+	       struct drbd_connection * const connection,
+	       struct drbd_request **from_req, const enum drbd_req_event what);
+void drbd_destroy_peer_ack_if_done(struct drbd_peer_ack *peer_ack);
+int w_queue_peer_ack(struct drbd_work *w, int cancel);
+void drbd_queue_peer_ack(struct drbd_resource *resource,
+			 struct drbd_request *req);
+bool drbd_should_do_remote(struct drbd_peer_device *peer_device,
+			   enum which_state which);
+void drbd_reclaim_req(struct rcu_head *rp);
 
 /* this is in drbd_main.c */
-extern void drbd_restart_request(struct drbd_request *req);
+void drbd_restart_request(struct drbd_request *req);
+void drbd_restart_suspended_reqs(struct drbd_resource *resource);
 
 /* use this if you don't want to deal with calling complete_master_bio()
  * outside the spinlock, e.g. when walking some list on cleanup. */
-static inline int _req_mod(struct drbd_request *req, enum drbd_req_event what,
+static inline void _req_mod(struct drbd_request *req, enum drbd_req_event what,
 		struct drbd_peer_device *peer_device)
 {
 	struct drbd_device *device = req->device;
 	struct bio_and_error m;
-	int rv;
 
 	/* __req_mod possibly frees req, do not touch req after that! */
-	rv = __req_mod(req, what, peer_device, &m);
+	__req_mod(req, what, peer_device, &m);
 	if (m.bio)
 		complete_master_bio(device, &m);
-
-	return rv;
 }
 
-/* completion of master bio is outside of our spinlock.
- * We still may or may not be inside some irqs disabled section
- * of the lower level driver completion callback, so we need to
- * spin_lock_irqsave here. */
-static inline int req_mod(struct drbd_request *req,
+/* completion of master bio is outside of spinlock.
+ * If you need it irqsave, do it your self!
+ * Which means: don't use from bio endio callback. */
+static inline void req_mod(struct drbd_request *req,
 		enum drbd_req_event what,
 		struct drbd_peer_device *peer_device)
 {
-	unsigned long flags;
 	struct drbd_device *device = req->device;
 	struct bio_and_error m;
-	int rv;
 
-	spin_lock_irqsave(&device->resource->req_lock, flags);
-	rv = __req_mod(req, what, peer_device, &m);
-	spin_unlock_irqrestore(&device->resource->req_lock, flags);
+	read_lock_irq(&device->resource->state_rwlock);
+	__req_mod(req, what, peer_device, &m);
+	read_unlock_irq(&device->resource->state_rwlock);
 
 	if (m.bio)
 		complete_master_bio(device, &m);
-
-	return rv;
 }
 
-extern bool drbd_should_do_remote(union drbd_dev_state);
-
 #endif
diff --git a/drivers/block/drbd/drbd_state.h b/drivers/block/drbd/drbd_state.h
index cbaeb8018dbf..2ae525c1760e 100644
--- a/drivers/block/drbd/drbd_state.h
+++ b/drivers/block/drbd/drbd_state.h
@@ -2,26 +2,19 @@
 #ifndef DRBD_STATE_H
 #define DRBD_STATE_H
 
+#include "drbd_protocol.h"
+
+struct drbd_resource;
 struct drbd_device;
 struct drbd_connection;
+struct drbd_peer_device;
+struct drbd_work;
+struct twopc_request;
 
 /**
  * DOC: DRBD State macros
  *
  * These macros are used to express state changes in easily readable form.
- *
- * The NS macros expand to a mask and a value, that can be bit ored onto the
- * current state as soon as the spinlock (req_lock) was taken.
- *
- * The _NS macros are used for state functions that get called with the
- * spinlock. These macros expand directly to the new state value.
- *
- * Besides the basic forms NS() and _NS() additional _?NS[23] are defined
- * to express state changes that affect more than one aspect of the state.
- *
- * E.g. NS2(conn, C_CONNECTED, peer, R_SECONDARY)
- * Means that the network connection was established and that the peer
- * is in secondary role.
  */
 #define role_MASK R_MASK
 #define peer_MASK R_MASK
@@ -34,141 +27,168 @@ struct drbd_connection;
 #define susp_nod_MASK 1
 #define susp_fen_MASK 1
 
-#define NS(T, S) \
-	({ union drbd_state mask; mask.i = 0; mask.T = T##_MASK; mask; }), \
-	({ union drbd_state val; val.i = 0; val.T = (S); val; })
-#define NS2(T1, S1, T2, S2) \
-	({ union drbd_state mask; mask.i = 0; mask.T1 = T1##_MASK; \
-	  mask.T2 = T2##_MASK; mask; }), \
-	({ union drbd_state val; val.i = 0; val.T1 = (S1); \
-	  val.T2 = (S2); val; })
-#define NS3(T1, S1, T2, S2, T3, S3) \
-	({ union drbd_state mask; mask.i = 0; mask.T1 = T1##_MASK; \
-	  mask.T2 = T2##_MASK; mask.T3 = T3##_MASK; mask; }), \
-	({ union drbd_state val;  val.i = 0; val.T1 = (S1); \
-	  val.T2 = (S2); val.T3 = (S3); val; })
-
-#define _NS(D, T, S) \
-	D, ({ union drbd_state __ns; __ns = drbd_read_state(D); __ns.T = (S); __ns; })
-#define _NS2(D, T1, S1, T2, S2) \
-	D, ({ union drbd_state __ns; __ns = drbd_read_state(D); __ns.T1 = (S1); \
-	__ns.T2 = (S2); __ns; })
-#define _NS3(D, T1, S1, T2, S2, T3, S3) \
-	D, ({ union drbd_state __ns; __ns = drbd_read_state(D); __ns.T1 = (S1); \
-	__ns.T2 = (S2); __ns.T3 = (S3); __ns; })
-
 enum chg_state_flags {
-	CS_HARD	         = 1 << 0,
+	CS_HARD          = 1 << 0, /* Forced state change, such as a connection loss */
 	CS_VERBOSE       = 1 << 1,
 	CS_WAIT_COMPLETE = 1 << 2,
 	CS_SERIALIZE     = 1 << 3,
-	CS_ORDERED       = CS_WAIT_COMPLETE + CS_SERIALIZE,
-	CS_LOCAL_ONLY    = 1 << 4, /* Do not consider a device pair wide state change */
-	CS_DC_ROLE       = 1 << 5, /* DC = display as connection state change */
-	CS_DC_PEER       = 1 << 6,
-	CS_DC_CONN       = 1 << 7,
-	CS_DC_DISK       = 1 << 8,
-	CS_DC_PDSK       = 1 << 9,
-	CS_DC_SUSP       = 1 << 10,
-	CS_DC_MASK       = CS_DC_ROLE + CS_DC_PEER + CS_DC_CONN + CS_DC_DISK + CS_DC_PDSK,
-	CS_IGN_OUTD_FAIL = 1 << 11,
-
-	/* Make sure no meta data IO is in flight, by calling
-	 * drbd_md_get_buffer().  Used for graceful detach. */
-	CS_INHIBIT_MD_IO = 1 << 12,
+	CS_ALREADY_SERIALIZED = 1 << 4, /* resource->state_sem already taken */
+	CS_LOCAL_ONLY    = 1 << 5, /* Do not consider a cluster-wide state change */
+	CS_PREPARE	 = 1 << 6,
+	CS_PREPARED	 = 1 << 7,
+	CS_ABORT	 = 1 << 8,
+	CS_TWOPC	 = 1 << 9,
+	CS_IGN_OUTD_FAIL = 1 << 10,
+	CS_DONT_RETRY    = 1 << 11, /* Disable internal retry. Caller has a retry loop */
+	CS_FORCE_RECALC  = 1 << 13, /* Force re-evaluation of state logic */
+	CS_CLUSTER_WIDE  = 1 << 14, /* Make this a cluster wide state change! */
+	CS_FP_LOCAL_UP_TO_DATE = 1 << 15, /* force promotion by making local disk state up_to_date */
+	CS_FP_OUTDATE_PEERS = 1 << 16, /* force promotion by marking unknown peers as outdated */
+	CS_FS_IGN_OPENERS = 1 << 17, /* force demote, ignore openers */
 };
 
-/* drbd_dev_state and drbd_state are different types. This is to stress the
-   small difference. There is no suspended flag (.susp), and no suspended
-   while fence handler runs flas (susp_fen). */
-union drbd_dev_state {
-	struct {
-#if defined(__LITTLE_ENDIAN_BITFIELD)
-		unsigned role:2 ;   /* 3/4	 primary/secondary/unknown */
-		unsigned peer:2 ;   /* 3/4	 primary/secondary/unknown */
-		unsigned conn:5 ;   /* 17/32	 cstates */
-		unsigned disk:4 ;   /* 8/16	 from D_DISKLESS to D_UP_TO_DATE */
-		unsigned pdsk:4 ;   /* 8/16	 from D_DISKLESS to D_UP_TO_DATE */
-		unsigned _unused:1 ;
-		unsigned aftr_isp:1 ; /* isp .. imposed sync pause */
-		unsigned peer_isp:1 ;
-		unsigned user_isp:1 ;
-		unsigned _pad:11;   /* 0	 unused */
-#elif defined(__BIG_ENDIAN_BITFIELD)
-		unsigned _pad:11;
-		unsigned user_isp:1 ;
-		unsigned peer_isp:1 ;
-		unsigned aftr_isp:1 ; /* isp .. imposed sync pause */
-		unsigned _unused:1 ;
-		unsigned pdsk:4 ;   /* 8/16	 from D_DISKLESS to D_UP_TO_DATE */
-		unsigned disk:4 ;   /* 8/16	 from D_DISKLESS to D_UP_TO_DATE */
-		unsigned conn:5 ;   /* 17/32	 cstates */
-		unsigned peer:2 ;   /* 3/4	 primary/secondary/unknown */
-		unsigned role:2 ;   /* 3/4	 primary/secondary/unknown */
-#else
-# error "this endianess is not supported"
-#endif
-	};
-	unsigned int i;
-};
+void drbd_resume_al(struct drbd_device *device);
 
-extern enum drbd_state_rv drbd_change_state(struct drbd_device *device,
-					    enum chg_state_flags f,
-					    union drbd_state mask,
-					    union drbd_state val);
-extern void drbd_force_state(struct drbd_device *, union drbd_state,
-			union drbd_state);
-extern enum drbd_state_rv _drbd_request_state(struct drbd_device *,
-					      union drbd_state,
-					      union drbd_state,
-					      enum chg_state_flags);
-
-extern enum drbd_state_rv
-_drbd_request_state_holding_state_mutex(struct drbd_device *, union drbd_state,
-					union drbd_state, enum chg_state_flags);
-
-extern enum drbd_state_rv _drbd_set_state(struct drbd_device *, union drbd_state,
-					  enum chg_state_flags,
-					  struct completion *done);
-extern void print_st_err(struct drbd_device *, union drbd_state,
-			union drbd_state, enum drbd_state_rv);
-
-enum drbd_state_rv
-_conn_request_state(struct drbd_connection *connection, union drbd_state mask, union drbd_state val,
-		    enum chg_state_flags flags);
-
-enum drbd_state_rv
-conn_request_state(struct drbd_connection *connection, union drbd_state mask, union drbd_state val,
-		   enum chg_state_flags flags);
-
-extern void drbd_resume_al(struct drbd_device *device);
-extern bool conn_all_vols_unconf(struct drbd_connection *connection);
+enum drbd_disk_state conn_highest_disk(struct drbd_connection *connection);
+enum drbd_disk_state conn_highest_pdsk(struct drbd_connection *connection);
 
-/**
- * drbd_request_state() - Request a state change
- * @device:	DRBD device.
- * @mask:	mask of state bits to change.
- * @val:	value of new state bits.
- *
- * This is the most graceful way of requesting a state change. It is verbose
- * quite verbose in case the state change is not possible, and all those
- * state changes are globally serialized.
- */
-static inline int drbd_request_state(struct drbd_device *device,
-				     union drbd_state mask,
-				     union drbd_state val)
+void state_change_lock(struct drbd_resource *resource,
+		       unsigned long *irq_flags, enum chg_state_flags flags);
+void state_change_unlock(struct drbd_resource *resource,
+			 unsigned long *irq_flags);
+
+void begin_state_change(struct drbd_resource *resource,
+			unsigned long *irq_flags, enum chg_state_flags flags);
+enum drbd_state_rv end_state_change(struct drbd_resource *resource,
+				    unsigned long *irq_flags, const char *tag);
+void abort_state_change(struct drbd_resource *resource,
+			unsigned long *irq_flags);
+void abort_state_change_locked(struct drbd_resource *resource);
+
+void begin_state_change_locked(struct drbd_resource *resource,
+			       enum chg_state_flags flags);
+enum drbd_state_rv end_state_change_locked(struct drbd_resource *resource,
+					   const char *tag);
+
+void clear_remote_state_change(struct drbd_resource *resource);
+void __clear_remote_state_change(struct drbd_resource *resource);
+
+
+enum which_state;
+bool drbd_all_peer_replication(struct drbd_device *device, enum which_state which);
+union drbd_state drbd_get_device_state(struct drbd_device *device,
+				       enum which_state which);
+union drbd_state drbd_get_peer_device_state(struct drbd_peer_device *peer_device,
+					    enum which_state which);
+
+#define stable_state_change(resource, change_state) ({				\
+		enum drbd_state_rv rv;						\
+		int err;							\
+		err = wait_event_interruptible((resource)->state_wait,		\
+			(rv = (change_state)) != SS_IN_TRANSIENT_STATE);	\
+		if (err)							\
+			err = -SS_UNKNOWN_ERROR;				\
+		else								\
+			err = rv;						\
+		err;								\
+	})
+
+void nested_twopc_work(struct work_struct *work);
+void drbd_maybe_cluster_wide_reply(struct drbd_resource *resource);
+enum drbd_state_rv nested_twopc_request(struct drbd_resource *resource,
+					struct twopc_request *request);
+bool drbd_twopc_between_peer_and_me(struct drbd_connection *connection);
+bool cluster_wide_reply_ready(struct drbd_resource *resource);
+
+enum drbd_state_rv change_role(struct drbd_resource *resource,
+			       enum drbd_role role,
+			       enum chg_state_flags flags, const char *tag,
+			       const char **err_str);
+
+void __change_io_susp_user(struct drbd_resource *resource, bool value);
+enum drbd_state_rv change_io_susp_user(struct drbd_resource *resource,
+				       bool value, enum chg_state_flags flags);
+void __change_io_susp_no_data(struct drbd_resource *resource, bool value);
+void __change_io_susp_fencing(struct drbd_connection *connection, bool value);
+void __change_io_susp_quorum(struct drbd_resource *resource, bool value);
+
+void __change_disk_state(struct drbd_device *device,
+			 enum drbd_disk_state disk_state);
+void __downgrade_disk_states(struct drbd_resource *resource,
+			     enum drbd_disk_state disk_state);
+enum drbd_state_rv change_disk_state(struct drbd_device *device,
+				     enum drbd_disk_state disk_state,
+				     enum chg_state_flags flags,
+				     const char *tag, const char **err_str);
+
+void __change_cstate(struct drbd_connection *connection,
+		     enum drbd_conn_state cstate);
+enum drbd_state_rv change_cstate_tag(struct drbd_connection *connection,
+				     enum drbd_conn_state cstate,
+				     enum chg_state_flags flags,
+				     const char *tag, const char **err_str);
+static inline enum drbd_state_rv change_cstate(struct drbd_connection *connection,
+					       enum drbd_conn_state cstate,
+					       enum chg_state_flags flags)
 {
-	return _drbd_request_state(device, mask, val, CS_VERBOSE + CS_ORDERED);
+	return change_cstate_tag(connection, cstate, flags, NULL, NULL);
 }
 
-/* for use in adm_detach() (drbd_adm_detach(), drbd_adm_down()) */
-int drbd_request_detach_interruptible(struct drbd_device *device);
-
-enum drbd_role conn_highest_role(struct drbd_connection *connection);
-enum drbd_role conn_highest_peer(struct drbd_connection *connection);
-enum drbd_disk_state conn_highest_disk(struct drbd_connection *connection);
-enum drbd_disk_state conn_lowest_disk(struct drbd_connection *connection);
-enum drbd_disk_state conn_highest_pdsk(struct drbd_connection *connection);
-enum drbd_conns conn_lowest_conn(struct drbd_connection *connection);
-
+void __change_peer_role(struct drbd_connection *connection,
+			enum drbd_role peer_role);
+
+void __change_repl_state(struct drbd_peer_device *peer_device,
+			 enum drbd_repl_state repl_state);
+enum drbd_state_rv change_repl_state(struct drbd_peer_device *peer_device,
+				     enum drbd_repl_state new_repl_state,
+				     enum chg_state_flags flags,
+				     const char *tag);
+enum drbd_state_rv stable_change_repl_state(struct drbd_peer_device *peer_device,
+					    enum drbd_repl_state repl_state,
+					    enum chg_state_flags flags,
+					    const char *tag);
+
+void __change_peer_disk_state(struct drbd_peer_device *peer_device,
+			      enum drbd_disk_state disk_state);
+void __downgrade_peer_disk_states(struct drbd_connection *connection,
+				  enum drbd_disk_state disk_state);
+void __outdate_myself(struct drbd_resource *resource);
+enum drbd_state_rv change_peer_disk_state(struct drbd_peer_device *peer_device,
+					  enum drbd_disk_state disk_state,
+					  enum chg_state_flags flags,
+					  const char *tag);
+
+void __change_resync_susp_user(struct drbd_peer_device *peer_device,
+			       bool value);
+enum drbd_state_rv change_resync_susp_user(struct drbd_peer_device *peer_device,
+					   bool value,
+					   enum chg_state_flags flags);
+void __change_resync_susp_peer(struct drbd_peer_device *peer_device,
+			       bool value);
+void __change_resync_susp_dependency(struct drbd_peer_device *peer_device,
+				     bool value);
+void apply_connect(struct drbd_connection *connection, bool commit);
+
+struct drbd_work;
+
+bool resource_is_suspended(struct drbd_resource *resource,
+			   enum which_state which);
+bool is_suspended_fen(struct drbd_resource *resource, enum which_state which);
+
+enum dds_flags;
+enum determine_dev_size;
+struct resize_parms;
+
+enum determine_dev_size
+change_cluster_wide_device_size(struct drbd_device *device,
+				sector_t local_max_size,
+				uint64_t new_user_size,
+				enum dds_flags dds_flags,
+				struct resize_parms *rs);
+
+bool drbd_data_accessible(struct drbd_device *device, enum which_state which);
+bool drbd_res_data_accessible(struct drbd_resource *resource);
+
+
+void drbd_empty_twopc_work_fn(struct work_struct *work);
 #endif
diff --git a/drivers/block/drbd/drbd_state_change.h b/drivers/block/drbd/drbd_state_change.h
index a56a57d67686..bb68684a5fd3 100644
--- a/drivers/block/drbd/drbd_state_change.h
+++ b/drivers/block/drbd/drbd_state_change.h
@@ -7,58 +7,80 @@ struct drbd_resource_state_change {
 	enum drbd_role role[2];
 	bool susp[2];
 	bool susp_nod[2];
-	bool susp_fen[2];
+	bool susp_uuid[2];
+	bool fail_io[2];
 };
 
 struct drbd_device_state_change {
 	struct drbd_device *device;
 	enum drbd_disk_state disk_state[2];
+	bool have_quorum[2];
 };
 
 struct drbd_connection_state_change {
 	struct drbd_connection *connection;
-	enum drbd_conns cstate[2];  /* drbd9: enum drbd_conn_state */
+	enum drbd_conn_state cstate[2];
 	enum drbd_role peer_role[2];
+	bool susp_fen[2];
+};
+
+/* exception: stores state, not change.
+ * for get_initial_state. */
+struct drbd_path_state {
+	struct drbd_connection *connection;
+	struct drbd_path *path;
+	/* not an array,
+	 * because it's not an array in struct drbd_path either */
+	bool path_established;
 };
 
 struct drbd_peer_device_state_change {
 	struct drbd_peer_device *peer_device;
 	enum drbd_disk_state disk_state[2];
-	enum drbd_conns repl_state[2];  /* drbd9: enum drbd_repl_state */
+	enum drbd_repl_state repl_state[2];
 	bool resync_susp_user[2];
 	bool resync_susp_peer[2];
 	bool resync_susp_dependency[2];
+	bool resync_susp_other_c[2];
+	bool resync_active[2];
+	bool replication[2];
+	bool peer_replication[2];
+};
+
+struct drbd_state_change_object_count {
+	unsigned int n_devices;
+	unsigned int n_connections;
+	unsigned int n_paths;
 };
 
 struct drbd_state_change {
 	struct list_head list;
 	unsigned int n_devices;
 	unsigned int n_connections;
+	unsigned int n_paths;
 	struct drbd_resource_state_change resource[1];
 	struct drbd_device_state_change *devices;
 	struct drbd_connection_state_change *connections;
 	struct drbd_peer_device_state_change *peer_devices;
+	struct drbd_path_state *paths;
 };
 
-extern struct drbd_state_change *remember_old_state(struct drbd_resource *, gfp_t);
-extern void copy_old_to_new_state_change(struct drbd_state_change *);
-extern void forget_state_change(struct drbd_state_change *);
+struct drbd_state_change *remember_state_change(struct drbd_resource *resource,
+						gfp_t gfp);
+void copy_old_to_new_state_change(struct drbd_state_change *state_change);
+void forget_state_change(struct drbd_state_change *state_change);
 
-extern int notify_resource_state_change(struct sk_buff *,
-					 unsigned int,
-					 void *,
-					 enum drbd_notification_type type);
-extern int notify_connection_state_change(struct sk_buff *,
-					   unsigned int,
-					   void *,
-					   enum drbd_notification_type type);
-extern int notify_device_state_change(struct sk_buff *,
-				       unsigned int,
-				       void *,
-				       enum drbd_notification_type type);
-extern int notify_peer_device_state_change(struct sk_buff *,
-					    unsigned int,
-					    void *,
-					    enum drbd_notification_type type);
+int notify_resource_state_change(struct sk_buff *skb, unsigned int seq,
+				 void *state_change,
+				 enum drbd_notification_type type);
+int notify_connection_state_change(struct sk_buff *skb, unsigned int seq,
+				   void *state_change,
+				   enum drbd_notification_type type);
+int notify_device_state_change(struct sk_buff *skb, unsigned int seq,
+			       void *state_change,
+			       enum drbd_notification_type type);
+int notify_peer_device_state_change(struct sk_buff *skb, unsigned int seq,
+				    void *state_change,
+				    enum drbd_notification_type type);
 
 #endif  /* DRBD_STATE_CHANGE_H */
diff --git a/drivers/block/drbd/drbd_strings.h b/drivers/block/drbd/drbd_strings.h
index 0201f6590f6a..f376ce28a815 100644
--- a/drivers/block/drbd/drbd_strings.h
+++ b/drivers/block/drbd/drbd_strings.h
@@ -2,9 +2,26 @@
 #ifndef __DRBD_STRINGS_H
 #define __DRBD_STRINGS_H
 
-extern const char *drbd_conn_str(enum drbd_conns);
-extern const char *drbd_role_str(enum drbd_role);
-extern const char *drbd_disk_str(enum drbd_disk_state);
-extern const char *drbd_set_st_err_str(enum drbd_state_rv);
+struct state_names {
+	const char * const *names;
+	unsigned int size;
+};
+
+extern struct state_names drbd_conn_state_names;
+extern struct state_names drbd_repl_state_names;
+extern struct state_names drbd_role_state_names;
+extern struct state_names drbd_disk_state_names;
+extern struct state_names drbd_error_messages;
+extern struct state_names drbd_packet_names;
+
+enum drbd_packet;
+
+const char *drbd_repl_str(enum drbd_repl_state s);
+const char *drbd_conn_str(enum drbd_conn_state s);
+const char *drbd_role_str(enum drbd_role s);
+const char *drbd_disk_str(enum drbd_disk_state s);
+const char *drbd_set_st_err_str(enum drbd_state_rv err);
+const char *drbd_packet_name(enum drbd_packet cmd);
+
 
 #endif  /* __DRBD_STRINGS_H */
diff --git a/drivers/block/drbd/drbd_transport_lb-tcp.c b/drivers/block/drbd/drbd_transport_lb-tcp.c
index 497fca8c413c..29f18df2be88 100644
--- a/drivers/block/drbd/drbd_transport_lb-tcp.c
+++ b/drivers/block/drbd/drbd_transport_lb-tcp.c
@@ -15,10 +15,10 @@
 #include <linux/tcp.h>
 #include <linux/highmem.h>
 #include <linux/bio.h>
-#include <linux/drbd_genl_api.h>
-#include <linux/drbd_config.h>
+#include "drbd_genl_api.h"
 #include <net/tcp.h>
 #include "drbd_protocol.h"
+#include "drbd_config.h"
 #include "drbd_transport.h"
 
 
diff --git a/drivers/block/drbd/drbd_transport_rdma.c b/drivers/block/drbd/drbd_transport_rdma.c
index 21790a769d63..fbdf6a4bcda9 100644
--- a/drivers/block/drbd/drbd_transport_rdma.c
+++ b/drivers/block/drbd/drbd_transport_rdma.c
@@ -28,10 +28,10 @@
 #include <rdma/rdma_cm.h>
 #include <rdma/ib_cm.h>
 #include <linux/interrupt.h>
-#include <linux/drbd_genl_api.h>
+#include "drbd_genl_api.h"
 #include "drbd_protocol.h"
 #include "drbd_transport.h"
-#include "linux/drbd_config.h" /* for REL_VERSION */
+#include "drbd_config.h" /* for REL_VERSION */
 
 /* Nearly all data transfer uses the send/receive semantics. No need to
    actually use RDMA WRITE / READ.
diff --git a/drivers/block/drbd/drbd_transport_tcp.c b/drivers/block/drbd/drbd_transport_tcp.c
index 31885ff9341f..5faa6b82c358 100644
--- a/drivers/block/drbd/drbd_transport_tcp.c
+++ b/drivers/block/drbd/drbd_transport_tcp.c
@@ -19,14 +19,14 @@
 #include <linux/tcp.h>
 #include <linux/highmem.h>
 #include <linux/bio.h>
-#include <linux/drbd_genl_api.h>
-#include <linux/drbd_config.h>
+#include "drbd_genl_api.h"
 #include <linux/tls.h>
 #include <net/tcp.h>
 #include <net/handshake.h>
 #include <net/tls.h>
 #include <net/tls_prot.h>
 #include "drbd_protocol.h"
+#include "drbd_config.h"
 #include "drbd_transport.h"
 
 
diff --git a/include/linux/drbd.h b/include/linux/drbd.h
index 5468a2399d48..ed408088a282 100644
--- a/include/linux/drbd.h
+++ b/include/linux/drbd.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
   drbd.h
   Kernel module for 2.6.x Kernels
@@ -9,10 +9,10 @@
   Copyright (C) 2001-2008, Philipp Reisner <philipp.reisner@linbit.com>.
   Copyright (C) 2001-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
 
-
 */
 #ifndef DRBD_H
 #define DRBD_H
+
 #include <asm/types.h>
 
 #ifdef __KERNEL__
@@ -44,8 +44,7 @@ enum drbd_io_error_p {
 	EP_DETACH
 };
 
-enum drbd_fencing_p {
-	FP_NOT_AVAIL = -1, /* Not a policy */
+enum drbd_fencing_policy {
 	FP_DONT_CARE = 0,
 	FP_RESOURCE,
 	FP_STONITH
@@ -68,7 +67,9 @@ enum drbd_after_sb_p {
 	ASB_CONSENSUS,
 	ASB_DISCARD_SECONDARY,
 	ASB_CALL_HELPER,
-	ASB_VIOLENTLY
+	ASB_VIOLENTLY,
+	ASB_RETRY_CONNECT,
+	ASB_AUTO_DISCARD,
 };
 
 enum drbd_on_no_data {
@@ -76,6 +77,16 @@ enum drbd_on_no_data {
 	OND_SUSPEND_IO
 };
 
+enum drbd_on_no_quorum {
+	ONQ_IO_ERROR = OND_IO_ERROR,
+	ONQ_SUSPEND_IO = OND_SUSPEND_IO
+};
+
+enum drbd_on_susp_primary_outdated {
+	SPO_DISCONNECT,
+	SPO_FORCE_SECONDARY,
+};
+
 enum drbd_on_congestion {
 	OC_BLOCK,
 	OC_PULL_AHEAD,
@@ -96,6 +107,11 @@ enum drbd_read_balancing {
 	RB_1M_STRIPING,
 };
 
+/* Windows km/dderror.h has that a 0L */
+#ifdef NO_ERROR
+#undef NO_ERROR
+#endif
+
 /* KEEP the order, do not delete or insert. Only append. */
 enum drbd_ret_code {
 	ERR_CODE_BASE		= 100,
@@ -162,6 +178,12 @@ enum drbd_ret_code {
 	ERR_MD_LAYOUT_TOO_SMALL = 168,
 	ERR_MD_LAYOUT_NO_FIT    = 169,
 	ERR_IMPLICIT_SHRINK     = 170,
+	ERR_INVALID_PEER_NODE_ID = 171,
+	ERR_CREATE_TRANSPORT    = 172,
+	ERR_LOCAL_AND_PEER_ADDR = 173,
+	ERR_ALREADY_EXISTS 	= 174,
+	ERR_APV_TOO_LOW         = 175,
+
 	/* insert new ones above this line */
 	AFTER_LAST_ERR_CODE
 };
@@ -178,17 +200,17 @@ enum drbd_role {
 };
 
 /* The order of these constants is important.
- * The lower ones (<C_WF_REPORT_PARAMS) indicate
+ * The lower ones (< C_CONNECTED) indicate
  * that there is no socket!
- * >=C_WF_REPORT_PARAMS ==> There is a socket
+ * >= C_CONNECTED ==> There is a socket
  */
-enum drbd_conns {
+enum drbd_conn_state {
 	C_STANDALONE,
-	C_DISCONNECTING,  /* Temporal state on the way to StandAlone. */
+	C_DISCONNECTING,  /* Temporary state on the way to C_STANDALONE. */
 	C_UNCONNECTED,    /* >= C_UNCONNECTED -> inc_net() succeeds */
 
-	/* These temporal states are all used on the way
-	 * from >= C_CONNECTED to Unconnected.
+	/* These temporary states are used on the way
+	 * from C_CONNECTED to C_UNCONNECTED.
 	 * The 'disconnect reason' states
 	 * I do not allow to change between them. */
 	C_TIMEOUT,
@@ -197,35 +219,44 @@ enum drbd_conns {
 	C_PROTOCOL_ERROR,
 	C_TEAR_DOWN,
 
-	C_WF_CONNECTION,
-	C_WF_REPORT_PARAMS, /* we have a socket */
-	C_CONNECTED,      /* we have introduced each other */
-	C_STARTING_SYNC_S,  /* starting full sync by admin request. */
-	C_STARTING_SYNC_T,  /* starting full sync by admin request. */
-	C_WF_BITMAP_S,
-	C_WF_BITMAP_T,
-	C_WF_SYNC_UUID,
+	C_CONNECTING,
+
+	C_CONNECTED, /* we have a socket */
+
+	C_MASK = 31,
+};
+
+enum drbd_repl_state {
+	L_NEGOTIATING = C_CONNECTED, /* used for peer_device->negotiation_result only */
+	L_OFF = C_CONNECTED,
+
+	L_ESTABLISHED,      /* we have introduced each other */
+	L_STARTING_SYNC_S,  /* starting full sync by admin request. */
+	L_STARTING_SYNC_T,  /* starting full sync by admin request. */
+	L_WF_BITMAP_S,
+	L_WF_BITMAP_T,
+	L_WF_SYNC_UUID,
 
 	/* All SyncStates are tested with this comparison
-	 * xx >= C_SYNC_SOURCE && xx <= C_PAUSED_SYNC_T */
-	C_SYNC_SOURCE,
-	C_SYNC_TARGET,
-	C_VERIFY_S,
-	C_VERIFY_T,
-	C_PAUSED_SYNC_S,
-	C_PAUSED_SYNC_T,
-
-	C_AHEAD,
-	C_BEHIND,
-
-	C_MASK = 31
+	 * xx >= L_SYNC_SOURCE && xx <= L_PAUSED_SYNC_T */
+	L_SYNC_SOURCE,
+	L_SYNC_TARGET,
+	L_VERIFY_S,
+	L_VERIFY_T,
+	L_PAUSED_SYNC_S,
+	L_PAUSED_SYNC_T,
+
+	L_AHEAD,
+	L_BEHIND,
+	L_NEG_NO_RESULT = L_BEHIND,  /* used for peer_device->negotiation_result only */
 };
 
 enum drbd_disk_state {
 	D_DISKLESS,
 	D_ATTACHING,      /* In the process of reading the meta-data */
+	D_DETACHING,      /* Added in protocol version 110 */
 	D_FAILED,         /* Becomes D_DISKLESS as soon as we told it the peer */
-			  /* when >= D_FAILED it is legal to access mdev->ldev */
+			  /* when >= D_FAILED it is legal to access device->ldev */
 	D_NEGOTIATING,    /* Late attaching state, we need to talk to the peer */
 	D_INCONSISTENT,
 	D_OUTDATED,
@@ -257,9 +288,11 @@ union drbd_state {
 		unsigned user_isp:1 ;
 		unsigned susp_nod:1 ; /* IO suspended because no data */
 		unsigned susp_fen:1 ; /* IO suspended because fence peer handler runs*/
-		unsigned _pad:9;   /* 0	 unused */
+		unsigned quorum:1;
+		unsigned _pad:8;   /* 0	 unused */
 #elif defined(__BIG_ENDIAN_BITFIELD)
-		unsigned _pad:9;
+		unsigned _pad:8;
+		unsigned quorum:1;
 		unsigned susp_fen:1 ;
 		unsigned susp_nod:1 ;
 		unsigned user_isp:1 ;
@@ -297,29 +330,48 @@ enum drbd_state_rv {
 	SS_DEVICE_IN_USE = -12,
 	SS_NO_NET_CONFIG = -13,
 	SS_NO_VERIFY_ALG = -14,       /* drbd-8.2 only */
-	SS_NEED_CONNECTION = -15,    /* drbd-8.2 only */
+	SS_NEED_CONNECTION = -15,
 	SS_LOWER_THAN_OUTDATED = -16,
-	SS_NOT_SUPPORTED = -17,      /* drbd-8.2 only */
+	SS_NOT_SUPPORTED = -17,
 	SS_IN_TRANSIENT_STATE = -18,  /* Retry after the next state change */
 	SS_CONCURRENT_ST_CHG = -19,   /* Concurrent cluster side state change! */
 	SS_O_VOL_PEER_PRI = -20,
-	SS_OUTDATE_WO_CONN = -21,
-	SS_AFTER_LAST_ERROR = -22,    /* Keep this at bottom */
+	SS_INTERRUPTED = -21,	/* interrupted in stable_state_change() */
+	SS_PRIMARY_READER = -22,
+	SS_TIMEOUT = -23,
+	SS_WEAKLY_CONNECTED = -24,
+	SS_NO_QUORUM = -25,
+	SS_ATTACH_NO_BITMAP = -26,
+	SS_HANDSHAKE_DISCONNECT = -27,
+	SS_HANDSHAKE_RETRY = -28,
+	SS_AFTER_LAST_ERROR = -29,    /* Keep this at bottom */
 };
 
 #define SHARED_SECRET_MAX 64
 
-#define MDF_CONSISTENT		(1 << 0)
-#define MDF_PRIMARY_IND		(1 << 1)
-#define MDF_CONNECTED_IND	(1 << 2)
-#define MDF_FULL_SYNC		(1 << 3)
-#define MDF_WAS_UP_TO_DATE	(1 << 4)
-#define MDF_PEER_OUT_DATED	(1 << 5)
-#define MDF_CRASHED_PRIMARY	(1 << 6)
-#define MDF_AL_CLEAN		(1 << 7)
-#define MDF_AL_DISABLED		(1 << 8)
+enum mdf_flag {
+	MDF_CONSISTENT =	1 << 0,
+	MDF_PRIMARY_IND =	1 << 1,
+	MDF_WAS_UP_TO_DATE =	1 << 4,
+	MDF_CRASHED_PRIMARY =	1 << 6,
+	MDF_AL_CLEAN =		1 << 7,
+	MDF_AL_DISABLED =       1 << 8,
+	MDF_PRIMARY_LOST_QUORUM = 1 << 9,
+	MDF_HAVE_QUORUM =       1 << 10,
+};
+
+enum mdf_peer_flag {
+	MDF_PEER_CONNECTED =	1 << 0,
+	MDF_PEER_OUTDATED =	1 << 1,
+	MDF_PEER_FENCING =	1 << 2,
+	MDF_PEER_FULL_SYNC =	1 << 3,
+	MDF_PEER_DEVICE_SEEN =	1 << 4,
+	MDF_NODE_EXISTS =       1 << 16,
+	MDF_HAVE_BITMAP =       1 << 31,  /* For in core use; no meaning when persistet */
+};
 
-#define MAX_PEERS 32
+#define DRBD_PEERS_MAX 32
+#define DRBD_NODE_ID_MAX DRBD_PEERS_MAX
 
 enum drbd_uuid_index {
 	UI_CURRENT,
@@ -331,7 +383,8 @@ enum drbd_uuid_index {
 	UI_EXTENDED_SIZE   /* Everything. */
 };
 
-#define HISTORY_UUIDS MAX_PEERS
+#define HISTORY_UUIDS_V08 (UI_HISTORY_END - UI_HISTORY_START + 1)
+#define HISTORY_UUIDS DRBD_PEERS_MAX
 
 enum drbd_timeout_flag {
 	UT_DEFAULT      = 0,
@@ -339,6 +392,16 @@ enum drbd_timeout_flag {
 	UT_PEER_OUTDATED = 2,
 };
 
+#define UUID_JUST_CREATED ((__u64)4)
+#define UUID_PRIMARY ((__u64)1)
+
+enum write_ordering_e {
+	WO_NONE,
+	WO_DRAIN_IO,
+	WO_BDEV_FLUSH,
+	WO_BIO_BARRIER
+};
+
 enum drbd_notification_type {
 	NOTIFY_EXISTS,
 	NOTIFY_CREATE,
@@ -346,11 +409,13 @@ enum drbd_notification_type {
 	NOTIFY_DESTROY,
 	NOTIFY_CALL,
 	NOTIFY_RESPONSE,
+	NOTIFY_RENAME,
 
 	NOTIFY_CONTINUES = 0x8000,
 	NOTIFY_FLAGS = NOTIFY_CONTINUES,
 };
 
+/* These values are part of the ABI! */
 enum drbd_peer_state {
 	P_INCONSISTENT = 3,
 	P_OUTDATED = 4,
@@ -359,15 +424,6 @@ enum drbd_peer_state {
 	P_FENCING = 7,
 };
 
-#define UUID_JUST_CREATED ((__u64)4)
-
-enum write_ordering_e {
-	WO_NONE,
-	WO_DRAIN_IO,
-	WO_BDEV_FLUSH,
-	WO_BIO_BARRIER
-};
-
 /* magic numbers used in meta data and network packets */
 #define DRBD_MAGIC 0x83740267
 #define DRBD_MAGIC_BIG 0x835a
@@ -376,17 +432,23 @@ enum write_ordering_e {
 #define DRBD_MD_MAGIC_07   (DRBD_MAGIC+3)
 #define DRBD_MD_MAGIC_08   (DRBD_MAGIC+4)
 #define DRBD_MD_MAGIC_84_UNCLEAN	(DRBD_MAGIC+5)
-
-
-/* how I came up with this magic?
- * base64 decode "actlog==" ;) */
-#define DRBD_AL_MAGIC 0x69cb65a2
+#define DRBD_MD_MAGIC_09   (DRBD_MAGIC+6)
 
 /* these are of type "int" */
 #define DRBD_MD_INDEX_INTERNAL -1
 #define DRBD_MD_INDEX_FLEX_EXT -2
 #define DRBD_MD_INDEX_FLEX_INT -3
 
-#define DRBD_CPU_MASK_SIZE 32
+/*
+ * This is the maximum string length accepted by drbdadm.
+ * It allows a full mask for up to 908 CPUs.
+ */
+#define DRBD_CPU_MASK_SIZE 256
+
+#define DRBD_MAX_BIO_SIZE (1U << 20)
+
+#define QOU_OFF 0
+#define QOU_MAJORITY 1024
+#define QOU_ALL 1025
 
 #endif
diff --git a/include/linux/drbd_config.h b/include/linux/drbd_config.h
deleted file mode 100644
index d215365c6bb1..000000000000
--- a/include/linux/drbd_config.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * drbd_config.h
- * DRBD's compile time configuration.
- */
-
-#ifndef DRBD_CONFIG_H
-#define DRBD_CONFIG_H
-
-extern const char *drbd_buildtag(void);
-
-#define REL_VERSION "8.4.11"
-#define PRO_VERSION_MIN 86
-#define PRO_VERSION_MAX 101
-
-#endif
diff --git a/include/linux/drbd_genl.h b/include/linux/drbd_genl.h
index 53f44b8cd75f..75e671a3c5d1 100644
--- a/include/linux/drbd_genl.h
+++ b/include/linux/drbd_genl.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * General overview:
  * full generic netlink message:
@@ -68,7 +68,7 @@
  *	genl_magic_func.h
  *		generates an entry in the static genl_ops array,
  *		and static register/unregister functions to
- *		genl_register_family().
+ *		genl_register_family_with_ops().
  *
  *	flags and handler:
  *		GENL_op_init( .doit = x, .dumpit = y, .flags = something)
@@ -96,10 +96,12 @@ GENL_struct(DRBD_NLA_CFG_REPLY, 1, drbd_cfg_reply,
  * and/or the replication group (aka resource) name,
  * and the volume id within the resource. */
 GENL_struct(DRBD_NLA_CFG_CONTEXT, 2, drbd_cfg_context,
+	__u32_field(6, DRBD_GENLA_F_MANDATORY,	ctx_peer_node_id)
 	__u32_field(1, DRBD_GENLA_F_MANDATORY,	ctx_volume)
 	__str_field(2, DRBD_GENLA_F_MANDATORY,	ctx_resource_name, 128)
 	__bin_field(3, DRBD_GENLA_F_MANDATORY,	ctx_my_addr, 128)
 	__bin_field(4, DRBD_GENLA_F_MANDATORY,	ctx_peer_addr, 128)
+	__str_field_def(5, 0, ctx_conn_name, SHARED_SECRET_MAX)
 )
 
 GENL_struct(DRBD_NLA_DISK_CONF, 3, disk_conf,
@@ -109,37 +111,45 @@ GENL_struct(DRBD_NLA_DISK_CONF, 3, disk_conf,
 
 	/* use the resize command to try and change the disk_size */
 	__u64_field(4, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	disk_size)
-	/* we could change the max_bio_bvecs,
-	 * but it won't propagate through the stack */
-	__u32_field(5, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	max_bio_bvecs)
+	/*__u32_field(5, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	max_bio_bvecs)*/
 
 	__u32_field_def(6, DRBD_GENLA_F_MANDATORY,	on_io_error, DRBD_ON_IO_ERROR_DEF)
-	__u32_field_def(7, DRBD_GENLA_F_MANDATORY,	fencing, DRBD_FENCING_DEF)
+	/*__u32_field_def(7, DRBD_GENLA_F_MANDATORY,	fencing_policy, DRBD_FENCING_DEF)*/
 
-	__u32_field_def(8,	DRBD_GENLA_F_MANDATORY,	resync_rate, DRBD_RESYNC_RATE_DEF)
 	__s32_field_def(9,	DRBD_GENLA_F_MANDATORY,	resync_after, DRBD_MINOR_NUMBER_DEF)
 	__u32_field_def(10,	DRBD_GENLA_F_MANDATORY,	al_extents, DRBD_AL_EXTENTS_DEF)
-	__u32_field_def(11,	DRBD_GENLA_F_MANDATORY,	c_plan_ahead, DRBD_C_PLAN_AHEAD_DEF)
-	__u32_field_def(12,	DRBD_GENLA_F_MANDATORY,	c_delay_target, DRBD_C_DELAY_TARGET_DEF)
-	__u32_field_def(13,	DRBD_GENLA_F_MANDATORY,	c_fill_target, DRBD_C_FILL_TARGET_DEF)
-	__u32_field_def(14,	DRBD_GENLA_F_MANDATORY,	c_max_rate, DRBD_C_MAX_RATE_DEF)
-	__u32_field_def(15,	DRBD_GENLA_F_MANDATORY,	c_min_rate, DRBD_C_MIN_RATE_DEF)
-	__u32_field_def(20,     DRBD_GENLA_F_MANDATORY, disk_timeout, DRBD_DISK_TIMEOUT_DEF)
-	__u32_field_def(21,     0 /* OPTIONAL */,       read_balancing, DRBD_READ_BALANCING_DEF)
-	__u32_field_def(25,     0 /* OPTIONAL */,       rs_discard_granularity, DRBD_RS_DISCARD_GRANULARITY_DEF)
 
 	__flg_field_def(16, DRBD_GENLA_F_MANDATORY,	disk_barrier, DRBD_DISK_BARRIER_DEF)
 	__flg_field_def(17, DRBD_GENLA_F_MANDATORY,	disk_flushes, DRBD_DISK_FLUSHES_DEF)
 	__flg_field_def(18, DRBD_GENLA_F_MANDATORY,	disk_drain, DRBD_DISK_DRAIN_DEF)
 	__flg_field_def(19, DRBD_GENLA_F_MANDATORY,	md_flushes, DRBD_MD_FLUSHES_DEF)
+	__u32_field_def(20,	DRBD_GENLA_F_MANDATORY,	disk_timeout, DRBD_DISK_TIMEOUT_DEF)
+	__u32_field_def(21, DRBD_GENLA_F_MANDATORY,     read_balancing, DRBD_READ_BALANCING_DEF)
+	__u32_field_def(22,	DRBD_GENLA_F_MANDATORY,	unplug_watermark, DRBD_UNPLUG_WATERMARK_DEF)
+	__u32_field_def(25, 0 /* OPTIONAL */,           rs_discard_granularity, DRBD_RS_DISCARD_GRANULARITY_DEF)
 	__flg_field_def(23,     0 /* OPTIONAL */,	al_updates, DRBD_AL_UPDATES_DEF)
-	__flg_field_def(24,     0 /* OPTIONAL */,	discard_zeroes_if_aligned, DRBD_DISCARD_ZEROES_IF_ALIGNED_DEF)
+	__flg_field_def(24,     0 /* OPTIONAL */,       discard_zeroes_if_aligned, DRBD_DISCARD_ZEROES_IF_ALIGNED_DEF)
 	__flg_field_def(26,     0 /* OPTIONAL */,	disable_write_same, DRBD_DISABLE_WRITE_SAME_DEF)
+	__flg_field_def(27, 0 /* OPTIONAL */, 		d_bitmap, DRBD_BITMAP_DEF)
 )
 
 GENL_struct(DRBD_NLA_RESOURCE_OPTS, 4, res_opts,
 	__str_field_def(1,	DRBD_GENLA_F_MANDATORY,	cpu_mask,       DRBD_CPU_MASK_SIZE)
 	__u32_field_def(2,	DRBD_GENLA_F_MANDATORY,	on_no_data, DRBD_ON_NO_DATA_DEF)
+	__flg_field_def(3,	DRBD_GENLA_F_MANDATORY,	auto_promote, DRBD_AUTO_PROMOTE_DEF)
+	__u32_field(4,		DRBD_F_REQUIRED | DRBD_F_INVARIANT,	node_id)
+	__u32_field_def(5,	DRBD_GENLA_F_MANDATORY,	peer_ack_window, DRBD_PEER_ACK_WINDOW_DEF)
+	__u32_field_def(6,	DRBD_GENLA_F_MANDATORY,	twopc_timeout, DRBD_TWOPC_TIMEOUT_DEF)
+	__u32_field_def(7,	DRBD_GENLA_F_MANDATORY, twopc_retry_timeout, DRBD_TWOPC_RETRY_TIMEOUT_DEF)
+	__u32_field_def(8,	0 /* OPTIONAL */,	peer_ack_delay, DRBD_PEER_ACK_DELAY_DEF)
+	__u32_field_def(9,	0 /* OPTIONAL */,	auto_promote_timeout, DRBD_AUTO_PROMOTE_TIMEOUT_DEF)
+	__u32_field_def(10,	0 /* OPTIONAL */,	nr_requests, DRBD_NR_REQUESTS_DEF)
+	__s32_field_def(11,	0 /* OPTIONAL */,	quorum, DRBD_QUORUM_DEF)
+	__u32_field_def(12,     0 /* OPTIONAL */,	on_no_quorum, DRBD_ON_NO_QUORUM_DEF)
+	__s32_field_def(13,	0 /* OPTIONAL */,	quorum_min_redundancy, DRBD_QUORUM_DEF)
+	__u32_field_def(14,	0 /* OPTIONAL */,	on_susp_primary_outdated, DRBD_ON_SUSP_PRI_OUTD_DEF)
+	__flg_field_def(15, 0, drbd8_compat_mode, DRBD_DRBD8_COMPAT_MODE_DEF) /* invisible by drbdsetup show */
+	__flg_field_def(16,	0 /* OPTIONAL */,	explicit_drbd8_compat, DRBD_DRBD8_COMPAT_MODE_DEF)
 )
 
 GENL_struct(DRBD_NLA_NET_CONF, 5, net_conf,
@@ -157,9 +167,7 @@ GENL_struct(DRBD_NLA_NET_CONF, 5, net_conf,
 	__u32_field_def(11,	DRBD_GENLA_F_MANDATORY,	sndbuf_size, DRBD_SNDBUF_SIZE_DEF)
 	__u32_field_def(12,	DRBD_GENLA_F_MANDATORY,	rcvbuf_size, DRBD_RCVBUF_SIZE_DEF)
 	__u32_field_def(13,	DRBD_GENLA_F_MANDATORY,	ko_count, DRBD_KO_COUNT_DEF)
-	__u32_field_def(14,	DRBD_GENLA_F_MANDATORY,	max_buffers, DRBD_MAX_BUFFERS_DEF)
 	__u32_field_def(15,	DRBD_GENLA_F_MANDATORY,	max_epoch_size, DRBD_MAX_EPOCH_SIZE_DEF)
-	__u32_field_def(16,	DRBD_GENLA_F_MANDATORY,	unplug_watermark, DRBD_UNPLUG_WATERMARK_DEF)
 	__u32_field_def(17,	DRBD_GENLA_F_MANDATORY,	after_sb_0p, DRBD_AFTER_SB_0P_DEF)
 	__u32_field_def(18,	DRBD_GENLA_F_MANDATORY,	after_sb_1p, DRBD_AFTER_SB_1P_DEF)
 	__u32_field_def(19,	DRBD_GENLA_F_MANDATORY,	after_sb_2p, DRBD_AFTER_SB_2P_DEF)
@@ -168,20 +176,29 @@ GENL_struct(DRBD_NLA_NET_CONF, 5, net_conf,
 	__u32_field_def(22,	DRBD_GENLA_F_MANDATORY,	cong_fill, DRBD_CONG_FILL_DEF)
 	__u32_field_def(23,	DRBD_GENLA_F_MANDATORY,	cong_extents, DRBD_CONG_EXTENTS_DEF)
 	__flg_field_def(24, DRBD_GENLA_F_MANDATORY,	two_primaries, DRBD_ALLOW_TWO_PRIMARIES_DEF)
-	__flg_field(25, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	discard_my_data)
 	__flg_field_def(26, DRBD_GENLA_F_MANDATORY,	tcp_cork, DRBD_TCP_CORK_DEF)
 	__flg_field_def(27, DRBD_GENLA_F_MANDATORY,	always_asbp, DRBD_ALWAYS_ASBP_DEF)
-	__flg_field(28, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	tentative)
 	__flg_field_def(29,	DRBD_GENLA_F_MANDATORY,	use_rle, DRBD_USE_RLE_DEF)
-	/* 9: __u32_field_def(30,	DRBD_GENLA_F_MANDATORY,	fencing_policy, DRBD_FENCING_DEF) */
-	/* 9: __str_field_def(31,     DRBD_GENLA_F_MANDATORY, name, SHARED_SECRET_MAX) */
-	/* 9: __u32_field(32,         DRBD_F_REQUIRED | DRBD_F_INVARIANT,     peer_node_id) */
+	__u32_field_def(30,	DRBD_GENLA_F_MANDATORY,	fencing_policy, DRBD_FENCING_DEF)
+	__str_field_def(31,	DRBD_GENLA_F_MANDATORY, name, SHARED_SECRET_MAX)
+	/* moved into ctx_peer_node_id: __u32_field(32,		DRBD_F_REQUIRED | DRBD_F_INVARIANT,	peer_node_id) */
 	__flg_field_def(33, 0 /* OPTIONAL */,	csums_after_crash_only, DRBD_CSUMS_AFTER_CRASH_ONLY_DEF)
 	__u32_field_def(34, 0 /* OPTIONAL */, sock_check_timeo, DRBD_SOCKET_CHECK_TIMEO_DEF)
+	__str_field_def(35, DRBD_F_INVARIANT, transport_name, SHARED_SECRET_MAX)
+	__u32_field_def(36, 0 /* OPTIONAL */, max_buffers, DRBD_MAX_BUFFERS_DEF)
+	__flg_field_def(37, 0 /* OPTIONAL */, allow_remote_read, DRBD_ALLOW_REMOTE_READ_DEF)
+	__flg_field_def(38, 0 /* OPTIONAL */, tls, DRBD_TLS_DEF)
+	__s32_field_def(39, 0 /* OPTIONAL */, tls_privkey, DRBD_TLS_PRIVKEY_DEF)
+	__s32_field_def(40, 0 /* OPTIONAL */, tls_certificate, DRBD_TLS_CERTIFICATE_DEF)
+	__s32_field_def(41, 0 /* OPTIONAL */, tls_keyring, DRBD_TLS_KEYRING_DEF)
+	__flg_field_def(42, DRBD_F_INVARIANT, load_balance_paths, DRBD_LOAD_BALANCE_PATHS_DEF)
+	__u32_field_def(43, 0 /* OPTIONAL */, rdma_ctrl_rcvbuf_size, DRBD_RDMA_CTRL_RCVBUF_SIZE_DEF)
+	__u32_field_def(44, 0 /* OPTIONAL */, rdma_ctrl_sndbuf_size, DRBD_RDMA_CTRL_SNDBUF_SIZE_DEF)
+
 )
 
 GENL_struct(DRBD_NLA_SET_ROLE_PARMS, 6, set_role_parms,
-	__flg_field(1, DRBD_GENLA_F_MANDATORY,	assume_uptodate)
+	__flg_field(1, DRBD_GENLA_F_MANDATORY,	force)
 )
 
 GENL_struct(DRBD_NLA_RESIZE_PARMS, 7, resize_parms,
@@ -192,46 +209,6 @@ GENL_struct(DRBD_NLA_RESIZE_PARMS, 7, resize_parms,
 	__u32_field_def(5, 0 /* OPTIONAL */, al_stripe_size, DRBD_AL_STRIPE_SIZE_DEF)
 )
 
-GENL_struct(DRBD_NLA_STATE_INFO, 8, state_info,
-	/* the reason of the broadcast,
-	 * if this is an event triggered broadcast. */
-	__u32_field(1, DRBD_GENLA_F_MANDATORY,	sib_reason)
-	__u32_field(2, DRBD_F_REQUIRED,	current_state)
-	__u64_field(3, DRBD_GENLA_F_MANDATORY,	capacity)
-	__u64_field(4, DRBD_GENLA_F_MANDATORY,	ed_uuid)
-
-	/* These are for broadcast from after state change work.
-	 * prev_state and new_state are from the moment the state change took
-	 * place, new_state is not neccessarily the same as current_state,
-	 * there may have been more state changes since.  Which will be
-	 * broadcasted soon, in their respective after state change work.  */
-	__u32_field(5, DRBD_GENLA_F_MANDATORY,	prev_state)
-	__u32_field(6, DRBD_GENLA_F_MANDATORY,	new_state)
-
-	/* if we have a local disk: */
-	__bin_field(7, DRBD_GENLA_F_MANDATORY,	uuids, (UI_SIZE*sizeof(__u64)))
-	__u32_field(8, DRBD_GENLA_F_MANDATORY,	disk_flags)
-	__u64_field(9, DRBD_GENLA_F_MANDATORY,	bits_total)
-	__u64_field(10, DRBD_GENLA_F_MANDATORY,	bits_oos)
-	/* and in case resync or online verify is active */
-	__u64_field(11, DRBD_GENLA_F_MANDATORY,	bits_rs_total)
-	__u64_field(12, DRBD_GENLA_F_MANDATORY,	bits_rs_failed)
-
-	/* for pre and post notifications of helper execution */
-	__str_field(13, DRBD_GENLA_F_MANDATORY,	helper, 32)
-	__u32_field(14, DRBD_GENLA_F_MANDATORY,	helper_exit_code)
-
-	__u64_field(15,                      0, send_cnt)
-	__u64_field(16,                      0, recv_cnt)
-	__u64_field(17,                      0, read_cnt)
-	__u64_field(18,                      0, writ_cnt)
-	__u64_field(19,                      0, al_writ_cnt)
-	__u64_field(20,                      0, bm_writ_cnt)
-	__u32_field(21,                      0, ap_bio_cnt)
-	__u32_field(22,                      0, ap_pending_cnt)
-	__u32_field(23,                      0, rs_pending_cnt)
-)
-
 GENL_struct(DRBD_NLA_START_OV_PARMS, 9, start_ov_parms,
 	__u64_field(1, DRBD_GENLA_F_MANDATORY,	ov_start_sector)
 	__u64_field(2, DRBD_GENLA_F_MANDATORY,	ov_stop_sector)
@@ -239,6 +216,7 @@ GENL_struct(DRBD_NLA_START_OV_PARMS, 9, start_ov_parms,
 
 GENL_struct(DRBD_NLA_NEW_C_UUID_PARMS, 10, new_c_uuid_parms,
 	__flg_field(1, DRBD_GENLA_F_MANDATORY, clear_bm)
+	__flg_field(2, DRBD_GENLA_F_MANDATORY, force_resync)
 )
 
 GENL_struct(DRBD_NLA_TIMEOUT_PARMS, 11, timeout_parms,
@@ -251,6 +229,13 @@ GENL_struct(DRBD_NLA_DISCONNECT_PARMS, 12, disconnect_parms,
 
 GENL_struct(DRBD_NLA_DETACH_PARMS, 13, detach_parms,
 	__flg_field(1, DRBD_GENLA_F_MANDATORY,	force_detach)
+	__flg_field_def(2, 0 /* OPTIONAL */, intentional_diskless_detach, DRBD_DISK_DISKLESS_DEF)
+)
+
+GENL_struct(DRBD_NLA_DEVICE_CONF, 14, device_conf,
+	__u32_field_def(1, DRBD_F_INVARIANT,	max_bio_size, DRBD_MAX_BIO_SIZE_DEF)
+	__flg_field_def(2, 0 /* OPTIONAL */, intentional_diskless, DRBD_DISK_DISKLESS_DEF)
+	__u32_field_def(3, 0 /* OPTIONAL */, block_size, DRBD_BLOCK_SIZE_DEF)
 )
 
 GENL_struct(DRBD_NLA_RESOURCE_INFO, 15, resource_info,
@@ -258,11 +243,16 @@ GENL_struct(DRBD_NLA_RESOURCE_INFO, 15, resource_info,
 	__flg_field(2, 0, res_susp)
 	__flg_field(3, 0, res_susp_nod)
 	__flg_field(4, 0, res_susp_fen)
-	/* __flg_field(5, 0, res_weak) */
+	__flg_field(5, 0, res_susp_quorum)
+	__flg_field(6, 0, res_fail_io)
 )
 
 GENL_struct(DRBD_NLA_DEVICE_INFO, 16, device_info,
 	__u32_field(1, 0, dev_disk_state)
+	__flg_field(2, 0, is_intentional_diskless)
+	__flg_field(3, 0, dev_has_quorum)
+	__flg_field(5, 0, dev_is_open)
+	__str_field(4, 0, backing_dev_path, 128)
 )
 
 GENL_struct(DRBD_NLA_CONNECTION_INFO, 17, connection_info,
@@ -276,6 +266,7 @@ GENL_struct(DRBD_NLA_PEER_DEVICE_INFO, 18, peer_device_info,
 	__u32_field(3, 0, peer_resync_susp_user)
 	__u32_field(4, 0, peer_resync_susp_peer)
 	__u32_field(5, 0, peer_resync_susp_dependency)
+	__flg_field(6, 0, peer_is_intentional_diskless)
 )
 
 GENL_struct(DRBD_NLA_RESOURCE_STATISTICS, 19, resource_statistics,
@@ -301,6 +292,8 @@ GENL_struct(DRBD_NLA_DEVICE_STATISTICS, 20, device_statistics,
 
 GENL_struct(DRBD_NLA_CONNECTION_STATISTICS, 21, connection_statistics,
 	__flg_field(1, 0, conn_congested)
+	__u64_field(2, 0, ap_in_flight) /* sectors */
+	__u64_field(3, 0, rs_in_flight) /* sectors */
 )
 
 GENL_struct(DRBD_NLA_PEER_DEVICE_STATISTICS, 22, peer_device_statistics,
@@ -312,6 +305,27 @@ GENL_struct(DRBD_NLA_PEER_DEVICE_STATISTICS, 22, peer_device_statistics,
 	__u64_field(6, 0, peer_dev_resync_failed)  /* sectors */
 	__u64_field(7, 0, peer_dev_bitmap_uuid)
 	__u32_field(9, 0, peer_dev_flags)
+	/* you need the peer_repl_state from peer_device_info
+	 * to properly interpret these stats for "progress"
+	 * of syncer/verify */
+	__u64_field(10, 0, peer_dev_rs_total)	/* sectors */
+	__u64_field(11, 0, peer_dev_ov_start_sector)
+	__u64_field(12, 0, peer_dev_ov_stop_sector)
+	__u64_field(13, 0, peer_dev_ov_position) /* sectors */
+	__u64_field(14, 0, peer_dev_ov_left)	/* sectors */
+	__u64_field(15, 0, peer_dev_ov_skipped)	/* sectors */
+	__u64_field(16, 0, peer_dev_rs_same_csum)
+	__u64_field(17, 0, peer_dev_rs_dt_start_ms)
+	__u64_field(18, 0, peer_dev_rs_paused_ms)
+	/* resync progress marks for "resync speed" guestimation */
+	__u64_field(19, 0, peer_dev_rs_dt0_ms)
+	__u64_field(20, 0, peer_dev_rs_db0_sectors)
+	__u64_field(21, 0, peer_dev_rs_dt1_ms)
+	__u64_field(22, 0, peer_dev_rs_db1_sectors)
+	__u32_field(23, 0, peer_dev_rs_c_sync_rate)
+	/* events may not be sent for every change of the UUID flags, however
+	 * UUID_FLAG_STABLE can be trusted */
+	__u64_field(24, 0, peer_dev_uuid_flags)
 )
 
 GENL_struct(DRBD_NLA_NOTIFICATION_HEADER, 23, drbd_notification_header,
@@ -323,38 +337,67 @@ GENL_struct(DRBD_NLA_HELPER, 24, drbd_helper_info,
 	__u32_field(2, DRBD_GENLA_F_MANDATORY, helper_status)
 )
 
-/*
- * Notifications and commands (genlmsghdr->cmd)
- */
-GENL_mc_group(events)
+GENL_struct(DRBD_NLA_INVALIDATE_PARMS, 25, invalidate_parms,
+	__s32_field_def(1, DRBD_GENLA_F_MANDATORY, sync_from_peer_node_id, DRBD_SYNC_FROM_NID_DEF)
+	__flg_field_def(2, DRBD_GENLA_F_MANDATORY, reset_bitmap, DRBD_INVALIDATE_RESET_BITMAP_DEF)
+)
 
-	/* kernel -> userspace announcement of changes */
-GENL_notification(
-	DRBD_EVENT, 1, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_STATE_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NET_CONF, DRBD_GENLA_F_MANDATORY)
-	GENL_tla_expected(DRBD_NLA_DISK_CONF, DRBD_GENLA_F_MANDATORY)
-	GENL_tla_expected(DRBD_NLA_SYNCER_CONF, DRBD_GENLA_F_MANDATORY)
+GENL_struct(DRBD_NLA_FORGET_PEER_PARMS, 26, forget_peer_parms,
+	__s32_field_def(1, DRBD_GENLA_F_MANDATORY, forget_peer_node_id, DRBD_SYNC_FROM_NID_DEF)
 )
 
-	/* query kernel for specific or all info */
-GENL_op(
-	DRBD_ADM_GET_STATUS, 2,
-	GENL_op_init(
-		.doit = drbd_adm_get_status,
-		.dumpit = drbd_adm_get_status_all,
-		/* anyone may ask for the status,
-		 * it is broadcasted anyways */
-	),
-	/* To select the object .doit.
-	 * Or a subset of objects in .dumpit. */
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+GENL_struct(DRBD_NLA_PEER_DEVICE_OPTS, 27, peer_device_conf,
+	__u32_field_def(1,	DRBD_GENLA_F_MANDATORY,	resync_rate, DRBD_RESYNC_RATE_DEF)
+	__u32_field_def(2,	DRBD_GENLA_F_MANDATORY,	c_plan_ahead, DRBD_C_PLAN_AHEAD_DEF)
+	__u32_field_def(3,	DRBD_GENLA_F_MANDATORY,	c_delay_target, DRBD_C_DELAY_TARGET_DEF)
+	__u32_field_def(4,	DRBD_GENLA_F_MANDATORY,	c_fill_target, DRBD_C_FILL_TARGET_DEF)
+	__u32_field_def(5,	DRBD_GENLA_F_MANDATORY,	c_max_rate, DRBD_C_MAX_RATE_DEF)
+	__u32_field_def(6,	DRBD_GENLA_F_MANDATORY,	c_min_rate, DRBD_C_MIN_RATE_DEF)
+	__flg_field_def(7, 0 /* OPTIONAL */, bitmap, DRBD_BITMAP_DEF)
+#if (PRO_FEATURES & DRBD_FF_RESYNC_WITHOUT_REPLICATION) || !defined(__KERNEL__)
+	__flg_field_def(8, 0 /* OPTIONAL */, resync_without_replication, DRBD_RESYNC_WITHOUT_REPLICATION_DEF)
+#endif
+)
+
+GENL_struct(DRBD_NLA_PATH_PARMS, 28, path_parms,
+	__bin_field(1, DRBD_GENLA_F_MANDATORY,	my_addr, 128)
+	__bin_field(2, DRBD_GENLA_F_MANDATORY,	peer_addr, 128)
+)
+
+GENL_struct(DRBD_NLA_CONNECT_PARMS, 29, connect_parms,
+	__flg_field_def(1,	DRBD_GENLA_F_MANDATORY,	tentative, 0)
+	__flg_field_def(2,	DRBD_GENLA_F_MANDATORY,	discard_my_data, 0)
+)
+
+GENL_struct(DRBD_NLA_PATH_INFO, 30, drbd_path_info,
+	__flg_field(1, 0, path_established)
 )
 
+GENL_struct(DRBD_NLA_RENAME_RESOURCE_PARMS, 31, rename_resource_parms,
+	__str_field(1, DRBD_GENLA_F_MANDATORY, new_resource_name, 128)
+)
+
+GENL_struct(DRBD_NLA_RENAME_RESOURCE_INFO, 32, rename_resource_info,
+	__str_field(1, DRBD_GENLA_F_MANDATORY, res_new_name, 128)
+)
+
+GENL_struct(DRBD_NLA_INVAL_PEER_PARAMS, 33, invalidate_peer_parms,
+	__flg_field_def(1, DRBD_GENLA_F_MANDATORY, p_reset_bitmap, DRBD_INVALIDATE_RESET_BITMAP_DEF)
+)
+
+GENL_struct(DRBD_NLA_SUSPEND_IO_PARAMS, 34, suspend_io_parms,
+	__flg_field_def(1, DRBD_GENLA_F_MANDATORY, bdev_freeze, DRBD_SUSPEND_IO_BDEV_FREEZE_DEF)
+)
+
+/*
+ * Notifications and commands (genlmsghdr->cmd)
+ */
+GENL_mc_group(events)
+
 	/* add DRBD minor devices as volumes to resources */
 GENL_op(DRBD_ADM_NEW_MINOR, 5, GENL_doit(drbd_adm_new_minor),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_DEVICE_CONF, DRBD_GENLA_F_MANDATORY))
 GENL_op(DRBD_ADM_DEL_MINOR, 6, GENL_doit(drbd_adm_del_minor),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
 
@@ -370,11 +413,29 @@ GENL_op(DRBD_ADM_RESOURCE_OPTS, 9,
 	GENL_tla_expected(DRBD_NLA_RESOURCE_OPTS, DRBD_GENLA_F_MANDATORY)
 )
 
-GENL_op(
-	DRBD_ADM_CONNECT, 10,
-	GENL_doit(drbd_adm_connect),
+GENL_op(DRBD_ADM_NEW_PEER, 44, GENL_doit(drbd_adm_new_peer),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NET_CONF, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_NET_CONF, DRBD_GENLA_F_MANDATORY)
+)
+
+GENL_op(DRBD_ADM_NEW_PATH, 45, GENL_doit(drbd_adm_new_path),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_PATH_PARMS, DRBD_F_REQUIRED)
+)
+
+GENL_op(DRBD_ADM_DEL_PEER, 46, GENL_doit(drbd_adm_del_peer),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_DISCONNECT_PARMS, DRBD_GENLA_F_MANDATORY)
+)
+
+GENL_op(DRBD_ADM_DEL_PATH, 47, GENL_doit(drbd_adm_del_path),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_PATH_PARMS, DRBD_F_REQUIRED)
+)
+
+GENL_op(DRBD_ADM_CONNECT, 10, GENL_doit(drbd_adm_connect),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_CONNECT_PARMS, DRBD_GENLA_F_MANDATORY)
 )
 
 GENL_op(
@@ -385,7 +446,9 @@ GENL_op(
 )
 
 GENL_op(DRBD_ADM_DISCONNECT, 11, GENL_doit(drbd_adm_disconnect),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_DISCONNECT_PARMS, DRBD_GENLA_F_MANDATORY)
+)
 
 GENL_op(DRBD_ADM_ATTACH, 12,
 	GENL_doit(drbd_adm_attach),
@@ -438,15 +501,22 @@ GENL_op(DRBD_ADM_DETACH,	18, GENL_doit(drbd_adm_detach),
 	GENL_tla_expected(DRBD_NLA_DETACH_PARMS, DRBD_GENLA_F_MANDATORY))
 
 GENL_op(DRBD_ADM_INVALIDATE,	19, GENL_doit(drbd_adm_invalidate),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_INVALIDATE_PARMS, DRBD_F_REQUIRED))
+
 GENL_op(DRBD_ADM_INVAL_PEER,	20, GENL_doit(drbd_adm_invalidate_peer),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_INVAL_PEER_PARAMS, 0 /* OPTIONAL */))
+
 GENL_op(DRBD_ADM_PAUSE_SYNC,	21, GENL_doit(drbd_adm_pause_sync),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
 GENL_op(DRBD_ADM_RESUME_SYNC,	22, GENL_doit(drbd_adm_resume_sync),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
+
 GENL_op(DRBD_ADM_SUSPEND_IO,	23, GENL_doit(drbd_adm_suspend_io),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_SUSPEND_IO_PARAMS, 0 /* OPTIONAL */))
+
 GENL_op(DRBD_ADM_RESUME_IO,	24, GENL_doit(drbd_adm_resume_io),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
 GENL_op(DRBD_ADM_OUTDATE,	25, GENL_doit(drbd_adm_outdate),
@@ -457,39 +527,47 @@ GENL_op(DRBD_ADM_DOWN,		27, GENL_doit(drbd_adm_down),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
 
 GENL_op(DRBD_ADM_GET_RESOURCES, 30,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_resources,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_RESOURCE_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_RESOURCE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	GENL_op_init(
+		.dumpit = drbd_adm_dump_resources,
+	),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_RESOURCE_INFO, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_RESOURCE_STATISTICS, DRBD_GENLA_F_MANDATORY))
 
 GENL_op(DRBD_ADM_GET_DEVICES, 31,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_devices,
-		 .done = drbd_adm_dump_devices_done,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_DEVICE_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_DEVICE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	GENL_op_init(
+		.dumpit = drbd_adm_dump_devices,
+		.done = drbd_adm_dump_devices_done,
+	),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_DEVICE_INFO, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_DEVICE_STATISTICS, DRBD_GENLA_F_MANDATORY))
 
 GENL_op(DRBD_ADM_GET_CONNECTIONS, 32,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_connections,
-		 .done = drbd_adm_dump_connections_done,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	GENL_op_init(
+		.dumpit = drbd_adm_dump_connections,
+		.done = drbd_adm_dump_connections_done,
+	),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, DRBD_GENLA_F_MANDATORY))
 
 GENL_op(DRBD_ADM_GET_PEER_DEVICES, 33,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_peer_devices,
-		 .done = drbd_adm_dump_peer_devices_done,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	GENL_op_init(
+		.dumpit = drbd_adm_dump_peer_devices,
+		.done = drbd_adm_dump_peer_devices_done,
+	),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_PEER_DEVICE_INFO, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_PEER_DEVICE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+
+GENL_op(DRBD_ADM_GET_PATHS, 50,
+	GENL_op_init(
+		.dumpit = drbd_adm_dump_paths,
+		.done = drbd_adm_dump_paths_done,
+	),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_PATH_INFO, DRBD_GENLA_F_MANDATORY))
 
 GENL_notification(
 	DRBD_RESOURCE_STATE, 34, events,
@@ -509,6 +587,7 @@ GENL_notification(
 	DRBD_CONNECTION_STATE, 36, events,
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
 	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_PATH_PARMS, DRBD_GENLA_F_MANDATORY)
 	GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, DRBD_F_REQUIRED)
 	GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, DRBD_F_REQUIRED))
 
@@ -522,7 +601,8 @@ GENL_notification(
 GENL_op(
 	DRBD_ADM_GET_INITIAL_STATE, 38,
 	GENL_op_init(
-	        .dumpit = drbd_adm_get_initial_state,
+		.dumpit = drbd_adm_get_initial_state,
+		.done = drbd_adm_get_initial_state_done,
 	),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY))
 
@@ -534,3 +614,21 @@ GENL_notification(
 GENL_notification(
 	DRBD_INITIAL_STATE_DONE, 41, events,
 	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED))
+
+GENL_op(DRBD_ADM_FORGET_PEER,		42, GENL_doit(drbd_adm_forget_peer),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_FORGET_PEER_PARMS, DRBD_F_REQUIRED))
+
+GENL_op(DRBD_ADM_CHG_PEER_DEVICE_OPTS, 43,
+	GENL_doit(drbd_adm_peer_device_opts),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_PEER_DEVICE_OPTS, DRBD_F_REQUIRED))
+
+GENL_op(DRBD_ADM_RENAME_RESOURCE,		49, GENL_doit(drbd_adm_rename_resource),
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_RENAME_RESOURCE_PARMS, DRBD_F_REQUIRED))
+
+GENL_notification(
+	DRBD_PATH_STATE, 48, events,
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
+	GENL_tla_expected(DRBD_NLA_PATH_INFO, DRBD_F_REQUIRED))
diff --git a/include/linux/drbd_limits.h b/include/linux/drbd_limits.h
index 5b042fb427e9..ed38f94d43c6 100644
--- a/include/linux/drbd_limits.h
+++ b/include/linux/drbd_limits.h
@@ -64,7 +64,7 @@
 #define DRBD_DISK_TIMEOUT_DEF 0U    /* disabled */
 #define DRBD_DISK_TIMEOUT_SCALE '1'
 
-  /* active connection retries when C_WF_CONNECTION */
+  /* active connection retries when C_CONNECTING */
 #define DRBD_CONNECT_INT_MIN 1U
 #define DRBD_CONNECT_INT_MAX 120U
 #define DRBD_CONNECT_INT_DEF 10U   /* seconds */
@@ -88,14 +88,13 @@
 #define DRBD_MAX_EPOCH_SIZE_DEF 2048U
 #define DRBD_MAX_EPOCH_SIZE_SCALE '1'
 
-  /* I don't think that a tcp send buffer of more than 10M is useful */
 #define DRBD_SNDBUF_SIZE_MIN  0U
-#define DRBD_SNDBUF_SIZE_MAX  (10U<<20)
+#define DRBD_SNDBUF_SIZE_MAX  (128U<<20)
 #define DRBD_SNDBUF_SIZE_DEF  0U
 #define DRBD_SNDBUF_SIZE_SCALE '1'
 
 #define DRBD_RCVBUF_SIZE_MIN  0U
-#define DRBD_RCVBUF_SIZE_MAX  (10U<<20)
+#define DRBD_RCVBUF_SIZE_MAX  (128U<<20)
 #define DRBD_RCVBUF_SIZE_DEF  0U
 #define DRBD_RCVBUF_SIZE_SCALE '1'
 
@@ -117,16 +116,19 @@
 #define DRBD_KO_COUNT_MAX  200U
 #define DRBD_KO_COUNT_DEF  7U
 #define DRBD_KO_COUNT_SCALE '1'
+
+#define DRBD_ALLOW_REMOTE_READ_DEF 1U
 /* } */
 
 /* syncer { */
   /* FIXME allow rate to be zero? */
 #define DRBD_RESYNC_RATE_MIN 1U
 /* channel bonding 10 GbE, or other hardware */
-#define DRBD_RESYNC_RATE_MAX (4 << 20)
+#define DRBD_RESYNC_RATE_MAX (8U << 20)
 #define DRBD_RESYNC_RATE_DEF 250U
 #define DRBD_RESYNC_RATE_SCALE 'k'  /* kilobytes */
 
+  /* less than 67 would hit performance unnecessarily. */
 #define DRBD_AL_EXTENTS_MIN  67U
   /* we use u16 as "slot number", (u16)~0 is "FREE".
    * If you use >= 292 kB on-disk ring buffer,
@@ -182,7 +184,7 @@
 #define DRBD_C_FILL_TARGET_DEF 100U /* Try to place 50KiB in socket send buffer during resync */
 #define DRBD_C_FILL_TARGET_SCALE 's'  /* sectors */
 
-#define DRBD_C_MAX_RATE_MIN     250U
+#define DRBD_C_MAX_RATE_MIN     0U
 #define DRBD_C_MAX_RATE_MAX     (4U << 20)
 #define DRBD_C_MAX_RATE_DEF     102400U
 #define DRBD_C_MAX_RATE_SCALE	'k'  /* kilobytes */
@@ -207,10 +209,11 @@
 #define DRBD_DISK_BARRIER_DEF	0U
 #define DRBD_DISK_FLUSHES_DEF	1U
 #define DRBD_DISK_DRAIN_DEF	1U
+#define DRBD_DISK_DISKLESS_DEF	0U
 #define DRBD_MD_FLUSHES_DEF	1U
 #define DRBD_TCP_CORK_DEF	1U
 #define DRBD_AL_UPDATES_DEF     1U
-
+#define DRBD_INVALIDATE_RESET_BITMAP_DEF 1U
 /* We used to ignore the discard_zeroes_data setting.
  * To not change established (and expected) behaviour,
  * by default assume that, for discard_zeroes_data=0,
@@ -227,6 +230,52 @@
 #define DRBD_ALWAYS_ASBP_DEF	0U
 #define DRBD_USE_RLE_DEF	1U
 #define DRBD_CSUMS_AFTER_CRASH_ONLY_DEF 0U
+#define DRBD_AUTO_PROMOTE_DEF	1U
+#define DRBD_BITMAP_DEF         1U
+#define DRBD_RESYNC_WITHOUT_REPLICATION_DEF 1U
+
+#define DRBD_NR_REQUESTS_MIN	4U
+#define DRBD_NR_REQUESTS_DEF	8000U
+#define DRBD_NR_REQUESTS_MAX	-1U
+#define DRBD_NR_REQUESTS_SCALE	'1'
+
+#define DRBD_MAX_BIO_SIZE_DEF	DRBD_MAX_BIO_SIZE
+#define DRBD_MAX_BIO_SIZE_MIN	(1U << 9)
+#define DRBD_MAX_BIO_SIZE_MAX	DRBD_MAX_BIO_SIZE
+#define DRBD_MAX_BIO_SIZE_SCALE '1'
+
+#define DRBD_NODE_ID_DEF		0U
+#define DRBD_NODE_ID_MIN		0U
+#ifndef DRBD_NODE_ID_MAX /* Is also defined in drbd.h */
+#define DRBD_NODE_ID_MAX		DRBD_PEERS_MAX
+#endif
+#define DRBD_NODE_ID_SCALE		'1'
+
+#define DRBD_PEER_ACK_WINDOW_DEF	4096U   /* 2 MiByte */
+#define DRBD_PEER_ACK_WINDOW_MIN	2048U   /* 1 MiByte */
+#define DRBD_PEER_ACK_WINDOW_MAX	204800U /* 100 MiByte */
+#define DRBD_PEER_ACK_WINDOW_SCALE 's' /* sectors*/
+
+#define DRBD_PEER_ACK_DELAY_DEF	100U    /* 100ms */
+#define DRBD_PEER_ACK_DELAY_MIN 1U
+#define DRBD_PEER_ACK_DELAY_MAX 10000U  /* 10 seconds */
+#define DRBD_PEER_ACK_DELAY_SCALE '1' /* milliseconds */
+
+/* Two-phase commit timeout (1/10 seconds). */
+#define DRBD_TWOPC_TIMEOUT_MIN	50U
+#define DRBD_TWOPC_TIMEOUT_MAX	600U
+#define DRBD_TWOPC_TIMEOUT_DEF	300U
+#define DRBD_TWOPC_TIMEOUT_SCALE '1'
+
+#define DRBD_TWOPC_RETRY_TIMEOUT_MIN 1U
+#define DRBD_TWOPC_RETRY_TIMEOUT_MAX 50U
+#define DRBD_TWOPC_RETRY_TIMEOUT_DEF 1U
+#define DRBD_TWOPC_RETRY_TIMEOUT_SCALE '1'
+
+#define DRBD_SYNC_FROM_NID_DEF -1
+#define DRBD_SYNC_FROM_NID_MIN -1
+#define DRBD_SYNC_FROM_NID_MAX DRBD_PEERS_MAX
+#define DRBD_SYNC_FROM_NID_SCALE '1'
 
 #define DRBD_AL_STRIPES_MIN     1U
 #define DRBD_AL_STRIPES_MAX     1024U
@@ -243,9 +292,51 @@
 #define DRBD_SOCKET_CHECK_TIMEO_DEF 0U
 #define DRBD_SOCKET_CHECK_TIMEO_SCALE '1'
 
+/* Auto promote timeout (1/10 seconds). */
+#define DRBD_AUTO_PROMOTE_TIMEOUT_MIN 0U
+#define DRBD_AUTO_PROMOTE_TIMEOUT_MAX 600U
+#define DRBD_AUTO_PROMOTE_TIMEOUT_DEF 20U
+#define DRBD_AUTO_PROMOTE_TIMEOUT_SCALE '1'
+
 #define DRBD_RS_DISCARD_GRANULARITY_MIN 0U
 #define DRBD_RS_DISCARD_GRANULARITY_MAX (1U<<20)  /* 1MiByte */
 #define DRBD_RS_DISCARD_GRANULARITY_DEF 0U     /* disabled by default */
 #define DRBD_RS_DISCARD_GRANULARITY_SCALE '1' /* bytes */
 
+#define DRBD_QUORUM_MIN 0U
+#define DRBD_QUORUM_MAX QOU_ALL /* Note: user visible min/max different */
+#define DRBD_QUORUM_DEF QOU_OFF /* kernel min/max includes symbolic values */
+#define DRBD_QUORUM_SCALE '1' /* nodes */
+
+#define DRBD_BLOCK_SIZE_MIN 512
+#define DRBD_BLOCK_SIZE_MAX 4096
+#define DRBD_BLOCK_SIZE_DEF 512
+#define DRBD_BLOCK_SIZE_SCALE '1' /* Bytes */
+
+/* By default freeze IO, if set error all IOs as quick as possible */
+#define DRBD_ON_NO_QUORUM_DEF ONQ_SUSPEND_IO
+
+#define DRBD_ON_SUSP_PRI_OUTD_DEF SPO_DISCONNECT
+#define DRBD_DRBD8_COMPAT_MODE_DEF 0U
+
+#define DRBD_TLS_DEF 0U /* disabled by default */
+#define DRBD_TLS_PRIVKEY_DEF 0 /* disabled by default */
+#define DRBD_TLS_CERTIFICATE_DEF 0 /* disabled by default */
+#define DRBD_TLS_KEYRING_DEF 0 /* disabled by default */
+
+#define DRBD_LOAD_BALANCE_PATHS_DEF 0U
+
+#define DRBD_RDMA_CTRL_RCVBUF_SIZE_MIN  0U
+#define DRBD_RDMA_CTRL_RCVBUF_SIZE_MAX  (10U<<20)
+#define DRBD_RDMA_CTRL_RCVBUF_SIZE_DEF 0
+#define DRBD_RDMA_CTRL_RCVBUF_SIZE_SCALE '1'
+
+#define DRBD_RDMA_CTRL_SNDBUF_SIZE_MIN  0U
+#define DRBD_RDMA_CTRL_SNDBUF_SIZE_MAX  (10U<<20)
+#define DRBD_RDMA_CTRL_SNDBUF_SIZE_DEF 0
+#define DRBD_RDMA_CTRL_SNDBUF_SIZE_SCALE '1'
+
+/* Enable bdev_freeze/lockfs by default */
+#define DRBD_SUSPEND_IO_BDEV_FREEZE_DEF 1U
+
 #endif
diff --git a/include/linux/genl_magic_func.h b/include/linux/genl_magic_func.h
index d4da060b7532..db462b860d18 100644
--- a/include/linux/genl_magic_func.h
+++ b/include/linux/genl_magic_func.h
@@ -130,41 +130,53 @@ static void dprint_array(const char *dir, int nla_type,
  *									{{{2
  */
 
-/* processing of generic netlink messages is serialized.
- * use one static buffer for parsing of nested attributes */
-static struct nlattr *nested_attr_tb[128];
-
 #undef GENL_struct
 #define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-/* *_from_attrs functions are static, but potentially unused */		\
 static int __ ## s_name ## _from_attrs(struct s_name *s,		\
+		struct nlattr ***ret_nested_attribute_table,		\
 		struct genl_info *info, bool exclude_invariants)	\
 {									\
 	const int maxtype = ARRAY_SIZE(s_name ## _nl_policy)-1;		\
 	struct nlattr *tla = info->attrs[tag_number];			\
-	struct nlattr **ntb = nested_attr_tb;				\
+	struct nlattr **ntb;						\
 	struct nlattr *nla;						\
-	int err;							\
-	BUILD_BUG_ON(ARRAY_SIZE(s_name ## _nl_policy) > ARRAY_SIZE(nested_attr_tb));	\
+	int err = 0;							\
+	if (ret_nested_attribute_table)					\
+		*ret_nested_attribute_table = NULL;			\
 	if (!tla)							\
 		return -ENOMSG;						\
+	ntb = kcalloc(ARRAY_SIZE(s_name ## _nl_policy), sizeof(*ntb), GFP_KERNEL); \
+	if (!ntb)							\
+		return -ENOMEM;						\
 	DPRINT_TLA(#s_name, "<=-", #tag_name);				\
 	err = drbd_nla_parse_nested(ntb, maxtype, tla, s_name ## _nl_policy);	\
 	if (err)							\
-		return err;						\
+		goto out;						\
 									\
 	s_fields							\
-	return 0;							\
+ out:									\
+	if (!err && ret_nested_attribute_table)				\
+		*ret_nested_attribute_table = ntb;			\
+	else								\
+		kfree(ntb);						\
+	return err;							\
 }					__attribute__((unused))		\
 static int s_name ## _from_attrs(struct s_name *s,			\
 						struct genl_info *info)	\
 {									\
-	return __ ## s_name ## _from_attrs(s, info, false);		\
+	return __ ## s_name ## _from_attrs(s, NULL, info, false);	\
+}					__attribute__((unused))		\
+static int s_name ## _ntb_from_attrs(					\
+			struct nlattr ***ret_nested_attribute_table,	\
+						struct genl_info *info)	\
+{									\
+	return __ ## s_name ## _from_attrs(NULL,			\
+			ret_nested_attribute_table, info, false);	\
 }					__attribute__((unused))		\
 static int s_name ## _from_attrs_for_change(struct s_name *s,		\
 						struct genl_info *info)	\
 {									\
-	return __ ## s_name ## _from_attrs(s, info, true);		\
+	return __ ## s_name ## _from_attrs(s, NULL, info, true);	\
 }					__attribute__((unused))		\
 
 #define __assign(attr_nr, attr_flag, name, nla_type, type, assignment...)	\
@@ -172,7 +184,8 @@ static int s_name ## _from_attrs_for_change(struct s_name *s,		\
 		if (nla) {						\
 			if (exclude_invariants && !!((attr_flag) & DRBD_F_INVARIANT)) {		\
 				pr_info("<< must not change invariant attr: %s\n", #name);	\
-				return -EEXIST;				\
+				err = -EEXIST;				\
+				goto out;				\
 			}						\
 			assignment;					\
 		} else if (exclude_invariants && !!((attr_flag) & DRBD_F_INVARIANT)) {		\
@@ -180,7 +193,8 @@ static int s_name ## _from_attrs_for_change(struct s_name *s,		\
 			/* which was expected */			\
 		} else if ((attr_flag) & DRBD_F_REQUIRED) {		\
 			pr_info("<< missing attr: %s\n", #name);	\
-			return -ENOMSG;					\
+			err = -ENOMSG;					\
+			goto out;					\
 		}
 
 #undef __field
@@ -271,12 +285,12 @@ enum CONCATENATE(GENL_MAGIC_FAMILY, group_ids) {
 #undef GENL_mc_group
 #define GENL_mc_group(group)						\
 static int CONCATENATE(GENL_MAGIC_FAMILY, _genl_multicast_ ## group)(	\
-	struct sk_buff *skb, gfp_t flags)				\
+	struct sk_buff *skb)						\
 {									\
 	unsigned int group_id =						\
 		CONCATENATE(GENL_MAGIC_FAMILY, _group_ ## group);		\
-	return genlmsg_multicast(&ZZZ_genl_family, skb, 0,		\
-				 group_id, flags);			\
+	return genlmsg_multicast_allns(&ZZZ_genl_family, skb, 0,	\
+				 group_id);				\
 }
 
 #include GENL_MAGIC_INCLUDE_FILE
@@ -298,6 +312,8 @@ static struct genl_family ZZZ_genl_family __ro_after_init = {
 	.resv_start_op = 42, /* drbd is currently the only user */
 	.n_mcgrps = ARRAY_SIZE(ZZZ_genl_mcgrps),
 	.module = THIS_MODULE,
+	.netnsok = false,
+	.parallel_ops = true,
 };
 
 int CONCATENATE(GENL_MAGIC_FAMILY, _genl_register)(void)
-- 
2.53.0

