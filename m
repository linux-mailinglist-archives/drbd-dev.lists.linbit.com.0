Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKYtKyg4+2nUXwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:46:32 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5324DA71D
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:46:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A67B41622C5;
	Wed,  6 May 2026 14:46:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB1D81622C5
	for <drbd-dev@lists.linbit.com>; Wed,  6 May 2026 14:39:48 +0200 (CEST)
Received: by mail-wm1-f50.google.com with SMTP id
	5b1f17b1804b1-488ff90d6c7so60595435e9.2
	for <drbd-dev@lists.linbit.com>; Wed, 06 May 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1778071188;
	x=1778675988; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=fiK2cFc91Dqyyx/Xgwg79+vKRguKz5y+QF2nTyBTKeU=;
	b=c7khCHKHJnyyNSH3Jqc/QYyKURaQPo2aIhLkpgO6Yz9q8naxoegj66cZef9HUu0Yew
	quuUeZ5cG3c3mQKQB7ploJatl1Cfx8UG2bOvb9rWXZOlRC2yMXEpuzPcONPhkTDU0z9L
	MvjFblC/pkEUJU9DxffXEgpy5PxHdACdRMy0RJYO3vVqEe/vxMa72IKFLB59iX3ADAlN
	0yBy19469vp2MjZKifz8YTrhhK5rPblqKES+H1+/AE0lcCw/HlwkDerCuq0bv+sd/jRq
	NLft7STc8ys9/e9/TzUUxn4aPi5HBEIyruy6TWlrZoBumuy1kPhP9ct68MV6ZSmQkiOT
	+61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1778071188; x=1778675988;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=fiK2cFc91Dqyyx/Xgwg79+vKRguKz5y+QF2nTyBTKeU=;
	b=JbaLqbPM8xo4CGmHnZpGqrFpTntMIPELoBBhcbALHITT5L0Tc8Xjru0lSVDxo5p3Ke
	PK7JPDbzPSAD/pbURaFBsoneKnGsRXnXNRDlpjrz0v+q0ClAMIC3DRUx1LCs0KC20/F2
	ErRFlnR/230YIyp3VLM8aywyOt4cAuK/SPLRbHVrtACo6s7ZSh/5EjPbfKbn3+DLMf0V
	6SbQ3IIBqT+mpwoMnf5/yMJEHx5Oxb4WrG8lEo6JBtMtapUKTrpkf/+bqW7MArwyhpHb
	oQX9OqggCawd9/wjSEE/S0g+BZ5rhEQWy/5dMwzgd4CcqBE42Sjxd24IEO2PYPDJrfh/
	no8Q==
X-Gm-Message-State: AOJu0YwV+FjeBGTwBeT0zOJNdUX752knQC/0if27mknYHCZBp5+O2KLJ
	Xk9doeBJTR1LbhJEFqgdwQtxzss4HEEm0s2dbD5mBZPK1IMfeB9F88IaY47C2A6otDg0lQ==
X-Gm-Gg: AeBDietw0p46+2LQyHaIVqdlh+WU1rfotAVSm86F3bSWYqwGBv9ic8/jX6p2wW8QgyJ
	LyokxiFRS55iIpB81ymOXSsMwAh0VtcvYzdK4ZyTxbgVf5Udljispr9/UX7GWrrgGZBV6V1Vjhm
	NH/lgncmJccIifZdAwD7o67P+TV9Yp+Hy/TMDxi8oAe4VMvGJCjFYTTkVTOpXFGL6Rmg/xEy33H
	Moqn6dGgnXjrTKZCbqq3ZJRYkr/1cfwGIKM0VV5Si0shJt1T6WOzcZH2FAq9nd+Sw3gZVdLcxf7
	W0xYhboEA4yFIF9wgGBnyFsT27pId/3xNhF58ZVvOnhImsG0mO5c90PH6I0tRiw1QfSo6bLUlZY
	Ypein2KFSWotr89thPdfwZEhoAb+/Z1AbGw5MJpSY0VbCdcc9CqlCTzAzhI0z0IIGjMpyJP7NER
	ucQ42Lf+6As6nghZ8hpFTXcBquXa+Tb402cCZtkaFB4S/+/oMm26hJm8SZmB0Ow1d+xtY+IlpR0
	207NlaBPREbhA/7Udzy9b/goG3ql5ij
X-Received: by 2002:a05:600c:a305:b0:48d:361:4df6 with SMTP id
	5b1f17b1804b1-48e51e19680mr39655605e9.9.1778071187483; 
	Wed, 06 May 2026 05:39:47 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48e53891d62sm76399015e9.1.2026.05.06.05.39.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 May 2026 05:39:46 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 2/2] drbd: replace genl_magic with explicit netlink
	serialization
Date: Wed,  6 May 2026 14:39:26 +0200
Message-ID: <20260506123926.1944290-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
References: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 May 2026 14:46:08 +0200
Cc: Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
X-Rspamd-Queue-Id: 6C5324DA71D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.408];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linbit.com,google.com,kernel.org,lists.linbit.com];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid,linbit.com:email,mail19.linbit.com:helo,mail19.linbit.com:rdns]

Replace the genl_magic multi-include macro system with explicit
serialization and parsing.

The *_gen files were initially produced from a YNL spec via a
customized ynl-gen-c, but the DRBD netlink family is effectively
frozen, so the generator is kept unmodified.
All new functionality will land in a separate, properly-designed
family.
Carry the resulting code as ordinary in-tree source rather than
landing the spec and generator changes that produced it.

The bulk of the changes are mechanical renames to fit the YNL naming
conventions:
  - Handler functions: drbd_adm_* -> drbd_nl_*_doit/dumpit
  - GENL_MAGIC_VERSION -> DRBD_FAMILY_VERSION
  - GENL_MAGIC_FAMILY_HDRSZ -> sizeof(struct drbd_genlmsghdr)
  - drbd_genl_family -> drbd_nl_family
  - Attribute IDs: T_* -> DRBD_A_*

Remove the nested_attr_tb static global buffer and move to a per-call
allocation approach: each deserialization manages its own nested
attribute table. This will be needed anyway when we eventually move
to parallel_ops, and it's actually simpler this way, so make the
move now.

Replace the functionality of the "sensitive" flag: this was only used
by a single field (shared_secret); open-code redaction logic for that
locally.

Also replace the "invariant" flag: this only had a couple of users,
and those basically never change. Hard code the check directly inline.

The genl_family struct itself is defined manually in drbd_nl.c.

Also replace a couple of drbd-specific wrappers (nla_put_u64_0pad,
drbd_nla_find_nested) with standard kernel functions while we're at
it.

Finally, completely remove the genl_magic system; DRBD was its only
user.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Makefile       |    1 +
 drivers/block/drbd/drbd_debugfs.c |    2 +-
 drivers/block/drbd/drbd_int.h     |    4 +-
 drivers/block/drbd/drbd_main.c    |    6 +-
 drivers/block/drbd/drbd_nl.c      |  416 +++--
 drivers/block/drbd/drbd_nl_gen.c  | 2606 +++++++++++++++++++++++++++++
 drivers/block/drbd/drbd_nl_gen.h  |  395 +++++
 drivers/block/drbd/drbd_proc.c    |    2 +-
 include/linux/drbd_genl.h         |  536 ------
 include/linux/drbd_genl_api.h     |   16 -
 include/linux/genl_magic_func.h   |  413 -----
 include/linux/genl_magic_struct.h |  272 ---
 include/uapi/linux/drbd_genl.h    |  359 ++++
 13 files changed, 3606 insertions(+), 1422 deletions(-)
 create mode 100644 drivers/block/drbd/drbd_nl_gen.c
 create mode 100644 drivers/block/drbd/drbd_nl_gen.h
 delete mode 100644 include/linux/drbd_genl.h
 delete mode 100644 include/linux/drbd_genl_api.h
 delete mode 100644 include/linux/genl_magic_func.h
 delete mode 100644 include/linux/genl_magic_struct.h
 create mode 100644 include/uapi/linux/drbd_genl.h

diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index 187eaf81f0f8..5faaa8a8e7f0 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -3,6 +3,7 @@ drbd-y := drbd_buildtag.o drbd_bitmap.o drbd_proc.o
 drbd-y += drbd_worker.o drbd_receiver.o drbd_req.o drbd_actlog.o
 drbd-y += drbd_main.o drbd_strings.o drbd_nl.o
 drbd-y += drbd_interval.o drbd_state.o
+drbd-y += drbd_nl_gen.o
 drbd-$(CONFIG_DEBUG_FS) += drbd_debugfs.o
 
 obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/drbd_debugfs.c
index 12460b584bcb..371abcd7e880 100644
--- a/drivers/block/drbd/drbd_debugfs.c
+++ b/drivers/block/drbd/drbd_debugfs.c
@@ -844,7 +844,7 @@ static int drbd_version_show(struct seq_file *m, void *ignored)
 {
 	seq_printf(m, "# %s\n", drbd_buildtag());
 	seq_printf(m, "VERSION=%s\n", REL_VERSION);
-	seq_printf(m, "API_VERSION=%u\n", GENL_MAGIC_VERSION);
+	seq_printf(m, "API_VERSION=%u\n", DRBD_FAMILY_VERSION);
 	seq_printf(m, "PRO_VERSION_MIN=%u\n", PRO_VERSION_MIN);
 	seq_printf(m, "PRO_VERSION_MAX=%u\n", PRO_VERSION_MAX);
 	return 0;
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index f3d746a6d6fd..48b45c3142f7 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -32,14 +32,16 @@
 #include <net/tcp.h>
 #include <linux/lru_cache.h>
 #include <linux/prefetch.h>
-#include <linux/drbd_genl_api.h>
 #include <linux/drbd.h>
 #include "drbd_config.h"
+#include "drbd_nl_gen.h"
 #include "drbd_strings.h"
 #include "drbd_state.h"
 #include "drbd_protocol.h"
 #include "drbd_polymorph_printk.h"
 
+extern struct genl_family drbd_nl_family;
+
 /* shared module parameters, defined in drbd_main.c */
 #ifdef CONFIG_DRBD_FAULT_INJECTION
 extern int drbd_enable_faults;
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 200d464e984b..a18554ff6314 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2324,7 +2324,7 @@ static void drbd_cleanup(void)
 	if (retry.wq)
 		destroy_workqueue(retry.wq);
 
-	drbd_genl_unregister();
+	genl_unregister_family(&drbd_nl_family);
 
 	idr_for_each_entry(&drbd_devices, device, i)
 		drbd_delete_device(device);
@@ -2846,7 +2846,7 @@ static int __init drbd_init(void)
 	mutex_init(&resources_mutex);
 	INIT_LIST_HEAD(&drbd_resources);
 
-	err = drbd_genl_register();
+	err = genl_register_family(&drbd_nl_family);
 	if (err) {
 		pr_err("unable to register generic netlink family\n");
 		goto fail;
@@ -2876,7 +2876,7 @@ static int __init drbd_init(void)
 
 	pr_info("initialized. "
 	       "Version: " REL_VERSION " (api:%d/proto:%d-%d)\n",
-	       GENL_MAGIC_VERSION, PRO_VERSION_MIN, PRO_VERSION_MAX);
+	       DRBD_FAMILY_VERSION, PRO_VERSION_MIN, PRO_VERSION_MAX);
 	pr_info("%s\n", drbd_buildtag());
 	pr_info("registered as block device major %d\n", DRBD_MAJOR);
 	return 0; /* Success! */
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index d997d274092c..00e402808cdb 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -31,59 +31,13 @@
 
 #include <net/genetlink.h>
 
-/* .doit */
-// int drbd_adm_create_resource(struct sk_buff *skb, struct genl_info *info);
-// int drbd_adm_delete_resource(struct sk_buff *skb, struct genl_info *info);
-
-int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info);
-
-int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_del_resource(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_down(struct sk_buff *skb, struct genl_info *info);
-
-int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_suspend_io(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_outdate(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_get_status(struct sk_buff *skb, struct genl_info *info);
-int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info);
-/* .dumpit */
-int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_devices_done(struct netlink_callback *cb);
-int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_connections_done(struct netlink_callback *cb);
-int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb);
-int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb);
-
-#include <linux/drbd_genl_api.h>
-
-static int drbd_pre_doit(const struct genl_split_ops *ops,
-			 struct sk_buff *skb, struct genl_info *info);
-static void drbd_post_doit(const struct genl_split_ops *ops,
-			   struct sk_buff *skb, struct genl_info *info);
-
-#define GENL_MAGIC_FAMILY_PRE_DOIT	drbd_pre_doit
-#define GENL_MAGIC_FAMILY_POST_DOIT	drbd_post_doit
-
-#include <linux/genl_magic_func.h>
+#include "drbd_nl_gen.h"
+
+static int drbd_genl_multicast_events(struct sk_buff *skb, gfp_t flags)
+{
+	return genlmsg_multicast(&drbd_nl_family, skb, 0,
+				 DRBD_NLGRP_EVENTS, flags);
+}
 
 static atomic_t drbd_genl_seq = ATOMIC_INIT(2); /* two. */
 static atomic_t notify_genl_seq = ATOMIC_INIT(2); /* two. */
@@ -114,7 +68,7 @@ static int drbd_msg_put_info(struct sk_buff *skb, const char *info)
 	if (!nla)
 		return err;
 
-	err = nla_put_string(skb, T_info_text, info);
+	err = nla_put_string(skb, DRBD_A_DRBD_CFG_REPLY_INFO_TEXT, info);
 	if (err) {
 		nla_nest_cancel(skb, nla);
 		return err;
@@ -135,7 +89,7 @@ static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)
 	if (!nla)
 		return err;
 
-	txt = nla_reserve(skb, T_info_text, 256);
+	txt = nla_reserve(skb, DRBD_A_DRBD_CFG_REPLY_INFO_TEXT, 256);
 	if (!txt) {
 		nla_nest_cancel(skb, nla);
 		return err;
@@ -187,6 +141,15 @@ static const unsigned int drbd_genl_cmd_flags[] = {
 	[DRBD_ADM_DOWN]           = DRBD_ADM_NEED_RESOURCE,
 };
 
+/* Detect attempts to change invariant attributes in a _change_ handler. */
+#define has_invariant(ntb, attr)						\
+({									\
+	bool __found = !!(ntb)[attr];					\
+	if (__found)							\
+		pr_info("must not change invariant attr: %s\n", #attr);	\
+	__found;							\
+})
+
 /*
  * At this point, we still rely on the global genl_lock().
  * If we want to avoid that, and allow "genl_family.parallel_ops", we may need
@@ -210,7 +173,7 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	}
 
 	adm_ctx->reply_dh = genlmsg_put_reply(adm_ctx->reply_skb,
-					info, &drbd_genl_family, 0, cmd);
+					info, &drbd_nl_family, 0, cmd);
 	/* put of a few bytes into a fresh skb of >= 4k will always succeed.
 	 * but anyways */
 	if (!adm_ctx->reply_dh) {
@@ -223,9 +186,11 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 
 	adm_ctx->volume = VOLUME_UNSPECIFIED;
 	if (info->attrs[DRBD_NLA_CFG_CONTEXT]) {
+		struct nlattr **ntb;
 		struct nlattr *nla;
-		/* parse and validate only */
-		err = drbd_cfg_context_from_attrs(NULL, info);
+
+		/* parse and validate, get nested attribute table */
+		err = drbd_cfg_context_ntb_from_attrs(&ntb, info);
 		if (err)
 			goto fail;
 
@@ -234,18 +199,21 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 		err = nla_put_nohdr(adm_ctx->reply_skb,
 				info->attrs[DRBD_NLA_CFG_CONTEXT]->nla_len,
 				info->attrs[DRBD_NLA_CFG_CONTEXT]);
-		if (err)
+		if (err) {
+			kfree(ntb);
 			goto fail;
+		}
 
 		/* and assign stuff to the adm_ctx */
-		nla = nested_attr_tb[T_ctx_volume];
+		nla = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_VOLUME];
 		if (nla)
 			adm_ctx->volume = nla_get_u32(nla);
-		nla = nested_attr_tb[T_ctx_resource_name];
+		nla = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME];
 		if (nla)
 			adm_ctx->resource_name = nla_data(nla);
-		adm_ctx->my_addr = nested_attr_tb[T_ctx_my_addr];
-		adm_ctx->peer_addr = nested_attr_tb[T_ctx_peer_addr];
+		adm_ctx->my_addr = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_MY_ADDR];
+		adm_ctx->peer_addr = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR];
+		kfree(ntb);
 		if ((adm_ctx->my_addr &&
 		     nla_len(adm_ctx->my_addr) > sizeof(adm_ctx->connection->my_addr)) ||
 		    (adm_ctx->peer_addr &&
@@ -259,7 +227,7 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	adm_ctx->device = minor_to_device(d_in->minor);
 
 	/* We are protected by the global genl_lock().
-	 * But we may explicitly drop it/retake it in drbd_adm_set_role(),
+	 * But we may explicitly drop it/retake it in drbd_nl_set_role(),
 	 * so make sure this object stays around. */
 	if (adm_ctx->device)
 		kref_get(&adm_ctx->device->kref);
@@ -334,8 +302,8 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	return err;
 }
 
-static int drbd_pre_doit(const struct genl_split_ops *ops,
-			 struct sk_buff *skb, struct genl_info *info)
+int drbd_pre_doit(const struct genl_split_ops *ops,
+		  struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx;
 	u8 cmd = info->genlhdr->cmd;
@@ -362,8 +330,8 @@ static int drbd_pre_doit(const struct genl_split_ops *ops,
 	return 0;
 }
 
-static void drbd_post_doit(const struct genl_split_ops *ops,
-			   struct sk_buff *skb, struct genl_info *info)
+void drbd_post_doit(const struct genl_split_ops *ops,
+		    struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 
@@ -828,7 +796,7 @@ static const char *from_attrs_err_to_txt(int err)
 		"invalid attribute value";
 }
 
-int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
+static int drbd_nl_set_role(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct set_role_parms parms;
@@ -868,6 +836,16 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
+int drbd_nl_primary_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	return drbd_nl_set_role(skb, info);
+}
+
+int drbd_nl_secondary_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	return drbd_nl_set_role(skb, info);
+}
+
 /* Initializes the md.*_offset members, so we are able to find
  * the on disk meta data.
  *
@@ -962,7 +940,7 @@ char *ppsize(char *buf, unsigned long long size)
  *  peer may not initiate a resize.
  */
 /* Note these are not to be confused with
- * drbd_adm_suspend_io/drbd_adm_resume_io,
+ * drbd_nl_suspend_io_doit/drbd_nl_resume_io_doit,
  * which are (sub) state changes triggered by admin (drbdsetup),
  * and can be long lived.
  * This changes an device->flag, is triggered by drbd internals,
@@ -1574,13 +1552,14 @@ static int disk_opts_check_al_size(struct drbd_device *device, struct disk_conf
 	return err;
 }
 
-int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_chg_disk_opts_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct drbd_device *device;
 	struct disk_conf *new_disk_conf, *old_disk_conf;
 	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
+	struct nlattr **ntb;
 	int err;
 	unsigned int fifo_size;
 
@@ -1612,13 +1591,29 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	if (should_set_defaults(info))
 		set_disk_conf_defaults(new_disk_conf);
 
-	err = disk_conf_from_attrs_for_change(new_disk_conf, info);
+	err = disk_conf_from_attrs(new_disk_conf, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
 		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail_unlock;
 	}
 
+	err = disk_conf_ntb_from_attrs(&ntb, info);
+	if (!err) {
+		if (has_invariant(ntb, DRBD_A_DISK_CONF_BACKING_DEV) ||
+		    has_invariant(ntb, DRBD_A_DISK_CONF_META_DEV) ||
+		    has_invariant(ntb, DRBD_A_DISK_CONF_META_DEV_IDX) ||
+		    has_invariant(ntb, DRBD_A_DISK_CONF_DISK_SIZE) ||
+		    has_invariant(ntb, DRBD_A_DISK_CONF_MAX_BIO_BVECS)) {
+			retcode = ERR_MANDATORY_TAG;
+			drbd_msg_put_info(adm_ctx->reply_skb,
+				"cannot change invariant setting");
+			kfree(ntb);
+			goto fail_unlock;
+		}
+		kfree(ntb);
+	}
+
 	if (!expect(device, new_disk_conf->resync_rate >= 1))
 		new_disk_conf->resync_rate = 1;
 
@@ -1796,7 +1791,7 @@ void drbd_backing_dev_free(struct drbd_device *device, struct drbd_backing_dev *
 	kfree(ldev);
 }
 
-int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_attach_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
@@ -2236,7 +2231,7 @@ static int adm_detach(struct drbd_device *device, int force)
  * Then we transition to D_DISKLESS, and wait for put_ldev() to return all
  * internal references as well.
  * Only then we have finally detached. */
-int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_detach_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
@@ -2434,12 +2429,13 @@ static void free_crypto(struct crypto *crypto)
 	crypto_free_shash(crypto->verify_tfm);
 }
 
-int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_chg_net_opts_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct drbd_connection *connection;
 	struct net_conf *old_net_conf, *new_net_conf = NULL;
+	struct nlattr **ntb;
 	int err;
 	int ovr; /* online verify running */
 	int rsr; /* re-sync running */
@@ -2476,13 +2472,26 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 	if (should_set_defaults(info))
 		set_net_conf_defaults(new_net_conf);
 
-	err = net_conf_from_attrs_for_change(new_net_conf, info);
+	err = net_conf_from_attrs(new_net_conf, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
 		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail;
 	}
 
+	err = net_conf_ntb_from_attrs(&ntb, info);
+	if (!err) {
+		if (has_invariant(ntb, DRBD_A_NET_CONF_DISCARD_MY_DATA) ||
+		    has_invariant(ntb, DRBD_A_NET_CONF_TENTATIVE)) {
+			retcode = ERR_MANDATORY_TAG;
+			drbd_msg_put_info(adm_ctx->reply_skb,
+				"cannot change invariant setting");
+			kfree(ntb);
+			goto fail;
+		}
+		kfree(ntb);
+	}
+
 	retcode = check_net_options(connection, new_net_conf);
 	if (retcode != NO_ERROR)
 		goto fail;
@@ -2575,7 +2584,7 @@ static void peer_device_to_info(struct peer_device_info *info,
 	info->peer_resync_susp_dependency = device->state.aftr_isp;
 }
 
-int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_connect_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct connection_info connection_info;
 	enum drbd_notification_type flags;
@@ -2790,7 +2799,7 @@ static enum drbd_state_rv conn_try_disconnect(struct drbd_connection *connection
 	return rv;
 }
 
-int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_disconnect_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct disconnect_parms parms;
@@ -2845,7 +2854,7 @@ void resync_after_online_grow(struct drbd_device *device)
 		_drbd_request_state(device, NS(conn, C_WF_SYNC_UUID), CS_VERBOSE + CS_SERIALIZE);
 }
 
-int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_resize_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct disk_conf *old_disk_conf, *new_disk_conf = NULL;
@@ -2981,7 +2990,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 	goto fail;
 }
 
-int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_resource_opts_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
@@ -3019,7 +3028,7 @@ int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_invalidate_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
@@ -3097,7 +3106,7 @@ static int drbd_bmio_set_susp_al(struct drbd_device *device,
 	return rv;
 }
 
-int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_inval_peer_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	int retcode; /* drbd_ret_code, drbd_state_rv */
@@ -3148,7 +3157,7 @@ int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_pause_sync_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
@@ -3168,7 +3177,7 @@ int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_resume_sync_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	union drbd_dev_state s;
@@ -3196,12 +3205,12 @@ int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_suspend_io(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_suspend_io_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	return drbd_adm_simple_request_state(skb, info, NS(susp, 1));
 }
 
-int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_resume_io_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
@@ -3257,7 +3266,7 @@ int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_outdate(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_outdate_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	return drbd_adm_simple_request_state(skb, info, NS(disk, D_OUTDATED));
 }
@@ -3272,16 +3281,20 @@ static int nla_put_drbd_cfg_context(struct sk_buff *skb,
 	if (!nla)
 		goto nla_put_failure;
 	if (device &&
-	    nla_put_u32(skb, T_ctx_volume, device->vnr))
+	    nla_put_u32(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_VOLUME, device->vnr))
 		goto nla_put_failure;
-	if (nla_put_string(skb, T_ctx_resource_name, resource->name))
+	if (nla_put_string(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME, resource->name))
 		goto nla_put_failure;
 	if (connection) {
 		if (connection->my_addr_len &&
-		    nla_put(skb, T_ctx_my_addr, connection->my_addr_len, &connection->my_addr))
+		    nla_put(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_MY_ADDR,
+			    connection->my_addr_len,
+			    &connection->my_addr))
 			goto nla_put_failure;
 		if (connection->peer_addr_len &&
-		    nla_put(skb, T_ctx_peer_addr, connection->peer_addr_len, &connection->peer_addr))
+		    nla_put(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR,
+			    connection->peer_addr_len,
+			    &connection->peer_addr))
 			goto nla_put_failure;
 	}
 	nla_nest_end(skb, nla);
@@ -3300,7 +3313,7 @@ static int nla_put_drbd_cfg_context(struct sk_buff *skb,
  */
 static struct nlattr *find_cfg_context_attr(const struct nlmsghdr *nlh, int attr)
 {
-	const unsigned hdrlen = GENL_HDRLEN + GENL_MAGIC_FAMILY_HDRSZ;
+	const unsigned int hdrlen = GENL_HDRLEN + sizeof(struct drbd_genlmsghdr);
 	struct nlattr *nla;
 
 	nla = nla_find(nlmsg_attrdata(nlh, hdrlen), nlmsg_attrlen(nlh, hdrlen),
@@ -3312,7 +3325,7 @@ static struct nlattr *find_cfg_context_attr(const struct nlmsghdr *nlh, int attr
 
 static void resource_to_info(struct resource_info *, struct drbd_resource *);
 
-int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb)
+int drbd_nl_get_resources_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct drbd_genlmsghdr *dh;
 	struct drbd_resource *resource;
@@ -3340,7 +3353,7 @@ int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb)
 
 put_result:
 	dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
-			cb->nlh->nlmsg_seq, &drbd_genl_family,
+			cb->nlh->nlmsg_seq, &drbd_nl_family,
 			NLM_F_MULTI, DRBD_ADM_GET_RESOURCES);
 	err = -ENOMEM;
 	if (!dh)
@@ -3350,15 +3363,15 @@ int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb)
 	err = nla_put_drbd_cfg_context(skb, resource, NULL, NULL);
 	if (err)
 		goto out;
-	err = res_opts_to_skb(skb, &resource->res_opts, !capable(CAP_SYS_ADMIN));
+	err = res_opts_to_skb(skb, &resource->res_opts);
 	if (err)
 		goto out;
 	resource_to_info(&resource_info, resource);
-	err = resource_info_to_skb(skb, &resource_info, !capable(CAP_SYS_ADMIN));
+	err = resource_info_to_skb(skb, &resource_info);
 	if (err)
 		goto out;
 	resource_statistics.res_stat_write_ordering = resource->write_ordering;
-	err = resource_statistics_to_skb(skb, &resource_statistics, !capable(CAP_SYS_ADMIN));
+	err = resource_statistics_to_skb(skb, &resource_statistics);
 	if (err)
 		goto out;
 	cb->args[0] = (long)resource;
@@ -3423,7 +3436,7 @@ int drbd_adm_dump_devices_done(struct netlink_callback *cb) {
 
 static void device_to_info(struct device_info *, struct drbd_device *);
 
-int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
+int drbd_nl_get_devices_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource;
@@ -3436,7 +3449,8 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 
 	resource = (struct drbd_resource *)cb->args[0];
 	if (!cb->args[0] && !cb->args[1]) {
-		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
+		resource_filter = find_cfg_context_attr(cb->nlh,
+				DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME);
 		if (resource_filter) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
@@ -3465,7 +3479,7 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 
 put_result:
 	dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
-			cb->nlh->nlmsg_seq, &drbd_genl_family,
+			cb->nlh->nlmsg_seq, &drbd_nl_family,
 			NLM_F_MULTI, DRBD_ADM_GET_DEVICES);
 	err = -ENOMEM;
 	if (!dh)
@@ -3481,18 +3495,18 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 			struct disk_conf *disk_conf =
 				rcu_dereference(device->ldev->disk_conf);
 
-			err = disk_conf_to_skb(skb, disk_conf, !capable(CAP_SYS_ADMIN));
+			err = disk_conf_to_skb(skb, disk_conf);
 			put_ldev(device);
 			if (err)
 				goto out;
 		}
 		device_to_info(&device_info, device);
-		err = device_info_to_skb(skb, &device_info, !capable(CAP_SYS_ADMIN));
+		err = device_info_to_skb(skb, &device_info);
 		if (err)
 			goto out;
 
 		device_to_statistics(&device_statistics, device);
-		err = device_statistics_to_skb(skb, &device_statistics, !capable(CAP_SYS_ADMIN));
+		err = device_statistics_to_skb(skb, &device_statistics);
 		if (err)
 			goto out;
 		cb->args[1] = minor + 1;
@@ -3514,7 +3528,7 @@ int drbd_adm_dump_connections_done(struct netlink_callback *cb)
 
 enum { SINGLE_RESOURCE, ITERATE_RESOURCES };
 
-int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
+int drbd_nl_get_connections_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource = NULL, *next_resource;
@@ -3527,7 +3541,8 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 	rcu_read_lock();
 	resource = (struct drbd_resource *)cb->args[0];
 	if (!cb->args[0]) {
-		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
+		resource_filter = find_cfg_context_attr(cb->nlh,
+				DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME);
 		if (resource_filter) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
@@ -3591,7 +3606,7 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 
 put_result:
 	dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
-			cb->nlh->nlmsg_seq, &drbd_genl_family,
+			cb->nlh->nlmsg_seq, &drbd_nl_family,
 			NLM_F_MULTI, DRBD_ADM_GET_CONNECTIONS);
 	err = -ENOMEM;
 	if (!dh)
@@ -3606,16 +3621,16 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 			goto out;
 		net_conf = rcu_dereference(connection->net_conf);
 		if (net_conf) {
-			err = net_conf_to_skb(skb, net_conf, !capable(CAP_SYS_ADMIN));
+			err = net_conf_to_skb(skb, net_conf);
 			if (err)
 				goto out;
 		}
 		connection_to_info(&connection_info, connection);
-		err = connection_info_to_skb(skb, &connection_info, !capable(CAP_SYS_ADMIN));
+		err = connection_info_to_skb(skb, &connection_info);
 		if (err)
 			goto out;
 		connection_statistics.conn_congested = test_bit(NET_CONGESTED, &connection->flags);
-		err = connection_statistics_to_skb(skb, &connection_statistics, !capable(CAP_SYS_ADMIN));
+		err = connection_statistics_to_skb(skb, &connection_statistics);
 		if (err)
 			goto out;
 		cb->args[2] = (long)connection;
@@ -3676,7 +3691,7 @@ int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb)
 	return put_resource_in_arg0(cb, 9);
 }
 
-int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
+int drbd_nl_get_peer_devices_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource;
@@ -3688,7 +3703,8 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 
 	resource = (struct drbd_resource *)cb->args[0];
 	if (!cb->args[0] && !cb->args[1]) {
-		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
+		resource_filter = find_cfg_context_attr(cb->nlh,
+				DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME);
 		if (resource_filter) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
@@ -3735,7 +3751,7 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 
 put_result:
 	dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
-			cb->nlh->nlmsg_seq, &drbd_genl_family,
+			cb->nlh->nlmsg_seq, &drbd_nl_family,
 			NLM_F_MULTI, DRBD_ADM_GET_PEER_DEVICES);
 	err = -ENOMEM;
 	if (!dh)
@@ -3751,11 +3767,11 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 		if (err)
 			goto out;
 		peer_device_to_info(&peer_device_info, peer_device);
-		err = peer_device_info_to_skb(skb, &peer_device_info, !capable(CAP_SYS_ADMIN));
+		err = peer_device_info_to_skb(skb, &peer_device_info);
 		if (err)
 			goto out;
 		peer_device_to_statistics(&peer_device_statistics, peer_device);
-		err = peer_device_statistics_to_skb(skb, &peer_device_statistics, !capable(CAP_SYS_ADMIN));
+		err = peer_device_statistics_to_skb(skb, &peer_device_statistics);
 		if (err)
 			goto out;
 		cb->args[1] = minor;
@@ -3795,11 +3811,11 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 	/* If sib != NULL, this is drbd_bcast_event, which anyone can listen
 	 * to.  So we better exclude_sensitive information.
 	 *
-	 * If sib == NULL, this is drbd_adm_get_status, executed synchronously
+	 * If sib == NULL, this is drbd_nl_get_status_doit, executed synchronously
 	 * in the context of the requesting user process. Exclude sensitive
 	 * information, unless current has superuser.
 	 *
-	 * NOTE: for drbd_adm_get_status_all(), this is a netlink dump, and
+	 * NOTE: for drbd_nl_get_status_dumpit(), this is a netlink dump, and
 	 * relies on the current implementation of netlink_dump(), which
 	 * executes the dump callback successively from netlink_recvmsg(),
 	 * always in the context of the receiving process */
@@ -3812,7 +3828,7 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 	if (nla_put_drbd_cfg_context(skb, resource, the_only_connection(resource), device))
 		goto nla_put_failure;
 
-	if (res_opts_to_skb(skb, &device->resource->res_opts, exclude_sensitive))
+	if (res_opts_to_skb(skb, &device->resource->res_opts))
 		goto nla_put_failure;
 
 	rcu_read_lock();
@@ -3820,14 +3836,24 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 		struct disk_conf *disk_conf;
 
 		disk_conf = rcu_dereference(device->ldev->disk_conf);
-		err = disk_conf_to_skb(skb, disk_conf, exclude_sensitive);
+		err = disk_conf_to_skb(skb, disk_conf);
 	}
 	if (!err) {
 		struct net_conf *nc;
 
 		nc = rcu_dereference(first_peer_device(device)->connection->net_conf);
-		if (nc)
-			err = net_conf_to_skb(skb, nc, exclude_sensitive);
+		if (nc) {
+			if (exclude_sensitive) {
+				struct net_conf nc_clean = *nc;
+
+				memset(nc_clean.shared_secret, 0,
+				       sizeof(nc_clean.shared_secret));
+				nc_clean.shared_secret_len = 0;
+				err = net_conf_to_skb(skb, &nc_clean);
+			} else {
+				err = net_conf_to_skb(skb, nc);
+			}
+		}
 	}
 	rcu_read_unlock();
 	if (err)
@@ -3836,42 +3862,57 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 	nla = nla_nest_start_noflag(skb, DRBD_NLA_STATE_INFO);
 	if (!nla)
 		goto nla_put_failure;
-	if (nla_put_u32(skb, T_sib_reason, sib ? sib->sib_reason : SIB_GET_STATUS_REPLY) ||
-	    nla_put_u32(skb, T_current_state, device->state.i) ||
-	    nla_put_u64_0pad(skb, T_ed_uuid, device->ed_uuid) ||
-	    nla_put_u64_0pad(skb, T_capacity, get_capacity(device->vdisk)) ||
-	    nla_put_u64_0pad(skb, T_send_cnt, device->send_cnt) ||
-	    nla_put_u64_0pad(skb, T_recv_cnt, device->recv_cnt) ||
-	    nla_put_u64_0pad(skb, T_read_cnt, device->read_cnt) ||
-	    nla_put_u64_0pad(skb, T_writ_cnt, device->writ_cnt) ||
-	    nla_put_u64_0pad(skb, T_al_writ_cnt, device->al_writ_cnt) ||
-	    nla_put_u64_0pad(skb, T_bm_writ_cnt, device->bm_writ_cnt) ||
-	    nla_put_u32(skb, T_ap_bio_cnt, atomic_read(&device->ap_bio_cnt)) ||
-	    nla_put_u32(skb, T_ap_pending_cnt, atomic_read(&device->ap_pending_cnt)) ||
-	    nla_put_u32(skb, T_rs_pending_cnt, atomic_read(&device->rs_pending_cnt)))
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_SIB_REASON,
+		       sib ? sib->sib_reason : SIB_GET_STATUS_REPLY) ||
+	    nla_put_u32(skb, DRBD_A_STATE_INFO_CURRENT_STATE,
+		       device->state.i) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_ED_UUID,
+			     device->ed_uuid, 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_CAPACITY,
+			     get_capacity(device->vdisk), 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_SEND_CNT,
+			     device->send_cnt, 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_RECV_CNT,
+			     device->recv_cnt, 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_READ_CNT,
+			     device->read_cnt, 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_WRIT_CNT,
+			     device->writ_cnt, 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_AL_WRIT_CNT,
+			     device->al_writ_cnt, 0) ||
+	    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BM_WRIT_CNT,
+			     device->bm_writ_cnt, 0) ||
+	    nla_put_u32(skb, DRBD_A_STATE_INFO_AP_BIO_CNT,
+		       atomic_read(&device->ap_bio_cnt)) ||
+	    nla_put_u32(skb, DRBD_A_STATE_INFO_AP_PENDING_CNT,
+		       atomic_read(&device->ap_pending_cnt)) ||
+	    nla_put_u32(skb, DRBD_A_STATE_INFO_RS_PENDING_CNT,
+		       atomic_read(&device->rs_pending_cnt)))
 		goto nla_put_failure;
 
 	if (got_ldev) {
 		int err;
 
 		spin_lock_irq(&device->ldev->md.uuid_lock);
-		err = nla_put(skb, T_uuids, sizeof(si->uuids), device->ldev->md.uuid);
+		err = nla_put(skb, DRBD_A_STATE_INFO_UUIDS,
+			     sizeof(si->uuids),
+			     device->ldev->md.uuid);
 		spin_unlock_irq(&device->ldev->md.uuid_lock);
 
 		if (err)
 			goto nla_put_failure;
 
-		if (nla_put_u32(skb, T_disk_flags, device->ldev->md.flags) ||
-		    nla_put_u64_0pad(skb, T_bits_total, drbd_bm_bits(device)) ||
-		    nla_put_u64_0pad(skb, T_bits_oos,
-				     drbd_bm_total_weight(device)))
+		if (nla_put_u32(skb, DRBD_A_STATE_INFO_DISK_FLAGS, device->ldev->md.flags) ||
+		    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_TOTAL, drbd_bm_bits(device), 0) ||
+		    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_OOS,
+				      drbd_bm_total_weight(device), 0))
 			goto nla_put_failure;
 		if (C_SYNC_SOURCE <= device->state.conn &&
 		    C_PAUSED_SYNC_T >= device->state.conn) {
-			if (nla_put_u64_0pad(skb, T_bits_rs_total,
-					     device->rs_total) ||
-			    nla_put_u64_0pad(skb, T_bits_rs_failed,
-					     device->rs_failed))
+			if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_RS_TOTAL,
+					      device->rs_total, 0) ||
+			    nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_RS_FAILED,
+					      device->rs_failed, 0))
 				goto nla_put_failure;
 		}
 	}
@@ -3882,17 +3923,17 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 		case SIB_GET_STATUS_REPLY:
 			break;
 		case SIB_STATE_CHANGE:
-			if (nla_put_u32(skb, T_prev_state, sib->os.i) ||
-			    nla_put_u32(skb, T_new_state, sib->ns.i))
+			if (nla_put_u32(skb, DRBD_A_STATE_INFO_PREV_STATE, sib->os.i) ||
+			    nla_put_u32(skb, DRBD_A_STATE_INFO_NEW_STATE, sib->ns.i))
 				goto nla_put_failure;
 			break;
 		case SIB_HELPER_POST:
-			if (nla_put_u32(skb, T_helper_exit_code,
+			if (nla_put_u32(skb, DRBD_A_STATE_INFO_HELPER_EXIT_CODE,
 					sib->helper_exit_code))
 				goto nla_put_failure;
 			fallthrough;
 		case SIB_HELPER_PRE:
-			if (nla_put_string(skb, T_helper, sib->helper_name))
+			if (nla_put_string(skb, DRBD_A_STATE_INFO_HELPER, sib->helper_name))
 				goto nla_put_failure;
 			break;
 		}
@@ -3907,7 +3948,7 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 	return err;
 }
 
-int drbd_adm_get_status(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_get_status_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
@@ -3997,7 +4038,7 @@ static int get_one_status(struct sk_buff *skb, struct netlink_callback *cb)
 		}
 
 		dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
-				cb->nlh->nlmsg_seq, &drbd_genl_family,
+				cb->nlh->nlmsg_seq, &drbd_nl_family,
 				NLM_F_MULTI, DRBD_ADM_GET_STATUS);
 		if (!dh)
 			goto out;
@@ -4017,7 +4058,7 @@ static int get_one_status(struct sk_buff *skb, struct netlink_callback *cb)
 				struct net_conf *nc;
 
 				nc = rcu_dereference(connection->net_conf);
-				if (nc && net_conf_to_skb(skb, nc, 1) != 0)
+				if (nc && net_conf_to_skb(skb, nc) != 0)
 					goto cancel;
 			}
 			goto done;
@@ -4059,9 +4100,9 @@ static int get_one_status(struct sk_buff *skb, struct netlink_callback *cb)
  *
  * Once things are setup properly, we call into get_one_status().
  */
-int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
+int drbd_nl_get_status_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 {
-	const unsigned hdrlen = GENL_HDRLEN + GENL_MAGIC_FAMILY_HDRSZ;
+	const unsigned int hdrlen = GENL_HDRLEN + sizeof(struct drbd_genlmsghdr);
 	struct nlattr *nla;
 	const char *resource_name;
 	struct drbd_resource *resource;
@@ -4084,7 +4125,7 @@ int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
 	/* No explicit context given.  Dump all. */
 	if (!nla)
 		goto dump;
-	nla = nla_find_nested(nla, T_ctx_resource_name);
+	nla = nla_find_nested(nla, DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME);
 	/* context given, but no name present? */
 	if (!nla)
 		return -EINVAL;
@@ -4107,7 +4148,7 @@ int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
 	return get_one_status(skb, cb);
 }
 
-int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_get_timeout_type_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
@@ -4125,7 +4166,7 @@ int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
 		test_bit(USE_DEGR_WFC_T, &adm_ctx->device->flags) ? UT_DEGRADED :
 		UT_DEFAULT;
 
-	err = timeout_parms_to_priv_skb(adm_ctx->reply_skb, &tp);
+	err = timeout_parms_to_skb(adm_ctx->reply_skb, &tp);
 	if (err) {
 		nlmsg_free(adm_ctx->reply_skb);
 		adm_ctx->reply_skb = NULL;
@@ -4136,7 +4177,7 @@ int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_start_ov_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
@@ -4182,7 +4223,7 @@ int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
 }
 
 
-int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_new_c_uuid_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
@@ -4285,7 +4326,7 @@ static void resource_to_info(struct resource_info *info,
 	info->res_susp_fen = resource->susp_fen;
 }
 
-int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_new_resource_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_connection *connection;
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
@@ -4348,7 +4389,7 @@ static void device_to_info(struct device_info *info,
 }
 
 
-int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_new_minor_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_genlmsghdr *dh = genl_info_userhdr(info);
@@ -4455,7 +4496,7 @@ static enum drbd_ret_code adm_del_minor(struct drbd_device *device)
 		return ERR_MINOR_CONFIGURED;
 }
 
-int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_del_minor_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
@@ -4504,7 +4545,7 @@ static int adm_del_resource(struct drbd_resource *resource)
 	return NO_ERROR;
 }
 
-int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_down_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_resource *resource;
@@ -4567,7 +4608,7 @@ int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
-int drbd_adm_del_resource(struct sk_buff *skb, struct genl_info *info)
+int drbd_nl_del_resource_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_resource *resource;
@@ -4601,7 +4642,7 @@ void drbd_bcast_event(struct drbd_device *device, const struct sib_info *sib)
 		goto failed;
 
 	err = -EMSGSIZE;
-	d_out = genlmsg_put(msg, 0, seq, &drbd_genl_family, 0, DRBD_EVENT);
+	d_out = genlmsg_put(msg, 0, seq, &drbd_nl_family, 0, DRBD_ADM_EVENT);
 	if (!d_out) /* cannot happen, but anyways. */
 		goto nla_put_failure;
 	d_out->minor = device_to_minor(device);
@@ -4632,7 +4673,7 @@ static int nla_put_notification_header(struct sk_buff *msg,
 		.nh_type = type,
 	};
 
-	return drbd_notification_header_to_skb(msg, &nh, true);
+	return drbd_notification_header_to_skb(msg, &nh);
 }
 
 int notify_resource_state(struct sk_buff *skb,
@@ -4656,7 +4697,7 @@ int notify_resource_state(struct sk_buff *skb,
 	}
 
 	err = -EMSGSIZE;
-	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_RESOURCE_STATE);
+	dh = genlmsg_put(skb, 0, seq, &drbd_nl_family, 0, DRBD_ADM_RESOURCE_STATE);
 	if (!dh)
 		goto nla_put_failure;
 	dh->minor = -1U;
@@ -4664,10 +4705,10 @@ int notify_resource_state(struct sk_buff *skb,
 	if (nla_put_drbd_cfg_context(skb, resource, NULL, NULL) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
-	     resource_info_to_skb(skb, resource_info, true)))
+	     resource_info_to_skb(skb, resource_info)))
 		goto nla_put_failure;
 	resource_statistics.res_stat_write_ordering = resource->write_ordering;
-	err = resource_statistics_to_skb(skb, &resource_statistics, !capable(CAP_SYS_ADMIN));
+	err = resource_statistics_to_skb(skb, &resource_statistics);
 	if (err)
 		goto nla_put_failure;
 	genlmsg_end(skb, dh);
@@ -4708,7 +4749,7 @@ int notify_device_state(struct sk_buff *skb,
 	}
 
 	err = -EMSGSIZE;
-	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_DEVICE_STATE);
+	dh = genlmsg_put(skb, 0, seq, &drbd_nl_family, 0, DRBD_ADM_DEVICE_STATE);
 	if (!dh)
 		goto nla_put_failure;
 	dh->minor = device->minor;
@@ -4716,10 +4757,10 @@ int notify_device_state(struct sk_buff *skb,
 	if (nla_put_drbd_cfg_context(skb, device->resource, NULL, device) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
-	     device_info_to_skb(skb, device_info, true)))
+	     device_info_to_skb(skb, device_info)))
 		goto nla_put_failure;
 	device_to_statistics(&device_statistics, device);
-	device_statistics_to_skb(skb, &device_statistics, !capable(CAP_SYS_ADMIN));
+	device_statistics_to_skb(skb, &device_statistics);
 	genlmsg_end(skb, dh);
 	if (multicast) {
 		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
@@ -4758,7 +4799,7 @@ int notify_connection_state(struct sk_buff *skb,
 	}
 
 	err = -EMSGSIZE;
-	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_CONNECTION_STATE);
+	dh = genlmsg_put(skb, 0, seq, &drbd_nl_family, 0, DRBD_ADM_CONNECTION_STATE);
 	if (!dh)
 		goto nla_put_failure;
 	dh->minor = -1U;
@@ -4766,10 +4807,10 @@ int notify_connection_state(struct sk_buff *skb,
 	if (nla_put_drbd_cfg_context(skb, connection->resource, connection, NULL) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
-	     connection_info_to_skb(skb, connection_info, true)))
+	     connection_info_to_skb(skb, connection_info)))
 		goto nla_put_failure;
 	connection_statistics.conn_congested = test_bit(NET_CONGESTED, &connection->flags);
-	connection_statistics_to_skb(skb, &connection_statistics, !capable(CAP_SYS_ADMIN));
+	connection_statistics_to_skb(skb, &connection_statistics);
 	genlmsg_end(skb, dh);
 	if (multicast) {
 		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
@@ -4809,7 +4850,7 @@ int notify_peer_device_state(struct sk_buff *skb,
 	}
 
 	err = -EMSGSIZE;
-	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_PEER_DEVICE_STATE);
+	dh = genlmsg_put(skb, 0, seq, &drbd_nl_family, 0, DRBD_ADM_PEER_DEVICE_STATE);
 	if (!dh)
 		goto nla_put_failure;
 	dh->minor = -1U;
@@ -4817,10 +4858,10 @@ int notify_peer_device_state(struct sk_buff *skb,
 	if (nla_put_drbd_cfg_context(skb, resource, peer_device->connection, peer_device->device) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
-	     peer_device_info_to_skb(skb, peer_device_info, true)))
+	     peer_device_info_to_skb(skb, peer_device_info)))
 		goto nla_put_failure;
 	peer_device_to_statistics(&peer_device_statistics, peer_device);
-	peer_device_statistics_to_skb(skb, &peer_device_statistics, !capable(CAP_SYS_ADMIN));
+	peer_device_statistics_to_skb(skb, &peer_device_statistics);
 	genlmsg_end(skb, dh);
 	if (multicast) {
 		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
@@ -4859,7 +4900,7 @@ void notify_helper(enum drbd_notification_type type,
 		goto fail;
 
 	err = -EMSGSIZE;
-	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_HELPER);
+	dh = genlmsg_put(skb, 0, seq, &drbd_nl_family, 0, DRBD_ADM_HELPER);
 	if (!dh)
 		goto fail;
 	dh->minor = device ? device->minor : -1;
@@ -4867,7 +4908,7 @@ void notify_helper(enum drbd_notification_type type,
 	mutex_lock(&notification_mutex);
 	if (nla_put_drbd_cfg_context(skb, resource, connection, device) ||
 	    nla_put_notification_header(skb, type) ||
-	    drbd_helper_info_to_skb(skb, &helper_info, true))
+	    drbd_helper_info_to_skb(skb, &helper_info))
 		goto unlock_fail;
 	genlmsg_end(skb, dh);
 	err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
@@ -4892,7 +4933,7 @@ static int notify_initial_state_done(struct sk_buff *skb, unsigned int seq)
 	int err;
 
 	err = -EMSGSIZE;
-	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_INITIAL_STATE_DONE);
+	dh = genlmsg_put(skb, 0, seq, &drbd_nl_family, 0, DRBD_ADM_INITIAL_STATE_DONE);
 	if (!dh)
 		goto nla_put_failure;
 	dh->minor = -1U;
@@ -4987,7 +5028,7 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 		return skb->len;
 }
 
-int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
+int drbd_nl_get_initial_state_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct drbd_resource *resource;
 	LIST_HEAD(head);
@@ -5035,3 +5076,20 @@ int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	cb->args[2] = cb->nlh->nlmsg_seq;
 	return get_initial_state(skb, cb);
 }
+
+static const struct genl_multicast_group drbd_nl_mcgrps[] = {
+	[DRBD_NLGRP_EVENTS] = { .name = "events", },
+};
+
+struct genl_family drbd_nl_family __ro_after_init = {
+	.name		= "drbd",
+	.version	= DRBD_FAMILY_VERSION,
+	.hdrsize	= NLA_ALIGN(sizeof(struct drbd_genlmsghdr)),
+	.split_ops	= drbd_nl_ops,
+	.n_split_ops	= ARRAY_SIZE(drbd_nl_ops),
+	.mcgrps		= drbd_nl_mcgrps,
+	.n_mcgrps	= ARRAY_SIZE(drbd_nl_mcgrps),
+	.resv_start_op	= 42,
+	.module		= THIS_MODULE,
+	.netnsok	= true,
+};
diff --git a/drivers/block/drbd/drbd_nl_gen.c b/drivers/block/drbd/drbd_nl_gen.c
new file mode 100644
index 000000000000..fb44b948cec8
--- /dev/null
+++ b/drivers/block/drbd/drbd_nl_gen.c
@@ -0,0 +1,2606 @@
+// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include "drbd_nl_gen.h"
+
+#include <uapi/linux/drbd_genl.h>
+#include <linux/drbd.h>
+#include <linux/drbd_limits.h>
+
+/* Common nested types */
+const struct nla_policy drbd_connection_info_nl_policy[DRBD_A_CONNECTION_INFO_CONN_ROLE + 1] = {
+	[DRBD_A_CONNECTION_INFO_CONN_CONNECTION_STATE] = { .type = NLA_U32, },
+	[DRBD_A_CONNECTION_INFO_CONN_ROLE] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_connection_statistics_nl_policy[DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED + 1] = {
+	[DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_detach_parms_nl_policy[DRBD_A_DETACH_PARMS_FORCE_DETACH + 1] = {
+	[DRBD_A_DETACH_PARMS_FORCE_DETACH] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_device_info_nl_policy[DRBD_A_DEVICE_INFO_DEV_DISK_STATE + 1] = {
+	[DRBD_A_DEVICE_INFO_DEV_DISK_STATE] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_device_statistics_nl_policy[DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS + 1] = {
+	[DRBD_A_DEVICE_STATISTICS_DEV_SIZE] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_READ] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_WRITE] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_AL_WRITES] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_BM_WRITES] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_UPPER_PENDING] = { .type = NLA_U32, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_LOWER_PENDING] = { .type = NLA_U32, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_UPPER_BLOCKED] = { .type = NLA_U8, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_LOWER_BLOCKED] = { .type = NLA_U8, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_AL_SUSPENDED] = { .type = NLA_U8, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_EXPOSED_DATA_UUID] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_CURRENT_UUID] = { .type = NLA_U64, },
+	[DRBD_A_DEVICE_STATISTICS_DEV_DISK_FLAGS] = { .type = NLA_U32, },
+	[DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS] = NLA_POLICY_MAX_LEN(DRBD_NL_HISTORY_UUIDS_SIZE),
+};
+
+const struct nla_policy drbd_disconnect_parms_nl_policy[DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT + 1] = {
+	[DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_disk_conf_nl_policy[DRBD_A_DISK_CONF_DISABLE_WRITE_SAME + 1] = {
+	[DRBD_A_DISK_CONF_BACKING_DEV] = { .type = NLA_NUL_STRING, .len = 128, },
+	[DRBD_A_DISK_CONF_META_DEV] = { .type = NLA_NUL_STRING, .len = 128, },
+	[DRBD_A_DISK_CONF_META_DEV_IDX] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_DISK_SIZE] = { .type = NLA_U64, },
+	[DRBD_A_DISK_CONF_MAX_BIO_BVECS] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_ON_IO_ERROR] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_FENCING] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_RESYNC_RATE] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_RESYNC_AFTER] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_AL_EXTENTS] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_C_PLAN_AHEAD] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_C_DELAY_TARGET] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_C_FILL_TARGET] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_C_MAX_RATE] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_C_MIN_RATE] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_DISK_BARRIER] = { .type = NLA_U8, },
+	[DRBD_A_DISK_CONF_DISK_FLUSHES] = { .type = NLA_U8, },
+	[DRBD_A_DISK_CONF_DISK_DRAIN] = { .type = NLA_U8, },
+	[DRBD_A_DISK_CONF_MD_FLUSHES] = { .type = NLA_U8, },
+	[DRBD_A_DISK_CONF_DISK_TIMEOUT] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_READ_BALANCING] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_AL_UPDATES] = { .type = NLA_U8, },
+	[DRBD_A_DISK_CONF_DISCARD_ZEROES_IF_ALIGNED] = { .type = NLA_U8, },
+	[DRBD_A_DISK_CONF_RS_DISCARD_GRANULARITY] = { .type = NLA_U32, },
+	[DRBD_A_DISK_CONF_DISABLE_WRITE_SAME] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_drbd_cfg_context_nl_policy[DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR + 1] = {
+	[DRBD_A_DRBD_CFG_CONTEXT_CTX_VOLUME] = { .type = NLA_U32, },
+	[DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME] = { .type = NLA_NUL_STRING, .len = 128, },
+	[DRBD_A_DRBD_CFG_CONTEXT_CTX_MY_ADDR] = NLA_POLICY_MAX_LEN(128),
+	[DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR] = NLA_POLICY_MAX_LEN(128),
+};
+
+const struct nla_policy drbd_net_conf_nl_policy[DRBD_A_NET_CONF_SOCK_CHECK_TIMEO + 1] = {
+	[DRBD_A_NET_CONF_SHARED_SECRET] = { .type = NLA_NUL_STRING, .len = SHARED_SECRET_MAX, },
+	[DRBD_A_NET_CONF_CRAM_HMAC_ALG] = { .type = NLA_NUL_STRING, .len = SHARED_SECRET_MAX, },
+	[DRBD_A_NET_CONF_INTEGRITY_ALG] = { .type = NLA_NUL_STRING, .len = SHARED_SECRET_MAX, },
+	[DRBD_A_NET_CONF_VERIFY_ALG] = { .type = NLA_NUL_STRING, .len = SHARED_SECRET_MAX, },
+	[DRBD_A_NET_CONF_CSUMS_ALG] = { .type = NLA_NUL_STRING, .len = SHARED_SECRET_MAX, },
+	[DRBD_A_NET_CONF_WIRE_PROTOCOL] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_CONNECT_INT] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_TIMEOUT] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_PING_INT] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_PING_TIMEO] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_SNDBUF_SIZE] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_RCVBUF_SIZE] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_KO_COUNT] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_MAX_BUFFERS] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_MAX_EPOCH_SIZE] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_UNPLUG_WATERMARK] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_AFTER_SB_0P] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_AFTER_SB_1P] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_AFTER_SB_2P] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_RR_CONFLICT] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_ON_CONGESTION] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_CONG_FILL] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_CONG_EXTENTS] = { .type = NLA_U32, },
+	[DRBD_A_NET_CONF_TWO_PRIMARIES] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_DISCARD_MY_DATA] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_TCP_CORK] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_ALWAYS_ASBP] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_TENTATIVE] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_USE_RLE] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_CSUMS_AFTER_CRASH_ONLY] = { .type = NLA_U8, },
+	[DRBD_A_NET_CONF_SOCK_CHECK_TIMEO] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_new_c_uuid_parms_nl_policy[DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM + 1] = {
+	[DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_peer_device_info_nl_policy[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY + 1] = {
+	[DRBD_A_PEER_DEVICE_INFO_PEER_REPL_STATE] = { .type = NLA_U32, },
+	[DRBD_A_PEER_DEVICE_INFO_PEER_DISK_STATE] = { .type = NLA_U32, },
+	[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_USER] = { .type = NLA_U32, },
+	[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_PEER] = { .type = NLA_U32, },
+	[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_peer_device_statistics_nl_policy[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS + 1] = {
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RECEIVED] = { .type = NLA_U64, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_SENT] = { .type = NLA_U64, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_PENDING] = { .type = NLA_U32, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_UNACKED] = { .type = NLA_U32, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_OUT_OF_SYNC] = { .type = NLA_U64, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RESYNC_FAILED] = { .type = NLA_U64, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_BITMAP_UUID] = { .type = NLA_U64, },
+	[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_res_opts_nl_policy[DRBD_A_RES_OPTS_ON_NO_DATA + 1] = {
+	[DRBD_A_RES_OPTS_CPU_MASK] = { .type = NLA_NUL_STRING, .len = DRBD_CPU_MASK_SIZE, },
+	[DRBD_A_RES_OPTS_ON_NO_DATA] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_resize_parms_nl_policy[DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE + 1] = {
+	[DRBD_A_RESIZE_PARMS_RESIZE_SIZE] = { .type = NLA_U64, },
+	[DRBD_A_RESIZE_PARMS_RESIZE_FORCE] = { .type = NLA_U8, },
+	[DRBD_A_RESIZE_PARMS_NO_RESYNC] = { .type = NLA_U8, },
+	[DRBD_A_RESIZE_PARMS_AL_STRIPES] = { .type = NLA_U32, },
+	[DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_resource_info_nl_policy[DRBD_A_RESOURCE_INFO_RES_SUSP_FEN + 1] = {
+	[DRBD_A_RESOURCE_INFO_RES_ROLE] = { .type = NLA_U32, },
+	[DRBD_A_RESOURCE_INFO_RES_SUSP] = { .type = NLA_U8, },
+	[DRBD_A_RESOURCE_INFO_RES_SUSP_NOD] = { .type = NLA_U8, },
+	[DRBD_A_RESOURCE_INFO_RES_SUSP_FEN] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_resource_statistics_nl_policy[DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING + 1] = {
+	[DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING] = { .type = NLA_U32, },
+};
+
+const struct nla_policy drbd_set_role_parms_nl_policy[DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE + 1] = {
+	[DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE] = { .type = NLA_U8, },
+};
+
+const struct nla_policy drbd_start_ov_parms_nl_policy[DRBD_A_START_OV_PARMS_OV_STOP_SECTOR + 1] = {
+	[DRBD_A_START_OV_PARMS_OV_START_SECTOR] = { .type = NLA_U64, },
+	[DRBD_A_START_OV_PARMS_OV_STOP_SECTOR] = { .type = NLA_U64, },
+};
+
+/* DRBD_ADM_GET_STATUS - do */
+static const struct nla_policy drbd_get_status_do_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_GET_STATUS - dump */
+static const struct nla_policy drbd_get_status_dump_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_NEW_MINOR - do */
+static const struct nla_policy drbd_new_minor_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_DEL_MINOR - do */
+static const struct nla_policy drbd_del_minor_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_NEW_RESOURCE - do */
+static const struct nla_policy drbd_new_resource_nl_policy[DRBD_NLA_RESOURCE_OPTS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_RESOURCE_OPTS] = NLA_POLICY_NESTED(drbd_res_opts_nl_policy),
+};
+
+/* DRBD_ADM_DEL_RESOURCE - do */
+static const struct nla_policy drbd_del_resource_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_RESOURCE_OPTS - do */
+static const struct nla_policy drbd_resource_opts_nl_policy[DRBD_NLA_RESOURCE_OPTS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_RESOURCE_OPTS] = NLA_POLICY_NESTED(drbd_res_opts_nl_policy),
+};
+
+/* DRBD_ADM_CONNECT - do */
+static const struct nla_policy drbd_connect_nl_policy[DRBD_NLA_NET_CONF + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_NET_CONF] = NLA_POLICY_NESTED(drbd_net_conf_nl_policy),
+};
+
+/* DRBD_ADM_DISCONNECT - do */
+static const struct nla_policy drbd_disconnect_nl_policy[DRBD_NLA_DISCONNECT_PARMS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_DISCONNECT_PARMS] = NLA_POLICY_NESTED(drbd_disconnect_parms_nl_policy),
+};
+
+/* DRBD_ADM_ATTACH - do */
+static const struct nla_policy drbd_attach_nl_policy[DRBD_NLA_DISK_CONF + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_DISK_CONF] = NLA_POLICY_NESTED(drbd_disk_conf_nl_policy),
+};
+
+/* DRBD_ADM_RESIZE - do */
+static const struct nla_policy drbd_resize_nl_policy[DRBD_NLA_RESIZE_PARMS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_RESIZE_PARMS] = NLA_POLICY_NESTED(drbd_resize_parms_nl_policy),
+};
+
+/* DRBD_ADM_PRIMARY - do */
+static const struct nla_policy drbd_primary_nl_policy[DRBD_NLA_SET_ROLE_PARMS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_SET_ROLE_PARMS] = NLA_POLICY_NESTED(drbd_set_role_parms_nl_policy),
+};
+
+/* DRBD_ADM_SECONDARY - do */
+static const struct nla_policy drbd_secondary_nl_policy[DRBD_NLA_SET_ROLE_PARMS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_SET_ROLE_PARMS] = NLA_POLICY_NESTED(drbd_set_role_parms_nl_policy),
+};
+
+/* DRBD_ADM_NEW_C_UUID - do */
+static const struct nla_policy drbd_new_c_uuid_nl_policy[DRBD_NLA_NEW_C_UUID_PARMS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_NEW_C_UUID_PARMS] = NLA_POLICY_NESTED(drbd_new_c_uuid_parms_nl_policy),
+};
+
+/* DRBD_ADM_START_OV - do */
+static const struct nla_policy drbd_start_ov_nl_policy[DRBD_NLA_START_OV_PARMS + 1] = {
+	[DRBD_NLA_START_OV_PARMS] = NLA_POLICY_NESTED(drbd_start_ov_parms_nl_policy),
+};
+
+/* DRBD_ADM_DETACH - do */
+static const struct nla_policy drbd_detach_nl_policy[DRBD_NLA_DETACH_PARMS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_DETACH_PARMS] = NLA_POLICY_NESTED(drbd_detach_parms_nl_policy),
+};
+
+/* DRBD_ADM_INVALIDATE - do */
+static const struct nla_policy drbd_invalidate_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_INVAL_PEER - do */
+static const struct nla_policy drbd_inval_peer_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_PAUSE_SYNC - do */
+static const struct nla_policy drbd_pause_sync_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_RESUME_SYNC - do */
+static const struct nla_policy drbd_resume_sync_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_SUSPEND_IO - do */
+static const struct nla_policy drbd_suspend_io_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_RESUME_IO - do */
+static const struct nla_policy drbd_resume_io_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_OUTDATE - do */
+static const struct nla_policy drbd_outdate_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_GET_TIMEOUT_TYPE - do */
+static const struct nla_policy drbd_get_timeout_type_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_DOWN - do */
+static const struct nla_policy drbd_down_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* DRBD_ADM_CHG_DISK_OPTS - do */
+static const struct nla_policy drbd_chg_disk_opts_nl_policy[DRBD_NLA_DISK_CONF + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_DISK_CONF] = NLA_POLICY_NESTED(drbd_disk_conf_nl_policy),
+};
+
+/* DRBD_ADM_CHG_NET_OPTS - do */
+static const struct nla_policy drbd_chg_net_opts_nl_policy[DRBD_NLA_NET_CONF + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_NET_CONF] = NLA_POLICY_NESTED(drbd_net_conf_nl_policy),
+};
+
+/* DRBD_ADM_GET_RESOURCES - dump */
+static const struct nla_policy drbd_get_resources_nl_policy[DRBD_NLA_RESOURCE_STATISTICS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_RESOURCE_INFO] = NLA_POLICY_NESTED(drbd_resource_info_nl_policy),
+	[DRBD_NLA_RESOURCE_STATISTICS] = NLA_POLICY_NESTED(drbd_resource_statistics_nl_policy),
+};
+
+/* DRBD_ADM_GET_DEVICES - dump */
+static const struct nla_policy drbd_get_devices_nl_policy[DRBD_NLA_DEVICE_STATISTICS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_DEVICE_INFO] = NLA_POLICY_NESTED(drbd_device_info_nl_policy),
+	[DRBD_NLA_DEVICE_STATISTICS] = NLA_POLICY_NESTED(drbd_device_statistics_nl_policy),
+};
+
+/* DRBD_ADM_GET_CONNECTIONS - dump */
+static const struct nla_policy drbd_get_connections_nl_policy[DRBD_NLA_CONNECTION_STATISTICS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_CONNECTION_INFO] = NLA_POLICY_NESTED(drbd_connection_info_nl_policy),
+	[DRBD_NLA_CONNECTION_STATISTICS] = NLA_POLICY_NESTED(drbd_connection_statistics_nl_policy),
+};
+
+/* DRBD_ADM_GET_PEER_DEVICES - dump */
+static const struct nla_policy drbd_get_peer_devices_nl_policy[DRBD_NLA_PEER_DEVICE_STATISTICS + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+	[DRBD_NLA_PEER_DEVICE_INFO] = NLA_POLICY_NESTED(drbd_peer_device_info_nl_policy),
+	[DRBD_NLA_PEER_DEVICE_STATISTICS] = NLA_POLICY_NESTED(drbd_peer_device_statistics_nl_policy),
+};
+
+/* DRBD_ADM_GET_INITIAL_STATE - dump */
+static const struct nla_policy drbd_get_initial_state_nl_policy[DRBD_NLA_CFG_CONTEXT + 1] = {
+	[DRBD_NLA_CFG_CONTEXT] = NLA_POLICY_NESTED(drbd_drbd_cfg_context_nl_policy),
+};
+
+/* Ops table for drbd */
+const struct genl_split_ops drbd_nl_ops[32] = {
+	{
+		.cmd		= DRBD_ADM_GET_STATUS,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_get_status_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_get_status_do_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_STATUS,
+		.dumpit		= drbd_nl_get_status_dumpit,
+		.policy		= drbd_get_status_dump_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRBD_ADM_NEW_MINOR,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_new_minor_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_new_minor_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_DEL_MINOR,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_del_minor_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_del_minor_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_NEW_RESOURCE,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_new_resource_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_new_resource_nl_policy,
+		.maxattr	= DRBD_NLA_RESOURCE_OPTS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_DEL_RESOURCE,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_del_resource_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_del_resource_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_RESOURCE_OPTS,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_resource_opts_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_resource_opts_nl_policy,
+		.maxattr	= DRBD_NLA_RESOURCE_OPTS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_CONNECT,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_connect_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_connect_nl_policy,
+		.maxattr	= DRBD_NLA_NET_CONF,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_DISCONNECT,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_disconnect_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_disconnect_nl_policy,
+		.maxattr	= DRBD_NLA_DISCONNECT_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_ATTACH,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_attach_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_attach_nl_policy,
+		.maxattr	= DRBD_NLA_DISK_CONF,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_RESIZE,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_resize_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_resize_nl_policy,
+		.maxattr	= DRBD_NLA_RESIZE_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_PRIMARY,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_primary_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_primary_nl_policy,
+		.maxattr	= DRBD_NLA_SET_ROLE_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_SECONDARY,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_secondary_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_secondary_nl_policy,
+		.maxattr	= DRBD_NLA_SET_ROLE_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_NEW_C_UUID,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_new_c_uuid_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_new_c_uuid_nl_policy,
+		.maxattr	= DRBD_NLA_NEW_C_UUID_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_START_OV,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_start_ov_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_start_ov_nl_policy,
+		.maxattr	= DRBD_NLA_START_OV_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_DETACH,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_detach_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_detach_nl_policy,
+		.maxattr	= DRBD_NLA_DETACH_PARMS,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_INVALIDATE,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_invalidate_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_invalidate_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_INVAL_PEER,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_inval_peer_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_inval_peer_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_PAUSE_SYNC,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_pause_sync_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_pause_sync_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_RESUME_SYNC,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_resume_sync_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_resume_sync_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_SUSPEND_IO,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_suspend_io_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_suspend_io_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_RESUME_IO,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_resume_io_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_resume_io_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_OUTDATE,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_outdate_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_outdate_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_TIMEOUT_TYPE,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_get_timeout_type_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_get_timeout_type_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_DOWN,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_down_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_down_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_CHG_DISK_OPTS,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_chg_disk_opts_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_chg_disk_opts_nl_policy,
+		.maxattr	= DRBD_NLA_DISK_CONF,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_CHG_NET_OPTS,
+		.pre_doit	= drbd_pre_doit,
+		.doit		= drbd_nl_chg_net_opts_doit,
+		.post_doit	= drbd_post_doit,
+		.policy		= drbd_chg_net_opts_nl_policy,
+		.maxattr	= DRBD_NLA_NET_CONF,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_RESOURCES,
+		.dumpit		= drbd_nl_get_resources_dumpit,
+		.policy		= drbd_get_resources_nl_policy,
+		.maxattr	= DRBD_NLA_RESOURCE_STATISTICS,
+		.flags		= GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_DEVICES,
+		.dumpit		= drbd_nl_get_devices_dumpit,
+		.done		= drbd_adm_dump_devices_done,
+		.policy		= drbd_get_devices_nl_policy,
+		.maxattr	= DRBD_NLA_DEVICE_STATISTICS,
+		.flags		= GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_CONNECTIONS,
+		.dumpit		= drbd_nl_get_connections_dumpit,
+		.done		= drbd_adm_dump_connections_done,
+		.policy		= drbd_get_connections_nl_policy,
+		.maxattr	= DRBD_NLA_CONNECTION_STATISTICS,
+		.flags		= GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_PEER_DEVICES,
+		.dumpit		= drbd_nl_get_peer_devices_dumpit,
+		.done		= drbd_adm_dump_peer_devices_done,
+		.policy		= drbd_get_peer_devices_nl_policy,
+		.maxattr	= DRBD_NLA_PEER_DEVICE_STATISTICS,
+		.flags		= GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRBD_ADM_GET_INITIAL_STATE,
+		.dumpit		= drbd_nl_get_initial_state_dumpit,
+		.policy		= drbd_get_initial_state_nl_policy,
+		.maxattr	= DRBD_NLA_CFG_CONTEXT,
+		.flags		= GENL_CMD_CAP_DUMP,
+	},
+};
+
+static const struct genl_multicast_group drbd_nl_mcgrps[] = {
+	[DRBD_NLGRP_EVENTS] = { "events", },
+};
+
+static int __drbd_cfg_context_from_attrs(struct drbd_cfg_context *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR;
+	struct nlattr *tla = info->attrs[DRBD_NLA_CFG_CONTEXT];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_drbd_cfg_context_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_VOLUME];
+	if (nla && s)
+		s->ctx_volume = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME];
+	if (nla && s)
+		s->ctx_resource_name_len = nla_strscpy(s->ctx_resource_name, nla, 128);
+
+	nla = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_MY_ADDR];
+	if (nla && s)
+		s->ctx_my_addr_len = nla_memcpy(s->ctx_my_addr, nla, 128);
+
+	nla = ntb[DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR];
+	if (nla && s)
+		s->ctx_peer_addr_len = nla_memcpy(s->ctx_peer_addr, nla, 128);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int drbd_cfg_context_from_attrs(struct drbd_cfg_context *s,
+				struct genl_info *info)
+{
+	return __drbd_cfg_context_from_attrs(s, NULL, info);
+}
+
+int drbd_cfg_context_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __drbd_cfg_context_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __disk_conf_from_attrs(struct disk_conf *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_DISK_CONF_DISABLE_WRITE_SAME;
+	struct nlattr *tla = info->attrs[DRBD_NLA_DISK_CONF];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_DISK_CONF_DISABLE_WRITE_SAME + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_disk_conf_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_DISK_CONF_BACKING_DEV];
+	if (nla) {
+		if (s)
+			s->backing_dev_len = nla_strscpy(s->backing_dev, nla, 128);
+	} else {
+		pr_info("<< missing required attr: backing_dev\n");
+		err = -ENOMSG;
+	}
+
+	nla = ntb[DRBD_A_DISK_CONF_META_DEV];
+	if (nla) {
+		if (s)
+			s->meta_dev_len = nla_strscpy(s->meta_dev, nla, 128);
+	} else {
+		pr_info("<< missing required attr: meta_dev\n");
+		err = -ENOMSG;
+	}
+
+	nla = ntb[DRBD_A_DISK_CONF_META_DEV_IDX];
+	if (nla) {
+		if (s)
+			s->meta_dev_idx = nla_get_s32(nla);
+	} else {
+		pr_info("<< missing required attr: meta_dev_idx\n");
+		err = -ENOMSG;
+	}
+
+	nla = ntb[DRBD_A_DISK_CONF_DISK_SIZE];
+	if (nla && s)
+		s->disk_size = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_MAX_BIO_BVECS];
+	if (nla && s)
+		s->max_bio_bvecs = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_ON_IO_ERROR];
+	if (nla && s)
+		s->on_io_error = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_FENCING];
+	if (nla && s)
+		s->fencing = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_RESYNC_RATE];
+	if (nla && s)
+		s->resync_rate = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_RESYNC_AFTER];
+	if (nla && s)
+		s->resync_after = nla_get_s32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_AL_EXTENTS];
+	if (nla && s)
+		s->al_extents = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_C_PLAN_AHEAD];
+	if (nla && s)
+		s->c_plan_ahead = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_C_DELAY_TARGET];
+	if (nla && s)
+		s->c_delay_target = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_C_FILL_TARGET];
+	if (nla && s)
+		s->c_fill_target = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_C_MAX_RATE];
+	if (nla && s)
+		s->c_max_rate = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_C_MIN_RATE];
+	if (nla && s)
+		s->c_min_rate = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_DISK_BARRIER];
+	if (nla && s)
+		s->disk_barrier = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_DISK_FLUSHES];
+	if (nla && s)
+		s->disk_flushes = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_DISK_DRAIN];
+	if (nla && s)
+		s->disk_drain = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_MD_FLUSHES];
+	if (nla && s)
+		s->md_flushes = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_DISK_TIMEOUT];
+	if (nla && s)
+		s->disk_timeout = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_READ_BALANCING];
+	if (nla && s)
+		s->read_balancing = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_AL_UPDATES];
+	if (nla && s)
+		s->al_updates = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_DISCARD_ZEROES_IF_ALIGNED];
+	if (nla && s)
+		s->discard_zeroes_if_aligned = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_RS_DISCARD_GRANULARITY];
+	if (nla && s)
+		s->rs_discard_granularity = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DISK_CONF_DISABLE_WRITE_SAME];
+	if (nla && s)
+		s->disable_write_same = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int disk_conf_from_attrs(struct disk_conf *s,
+				struct genl_info *info)
+{
+	return __disk_conf_from_attrs(s, NULL, info);
+}
+
+int disk_conf_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __disk_conf_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __res_opts_from_attrs(struct res_opts *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_RES_OPTS_ON_NO_DATA;
+	struct nlattr *tla = info->attrs[DRBD_NLA_RESOURCE_OPTS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_RES_OPTS_ON_NO_DATA + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_res_opts_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_RES_OPTS_CPU_MASK];
+	if (nla && s)
+		s->cpu_mask_len = nla_strscpy(s->cpu_mask, nla, DRBD_CPU_MASK_SIZE);
+
+	nla = ntb[DRBD_A_RES_OPTS_ON_NO_DATA];
+	if (nla && s)
+		s->on_no_data = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int res_opts_from_attrs(struct res_opts *s,
+				struct genl_info *info)
+{
+	return __res_opts_from_attrs(s, NULL, info);
+}
+
+int res_opts_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __res_opts_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __net_conf_from_attrs(struct net_conf *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_NET_CONF_SOCK_CHECK_TIMEO;
+	struct nlattr *tla = info->attrs[DRBD_NLA_NET_CONF];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_NET_CONF_SOCK_CHECK_TIMEO + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_net_conf_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_NET_CONF_SHARED_SECRET];
+	if (nla && s)
+		s->shared_secret_len = nla_strscpy(s->shared_secret, nla, SHARED_SECRET_MAX);
+
+	nla = ntb[DRBD_A_NET_CONF_CRAM_HMAC_ALG];
+	if (nla && s)
+		s->cram_hmac_alg_len = nla_strscpy(s->cram_hmac_alg, nla, SHARED_SECRET_MAX);
+
+	nla = ntb[DRBD_A_NET_CONF_INTEGRITY_ALG];
+	if (nla && s)
+		s->integrity_alg_len = nla_strscpy(s->integrity_alg, nla, SHARED_SECRET_MAX);
+
+	nla = ntb[DRBD_A_NET_CONF_VERIFY_ALG];
+	if (nla && s)
+		s->verify_alg_len = nla_strscpy(s->verify_alg, nla, SHARED_SECRET_MAX);
+
+	nla = ntb[DRBD_A_NET_CONF_CSUMS_ALG];
+	if (nla && s)
+		s->csums_alg_len = nla_strscpy(s->csums_alg, nla, SHARED_SECRET_MAX);
+
+	nla = ntb[DRBD_A_NET_CONF_WIRE_PROTOCOL];
+	if (nla && s)
+		s->wire_protocol = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_CONNECT_INT];
+	if (nla && s)
+		s->connect_int = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_TIMEOUT];
+	if (nla && s)
+		s->timeout = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_PING_INT];
+	if (nla && s)
+		s->ping_int = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_PING_TIMEO];
+	if (nla && s)
+		s->ping_timeo = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_SNDBUF_SIZE];
+	if (nla && s)
+		s->sndbuf_size = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_RCVBUF_SIZE];
+	if (nla && s)
+		s->rcvbuf_size = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_KO_COUNT];
+	if (nla && s)
+		s->ko_count = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_MAX_BUFFERS];
+	if (nla && s)
+		s->max_buffers = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_MAX_EPOCH_SIZE];
+	if (nla && s)
+		s->max_epoch_size = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_UNPLUG_WATERMARK];
+	if (nla && s)
+		s->unplug_watermark = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_AFTER_SB_0P];
+	if (nla && s)
+		s->after_sb_0p = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_AFTER_SB_1P];
+	if (nla && s)
+		s->after_sb_1p = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_AFTER_SB_2P];
+	if (nla && s)
+		s->after_sb_2p = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_RR_CONFLICT];
+	if (nla && s)
+		s->rr_conflict = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_ON_CONGESTION];
+	if (nla && s)
+		s->on_congestion = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_CONG_FILL];
+	if (nla && s)
+		s->cong_fill = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_CONG_EXTENTS];
+	if (nla && s)
+		s->cong_extents = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_TWO_PRIMARIES];
+	if (nla && s)
+		s->two_primaries = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_DISCARD_MY_DATA];
+	if (nla && s)
+		s->discard_my_data = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_TCP_CORK];
+	if (nla && s)
+		s->tcp_cork = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_ALWAYS_ASBP];
+	if (nla && s)
+		s->always_asbp = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_TENTATIVE];
+	if (nla && s)
+		s->tentative = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_USE_RLE];
+	if (nla && s)
+		s->use_rle = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_CSUMS_AFTER_CRASH_ONLY];
+	if (nla && s)
+		s->csums_after_crash_only = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_NET_CONF_SOCK_CHECK_TIMEO];
+	if (nla && s)
+		s->sock_check_timeo = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int net_conf_from_attrs(struct net_conf *s,
+				struct genl_info *info)
+{
+	return __net_conf_from_attrs(s, NULL, info);
+}
+
+int net_conf_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __net_conf_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __set_role_parms_from_attrs(struct set_role_parms *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE;
+	struct nlattr *tla = info->attrs[DRBD_NLA_SET_ROLE_PARMS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_set_role_parms_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE];
+	if (nla && s)
+		s->assume_uptodate = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int set_role_parms_from_attrs(struct set_role_parms *s,
+				struct genl_info *info)
+{
+	return __set_role_parms_from_attrs(s, NULL, info);
+}
+
+int set_role_parms_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __set_role_parms_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __resize_parms_from_attrs(struct resize_parms *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE;
+	struct nlattr *tla = info->attrs[DRBD_NLA_RESIZE_PARMS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_resize_parms_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_RESIZE_PARMS_RESIZE_SIZE];
+	if (nla && s)
+		s->resize_size = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_RESIZE_PARMS_RESIZE_FORCE];
+	if (nla && s)
+		s->resize_force = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_RESIZE_PARMS_NO_RESYNC];
+	if (nla && s)
+		s->no_resync = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_RESIZE_PARMS_AL_STRIPES];
+	if (nla && s)
+		s->al_stripes = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE];
+	if (nla && s)
+		s->al_stripe_size = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int resize_parms_from_attrs(struct resize_parms *s,
+				struct genl_info *info)
+{
+	return __resize_parms_from_attrs(s, NULL, info);
+}
+
+int resize_parms_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __resize_parms_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __start_ov_parms_from_attrs(struct start_ov_parms *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_START_OV_PARMS_OV_STOP_SECTOR;
+	struct nlattr *tla = info->attrs[DRBD_NLA_START_OV_PARMS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_START_OV_PARMS_OV_STOP_SECTOR + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_start_ov_parms_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_START_OV_PARMS_OV_START_SECTOR];
+	if (nla && s)
+		s->ov_start_sector = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_START_OV_PARMS_OV_STOP_SECTOR];
+	if (nla && s)
+		s->ov_stop_sector = nla_get_u64(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int start_ov_parms_from_attrs(struct start_ov_parms *s,
+				struct genl_info *info)
+{
+	return __start_ov_parms_from_attrs(s, NULL, info);
+}
+
+int start_ov_parms_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __start_ov_parms_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __new_c_uuid_parms_from_attrs(struct new_c_uuid_parms *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM;
+	struct nlattr *tla = info->attrs[DRBD_NLA_NEW_C_UUID_PARMS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_new_c_uuid_parms_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM];
+	if (nla && s)
+		s->clear_bm = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int new_c_uuid_parms_from_attrs(struct new_c_uuid_parms *s,
+				struct genl_info *info)
+{
+	return __new_c_uuid_parms_from_attrs(s, NULL, info);
+}
+
+int new_c_uuid_parms_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __new_c_uuid_parms_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __disconnect_parms_from_attrs(struct disconnect_parms *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT;
+	struct nlattr *tla = info->attrs[DRBD_NLA_DISCONNECT_PARMS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_disconnect_parms_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT];
+	if (nla && s)
+		s->force_disconnect = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int disconnect_parms_from_attrs(struct disconnect_parms *s,
+				struct genl_info *info)
+{
+	return __disconnect_parms_from_attrs(s, NULL, info);
+}
+
+int disconnect_parms_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __disconnect_parms_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __detach_parms_from_attrs(struct detach_parms *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_DETACH_PARMS_FORCE_DETACH;
+	struct nlattr *tla = info->attrs[DRBD_NLA_DETACH_PARMS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_DETACH_PARMS_FORCE_DETACH + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_detach_parms_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_DETACH_PARMS_FORCE_DETACH];
+	if (nla && s)
+		s->force_detach = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int detach_parms_from_attrs(struct detach_parms *s,
+				struct genl_info *info)
+{
+	return __detach_parms_from_attrs(s, NULL, info);
+}
+
+int detach_parms_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __detach_parms_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __resource_info_from_attrs(struct resource_info *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_RESOURCE_INFO_RES_SUSP_FEN;
+	struct nlattr *tla = info->attrs[DRBD_NLA_RESOURCE_INFO];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_RESOURCE_INFO_RES_SUSP_FEN + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_resource_info_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_RESOURCE_INFO_RES_ROLE];
+	if (nla && s)
+		s->res_role = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_RESOURCE_INFO_RES_SUSP];
+	if (nla && s)
+		s->res_susp = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_RESOURCE_INFO_RES_SUSP_NOD];
+	if (nla && s)
+		s->res_susp_nod = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_RESOURCE_INFO_RES_SUSP_FEN];
+	if (nla && s)
+		s->res_susp_fen = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int resource_info_from_attrs(struct resource_info *s,
+				struct genl_info *info)
+{
+	return __resource_info_from_attrs(s, NULL, info);
+}
+
+int resource_info_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __resource_info_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __device_info_from_attrs(struct device_info *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_DEVICE_INFO_DEV_DISK_STATE;
+	struct nlattr *tla = info->attrs[DRBD_NLA_DEVICE_INFO];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_DEVICE_INFO_DEV_DISK_STATE + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_device_info_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_DEVICE_INFO_DEV_DISK_STATE];
+	if (nla && s)
+		s->dev_disk_state = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int device_info_from_attrs(struct device_info *s,
+				struct genl_info *info)
+{
+	return __device_info_from_attrs(s, NULL, info);
+}
+
+int device_info_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __device_info_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __connection_info_from_attrs(struct connection_info *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_CONNECTION_INFO_CONN_ROLE;
+	struct nlattr *tla = info->attrs[DRBD_NLA_CONNECTION_INFO];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_CONNECTION_INFO_CONN_ROLE + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_connection_info_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_CONNECTION_INFO_CONN_CONNECTION_STATE];
+	if (nla && s)
+		s->conn_connection_state = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_CONNECTION_INFO_CONN_ROLE];
+	if (nla && s)
+		s->conn_role = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int connection_info_from_attrs(struct connection_info *s,
+				struct genl_info *info)
+{
+	return __connection_info_from_attrs(s, NULL, info);
+}
+
+int connection_info_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __connection_info_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __peer_device_info_from_attrs(struct peer_device_info *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY;
+	struct nlattr *tla = info->attrs[DRBD_NLA_PEER_DEVICE_INFO];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_peer_device_info_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_PEER_DEVICE_INFO_PEER_REPL_STATE];
+	if (nla && s)
+		s->peer_repl_state = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_INFO_PEER_DISK_STATE];
+	if (nla && s)
+		s->peer_disk_state = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_USER];
+	if (nla && s)
+		s->peer_resync_susp_user = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_PEER];
+	if (nla && s)
+		s->peer_resync_susp_peer = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY];
+	if (nla && s)
+		s->peer_resync_susp_dependency = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int peer_device_info_from_attrs(struct peer_device_info *s,
+				struct genl_info *info)
+{
+	return __peer_device_info_from_attrs(s, NULL, info);
+}
+
+int peer_device_info_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __peer_device_info_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __resource_statistics_from_attrs(struct resource_statistics *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING;
+	struct nlattr *tla = info->attrs[DRBD_NLA_RESOURCE_STATISTICS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_resource_statistics_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING];
+	if (nla && s)
+		s->res_stat_write_ordering = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int resource_statistics_from_attrs(struct resource_statistics *s,
+				struct genl_info *info)
+{
+	return __resource_statistics_from_attrs(s, NULL, info);
+}
+
+int resource_statistics_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __resource_statistics_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __device_statistics_from_attrs(struct device_statistics *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS;
+	struct nlattr *tla = info->attrs[DRBD_NLA_DEVICE_STATISTICS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_device_statistics_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_SIZE];
+	if (nla && s)
+		s->dev_size = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_READ];
+	if (nla && s)
+		s->dev_read = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_WRITE];
+	if (nla && s)
+		s->dev_write = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_AL_WRITES];
+	if (nla && s)
+		s->dev_al_writes = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_BM_WRITES];
+	if (nla && s)
+		s->dev_bm_writes = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_UPPER_PENDING];
+	if (nla && s)
+		s->dev_upper_pending = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_LOWER_PENDING];
+	if (nla && s)
+		s->dev_lower_pending = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_UPPER_BLOCKED];
+	if (nla && s)
+		s->dev_upper_blocked = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_LOWER_BLOCKED];
+	if (nla && s)
+		s->dev_lower_blocked = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_AL_SUSPENDED];
+	if (nla && s)
+		s->dev_al_suspended = nla_get_u8(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_EXPOSED_DATA_UUID];
+	if (nla && s)
+		s->dev_exposed_data_uuid = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_CURRENT_UUID];
+	if (nla && s)
+		s->dev_current_uuid = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_DEV_DISK_FLAGS];
+	if (nla && s)
+		s->dev_disk_flags = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS];
+	if (nla && s)
+		s->history_uuids_len = nla_memcpy(s->history_uuids, nla, DRBD_NL_HISTORY_UUIDS_SIZE);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int device_statistics_from_attrs(struct device_statistics *s,
+				struct genl_info *info)
+{
+	return __device_statistics_from_attrs(s, NULL, info);
+}
+
+int device_statistics_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __device_statistics_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __connection_statistics_from_attrs(struct connection_statistics *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED;
+	struct nlattr *tla = info->attrs[DRBD_NLA_CONNECTION_STATISTICS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_connection_statistics_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED];
+	if (nla && s)
+		s->conn_congested = nla_get_u8(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int connection_statistics_from_attrs(struct connection_statistics *s,
+				struct genl_info *info)
+{
+	return __connection_statistics_from_attrs(s, NULL, info);
+}
+
+int connection_statistics_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __connection_statistics_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+static int __peer_device_statistics_from_attrs(struct peer_device_statistics *s,
+		struct nlattr ***ret_nested_attribute_table,
+		struct genl_info *info)
+{
+	const int maxtype = DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS;
+	struct nlattr *tla = info->attrs[DRBD_NLA_PEER_DEVICE_STATISTICS];
+	struct nlattr **ntb;
+	struct nlattr *nla;
+	int err = 0;
+
+	if (ret_nested_attribute_table)
+		*ret_nested_attribute_table = NULL;
+	if (!tla)
+		return -ENOMSG;
+	ntb = kcalloc(DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS + 1, sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla, drbd_peer_device_statistics_nl_policy, NULL);
+	if (err)
+		goto out;
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RECEIVED];
+	if (nla && s)
+		s->peer_dev_received = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_SENT];
+	if (nla && s)
+		s->peer_dev_sent = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_PENDING];
+	if (nla && s)
+		s->peer_dev_pending = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_UNACKED];
+	if (nla && s)
+		s->peer_dev_unacked = nla_get_u32(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_OUT_OF_SYNC];
+	if (nla && s)
+		s->peer_dev_out_of_sync = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RESYNC_FAILED];
+	if (nla && s)
+		s->peer_dev_resync_failed = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_BITMAP_UUID];
+	if (nla && s)
+		s->peer_dev_bitmap_uuid = nla_get_u64(nla);
+
+	nla = ntb[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS];
+	if (nla && s)
+		s->peer_dev_flags = nla_get_u32(nla);
+
+out:
+	if (ret_nested_attribute_table && (!err || err == -ENOMSG))
+		*ret_nested_attribute_table = ntb;
+	else
+		kfree(ntb);
+	return err;
+}
+
+int peer_device_statistics_from_attrs(struct peer_device_statistics *s,
+				struct genl_info *info)
+{
+	return __peer_device_statistics_from_attrs(s, NULL, info);
+}
+
+int peer_device_statistics_ntb_from_attrs(
+			struct nlattr ***ret_nested_attribute_table,
+			struct genl_info *info)
+{
+	return __peer_device_statistics_from_attrs(NULL, ret_nested_attribute_table, info);
+}
+
+int drbd_cfg_reply_to_skb(struct sk_buff *skb, struct drbd_cfg_reply *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_CFG_REPLY);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put(skb, DRBD_A_DRBD_CFG_REPLY_INFO_TEXT, min_t(int, 0,
+			s->info_text_len + (s->info_text_len < 0)), s->info_text))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int drbd_cfg_context_to_skb(struct sk_buff *skb, struct drbd_cfg_context *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_CFG_CONTEXT);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_VOLUME, s->ctx_volume))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME, min_t(int, 128,
+			s->ctx_resource_name_len + (s->ctx_resource_name_len < 128)), s->ctx_resource_name))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_MY_ADDR, min_t(int, 128,
+			s->ctx_my_addr_len), s->ctx_my_addr))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR, min_t(int, 128,
+			s->ctx_peer_addr_len), s->ctx_peer_addr))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int disk_conf_to_skb(struct sk_buff *skb, struct disk_conf *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_DISK_CONF);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put(skb, DRBD_A_DISK_CONF_BACKING_DEV, min_t(int, 128,
+			s->backing_dev_len + (s->backing_dev_len < 128)), s->backing_dev))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_DISK_CONF_META_DEV, min_t(int, 128,
+			s->meta_dev_len + (s->meta_dev_len < 128)), s->meta_dev))
+		goto nla_put_failure;
+	if (nla_put_s32(skb, DRBD_A_DISK_CONF_META_DEV_IDX, s->meta_dev_idx))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DISK_CONF_DISK_SIZE, s->disk_size, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_MAX_BIO_BVECS, s->max_bio_bvecs))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_ON_IO_ERROR, s->on_io_error))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_FENCING, s->fencing))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_RESYNC_RATE, s->resync_rate))
+		goto nla_put_failure;
+	if (nla_put_s32(skb, DRBD_A_DISK_CONF_RESYNC_AFTER, s->resync_after))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_AL_EXTENTS, s->al_extents))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_C_PLAN_AHEAD, s->c_plan_ahead))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_C_DELAY_TARGET, s->c_delay_target))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_C_FILL_TARGET, s->c_fill_target))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_C_MAX_RATE, s->c_max_rate))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_C_MIN_RATE, s->c_min_rate))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_DISK_BARRIER, s->disk_barrier))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_DISK_FLUSHES, s->disk_flushes))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_DISK_DRAIN, s->disk_drain))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_MD_FLUSHES, s->md_flushes))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_DISK_TIMEOUT, s->disk_timeout))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_READ_BALANCING, s->read_balancing))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_AL_UPDATES, s->al_updates))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_DISCARD_ZEROES_IF_ALIGNED, s->discard_zeroes_if_aligned))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DISK_CONF_RS_DISCARD_GRANULARITY, s->rs_discard_granularity))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DISK_CONF_DISABLE_WRITE_SAME, s->disable_write_same))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int res_opts_to_skb(struct sk_buff *skb, struct res_opts *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_RESOURCE_OPTS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put(skb, DRBD_A_RES_OPTS_CPU_MASK, min_t(int, DRBD_CPU_MASK_SIZE,
+			s->cpu_mask_len + (s->cpu_mask_len < DRBD_CPU_MASK_SIZE)), s->cpu_mask))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_RES_OPTS_ON_NO_DATA, s->on_no_data))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int net_conf_to_skb(struct sk_buff *skb, struct net_conf *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_NET_CONF);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put(skb, DRBD_A_NET_CONF_SHARED_SECRET, min_t(int, SHARED_SECRET_MAX,
+			s->shared_secret_len + (s->shared_secret_len < SHARED_SECRET_MAX)), s->shared_secret))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_NET_CONF_CRAM_HMAC_ALG, min_t(int, SHARED_SECRET_MAX,
+			s->cram_hmac_alg_len + (s->cram_hmac_alg_len < SHARED_SECRET_MAX)), s->cram_hmac_alg))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_NET_CONF_INTEGRITY_ALG, min_t(int, SHARED_SECRET_MAX,
+			s->integrity_alg_len + (s->integrity_alg_len < SHARED_SECRET_MAX)), s->integrity_alg))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_NET_CONF_VERIFY_ALG, min_t(int, SHARED_SECRET_MAX,
+			s->verify_alg_len + (s->verify_alg_len < SHARED_SECRET_MAX)), s->verify_alg))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_NET_CONF_CSUMS_ALG, min_t(int, SHARED_SECRET_MAX,
+			s->csums_alg_len + (s->csums_alg_len < SHARED_SECRET_MAX)), s->csums_alg))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_WIRE_PROTOCOL, s->wire_protocol))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_CONNECT_INT, s->connect_int))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_TIMEOUT, s->timeout))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_PING_INT, s->ping_int))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_PING_TIMEO, s->ping_timeo))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_SNDBUF_SIZE, s->sndbuf_size))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_RCVBUF_SIZE, s->rcvbuf_size))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_KO_COUNT, s->ko_count))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_MAX_BUFFERS, s->max_buffers))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_MAX_EPOCH_SIZE, s->max_epoch_size))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_UNPLUG_WATERMARK, s->unplug_watermark))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_AFTER_SB_0P, s->after_sb_0p))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_AFTER_SB_1P, s->after_sb_1p))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_AFTER_SB_2P, s->after_sb_2p))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_RR_CONFLICT, s->rr_conflict))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_ON_CONGESTION, s->on_congestion))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_CONG_FILL, s->cong_fill))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_CONG_EXTENTS, s->cong_extents))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_TWO_PRIMARIES, s->two_primaries))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_DISCARD_MY_DATA, s->discard_my_data))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_TCP_CORK, s->tcp_cork))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_ALWAYS_ASBP, s->always_asbp))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_TENTATIVE, s->tentative))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_USE_RLE, s->use_rle))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_NET_CONF_CSUMS_AFTER_CRASH_ONLY, s->csums_after_crash_only))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_NET_CONF_SOCK_CHECK_TIMEO, s->sock_check_timeo))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int set_role_parms_to_skb(struct sk_buff *skb, struct set_role_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_SET_ROLE_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u8(skb, DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE, s->assume_uptodate))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int resize_parms_to_skb(struct sk_buff *skb, struct resize_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_RESIZE_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u64_64bit(skb, DRBD_A_RESIZE_PARMS_RESIZE_SIZE, s->resize_size, 0))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_RESIZE_PARMS_RESIZE_FORCE, s->resize_force))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_RESIZE_PARMS_NO_RESYNC, s->no_resync))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_RESIZE_PARMS_AL_STRIPES, s->al_stripes))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE, s->al_stripe_size))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int state_info_to_skb(struct sk_buff *skb, struct state_info *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_STATE_INFO);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_SIB_REASON, s->sib_reason))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_CURRENT_STATE, s->current_state))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_CAPACITY, s->capacity, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_ED_UUID, s->ed_uuid, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_PREV_STATE, s->prev_state))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_NEW_STATE, s->new_state))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_STATE_INFO_UUIDS, min_t(int, DRBD_NL_UUIDS_SIZE,
+			s->uuids_len), s->uuids))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_DISK_FLAGS, s->disk_flags))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_TOTAL, s->bits_total, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_OOS, s->bits_oos, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_RS_TOTAL, s->bits_rs_total, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BITS_RS_FAILED, s->bits_rs_failed, 0))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_STATE_INFO_HELPER, min_t(int, 32,
+			s->helper_len + (s->helper_len < 32)), s->helper))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_HELPER_EXIT_CODE, s->helper_exit_code))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_SEND_CNT, s->send_cnt, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_RECV_CNT, s->recv_cnt, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_READ_CNT, s->read_cnt, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_WRIT_CNT, s->writ_cnt, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_AL_WRIT_CNT, s->al_writ_cnt, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_STATE_INFO_BM_WRIT_CNT, s->bm_writ_cnt, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_AP_BIO_CNT, s->ap_bio_cnt))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_AP_PENDING_CNT, s->ap_pending_cnt))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_STATE_INFO_RS_PENDING_CNT, s->rs_pending_cnt))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int start_ov_parms_to_skb(struct sk_buff *skb, struct start_ov_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_START_OV_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u64_64bit(skb, DRBD_A_START_OV_PARMS_OV_START_SECTOR, s->ov_start_sector, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_START_OV_PARMS_OV_STOP_SECTOR, s->ov_stop_sector, 0))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int new_c_uuid_parms_to_skb(struct sk_buff *skb, struct new_c_uuid_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_NEW_C_UUID_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u8(skb, DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM, s->clear_bm))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int timeout_parms_to_skb(struct sk_buff *skb, struct timeout_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_TIMEOUT_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_TIMEOUT_PARMS_TIMEOUT_TYPE, s->timeout_type))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int disconnect_parms_to_skb(struct sk_buff *skb, struct disconnect_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_DISCONNECT_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u8(skb, DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT, s->force_disconnect))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int detach_parms_to_skb(struct sk_buff *skb, struct detach_parms *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_DETACH_PARMS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u8(skb, DRBD_A_DETACH_PARMS_FORCE_DETACH, s->force_detach))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int resource_info_to_skb(struct sk_buff *skb, struct resource_info *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_RESOURCE_INFO);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_RESOURCE_INFO_RES_ROLE, s->res_role))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_RESOURCE_INFO_RES_SUSP, s->res_susp))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_RESOURCE_INFO_RES_SUSP_NOD, s->res_susp_nod))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_RESOURCE_INFO_RES_SUSP_FEN, s->res_susp_fen))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int device_info_to_skb(struct sk_buff *skb, struct device_info *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_DEVICE_INFO);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_DEVICE_INFO_DEV_DISK_STATE, s->dev_disk_state))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int connection_info_to_skb(struct sk_buff *skb, struct connection_info *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_CONNECTION_INFO);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_CONNECTION_INFO_CONN_CONNECTION_STATE, s->conn_connection_state))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_CONNECTION_INFO_CONN_ROLE, s->conn_role))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int peer_device_info_to_skb(struct sk_buff *skb, struct peer_device_info *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_PEER_DEVICE_INFO);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_INFO_PEER_REPL_STATE, s->peer_repl_state))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_INFO_PEER_DISK_STATE, s->peer_disk_state))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_USER, s->peer_resync_susp_user))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_PEER, s->peer_resync_susp_peer))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY, s->peer_resync_susp_dependency))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int resource_statistics_to_skb(struct sk_buff *skb, struct resource_statistics *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_RESOURCE_STATISTICS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING, s->res_stat_write_ordering))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int device_statistics_to_skb(struct sk_buff *skb, struct device_statistics *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_DEVICE_STATISTICS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_SIZE, s->dev_size, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_READ, s->dev_read, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_WRITE, s->dev_write, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_AL_WRITES, s->dev_al_writes, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_BM_WRITES, s->dev_bm_writes, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DEVICE_STATISTICS_DEV_UPPER_PENDING, s->dev_upper_pending))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DEVICE_STATISTICS_DEV_LOWER_PENDING, s->dev_lower_pending))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DEVICE_STATISTICS_DEV_UPPER_BLOCKED, s->dev_upper_blocked))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DEVICE_STATISTICS_DEV_LOWER_BLOCKED, s->dev_lower_blocked))
+		goto nla_put_failure;
+	if (nla_put_u8(skb, DRBD_A_DEVICE_STATISTICS_DEV_AL_SUSPENDED, s->dev_al_suspended))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_EXPOSED_DATA_UUID, s->dev_exposed_data_uuid, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_DEVICE_STATISTICS_DEV_CURRENT_UUID, s->dev_current_uuid, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DEVICE_STATISTICS_DEV_DISK_FLAGS, s->dev_disk_flags))
+		goto nla_put_failure;
+	if (nla_put(skb, DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS, min_t(int, DRBD_NL_HISTORY_UUIDS_SIZE,
+			s->history_uuids_len), s->history_uuids))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int connection_statistics_to_skb(struct sk_buff *skb, struct connection_statistics *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_CONNECTION_STATISTICS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u8(skb, DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED, s->conn_congested))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int peer_device_statistics_to_skb(struct sk_buff *skb, struct peer_device_statistics *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_PEER_DEVICE_STATISTICS);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u64_64bit(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RECEIVED, s->peer_dev_received, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_SENT, s->peer_dev_sent, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_PENDING, s->peer_dev_pending))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_UNACKED, s->peer_dev_unacked))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_OUT_OF_SYNC, s->peer_dev_out_of_sync, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RESYNC_FAILED, s->peer_dev_resync_failed, 0))
+		goto nla_put_failure;
+	if (nla_put_u64_64bit(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_BITMAP_UUID, s->peer_dev_bitmap_uuid, 0))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS, s->peer_dev_flags))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int drbd_notification_header_to_skb(struct sk_buff *skb, struct drbd_notification_header *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_NOTIFICATION_HEADER);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put_u32(skb, DRBD_A_DRBD_NOTIFICATION_HEADER_NH_TYPE, s->nh_type))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+int drbd_helper_info_to_skb(struct sk_buff *skb, struct drbd_helper_info *s)
+{
+	struct nlattr *tla = nla_nest_start(skb, DRBD_NLA_HELPER);
+
+	if (!tla)
+		goto nla_put_failure;
+
+	if (nla_put(skb, DRBD_A_DRBD_HELPER_INFO_HELPER_NAME, min_t(int, 32,
+			s->helper_name_len + (s->helper_name_len < 32)), s->helper_name))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, DRBD_A_DRBD_HELPER_INFO_HELPER_STATUS, s->helper_status))
+		goto nla_put_failure;
+
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+void set_disk_conf_defaults(struct disk_conf *x)
+{
+	x->on_io_error = DRBD_ON_IO_ERROR_DEF;
+	x->fencing = DRBD_FENCING_DEF;
+	x->resync_rate = DRBD_RESYNC_RATE_DEF;
+	x->resync_after = DRBD_MINOR_NUMBER_DEF;
+	x->al_extents = DRBD_AL_EXTENTS_DEF;
+	x->c_plan_ahead = DRBD_C_PLAN_AHEAD_DEF;
+	x->c_delay_target = DRBD_C_DELAY_TARGET_DEF;
+	x->c_fill_target = DRBD_C_FILL_TARGET_DEF;
+	x->c_max_rate = DRBD_C_MAX_RATE_DEF;
+	x->c_min_rate = DRBD_C_MIN_RATE_DEF;
+	x->disk_barrier = DRBD_DISK_BARRIER_DEF;
+	x->disk_flushes = DRBD_DISK_FLUSHES_DEF;
+	x->disk_drain = DRBD_DISK_DRAIN_DEF;
+	x->md_flushes = DRBD_MD_FLUSHES_DEF;
+	x->disk_timeout = DRBD_DISK_TIMEOUT_DEF;
+	x->read_balancing = DRBD_READ_BALANCING_DEF;
+	x->al_updates = DRBD_AL_UPDATES_DEF;
+	x->discard_zeroes_if_aligned = DRBD_DISCARD_ZEROES_IF_ALIGNED_DEF;
+	x->rs_discard_granularity = DRBD_RS_DISCARD_GRANULARITY_DEF;
+	x->disable_write_same = DRBD_DISABLE_WRITE_SAME_DEF;
+}
+
+void set_res_opts_defaults(struct res_opts *x)
+{
+	memset(x->cpu_mask, 0, sizeof(x->cpu_mask));
+	x->cpu_mask_len = 0;
+	x->on_no_data = DRBD_ON_NO_DATA_DEF;
+}
+
+void set_net_conf_defaults(struct net_conf *x)
+{
+	memset(x->shared_secret, 0, sizeof(x->shared_secret));
+	x->shared_secret_len = 0;
+	memset(x->cram_hmac_alg, 0, sizeof(x->cram_hmac_alg));
+	x->cram_hmac_alg_len = 0;
+	memset(x->integrity_alg, 0, sizeof(x->integrity_alg));
+	x->integrity_alg_len = 0;
+	memset(x->verify_alg, 0, sizeof(x->verify_alg));
+	x->verify_alg_len = 0;
+	memset(x->csums_alg, 0, sizeof(x->csums_alg));
+	x->csums_alg_len = 0;
+	x->wire_protocol = DRBD_PROTOCOL_DEF;
+	x->connect_int = DRBD_CONNECT_INT_DEF;
+	x->timeout = DRBD_TIMEOUT_DEF;
+	x->ping_int = DRBD_PING_INT_DEF;
+	x->ping_timeo = DRBD_PING_TIMEO_DEF;
+	x->sndbuf_size = DRBD_SNDBUF_SIZE_DEF;
+	x->rcvbuf_size = DRBD_RCVBUF_SIZE_DEF;
+	x->ko_count = DRBD_KO_COUNT_DEF;
+	x->max_buffers = DRBD_MAX_BUFFERS_DEF;
+	x->max_epoch_size = DRBD_MAX_EPOCH_SIZE_DEF;
+	x->unplug_watermark = DRBD_UNPLUG_WATERMARK_DEF;
+	x->after_sb_0p = DRBD_AFTER_SB_0P_DEF;
+	x->after_sb_1p = DRBD_AFTER_SB_1P_DEF;
+	x->after_sb_2p = DRBD_AFTER_SB_2P_DEF;
+	x->rr_conflict = DRBD_RR_CONFLICT_DEF;
+	x->on_congestion = DRBD_ON_CONGESTION_DEF;
+	x->cong_fill = DRBD_CONG_FILL_DEF;
+	x->cong_extents = DRBD_CONG_EXTENTS_DEF;
+	x->two_primaries = DRBD_ALLOW_TWO_PRIMARIES_DEF;
+	x->tcp_cork = DRBD_TCP_CORK_DEF;
+	x->always_asbp = DRBD_ALWAYS_ASBP_DEF;
+	x->use_rle = DRBD_USE_RLE_DEF;
+	x->csums_after_crash_only = DRBD_CSUMS_AFTER_CRASH_ONLY_DEF;
+	x->sock_check_timeo = DRBD_SOCKET_CHECK_TIMEO_DEF;
+}
+
+void set_resize_parms_defaults(struct resize_parms *x)
+{
+	x->al_stripes = DRBD_AL_STRIPES_DEF;
+	x->al_stripe_size = DRBD_AL_STRIPE_SIZE_DEF;
+}
diff --git a/drivers/block/drbd/drbd_nl_gen.h b/drivers/block/drbd/drbd_nl_gen.h
new file mode 100644
index 000000000000..f2140dd1ac4e
--- /dev/null
+++ b/drivers/block/drbd/drbd_nl_gen.h
@@ -0,0 +1,395 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+
+#ifndef _LINUX_DRBD_GEN_H
+#define _LINUX_DRBD_GEN_H
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include <uapi/linux/drbd_genl.h>
+#include <linux/drbd.h>
+#include <linux/drbd_limits.h>
+
+/* Common nested types */
+extern const struct nla_policy drbd_connection_info_nl_policy[DRBD_A_CONNECTION_INFO_CONN_ROLE + 1];
+extern const struct nla_policy drbd_connection_statistics_nl_policy[DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED + 1];
+extern const struct nla_policy drbd_detach_parms_nl_policy[DRBD_A_DETACH_PARMS_FORCE_DETACH + 1];
+extern const struct nla_policy drbd_device_info_nl_policy[DRBD_A_DEVICE_INFO_DEV_DISK_STATE + 1];
+extern const struct nla_policy drbd_device_statistics_nl_policy[DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS + 1];
+extern const struct nla_policy drbd_disconnect_parms_nl_policy[DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT + 1];
+extern const struct nla_policy drbd_disk_conf_nl_policy[DRBD_A_DISK_CONF_DISABLE_WRITE_SAME + 1];
+extern const struct nla_policy drbd_drbd_cfg_context_nl_policy[DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR + 1];
+extern const struct nla_policy drbd_net_conf_nl_policy[DRBD_A_NET_CONF_SOCK_CHECK_TIMEO + 1];
+extern const struct nla_policy drbd_new_c_uuid_parms_nl_policy[DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM + 1];
+extern const struct nla_policy drbd_peer_device_info_nl_policy[DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY + 1];
+extern const struct nla_policy drbd_peer_device_statistics_nl_policy[DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS + 1];
+extern const struct nla_policy drbd_res_opts_nl_policy[DRBD_A_RES_OPTS_ON_NO_DATA + 1];
+extern const struct nla_policy drbd_resize_parms_nl_policy[DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE + 1];
+extern const struct nla_policy drbd_resource_info_nl_policy[DRBD_A_RESOURCE_INFO_RES_SUSP_FEN + 1];
+extern const struct nla_policy drbd_resource_statistics_nl_policy[DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING + 1];
+extern const struct nla_policy drbd_set_role_parms_nl_policy[DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE + 1];
+extern const struct nla_policy drbd_start_ov_parms_nl_policy[DRBD_A_START_OV_PARMS_OV_STOP_SECTOR + 1];
+
+/* Ops table for drbd */
+extern const struct genl_split_ops drbd_nl_ops[32];
+
+int drbd_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
+		  struct genl_info *info);
+void
+drbd_post_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
+	       struct genl_info *info);
+int drbd_adm_dump_devices_done(struct netlink_callback *cb);
+int drbd_adm_dump_connections_done(struct netlink_callback *cb);
+int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb);
+
+int drbd_nl_get_status_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_get_status_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
+int drbd_nl_new_minor_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_del_minor_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_new_resource_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_del_resource_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_resource_opts_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_connect_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_disconnect_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_attach_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_resize_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_primary_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_secondary_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_new_c_uuid_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_start_ov_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_detach_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_invalidate_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_inval_peer_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_pause_sync_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_resume_sync_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_suspend_io_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_resume_io_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_outdate_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_get_timeout_type_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_down_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_chg_disk_opts_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_chg_net_opts_doit(struct sk_buff *skb, struct genl_info *info);
+int drbd_nl_get_resources_dumpit(struct sk_buff *skb,
+				 struct netlink_callback *cb);
+int drbd_nl_get_devices_dumpit(struct sk_buff *skb,
+			       struct netlink_callback *cb);
+int drbd_nl_get_connections_dumpit(struct sk_buff *skb,
+				   struct netlink_callback *cb);
+int drbd_nl_get_peer_devices_dumpit(struct sk_buff *skb,
+				    struct netlink_callback *cb);
+int drbd_nl_get_initial_state_dumpit(struct sk_buff *skb,
+				     struct netlink_callback *cb);
+
+enum {
+	DRBD_NLGRP_EVENTS,
+};
+
+struct drbd_cfg_reply {
+	char info_text[0];
+	__u32 info_text_len;
+};
+
+struct drbd_cfg_context {
+	__u32 ctx_volume;
+	char ctx_resource_name[128];
+	__u32 ctx_resource_name_len;
+	char ctx_my_addr[128];
+	__u32 ctx_my_addr_len;
+	char ctx_peer_addr[128];
+	__u32 ctx_peer_addr_len;
+};
+
+struct disk_conf {
+	char backing_dev[128];
+	__u32 backing_dev_len;
+	char meta_dev[128];
+	__u32 meta_dev_len;
+	__s32 meta_dev_idx;
+	__u64 disk_size;
+	__u32 max_bio_bvecs;
+	__u32 on_io_error;
+	__u32 fencing;
+	__u32 resync_rate;
+	__s32 resync_after;
+	__u32 al_extents;
+	__u32 c_plan_ahead;
+	__u32 c_delay_target;
+	__u32 c_fill_target;
+	__u32 c_max_rate;
+	__u32 c_min_rate;
+	unsigned char disk_barrier;
+	unsigned char disk_flushes;
+	unsigned char disk_drain;
+	unsigned char md_flushes;
+	__u32 disk_timeout;
+	__u32 read_balancing;
+	unsigned char al_updates;
+	unsigned char discard_zeroes_if_aligned;
+	__u32 rs_discard_granularity;
+	unsigned char disable_write_same;
+};
+
+struct res_opts {
+	char cpu_mask[DRBD_CPU_MASK_SIZE];
+	__u32 cpu_mask_len;
+	__u32 on_no_data;
+};
+
+struct net_conf {
+	char shared_secret[SHARED_SECRET_MAX];
+	__u32 shared_secret_len;
+	char cram_hmac_alg[SHARED_SECRET_MAX];
+	__u32 cram_hmac_alg_len;
+	char integrity_alg[SHARED_SECRET_MAX];
+	__u32 integrity_alg_len;
+	char verify_alg[SHARED_SECRET_MAX];
+	__u32 verify_alg_len;
+	char csums_alg[SHARED_SECRET_MAX];
+	__u32 csums_alg_len;
+	__u32 wire_protocol;
+	__u32 connect_int;
+	__u32 timeout;
+	__u32 ping_int;
+	__u32 ping_timeo;
+	__u32 sndbuf_size;
+	__u32 rcvbuf_size;
+	__u32 ko_count;
+	__u32 max_buffers;
+	__u32 max_epoch_size;
+	__u32 unplug_watermark;
+	__u32 after_sb_0p;
+	__u32 after_sb_1p;
+	__u32 after_sb_2p;
+	__u32 rr_conflict;
+	__u32 on_congestion;
+	__u32 cong_fill;
+	__u32 cong_extents;
+	unsigned char two_primaries;
+	unsigned char discard_my_data;
+	unsigned char tcp_cork;
+	unsigned char always_asbp;
+	unsigned char tentative;
+	unsigned char use_rle;
+	unsigned char csums_after_crash_only;
+	__u32 sock_check_timeo;
+};
+
+struct set_role_parms {
+	unsigned char assume_uptodate;
+};
+
+struct resize_parms {
+	__u64 resize_size;
+	unsigned char resize_force;
+	unsigned char no_resync;
+	__u32 al_stripes;
+	__u32 al_stripe_size;
+};
+
+struct state_info {
+	__u32 sib_reason;
+	__u32 current_state;
+	__u64 capacity;
+	__u64 ed_uuid;
+	__u32 prev_state;
+	__u32 new_state;
+	char uuids[DRBD_NL_UUIDS_SIZE];
+	__u32 uuids_len;
+	__u32 disk_flags;
+	__u64 bits_total;
+	__u64 bits_oos;
+	__u64 bits_rs_total;
+	__u64 bits_rs_failed;
+	char helper[32];
+	__u32 helper_len;
+	__u32 helper_exit_code;
+	__u64 send_cnt;
+	__u64 recv_cnt;
+	__u64 read_cnt;
+	__u64 writ_cnt;
+	__u64 al_writ_cnt;
+	__u64 bm_writ_cnt;
+	__u32 ap_bio_cnt;
+	__u32 ap_pending_cnt;
+	__u32 rs_pending_cnt;
+};
+
+struct start_ov_parms {
+	__u64 ov_start_sector;
+	__u64 ov_stop_sector;
+};
+
+struct new_c_uuid_parms {
+	unsigned char clear_bm;
+};
+
+struct timeout_parms {
+	__u32 timeout_type;
+};
+
+struct disconnect_parms {
+	unsigned char force_disconnect;
+};
+
+struct detach_parms {
+	unsigned char force_detach;
+};
+
+struct resource_info {
+	__u32 res_role;
+	unsigned char res_susp;
+	unsigned char res_susp_nod;
+	unsigned char res_susp_fen;
+};
+
+struct device_info {
+	__u32 dev_disk_state;
+};
+
+struct connection_info {
+	__u32 conn_connection_state;
+	__u32 conn_role;
+};
+
+struct peer_device_info {
+	__u32 peer_repl_state;
+	__u32 peer_disk_state;
+	__u32 peer_resync_susp_user;
+	__u32 peer_resync_susp_peer;
+	__u32 peer_resync_susp_dependency;
+};
+
+struct resource_statistics {
+	__u32 res_stat_write_ordering;
+};
+
+struct device_statistics {
+	__u64 dev_size;
+	__u64 dev_read;
+	__u64 dev_write;
+	__u64 dev_al_writes;
+	__u64 dev_bm_writes;
+	__u32 dev_upper_pending;
+	__u32 dev_lower_pending;
+	unsigned char dev_upper_blocked;
+	unsigned char dev_lower_blocked;
+	unsigned char dev_al_suspended;
+	__u64 dev_exposed_data_uuid;
+	__u64 dev_current_uuid;
+	__u32 dev_disk_flags;
+	char history_uuids[DRBD_NL_HISTORY_UUIDS_SIZE];
+	__u32 history_uuids_len;
+};
+
+struct connection_statistics {
+	unsigned char conn_congested;
+};
+
+struct peer_device_statistics {
+	__u64 peer_dev_received;
+	__u64 peer_dev_sent;
+	__u32 peer_dev_pending;
+	__u32 peer_dev_unacked;
+	__u64 peer_dev_out_of_sync;
+	__u64 peer_dev_resync_failed;
+	__u64 peer_dev_bitmap_uuid;
+	__u32 peer_dev_flags;
+};
+
+struct drbd_notification_header {
+	__u32 nh_type;
+};
+
+struct drbd_helper_info {
+	char helper_name[32];
+	__u32 helper_name_len;
+	__u32 helper_status;
+};
+
+int drbd_cfg_reply_to_skb(struct sk_buff *skb, struct drbd_cfg_reply *s);
+
+int drbd_cfg_context_from_attrs(struct drbd_cfg_context *s, struct genl_info *info);
+int drbd_cfg_context_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int drbd_cfg_context_to_skb(struct sk_buff *skb, struct drbd_cfg_context *s);
+
+int disk_conf_from_attrs(struct disk_conf *s, struct genl_info *info);
+int disk_conf_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int disk_conf_to_skb(struct sk_buff *skb, struct disk_conf *s);
+void set_disk_conf_defaults(struct disk_conf *x);
+
+int res_opts_from_attrs(struct res_opts *s, struct genl_info *info);
+int res_opts_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int res_opts_to_skb(struct sk_buff *skb, struct res_opts *s);
+void set_res_opts_defaults(struct res_opts *x);
+
+int net_conf_from_attrs(struct net_conf *s, struct genl_info *info);
+int net_conf_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int net_conf_to_skb(struct sk_buff *skb, struct net_conf *s);
+void set_net_conf_defaults(struct net_conf *x);
+
+int set_role_parms_from_attrs(struct set_role_parms *s, struct genl_info *info);
+int set_role_parms_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int set_role_parms_to_skb(struct sk_buff *skb, struct set_role_parms *s);
+
+int resize_parms_from_attrs(struct resize_parms *s, struct genl_info *info);
+int resize_parms_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int resize_parms_to_skb(struct sk_buff *skb, struct resize_parms *s);
+void set_resize_parms_defaults(struct resize_parms *x);
+
+int state_info_to_skb(struct sk_buff *skb, struct state_info *s);
+
+int start_ov_parms_from_attrs(struct start_ov_parms *s, struct genl_info *info);
+int start_ov_parms_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int start_ov_parms_to_skb(struct sk_buff *skb, struct start_ov_parms *s);
+
+int new_c_uuid_parms_from_attrs(struct new_c_uuid_parms *s, struct genl_info *info);
+int new_c_uuid_parms_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int new_c_uuid_parms_to_skb(struct sk_buff *skb, struct new_c_uuid_parms *s);
+
+int timeout_parms_to_skb(struct sk_buff *skb, struct timeout_parms *s);
+
+int disconnect_parms_from_attrs(struct disconnect_parms *s, struct genl_info *info);
+int disconnect_parms_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int disconnect_parms_to_skb(struct sk_buff *skb, struct disconnect_parms *s);
+
+int detach_parms_from_attrs(struct detach_parms *s, struct genl_info *info);
+int detach_parms_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int detach_parms_to_skb(struct sk_buff *skb, struct detach_parms *s);
+
+int resource_info_from_attrs(struct resource_info *s, struct genl_info *info);
+int resource_info_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int resource_info_to_skb(struct sk_buff *skb, struct resource_info *s);
+
+int device_info_from_attrs(struct device_info *s, struct genl_info *info);
+int device_info_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int device_info_to_skb(struct sk_buff *skb, struct device_info *s);
+
+int connection_info_from_attrs(struct connection_info *s, struct genl_info *info);
+int connection_info_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int connection_info_to_skb(struct sk_buff *skb, struct connection_info *s);
+
+int peer_device_info_from_attrs(struct peer_device_info *s, struct genl_info *info);
+int peer_device_info_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int peer_device_info_to_skb(struct sk_buff *skb, struct peer_device_info *s);
+
+int resource_statistics_from_attrs(struct resource_statistics *s, struct genl_info *info);
+int resource_statistics_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int resource_statistics_to_skb(struct sk_buff *skb, struct resource_statistics *s);
+
+int device_statistics_from_attrs(struct device_statistics *s, struct genl_info *info);
+int device_statistics_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int device_statistics_to_skb(struct sk_buff *skb, struct device_statistics *s);
+
+int connection_statistics_from_attrs(struct connection_statistics *s, struct genl_info *info);
+int connection_statistics_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int connection_statistics_to_skb(struct sk_buff *skb, struct connection_statistics *s);
+
+int peer_device_statistics_from_attrs(struct peer_device_statistics *s, struct genl_info *info);
+int peer_device_statistics_ntb_from_attrs(struct nlattr ***ret_nested_attribute_table, struct genl_info *info);
+int peer_device_statistics_to_skb(struct sk_buff *skb, struct peer_device_statistics *s);
+
+int drbd_notification_header_to_skb(struct sk_buff *skb, struct drbd_notification_header *s);
+
+int drbd_helper_info_to_skb(struct sk_buff *skb, struct drbd_helper_info *s);
+
+#endif /* _LINUX_DRBD_GEN_H */
diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index 1d0feafceadc..6d0c12c10260 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -228,7 +228,7 @@ int drbd_seq_show(struct seq_file *seq, void *v)
 	};
 
 	seq_printf(seq, "version: " REL_VERSION " (api:%d/proto:%d-%d)\n%s\n",
-		   GENL_MAGIC_VERSION, PRO_VERSION_MIN, PRO_VERSION_MAX, drbd_buildtag());
+		   DRBD_FAMILY_VERSION, PRO_VERSION_MIN, PRO_VERSION_MAX, drbd_buildtag());
 
 	/*
 	  cs .. connection state
diff --git a/include/linux/drbd_genl.h b/include/linux/drbd_genl.h
deleted file mode 100644
index f53c534aba0c..000000000000
--- a/include/linux/drbd_genl.h
+++ /dev/null
@@ -1,536 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * General overview:
- * full generic netlink message:
- * |nlmsghdr|genlmsghdr|<payload>
- *
- * payload:
- * |optional fixed size family header|<sequence of netlink attributes>
- *
- * sequence of netlink attributes:
- * I chose to have all "top level" attributes NLA_NESTED,
- * corresponding to some real struct.
- * So we have a sequence of |tla, len|<nested nla sequence>
- *
- * nested nla sequence:
- * may be empty, or contain a sequence of netlink attributes
- * representing the struct fields.
- *
- * The tag number of any field (regardless of containing struct)
- * will be available as T_ ## field_name,
- * so you cannot have the same field name in two differnt structs.
- *
- * The tag numbers themselves are per struct, though,
- * so should always begin at 1 (not 0, that is the special "NLA_UNSPEC" type,
- * which we won't use here).
- * The tag numbers are used as index in the respective nla_policy array.
- *
- * GENL_struct(tag_name, tag_number, struct name, struct fields) - struct and policy
- *	genl_magic_struct.h
- *		generates the struct declaration,
- *		generates an entry in the tla enum,
- *	genl_magic_func.h
- *		generates an entry in the static tla policy
- *		with .type = NLA_NESTED
- *		generates the static <struct_name>_nl_policy definition,
- *		and static conversion functions
- *
- *	genl_magic_func.h
- *
- * GENL_mc_group(group)
- *	genl_magic_struct.h
- *		does nothing
- *	genl_magic_func.h
- *		defines and registers the mcast group,
- *		and provides a send helper
- *
- * GENL_notification(op_name, op_num, mcast_group, tla list)
- *	These are notifications to userspace.
- *
- *	genl_magic_struct.h
- *		generates an entry in the genl_ops enum,
- *	genl_magic_func.h
- *		does nothing
- *
- *	mcast group: the name of the mcast group this notification should be
- *	expected on
- *	tla list: the list of expected top level attributes,
- *	for documentation and sanity checking.
- *
- * GENL_op(op_name, op_num, flags and handler, tla list) - "genl operations"
- *	These are requests from userspace.
- *
- *	_op and _notification share the same "number space",
- *	op_nr will be assigned to "genlmsghdr->cmd"
- *
- *	genl_magic_struct.h
- *		generates an entry in the genl_ops enum,
- *	genl_magic_func.h
- *		generates an entry in the static genl_ops array,
- *		and static register/unregister functions to
- *		genl_register_family().
- *
- *	flags and handler:
- *		GENL_op_init( .doit = x, .dumpit = y, .flags = something)
- *		GENL_doit(x) => .dumpit = NULL, .flags = GENL_ADMIN_PERM
- *	tla list: the list of expected top level attributes,
- *	for documentation and sanity checking.
- */
-
-/*
- * STRUCTS
- */
-
-/* this is sent kernel -> userland on various error conditions, and contains
- * informational textual info, which is supposedly human readable.
- * The computer relevant return code is in the drbd_genlmsghdr.
- */
-GENL_struct(DRBD_NLA_CFG_REPLY, 1, drbd_cfg_reply,
-		/* "arbitrary" size strings, nla_policy.len = 0 */
-	__str_field(1, 0,	info_text, 0)
-)
-
-/* Configuration requests typically need a context to operate on.
- * Possible keys are device minor (fits in the drbd_genlmsghdr),
- * the replication link (aka connection) name,
- * and/or the replication group (aka resource) name,
- * and the volume id within the resource. */
-GENL_struct(DRBD_NLA_CFG_CONTEXT, 2, drbd_cfg_context,
-	__u32_field(1, 0,	ctx_volume)
-	__str_field(2, 0,	ctx_resource_name, 128)
-	__bin_field(3, 0,	ctx_my_addr, 128)
-	__bin_field(4, 0,	ctx_peer_addr, 128)
-)
-
-GENL_struct(DRBD_NLA_DISK_CONF, 3, disk_conf,
-	__str_field(1, DRBD_F_REQUIRED | DRBD_F_INVARIANT,	backing_dev,	128)
-	__str_field(2, DRBD_F_REQUIRED | DRBD_F_INVARIANT,	meta_dev,	128)
-	__s32_field(3, DRBD_F_REQUIRED | DRBD_F_INVARIANT,	meta_dev_idx)
-
-	/* use the resize command to try and change the disk_size */
-	__u64_field(4, DRBD_F_INVARIANT,	disk_size)
-	/* we could change the max_bio_bvecs,
-	 * but it won't propagate through the stack */
-	__u32_field(5, DRBD_F_INVARIANT,	max_bio_bvecs)
-
-	__u32_field_def(6, 0,	on_io_error, DRBD_ON_IO_ERROR_DEF)
-	__u32_field_def(7, 0,	fencing, DRBD_FENCING_DEF)
-
-	__u32_field_def(8,	0,	resync_rate, DRBD_RESYNC_RATE_DEF)
-	__s32_field_def(9,	0,	resync_after, DRBD_MINOR_NUMBER_DEF)
-	__u32_field_def(10,	0,	al_extents, DRBD_AL_EXTENTS_DEF)
-	__u32_field_def(11,	0,	c_plan_ahead, DRBD_C_PLAN_AHEAD_DEF)
-	__u32_field_def(12,	0,	c_delay_target, DRBD_C_DELAY_TARGET_DEF)
-	__u32_field_def(13,	0,	c_fill_target, DRBD_C_FILL_TARGET_DEF)
-	__u32_field_def(14,	0,	c_max_rate, DRBD_C_MAX_RATE_DEF)
-	__u32_field_def(15,	0,	c_min_rate, DRBD_C_MIN_RATE_DEF)
-	__u32_field_def(20,     0, disk_timeout, DRBD_DISK_TIMEOUT_DEF)
-	__u32_field_def(21,     0 /* OPTIONAL */,       read_balancing, DRBD_READ_BALANCING_DEF)
-	__u32_field_def(25,     0 /* OPTIONAL */,       rs_discard_granularity, DRBD_RS_DISCARD_GRANULARITY_DEF)
-
-	__flg_field_def(16, 0,	disk_barrier, DRBD_DISK_BARRIER_DEF)
-	__flg_field_def(17, 0,	disk_flushes, DRBD_DISK_FLUSHES_DEF)
-	__flg_field_def(18, 0,	disk_drain, DRBD_DISK_DRAIN_DEF)
-	__flg_field_def(19, 0,	md_flushes, DRBD_MD_FLUSHES_DEF)
-	__flg_field_def(23,     0 /* OPTIONAL */,	al_updates, DRBD_AL_UPDATES_DEF)
-	__flg_field_def(24,     0 /* OPTIONAL */,	discard_zeroes_if_aligned, DRBD_DISCARD_ZEROES_IF_ALIGNED_DEF)
-	__flg_field_def(26,     0 /* OPTIONAL */,	disable_write_same, DRBD_DISABLE_WRITE_SAME_DEF)
-)
-
-GENL_struct(DRBD_NLA_RESOURCE_OPTS, 4, res_opts,
-	__str_field_def(1,	0,	cpu_mask,       DRBD_CPU_MASK_SIZE)
-	__u32_field_def(2,	0,	on_no_data, DRBD_ON_NO_DATA_DEF)
-)
-
-GENL_struct(DRBD_NLA_NET_CONF, 5, net_conf,
-	__str_field_def(1,	DRBD_F_SENSITIVE,
-						shared_secret,	SHARED_SECRET_MAX)
-	__str_field_def(2,	0,	cram_hmac_alg,	SHARED_SECRET_MAX)
-	__str_field_def(3,	0,	integrity_alg,	SHARED_SECRET_MAX)
-	__str_field_def(4,	0,	verify_alg,     SHARED_SECRET_MAX)
-	__str_field_def(5,	0,	csums_alg,	SHARED_SECRET_MAX)
-	__u32_field_def(6,	0,	wire_protocol, DRBD_PROTOCOL_DEF)
-	__u32_field_def(7,	0,	connect_int, DRBD_CONNECT_INT_DEF)
-	__u32_field_def(8,	0,	timeout, DRBD_TIMEOUT_DEF)
-	__u32_field_def(9,	0,	ping_int, DRBD_PING_INT_DEF)
-	__u32_field_def(10,	0,	ping_timeo, DRBD_PING_TIMEO_DEF)
-	__u32_field_def(11,	0,	sndbuf_size, DRBD_SNDBUF_SIZE_DEF)
-	__u32_field_def(12,	0,	rcvbuf_size, DRBD_RCVBUF_SIZE_DEF)
-	__u32_field_def(13,	0,	ko_count, DRBD_KO_COUNT_DEF)
-	__u32_field_def(14,	0,	max_buffers, DRBD_MAX_BUFFERS_DEF)
-	__u32_field_def(15,	0,	max_epoch_size, DRBD_MAX_EPOCH_SIZE_DEF)
-	__u32_field_def(16,	0,	unplug_watermark, DRBD_UNPLUG_WATERMARK_DEF)
-	__u32_field_def(17,	0,	after_sb_0p, DRBD_AFTER_SB_0P_DEF)
-	__u32_field_def(18,	0,	after_sb_1p, DRBD_AFTER_SB_1P_DEF)
-	__u32_field_def(19,	0,	after_sb_2p, DRBD_AFTER_SB_2P_DEF)
-	__u32_field_def(20,	0,	rr_conflict, DRBD_RR_CONFLICT_DEF)
-	__u32_field_def(21,	0,	on_congestion, DRBD_ON_CONGESTION_DEF)
-	__u32_field_def(22,	0,	cong_fill, DRBD_CONG_FILL_DEF)
-	__u32_field_def(23,	0,	cong_extents, DRBD_CONG_EXTENTS_DEF)
-	__flg_field_def(24, 0,	two_primaries, DRBD_ALLOW_TWO_PRIMARIES_DEF)
-	__flg_field(25, DRBD_F_INVARIANT,	discard_my_data)
-	__flg_field_def(26, 0,	tcp_cork, DRBD_TCP_CORK_DEF)
-	__flg_field_def(27, 0,	always_asbp, DRBD_ALWAYS_ASBP_DEF)
-	__flg_field(28, DRBD_F_INVARIANT,	tentative)
-	__flg_field_def(29,	0,	use_rle, DRBD_USE_RLE_DEF)
-	/* 9: __u32_field_def(30,	0,	fencing_policy, DRBD_FENCING_DEF) */
-	/* 9: __str_field_def(31,     0, name, SHARED_SECRET_MAX) */
-	/* 9: __u32_field(32,         DRBD_F_REQUIRED | DRBD_F_INVARIANT,     peer_node_id) */
-	__flg_field_def(33, 0 /* OPTIONAL */,	csums_after_crash_only, DRBD_CSUMS_AFTER_CRASH_ONLY_DEF)
-	__u32_field_def(34, 0 /* OPTIONAL */, sock_check_timeo, DRBD_SOCKET_CHECK_TIMEO_DEF)
-)
-
-GENL_struct(DRBD_NLA_SET_ROLE_PARMS, 6, set_role_parms,
-	__flg_field(1, 0,	assume_uptodate)
-)
-
-GENL_struct(DRBD_NLA_RESIZE_PARMS, 7, resize_parms,
-	__u64_field(1, 0,	resize_size)
-	__flg_field(2, 0,	resize_force)
-	__flg_field(3, 0,	no_resync)
-	__u32_field_def(4, 0 /* OPTIONAL */, al_stripes, DRBD_AL_STRIPES_DEF)
-	__u32_field_def(5, 0 /* OPTIONAL */, al_stripe_size, DRBD_AL_STRIPE_SIZE_DEF)
-)
-
-GENL_struct(DRBD_NLA_STATE_INFO, 8, state_info,
-	/* the reason of the broadcast,
-	 * if this is an event triggered broadcast. */
-	__u32_field(1, 0,	sib_reason)
-	__u32_field(2, DRBD_F_REQUIRED,	current_state)
-	__u64_field(3, 0,	capacity)
-	__u64_field(4, 0,	ed_uuid)
-
-	/* These are for broadcast from after state change work.
-	 * prev_state and new_state are from the moment the state change took
-	 * place, new_state is not neccessarily the same as current_state,
-	 * there may have been more state changes since.  Which will be
-	 * broadcasted soon, in their respective after state change work.  */
-	__u32_field(5, 0,	prev_state)
-	__u32_field(6, 0,	new_state)
-
-	/* if we have a local disk: */
-	__bin_field(7, 0,	uuids, (UI_SIZE*sizeof(__u64)))
-	__u32_field(8, 0,	disk_flags)
-	__u64_field(9, 0,	bits_total)
-	__u64_field(10, 0,	bits_oos)
-	/* and in case resync or online verify is active */
-	__u64_field(11, 0,	bits_rs_total)
-	__u64_field(12, 0,	bits_rs_failed)
-
-	/* for pre and post notifications of helper execution */
-	__str_field(13, 0,	helper, 32)
-	__u32_field(14, 0,	helper_exit_code)
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
-GENL_struct(DRBD_NLA_START_OV_PARMS, 9, start_ov_parms,
-	__u64_field(1, 0,	ov_start_sector)
-	__u64_field(2, 0,	ov_stop_sector)
-)
-
-GENL_struct(DRBD_NLA_NEW_C_UUID_PARMS, 10, new_c_uuid_parms,
-	__flg_field(1, 0, clear_bm)
-)
-
-GENL_struct(DRBD_NLA_TIMEOUT_PARMS, 11, timeout_parms,
-	__u32_field(1,	DRBD_F_REQUIRED,	timeout_type)
-)
-
-GENL_struct(DRBD_NLA_DISCONNECT_PARMS, 12, disconnect_parms,
-	__flg_field(1, 0,	force_disconnect)
-)
-
-GENL_struct(DRBD_NLA_DETACH_PARMS, 13, detach_parms,
-	__flg_field(1, 0,	force_detach)
-)
-
-GENL_struct(DRBD_NLA_RESOURCE_INFO, 15, resource_info,
-	__u32_field(1, 0, res_role)
-	__flg_field(2, 0, res_susp)
-	__flg_field(3, 0, res_susp_nod)
-	__flg_field(4, 0, res_susp_fen)
-	/* __flg_field(5, 0, res_weak) */
-)
-
-GENL_struct(DRBD_NLA_DEVICE_INFO, 16, device_info,
-	__u32_field(1, 0, dev_disk_state)
-)
-
-GENL_struct(DRBD_NLA_CONNECTION_INFO, 17, connection_info,
-	__u32_field(1, 0, conn_connection_state)
-	__u32_field(2, 0, conn_role)
-)
-
-GENL_struct(DRBD_NLA_PEER_DEVICE_INFO, 18, peer_device_info,
-	__u32_field(1, 0, peer_repl_state)
-	__u32_field(2, 0, peer_disk_state)
-	__u32_field(3, 0, peer_resync_susp_user)
-	__u32_field(4, 0, peer_resync_susp_peer)
-	__u32_field(5, 0, peer_resync_susp_dependency)
-)
-
-GENL_struct(DRBD_NLA_RESOURCE_STATISTICS, 19, resource_statistics,
-	__u32_field(1, 0, res_stat_write_ordering)
-)
-
-GENL_struct(DRBD_NLA_DEVICE_STATISTICS, 20, device_statistics,
-	__u64_field(1, 0, dev_size)  /* (sectors) */
-	__u64_field(2, 0, dev_read)  /* (sectors) */
-	__u64_field(3, 0, dev_write)  /* (sectors) */
-	__u64_field(4, 0, dev_al_writes)  /* activity log writes (count) */
-	__u64_field(5, 0, dev_bm_writes)  /*  bitmap writes  (count) */
-	__u32_field(6, 0, dev_upper_pending)  /* application requests in progress */
-	__u32_field(7, 0, dev_lower_pending)  /* backing device requests in progress */
-	__flg_field(8, 0, dev_upper_blocked)
-	__flg_field(9, 0, dev_lower_blocked)
-	__flg_field(10, 0, dev_al_suspended)  /* activity log suspended */
-	__u64_field(11, 0, dev_exposed_data_uuid)
-	__u64_field(12, 0, dev_current_uuid)
-	__u32_field(13, 0, dev_disk_flags)
-	__bin_field(14, 0, history_uuids, HISTORY_UUIDS * sizeof(__u64))
-)
-
-GENL_struct(DRBD_NLA_CONNECTION_STATISTICS, 21, connection_statistics,
-	__flg_field(1, 0, conn_congested)
-)
-
-GENL_struct(DRBD_NLA_PEER_DEVICE_STATISTICS, 22, peer_device_statistics,
-	__u64_field(1, 0, peer_dev_received)  /* sectors */
-	__u64_field(2, 0, peer_dev_sent)  /* sectors */
-	__u32_field(3, 0, peer_dev_pending)  /* number of requests */
-	__u32_field(4, 0, peer_dev_unacked)  /* number of requests */
-	__u64_field(5, 0, peer_dev_out_of_sync)  /* sectors */
-	__u64_field(6, 0, peer_dev_resync_failed)  /* sectors */
-	__u64_field(7, 0, peer_dev_bitmap_uuid)
-	__u32_field(9, 0, peer_dev_flags)
-)
-
-GENL_struct(DRBD_NLA_NOTIFICATION_HEADER, 23, drbd_notification_header,
-	__u32_field(1, 0, nh_type)
-)
-
-GENL_struct(DRBD_NLA_HELPER, 24, drbd_helper_info,
-	__str_field(1, 0, helper_name, 32)
-	__u32_field(2, 0, helper_status)
-)
-
-/*
- * Notifications and commands (genlmsghdr->cmd)
- */
-GENL_mc_group(events)
-
-	/* kernel -> userspace announcement of changes */
-GENL_notification(
-	DRBD_EVENT, 1, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_STATE_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NET_CONF, 0)
-	GENL_tla_expected(DRBD_NLA_DISK_CONF, 0)
-	GENL_tla_expected(DRBD_NLA_SYNCER_CONF, 0)
-)
-
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
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
-)
-
-	/* add DRBD minor devices as volumes to resources */
-GENL_op(DRBD_ADM_NEW_MINOR, 5, GENL_doit(drbd_adm_new_minor),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_DEL_MINOR, 6, GENL_doit(drbd_adm_del_minor),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-
-	/* add or delete resources */
-GENL_op(DRBD_ADM_NEW_RESOURCE, 7, GENL_doit(drbd_adm_new_resource),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_DEL_RESOURCE, 8, GENL_doit(drbd_adm_del_resource),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-
-GENL_op(DRBD_ADM_RESOURCE_OPTS, 9,
-	GENL_doit(drbd_adm_resource_opts),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_RESOURCE_OPTS, 0)
-)
-
-GENL_op(
-	DRBD_ADM_CONNECT, 10,
-	GENL_doit(drbd_adm_connect),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NET_CONF, DRBD_F_REQUIRED)
-)
-
-GENL_op(
-	DRBD_ADM_CHG_NET_OPTS, 29,
-	GENL_doit(drbd_adm_net_opts),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NET_CONF, DRBD_F_REQUIRED)
-)
-
-GENL_op(DRBD_ADM_DISCONNECT, 11, GENL_doit(drbd_adm_disconnect),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-
-GENL_op(DRBD_ADM_ATTACH, 12,
-	GENL_doit(drbd_adm_attach),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_DISK_CONF, DRBD_F_REQUIRED)
-)
-
-GENL_op(DRBD_ADM_CHG_DISK_OPTS, 28,
-	GENL_doit(drbd_adm_disk_opts),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_DISK_OPTS, DRBD_F_REQUIRED)
-)
-
-GENL_op(
-	DRBD_ADM_RESIZE, 13,
-	GENL_doit(drbd_adm_resize),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_RESIZE_PARMS, 0)
-)
-
-GENL_op(
-	DRBD_ADM_PRIMARY, 14,
-	GENL_doit(drbd_adm_set_role),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_SET_ROLE_PARMS, DRBD_F_REQUIRED)
-)
-
-GENL_op(
-	DRBD_ADM_SECONDARY, 15,
-	GENL_doit(drbd_adm_set_role),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_SET_ROLE_PARMS, DRBD_F_REQUIRED)
-)
-
-GENL_op(
-	DRBD_ADM_NEW_C_UUID, 16,
-	GENL_doit(drbd_adm_new_c_uuid),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NEW_C_UUID_PARMS, 0)
-)
-
-GENL_op(
-	DRBD_ADM_START_OV, 17,
-	GENL_doit(drbd_adm_start_ov),
-	GENL_tla_expected(DRBD_NLA_START_OV_PARMS, 0)
-)
-
-GENL_op(DRBD_ADM_DETACH,	18, GENL_doit(drbd_adm_detach),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_DETACH_PARMS, 0))
-
-GENL_op(DRBD_ADM_INVALIDATE,	19, GENL_doit(drbd_adm_invalidate),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_INVAL_PEER,	20, GENL_doit(drbd_adm_invalidate_peer),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_PAUSE_SYNC,	21, GENL_doit(drbd_adm_pause_sync),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_RESUME_SYNC,	22, GENL_doit(drbd_adm_resume_sync),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_SUSPEND_IO,	23, GENL_doit(drbd_adm_suspend_io),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_RESUME_IO,	24, GENL_doit(drbd_adm_resume_io),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_OUTDATE,	25, GENL_doit(drbd_adm_outdate),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_GET_TIMEOUT_TYPE, 26, GENL_doit(drbd_adm_get_timeout_type),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-GENL_op(DRBD_ADM_DOWN,		27, GENL_doit(drbd_adm_down),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
-
-GENL_op(DRBD_ADM_GET_RESOURCES, 30,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_resources,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
-	 GENL_tla_expected(DRBD_NLA_RESOURCE_INFO, 0)
-	 GENL_tla_expected(DRBD_NLA_RESOURCE_STATISTICS, 0))
-
-GENL_op(DRBD_ADM_GET_DEVICES, 31,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_devices,
-		 .done = drbd_adm_dump_devices_done,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
-	 GENL_tla_expected(DRBD_NLA_DEVICE_INFO, 0)
-	 GENL_tla_expected(DRBD_NLA_DEVICE_STATISTICS, 0))
-
-GENL_op(DRBD_ADM_GET_CONNECTIONS, 32,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_connections,
-		 .done = drbd_adm_dump_connections_done,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
-	 GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, 0)
-	 GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, 0))
-
-GENL_op(DRBD_ADM_GET_PEER_DEVICES, 33,
-	 GENL_op_init(
-		 .dumpit = drbd_adm_dump_peer_devices,
-		 .done = drbd_adm_dump_peer_devices_done,
-	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
-	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_INFO, 0)
-	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_STATISTICS, 0))
-
-GENL_notification(
-	DRBD_RESOURCE_STATE, 34, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_RESOURCE_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_RESOURCE_STATISTICS, DRBD_F_REQUIRED))
-
-GENL_notification(
-	DRBD_DEVICE_STATE, 35, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_DEVICE_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_DEVICE_STATISTICS, DRBD_F_REQUIRED))
-
-GENL_notification(
-	DRBD_CONNECTION_STATE, 36, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, DRBD_F_REQUIRED))
-
-GENL_notification(
-	DRBD_PEER_DEVICE_STATE, 37, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_PEER_DEVICE_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_PEER_DEVICE_STATISTICS, DRBD_F_REQUIRED))
-
-GENL_op(
-	DRBD_ADM_GET_INITIAL_STATE, 38,
-	GENL_op_init(
-	        .dumpit = drbd_adm_get_initial_state,
-	),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0))
-
-GENL_notification(
-	DRBD_HELPER, 40, events,
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_HELPER, DRBD_F_REQUIRED))
-
-GENL_notification(
-	DRBD_INITIAL_STATE_DONE, 41, events,
-	GENL_tla_expected(DRBD_NLA_NOTIFICATION_HEADER, DRBD_F_REQUIRED))
diff --git a/include/linux/drbd_genl_api.h b/include/linux/drbd_genl_api.h
deleted file mode 100644
index 19d263924852..000000000000
--- a/include/linux/drbd_genl_api.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef DRBD_GENL_STRUCT_H
-#define DRBD_GENL_STRUCT_H
-
-/* hack around predefined gcc/cpp "linux=1",
- * we cannot possibly include <1/drbd_genl.h> */
-#undef linux
-
-#include <linux/drbd.h>
-#define GENL_MAGIC_VERSION	1
-#define GENL_MAGIC_FAMILY	drbd
-#define GENL_MAGIC_FAMILY_HDRSZ	sizeof(struct drbd_genlmsghdr)
-#define GENL_MAGIC_INCLUDE_FILE <linux/drbd_genl.h>
-#include <linux/genl_magic_struct.h>
-
-#endif
diff --git a/include/linux/genl_magic_func.h b/include/linux/genl_magic_func.h
deleted file mode 100644
index a7d36c9ea924..000000000000
--- a/include/linux/genl_magic_func.h
+++ /dev/null
@@ -1,413 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef GENL_MAGIC_FUNC_H
-#define GENL_MAGIC_FUNC_H
-
-#include <linux/args.h>
-#include <linux/build_bug.h>
-#include <linux/genl_magic_struct.h>
-
-/*
- * Magic: declare tla policy						{{{1
- * Magic: declare nested policies
- *									{{{2
- */
-#undef GENL_mc_group
-#define GENL_mc_group(group)
-
-#undef GENL_notification
-#define GENL_notification(op_name, op_num, mcast_group, tla_list)
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, tla_list)
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-	[tag_name] = { .type = NLA_NESTED },
-
-static struct nla_policy CONCATENATE(GENL_MAGIC_FAMILY, _tla_nl_policy)[] = {
-#include GENL_MAGIC_INCLUDE_FILE
-};
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-static struct nla_policy s_name ## _nl_policy[] __read_mostly =		\
-{ s_fields };
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, _type, __get,	\
-		 __put, __is_signed)					\
-	[attr_nr] = { .type = nla_type },
-
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, _type, maxlen,	\
-		__get, __put, __is_signed)				\
-	[attr_nr] = { .type = nla_type,					\
-		      .len = maxlen - (nla_type == NLA_NUL_STRING) },
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-#ifndef __KERNEL__
-#ifndef pr_info
-#define pr_info(args...)	fprintf(stderr, args);
-#endif
-#endif
-
-#ifdef GENL_MAGIC_DEBUG
-static void dprint_field(const char *dir, int nla_type,
-		const char *name, void *valp)
-{
-	__u64 val = valp ? *(__u32 *)valp : 1;
-	switch (nla_type) {
-	case NLA_U8:  val = (__u8)val;
-	case NLA_U16: val = (__u16)val;
-	case NLA_U32: val = (__u32)val;
-		pr_info("%s attr %s: %d 0x%08x\n", dir,
-			name, (int)val, (unsigned)val);
-		break;
-	case NLA_U64:
-		val = *(__u64*)valp;
-		pr_info("%s attr %s: %lld 0x%08llx\n", dir,
-			name, (long long)val, (unsigned long long)val);
-		break;
-	case NLA_FLAG:
-		if (val)
-			pr_info("%s attr %s: set\n", dir, name);
-		break;
-	}
-}
-
-static void dprint_array(const char *dir, int nla_type,
-		const char *name, const char *val, unsigned len)
-{
-	switch (nla_type) {
-	case NLA_NUL_STRING:
-		if (len && val[len-1] == '\0')
-			len--;
-		pr_info("%s attr %s: [len:%u] '%s'\n", dir, name, len, val);
-		break;
-	default:
-		/* we can always show 4 byte,
-		 * thats what nlattr are aligned to. */
-		pr_info("%s attr %s: [len:%u] %02x%02x%02x%02x ...\n",
-			dir, name, len, val[0], val[1], val[2], val[3]);
-	}
-}
-
-#define DPRINT_TLA(a, op, b) pr_info("%s %s %s\n", a, op, b);
-
-/* Name is a member field name of the struct s.
- * If s is NULL (only parsing, no copy requested in *_from_attrs()),
- * nla is supposed to point to the attribute containing the information
- * corresponding to that struct member. */
-#define DPRINT_FIELD(dir, nla_type, name, s, nla)			\
-	do {								\
-		if (s)							\
-			dprint_field(dir, nla_type, #name, &s->name);	\
-		else if (nla)						\
-			dprint_field(dir, nla_type, #name,		\
-				(nla_type == NLA_FLAG) ? NULL		\
-						: nla_data(nla));	\
-	} while (0)
-
-#define	DPRINT_ARRAY(dir, nla_type, name, s, nla)			\
-	do {								\
-		if (s)							\
-			dprint_array(dir, nla_type, #name,		\
-					s->name, s->name ## _len);	\
-		else if (nla)						\
-			dprint_array(dir, nla_type, #name,		\
-					nla_data(nla), nla_len(nla));	\
-	} while (0)
-#else
-#define DPRINT_TLA(a, op, b) do {} while (0)
-#define DPRINT_FIELD(dir, nla_type, name, s, nla) do {} while (0)
-#define	DPRINT_ARRAY(dir, nla_type, name, s, nla) do {} while (0)
-#endif
-
-/*
- * Magic: provide conversion functions					{{{1
- * populate struct from attribute table:
- *									{{{2
- */
-
-/* processing of generic netlink messages is serialized.
- * use one static buffer for parsing of nested attributes */
-static struct nlattr *nested_attr_tb[128];
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-/* *_from_attrs functions are static, but potentially unused */		\
-static int __ ## s_name ## _from_attrs(struct s_name *s,		\
-		struct genl_info *info, bool exclude_invariants)	\
-{									\
-	const int maxtype = ARRAY_SIZE(s_name ## _nl_policy)-1;		\
-	struct nlattr *tla = info->attrs[tag_number];			\
-	struct nlattr **ntb = nested_attr_tb;				\
-	struct nlattr *nla;						\
-	int err;							\
-	BUILD_BUG_ON(ARRAY_SIZE(s_name ## _nl_policy) > ARRAY_SIZE(nested_attr_tb));	\
-	if (!tla)							\
-		return -ENOMSG;						\
-	DPRINT_TLA(#s_name, "<=-", #tag_name);				\
-	err = nla_parse_nested_deprecated(ntb, maxtype, tla,			\
-					  s_name ## _nl_policy, NULL);	\
-	if (err)							\
-		return err;						\
-									\
-	s_fields							\
-	return 0;							\
-}					__attribute__((unused))		\
-static int s_name ## _from_attrs(struct s_name *s,			\
-						struct genl_info *info)	\
-{									\
-	return __ ## s_name ## _from_attrs(s, info, false);		\
-}					__attribute__((unused))		\
-static int s_name ## _from_attrs_for_change(struct s_name *s,		\
-						struct genl_info *info)	\
-{									\
-	return __ ## s_name ## _from_attrs(s, info, true);		\
-}					__attribute__((unused))		\
-
-#define __assign(attr_nr, attr_flag, name, nla_type, type, assignment...)	\
-		nla = ntb[attr_nr];						\
-		if (nla) {						\
-			if (exclude_invariants && !!((attr_flag) & DRBD_F_INVARIANT)) {		\
-				pr_info("<< must not change invariant attr: %s\n", #name);	\
-				return -EEXIST;				\
-			}						\
-			assignment;					\
-		} else if (exclude_invariants && !!((attr_flag) & DRBD_F_INVARIANT)) {		\
-			/* attribute missing from payload, */		\
-			/* which was expected */			\
-		} else if ((attr_flag) & DRBD_F_REQUIRED) {		\
-			pr_info("<< missing attr: %s\n", #name);	\
-			return -ENOMSG;					\
-		}
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type, __get, __put,	\
-		__is_signed)						\
-	__assign(attr_nr, attr_flag, name, nla_type, type,		\
-			if (s)						\
-				s->name = __get(nla);			\
-			DPRINT_FIELD("<<", nla_type, name, s, nla))
-
-/* validate_nla() already checked nla_len <= maxlen appropriately. */
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type, maxlen,	\
-		__get, __put, __is_signed)				\
-	__assign(attr_nr, attr_flag, name, nla_type, type,		\
-			if (s)						\
-				s->name ## _len =			\
-					__get(s->name, nla, maxlen);	\
-			DPRINT_ARRAY("<<", nla_type, name, s, nla))
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)
-
-/*
- * Magic: define op number to op name mapping				{{{1
- *									{{{2
- */
-static const char *CONCATENATE(GENL_MAGIC_FAMILY, _genl_cmd_to_str)(__u8 cmd)
-{
-	switch (cmd) {
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, tla_list)		\
-	case op_num: return #op_name;
-#include GENL_MAGIC_INCLUDE_FILE
-	default:
-		     return "unknown";
-	}
-}
-
-#ifdef __KERNEL__
-#include <linux/stringify.h>
-/*
- * Magic: define genl_ops						{{{1
- *									{{{2
- */
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, tla_list)		\
-{								\
-	handler							\
-	.cmd = op_name,						\
-},
-
-#define ZZZ_genl_ops		CONCATENATE(GENL_MAGIC_FAMILY, _genl_ops)
-static struct genl_ops ZZZ_genl_ops[] __read_mostly = {
-#include GENL_MAGIC_INCLUDE_FILE
-};
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, tla_list)
-
-/*
- * Define the genl_family, multicast groups,				{{{1
- * and provide register/unregister functions.
- *									{{{2
- */
-#define ZZZ_genl_family		CONCATENATE(GENL_MAGIC_FAMILY, _genl_family)
-static struct genl_family ZZZ_genl_family;
-/*
- * Magic: define multicast groups
- * Magic: define multicast group registration helper
- */
-#define ZZZ_genl_mcgrps		CONCATENATE(GENL_MAGIC_FAMILY, _genl_mcgrps)
-static const struct genl_multicast_group ZZZ_genl_mcgrps[] = {
-#undef GENL_mc_group
-#define GENL_mc_group(group) { .name = #group, },
-#include GENL_MAGIC_INCLUDE_FILE
-};
-
-enum CONCATENATE(GENL_MAGIC_FAMILY, group_ids) {
-#undef GENL_mc_group
-#define GENL_mc_group(group) CONCATENATE(GENL_MAGIC_FAMILY, _group_ ## group),
-#include GENL_MAGIC_INCLUDE_FILE
-};
-
-#undef GENL_mc_group
-#define GENL_mc_group(group)						\
-static int CONCATENATE(GENL_MAGIC_FAMILY, _genl_multicast_ ## group)(	\
-	struct sk_buff *skb, gfp_t flags)				\
-{									\
-	unsigned int group_id =						\
-		CONCATENATE(GENL_MAGIC_FAMILY, _group_ ## group);		\
-	return genlmsg_multicast(&ZZZ_genl_family, skb, 0,		\
-				 group_id, flags);			\
-}
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-#undef GENL_mc_group
-#define GENL_mc_group(group)
-
-static struct genl_family ZZZ_genl_family __ro_after_init = {
-	.name = __stringify(GENL_MAGIC_FAMILY),
-	.version = GENL_MAGIC_VERSION,
-#ifdef GENL_MAGIC_FAMILY_HDRSZ
-	.hdrsize = NLA_ALIGN(GENL_MAGIC_FAMILY_HDRSZ),
-#endif
-	.maxattr = ARRAY_SIZE(CONCATENATE(GENL_MAGIC_FAMILY, _tla_nl_policy))-1,
-	.policy	= CONCATENATE(GENL_MAGIC_FAMILY, _tla_nl_policy),
-#ifdef GENL_MAGIC_FAMILY_PRE_DOIT
-	.pre_doit = GENL_MAGIC_FAMILY_PRE_DOIT,
-	.post_doit = GENL_MAGIC_FAMILY_POST_DOIT,
-#endif
-	.ops = ZZZ_genl_ops,
-	.n_ops = ARRAY_SIZE(ZZZ_genl_ops),
-	.mcgrps = ZZZ_genl_mcgrps,
-	.resv_start_op = 42, /* drbd is currently the only user */
-	.n_mcgrps = ARRAY_SIZE(ZZZ_genl_mcgrps),
-	.module = THIS_MODULE,
-};
-
-int CONCATENATE(GENL_MAGIC_FAMILY, _genl_register)(void)
-{
-	return genl_register_family(&ZZZ_genl_family);
-}
-
-void CONCATENATE(GENL_MAGIC_FAMILY, _genl_unregister)(void)
-{
-	genl_unregister_family(&ZZZ_genl_family);
-}
-
-/*
- * Magic: provide conversion functions					{{{1
- * populate skb from struct.
- *									{{{2
- */
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, tla_list)
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-static int s_name ## _to_skb(struct sk_buff *skb, struct s_name *s,	\
-		const bool exclude_sensitive)				\
-{									\
-	struct nlattr *tla = nla_nest_start(skb, tag_number);		\
-	if (!tla)							\
-		goto nla_put_failure;					\
-	DPRINT_TLA(#s_name, "-=>", #tag_name);				\
-	s_fields							\
-	nla_nest_end(skb, tla);						\
-	return 0;							\
-									\
-nla_put_failure:							\
-	if (tla)							\
-		nla_nest_cancel(skb, tla);				\
-        return -EMSGSIZE;						\
-}									\
-static inline int s_name ## _to_priv_skb(struct sk_buff *skb,		\
-		struct s_name *s)					\
-{									\
-	return s_name ## _to_skb(skb, s, 0);				\
-}									\
-static inline int s_name ## _to_unpriv_skb(struct sk_buff *skb,		\
-		struct s_name *s)					\
-{									\
-	return s_name ## _to_skb(skb, s, 1);				\
-}
-
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type, __get, __put,	\
-		__is_signed)						\
-	if (!exclude_sensitive || !((attr_flag) & DRBD_F_SENSITIVE)) {	\
-		DPRINT_FIELD(">>", nla_type, name, s, NULL);		\
-		if (__put(skb, attr_nr, s->name))			\
-			goto nla_put_failure;				\
-	}
-
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type, maxlen,	\
-		__get, __put, __is_signed)				\
-	if (!exclude_sensitive || !((attr_flag) & DRBD_F_SENSITIVE)) {	\
-		DPRINT_ARRAY(">>",nla_type, name, s, NULL);		\
-		if (__put(skb, attr_nr, min_t(int, maxlen,		\
-			s->name ## _len + (nla_type == NLA_NUL_STRING)),\
-						s->name))		\
-			goto nla_put_failure;				\
-	}
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-
-/* Functions for initializing structs to default values.  */
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type, __get, __put,	\
-		__is_signed)
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type, maxlen,	\
-		__get, __put, __is_signed)
-#undef __u32_field_def
-#define __u32_field_def(attr_nr, attr_flag, name, default)		\
-	x->name = default;
-#undef __s32_field_def
-#define __s32_field_def(attr_nr, attr_flag, name, default)		\
-	x->name = default;
-#undef __flg_field_def
-#define __flg_field_def(attr_nr, attr_flag, name, default)		\
-	x->name = default;
-#undef __str_field_def
-#define __str_field_def(attr_nr, attr_flag, name, maxlen)		\
-	memset(x->name, 0, sizeof(x->name));				\
-	x->name ## _len = 0;
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-static void set_ ## s_name ## _defaults(struct s_name *x) __attribute__((unused)); \
-static void set_ ## s_name ## _defaults(struct s_name *x) {	\
-s_fields								\
-}
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-#endif /* __KERNEL__ */
-
-/* }}}1 */
-#endif /* GENL_MAGIC_FUNC_H */
diff --git a/include/linux/genl_magic_struct.h b/include/linux/genl_magic_struct.h
deleted file mode 100644
index 2200cedd160a..000000000000
--- a/include/linux/genl_magic_struct.h
+++ /dev/null
@@ -1,272 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef GENL_MAGIC_STRUCT_H
-#define GENL_MAGIC_STRUCT_H
-
-#ifndef GENL_MAGIC_FAMILY
-# error "you need to define GENL_MAGIC_FAMILY before inclusion"
-#endif
-
-#ifndef GENL_MAGIC_VERSION
-# error "you need to define GENL_MAGIC_VERSION before inclusion"
-#endif
-
-#ifndef GENL_MAGIC_INCLUDE_FILE
-# error "you need to define GENL_MAGIC_INCLUDE_FILE before inclusion"
-#endif
-
-#include <linux/args.h>
-#include <linux/types.h>
-#include <net/genetlink.h>
-
-extern int CONCATENATE(GENL_MAGIC_FAMILY, _genl_register)(void);
-extern void CONCATENATE(GENL_MAGIC_FAMILY, _genl_unregister)(void);
-
-/*
- * Extension of genl attribute validation policies			{{{2
- */
-
-/*
- * Flags specific to drbd and not visible at the netlink layer, used in
- * <struct>_from_attrs and <struct>_to_skb:
- *
- * @DRBD_F_REQUIRED: Attribute is required; a request without this attribute is
- * invalid.
- *
- * @DRBD_F_SENSITIVE: Attribute includes sensitive information and must not be
- * included in unpriviledged get requests or broadcasts.
- *
- * @DRBD_F_INVARIANT: Attribute is set when an object is initially created, but
- * cannot subsequently be changed.
- */
-#define DRBD_F_REQUIRED (1 << 0)
-#define DRBD_F_SENSITIVE (1 << 1)
-#define DRBD_F_INVARIANT (1 << 2)
-
-
-/*									}}}1
- * MAGIC
- * multi-include macro expansion magic starts here
- */
-
-/* MAGIC helpers							{{{2 */
-
-static inline int nla_put_u64_0pad(struct sk_buff *skb, int attrtype, u64 value)
-{
-	return nla_put_64bit(skb, attrtype, sizeof(u64), &value, 0);
-}
-
-/* possible field types */
-#define __flg_field(attr_nr, attr_flag, name) \
-	__field(attr_nr, attr_flag, name, NLA_U8, char, \
-			nla_get_u8, nla_put_u8, false)
-#define __u8_field(attr_nr, attr_flag, name)	\
-	__field(attr_nr, attr_flag, name, NLA_U8, unsigned char, \
-			nla_get_u8, nla_put_u8, false)
-#define __u16_field(attr_nr, attr_flag, name)	\
-	__field(attr_nr, attr_flag, name, NLA_U16, __u16, \
-			nla_get_u16, nla_put_u16, false)
-#define __u32_field(attr_nr, attr_flag, name)	\
-	__field(attr_nr, attr_flag, name, NLA_U32, __u32, \
-			nla_get_u32, nla_put_u32, false)
-#define __s32_field(attr_nr, attr_flag, name)	\
-	__field(attr_nr, attr_flag, name, NLA_U32, __s32, \
-			nla_get_u32, nla_put_u32, true)
-#define __u64_field(attr_nr, attr_flag, name)	\
-	__field(attr_nr, attr_flag, name, NLA_U64, __u64, \
-			nla_get_u64, nla_put_u64_0pad, false)
-#define __str_field(attr_nr, attr_flag, name, maxlen) \
-	__array(attr_nr, attr_flag, name, NLA_NUL_STRING, char, maxlen, \
-			nla_strscpy, nla_put, false)
-#define __bin_field(attr_nr, attr_flag, name, maxlen) \
-	__array(attr_nr, attr_flag, name, NLA_BINARY, char, maxlen, \
-			nla_memcpy, nla_put, false)
-
-/* fields with default values */
-#define __flg_field_def(attr_nr, attr_flag, name, default) \
-	__flg_field(attr_nr, attr_flag, name)
-#define __u32_field_def(attr_nr, attr_flag, name, default) \
-	__u32_field(attr_nr, attr_flag, name)
-#define __s32_field_def(attr_nr, attr_flag, name, default) \
-	__s32_field(attr_nr, attr_flag, name)
-#define __str_field_def(attr_nr, attr_flag, name, maxlen) \
-	__str_field(attr_nr, attr_flag, name, maxlen)
-
-#define GENL_op_init(args...)	args
-#define GENL_doit(handler)		\
-	.doit = handler,		\
-	.flags = GENL_ADMIN_PERM,
-#define GENL_dumpit(handler)		\
-	.dumpit = handler,		\
-	.flags = GENL_ADMIN_PERM,
-
-/*									}}}1
- * Magic: define the enum symbols for genl_ops
- * Magic: define the enum symbols for top level attributes
- * Magic: define the enum symbols for nested attributes
- *									{{{2
- */
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)
-
-#undef GENL_mc_group
-#define GENL_mc_group(group)
-
-#undef GENL_notification
-#define GENL_notification(op_name, op_num, mcast_group, tla_list)	\
-	op_name = op_num,
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, tla_list)			\
-	op_name = op_num,
-
-enum {
-#include GENL_MAGIC_INCLUDE_FILE
-};
-
-#undef GENL_notification
-#define GENL_notification(op_name, op_num, mcast_group, tla_list)
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, attr_list)
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields) \
-		tag_name = tag_number,
-
-enum {
-#include GENL_MAGIC_INCLUDE_FILE
-};
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)	\
-enum {								\
-	s_fields						\
-};
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type,	\
-		__get, __put, __is_signed)			\
-	T_ ## name = (__u16)(attr_nr),
-
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type,	\
-		maxlen, __get, __put, __is_signed)		\
-	T_ ## name = (__u16)(attr_nr),
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-/*									}}}1
- * Magic: compile time assert unique numbers for operations
- * Magic: -"- unique numbers for top level attributes
- * Magic: -"- unique numbers for nested attributes
- *									{{{2
- */
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, attr_list)	\
-	case op_name:
-
-#undef GENL_notification
-#define GENL_notification(op_name, op_num, mcast_group, tla_list)	\
-	case op_name:
-
-static inline void ct_assert_unique_operations(void)
-{
-	switch (0) {
-#include GENL_MAGIC_INCLUDE_FILE
-	case 0:
-		;
-	}
-}
-
-#undef GENL_op
-#define GENL_op(op_name, op_num, handler, attr_list)
-
-#undef GENL_notification
-#define GENL_notification(op_name, op_num, mcast_group, tla_list)
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-		case tag_number:
-
-static inline void ct_assert_unique_top_level_attributes(void)
-{
-	switch (0) {
-#include GENL_MAGIC_INCLUDE_FILE
-	case 0:
-		;
-	}
-}
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-static inline void ct_assert_unique_ ## s_name ## _attributes(void)	\
-{									\
-	switch (0) {							\
-	s_fields							\
-	case 0:								\
-			;						\
-	}								\
-}
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type, __get, __put,	\
-		__is_signed)						\
-	case attr_nr:
-
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type, maxlen,	\
-		__get, __put, __is_signed)				\
-	case attr_nr:
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-/*									}}}1
- * Magic: declare structs
- * struct <name> {
- *	fields
- * };
- *									{{{2
- */
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-struct s_name { s_fields };
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type, __get, __put,	\
-		__is_signed)						\
-	type name;
-
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type, maxlen,	\
-		__get, __put, __is_signed)				\
-	type name[maxlen];	\
-	__u32 name ## _len;
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-#undef GENL_struct
-#define GENL_struct(tag_name, tag_number, s_name, s_fields)		\
-enum {									\
-	s_fields							\
-};
-
-#undef __field
-#define __field(attr_nr, attr_flag, name, nla_type, type, __get, __put,	\
-		is_signed)						\
-	F_ ## name ## _IS_SIGNED = is_signed,
-
-#undef __array
-#define __array(attr_nr, attr_flag, name, nla_type, type, maxlen,	\
-		__get, __put, is_signed)				\
-	F_ ## name ## _IS_SIGNED = is_signed,
-
-#include GENL_MAGIC_INCLUDE_FILE
-
-/* }}}1 */
-#endif /* GENL_MAGIC_STRUCT_H */
diff --git a/include/uapi/linux/drbd_genl.h b/include/uapi/linux/drbd_genl.h
new file mode 100644
index 000000000000..8b25f08d8a90
--- /dev/null
+++ b/include/uapi/linux/drbd_genl.h
@@ -0,0 +1,359 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+
+#ifndef _UAPI_LINUX_DRBD_GENL_H
+#define _UAPI_LINUX_DRBD_GENL_H
+
+#define DRBD_FAMILY_NAME	"drbd"
+#define DRBD_FAMILY_VERSION	1
+
+enum {
+	DRBD_NLA_CFG_REPLY = 1,
+	DRBD_NLA_CFG_CONTEXT,
+	DRBD_NLA_DISK_CONF,
+	DRBD_NLA_RESOURCE_OPTS,
+	DRBD_NLA_NET_CONF,
+	DRBD_NLA_SET_ROLE_PARMS,
+	DRBD_NLA_RESIZE_PARMS,
+	DRBD_NLA_STATE_INFO,
+	DRBD_NLA_START_OV_PARMS,
+	DRBD_NLA_NEW_C_UUID_PARMS,
+	DRBD_NLA_TIMEOUT_PARMS,
+	DRBD_NLA_DISCONNECT_PARMS,
+	DRBD_NLA_DETACH_PARMS,
+	DRBD_NLA_RESOURCE_INFO = 15,
+	DRBD_NLA_DEVICE_INFO,
+	DRBD_NLA_CONNECTION_INFO,
+	DRBD_NLA_PEER_DEVICE_INFO,
+	DRBD_NLA_RESOURCE_STATISTICS,
+	DRBD_NLA_DEVICE_STATISTICS,
+	DRBD_NLA_CONNECTION_STATISTICS,
+	DRBD_NLA_PEER_DEVICE_STATISTICS,
+	DRBD_NLA_NOTIFICATION_HEADER,
+	DRBD_NLA_HELPER,
+
+	__DRBD_NLA_MAX,
+	DRBD_NLA_MAX = (__DRBD_NLA_MAX - 1)
+};
+
+enum {
+	DRBD_A_DRBD_CFG_REPLY_INFO_TEXT = 1,
+
+	__DRBD_A_DRBD_CFG_REPLY_MAX,
+	DRBD_A_DRBD_CFG_REPLY_MAX = (__DRBD_A_DRBD_CFG_REPLY_MAX - 1)
+};
+
+enum {
+	DRBD_A_DRBD_CFG_CONTEXT_CTX_VOLUME = 1,
+	DRBD_A_DRBD_CFG_CONTEXT_CTX_RESOURCE_NAME,
+	DRBD_A_DRBD_CFG_CONTEXT_CTX_MY_ADDR,
+	DRBD_A_DRBD_CFG_CONTEXT_CTX_PEER_ADDR,
+
+	__DRBD_A_DRBD_CFG_CONTEXT_MAX,
+	DRBD_A_DRBD_CFG_CONTEXT_MAX = (__DRBD_A_DRBD_CFG_CONTEXT_MAX - 1)
+};
+
+enum {
+	DRBD_A_DISK_CONF_BACKING_DEV = 1,
+	DRBD_A_DISK_CONF_META_DEV,
+	DRBD_A_DISK_CONF_META_DEV_IDX,
+	DRBD_A_DISK_CONF_DISK_SIZE,
+	DRBD_A_DISK_CONF_MAX_BIO_BVECS,
+	DRBD_A_DISK_CONF_ON_IO_ERROR,
+	DRBD_A_DISK_CONF_FENCING,
+	DRBD_A_DISK_CONF_RESYNC_RATE,
+	DRBD_A_DISK_CONF_RESYNC_AFTER,
+	DRBD_A_DISK_CONF_AL_EXTENTS,
+	DRBD_A_DISK_CONF_C_PLAN_AHEAD,
+	DRBD_A_DISK_CONF_C_DELAY_TARGET,
+	DRBD_A_DISK_CONF_C_FILL_TARGET,
+	DRBD_A_DISK_CONF_C_MAX_RATE,
+	DRBD_A_DISK_CONF_C_MIN_RATE,
+	DRBD_A_DISK_CONF_DISK_BARRIER,
+	DRBD_A_DISK_CONF_DISK_FLUSHES,
+	DRBD_A_DISK_CONF_DISK_DRAIN,
+	DRBD_A_DISK_CONF_MD_FLUSHES,
+	DRBD_A_DISK_CONF_DISK_TIMEOUT,
+	DRBD_A_DISK_CONF_READ_BALANCING,
+	DRBD_A_DISK_CONF_AL_UPDATES = 23,
+	DRBD_A_DISK_CONF_DISCARD_ZEROES_IF_ALIGNED,
+	DRBD_A_DISK_CONF_RS_DISCARD_GRANULARITY,
+	DRBD_A_DISK_CONF_DISABLE_WRITE_SAME,
+
+	__DRBD_A_DISK_CONF_MAX,
+	DRBD_A_DISK_CONF_MAX = (__DRBD_A_DISK_CONF_MAX - 1)
+};
+
+enum {
+	DRBD_A_RES_OPTS_CPU_MASK = 1,
+	DRBD_A_RES_OPTS_ON_NO_DATA,
+
+	__DRBD_A_RES_OPTS_MAX,
+	DRBD_A_RES_OPTS_MAX = (__DRBD_A_RES_OPTS_MAX - 1)
+};
+
+enum {
+	DRBD_A_NET_CONF_SHARED_SECRET = 1,
+	DRBD_A_NET_CONF_CRAM_HMAC_ALG,
+	DRBD_A_NET_CONF_INTEGRITY_ALG,
+	DRBD_A_NET_CONF_VERIFY_ALG,
+	DRBD_A_NET_CONF_CSUMS_ALG,
+	DRBD_A_NET_CONF_WIRE_PROTOCOL,
+	DRBD_A_NET_CONF_CONNECT_INT,
+	DRBD_A_NET_CONF_TIMEOUT,
+	DRBD_A_NET_CONF_PING_INT,
+	DRBD_A_NET_CONF_PING_TIMEO,
+	DRBD_A_NET_CONF_SNDBUF_SIZE,
+	DRBD_A_NET_CONF_RCVBUF_SIZE,
+	DRBD_A_NET_CONF_KO_COUNT,
+	DRBD_A_NET_CONF_MAX_BUFFERS,
+	DRBD_A_NET_CONF_MAX_EPOCH_SIZE,
+	DRBD_A_NET_CONF_UNPLUG_WATERMARK,
+	DRBD_A_NET_CONF_AFTER_SB_0P,
+	DRBD_A_NET_CONF_AFTER_SB_1P,
+	DRBD_A_NET_CONF_AFTER_SB_2P,
+	DRBD_A_NET_CONF_RR_CONFLICT,
+	DRBD_A_NET_CONF_ON_CONGESTION,
+	DRBD_A_NET_CONF_CONG_FILL,
+	DRBD_A_NET_CONF_CONG_EXTENTS,
+	DRBD_A_NET_CONF_TWO_PRIMARIES,
+	DRBD_A_NET_CONF_DISCARD_MY_DATA,
+	DRBD_A_NET_CONF_TCP_CORK,
+	DRBD_A_NET_CONF_ALWAYS_ASBP,
+	DRBD_A_NET_CONF_TENTATIVE,
+	DRBD_A_NET_CONF_USE_RLE,
+	DRBD_A_NET_CONF_CSUMS_AFTER_CRASH_ONLY = 33,
+	DRBD_A_NET_CONF_SOCK_CHECK_TIMEO,
+
+	__DRBD_A_NET_CONF_MAX,
+	DRBD_A_NET_CONF_MAX = (__DRBD_A_NET_CONF_MAX - 1)
+};
+
+enum {
+	DRBD_A_SET_ROLE_PARMS_ASSUME_UPTODATE = 1,
+
+	__DRBD_A_SET_ROLE_PARMS_MAX,
+	DRBD_A_SET_ROLE_PARMS_MAX = (__DRBD_A_SET_ROLE_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_RESIZE_PARMS_RESIZE_SIZE = 1,
+	DRBD_A_RESIZE_PARMS_RESIZE_FORCE,
+	DRBD_A_RESIZE_PARMS_NO_RESYNC,
+	DRBD_A_RESIZE_PARMS_AL_STRIPES,
+	DRBD_A_RESIZE_PARMS_AL_STRIPE_SIZE,
+
+	__DRBD_A_RESIZE_PARMS_MAX,
+	DRBD_A_RESIZE_PARMS_MAX = (__DRBD_A_RESIZE_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_STATE_INFO_SIB_REASON = 1,
+	DRBD_A_STATE_INFO_CURRENT_STATE,
+	DRBD_A_STATE_INFO_CAPACITY,
+	DRBD_A_STATE_INFO_ED_UUID,
+	DRBD_A_STATE_INFO_PREV_STATE,
+	DRBD_A_STATE_INFO_NEW_STATE,
+	DRBD_A_STATE_INFO_UUIDS,
+	DRBD_A_STATE_INFO_DISK_FLAGS,
+	DRBD_A_STATE_INFO_BITS_TOTAL,
+	DRBD_A_STATE_INFO_BITS_OOS,
+	DRBD_A_STATE_INFO_BITS_RS_TOTAL,
+	DRBD_A_STATE_INFO_BITS_RS_FAILED,
+	DRBD_A_STATE_INFO_HELPER,
+	DRBD_A_STATE_INFO_HELPER_EXIT_CODE,
+	DRBD_A_STATE_INFO_SEND_CNT,
+	DRBD_A_STATE_INFO_RECV_CNT,
+	DRBD_A_STATE_INFO_READ_CNT,
+	DRBD_A_STATE_INFO_WRIT_CNT,
+	DRBD_A_STATE_INFO_AL_WRIT_CNT,
+	DRBD_A_STATE_INFO_BM_WRIT_CNT,
+	DRBD_A_STATE_INFO_AP_BIO_CNT,
+	DRBD_A_STATE_INFO_AP_PENDING_CNT,
+	DRBD_A_STATE_INFO_RS_PENDING_CNT,
+
+	__DRBD_A_STATE_INFO_MAX,
+	DRBD_A_STATE_INFO_MAX = (__DRBD_A_STATE_INFO_MAX - 1)
+};
+
+enum {
+	DRBD_A_START_OV_PARMS_OV_START_SECTOR = 1,
+	DRBD_A_START_OV_PARMS_OV_STOP_SECTOR,
+
+	__DRBD_A_START_OV_PARMS_MAX,
+	DRBD_A_START_OV_PARMS_MAX = (__DRBD_A_START_OV_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_NEW_C_UUID_PARMS_CLEAR_BM = 1,
+
+	__DRBD_A_NEW_C_UUID_PARMS_MAX,
+	DRBD_A_NEW_C_UUID_PARMS_MAX = (__DRBD_A_NEW_C_UUID_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_TIMEOUT_PARMS_TIMEOUT_TYPE = 1,
+
+	__DRBD_A_TIMEOUT_PARMS_MAX,
+	DRBD_A_TIMEOUT_PARMS_MAX = (__DRBD_A_TIMEOUT_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_DISCONNECT_PARMS_FORCE_DISCONNECT = 1,
+
+	__DRBD_A_DISCONNECT_PARMS_MAX,
+	DRBD_A_DISCONNECT_PARMS_MAX = (__DRBD_A_DISCONNECT_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_DETACH_PARMS_FORCE_DETACH = 1,
+
+	__DRBD_A_DETACH_PARMS_MAX,
+	DRBD_A_DETACH_PARMS_MAX = (__DRBD_A_DETACH_PARMS_MAX - 1)
+};
+
+enum {
+	DRBD_A_RESOURCE_INFO_RES_ROLE = 1,
+	DRBD_A_RESOURCE_INFO_RES_SUSP,
+	DRBD_A_RESOURCE_INFO_RES_SUSP_NOD,
+	DRBD_A_RESOURCE_INFO_RES_SUSP_FEN,
+
+	__DRBD_A_RESOURCE_INFO_MAX,
+	DRBD_A_RESOURCE_INFO_MAX = (__DRBD_A_RESOURCE_INFO_MAX - 1)
+};
+
+enum {
+	DRBD_A_DEVICE_INFO_DEV_DISK_STATE = 1,
+
+	__DRBD_A_DEVICE_INFO_MAX,
+	DRBD_A_DEVICE_INFO_MAX = (__DRBD_A_DEVICE_INFO_MAX - 1)
+};
+
+enum {
+	DRBD_A_CONNECTION_INFO_CONN_CONNECTION_STATE = 1,
+	DRBD_A_CONNECTION_INFO_CONN_ROLE,
+
+	__DRBD_A_CONNECTION_INFO_MAX,
+	DRBD_A_CONNECTION_INFO_MAX = (__DRBD_A_CONNECTION_INFO_MAX - 1)
+};
+
+enum {
+	DRBD_A_PEER_DEVICE_INFO_PEER_REPL_STATE = 1,
+	DRBD_A_PEER_DEVICE_INFO_PEER_DISK_STATE,
+	DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_USER,
+	DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_PEER,
+	DRBD_A_PEER_DEVICE_INFO_PEER_RESYNC_SUSP_DEPENDENCY,
+
+	__DRBD_A_PEER_DEVICE_INFO_MAX,
+	DRBD_A_PEER_DEVICE_INFO_MAX = (__DRBD_A_PEER_DEVICE_INFO_MAX - 1)
+};
+
+enum {
+	DRBD_A_RESOURCE_STATISTICS_RES_STAT_WRITE_ORDERING = 1,
+
+	__DRBD_A_RESOURCE_STATISTICS_MAX,
+	DRBD_A_RESOURCE_STATISTICS_MAX = (__DRBD_A_RESOURCE_STATISTICS_MAX - 1)
+};
+
+enum {
+	DRBD_A_DEVICE_STATISTICS_DEV_SIZE = 1,
+	DRBD_A_DEVICE_STATISTICS_DEV_READ,
+	DRBD_A_DEVICE_STATISTICS_DEV_WRITE,
+	DRBD_A_DEVICE_STATISTICS_DEV_AL_WRITES,
+	DRBD_A_DEVICE_STATISTICS_DEV_BM_WRITES,
+	DRBD_A_DEVICE_STATISTICS_DEV_UPPER_PENDING,
+	DRBD_A_DEVICE_STATISTICS_DEV_LOWER_PENDING,
+	DRBD_A_DEVICE_STATISTICS_DEV_UPPER_BLOCKED,
+	DRBD_A_DEVICE_STATISTICS_DEV_LOWER_BLOCKED,
+	DRBD_A_DEVICE_STATISTICS_DEV_AL_SUSPENDED,
+	DRBD_A_DEVICE_STATISTICS_DEV_EXPOSED_DATA_UUID,
+	DRBD_A_DEVICE_STATISTICS_DEV_CURRENT_UUID,
+	DRBD_A_DEVICE_STATISTICS_DEV_DISK_FLAGS,
+	DRBD_A_DEVICE_STATISTICS_HISTORY_UUIDS,
+
+	__DRBD_A_DEVICE_STATISTICS_MAX,
+	DRBD_A_DEVICE_STATISTICS_MAX = (__DRBD_A_DEVICE_STATISTICS_MAX - 1)
+};
+
+enum {
+	DRBD_A_CONNECTION_STATISTICS_CONN_CONGESTED = 1,
+
+	__DRBD_A_CONNECTION_STATISTICS_MAX,
+	DRBD_A_CONNECTION_STATISTICS_MAX = (__DRBD_A_CONNECTION_STATISTICS_MAX - 1)
+};
+
+enum {
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RECEIVED = 1,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_SENT,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_PENDING,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_UNACKED,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_OUT_OF_SYNC,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_RESYNC_FAILED,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_BITMAP_UUID,
+	DRBD_A_PEER_DEVICE_STATISTICS_PEER_DEV_FLAGS = 9,
+
+	__DRBD_A_PEER_DEVICE_STATISTICS_MAX,
+	DRBD_A_PEER_DEVICE_STATISTICS_MAX = (__DRBD_A_PEER_DEVICE_STATISTICS_MAX - 1)
+};
+
+enum {
+	DRBD_A_DRBD_NOTIFICATION_HEADER_NH_TYPE = 1,
+
+	__DRBD_A_DRBD_NOTIFICATION_HEADER_MAX,
+	DRBD_A_DRBD_NOTIFICATION_HEADER_MAX = (__DRBD_A_DRBD_NOTIFICATION_HEADER_MAX - 1)
+};
+
+enum {
+	DRBD_A_DRBD_HELPER_INFO_HELPER_NAME = 1,
+	DRBD_A_DRBD_HELPER_INFO_HELPER_STATUS,
+
+	__DRBD_A_DRBD_HELPER_INFO_MAX,
+	DRBD_A_DRBD_HELPER_INFO_MAX = (__DRBD_A_DRBD_HELPER_INFO_MAX - 1)
+};
+
+enum {
+	DRBD_ADM_EVENT = 1,
+	DRBD_ADM_GET_STATUS,
+	DRBD_ADM_NEW_MINOR = 5,
+	DRBD_ADM_DEL_MINOR,
+	DRBD_ADM_NEW_RESOURCE,
+	DRBD_ADM_DEL_RESOURCE,
+	DRBD_ADM_RESOURCE_OPTS,
+	DRBD_ADM_CONNECT,
+	DRBD_ADM_DISCONNECT,
+	DRBD_ADM_ATTACH,
+	DRBD_ADM_RESIZE,
+	DRBD_ADM_PRIMARY,
+	DRBD_ADM_SECONDARY,
+	DRBD_ADM_NEW_C_UUID,
+	DRBD_ADM_START_OV,
+	DRBD_ADM_DETACH,
+	DRBD_ADM_INVALIDATE,
+	DRBD_ADM_INVAL_PEER,
+	DRBD_ADM_PAUSE_SYNC,
+	DRBD_ADM_RESUME_SYNC,
+	DRBD_ADM_SUSPEND_IO,
+	DRBD_ADM_RESUME_IO,
+	DRBD_ADM_OUTDATE,
+	DRBD_ADM_GET_TIMEOUT_TYPE,
+	DRBD_ADM_DOWN,
+	DRBD_ADM_CHG_DISK_OPTS,
+	DRBD_ADM_CHG_NET_OPTS,
+	DRBD_ADM_GET_RESOURCES,
+	DRBD_ADM_GET_DEVICES,
+	DRBD_ADM_GET_CONNECTIONS,
+	DRBD_ADM_GET_PEER_DEVICES,
+	DRBD_ADM_RESOURCE_STATE,
+	DRBD_ADM_DEVICE_STATE,
+	DRBD_ADM_CONNECTION_STATE,
+	DRBD_ADM_PEER_DEVICE_STATE,
+	DRBD_ADM_GET_INITIAL_STATE,
+	DRBD_ADM_HELPER = 40,
+	DRBD_ADM_INITIAL_STATE_DONE,
+
+	__DRBD_ADM_MAX,
+	DRBD_ADM_MAX = (__DRBD_ADM_MAX - 1)
+};
+
+#define DRBD_MCGRP_EVENTS	"events"
+
+#endif /* _UAPI_LINUX_DRBD_GENL_H */
-- 
2.53.0

