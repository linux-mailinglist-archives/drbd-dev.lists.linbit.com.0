Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLG2KlsJx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:48:59 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 454A834C20F
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:48:59 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FC90163172;
	Fri, 27 Mar 2026 23:48:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D6887163137
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:27 +0100 (CET)
Received: by mail-wr1-f43.google.com with SMTP id
	ffacd0b85a97d-43b40003d13so1810480f8f.2
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651167;
	x=1775255967; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=HhHZSd27wMQuGT4vpyJe3rksu9vgg3CQC05iYjYMQhs=;
	b=MG2Nx8LPRzYL9FV/86OoMU22EWaycq1FQNAbcPlvNTIV1I40nYu4vhrCnMSutpkJYS
	lvxSYSvWNBFhE2L1F+OOCUOPdo4t0xjSkjl3xZsFQ/RQpjX33fmvXO6WktWYS4PdmR2G
	AJCIFnsIkt4eXPJOUoYcHJiV4g1xrXm7OYzAbevxjkWIEnhsSgJEUgS7cM6kiwOcjFFe
	if3Mi+GupCdXDfI7tBHMBWqS3FdaE5BMKz3B+r1nC2uGRd7hrusKXuzwizAYLrozODcU
	ok7vaXN50vIfIod4tKZgkeJ8PNyIN0FDtB5T3mdBOXT9RNkAlnSbZUWLx+9k9IJ+qvGo
	j1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651167; x=1775255967;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=HhHZSd27wMQuGT4vpyJe3rksu9vgg3CQC05iYjYMQhs=;
	b=SKd+fo1anOcUaBjB00UuFdPvgzKcvyEVEr0RDlwSaD05IizfU8SYJtdrK4bHDzdFZj
	2k2RA7t1IYxOCLBr7slQIWY5jbNrUSLgZequhy5BoJxUXgeuEF/R4uG7Fm/Er/0H8XkU
	3XsVw+uU9uDBoXxxyzkGC/SEgxRqMHTjd15XIu/Hs2d5xwcCY8Zgrz6FZQEpfiitKmWj
	gn3ABgkIC3WXJ+9uwCzkIiAPcvRbuoEQcxY2MuZF3Txrjyrcx7z6ipf20irHMazqBFGg
	bxIKNxCy8T14b9Jf+hGBUKhgWpTLkovLMzTpr+R+vF9VO084W32xBASd70/+IMF602vU
	zZBw==
X-Gm-Message-State: AOJu0YymPwiYM9+Ef+9N9bsATwYUSegVfHK/OLR/g4j/ehEd4e7+l101
	LorydbDWlPS1DXBaDo7/XAOEaIUeaEF0ufFaplYl6PCTddatd3iKOwHFN/uVTe97m9LP4Yy1jE4
	YFmOOSTU=
X-Gm-Gg: ATEYQzz25/sCU4HjSGdueNrMQBsxxEUUh013PDp4m3R9HWHJL+0vIciNSXepacvlJj2
	0YHziwfJjKzQeeta8H7cMnWVe/abvJscqzyW5E/NnEM6VrvOXEL1AGnPtZY/uv25j6MiDDBz2CI
	2P7ezVHD67Xghu6frTkngakIXC93BDzKdeUVQ16zzcDfS1+I23nmc/aCGuaGy7y0c6E/10KczSu
	AVj0pSkS+lvjDotKXKXHX99ElLjVDrPI5rQAeAt6zB+PgOVPYECEotE0pPANQQ/ezGwVB2OG8BJ
	5Tc4C7Jb/eKbwD4eXgTTgdoOm1Y8GmooQHOQe4UMr2s+hxSbKOlNBUBYkY4S31cCaZ9fU7hTKa3
	E8oAITJlym7uK/E/0YiFuZAhfhV7PRRAKuh6dNG7+nj6vCR/u3IZnKqdmnZOWJAXlz87qZCbH5y
	pmxK+IICfHGvBxvGps672bYKFDwuY9m8mS72TZrFKk8P8fEr1oyVQnnCKOJKrq8zLKd5Z2OO+QF
	5iLM7Ue8AVPD2G7U4vCmDDqK4W4579q
X-Received: by 2002:a05:6000:220b:b0:43b:8023:8b2 with SMTP id
	ffacd0b85a97d-43b9ea76481mr7226757f8f.45.1774651166419; 
	Fri, 27 Mar 2026 15:39:26 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:25 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 18/20] drbd: rework netlink management interface for DRBD 9
Date: Fri, 27 Mar 2026 23:38:18 +0100
Message-ID: <20260327223820.2244227-19-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 23:48:47 +0100
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
	NEURAL_HAM(-0.00)[-0.921];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 454A834C20F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rework the generic netlink administration interface to support
DRBD 9's multi-peer topology model.

Connections are now identified by peer node ID rather than address
pairs, and the admin API gains operations for creating/removing
peer connections and managing network paths within each connection.

Add per-peer-device configuration, metadata slot reclamation, and
resource renaming as new administrative commands.

Lift role promotion to resource scope and use quorum-aware logic
with auto-promote timeout, replacing the per-device state machine.

Disk attach and detach gain support for per-peer bitmap slot allocation,
DAX/PMEM-backed metadata, and variable bitmap block sizes.

Resize and other multi-peer operations use the new transactional state
change API to coordinate across all peers atomically.

The required capability for administrative commands changes from
CAP_NET_ADMIN to CAP_SYS_ADMIN, and the global genl_lock() serialization
is replaced by parallel_ops with fine-grained locking. Notifications
are extended to cover path-level state and detailed per-peer resync
progress.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 7244 ++++++++++++++++++++++++----------
 1 file changed, 5183 insertions(+), 2061 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 463f57d33204..48abe5914889 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -19,66 +19,80 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/slab.h>
-#include <linux/blkpg.h>
 #include <linux/cpumask.h>
+#include <linux/random.h>
 #include "drbd_int.h"
 #include "drbd_protocol.h"
-#include "drbd_req.h"
 #include "drbd_state_change.h"
-#include <linux/unaligned.h>
+#include "drbd_debugfs.h"
+#include "drbd_transport.h"
+#include "drbd_dax_pmem.h"
 #include <linux/drbd_limits.h>
 #include <linux/kthread.h>
-
+#include <linux/security.h>
 #include <net/genetlink.h>
+#include <net/sock.h>
+
+#include "drbd_meta_data.h"
+#include "drbd_legacy_84.h"
 
 /* .doit */
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
+static int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info);
+
+static int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_del_resource(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_down(struct sk_buff *skb, struct genl_info *info);
+
+static int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_new_peer(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_del_peer(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_new_path(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_del_path(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_peer_device_opts(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_suspend_io(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_outdate(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_forget_peer(struct sk_buff *skb, struct genl_info *info);
+static int drbd_adm_rename_resource(struct sk_buff *skb, struct genl_info *info);
 /* .dumpit */
-int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_devices_done(struct netlink_callback *cb);
-int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_connections_done(struct netlink_callback *cb);
-int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb);
-int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb);
-int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_dump_devices_done(struct netlink_callback *cb);
+static int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_dump_connections_done(struct netlink_callback *cb);
+static int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb);
+static int drbd_adm_dump_paths(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_dump_paths_done(struct netlink_callback *cb);
+static int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb);
+static int drbd_adm_get_initial_state_done(struct netlink_callback *cb);
 
 #include "drbd_genl_api.h"
 #include "drbd_nla.h"
 #include <linux/genl_magic_func.h>
 
-static atomic_t drbd_genl_seq = ATOMIC_INIT(2); /* two. */
-static atomic_t notify_genl_seq = ATOMIC_INIT(2); /* two. */
+void drbd_enable_netns(void)
+{
+	drbd_genl_family.netnsok = true;
+}
+
+atomic_t drbd_genl_seq = ATOMIC_INIT(2); /* two. */
 
 DEFINE_MUTEX(notification_mutex);
 
@@ -110,11 +124,15 @@ static int drbd_msg_put_info(struct sk_buff *skb, const char *info)
 	if (err) {
 		nla_nest_cancel(skb, nla);
 		return err;
-	} else
-		nla_nest_end(skb, nla);
+	}
+	nla_nest_end(skb, nla);
 	return 0;
 }
 
+static int drbd_adm_finish(struct drbd_config_context *, struct genl_info *, int);
+
+extern struct genl_ops drbd_genl_ops[];
+
 __printf(2, 3)
 static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)
 {
@@ -122,6 +140,8 @@ static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)
 	struct nlattr *nla, *txt;
 	int err = -EMSGSIZE;
 	int len;
+	int aligned_len;
+	char *msg_buf;
 
 	nla = nla_nest_start_noflag(skb, DRBD_NLA_CFG_REPLY);
 	if (!nla)
@@ -132,30 +152,56 @@ static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)
 		nla_nest_cancel(skb, nla);
 		return err;
 	}
+	msg_buf = nla_data(txt);
 	va_start(args, fmt);
-	len = vscnprintf(nla_data(txt), 256, fmt, args);
+	len = vscnprintf(msg_buf, 256, fmt, args);
 	va_end(args);
 
 	/* maybe: retry with larger reserve, if truncated */
-	txt->nla_len = nla_attr_size(len+1);
-	nlmsg_trim(skb, (char*)txt + NLA_ALIGN(txt->nla_len));
+
+	/* zero-out padding bytes to avoid transmitting uninitialized bytes */
+	++len;
+	txt->nla_len = nla_attr_size(len);
+	aligned_len = NLA_ALIGN(len);
+	while (len < aligned_len) {
+		msg_buf[len] = '\0';
+		++len;
+	}
+	nlmsg_trim(skb, (char *) txt + NLA_ALIGN(txt->nla_len));
 	nla_nest_end(skb, nla);
 
 	return 0;
 }
 
+static bool need_sys_admin(u8 cmd)
+{
+	int i;
+	for (i = 0; i < ARRAY_SIZE(drbd_genl_ops); i++)
+		if (drbd_genl_ops[i].cmd == cmd)
+			return 0 != (drbd_genl_ops[i].flags & GENL_ADMIN_PERM);
+	return true;
+}
+
+static struct drbd_path *first_path(struct drbd_connection *connection)
+{
+	/* Ideally this function is removed at a later point in time.
+	   It was introduced when replacing the single address pair
+	   with a list of address pairs (or paths). */
+
+	return list_first_or_null_rcu(&connection->transport.paths, struct drbd_path, list);
+}
+
 /* This would be a good candidate for a "pre_doit" hook,
  * and per-family private info->pointers.
  * But we need to stay compatible with older kernels.
  * If it returns successfully, adm_ctx members are valid.
- *
- * At this point, we still rely on the global genl_lock().
- * If we want to avoid that, and allow "genl_family.parallel_ops", we may need
- * to add additional synchronization against object destruction/modification.
  */
-#define DRBD_ADM_NEED_MINOR	1
-#define DRBD_ADM_NEED_RESOURCE	2
-#define DRBD_ADM_NEED_CONNECTION 4
+#define DRBD_ADM_NEED_MINOR        (1 << 0)
+#define DRBD_ADM_NEED_RESOURCE     (1 << 1)
+#define DRBD_ADM_NEED_CONNECTION   (1 << 2)
+#define DRBD_ADM_NEED_PEER_DEVICE  (1 << 3)
+#define DRBD_ADM_NEED_PEER_NODE    (1 << 4)
+#define DRBD_ADM_IGNORE_VERSION    (1 << 5)
 static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	struct sk_buff *skb, struct genl_info *info, unsigned flags)
 {
@@ -165,9 +211,15 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 
 	memset(adm_ctx, 0, sizeof(*adm_ctx));
 
-	/* genl_rcv_msg only checks for CAP_NET_ADMIN on "GENL_ADMIN_PERM" :( */
-	if (cmd != DRBD_ADM_GET_STATUS && !capable(CAP_NET_ADMIN))
-	       return -EPERM;
+	adm_ctx->net = sock_net(skb->sk);
+
+	/*
+	 * genl_rcv_msg() only checks if commands with the GENL_ADMIN_PERM flag
+	 * set have CAP_NET_ADMIN; we also require CAP_SYS_ADMIN for
+	 * administrative commands.
+	 */
+	if (need_sys_admin(cmd) && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
 
 	adm_ctx->reply_skb = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
 	if (!adm_ctx->reply_skb) {
@@ -184,14 +236,29 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 		goto fail;
 	}
 
+	if (info->genlhdr->version != GENL_MAGIC_VERSION && (flags & DRBD_ADM_IGNORE_VERSION) == 0) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "Wrong API version, upgrade your drbd utils.");
+		err = -EINVAL;
+		goto fail;
+	}
+
+	if (flags & DRBD_ADM_NEED_PEER_DEVICE)
+		flags |= DRBD_ADM_NEED_CONNECTION;
+	if (flags & DRBD_ADM_NEED_CONNECTION)
+		flags |= DRBD_ADM_NEED_PEER_NODE;
+	if (flags & DRBD_ADM_NEED_PEER_NODE)
+		flags |= DRBD_ADM_NEED_RESOURCE;
+
 	adm_ctx->reply_dh->minor = d_in->minor;
 	adm_ctx->reply_dh->ret_code = NO_ERROR;
 
 	adm_ctx->volume = VOLUME_UNSPECIFIED;
+	adm_ctx->peer_node_id = PEER_NODE_ID_UNSPECIFIED;
 	if (info->attrs[DRBD_NLA_CFG_CONTEXT]) {
 		struct nlattr *nla;
+		struct nlattr **nested_attr_tb;
 		/* parse and validate only */
-		err = drbd_cfg_context_from_attrs(NULL, info);
+		err = drbd_cfg_context_ntb_from_attrs(&nested_attr_tb, info);
 		if (err)
 			goto fail;
 
@@ -207,108 +274,148 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 		nla = nested_attr_tb[__nla_type(T_ctx_volume)];
 		if (nla)
 			adm_ctx->volume = nla_get_u32(nla);
+		nla = nested_attr_tb[__nla_type(T_ctx_peer_node_id)];
+		if (nla)
+			adm_ctx->peer_node_id = nla_get_u32(nla);
 		nla = nested_attr_tb[__nla_type(T_ctx_resource_name)];
 		if (nla)
 			adm_ctx->resource_name = nla_data(nla);
-		adm_ctx->my_addr = nested_attr_tb[__nla_type(T_ctx_my_addr)];
-		adm_ctx->peer_addr = nested_attr_tb[__nla_type(T_ctx_peer_addr)];
-		if ((adm_ctx->my_addr &&
-		     nla_len(adm_ctx->my_addr) > sizeof(adm_ctx->connection->my_addr)) ||
-		    (adm_ctx->peer_addr &&
-		     nla_len(adm_ctx->peer_addr) > sizeof(adm_ctx->connection->peer_addr))) {
-			err = -EINVAL;
-			goto fail;
-		}
+		kfree(nested_attr_tb);
+	}
+
+	if (adm_ctx->resource_name) {
+		adm_ctx->resource = drbd_find_resource(adm_ctx->resource_name);
 	}
 
 	adm_ctx->minor = d_in->minor;
+	rcu_read_lock();
 	adm_ctx->device = minor_to_device(d_in->minor);
-
-	/* We are protected by the global genl_lock().
-	 * But we may explicitly drop it/retake it in drbd_adm_set_role(),
-	 * so make sure this object stays around. */
-	if (adm_ctx->device)
+	if (adm_ctx->device) {
 		kref_get(&adm_ctx->device->kref);
-
-	if (adm_ctx->resource_name) {
-		adm_ctx->resource = drbd_find_resource(adm_ctx->resource_name);
 	}
+	rcu_read_unlock();
 
 	if (!adm_ctx->device && (flags & DRBD_ADM_NEED_MINOR)) {
 		drbd_msg_put_info(adm_ctx->reply_skb, "unknown minor");
-		return ERR_MINOR_INVALID;
+		err = ERR_MINOR_INVALID;
+		goto finish;
 	}
 	if (!adm_ctx->resource && (flags & DRBD_ADM_NEED_RESOURCE)) {
 		drbd_msg_put_info(adm_ctx->reply_skb, "unknown resource");
+		err = ERR_INVALID_REQUEST;
 		if (adm_ctx->resource_name)
-			return ERR_RES_NOT_KNOWN;
-		return ERR_INVALID_REQUEST;
+			err = ERR_RES_NOT_KNOWN;
+		goto finish;
 	}
-
-	if (flags & DRBD_ADM_NEED_CONNECTION) {
-		if (adm_ctx->resource) {
-			drbd_msg_put_info(adm_ctx->reply_skb, "no resource name expected");
-			return ERR_INVALID_REQUEST;
+	if (adm_ctx->peer_node_id != PEER_NODE_ID_UNSPECIFIED) {
+		/* peer_node_id is unsigned int */
+		if (adm_ctx->peer_node_id >= DRBD_NODE_ID_MAX) {
+			drbd_msg_put_info(adm_ctx->reply_skb, "peer node id out of range");
+			err = ERR_INVALID_REQUEST;
+			goto finish;
 		}
-		if (adm_ctx->device) {
-			drbd_msg_put_info(adm_ctx->reply_skb, "no minor number expected");
-			return ERR_INVALID_REQUEST;
+		if (!adm_ctx->resource) {
+			drbd_msg_put_info(adm_ctx->reply_skb,
+					"peer node id given without a resource");
+			err = ERR_INVALID_REQUEST;
+			goto finish;
+		}
+		if (adm_ctx->peer_node_id == adm_ctx->resource->res_opts.node_id) {
+			drbd_msg_put_info(adm_ctx->reply_skb, "peer node id cannot be my own node id");
+			err = ERR_INVALID_REQUEST;
+			goto finish;
 		}
-		if (adm_ctx->my_addr && adm_ctx->peer_addr)
-			adm_ctx->connection = conn_get_by_addrs(nla_data(adm_ctx->my_addr),
-							  nla_len(adm_ctx->my_addr),
-							  nla_data(adm_ctx->peer_addr),
-							  nla_len(adm_ctx->peer_addr));
+		adm_ctx->connection = drbd_get_connection_by_node_id(adm_ctx->resource, adm_ctx->peer_node_id);
+	} else if (flags & DRBD_ADM_NEED_PEER_NODE) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "peer node id missing");
+		err = ERR_INVALID_REQUEST;
+		goto finish;
+	}
+	if (flags & DRBD_ADM_NEED_CONNECTION) {
 		if (!adm_ctx->connection) {
 			drbd_msg_put_info(adm_ctx->reply_skb, "unknown connection");
-			return ERR_INVALID_REQUEST;
+			err = ERR_INVALID_REQUEST;
+			goto finish;
 		}
 	}
+	if (flags & DRBD_ADM_NEED_PEER_DEVICE) {
+		rcu_read_lock();
+		if (adm_ctx->volume != VOLUME_UNSPECIFIED)
+			adm_ctx->peer_device =
+				idr_find(&adm_ctx->connection->peer_devices,
+					 adm_ctx->volume);
+		if (!adm_ctx->peer_device) {
+			drbd_msg_put_info(adm_ctx->reply_skb, "unknown volume");
+			err = ERR_INVALID_REQUEST;
+			rcu_read_unlock();
+			goto finish;
+		}
+		if (!adm_ctx->device) {
+			adm_ctx->device = adm_ctx->peer_device->device;
+			kref_get(&adm_ctx->device->kref);
+		}
+		rcu_read_unlock();
+	}
 
 	/* some more paranoia, if the request was over-determined */
 	if (adm_ctx->device && adm_ctx->resource &&
 	    adm_ctx->device->resource != adm_ctx->resource) {
 		pr_warn("request: minor=%u, resource=%s; but that minor belongs to resource %s\n",
-			adm_ctx->minor, adm_ctx->resource->name,
-			adm_ctx->device->resource->name);
+				adm_ctx->minor, adm_ctx->resource->name,
+				adm_ctx->device->resource->name);
 		drbd_msg_put_info(adm_ctx->reply_skb, "minor exists in different resource");
-		return ERR_INVALID_REQUEST;
+		err = ERR_INVALID_REQUEST;
+		goto finish;
 	}
 	if (adm_ctx->device &&
 	    adm_ctx->volume != VOLUME_UNSPECIFIED &&
 	    adm_ctx->volume != adm_ctx->device->vnr) {
 		pr_warn("request: minor=%u, volume=%u; but that minor is volume %u in %s\n",
-			adm_ctx->minor, adm_ctx->volume,
-			adm_ctx->device->vnr, adm_ctx->device->resource->name);
+				adm_ctx->minor, adm_ctx->volume,
+				adm_ctx->device->vnr,
+				adm_ctx->device->resource->name);
 		drbd_msg_put_info(adm_ctx->reply_skb, "minor exists as different volume");
-		return ERR_INVALID_REQUEST;
+		err = ERR_INVALID_REQUEST;
+		goto finish;
+	}
+	if (adm_ctx->device && adm_ctx->peer_device &&
+	    adm_ctx->resource && adm_ctx->resource->name &&
+	    adm_ctx->peer_device->device != adm_ctx->device) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "peer_device->device != device");
+		pr_warn("request: minor=%u, resource=%s, volume=%u, peer_node=%u; device != peer_device->device\n",
+				adm_ctx->minor, adm_ctx->resource->name,
+				adm_ctx->device->vnr, adm_ctx->peer_node_id);
+		err = ERR_INVALID_REQUEST;
+		goto finish;
 	}
 
 	/* still, provide adm_ctx->resource always, if possible. */
 	if (!adm_ctx->resource) {
 		adm_ctx->resource = adm_ctx->device ? adm_ctx->device->resource
 			: adm_ctx->connection ? adm_ctx->connection->resource : NULL;
-		if (adm_ctx->resource)
+		if (adm_ctx->resource) {
 			kref_get(&adm_ctx->resource->kref);
+		}
 	}
-
 	return NO_ERROR;
 
 fail:
 	nlmsg_free(adm_ctx->reply_skb);
 	adm_ctx->reply_skb = NULL;
 	return err;
+
+finish:
+	return drbd_adm_finish(adm_ctx, info, err);
 }
 
-static int drbd_adm_finish(struct drbd_config_context *adm_ctx,
-	struct genl_info *info, int retcode)
+static int drbd_adm_finish(struct drbd_config_context *adm_ctx, struct genl_info *info, int retcode)
 {
 	if (adm_ctx->device) {
 		kref_put(&adm_ctx->device->kref, drbd_destroy_device);
 		adm_ctx->device = NULL;
 	}
 	if (adm_ctx->connection) {
-		kref_put(&adm_ctx->connection->kref, &drbd_destroy_connection);
+		kref_put(&adm_ctx->connection->kref, drbd_destroy_connection);
 		adm_ctx->connection = NULL;
 	}
 	if (adm_ctx->resource) {
@@ -321,220 +428,404 @@ static int drbd_adm_finish(struct drbd_config_context *adm_ctx,
 
 	adm_ctx->reply_dh->ret_code = retcode;
 	drbd_adm_send_reply(adm_ctx->reply_skb, info);
+	adm_ctx->reply_skb = NULL;
 	return 0;
 }
 
-static void setup_khelper_env(struct drbd_connection *connection, char **envp)
+static void conn_md_sync(struct drbd_connection *connection)
 {
-	char *afs;
+	struct drbd_peer_device *peer_device;
+	int vnr;
 
-	/* FIXME: A future version will not allow this case. */
-	if (connection->my_addr_len == 0 || connection->peer_addr_len == 0)
-		return;
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		struct drbd_device *device = peer_device->device;
+		kref_get(&device->kref);
+		rcu_read_unlock();
+		drbd_md_sync_if_dirty(device);
+		kref_put(&device->kref, drbd_destroy_device);
+		rcu_read_lock();
+	}
+	rcu_read_unlock();
+}
+
+/* Try to figure out where we are happy to become primary.
+   This is unsed by the crm-fence-peer mechanism
+*/
+static u64 up_to_date_nodes(struct drbd_device *device, bool op_is_fence)
+{
+	struct drbd_resource *resource = device->resource;
+	const int my_node_id = resource->res_opts.node_id;
+	u64 mask = NODE_MASK(my_node_id);
+
+	if (resource->role[NOW] == R_PRIMARY || op_is_fence) {
+		struct drbd_peer_device *peer_device;
+
+		rcu_read_lock();
+		for_each_peer_device_rcu(peer_device, device) {
+			enum drbd_disk_state pdsk = peer_device->disk_state[NOW];
+			if (pdsk == D_UP_TO_DATE)
+				mask |= NODE_MASK(peer_device->node_id);
+		}
+		rcu_read_unlock();
+	} else if (device->disk_state[NOW] == D_UP_TO_DATE) {
+		struct drbd_peer_md *peer_md = device->ldev->md.peers;
+		int node_id;
+
+		for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+			struct drbd_peer_device *peer_device;
+			if (node_id == my_node_id)
+				continue;
 
-	switch (((struct sockaddr *)&connection->peer_addr)->sa_family) {
+			peer_device = peer_device_by_node_id(device, node_id);
+
+			if ((peer_device && peer_device->disk_state[NOW] == D_UP_TO_DATE) ||
+			    (peer_md[node_id].flags & MDF_NODE_EXISTS &&
+			     peer_md[node_id].bitmap_uuid == 0))
+				mask |= NODE_MASK(node_id);
+		}
+	} else
+		  mask = 0;
+
+	return mask;
+}
+
+/* Buffer to construct the environment of a user-space helper in. */
+struct env {
+	char *buffer;
+	int size, pos;
+};
+
+/* Print into an env buffer. */
+static __printf(2, 3) int env_print(struct env *env, const char *fmt, ...)
+{
+	va_list args;
+	int pos, ret;
+
+	pos = env->pos;
+	if (pos < 0)
+		return pos;
+	va_start(args, fmt);
+	ret = vsnprintf(env->buffer + pos, env->size - pos, fmt, args);
+	va_end(args);
+	if (ret < 0) {
+		env->pos = ret;
+		goto out;
+	}
+	if (ret >= env->size - pos) {
+		ret = env->pos = -ENOMEM;
+		goto out;
+	}
+	env->pos += ret + 1;
+    out:
+	return ret;
+}
+
+/* Put env variables for an address into an env buffer. */
+static void env_print_address(struct env *env, const char *prefix,
+			      struct sockaddr_storage *storage)
+{
+	const char *afs;
+
+	switch (storage->ss_family) {
 	case AF_INET6:
 		afs = "ipv6";
-		snprintf(envp[4], 60, "DRBD_PEER_ADDRESS=%pI6",
-			 &((struct sockaddr_in6 *)&connection->peer_addr)->sin6_addr);
+		env_print(env, "%sADDRESS=%pI6", prefix,
+			  &((struct sockaddr_in6 *)storage)->sin6_addr);
 		break;
 	case AF_INET:
 		afs = "ipv4";
-		snprintf(envp[4], 60, "DRBD_PEER_ADDRESS=%pI4",
-			 &((struct sockaddr_in *)&connection->peer_addr)->sin_addr);
+		env_print(env, "%sADDRESS=%pI4", prefix,
+			  &((struct sockaddr_in *)storage)->sin_addr);
 		break;
 	default:
 		afs = "ssocks";
-		snprintf(envp[4], 60, "DRBD_PEER_ADDRESS=%pI4",
-			 &((struct sockaddr_in *)&connection->peer_addr)->sin_addr);
+		env_print(env, "%sADDRESS=%pI4", prefix,
+			  &((struct sockaddr_in *)storage)->sin_addr);
 	}
-	snprintf(envp[3], 20, "DRBD_PEER_AF=%s", afs);
+	env_print(env, "%sAF=%s", prefix, afs);
+}
+
+/* Construct char **envp inside an env buffer. */
+static char **make_envp(struct env *env)
+{
+	char **envp, *b;
+	unsigned int n;
+
+	if (env->pos < 0)
+		return NULL;
+	if (env->pos >= env->size)
+		goto out_nomem;
+	env->buffer[env->pos++] = 0;
+	for (b = env->buffer, n = 1; *b; n++)
+		b = strchr(b, 0) + 1;
+	if (env->size - env->pos < sizeof(envp) * n)
+		goto out_nomem;
+	envp = (char **)(env->buffer + env->size) - n;
+
+	for (b = env->buffer; *b; ) {
+		*envp++ = b;
+		b = strchr(b, 0) + 1;
+	}
+	*envp++ = NULL;
+	return envp - n;
+
+    out_nomem:
+	env->pos = -ENOMEM;
+	return NULL;
 }
 
-int drbd_khelper(struct drbd_device *device, char *cmd)
+/* Macro refers to local variables peer_device, device and connection! */
+#define magic_printk(level, fmt, args...)				\
+	do {								\
+		if (peer_device)					\
+			drbd_printk(NOLIMIT, level, peer_device, fmt, args);	\
+		else if (device)					\
+			drbd_printk(NOLIMIT, level, device, fmt, args);	\
+		else							\
+			drbd_printk(NOLIMIT, level, connection, fmt, args);	\
+	} while (0)
+
+static int drbd_khelper(struct drbd_device *device, struct drbd_connection *connection, char *cmd)
 {
-	char *envp[] = { "HOME=/",
-			"TERM=linux",
-			"PATH=/sbin:/usr/sbin:/bin:/usr/bin",
-			 (char[20]) { }, /* address family */
-			 (char[60]) { }, /* address */
-			NULL };
-	char mb[14];
-	char *argv[] = {drbd_usermode_helper, cmd, mb, NULL };
-	struct drbd_connection *connection = first_peer_device(device)->connection;
-	struct sib_info sib;
+	struct drbd_resource *resource = device ? device->resource : connection->resource;
+	char *argv[] = { drbd_usermode_helper, cmd, resource->name, NULL };
+	struct drbd_peer_device *peer_device = NULL;
+	struct env env = { .size = PAGE_SIZE };
+	char **envp;
 	int ret;
 
-	if (current == connection->worker.task)
-		set_bit(CALLBACK_PENDING, &connection->flags);
+    enlarge_buffer:
+	env.buffer = (char *)__get_free_pages(GFP_NOIO, get_order(env.size));
+	if (!env.buffer) {
+		ret = -ENOMEM;
+		goto out_err;
+	}
+	env.pos = 0;
+
+	rcu_read_lock();
+	env_print(&env, "HOME=/");
+	env_print(&env, "TERM=linux");
+	env_print(&env, "PATH=/sbin:/usr/sbin:/bin:/usr/bin");
+	if (device) {
+		env_print(&env, "DRBD_MINOR=%u", device->minor);
+		env_print(&env, "DRBD_VOLUME=%u", device->vnr);
+		if (get_ldev(device)) {
+			struct disk_conf *disk_conf =
+				rcu_dereference(device->ldev->disk_conf);
+			env_print(&env, "DRBD_BACKING_DEV=%s",
+				  disk_conf->backing_dev);
+			put_ldev(device);
+		}
+	}
+	if (connection) {
+		struct drbd_path *path;
+
+		rcu_read_lock();
+		path = first_path(connection);
+		if (path) {
+			/* TO BE DELETED */
+			env_print_address(&env, "DRBD_MY_", &path->my_addr);
+			env_print_address(&env, "DRBD_PEER_", &path->peer_addr);
+		}
+		rcu_read_unlock();
+
+		env_print(&env, "DRBD_PEER_NODE_ID=%u", connection->peer_node_id);
+		env_print(&env, "DRBD_CSTATE=%s", drbd_conn_str(connection->cstate[NOW]));
+	}
+	if (connection && !device) {
+		struct drbd_peer_device *peer_device;
+		int vnr;
+
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			struct drbd_device *device = peer_device->device;
+
+			env_print(&env, "DRBD_MINOR_%u=%u",
+				  vnr, peer_device->device->minor);
+			if (get_ldev(device)) {
+				struct disk_conf *disk_conf =
+					rcu_dereference(device->ldev->disk_conf);
+				env_print(&env, "DRBD_BACKING_DEV_%u=%s",
+					  vnr, disk_conf->backing_dev);
+				put_ldev(device);
+			}
+		}
+	}
+	rcu_read_unlock();
+
+	if (strstr(cmd, "fence")) {
+		bool op_is_fence = strcmp(cmd, "fence-peer") == 0;
+		struct drbd_peer_device *peer_device;
+		u64 mask = -1ULL;
+		int vnr;
+
+		idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+			struct drbd_device *device = peer_device->device;
+
+			if (get_ldev(device)) {
+				u64 m = up_to_date_nodes(device, op_is_fence);
+				if (m)
+					mask &= m;
+				put_ldev(device);
+				/* Yes we outright ignore volumes that are not up-to-date
+				   on a single node. */
+			}
+		}
+		env_print(&env, "UP_TO_DATE_NODES=0x%08llX", mask);
+	}
+
+	envp = make_envp(&env);
+	if (!envp) {
+		if (env.pos == -ENOMEM) {
+			free_pages((unsigned long)env.buffer, get_order(env.size));
+			env.size += PAGE_SIZE;
+			goto enlarge_buffer;
+		}
+		ret = env.pos;
+		goto out_err;
+	}
 
-	snprintf(mb, 14, "minor-%d", device_to_minor(device));
-	setup_khelper_env(connection, envp);
+	if (current == resource->worker.task)
+		set_bit(CALLBACK_PENDING, &resource->flags);
 
 	/* The helper may take some time.
 	 * write out any unsynced meta data changes now */
-	drbd_md_sync(device);
+	if (device)
+		drbd_md_sync_if_dirty(device);
+	else if (connection)
+		conn_md_sync(connection);
+
+	if (connection && device)
+		peer_device = conn_peer_device(connection, device->vnr);
 
-	drbd_info(device, "helper command: %s %s %s\n", drbd_usermode_helper, cmd, mb);
-	sib.sib_reason = SIB_HELPER_PRE;
-	sib.helper_name = cmd;
-	drbd_bcast_event(device, &sib);
+	magic_printk(KERN_INFO, "helper command: %s %s\n", drbd_usermode_helper, cmd);
 	notify_helper(NOTIFY_CALL, device, connection, cmd, 0);
 	ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
 	if (ret)
-		drbd_warn(device, "helper command: %s %s %s exit code %u (0x%x)\n",
-				drbd_usermode_helper, cmd, mb,
-				(ret >> 8) & 0xff, ret);
+		magic_printk(KERN_WARNING,
+			     "helper command: %s %s exit code %u (0x%x)\n",
+			     drbd_usermode_helper, cmd,
+			     (ret >> 8) & 0xff, ret);
 	else
-		drbd_info(device, "helper command: %s %s %s exit code %u (0x%x)\n",
-				drbd_usermode_helper, cmd, mb,
-				(ret >> 8) & 0xff, ret);
-	sib.sib_reason = SIB_HELPER_POST;
-	sib.helper_exit_code = ret;
-	drbd_bcast_event(device, &sib);
+		magic_printk(KERN_INFO,
+			     "helper command: %s %s exit code 0\n",
+			     drbd_usermode_helper, cmd);
 	notify_helper(NOTIFY_RESPONSE, device, connection, cmd, ret);
 
-	if (current == connection->worker.task)
-		clear_bit(CALLBACK_PENDING, &connection->flags);
+	if (current == resource->worker.task)
+		clear_bit(CALLBACK_PENDING, &resource->flags);
 
 	if (ret < 0) /* Ignore any ERRNOs we got. */
 		ret = 0;
 
+	free_pages((unsigned long)env.buffer, get_order(env.size));
 	return ret;
-}
-
-enum drbd_peer_state conn_khelper(struct drbd_connection *connection, char *cmd)
-{
-	char *envp[] = { "HOME=/",
-			"TERM=linux",
-			"PATH=/sbin:/usr/sbin:/bin:/usr/bin",
-			 (char[20]) { }, /* address family */
-			 (char[60]) { }, /* address */
-			NULL };
-	char *resource_name = connection->resource->name;
-	char *argv[] = {drbd_usermode_helper, cmd, resource_name, NULL };
-	int ret;
 
-	setup_khelper_env(connection, envp);
-	conn_md_sync(connection);
-
-	drbd_info(connection, "helper command: %s %s %s\n", drbd_usermode_helper, cmd, resource_name);
-	/* TODO: conn_bcast_event() ?? */
-	notify_helper(NOTIFY_CALL, NULL, connection, cmd, 0);
+    out_err:
+	drbd_err(resource, "Could not call %s user-space helper: error %d"
+		 "out of memory\n", cmd, ret);
+	return 0;
+}
 
-	ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
-	if (ret)
-		drbd_warn(connection, "helper command: %s %s %s exit code %u (0x%x)\n",
-			  drbd_usermode_helper, cmd, resource_name,
-			  (ret >> 8) & 0xff, ret);
-	else
-		drbd_info(connection, "helper command: %s %s %s exit code %u (0x%x)\n",
-			  drbd_usermode_helper, cmd, resource_name,
-			  (ret >> 8) & 0xff, ret);
-	/* TODO: conn_bcast_event() ?? */
-	notify_helper(NOTIFY_RESPONSE, NULL, connection, cmd, ret);
+#undef magic_printk
 
-	if (ret < 0) /* Ignore any ERRNOs we got. */
-		ret = 0;
+int drbd_maybe_khelper(struct drbd_device *device, struct drbd_connection *connection, char *cmd)
+{
+	if (strcmp(drbd_usermode_helper, "disabled") == 0)
+		return DRBD_UMH_DISABLED;
 
-	return ret;
+	return drbd_khelper(device, connection, cmd);
 }
 
-static enum drbd_fencing_p highest_fencing_policy(struct drbd_connection *connection)
+static bool initial_states_pending(struct drbd_connection *connection)
 {
-	enum drbd_fencing_p fp = FP_NOT_AVAIL;
 	struct drbd_peer_device *peer_device;
 	int vnr;
+	bool pending = false;
 
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
-		if (get_ldev_if_state(device, D_CONSISTENT)) {
-			struct disk_conf *disk_conf =
-				rcu_dereference(peer_device->device->ldev->disk_conf);
-			fp = max_t(enum drbd_fencing_p, fp, disk_conf->fencing);
-			put_ldev(device);
+		if (test_bit(INITIAL_STATE_SENT, &peer_device->flags) &&
+		    peer_device->repl_state[NOW] == L_OFF) {
+			pending = true;
+			break;
 		}
 	}
 	rcu_read_unlock();
-
-	return fp;
+	return pending;
 }
 
-static bool resource_is_supended(struct drbd_resource *resource)
+static bool intentional_diskless(struct drbd_resource *resource)
 {
-	return resource->susp || resource->susp_fen || resource->susp_nod;
+	bool intentional_diskless = true;
+	struct drbd_device *device;
+	int vnr;
+
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		if (!device->device_conf.intentional_diskless) {
+			intentional_diskless = false;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return intentional_diskless;
 }
 
-bool conn_try_outdate_peer(struct drbd_connection *connection)
+static bool conn_try_outdate_peer(struct drbd_connection *connection, const char *tag)
 {
-	struct drbd_resource * const resource = connection->resource;
-	unsigned int connect_cnt;
-	union drbd_state mask = { };
-	union drbd_state val = { };
-	enum drbd_fencing_p fp;
+	struct drbd_resource *resource = connection->resource;
+	unsigned long last_reconnect_jif;
+	enum drbd_fencing_policy fencing_policy;
+	enum drbd_disk_state disk_state;
 	char *ex_to_string;
 	int r;
+	unsigned long irq_flags;
 
-	spin_lock_irq(&resource->req_lock);
-	if (connection->cstate >= C_WF_REPORT_PARAMS) {
-		drbd_err(connection, "Expected cstate < C_WF_REPORT_PARAMS\n");
-		spin_unlock_irq(&resource->req_lock);
+	read_lock_irq(&resource->state_rwlock);
+	if (connection->cstate[NOW] >= C_CONNECTED) {
+		drbd_err(connection, "Expected cstate < C_CONNECTED\n");
+		read_unlock_irq(&resource->state_rwlock);
 		return false;
 	}
 
-	connect_cnt = connection->connect_cnt;
-	spin_unlock_irq(&resource->req_lock);
-
-	fp = highest_fencing_policy(connection);
-	switch (fp) {
-	case FP_NOT_AVAIL:
-		drbd_warn(connection, "Not fencing peer, I'm not even Consistent myself.\n");
-		spin_lock_irq(&resource->req_lock);
-		if (connection->cstate < C_WF_REPORT_PARAMS) {
-			_conn_request_state(connection,
-					    (union drbd_state) { { .susp_fen = 1 } },
-					    (union drbd_state) { { .susp_fen = 0 } },
-					    CS_VERBOSE | CS_HARD | CS_DC_SUSP);
-			/* We are no longer suspended due to the fencing policy.
-			 * We may still be suspended due to the on-no-data-accessible policy.
-			 * If that was OND_IO_ERROR, fail pending requests. */
-			if (!resource_is_supended(resource))
-				_tl_restart(connection, CONNECTION_LOST_WHILE_PENDING);
-		}
-		/* Else: in case we raced with a connection handshake,
-		 * let the handshake figure out if we maybe can RESEND,
-		 * and do not resume/fail pending requests here.
-		 * Worst case is we stay suspended for now, which may be
-		 * resolved by either re-establishing the replication link, or
-		 * the next link failure, or eventually the administrator.  */
-		spin_unlock_irq(&resource->req_lock);
+	last_reconnect_jif = connection->last_reconnect_jif;
+
+	disk_state = conn_highest_disk(connection);
+	if (disk_state < D_CONSISTENT &&
+	    !(disk_state == D_DISKLESS && intentional_diskless(resource))) {
+		begin_state_change_locked(resource, CS_VERBOSE | CS_HARD);
+		__change_io_susp_fencing(connection, false);
+		end_state_change_locked(resource, tag);
+		read_unlock_irq(&resource->state_rwlock);
 		return false;
+	}
+	read_unlock_irq(&resource->state_rwlock);
 
-	case FP_DONT_CARE:
+	fencing_policy = connection->fencing_policy;
+	if (fencing_policy == FP_DONT_CARE)
 		return true;
-	default: ;
-	}
 
-	r = conn_khelper(connection, "fence-peer");
+	r = drbd_maybe_khelper(NULL, connection, "fence-peer");
+	if (r == DRBD_UMH_DISABLED)
+		return true;
 
+	begin_state_change(resource, &irq_flags, CS_VERBOSE);
 	switch ((r>>8) & 0xff) {
 	case P_INCONSISTENT: /* peer is inconsistent */
 		ex_to_string = "peer is inconsistent or worse";
-		mask.pdsk = D_MASK;
-		val.pdsk = D_INCONSISTENT;
+		__downgrade_peer_disk_states(connection, D_INCONSISTENT);
 		break;
 	case P_OUTDATED: /* peer got outdated, or was already outdated */
 		ex_to_string = "peer was fenced";
-		mask.pdsk = D_MASK;
-		val.pdsk = D_OUTDATED;
+		__downgrade_peer_disk_states(connection, D_OUTDATED);
 		break;
 	case P_DOWN: /* peer was down */
 		if (conn_highest_disk(connection) == D_UP_TO_DATE) {
 			/* we will(have) create(d) a new UUID anyways... */
 			ex_to_string = "peer is unreachable, assumed to be dead";
-			mask.pdsk = D_MASK;
-			val.pdsk = D_OUTDATED;
+			__downgrade_peer_disk_states(connection, D_OUTDATED);
 		} else {
 			ex_to_string = "peer unreachable, doing nothing since disk != UpToDate";
 		}
@@ -544,42 +835,44 @@ bool conn_try_outdate_peer(struct drbd_connection *connection)
 		 * become R_PRIMARY, but finds the other peer being active. */
 		ex_to_string = "peer is active";
 		drbd_warn(connection, "Peer is primary, outdating myself.\n");
-		mask.disk = D_MASK;
-		val.disk = D_OUTDATED;
+		__downgrade_disk_states(resource, D_OUTDATED);
 		break;
 	case P_FENCING:
 		/* THINK: do we need to handle this
-		 * like case 4, or more like case 5? */
-		if (fp != FP_STONITH)
+		 * like case 4 P_OUTDATED, or more like case 5 P_DOWN? */
+		if (fencing_policy != FP_STONITH)
 			drbd_err(connection, "fence-peer() = 7 && fencing != Stonith !!!\n");
 		ex_to_string = "peer was stonithed";
-		mask.pdsk = D_MASK;
-		val.pdsk = D_OUTDATED;
+		__downgrade_peer_disk_states(connection, D_OUTDATED);
 		break;
 	default:
 		/* The script is broken ... */
 		drbd_err(connection, "fence-peer helper broken, returned %d\n", (r>>8)&0xff);
+		abort_state_change(resource, &irq_flags);
 		return false; /* Eventually leave IO frozen */
 	}
 
 	drbd_info(connection, "fence-peer helper returned %d (%s)\n",
 		  (r>>8) & 0xff, ex_to_string);
 
-	/* Not using
-	   conn_request_state(connection, mask, val, CS_VERBOSE);
-	   here, because we might were able to re-establish the connection in the
-	   meantime. */
-	spin_lock_irq(&resource->req_lock);
-	if (connection->cstate < C_WF_REPORT_PARAMS && !test_bit(STATE_SENT, &connection->flags)) {
-		if (connection->connect_cnt != connect_cnt)
-			/* In case the connection was established and droped
-			   while the fence-peer handler was running, ignore it */
-			drbd_info(connection, "Ignoring fence-peer exit code\n");
-		else
-			_conn_request_state(connection, mask, val, CS_VERBOSE);
+	if (connection->cstate[NOW] >= C_CONNECTED ||
+	    initial_states_pending(connection)) {
+		/* connection re-established; do not fence */
+		goto abort;
+	}
+	if (connection->last_reconnect_jif != last_reconnect_jif) {
+		/* In case the connection was established and dropped
+		   while the fence-peer handler was running, ignore it */
+		drbd_info(connection, "Ignoring fence-peer exit code\n");
+		goto abort;
 	}
-	spin_unlock_irq(&resource->req_lock);
 
+	end_state_change(resource, &irq_flags, tag);
+
+	goto out;
+ abort:
+	abort_state_change(resource, &irq_flags);
+ out:
 	return conn_highest_pdsk(connection) <= D_OUTDATED;
 }
 
@@ -587,7 +880,7 @@ static int _try_outdate_peer_async(void *data)
 {
 	struct drbd_connection *connection = (struct drbd_connection *)data;
 
-	conn_try_outdate_peer(connection);
+	conn_try_outdate_peer(connection, "outdate-async");
 
 	kref_put(&connection->kref, drbd_destroy_connection);
 	return 0;
@@ -611,151 +904,451 @@ void conn_try_outdate_peer_async(struct drbd_connection *connection)
 	}
 }
 
-enum drbd_state_rv
-drbd_set_role(struct drbd_device *const device, enum drbd_role new_role, int force)
+bool barrier_pending(struct drbd_resource *resource)
 {
-	struct drbd_peer_device *const peer_device = first_peer_device(device);
-	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
-	const int max_tries = 4;
-	enum drbd_state_rv rv = SS_UNKNOWN_ERROR;
-	struct net_conf *nc;
-	int try = 0;
-	int forced = 0;
-	union drbd_state mask, val;
+	struct drbd_connection *connection;
+	bool rv = false;
 
-	if (new_role == R_PRIMARY) {
-		struct drbd_connection *connection;
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		if (test_bit(BARRIER_ACK_PENDING, &connection->flags)) {
+			rv = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
 
-		/* Detect dead peers as soon as possible.  */
+	return rv;
+}
 
-		rcu_read_lock();
-		for_each_connection(connection, device->resource)
-			request_ping(connection);
-		rcu_read_unlock();
+static int count_up_to_date(struct drbd_resource *resource)
+{
+	struct drbd_device *device;
+	int vnr, nr_up_to_date = 0;
+
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		enum drbd_disk_state disk_state = device->disk_state[NOW];
+		if (disk_state == D_UP_TO_DATE)
+			nr_up_to_date++;
 	}
+	rcu_read_unlock();
+	return nr_up_to_date;
+}
+
+static bool reconciliation_ongoing(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device;
 
-	mutex_lock(device->state_mutex);
+	for_each_peer_device_rcu(peer_device, device) {
+		if (test_bit(RECONCILIATION_RESYNC, &peer_device->flags))
+			return true;
+	}
+	return false;
+}
 
-	mask.i = 0; mask.role = R_MASK;
-	val.i  = 0; val.role  = new_role;
+static bool any_peer_is_consistent(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device;
 
-	while (try++ < max_tries) {
-		rv = _drbd_request_state_holding_state_mutex(device, mask, val, CS_WAIT_COMPLETE);
+	for_each_peer_device_rcu(peer_device, device) {
+		if (peer_device->disk_state[NOW] == D_CONSISTENT)
+			return true;
+	}
+	return false;
+}
+/* reconciliation resyncs finished and I know if I am D_UP_TO_DATE or D_OUTDATED */
+static bool after_primary_lost_events_settled(struct drbd_resource *resource)
+{
+	struct drbd_device *device;
+	int vnr;
 
-		/* in case we first succeeded to outdate,
-		 * but now suddenly could establish a connection */
-		if (rv == SS_CW_FAILED_BY_PEER && mask.pdsk != 0) {
-			val.pdsk = 0;
-			mask.pdsk = 0;
-			continue;
-		}
+	if (test_bit(TRY_BECOME_UP_TO_DATE_PENDING, &resource->flags))
+		return false;
 
-		if (rv == SS_NO_UP_TO_DATE_DISK && force &&
-		    (device->state.disk < D_UP_TO_DATE &&
-		     device->state.disk >= D_INCONSISTENT)) {
-			mask.disk = D_MASK;
-			val.disk  = D_UP_TO_DATE;
-			forced = 1;
-			continue;
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		enum drbd_disk_state disk_state = device->disk_state[NOW];
+		if (disk_state == D_CONSISTENT ||
+		    any_peer_is_consistent(device) ||
+		    (reconciliation_ongoing(device) &&
+		     (disk_state == D_OUTDATED || disk_state == D_INCONSISTENT))) {
+			rcu_read_unlock();
+			return false;
 		}
+	}
+	rcu_read_unlock();
+	return true;
+}
 
-		if (rv == SS_NO_UP_TO_DATE_DISK &&
-		    device->state.disk == D_CONSISTENT && mask.pdsk == 0) {
-			D_ASSERT(device, device->state.pdsk == D_UNKNOWN);
+static long drbd_max_ping_timeout(struct drbd_resource *resource)
+{
+	struct drbd_connection *connection;
+	long ping_timeout = 0;
 
-			if (conn_try_outdate_peer(connection)) {
-				val.disk = D_UP_TO_DATE;
-				mask.disk = D_MASK;
-			}
-			continue;
-		}
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource)
+		ping_timeout = max(ping_timeout, (long) connection->transport.net_conf->ping_timeo);
+	rcu_read_unlock();
 
-		if (rv == SS_NOTHING_TO_DO)
-			goto out;
-		if (rv == SS_PRIMARY_NOP && mask.pdsk == 0) {
-			if (!conn_try_outdate_peer(connection) && force) {
-				drbd_warn(device, "Forced into split brain situation!\n");
-				mask.pdsk = D_MASK;
-				val.pdsk  = D_OUTDATED;
+	return ping_timeout;
+}
 
+static bool wait_up_to_date(struct drbd_resource *resource)
+{
+	/*
+	 * Adding ping-timeout is necessary to ensure that we do not proceed
+	 * while the loss of some connection has not yet been detected. Ideally
+	 * we would use the maximum ping timeout from the entire cluster. Since
+	 * we do not have that, use the maximum from our connections on a
+	 * best-effort basis.
+	 */
+	long timeout = (resource->res_opts.auto_promote_timeout +
+			drbd_max_ping_timeout(resource)) * HZ / 10;
+	int initial_up_to_date, up_to_date;
+
+	initial_up_to_date = count_up_to_date(resource);
+	wait_event_interruptible_timeout(resource->state_wait,
+					 after_primary_lost_events_settled(resource),
+					 timeout);
+	up_to_date = count_up_to_date(resource);
+	return up_to_date > initial_up_to_date;
+}
+
+enum drbd_state_rv
+drbd_set_role(struct drbd_resource *resource, enum drbd_role role, bool force, const char *tag,
+		struct sk_buff *reply_skb)
+{
+	struct drbd_device *device;
+	int vnr, try = 0;
+	const int max_tries = 4;
+	enum drbd_state_rv rv = SS_UNKNOWN_ERROR;
+	bool retried_ss_two_primaries = false, retried_ss_primary_nop = false;
+	const char *err_str = NULL;
+	enum chg_state_flags flags = CS_ALREADY_SERIALIZED | CS_DONT_RETRY | CS_WAIT_COMPLETE;
+	bool fenced_peers = false;
+
+retry:
+
+	if (role == R_PRIMARY) {
+		drbd_check_peers(resource);
+		wait_up_to_date(resource);
+	}
+	down(&resource->state_sem);
+
+	while (try++ < max_tries) {
+		if (try == max_tries - 1)
+			flags |= CS_VERBOSE;
+
+		if (err_str) {
+			kfree(err_str);
+			err_str = NULL;
+		}
+		rv = stable_state_change(resource,
+			change_role(resource, role, flags, tag, &err_str));
+
+		if (rv == SS_TIMEOUT || rv == SS_CONCURRENT_ST_CHG) {
+			long timeout = twopc_retry_timeout(resource, try);
+			/* It might be that the receiver tries to start resync, and
+			   sleeps on state_sem. Give it up, and retry in a short
+			   while */
+			up(&resource->state_sem);
+			schedule_timeout_interruptible(timeout);
+			goto retry;
+		}
+		/* in case we first succeeded to outdate,
+		 * but now suddenly could establish a connection */
+		if (rv == SS_CW_FAILED_BY_PEER && fenced_peers) {
+			flags &= ~CS_FP_LOCAL_UP_TO_DATE;
+			continue;
+		}
+
+		if (rv == SS_NO_UP_TO_DATE_DISK && force && !(flags & CS_FP_LOCAL_UP_TO_DATE)) {
+			flags |= CS_FP_LOCAL_UP_TO_DATE;
+			continue;
+		}
+
+		if (rv == SS_DEVICE_IN_USE && force && !(flags & CS_FS_IGN_OPENERS)) {
+			drbd_warn(resource, "forced demotion\n");
+			flags |= CS_FS_IGN_OPENERS; /* this sets resource->fail_io[NOW] */
+			continue;
+		}
+
+		if (rv == SS_NO_UP_TO_DATE_DISK) {
+			bool a_disk_became_up_to_date;
+
+			/* need to give up state_sem, see try_become_up_to_date(); */
+			up(&resource->state_sem);
+			drbd_flush_workqueue(&resource->work);
+			a_disk_became_up_to_date = wait_up_to_date(resource);
+			down(&resource->state_sem);
+			if (a_disk_became_up_to_date)
+				continue;
+			/* fall through into possible fence-peer or even force cases */
+		}
+
+		if (rv == SS_NO_UP_TO_DATE_DISK && !(flags & CS_FP_LOCAL_UP_TO_DATE)) {
+			struct drbd_connection *connection;
+			bool any_fencing_failed = false;
+			u64 im;
+
+			fenced_peers = false;
+			up(&resource->state_sem); /* Allow connect while fencing */
+			for_each_connection_ref(connection, im, resource) {
+				struct drbd_peer_device *peer_device;
+				int vnr;
+
+				if (conn_highest_pdsk(connection) != D_UNKNOWN)
+					continue;
+
+				idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+					struct drbd_device *device = peer_device->device;
+
+					if (device->disk_state[NOW] != D_CONSISTENT)
+						continue;
+
+					if (conn_try_outdate_peer(connection, tag))
+						fenced_peers = true;
+					else
+						any_fencing_failed = true;
+				}
+			}
+			down(&resource->state_sem);
+			if (fenced_peers && !any_fencing_failed) {
+				flags |= CS_FP_LOCAL_UP_TO_DATE;
+				continue;
 			}
+		}
+
+		/* In case the disk is Consistent and fencing is enabled, and fencing did not work
+		 * but the user forces promote..., try it pretending we fenced the peers */
+		if (rv == SS_PRIMARY_NOP && force &&
+		    (flags & CS_FP_LOCAL_UP_TO_DATE) && !(flags & CS_FP_OUTDATE_PEERS)) {
+			flags |= CS_FP_OUTDATE_PEERS;
+			continue;
+		}
+
+		if (rv == SS_NO_QUORUM && force && !(flags & CS_FP_OUTDATE_PEERS)) {
+			flags |= CS_FP_OUTDATE_PEERS;
 			continue;
 		}
-		if (rv == SS_TWO_PRIMARIES) {
-			/* Maybe the peer is detected as dead very soon...
-			   retry at most once more in this case. */
-			if (try < max_tries) {
-				int timeo;
-				try = max_tries - 1;
-				rcu_read_lock();
-				nc = rcu_dereference(connection->net_conf);
-				timeo = nc ? (nc->ping_timeo + 1) * HZ / 10 : 1;
-				rcu_read_unlock();
-				schedule_timeout_interruptible(timeo);
+
+		if (rv == SS_NOTHING_TO_DO)
+			goto out;
+		if (rv == SS_PRIMARY_NOP && !retried_ss_primary_nop) {
+			struct drbd_connection *connection;
+			u64 im;
+
+			retried_ss_primary_nop = true;
+
+			up(&resource->state_sem); /* Allow connect while fencing */
+			for_each_connection_ref(connection, im, resource) {
+				bool outdated_peer = conn_try_outdate_peer(connection, tag);
+				if (!outdated_peer && force) {
+					drbd_warn(connection, "Forced into split brain situation!\n");
+					flags |= CS_FP_LOCAL_UP_TO_DATE;
+				}
 			}
+			down(&resource->state_sem);
 			continue;
 		}
-		if (rv < SS_SUCCESS) {
-			rv = _drbd_request_state(device, mask, val,
-						CS_VERBOSE + CS_WAIT_COMPLETE);
-			if (rv < SS_SUCCESS)
-				goto out;
+
+		if (rv == SS_TWO_PRIMARIES && !retried_ss_two_primaries) {
+			struct drbd_connection *connection;
+			struct net_conf *nc;
+			int timeout = 0;
+
+			retried_ss_two_primaries = true;
+
+			/*
+			 * Catch the case where we discover that the other
+			 * primary has died soon after the state change
+			 * failure: retry once after a short timeout.
+			 */
+
+			rcu_read_lock();
+			for_each_connection_rcu(connection, resource) {
+				nc = rcu_dereference(connection->transport.net_conf);
+				if (nc && nc->ping_timeo > timeout)
+					timeout = nc->ping_timeo;
+			}
+			rcu_read_unlock();
+			timeout = timeout * HZ / 10;
+			if (timeout == 0)
+				timeout = 1;
+
+			up(&resource->state_sem);
+			schedule_timeout_interruptible(timeout);
+			goto retry;
 		}
+
 		break;
 	}
 
 	if (rv < SS_SUCCESS)
 		goto out;
 
-	if (forced)
-		drbd_warn(device, "Forced to consider local data as UpToDate!\n");
-
-	/* Wait until nothing is on the fly :) */
-	wait_event(device->misc_wait, atomic_read(&device->ap_pending_cnt) == 0);
-
-	/* FIXME also wait for all pending P_BARRIER_ACK? */
+	if (force) {
+		if (flags & CS_FP_LOCAL_UP_TO_DATE)
+			drbd_warn(resource, "Forced to consider local data as UpToDate!\n");
+		if (flags & CS_FP_OUTDATE_PEERS)
+			drbd_warn(resource, "Forced to consider peers as Outdated!\n");
+	}
 
-	if (new_role == R_SECONDARY) {
-		if (get_ldev(device)) {
-			device->ldev->md.uuid[UI_CURRENT] &= ~(u64)1;
-			put_ldev(device);
+	if (role == R_SECONDARY) {
+		idr_for_each_entry(&resource->devices, device, vnr) {
+			if (get_ldev(device)) {
+				device->ldev->md.current_uuid &= ~UUID_PRIMARY;
+				put_ldev(device);
+			}
 		}
 	} else {
-		mutex_lock(&device->resource->conf_update);
-		nc = connection->net_conf;
-		if (nc)
-			nc->discard_my_data = 0; /* without copy; single bit op is atomic */
-		mutex_unlock(&device->resource->conf_update);
+		struct drbd_connection *connection;
 
-		if (get_ldev(device)) {
-			if (((device->state.conn < C_CONNECTED ||
-			       device->state.pdsk <= D_FAILED)
-			      && device->ldev->md.uuid[UI_BITMAP] == 0) || forced)
-				drbd_uuid_new_current(device);
+		rcu_read_lock();
+		for_each_connection_rcu(connection, resource)
+			clear_bit(CONN_DISCARD_MY_DATA, &connection->flags);
+		rcu_read_unlock();
 
-			device->ldev->md.uuid[UI_CURRENT] |=  (u64)1;
-			put_ldev(device);
+		idr_for_each_entry(&resource->devices, device, vnr) {
+			if (flags & CS_FP_LOCAL_UP_TO_DATE) {
+				drbd_uuid_new_current(device, true);
+				clear_bit(NEW_CUR_UUID, &device->flags);
+			}
 		}
 	}
 
-	/* writeout of activity log covered areas of the bitmap
-	 * to stable storage done in after state change already */
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		 struct drbd_peer_device *peer_device;
+		 u64 im;
+
+		 for_each_peer_device_ref(peer_device, im, device) {
+			/* writeout of activity log covered areas of the bitmap
+			 * to stable storage done in after state change already */
 
-	if (device->state.conn >= C_WF_REPORT_PARAMS) {
-		/* if this was forced, we should consider sync */
-		if (forced)
-			drbd_send_uuids(peer_device);
-		drbd_send_current_state(peer_device);
+			if (peer_device->connection->cstate[NOW] == C_CONNECTED) {
+				/* if this was forced, we should consider sync */
+				if (flags & CS_FP_LOCAL_UP_TO_DATE) {
+					drbd_send_uuids(peer_device, 0, 0);
+					set_bit(CONSIDER_RESYNC, &peer_device->flags);
+				}
+				drbd_send_current_state(peer_device);
+			}
+		}
+	}
+
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		drbd_md_sync_if_dirty(device);
+		if (!resource->res_opts.auto_promote && role == R_PRIMARY)
+			kobject_uevent(&disk_to_dev(device->vdisk)->kobj, KOBJ_CHANGE);
 	}
 
-	drbd_md_sync(device);
-	set_disk_ro(device->vdisk, new_role == R_SECONDARY);
-	kobject_uevent(&disk_to_dev(device->vdisk)->kobj, KOBJ_CHANGE);
 out:
-	mutex_unlock(device->state_mutex);
+	up(&resource->state_sem);
+	if (err_str) {
+		drbd_err(resource, "%s", err_str);
+		if (reply_skb)
+			drbd_msg_put_info(reply_skb, err_str);
+		kfree(err_str);
+	}
 	return rv;
 }
 
+/* suggested buffer size: 128 byte */
+void youngest_and_oldest_opener_to_str(struct drbd_device *device, char *buf, size_t len)
+{
+	struct timespec64 ts;
+	struct tm tm;
+	struct opener *first;
+	struct opener *last;
+	int cnt;
+
+	buf[0] = '\0';
+	/* Do we have opener information? */
+	if (!device->open_cnt)
+		return;
+	cnt = snprintf(buf, len, " open_cnt:%d", device->open_cnt);
+	if (cnt > 0 && cnt < len) {
+		buf += cnt;
+		len -= cnt;
+	} else
+		return;
+	spin_lock(&device->openers_lock);
+	if (!list_empty(&device->openers)) {
+		first = list_first_entry(&device->openers, struct opener, list);
+		ts = ktime_to_timespec64(first->opened);
+		time64_to_tm(ts.tv_sec, -sys_tz.tz_minuteswest * 60, &tm);
+		cnt = snprintf(buf, len, " [%s:%d:%04ld-%02d-%02d_%02d:%02d:%02d.%03ld]",
+			      first->comm, first->pid,
+			      tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			      tm.tm_hour, tm.tm_min, tm.tm_sec, ts.tv_nsec / NSEC_PER_MSEC);
+		last = list_last_entry(&device->openers, struct opener, list);
+		if (cnt > 0 && cnt < len && last != first) {
+			/* append, overwriting the previously added ']' */
+			buf += cnt-1;
+			len -= cnt-1;
+			ts = ktime_to_timespec64(last->opened);
+			time64_to_tm(ts.tv_sec, -sys_tz.tz_minuteswest * 60, &tm);
+			snprintf(buf, len, "%s%s:%d:%04ld-%02d-%02d_%02d:%02d:%02d.%03ld]",
+			      device->open_cnt > 2 ? ", ..., " : ", ",
+			      last->comm, last->pid,
+			      tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			      tm.tm_hour, tm.tm_min, tm.tm_sec, ts.tv_nsec / NSEC_PER_MSEC);
+		}
+	}
+	spin_unlock(&device->openers_lock);
+}
+
+static int put_device_opener_info(struct drbd_device *device, struct sk_buff *reply_skb)
+{
+	struct timespec64 ts;
+	struct opener *o;
+	struct tm tm;
+	int cnt = 0;
+	char *dotdotdot = "";
+
+	spin_lock(&device->openers_lock);
+	if (!device->open_cnt) {
+		spin_unlock(&device->openers_lock);
+		return cnt;
+	}
+	drbd_msg_sprintf_info(reply_skb,
+		"/dev/drbd%d open_cnt:%d, writable:%d; list of openers follows",
+		device->minor, device->open_cnt, device->writable);
+	list_for_each_entry(o, &device->openers, list) {
+		ts = ktime_to_timespec64(o->opened);
+		time64_to_tm(ts.tv_sec, -sys_tz.tz_minuteswest * 60, &tm);
+
+		if (++cnt >= 10 && !list_is_last(&o->list, &device->openers)) {
+			o = list_last_entry(&device->openers, struct opener, list);
+			dotdotdot = "[...]\n";
+		}
+		drbd_msg_sprintf_info(reply_skb,
+			"%sdrbd%d opened by %s (pid %d) at %04ld-%02d-%02d %02d:%02d:%02d.%03ld",
+			dotdotdot,
+			device->minor, o->comm, o->pid,
+			tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			tm.tm_hour, tm.tm_min, tm.tm_sec,
+			ts.tv_nsec / NSEC_PER_MSEC);
+	}
+	spin_unlock(&device->openers_lock);
+	return cnt;
+}
+
+static void opener_info(struct drbd_resource *resource,
+			struct sk_buff *reply_skb,
+			enum drbd_state_rv rv)
+{
+	struct drbd_device *device;
+	int i;
+
+	if (rv != SS_DEVICE_IN_USE && rv != SS_NO_UP_TO_DATE_DISK)
+		return;
+
+	idr_for_each_entry(&resource->devices, device, i)
+		put_device_opener_info(device, reply_skb);
+}
+
 static const char *from_attrs_err_to_txt(int err)
 {
 	return	err == -ENOMSG ? "required attribute missing" :
@@ -764,20 +1357,21 @@ static const char *from_attrs_err_to_txt(int err)
 		"invalid attribute value";
 }
 
-int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
+	struct drbd_resource *resource;
 	struct set_role_parms parms;
-	int err;
-	enum drbd_ret_code retcode;
 	enum drbd_state_rv rv;
+	enum drbd_ret_code retcode;
+	enum drbd_role new_role;
+	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	rv = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
 	if (!adm_ctx.reply_skb)
-		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
+		return rv;
 
+	resource = adm_ctx.resource;
 	memset(&parms, 0, sizeof(parms));
 	if (info->attrs[DRBD_NLA_SET_ROLE_PARMS]) {
 		err = set_role_parms_from_attrs(&parms, info);
@@ -787,16 +1381,28 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 			goto out;
 		}
 	}
-	genl_unlock();
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out;
+	}
 
-	if (info->genlhdr->cmd == DRBD_ADM_PRIMARY)
-		rv = drbd_set_role(adm_ctx.device, R_PRIMARY, parms.assume_uptodate);
-	else
-		rv = drbd_set_role(adm_ctx.device, R_SECONDARY, 0);
+	new_role = info->genlhdr->cmd == DRBD_ADM_PRIMARY ? R_PRIMARY : R_SECONDARY;
+	if (new_role == R_PRIMARY)
+		set_bit(EXPLICIT_PRIMARY, &resource->flags);
 
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	genl_lock();
+	rv = drbd_set_role(resource,
+				new_role,
+				parms.force,
+				new_role == R_PRIMARY ? "primary" : "secondary",
+				adm_ctx.reply_skb);
+
+	if (resource->role[NOW] != R_PRIMARY)
+		clear_bit(EXPLICIT_PRIMARY, &resource->flags);
+
+	if (rv == SS_DEVICE_IN_USE)
+		opener_info(resource, adm_ctx.reply_skb, rv);
+
+	mutex_unlock(&resource->adm_mutex);
 	drbd_adm_finish(&adm_ctx, info, rv);
 	return 0;
 out:
@@ -804,6 +1410,28 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
+u64 drbd_capacity_to_on_disk_bm_sect(u64 capacity_sect, const struct drbd_md *md)
+{
+	u64 bits, bytes;
+
+	/* round up storage sectors to full "bitmap sectors per bit", then
+	 * convert to number of bits needed, and round that up to 64bit words
+	 * to ease interoperability between 32bit and 64bit architectures.
+	 */
+	bits = ALIGN(sect_to_bit(
+			ALIGN(capacity_sect, sect_per_bit(md->bm_block_shift)),
+			md->bm_block_shift), 64);
+
+	/* convert to bytes, multiply by number of peers,
+	 * and, because we do all our meta data IO in 4k blocks,
+	 * round up to full 4k
+	 */
+	bytes = ALIGN(bits / 8 * md->max_peers, 4096);
+
+	/* convert to number of sectors */
+	return bytes >> 9;
+}
+
 /* Initializes the md.*_offset members, so we are able to find
  * the on disk meta data.
  *
@@ -823,10 +1451,9 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
  *  ==> bitmap sectors = Y = al_offset - bm_offset
  *
  *  Activity log size used to be fixed 32kB,
- *  but is about to become configurable.
+ *  but is actually al_stripes * al_stripe_size_4k.
  */
-static void drbd_md_set_sector_offsets(struct drbd_device *device,
-				       struct drbd_backing_dev *bdev)
+void drbd_md_set_sector_offsets(struct drbd_backing_dev *bdev)
 {
 	sector_t md_size_sect = 0;
 	unsigned int al_size_sect = bdev->md.al_size_4k * 8;
@@ -836,33 +1463,32 @@ static void drbd_md_set_sector_offsets(struct drbd_device *device,
 	switch (bdev->md.meta_dev_idx) {
 	default:
 		/* v07 style fixed size indexed meta data */
-		bdev->md.md_size_sect = MD_128MB_SECT;
-		bdev->md.al_offset = MD_4kB_SECT;
-		bdev->md.bm_offset = MD_4kB_SECT + al_size_sect;
+		/* FIXME we should drop support for this! */
+		bdev->md.md_size_sect = (128 << 20 >> 9);
+		bdev->md.al_offset = (4096 >> 9);
+		bdev->md.bm_offset = (4096 >> 9) + al_size_sect;
 		break;
 	case DRBD_MD_INDEX_FLEX_EXT:
 		/* just occupy the full device; unit: sectors */
 		bdev->md.md_size_sect = drbd_get_capacity(bdev->md_bdev);
-		bdev->md.al_offset = MD_4kB_SECT;
-		bdev->md.bm_offset = MD_4kB_SECT + al_size_sect;
+		bdev->md.al_offset = (4096 >> 9);
+		bdev->md.bm_offset = (4096 >> 9) + al_size_sect;
 		break;
 	case DRBD_MD_INDEX_INTERNAL:
 	case DRBD_MD_INDEX_FLEX_INT:
-		/* al size is still fixed */
 		bdev->md.al_offset = -al_size_sect;
-		/* we need (slightly less than) ~ this much bitmap sectors: */
-		md_size_sect = drbd_get_capacity(bdev->backing_bdev);
-		md_size_sect = ALIGN(md_size_sect, BM_SECT_PER_EXT);
-		md_size_sect = BM_SECT_TO_EXT(md_size_sect);
-		md_size_sect = ALIGN(md_size_sect, 8);
 
-		/* plus the "drbd meta data super block",
+		/* enough bitmap to cover the storage,
+		 * plus the "drbd meta data super block",
 		 * and the activity log; */
-		md_size_sect += MD_4kB_SECT + al_size_sect;
+		md_size_sect = drbd_capacity_to_on_disk_bm_sect(
+				drbd_get_capacity(bdev->backing_bdev),
+				&bdev->md)
+			+ (4096 >> 9) + al_size_sect;
 
 		bdev->md.md_size_sect = md_size_sect;
 		/* bitmap offset is adjusted by 'super' block size */
-		bdev->md.bm_offset   = -md_size_sect + MD_4kB_SECT;
+		bdev->md.bm_offset   = -md_size_sect + (4096 >> 9);
 		break;
 	}
 }
@@ -884,18 +1510,11 @@ char *ppsize(char *buf, unsigned long long size)
 	return buf;
 }
 
-/* there is still a theoretical deadlock when called from receiver
- * on an D_INCONSISTENT R_PRIMARY:
- *  remote READ does inc_ap_bio, receiver would need to receive answer
- *  packet from remote to dec_ap_bio again.
- *  receiver receive_sizes(), comes here,
- *  waits for ap_bio_cnt == 0. -> deadlock.
- * but this cannot happen, actually, because:
- *  R_PRIMARY D_INCONSISTENT, and peer's disk is unreachable
- *  (not connected, or bad/no disk on peer):
- *  see drbd_fail_request_early, ap_bio_cnt is zero.
- *  R_PRIMARY D_INCONSISTENT, and C_SYNC_TARGET:
- *  peer may not initiate a resize.
+/* The receiver may call drbd_suspend_io(device, WRITE_ONLY).
+ * It should not call drbd_suspend_io(device, READ_AND_WRITE) since
+ * if the node is an D_INCONSISTENT R_PRIMARY (L_SYNC_TARGET) it
+ * may need to issue remote READs. Those is turn need the receiver
+ * to complete. -> calling drbd_suspend_io(device, READ_AND_WRITE) deadlocks.
  */
 /* Note these are not to be confused with
  * drbd_adm_suspend_io/drbd_adm_resume_io,
@@ -905,12 +1524,12 @@ char *ppsize(char *buf, unsigned long long size)
  * and should be short-lived. */
 /* It needs to be a counter, since multiple threads might
    independently suspend and resume IO. */
-void drbd_suspend_io(struct drbd_device *device)
+void drbd_suspend_io(struct drbd_device *device, enum suspend_scope ss)
 {
 	atomic_inc(&device->suspend_cnt);
-	if (drbd_suspended(device))
-		return;
-	wait_event(device->misc_wait, !atomic_read(&device->ap_bio_cnt));
+	wait_event(device->misc_wait, drbd_suspended(device) ||
+		   (atomic_read(&device->ap_bio_cnt[WRITE]) +
+		    ss == READ_AND_WRITE ? atomic_read(&device->ap_bio_cnt[READ]) : 0) == 0);
 }
 
 void drbd_resume_io(struct drbd_device *device)
@@ -919,18 +1538,64 @@ void drbd_resume_io(struct drbd_device *device)
 		wake_up(&device->misc_wait);
 }
 
+/**
+ * effective_disk_size_determined()  -  is the effective disk size "fixed" already?
+ * @device: DRBD device.
+ *
+ * When a device is configured in a cluster, the size of the replicated disk is
+ * determined by the minimum size of the disks on all nodes.  Additional nodes
+ * can be added, and this can still change the effective size of the replicated
+ * disk.
+ *
+ * When the disk on any node becomes D_UP_TO_DATE, the effective disk size
+ * becomes "fixed".  It is written to the metadata so that it will not be
+ * forgotten across node restarts.  Further nodes can only be added if their
+ * disks are big enough.
+ */
+static bool effective_disk_size_determined(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device;
+	bool rv = false;
+
+	if (device->ldev->md.effective_size != 0)
+		return true;
+	if (device->disk_state[NOW] == D_UP_TO_DATE)
+		return true;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		if (peer_device->disk_state[NOW] == D_UP_TO_DATE) {
+			rv = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return rv;
+}
+
+void drbd_set_my_capacity(struct drbd_device *device, sector_t size)
+{
+	char ppb[10];
+
+	set_capacity_and_notify(device->vdisk, size);
+
+	drbd_info(device, "size = %s (%llu KB)\n",
+		ppsize(ppb, size>>1), (unsigned long long)size>>1);
+}
+
 /*
  * drbd_determine_dev_size() -  Sets the right device size obeying all constraints
  * @device:	DRBD device.
  *
- * Returns 0 on success, negative return values indicate errors.
  * You should call drbd_md_sync() after calling this function.
  */
 enum determine_dev_size
-drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct resize_parms *rs) __must_hold(local)
+drbd_determine_dev_size(struct drbd_device *device, sector_t peer_current_size,
+			enum dds_flags flags, struct resize_parms *rs)
 {
 	struct md_offsets_and_sizes {
-		u64 last_agreed_sect;
+		u64 effective_size;
 		u64 md_offset;
 		s32 al_offset;
 		s32 bm_offset;
@@ -939,7 +1604,7 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 		u32 al_stripes;
 		u32 al_stripe_size_4k;
 	} prev;
-	sector_t u_size, size;
+	sector_t u_size, size, prev_size;
 	struct drbd_md *md = &device->ldev->md;
 	void *buffer;
 
@@ -954,7 +1619,7 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 	 * Move is not exactly correct, btw, currently we have all our meta
 	 * data in core memory, to "move" it we just write it all out, there
 	 * are no reads. */
-	drbd_suspend_io(device);
+	drbd_suspend_io(device, READ_AND_WRITE);
 	buffer = drbd_md_get_buffer(device, __func__); /* Lock meta-data IO */
 	if (!buffer) {
 		drbd_resume_io(device);
@@ -962,29 +1627,31 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 	}
 
 	/* remember current offset and sizes */
-	prev.last_agreed_sect = md->la_size_sect;
+	prev.effective_size = md->effective_size;
 	prev.md_offset = md->md_offset;
 	prev.al_offset = md->al_offset;
 	prev.bm_offset = md->bm_offset;
 	prev.md_size_sect = md->md_size_sect;
 	prev.al_stripes = md->al_stripes;
 	prev.al_stripe_size_4k = md->al_stripe_size_4k;
+	prev_size = get_capacity(device->vdisk);
 
 	if (rs) {
+		/* FIXME race with peer requests that want to do an AL transaction */
 		/* rs is non NULL if we should change the AL layout only */
 		md->al_stripes = rs->al_stripes;
 		md->al_stripe_size_4k = rs->al_stripe_size / 4;
 		md->al_size_4k = (u64)rs->al_stripes * rs->al_stripe_size / 4;
 	}
 
-	drbd_md_set_sector_offsets(device, device->ldev);
+	drbd_md_set_sector_offsets(device->ldev);
 
 	rcu_read_lock();
 	u_size = rcu_dereference(device->ldev->disk_conf)->disk_size;
 	rcu_read_unlock();
-	size = drbd_new_dev_size(device, device->ldev, u_size, flags & DDSF_FORCED);
+	size = drbd_new_dev_size(device, peer_current_size, u_size, flags);
 
-	if (size < prev.last_agreed_sect) {
+	if (size < prev.effective_size) {
 		if (rs && u_size == 0) {
 			/* Remove "rs &&" later. This check should always be active, but
 			   right now the receiver expects the permissive behavior */
@@ -1000,9 +1667,11 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 	}
 
 	if (get_capacity(device->vdisk) != size ||
-	    drbd_bm_capacity(device) != size) {
-		int err;
-		err = drbd_bm_resize(device, size, !(flags & DDSF_NO_RESYNC));
+	    (device->bitmap && drbd_bm_capacity(device) != size)) {
+		int err = 0;
+
+		if (device->bitmap)
+			err = drbd_bm_resize(device, size, !(flags & DDSF_NO_RESYNC));
 		if (unlikely(err)) {
 			/* currently there is only one error: ENOMEM! */
 			size = drbd_bm_capacity(device);
@@ -1014,21 +1683,32 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 				    "Leaving size unchanged\n");
 			}
 			rv = DS_ERROR;
+		} else {
+			/* racy, see comments above. */
+			drbd_set_my_capacity(device, size);
+			if (effective_disk_size_determined(device)
+			&& md->effective_size != size) {
+				char ppb[10];
+
+				drbd_info(device, "persisting effective size = %s (%llu KB)\n",
+					ppsize(ppb, size >> 1),
+					(unsigned long long)size >> 1);
+				md->effective_size = size;
+			}
 		}
-		/* racy, see comments above. */
-		drbd_set_my_capacity(device, size);
-		md->la_size_sect = size;
 	}
 	if (rv <= DS_ERROR)
 		goto err_out;
 
-	la_size_changed = (prev.last_agreed_sect != md->la_size_sect);
+	la_size_changed = (prev.effective_size != md->effective_size);
 
 	md_moved = prev.md_offset    != md->md_offset
 		|| prev.md_size_sect != md->md_size_sect;
 
 	if (la_size_changed || md_moved || rs) {
-		u32 prev_flags;
+		int i;
+		bool prev_al_disabled = 0;
+		u32 prev_peer_full_sync = 0;
 
 		/* We do some synchronous IO below, which may take some time.
 		 * Clear the timer, to avoid scary "timer expired!" messages,
@@ -1039,11 +1719,25 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 		 * to move the on-disk location of the activity log ringbuffer.
 		 * Lock for transaction is good enough, it may well be "dirty"
 		 * or even "starving". */
-		wait_event(device->al_wait, lc_try_lock_for_transaction(device->act_log));
+		wait_event(device->al_wait, drbd_al_try_lock_for_transaction(device));
+
+		if (drbd_md_dax_active(device->ldev)) {
+			if (drbd_dax_map(device->ldev)) {
+				drbd_err(device, "Could not remap DAX; aborting resize\n");
+				lc_unlock(device->act_log);
+				goto err_out;
+			}
+		}
 
 		/* mark current on-disk bitmap and activity log as unreliable */
-		prev_flags = md->flags;
-		md->flags |= MDF_FULL_SYNC | MDF_AL_DISABLED;
+		prev_al_disabled = !!(md->flags & MDF_AL_DISABLED);
+		md->flags |= MDF_AL_DISABLED;
+		for (i = 0; i < DRBD_PEERS_MAX; i++) {
+			if (md->peers[i].flags & MDF_PEER_FULL_SYNC)
+				prev_peer_full_sync |= 1 << i;
+			else
+				md->peers[i].flags |= MDF_PEER_FULL_SYNC;
+		}
 		drbd_md_write(device, buffer);
 
 		drbd_al_initialize(device, buffer);
@@ -1053,27 +1747,35 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 			 la_size_changed ? "size changed" : "md moved");
 		/* next line implicitly does drbd_suspend_io()+drbd_resume_io() */
 		drbd_bitmap_io(device, md_moved ? &drbd_bm_write_all : &drbd_bm_write,
-			       "size changed", BM_LOCKED_MASK, NULL);
+			       "size changed", BM_LOCK_ALL, NULL);
 
 		/* on-disk bitmap and activity log is authoritative again
 		 * (unless there was an IO error meanwhile...) */
-		md->flags = prev_flags;
+		if (!prev_al_disabled)
+			md->flags &= ~MDF_AL_DISABLED;
+		for (i = 0; i < DRBD_PEERS_MAX; i++) {
+			if (0 == (prev_peer_full_sync & (1 << i)))
+				md->peers[i].flags &= ~MDF_PEER_FULL_SYNC;
+		}
 		drbd_md_write(device, buffer);
 
 		if (rs)
 			drbd_info(device, "Changed AL layout to al-stripes = %d, al-stripe-size-kB = %d\n",
-				  md->al_stripes, md->al_stripe_size_4k * 4);
+				 md->al_stripes, md->al_stripe_size_4k * 4);
+
+		lc_unlock(device->act_log);
+		wake_up(&device->al_wait);
 	}
 
-	if (size > prev.last_agreed_sect)
-		rv = prev.last_agreed_sect ? DS_GREW : DS_GREW_FROM_ZERO;
-	if (size < prev.last_agreed_sect)
+	if (size > prev_size)
+		rv = prev_size ? DS_GREW : DS_GREW_FROM_ZERO;
+	if (size < prev_size)
 		rv = DS_SHRUNK;
 
 	if (0) {
 	err_out:
 		/* restore previous offset and sizes */
-		md->la_size_sect = prev.last_agreed_sect;
+		md->effective_size = prev.effective_size;
 		md->md_offset = prev.md_offset;
 		md->al_offset = prev.al_offset;
 		md->bm_offset = prev.bm_offset;
@@ -1082,57 +1784,167 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 		md->al_stripe_size_4k = prev.al_stripe_size_4k;
 		md->al_size_4k = (u64)prev.al_stripes * prev.al_stripe_size_4k;
 	}
-	lc_unlock(device->act_log);
-	wake_up(&device->al_wait);
 	drbd_md_put_buffer(device);
 	drbd_resume_io(device);
 
 	return rv;
 }
 
-sector_t
-drbd_new_dev_size(struct drbd_device *device, struct drbd_backing_dev *bdev,
-		  sector_t u_size, int assume_peer_has_space)
+/**
+ * get_max_agreeable_size()
+ * @device: DRBD device
+ * @max: Pointer to store the maximum agreeable size in
+ * @twopc_reachable_nodes: Bitmap of reachable nodes from two-phase-commit reply
+ *
+ * Check if all peer devices that have bitmap slots assigned in the metadata
+ * are connected.
+ */
+static bool get_max_agreeable_size(struct drbd_device *device, uint64_t *max,
+		uint64_t twopc_reachable_nodes)
 {
-	sector_t p_size = device->p_size;   /* partner's disk size. */
-	sector_t la_size_sect = bdev->md.la_size_sect; /* last agreed size. */
-	sector_t m_size; /* my size */
-	sector_t size = 0;
-
-	m_size = drbd_get_max_capacity(bdev);
+	int node_id;
+	bool all_known;
 
-	if (device->state.conn < C_CONNECTED && assume_peer_has_space) {
-		drbd_warn(device, "Resize while not connected was forced by the user!\n");
-		p_size = m_size;
-	}
+	all_known = true;
+	rcu_read_lock();
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		struct drbd_peer_md *peer_md = &device->ldev->md.peers[node_id];
+		struct drbd_peer_device *peer_device;
 
-	if (p_size && m_size) {
-		size = min_t(sector_t, p_size, m_size);
-	} else {
-		if (la_size_sect) {
-			size = la_size_sect;
-			if (m_size && m_size < size)
-				size = m_size;
-			if (p_size && p_size < size)
-				size = p_size;
+		if (device->ldev->md.node_id == node_id) {
+			dynamic_drbd_dbg(device, "my node_id: %u\n", node_id);
+			continue; /* skip myself... */
+		}
+		/* peer_device may be NULL if we don't have a connection to that node. */
+		peer_device = peer_device_by_node_id(device, node_id);
+		if (twopc_reachable_nodes & NODE_MASK(node_id)) {
+			uint64_t size = device->resource->twopc_reply.max_possible_size;
+
+			dynamic_drbd_dbg(device, "node_id: %u, twopc YES for max_size: %llu\n",
+					node_id, (unsigned long long)size);
+
+			/* Update our cached information, they said "yes".
+			 * Note:
+			 * d_size == 0 indicates diskless peer, or not directly
+			 * connected.  It will be ignored by the min_not_zero()
+			 * aggregation elsewhere.  Only reset if size > d_size
+			 * here.  Once we really commit the change, this will
+			 * also be assigned if it was a shrinkage.
+			 */
+			if (peer_device) {
+				if (peer_device->d_size && size > peer_device->d_size)
+					peer_device->d_size = size;
+				if (size > peer_device->max_size)
+					peer_device->max_size = size;
+			}
+			continue;
+		}
+		if (peer_device) {
+			enum drbd_disk_state pdsk = peer_device->disk_state[NOW];
+			dynamic_drbd_dbg(peer_device, "node_id: %u idx: %u bm-uuid: 0x%llx flags: 0x%x max_size: %llu (%s)\n",
+					node_id,
+					peer_md->bitmap_index,
+					peer_md->bitmap_uuid,
+					peer_md->flags,
+					peer_device->max_size,
+					drbd_disk_str(pdsk));
+
+			if (test_bit(HAVE_SIZES, &peer_device->flags)) {
+				/* If we still can see it, consider its last
+				 * known size, even if it may have meanwhile
+				 * detached from its disk.
+				 * If we no longer see it, we may want to
+				 * ignore the size we last knew, and
+				 * "assume_peer_has_space".  */
+				*max = min_not_zero(*max, peer_device->max_size);
+				continue;
+			}
 		} else {
-			if (m_size)
-				size = m_size;
-			if (p_size)
-				size = p_size;
+			dynamic_drbd_dbg(device, "node_id: %u idx: %u bm-uuid: 0x%llx flags: 0x%x (not currently reachable)\n",
+					node_id,
+					peer_md->bitmap_index,
+					peer_md->bitmap_uuid,
+					peer_md->flags);
 		}
+		/* Even the currently diskless peer does not really know if it
+		 * is diskless on purpose (a "DRBD client") or if it just was
+		 * not possible to attach (backend device gone for some
+		 * reason).  But we remember in our meta data if we have ever
+		 * seen a peer disk for this peer.  If we did not ever see a
+		 * peer disk, assume that's intentional. */
+		if ((peer_md->flags & MDF_PEER_DEVICE_SEEN) == 0)
+			continue;
+
+		all_known = false;
+		/* don't break yet, min aggregation may still find a peer */
 	}
+	rcu_read_unlock();
+	return all_known;
+}
+
+#define DDUMP_LLU(d, x) do { dynamic_drbd_dbg(d, "%u: " #x ": %llu\n", __LINE__, (unsigned long long)x); } while (0)
 
+/* MUST hold a reference on ldev. */
+sector_t
+drbd_new_dev_size(struct drbd_device *device,
+		sector_t current_size, /* need at least this much */
+		sector_t user_capped_size, /* want (at most) this much */
+		enum dds_flags flags)
+{
+	struct drbd_resource *resource = device->resource;
+	uint64_t p_size = 0;
+	uint64_t la_size = device->ldev->md.effective_size; /* last agreed size */
+	uint64_t m_size; /* my size */
+	uint64_t size = 0;
+	bool all_known_connected;
+
+	/* If there are reachable_nodes, get_max_agreeable_size() will
+	 * also aggregate the twopc.resize.new_size into their d_size
+	 * and max_size.  Do that first, so drbd_partition_data_capacity()
+	 * can use that new knowledge.
+	 */
+
+	all_known_connected = get_max_agreeable_size(device, &p_size,
+		flags & DDSF_2PC ? resource->twopc_reply.reachable_nodes : 0);
+	m_size = drbd_partition_data_capacity(device);
+
+	if (all_known_connected) {
+		/* If we currently can see all peer devices,
+		 * and p_size is still 0, apparently all our peers have been
+		 * diskless, always.  If we have the only persistent backend,
+		 * only our size counts. */
+		DDUMP_LLU(device, p_size);
+		DDUMP_LLU(device, m_size);
+		p_size = min_not_zero(p_size, m_size);
+	} else if (flags & DDSF_ASSUME_UNCONNECTED_PEER_HAS_SPACE) {
+		DDUMP_LLU(device, p_size);
+		DDUMP_LLU(device, m_size);
+		DDUMP_LLU(device, la_size);
+		p_size = min_not_zero(p_size, m_size);
+		if (p_size > la_size)
+			drbd_warn(device, "Resize forced while not fully connected!\n");
+	} else {
+		DDUMP_LLU(device, p_size);
+		DDUMP_LLU(device, m_size);
+		DDUMP_LLU(device, la_size);
+		/* We currently cannot see all peer devices,
+		 * fall back to what we last agreed upon. */
+		p_size = min_not_zero(p_size, la_size);
+	}
+
+	DDUMP_LLU(device, p_size);
+	DDUMP_LLU(device, m_size);
+	size = min_not_zero(p_size, m_size);
+	DDUMP_LLU(device, size);
 	if (size == 0)
-		drbd_err(device, "Both nodes diskless!\n");
+		drbd_err(device, "All nodes diskless!\n");
 
-	if (u_size) {
-		if (u_size > size)
-			drbd_err(device, "Requested disk size is too big (%lu > %lu)\n",
-			    (unsigned long)u_size>>1, (unsigned long)size>>1);
-		else
-			size = u_size;
-	}
+	if (user_capped_size > size)
+		drbd_err(device, "Requested disk size is too big (%llu > %llu)kiB\n",
+		    (unsigned long long)user_capped_size>>1,
+		    (unsigned long long)size>>1);
+	else if (user_capped_size)
+		size = user_capped_size;
 
 	return size;
 }
@@ -1184,57 +1996,58 @@ static int drbd_check_al_size(struct drbd_device *device, struct disk_conf *dc)
 		return -EBUSY;
 	} else {
 		lc_destroy(t);
+		device->al_writ_cnt = 0;
+		memset(device->al_histogram, 0, sizeof(device->al_histogram));
 	}
 	drbd_md_mark_dirty(device); /* we changed device->act_log->nr_elemens */
 	return 0;
 }
 
-static unsigned int drbd_max_peer_bio_size(struct drbd_device *device)
+static u32 common_connection_features(struct drbd_resource *resource)
 {
-	/*
-	 * We may ignore peer limits if the peer is modern enough.  From 8.3.8
-	 * onwards the peer can use multiple BIOs for a single peer_request.
-	 */
-	if (device->state.conn < C_WF_REPORT_PARAMS)
-		return device->peer_max_bio_size;
-
-	if (first_peer_device(device)->connection->agreed_pro_version < 94)
-		return min(device->peer_max_bio_size, DRBD_MAX_SIZE_H80_PACKET);
+	struct drbd_connection *connection;
+	u32 features = -1;
 
-	/*
-	 * Correct old drbd (up to 8.3.7) if it believes it can do more than
-	 * 32KiB.
-	 */
-	if (first_peer_device(device)->connection->agreed_pro_version == 94)
-		return DRBD_MAX_SIZE_H80_PACKET;
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		if (connection->cstate[NOW] < C_CONNECTED)
+			continue;
+		features &= connection->agreed_features;
+	}
+	rcu_read_unlock();
 
-	/*
-	 * drbd 8.3.8 onwards, before 8.4.0
-	 */
-	if (first_peer_device(device)->connection->agreed_pro_version < 100)
-		return DRBD_MAX_BIO_SIZE_P95;
-	return DRBD_MAX_BIO_SIZE;
+	return features;
 }
 
-static unsigned int drbd_max_discard_sectors(struct drbd_connection *connection)
+static unsigned int drbd_max_discard_sectors(struct drbd_resource *resource)
 {
-	/* when we introduced REQ_WRITE_SAME support, we also bumped
+	struct drbd_connection *connection;
+	unsigned int s = DRBD_MAX_BBIO_SECTORS;
+
+	/* when we introduced WRITE_SAME support, we also bumped
 	 * our maximum supported batch bio size used for discards. */
-	if (connection->agreed_features & DRBD_FF_WSAME)
-		return DRBD_MAX_BBIO_SECTORS;
-	/* before, with DRBD <= 8.4.6, we only allowed up to one AL_EXTENT_SIZE. */
-	return AL_EXTENT_SIZE >> 9;
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		if (connection->cstate[NOW] == C_CONNECTED &&
+		    !(connection->agreed_features & DRBD_FF_WSAME)) {
+			/* before, with DRBD <= 8.4.6, we only allowed up to one AL_EXTENT_SIZE. */
+			s = AL_EXTENT_SIZE >> SECTOR_SHIFT;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return s;
 }
 
-static bool drbd_discard_supported(struct drbd_connection *connection,
+static bool drbd_discard_supported(struct drbd_device *device,
 		struct drbd_backing_dev *bdev)
 {
 	if (bdev && !bdev_max_discard_sectors(bdev->backing_bdev))
 		return false;
 
-	if (connection->cstate >= C_CONNECTED &&
-	    !(connection->agreed_features & DRBD_FF_TRIM)) {
-		drbd_info(connection,
+	if (!(common_connection_features(device->resource) & DRBD_FF_TRIM)) {
+		drbd_info(device,
 			"peer DRBD too old, does not support TRIM: disabling discards\n");
 		return false;
 	}
@@ -1242,85 +2055,75 @@ static bool drbd_discard_supported(struct drbd_connection *connection,
 	return true;
 }
 
-/* This is the workaround for "bio would need to, but cannot, be split" */
-static unsigned int drbd_backing_dev_max_segments(struct drbd_device *device)
+static void get_common_queue_limits(struct queue_limits *common_limits,
+		struct drbd_device *device)
 {
-	unsigned int max_segments;
+	struct drbd_peer_device *peer_device;
+	struct queue_limits peer_limits = { 0 };
+
+	blk_set_stacking_limits(common_limits);
+	common_limits->max_hw_sectors = device->device_conf.max_bio_size >> SECTOR_SHIFT;
+	common_limits->max_sectors = device->device_conf.max_bio_size >> SECTOR_SHIFT;
+	common_limits->physical_block_size = device->device_conf.block_size;
+	common_limits->logical_block_size = device->device_conf.block_size;
+	common_limits->io_min = device->device_conf.block_size;
+	common_limits->max_hw_zone_append_sectors = 0;
 
 	rcu_read_lock();
-	max_segments = rcu_dereference(device->ldev->disk_conf)->max_bio_bvecs;
+	for_each_peer_device_rcu(peer_device, device) {
+		if (!test_bit(HAVE_SIZES, &peer_device->flags) &&
+		    peer_device->repl_state[NOW] < L_ESTABLISHED)
+			continue;
+		blk_set_stacking_limits(&peer_limits);
+		peer_limits.logical_block_size = peer_device->q_limits.logical_block_size;
+		peer_limits.physical_block_size = peer_device->q_limits.physical_block_size;
+		peer_limits.alignment_offset = peer_device->q_limits.alignment_offset;
+		peer_limits.io_min = peer_device->q_limits.io_min;
+		peer_limits.io_opt = peer_device->q_limits.io_opt;
+		peer_limits.max_hw_sectors = peer_device->q_limits.max_bio_size >> SECTOR_SHIFT;
+		peer_limits.max_sectors = peer_device->q_limits.max_bio_size >> SECTOR_SHIFT;
+		blk_stack_limits(common_limits, &peer_limits, 0);
+	}
 	rcu_read_unlock();
-
-	if (!max_segments)
-		return BLK_MAX_SEGMENTS;
-	return max_segments;
 }
 
-void drbd_reconsider_queue_parameters(struct drbd_device *device,
-		struct drbd_backing_dev *bdev, struct o_qlim *o)
+void drbd_reconsider_queue_parameters(struct drbd_device *device, struct drbd_backing_dev *bdev)
 {
-	struct drbd_connection *connection =
-		first_peer_device(device)->connection;
 	struct request_queue * const q = device->rq_queue;
-	unsigned int now = queue_max_hw_sectors(q) << 9;
 	struct queue_limits lim;
 	struct request_queue *b = NULL;
-	unsigned int new;
-
-	if (bdev) {
-		b = bdev->backing_bdev->bd_disk->queue;
-
-		device->local_max_bio_size =
-			queue_max_hw_sectors(b) << SECTOR_SHIFT;
-	}
-
-	/*
-	 * We may later detach and re-attach on a disconnected Primary.  Avoid
-	 * decreasing the value in this case.
-	 *
-	 * We want to store what we know the peer DRBD can handle, not what the
-	 * peer IO backend can handle.
-	 */
-	new = min3(DRBD_MAX_BIO_SIZE, device->local_max_bio_size,
-		max(drbd_max_peer_bio_size(device), device->peer_max_bio_size));
-	if (new != now) {
-		if (device->state.role == R_PRIMARY && new < now)
-			drbd_err(device, "ASSERT FAILED new < now; (%u < %u)\n",
-					new, now);
-		drbd_info(device, "max BIO size = %u\n", new);
-	}
 
 	lim = queue_limits_start_update(q);
-	if (bdev) {
-		blk_set_stacking_limits(&lim);
-		lim.max_segments = drbd_backing_dev_max_segments(device);
-	} else {
-		lim.max_segments = BLK_MAX_SEGMENTS;
-		lim.features = BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
-			       BLK_FEAT_ROTATIONAL | BLK_FEAT_STABLE_WRITES;
-	}
-
-	lim.max_hw_sectors = new >> SECTOR_SHIFT;
-	lim.seg_boundary_mask = PAGE_SIZE - 1;
+	get_common_queue_limits(&lim, device);
 
 	/*
-	 * We don't care for the granularity, really.
-	 *
-	 * Stacking limits below should fix it for the local device.  Whether or
-	 * not it is a suitable granularity on the remote device is not our
-	 * problem, really. If you care, you need to use devices with similar
-	 * topology on all peers.
+	 * discard_granularity == DRBD_DISCARD_GRANULARITY_DEF (sentinel):
+	 *   not explicitly configured; use the legacy heuristic
+	 *   (drbd_discard_supported decides, granularity=512).
+	 * discard_granularity == 0: explicitly disable discards.
+	 * discard_granularity > 0: use the configured value and enable discards
+	 *   unconditionally (e.g. LINSTOR knows the real granularity from
+	 *   storage pool info and configures it for diskless primaries or to
+	 *   advertise a larger granularity than strictly required).
 	 */
-	if (drbd_discard_supported(connection, bdev)) {
-		lim.discard_granularity = 512;
-		lim.max_hw_discard_sectors =
-			drbd_max_discard_sectors(connection);
+	if (device->device_conf.discard_granularity == DRBD_DISCARD_GRANULARITY_DEF) {
+		if (drbd_discard_supported(device, bdev)) {
+			lim.discard_granularity = 512;
+			lim.max_hw_discard_sectors = drbd_max_discard_sectors(device->resource);
+		} else {
+			lim.discard_granularity = 0;
+			lim.max_hw_discard_sectors = 0;
+		}
+	} else if (device->device_conf.discard_granularity) {
+		lim.discard_granularity = device->device_conf.discard_granularity;
+		lim.max_hw_discard_sectors = drbd_max_discard_sectors(device->resource);
 	} else {
 		lim.discard_granularity = 0;
 		lim.max_hw_discard_sectors = 0;
 	}
 
 	if (bdev) {
+		b = bdev->backing_bdev->bd_disk->queue;
 		blk_stack_limits(&lim, &b->limits, 0);
 		/*
 		 * blk_set_stacking_limits() cleared the features, and
@@ -1337,14 +2140,28 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		 *    receiver will detect a checksum mismatch.
 		 */
 		lim.features |= BLK_FEAT_STABLE_WRITES;
+
+		/*
+		 * blk_stack_limits() uses max() for discard_granularity and
+		 * min_not_zero() for max_hw_discard_sectors, both of which can
+		 * re-enable discards from the backing device even when the user
+		 * explicitly disabled them (discard_granularity == 0).
+		 */
+		if (device->device_conf.discard_granularity == 0) {
+			lim.discard_granularity = 0;
+			lim.max_hw_discard_sectors = 0;
+		}
+	} else {
+		lim.features = BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
+			       BLK_FEAT_ROTATIONAL | BLK_FEAT_STABLE_WRITES;
 	}
 
 	/*
-	 * If we can handle "zeroes" efficiently on the protocol, we want to do
-	 * that, even if our backend does not announce max_write_zeroes_sectors
-	 * itself.
+	 * If we can handle "zeroes" efficiently on the protocol,
+	 * we want to do that, even if our backend does not announce
+	 * max_write_zeroes_sectors itself.
 	 */
-	if (connection->agreed_features & DRBD_FF_WZEROES)
+	if (common_connection_features(device->resource) & DRBD_FF_WZEROES)
 		lim.max_write_zeroes_sectors = DRBD_MAX_BBIO_SECTORS;
 	else
 		lim.max_write_zeroes_sectors = 0;
@@ -1352,6 +2169,11 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 
 	if ((lim.discard_granularity >> SECTOR_SHIFT) >
 	    lim.max_hw_discard_sectors) {
+		/*
+		 * discard_granularity is the smallest supported unit of a
+		 * discard. If that is larger than the maximum supported discard
+		 * size, we need to disable discards altogether.
+		 */
 		lim.discard_granularity = 0;
 		lim.max_hw_discard_sectors = 0;
 	}
@@ -1360,56 +2182,48 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		drbd_err(device, "setting new queue limits failed\n");
 }
 
-/* Starts the worker thread */
-static void conn_reconfig_start(struct drbd_connection *connection)
+/* Make sure IO is suspended before calling this function(). */
+static void drbd_try_suspend_al(struct drbd_device *device)
 {
-	drbd_thread_start(&connection->worker);
-	drbd_flush_workqueue(&connection->sender_work);
-}
+	struct drbd_peer_device *peer_device;
+	bool suspend = true;
+	int max_peers = device->ldev->md.max_peers, bitmap_index;
 
-/* if still unconfigured, stops worker again. */
-static void conn_reconfig_done(struct drbd_connection *connection)
-{
-	bool stop_threads;
-	spin_lock_irq(&connection->resource->req_lock);
-	stop_threads = conn_all_vols_unconf(connection) &&
-		connection->cstate == C_STANDALONE;
-	spin_unlock_irq(&connection->resource->req_lock);
-	if (stop_threads) {
-		/* ack_receiver thread and ack_sender workqueue are implicitly
-		 * stopped by receiver in conn_disconnect() */
-		drbd_thread_stop(&connection->receiver);
-		drbd_thread_stop(&connection->worker);
+	if (device->bitmap) {
+		for (bitmap_index = 0; bitmap_index < max_peers; bitmap_index++) {
+			if (_drbd_bm_total_weight(device, bitmap_index) != drbd_bm_bits(device))
+				return;
+		}
 	}
-}
-
-/* Make sure IO is suspended before calling this function(). */
-static void drbd_suspend_al(struct drbd_device *device)
-{
-	int s = 0;
 
-	if (!lc_try_lock(device->act_log)) {
-		drbd_warn(device, "Failed to lock al in drbd_suspend_al()\n");
+	if (!drbd_al_try_lock(device)) {
+		drbd_warn(device, "Failed to lock al in %s()", __func__);
 		return;
 	}
 
 	drbd_al_shrink(device);
-	spin_lock_irq(&device->resource->req_lock);
-	if (device->state.conn < C_CONNECTED)
-		s = !test_and_set_bit(AL_SUSPENDED, &device->flags);
-	spin_unlock_irq(&device->resource->req_lock);
+	read_lock_irq(&device->resource->state_rwlock);
+	for_each_peer_device(peer_device, device) {
+		if (peer_device->repl_state[NOW] >= L_ESTABLISHED) {
+			suspend = false;
+			break;
+		}
+	}
+	if (suspend)
+		suspend = !test_and_set_bit(AL_SUSPENDED, &device->flags);
+	read_unlock_irq(&device->resource->state_rwlock);
 	lc_unlock(device->act_log);
+	wake_up(&device->al_wait);
 
-	if (s)
+	if (suspend)
 		drbd_info(device, "Suspended AL updates\n");
 }
 
 
 static bool should_set_defaults(struct genl_info *info)
 {
-	struct drbd_genlmsghdr *dh = genl_info_userhdr(info);
-
-	return 0 != (dh->flags & DRBD_GENL_F_SET_DEFAULTS);
+	unsigned int flags = ((struct drbd_genlmsghdr *)genl_info_userhdr(info))->flags;
+	return 0 != (flags & DRBD_GENL_F_SET_DEFAULTS);
 }
 
 static unsigned int drbd_al_extents_max(struct drbd_backing_dev *bdev)
@@ -1464,25 +2278,47 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 		}
 	}
 
+	/* To be effective, rs_discard_granularity must not be larger than the
+	 * maximum resync request size, and multiple of 4k
+	 * (preferably a power-of-two multiple 4k).
+	 * See also make_resync_request().
+	 * That also means that if q->limits.discard_granularity or
+	 * q->limits.discard_alignment are "odd", rs_discard_granularity won't
+	 * be particularly effective, or not effective at all.
+	 */
 	if (disk_conf->rs_discard_granularity) {
-		int orig_value = disk_conf->rs_discard_granularity;
-		sector_t discard_size = bdev_max_discard_sectors(bdev) << 9;
+		unsigned int new_discard_granularity =
+			disk_conf->rs_discard_granularity;
+		unsigned int discard_sectors = bdev_max_discard_sectors(bdev);
 		unsigned int discard_granularity = bdev_discard_granularity(bdev);
-		int remainder;
 
-		if (discard_granularity > disk_conf->rs_discard_granularity)
-			disk_conf->rs_discard_granularity = discard_granularity;
-
-		remainder = disk_conf->rs_discard_granularity %
-				discard_granularity;
-		disk_conf->rs_discard_granularity += remainder;
-
-		if (disk_conf->rs_discard_granularity > discard_size)
-			disk_conf->rs_discard_granularity = discard_size;
-
-		if (disk_conf->rs_discard_granularity != orig_value)
+		/* should be at least the discard_granularity of the bdev,
+		 * and preferably a multiple (or the backend won't be able to
+		 * discard some of the "cuttings").
+		 * This also sanitizes nonsensical settings like "77 byte".
+		 */
+		new_discard_granularity = roundup(new_discard_granularity,
+				discard_granularity);
+
+		/* more than the max resync request size won't work anyways */
+		discard_sectors = min(discard_sectors,
+				DRBD_RS_DISCARD_GRANULARITY_MAX >> SECTOR_SHIFT);
+		/* Avoid compiler warning about truncated integer.
+		 * The min() above made sure the result fits even after left shift. */
+		new_discard_granularity = min(
+				new_discard_granularity >> SECTOR_SHIFT,
+				discard_sectors) << SECTOR_SHIFT;
+		/* less than the backend discard granularity is allowed if
+		   the backend granularity is a multiple of the configured value */
+		if (new_discard_granularity < discard_granularity &&
+		    discard_granularity % new_discard_granularity != 0)
+			new_discard_granularity = 0;
+
+		if (disk_conf->rs_discard_granularity != new_discard_granularity) {
 			drbd_info(device, "rs_discard_granularity changed to %d\n",
-				  disk_conf->rs_discard_granularity);
+					new_discard_granularity);
+			disk_conf->rs_discard_granularity = new_discard_granularity;
+		}
 	}
 }
 
@@ -1494,13 +2330,13 @@ static int disk_opts_check_al_size(struct drbd_device *device, struct disk_conf
 	    device->act_log->nr_elements == dc->al_extents)
 		return 0;
 
-	drbd_suspend_io(device);
+	drbd_suspend_io(device, READ_AND_WRITE);
 	/* If IO completion is currently blocked, we would likely wait
 	 * "forever" for the activity log to become unused. So we don't. */
-	if (atomic_read(&device->ap_bio_cnt))
+	if (atomic_read(&device->ap_bio_cnt[WRITE]) || atomic_read(&device->ap_bio_cnt[READ]))
 		goto out;
 
-	wait_event(device->al_wait, lc_try_lock(device->act_log));
+	wait_event(device->al_wait, drbd_al_try_lock(device));
 	drbd_al_shrink(device);
 	err = drbd_check_al_size(device, dc);
 	lc_unlock(device->act_log);
@@ -1510,24 +2346,113 @@ static int disk_opts_check_al_size(struct drbd_device *device, struct disk_conf
 	return err;
 }
 
-int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
+static struct drbd_connection *the_only_peer_with_disk(struct drbd_device *device,
+						       enum which_state which)
+{
+	const int my_node_id = device->resource->res_opts.node_id;
+	struct drbd_peer_md *peer_md = device->ldev->md.peers;
+	struct drbd_connection *connection = NULL;
+	struct drbd_peer_device *peer_device;
+	int node_id, peer_disks = 0;
+
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		if (node_id == my_node_id)
+			continue;
+
+		if (peer_md[node_id].flags & MDF_PEER_DEVICE_SEEN)
+			peer_disks++;
+
+		if (peer_disks > 1)
+			return NULL;
+
+		peer_device = peer_device_by_node_id(device, node_id);
+		if (peer_device) {
+			enum drbd_disk_state pdsk = peer_device->disk_state[which];
+
+			if (pdsk >= D_INCONSISTENT && pdsk != D_UNKNOWN)
+				connection = peer_device->connection;
+		}
+	}
+	return connection;
+}
+
+static void __update_mdf_al_disabled(struct drbd_device *device, bool al_updates,
+				     enum which_state which)
+{
+	struct drbd_md *md = &device->ldev->md;
+	struct drbd_connection *peer = NULL;
+	bool al_updates_old = !(md->flags & MDF_AL_DISABLED);
+	bool optimized = false;
+
+	if (al_updates)
+		peer = the_only_peer_with_disk(device, which);
+
+	if (device->bitmap == NULL ||
+	    (al_updates && device->ldev->md.max_peers == 1 &&
+	    peer && peer->peer_role[which] == R_PRIMARY &&
+	    device->resource->role[which] == R_SECONDARY)) {
+		al_updates = false;
+		optimized = true;
+	}
+
+	if (al_updates_old == al_updates)
+		return;
+
+	if (al_updates) {
+		drbd_info(device, "Enabling local AL-updates\n");
+		md->flags &= ~MDF_AL_DISABLED;
+	} else {
+		drbd_info(device, "Disabling local AL-updates %s\n",
+			  optimized ? "(optimization)" : "(config)");
+		md->flags |= MDF_AL_DISABLED;
+	}
+	drbd_md_mark_dirty(device);
+}
+
+/**
+ * drbd_update_mdf_al_disabled() - update the MDF_AL_DISABLED bit in md.flags
+ * @device: DRBD device
+ * @which: OLD or NEW
+ *
+ * This function also optimizes performance by turning off al-updates when:
+ * - the cluster has only two nodes with backing disk
+ * - the other node with a backing disk is the primary
+ */
+void drbd_update_mdf_al_disabled(struct drbd_device *device, enum which_state which)
+{
+	bool al_updates;
+
+	if (!get_ldev(device))
+		return;
+
+	rcu_read_lock();
+	al_updates = rcu_dereference(device->ldev->disk_conf)->al_updates;
+	rcu_read_unlock();
+	__update_mdf_al_disabled(device, al_updates, which);
+
+	put_ldev(device);
+}
+
+static int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	enum drbd_ret_code retcode;
 	struct drbd_device *device;
+	struct drbd_resource *resource;
 	struct disk_conf *new_disk_conf, *old_disk_conf;
-	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
+	struct drbd_peer_device *peer_device;
 	int err;
-	unsigned int fifo_size;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto finish;
 
 	device = adm_ctx.device;
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	resource = device->resource;
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
 
 	/* we also need a disk
 	 * to change the options on */
@@ -1542,7 +2467,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 		goto fail;
 	}
 
-	mutex_lock(&device->resource->conf_update);
+	mutex_lock(&resource->conf_update);
 	old_disk_conf = device->ldev->disk_conf;
 	*new_disk_conf = *old_disk_conf;
 	if (should_set_defaults(info))
@@ -1555,24 +2480,8 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 		goto fail_unlock;
 	}
 
-	if (!expect(device, new_disk_conf->resync_rate >= 1))
-		new_disk_conf->resync_rate = 1;
-
 	sanitize_disk_conf(device, new_disk_conf, device->ldev);
 
-	if (new_disk_conf->c_plan_ahead > DRBD_C_PLAN_AHEAD_MAX)
-		new_disk_conf->c_plan_ahead = DRBD_C_PLAN_AHEAD_MAX;
-
-	fifo_size = (new_disk_conf->c_plan_ahead * 10 * SLEEP_TIME) / HZ;
-	if (fifo_size != device->rs_plan_s->size) {
-		new_plan = fifo_alloc(fifo_size);
-		if (!new_plan) {
-			drbd_err(device, "kmalloc of fifo_buffer failed");
-			retcode = ERR_NOMEM;
-			goto fail_unlock;
-		}
-	}
-
 	err = disk_opts_check_al_size(device, new_disk_conf);
 	if (err) {
 		/* Could be just "busy". Ignore?
@@ -1583,6 +2492,30 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 		goto fail_unlock;
 	}
 
+	if (!old_disk_conf->d_bitmap && new_disk_conf->d_bitmap) {
+		struct drbd_md *md = &device->ldev->md;
+
+		device->bitmap = drbd_bm_alloc(md->max_peers, md->bm_block_shift);
+		if (!device->bitmap) {
+			drbd_msg_put_info(adm_ctx.reply_skb, "Failed to allocate bitmap");
+			retcode = ERR_NOMEM;
+			goto fail_unlock;
+		}
+		err = drbd_bm_resize(device, get_capacity(device->vdisk), true);
+		if (err) {
+			drbd_msg_put_info(adm_ctx.reply_skb, "Failed to allocate bitmap pages");
+			retcode = ERR_NOMEM;
+			goto fail_unlock;
+		}
+
+		drbd_bitmap_io(device, &drbd_bm_write, "write from disk_opts", BM_LOCK_ALL, NULL);
+	} else if (old_disk_conf->d_bitmap && !new_disk_conf->d_bitmap) {
+		/* That would be quite some effort, and there is no use case for this */
+		drbd_msg_put_info(adm_ctx.reply_skb, "Online freeing of the bitmap not supported");
+		retcode = ERR_INVALID_REQUEST;
+		goto fail_unlock;
+	}
+
 	lock_all_resources();
 	retcode = drbd_resync_after_valid(device, new_disk_conf->resync_after);
 	if (retcode == NO_ERROR) {
@@ -1594,17 +2527,9 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	if (retcode != NO_ERROR)
 		goto fail_unlock;
 
-	if (new_plan) {
-		old_plan = device->rs_plan_s;
-		rcu_assign_pointer(device->rs_plan_s, new_plan);
-	}
-
-	mutex_unlock(&device->resource->conf_update);
+	mutex_unlock(&resource->conf_update);
 
-	if (new_disk_conf->al_updates)
-		device->ldev->md.flags &= ~MDF_AL_DISABLED;
-	else
-		device->ldev->md.flags |= MDF_AL_DISABLED;
+	__update_mdf_al_disabled(device, new_disk_conf->al_updates, NOW);
 
 	if (new_disk_conf->md_flushes)
 		clear_bit(MD_NO_FUA, &device->flags);
@@ -1612,65 +2537,298 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 		set_bit(MD_NO_FUA, &device->flags);
 
 	if (write_ordering_changed(old_disk_conf, new_disk_conf))
-		drbd_bump_write_ordering(device->resource, NULL, WO_BDEV_FLUSH);
+		drbd_bump_write_ordering(device->resource, NULL, WO_BIO_BARRIER);
 
 	if (old_disk_conf->discard_zeroes_if_aligned !=
 	    new_disk_conf->discard_zeroes_if_aligned)
-		drbd_reconsider_queue_parameters(device, device->ldev, NULL);
+		drbd_reconsider_queue_parameters(device, device->ldev);
 
-	drbd_md_sync(device);
-
-	if (device->state.conn >= C_CONNECTED) {
-		struct drbd_peer_device *peer_device;
+	drbd_md_sync_if_dirty(device);
 
-		for_each_peer_device(peer_device, device)
+	for_each_peer_device(peer_device, device) {
+		if (peer_device->repl_state[NOW] >= L_ESTABLISHED)
 			drbd_send_sync_param(peer_device);
 	}
 
 	kvfree_rcu_mightsleep(old_disk_conf);
-	kfree(old_plan);
 	mod_timer(&device->request_timer, jiffies + HZ);
 	goto success;
 
 fail_unlock:
-	mutex_unlock(&device->resource->conf_update);
+	mutex_unlock(&resource->conf_update);
  fail:
 	kfree(new_disk_conf);
-	kfree(new_plan);
 success:
+	if (retcode != NO_ERROR)
+		synchronize_rcu();
 	put_ldev(device);
  out:
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
- finish:
+out_no_adm_mutex:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static struct file *open_backing_dev(struct drbd_device *device,
-		const char *bdev_path, void *claim_ptr, bool do_bd_link)
+static void mutex_unlock_cond(struct mutex *mutex, bool *have_mutex)
 {
-	struct file *file;
-	int err = 0;
+	if (*have_mutex) {
+		mutex_unlock(mutex);
+		*have_mutex = false;
+	}
+}
+
+static void update_resource_dagtag(struct drbd_resource *resource, struct drbd_backing_dev *bdev)
+{
+	u64 dagtag = 0;
+	int node_id;
+
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		struct drbd_peer_md *peer_md;
+		if (bdev->md.node_id == node_id)
+			continue;
+
+		peer_md = &bdev->md.peers[node_id];
+
+		if (peer_md->bitmap_uuid)
+			dagtag = max(peer_md->bitmap_dagtag, dagtag);
+	}
+
+	spin_lock_irq(&resource->tl_update_lock);
+	if (dagtag > resource->dagtag_sector) {
+		resource->dagtag_before_attach = resource->dagtag_sector;
+		resource->dagtag_from_backing_dev = dagtag;
+		WRITE_ONCE(resource->dagtag_sector, dagtag);
+	}
+	spin_unlock_irq(&resource->tl_update_lock);
+}
+
+static int used_bitmap_slots(struct drbd_backing_dev *bdev)
+{
+	int node_id;
+	int used = 0;
+
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		struct drbd_peer_md *peer_md = &bdev->md.peers[node_id];
+
+		if (peer_md->flags & MDF_HAVE_BITMAP)
+			used++;
+	}
+
+	return used;
+}
+
+static bool bitmap_index_vacant(struct drbd_backing_dev *bdev, int bitmap_index)
+{
+	int node_id;
+
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		struct drbd_peer_md *peer_md = &bdev->md.peers[node_id];
+
+		if (peer_md->bitmap_index == bitmap_index)
+			return false;
+	}
+	return true;
+}
+
+int drbd_unallocated_index(struct drbd_backing_dev *bdev)
+{
+	int bitmap_index;
+	int bm_max_peers = bdev->md.max_peers;
+
+	for (bitmap_index = 0; bitmap_index < bm_max_peers; bitmap_index++) {
+		if (bitmap_index_vacant(bdev, bitmap_index))
+			return bitmap_index;
+	}
+
+	return -1;
+}
+
+static int
+allocate_bitmap_index(struct drbd_peer_device *peer_device,
+		      struct drbd_backing_dev *nbc)
+{
+	const int peer_node_id = peer_device->connection->peer_node_id;
+	struct drbd_peer_md *peer_md = &nbc->md.peers[peer_node_id];
+	int bitmap_index;
+
+	bitmap_index = drbd_unallocated_index(nbc);
+	if (bitmap_index == -1) {
+		drbd_err(peer_device, "Not enough free bitmap slots\n");
+		return -ENOSPC;
+	}
+
+	peer_md->bitmap_index = bitmap_index;
+	peer_device->bitmap_index = bitmap_index;
+	peer_md->flags |= MDF_HAVE_BITMAP;
+
+	return 0;
+}
+
+static struct drbd_peer_md *day0_peer_md(struct drbd_device *device)
+{
+	const int my_node_id = device->resource->res_opts.node_id;
+	struct drbd_peer_md *peer_md = device->ldev->md.peers;
+	int node_id;
+
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		if (node_id == my_node_id)
+			continue;
+		/* Only totally unused slots definitely contain the day0 UUID. */
+		if (peer_md[node_id].bitmap_index == -1 && !peer_md[node_id].flags)
+			return &peer_md[node_id];
+	}
+	return NULL;
+}
+
+/*
+ * Clear the slot for this peer in the metadata. If md_flags is empty, clear
+ * the slot completely. Otherwise make it a slot for a diskless peer. Also
+ * clear any bitmap associated with this peer.
+ */
+static int clear_peer_slot(struct drbd_device *device, int peer_node_id, u32 md_flags)
+{
+	struct drbd_peer_md *peer_md, *day0_md;
+	struct meta_data_on_disk_9 *buffer;
+	int from_index, freed_index;
+	bool free_bitmap_slot;
+
+	if (!get_ldev(device))
+		return -ENODEV;
+
+	peer_md = &device->ldev->md.peers[peer_node_id];
+	free_bitmap_slot = peer_md->flags & MDF_HAVE_BITMAP;
+	if (free_bitmap_slot) {
+		drbd_suspend_io(device, WRITE_ONLY);
+
+		/*
+		 * Unallocated slots are considered to track writes to the
+		 * device since day 0. In order to keep that promise, copy the
+		 * bitmap from an unallocated slot to this one, or set it to
+		 * all out-of-sync.
+		 */
+
+		from_index = drbd_unallocated_index(device->ldev);
+		freed_index = peer_md->bitmap_index;
+	}
+	buffer = drbd_md_get_buffer(device, __func__); /* lock meta-data IO to superblock */
+	if (buffer == NULL)
+		goto out_no_buffer;
+
+	/* Look for day0 UUID before changing this peer slot to a day0 slot. */
+	day0_md = day0_peer_md(device);
+
+	peer_md->flags &= md_flags & ~MDF_HAVE_BITMAP;
+	peer_md->bitmap_index = -1;
+
+	if (free_bitmap_slot) {
+		drbd_bm_lock(device, __func__, BM_LOCK_BULK);
+		/*
+		 * Regular bitmap OPs (calling into bm_op()) can run in parallel to
+		 * drbd_bm_copy_slot() and interleave with it as drbd_bm_copy_slot()
+		 * gives up its locks when it moves on to the next source page.
+		 * The bitmap->bm_all_slots_lock ensures that drbd_set_sync()
+		 * (which iterates over multiple slots) does not interleave with
+		 * drbd_bm_copy_slot() while it copies data from one slot to another
+		 * one.
+		 */
+		if (from_index != -1)
+			drbd_bm_copy_slot(device, from_index, freed_index);
+		else
+			_drbd_bm_set_many_bits(device, freed_index, 0, -1UL);
+
+		drbd_bm_write(device, NULL);
+		drbd_bm_unlock(device);
+	}
+
+	/*
+	 * When we forget a peer, we clear the flags. In this case, reset the
+	 * bitmap UUID to the day0 UUID. Peer slots without any bitmap index or
+	 * any flags set should always contain the day0 UUID.
+	 */
+	if (!peer_md->flags && day0_md) {
+		peer_md->bitmap_uuid = day0_md->bitmap_uuid;
+		peer_md->bitmap_dagtag = day0_md->bitmap_dagtag;
+	} else {
+		peer_md->bitmap_uuid = 0;
+		peer_md->bitmap_dagtag = 0;
+	}
+
+	clear_bit(MD_DIRTY, &device->flags);
+	drbd_md_write(device, buffer);
+	drbd_md_put_buffer(device);
+
+ out_no_buffer:
+	if (free_bitmap_slot)
+		drbd_resume_io(device);
+
+	put_ldev(device);
+
+	return 0;
+}
+
+bool want_bitmap(struct drbd_peer_device *peer_device)
+{
+	struct peer_device_conf *pdc;
+	bool want_bitmap = false;
+
+	rcu_read_lock();
+	pdc = rcu_dereference(peer_device->conf);
+	if (pdc)
+		want_bitmap |= pdc->bitmap;
+	rcu_read_unlock();
+
+	return want_bitmap;
+}
+
+static void close_backing_dev(struct drbd_device *device,
+		struct file *bdev_file, bool do_bd_unlink)
+{
+	if (!bdev_file)
+		return;
+	if (do_bd_unlink)
+		bd_unlink_disk_holder(file_bdev(bdev_file), device->vdisk);
+	fput(bdev_file);
+}
+
+void drbd_backing_dev_free(struct drbd_device *device, struct drbd_backing_dev *ldev)
+{
+	if (ldev == NULL)
+		return;
+
+	drbd_dax_close(ldev);
+
+	close_backing_dev(device,
+			  ldev->f_md_bdev,
+			  ldev->md_bdev != ldev->backing_bdev);
+	close_backing_dev(device, ldev->backing_bdev_file, true);
 
-	file = bdev_file_open_by_path(bdev_path, BLK_OPEN_READ | BLK_OPEN_WRITE,
-				      claim_ptr, NULL);
+	kfree(ldev->disk_conf);
+	kfree(ldev);
+}
+
+static struct file *open_backing_dev(struct drbd_device *device,
+		const char *bdev_path, void *claim_ptr)
+{
+	struct file *file = bdev_file_open_by_path(bdev_path,
+				  BLK_OPEN_READ | BLK_OPEN_WRITE,
+				  claim_ptr, NULL);
 	if (IS_ERR(file)) {
 		drbd_err(device, "open(\"%s\") failed with %ld\n",
 				bdev_path, PTR_ERR(file));
-		return file;
 	}
+	return file;
+}
 
-	if (!do_bd_link)
-		return file;
-
-	err = bd_link_disk_holder(file_bdev(file), device->vdisk);
+static int link_backing_dev(struct drbd_device *device,
+		const char *bdev_path, struct file *file)
+{
+	int err = bd_link_disk_holder(file_bdev(file), device->vdisk);
 	if (err) {
 		fput(file);
 		drbd_err(device, "bd_link_disk_holder(\"%s\", ...) failed with %d\n",
 				bdev_path, err);
-		file = ERR_PTR(err);
 	}
-	return file;
+	return err;
 }
 
 static int open_backing_devices(struct drbd_device *device,
@@ -1678,14 +2836,27 @@ static int open_backing_devices(struct drbd_device *device,
 		struct drbd_backing_dev *nbc)
 {
 	struct file *file;
+	void *meta_claim_ptr;
+	int err;
 
-	file = open_backing_dev(device, new_disk_conf->backing_dev, device,
-				  true);
+	file = open_backing_dev(device, new_disk_conf->backing_dev, device);
 	if (IS_ERR(file))
 		return ERR_OPEN_DISK;
+
+	err = link_backing_dev(device, new_disk_conf->backing_dev, file);
+	if (err) {
+		/* close without unlinking; otherwise error path will try to unlink */
+		close_backing_dev(device, file, false);
+		return ERR_OPEN_DISK;
+	}
 	nbc->backing_bdev = file_bdev(file);
 	nbc->backing_bdev_file = file;
 
+	/* meta_claim_ptr: device, if claimed exclusively; shared drbd_m_holder,
+	 * if potentially shared with other drbd minors
+	 */
+	meta_claim_ptr = (new_disk_conf->meta_dev_idx < 0) ?
+		(void *)device : (void *)drbd_m_holder;
 	/*
 	 * meta_dev_idx >= 0: external fixed size, possibly multiple
 	 * drbd sharing one meta device.  TODO in that case, paranoia
@@ -1694,95 +2865,402 @@ static int open_backing_devices(struct drbd_device *device,
 	 * should check it for you already; but if you don't, or
 	 * someone fooled it, we need to double check here)
 	 */
-	file = open_backing_dev(device, new_disk_conf->meta_dev,
-		/* claim ptr: device, if claimed exclusively; shared drbd_m_holder,
-		 * if potentially shared with other drbd minors */
-			(new_disk_conf->meta_dev_idx < 0) ? (void*)device : (void*)drbd_m_holder,
-		/* avoid double bd_claim_by_disk() for the same (source,target) tuple,
-		 * as would happen with internal metadata. */
-			(new_disk_conf->meta_dev_idx != DRBD_MD_INDEX_FLEX_INT &&
-			 new_disk_conf->meta_dev_idx != DRBD_MD_INDEX_INTERNAL));
+	file = open_backing_dev(device, new_disk_conf->meta_dev, meta_claim_ptr);
 	if (IS_ERR(file))
 		return ERR_OPEN_MD_DISK;
+
+	/* avoid double bd_claim_by_disk() for the same (source,target) tuple,
+	 * as would happen with internal metadata. */
+	if (file_bdev(file) != nbc->backing_bdev) {
+		err = link_backing_dev(device, new_disk_conf->meta_dev, file);
+		if (err) {
+			/* close without unlinking; otherwise error path will try to unlink */
+			close_backing_dev(device, file, false);
+			return ERR_OPEN_MD_DISK;
+		}
+	}
+
 	nbc->md_bdev = file_bdev(file);
 	nbc->f_md_bdev = file;
 	return NO_ERROR;
 }
 
-static void close_backing_dev(struct drbd_device *device,
-		struct file *bdev_file, bool do_bd_unlink)
+static int check_activity_log_stripe_size(struct drbd_device *device, struct drbd_md *md)
 {
-	if (!bdev_file)
-		return;
-	if (do_bd_unlink)
-		bd_unlink_disk_holder(file_bdev(bdev_file), device->vdisk);
-	fput(bdev_file);
-}
+	u32 al_stripes = md->al_stripes;
+	u32 al_stripe_size_4k = md->al_stripe_size_4k;
+	u64 al_size_4k;
 
-void drbd_backing_dev_free(struct drbd_device *device, struct drbd_backing_dev *ldev)
-{
-	if (ldev == NULL)
-		return;
+	/* both not set: default to old fixed size activity log */
+	if (al_stripes == 0 && al_stripe_size_4k == 0) {
+		al_stripes = 1;
+		al_stripe_size_4k = (32768 >> 9)/8;
+	}
 
-	close_backing_dev(device, ldev->f_md_bdev,
-			  ldev->md_bdev != ldev->backing_bdev);
-	close_backing_dev(device, ldev->backing_bdev_file, true);
+	/* some paranoia plausibility checks */
 
-	kfree(ldev->disk_conf);
-	kfree(ldev);
+	/* we need both values to be set */
+	if (al_stripes == 0 || al_stripe_size_4k == 0)
+		goto err;
+
+	al_size_4k = (u64)al_stripes * al_stripe_size_4k;
+
+	/* Upper limit of activity log area, to avoid potential overflow
+	 * problems in al_tr_number_to_on_disk_sector(). As right now, more
+	 * than 72 * 4k blocks total only increases the amount of history,
+	 * limiting this arbitrarily to 16 GB is not a real limitation ;-)  */
+	if (al_size_4k > (16 * 1024 * 1024/4))
+		goto err;
+
+	/* Lower limit: we need at least 8 transaction slots (32kB)
+	 * to not break existing setups */
+	if (al_size_4k < (32768 >> 9)/8)
+		goto err;
+
+	md->al_size_4k = al_size_4k;
+
+	return 0;
+err:
+	drbd_err(device, "invalid activity log striping: al_stripes=%u, al_stripe_size_4k=%u\n",
+			al_stripes, al_stripe_size_4k);
+	return -EINVAL;
 }
 
-int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
+static int check_offsets_and_sizes(struct drbd_device *device, struct drbd_backing_dev *bdev)
 {
-	struct drbd_config_context adm_ctx;
-	struct drbd_device *device;
-	struct drbd_peer_device *peer_device;
-	struct drbd_connection *connection;
-	int err;
-	enum drbd_ret_code retcode;
+	sector_t capacity = drbd_get_capacity(bdev->md_bdev);
+	struct drbd_md *md = &bdev->md;
+	s32 on_disk_al_sect;
+	s32 on_disk_bm_sect;
+
+	if (md->max_peers > DRBD_PEERS_MAX) {
+		drbd_err(device, "bm_max_peers too high\n");
+		goto err;
+	}
+
+	/* The on-disk size of the activity log, calculated from offsets, and
+	 * the size of the activity log calculated from the stripe settings,
+	 * should match.
+	 * Though we could relax this a bit: it is ok, if the striped activity log
+	 * fits in the available on-disk activity log size.
+	 * Right now, that would break how resize is implemented.
+	 * TODO: make drbd_determine_dev_size() (and the drbdmeta tool) aware
+	 * of possible unused padding space in the on disk layout. */
+	if (md->al_offset < 0) {
+		if (md->bm_offset > md->al_offset)
+			goto err;
+		on_disk_al_sect = -md->al_offset;
+		on_disk_bm_sect = md->al_offset - md->bm_offset;
+	} else {
+		if (md->al_offset != (4096 >> 9))
+			goto err;
+		if (md->bm_offset < md->al_offset + md->al_size_4k * (4096 >> 9))
+			goto err;
+
+		on_disk_al_sect = md->bm_offset - (4096 >> 9);
+		on_disk_bm_sect = md->md_size_sect - md->bm_offset;
+	}
+
+	/* old fixed size meta data is exactly that: fixed. */
+	if (md->meta_dev_idx >= 0) {
+		if (md->bm_block_size != BM_BLOCK_SIZE_4k
+		||  md->md_size_sect != (128 << 20 >> 9)
+		||  md->al_offset != (4096 >> 9)
+		||  md->bm_offset != (4096 >> 9) + (32768 >> 9)
+		||  md->al_stripes != 1
+		||  md->al_stripe_size_4k != (32768 >> 12))
+			goto err;
+	}
+
+	if (capacity < md->md_size_sect)
+		goto err;
+	if (capacity - md->md_size_sect < drbd_md_first_sector(bdev))
+		goto err;
+
+	/* should be aligned, and at least 32k */
+	if ((on_disk_al_sect & 7) || (on_disk_al_sect < (32768 >> 9)))
+		goto err;
+
+	/* should fit (for now: exactly) into the available on-disk space;
+	 * overflow prevention is in check_activity_log_stripe_size() above. */
+	if (on_disk_al_sect != md->al_size_4k * (4096 >> 9))
+		goto err;
+
+	/* again, should be aligned */
+	if (md->bm_offset & 7)
+		goto err;
+
+	/* FIXME check for device grow with flex external meta data? */
+
+	/* can the available bitmap space cover the last agreed device size? */
+	if (on_disk_bm_sect < drbd_capacity_to_on_disk_bm_sect(
+				md->effective_size, md))
+		goto err;
+
+	return 0;
+
+err:
+	drbd_err(device, "meta data offsets don't make sense: idx=%d bm_block_size=%d al_s=%u, al_sz4k=%u, al_offset=%d, bm_offset=%d, md_size_sect=%u, la_size=%llu, md_capacity=%llu\n",
+			md->meta_dev_idx, md->bm_block_size,
+			md->al_stripes, md->al_stripe_size_4k,
+			md->al_offset, md->bm_offset, md->md_size_sect,
+			(unsigned long long)md->effective_size,
+			(unsigned long long)capacity);
+
+	return -EINVAL;
+}
+
+__printf(2, 3)
+static void drbd_err_and_skb_info(struct drbd_config_context *adm_ctx, const char *format, ...)
+{
+	struct drbd_device *device = adm_ctx->device;
+	va_list args;
+	char *text;
+
+	va_start(args, format);
+	text = kvasprintf(GFP_ATOMIC, format, args);
+	va_end(args);
+
+	if (!text)
+		return;
+
+	drbd_err(device, "%s", text);
+	drbd_msg_put_info(adm_ctx->reply_skb, text);
+
+	kfree(text);
+}
+
+static void decode_md_9(struct meta_data_on_disk_9 *on_disk, struct drbd_md *md)
+{
+	int i;
+
+	md->effective_size = be64_to_cpu(on_disk->effective_size);
+	md->current_uuid = be64_to_cpu(on_disk->current_uuid);
+	md->prev_members = be64_to_cpu(on_disk->members);
+	md->device_uuid = be64_to_cpu(on_disk->device_uuid);
+	md->md_size_sect = be32_to_cpu(on_disk->md_size_sect);
+	md->al_offset = be32_to_cpu(on_disk->al_offset);
+
+	md->bm_offset = be32_to_cpu(on_disk->bm_offset);
+
+	md->flags = be32_to_cpu(on_disk->flags);
+
+	md->max_peers = be32_to_cpu(on_disk->bm_max_peers);
+	md->bm_block_size = be32_to_cpu(on_disk->bm_bytes_per_bit);
+	md->node_id = be32_to_cpu(on_disk->node_id);
+	md->al_stripes = be32_to_cpu(on_disk->al_stripes);
+	md->al_stripe_size_4k = be32_to_cpu(on_disk->al_stripe_size_4k);
+
+
+	for (i = 0; i < DRBD_NODE_ID_MAX; i++) {
+		struct drbd_peer_md *peer_md = &md->peers[i];
+
+		peer_md->bitmap_uuid = be64_to_cpu(on_disk->peers[i].bitmap_uuid);
+		peer_md->bitmap_dagtag = be64_to_cpu(on_disk->peers[i].bitmap_dagtag);
+		peer_md->flags = be32_to_cpu(on_disk->peers[i].flags);
+		peer_md->bitmap_index = be32_to_cpu(on_disk->peers[i].bitmap_index);
+
+		if (peer_md->bitmap_index == -1)
+			continue;
+		peer_md->flags |= MDF_HAVE_BITMAP;
+	}
+	for (i = 0; i < ARRAY_SIZE(on_disk->history_uuids); i++)
+		md->history_uuids[i] = be64_to_cpu(on_disk->history_uuids[i]);
+
+	BUILD_BUG_ON(ARRAY_SIZE(md->history_uuids) != ARRAY_SIZE(on_disk->history_uuids));
+}
+
+
+static void decode_magic(struct meta_data_on_disk_9 *on_disk, u32 *magic, u32 *flags)
+{
+	/* magic and flags are in at the same offsets in 8.4 and 9 */
+	*magic = be32_to_cpu(on_disk->magic);
+	*flags = be32_to_cpu(on_disk->flags);
+}
+
+static
+int drbd_md_decode(struct drbd_config_context *adm_ctx,
+		   struct drbd_backing_dev *bdev,
+		   void *buffer)
+{
+	struct drbd_device *device = adm_ctx->device;
+	u32 magic, flags;
+	int i, rv = NO_ERROR;
+	int my_node_id = device->resource->res_opts.node_id;
+
+	decode_magic(buffer, &magic, &flags);
+	if ((magic == DRBD_MD_MAGIC_09 && !(flags & MDF_AL_CLEAN)) ||
+	    magic == DRBD_MD_MAGIC_84_UNCLEAN ||
+	    (magic == DRBD_MD_MAGIC_08 && !(flags & MDF_AL_CLEAN))) {
+		/* btw: that's Activity Log clean, not "all" clean. */
+		drbd_err_and_skb_info(adm_ctx,
+				"Found unclean meta data. Did you \"drbdadm apply-al\"?\n");
+		rv = ERR_MD_UNCLEAN;
+		goto err;
+	}
+	rv = ERR_MD_INVALID;
+	if (magic != DRBD_MD_MAGIC_09 && magic !=
+	    DRBD_MD_MAGIC_84_UNCLEAN && magic !=  DRBD_MD_MAGIC_08) {
+		if (magic == DRBD_MD_MAGIC_07)
+			drbd_err_and_skb_info(adm_ctx,
+				"Found old meta data magic. Did you \"drbdadm create-md\"?\n");
+		else
+			drbd_err_and_skb_info(adm_ctx,
+				"Meta data magic not found. Did you \"drbdadm create-md\"?\n");
+		goto err;
+	}
+
+	if (magic == DRBD_MD_MAGIC_09) {
+		clear_bit(LEGACY_84_MD, &device->flags);
+		decode_md_9(buffer, &bdev->md);
+	} else {
+		if (!device->resource->res_opts.drbd8_compat_mode) {
+			drbd_err_and_skb_info(adm_ctx,
+				"Found old meta data magic. Did you \"drbdadm create-md\"?\n");
+			goto err;
+		}
+		set_bit(LEGACY_84_MD, &device->flags);
+		drbd_md_decode_84(buffer, &bdev->md);
+		if (bdev->md.bm_block_size != BM_BLOCK_SIZE_4k) {
+			drbd_err_and_skb_info(adm_ctx,
+				"unexpected bm_bytes_per_bit: %u (expected %u)\n",
+				bdev->md.bm_block_size, BM_BLOCK_SIZE_4k);
+			goto err;
+		}
+	}
+
+	if (!is_power_of_2(bdev->md.bm_block_size)
+	|| bdev->md.bm_block_size < BM_BLOCK_SIZE_MIN
+	|| bdev->md.bm_block_size > BM_BLOCK_SIZE_MAX) {
+		drbd_err_and_skb_info(adm_ctx,
+			"unexpected bm_bytes_per_bit: %u (expected power of 2 in [%u..%u])\n",
+			bdev->md.bm_block_size, BM_BLOCK_SIZE_MIN, BM_BLOCK_SIZE_MAX);
+		goto err;
+	}
+	bdev->md.bm_block_shift = ilog2(bdev->md.bm_block_size);
+
+	if (check_activity_log_stripe_size(device, &bdev->md))
+		goto err;
+	if (check_offsets_and_sizes(device, bdev))
+		goto err;
+
+	if (bdev->md.node_id != -1 && bdev->md.node_id != my_node_id) {
+		drbd_err_and_skb_info(adm_ctx, "ambiguous node id: meta-data: %d, config: %d\n",
+			bdev->md.node_id, my_node_id);
+		goto err;
+	}
+
+	for (i = 0; i < DRBD_NODE_ID_MAX; i++) {
+		struct drbd_peer_md *peer_md = &bdev->md.peers[i];
+
+		if (peer_md->bitmap_index == -1)
+			continue;
+		if (i == my_node_id) {
+			drbd_err_and_skb_info(adm_ctx, "my own node id (%d) should not have a bitmap index (%d)\n",
+				my_node_id, peer_md->bitmap_index);
+			goto err;
+		}
+		if (peer_md->bitmap_index < -1 || peer_md->bitmap_index >= bdev->md.max_peers) {
+			drbd_err_and_skb_info(adm_ctx, "peer node id %d: bitmap index (%d) exceeds allocated bitmap slots (%d)\n",
+				i, peer_md->bitmap_index, bdev->md.max_peers);
+			goto err;
+		}
+		/* maybe: for each bitmap_index != -1, create a connection object
+		 * with peer_node_id = i, unless already present. */
+	}
+
+	rv = NO_ERROR;
+
+err:
+	return rv;
+}
+
+/**
+ * drbd_md_read() - Reads in the meta data super block
+ * @adm_ctx:	DRBD config context.
+ * @bdev:	Device from which the meta data should be read in.
+ *
+ * Return NO_ERROR on success, and an enum drbd_ret_code in case
+ * something goes wrong.
+ *
+ * Called exactly once during drbd_adm_attach(), while still being D_DISKLESS,
+ * even before @bdev is assigned to @device->ldev.
+ */
+static int drbd_md_read(struct drbd_config_context *adm_ctx, struct drbd_backing_dev *bdev)
+{
+	struct drbd_device *device = adm_ctx->device;
+	void *buffer;
+	int rv;
+
+	if (device->disk_state[NOW] != D_DISKLESS)
+		return ERR_DISK_CONFIGURED;
+
+	/* First, figure out where our meta data superblock is located,
+	 * and read it. */
+	bdev->md.meta_dev_idx = bdev->disk_conf->meta_dev_idx;
+	bdev->md.md_offset = drbd_md_ss(bdev);
+	/* Even for (flexible or indexed) external meta data,
+	 * initially restrict us to the 4k superblock for now.
+	 * Affects the paranoia out-of-range access check in drbd_md_sync_page_io(). */
+	bdev->md.md_size_sect = 8;
+
+	drbd_dax_open(bdev);
+	if (drbd_md_dax_active(bdev)) {
+		drbd_info(device, "meta-data IO uses: dax-pmem\n");
+		rv = drbd_md_decode(adm_ctx, bdev, drbd_dax_md_addr(bdev));
+		if (rv != NO_ERROR)
+			return rv;
+		if (drbd_dax_map(bdev))
+			return ERR_IO_MD_DISK;
+		return NO_ERROR;
+	}
+	drbd_info(device, "meta-data IO uses: blk-bio\n");
+
+	buffer = drbd_md_get_buffer(device, __func__);
+	if (!buffer)
+		return ERR_NOMEM;
+
+	if (drbd_md_sync_page_io(device, bdev, bdev->md.md_offset,
+				 REQ_OP_READ)) {
+		/* NOTE: can't do normal error processing here as this is
+		   called BEFORE disk is attached */
+		drbd_err_and_skb_info(adm_ctx, "Error while reading metadata.\n");
+		rv = ERR_IO_MD_DISK;
+		goto err;
+	}
+
+	rv = drbd_md_decode(adm_ctx, bdev, buffer);
+ err:
+	drbd_md_put_buffer(device);
+
+	return rv;
+}
+
+static int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	struct drbd_device *device;
+	struct drbd_resource *resource;
+	int err, retcode;
 	enum determine_dev_size dd;
-	sector_t max_possible_sectors;
 	sector_t min_md_device_sectors;
-	struct drbd_backing_dev *nbc = NULL; /* new_backing_conf */
+	struct drbd_backing_dev *nbc; /* new_backing_conf */
+	sector_t backing_disk_max_sectors;
 	struct disk_conf *new_disk_conf = NULL;
-	struct lru_cache *resync_lru = NULL;
-	struct fifo_buffer *new_plan = NULL;
-	union drbd_state ns, os;
 	enum drbd_state_rv rv;
-	struct net_conf *nc;
+	struct drbd_peer_device *peer_device;
+	unsigned int slots_needed = 0;
+	bool have_conf_update = false;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto finish;
-
 	device = adm_ctx.device;
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	peer_device = first_peer_device(device);
-	connection = peer_device->connection;
-	conn_reconfig_start(connection);
-
-	/* if you want to reconfigure, please tear down first */
-	if (device->state.disk > D_DISKLESS) {
-		retcode = ERR_DISK_CONFIGURED;
-		goto fail;
+	resource = device->resource;
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
 	}
-	/* It may just now have detached because of IO error.  Make sure
-	 * drbd_ldev_destroy is done already, we may end up here very fast,
-	 * e.g. if someone calls attach from the on-io-error handler,
-	 * to realize a "hot spare" feature (not that I'd recommend that) */
-	wait_event(device->misc_wait, !test_bit(GOING_DISKLESS, &device->flags));
-
-	/* make sure there is no leftover from previous force-detach attempts */
-	clear_bit(FORCE_DETACH, &device->flags);
-	clear_bit(WAS_IO_ERROR, &device->flags);
-	clear_bit(WAS_READ_ERROR, &device->flags);
-
-	/* and no leftover from previously aborted resync or verify, either */
-	device->rs_total = 0;
-	device->rs_failed = 0;
-	atomic_set(&device->rs_pending_cnt, 0);
 
 	/* allocation not in the IO path, drbdsetup context */
 	nbc = kzalloc_obj(struct drbd_backing_dev);
@@ -1807,30 +3285,16 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 		goto fail;
 	}
 
-	if (new_disk_conf->c_plan_ahead > DRBD_C_PLAN_AHEAD_MAX)
-		new_disk_conf->c_plan_ahead = DRBD_C_PLAN_AHEAD_MAX;
-
-	new_plan = fifo_alloc((new_disk_conf->c_plan_ahead * 10 * SLEEP_TIME) / HZ);
-	if (!new_plan) {
-		retcode = ERR_NOMEM;
-		goto fail;
-	}
-
 	if (new_disk_conf->meta_dev_idx < DRBD_MD_INDEX_FLEX_INT) {
 		retcode = ERR_MD_IDX_INVALID;
 		goto fail;
 	}
 
-	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
-	if (nc) {
-		if (new_disk_conf->fencing == FP_STONITH && nc->wire_protocol == DRBD_PROT_A) {
-			rcu_read_unlock();
-			retcode = ERR_STONITH_AND_PROT_A;
-			goto fail;
-		}
-	}
-	rcu_read_unlock();
+	lock_all_resources();
+	retcode = drbd_resync_after_valid(device, new_disk_conf->resync_after);
+	unlock_all_resources();
+	if (retcode != NO_ERROR)
+		goto fail;
 
 	retcode = open_backing_devices(device, new_disk_conf, nbc);
 	if (retcode != NO_ERROR)
@@ -1843,37 +3307,80 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 		goto fail;
 	}
 
-	resync_lru = lc_create("resync", drbd_bm_ext_cache,
-			1, 61, sizeof(struct bm_extent),
-			offsetof(struct bm_extent, lce));
-	if (!resync_lru) {
-		retcode = ERR_NOMEM;
+	/* if you want to reconfigure, please tear down first */
+	if (device->disk_state[NOW] > D_DISKLESS) {
+		retcode = ERR_DISK_CONFIGURED;
 		goto fail;
 	}
+	/* It may just now have detached because of IO error.  Make sure
+	 * drbd_ldev_destroy is done already, we may end up here very fast,
+	 * e.g. if someone calls attach from the on-io-error handler,
+	 * to realize a "hot spare" feature (not that I'd recommend that) */
+	wait_event(device->misc_wait, !test_bit(GOING_DISKLESS, &device->flags));
+
+	/* make sure there is no leftover from previous force-detach attempts */
+	clear_bit(FORCE_DETACH, &device->flags);
+
+	/* and no leftover from previously aborted resync or verify, either */
+	for_each_peer_device(peer_device, device) {
+		while (atomic_read(&peer_device->rs_pending_cnt)) {
+			drbd_info_ratelimit(peer_device, "wait for rs_pending_cnt to clear\n");
+			if (schedule_timeout_interruptible(HZ / 10)) {
+				retcode = ERR_INTR;
+				goto fail;
+			}
+		}
+
+		peer_device->rs_total = 0;
+		peer_device->rs_failed = 0;
+	}
 
 	/* Read our meta data super block early.
-	 * This also sets other on-disk offsets. */
-	retcode = drbd_md_read(device, nbc);
+	 * This also sets other on-disk offsets.
+	 */
+	retcode = drbd_md_read(&adm_ctx, nbc);
 	if (retcode != NO_ERROR)
 		goto fail;
 
+	if (device->bitmap) {
+		drbd_err_and_skb_info(&adm_ctx, "already has a bitmap, this should not happen\n");
+		retcode = ERR_INVALID_REQUEST;
+		goto fail;
+	}
+
+	if (new_disk_conf->d_bitmap) {
+		/* ldev_safe: attach path, allocating bitmap */
+		device->bitmap = drbd_bm_alloc(nbc->md.max_peers, nbc->md.bm_block_shift);
+		if (!device->bitmap) {
+			retcode = ERR_NOMEM;
+			goto fail;
+		}
+	} else {
+		if (!list_empty(&resource->connections)) {
+			drbd_err_and_skb_info(&adm_ctx,
+				"Disabling bitmap allocation with peers defined is not allowed");
+			retcode = ERR_INVALID_REQUEST;
+			goto fail;
+		}
+	}
+	device->last_bm_block_shift = nbc->md.bm_block_shift;
+
 	sanitize_disk_conf(device, new_disk_conf, nbc);
 
-	if (drbd_get_max_capacity(nbc) < new_disk_conf->disk_size) {
-		drbd_err(device, "max capacity %llu smaller than disk size %llu\n",
-			(unsigned long long) drbd_get_max_capacity(nbc),
+	backing_disk_max_sectors = drbd_get_max_capacity(device, nbc, true);
+	if (backing_disk_max_sectors < new_disk_conf->disk_size) {
+		drbd_err_and_skb_info(&adm_ctx, "max capacity %llu smaller than disk size %llu\n",
+			(unsigned long long) backing_disk_max_sectors,
 			(unsigned long long) new_disk_conf->disk_size);
 		retcode = ERR_DISK_TOO_SMALL;
 		goto fail;
 	}
 
 	if (new_disk_conf->meta_dev_idx < 0) {
-		max_possible_sectors = DRBD_MAX_SECTORS_FLEX;
 		/* at least one MB, otherwise it does not make sense */
 		min_md_device_sectors = (2<<10);
 	} else {
-		max_possible_sectors = DRBD_MAX_SECTORS;
-		min_md_device_sectors = MD_128MB_SECT * (new_disk_conf->meta_dev_idx + 1);
+		min_md_device_sectors = (128 << 20 >> 9) * (new_disk_conf->meta_dev_idx + 1);
 	}
 
 	if (drbd_get_capacity(nbc->md_bdev) < min_md_device_sectors) {
@@ -1886,36 +3393,32 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 
 	/* Make sure the new disk is big enough
 	 * (we may currently be R_PRIMARY with no local disk...) */
-	if (drbd_get_max_capacity(nbc) < get_capacity(device->vdisk)) {
+	if (backing_disk_max_sectors <
+	    get_capacity(device->vdisk)) {
+		drbd_err_and_skb_info(&adm_ctx,
+			"Current (diskless) capacity %llu, cannot attach smaller (%llu) disk\n",
+			(unsigned long long)get_capacity(device->vdisk),
+			(unsigned long long)backing_disk_max_sectors);
 		retcode = ERR_DISK_TOO_SMALL;
 		goto fail;
 	}
 
 	nbc->known_size = drbd_get_capacity(nbc->backing_bdev);
 
-	if (nbc->known_size > max_possible_sectors) {
-		drbd_warn(device, "==> truncating very big lower level device "
-			"to currently maximum possible %llu sectors <==\n",
-			(unsigned long long) max_possible_sectors);
-		if (new_disk_conf->meta_dev_idx >= 0)
-			drbd_warn(device, "==>> using internal or flexible "
-				      "meta data may help <<==\n");
-	}
-
-	drbd_suspend_io(device);
-	/* also wait for the last barrier ack. */
-	/* FIXME see also https://daiquiri.linbit/cgi-bin/bugzilla/show_bug.cgi?id=171
-	 * We need a way to either ignore barrier acks for barriers sent before a device
-	 * was attached, or a way to wait for all pending barrier acks to come in.
-	 * As barriers are counted per resource,
-	 * we'd need to suspend io on all devices of a resource.
-	 */
-	wait_event(device->misc_wait, !atomic_read(&device->ap_pending_cnt) || drbd_suspended(device));
-	/* and for any other previously queued work */
-	drbd_flush_workqueue(&connection->sender_work);
-
-	rv = _drbd_request_state(device, NS(disk, D_ATTACHING), CS_VERBOSE);
+	drbd_suspend_io(device, READ_AND_WRITE);
+	wait_event(resource->barrier_wait, !barrier_pending(resource));
+	for_each_peer_device(peer_device, device)
+		wait_event(device->misc_wait,
+			   (!atomic_read(&peer_device->ap_pending_cnt) ||
+			    drbd_suspended(device)));
+	/* and for other previously queued resource work */
+	drbd_flush_workqueue(&resource->work);
+
+	rv = stable_state_change(resource,
+		change_disk_state(device, D_ATTACHING, CS_VERBOSE | CS_SERIALIZE, "attach", NULL));
 	retcode = (enum drbd_ret_code)rv;
+	if (rv >= SS_SUCCESS)
+		update_resource_dagtag(resource, nbc);
 	drbd_resume_io(device);
 	if (rv < SS_SUCCESS)
 		goto fail;
@@ -1923,20 +3426,97 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	if (!get_ldev_if_state(device, D_ATTACHING))
 		goto force_diskless;
 
-	if (!device->bitmap) {
-		if (drbd_bm_init(device)) {
-			retcode = ERR_NOMEM;
+	drbd_info(device, "Maximum number of peer devices = %u\n", nbc->md.max_peers);
+
+	mutex_lock(&resource->conf_update);
+	have_conf_update = true;
+
+	/* Make sure the local node id matches or is unassigned */
+	if (nbc->md.node_id != -1 && nbc->md.node_id != resource->res_opts.node_id) {
+		drbd_err_and_skb_info(&adm_ctx, "Local node id %d differs from local "
+			 "node id %d on device\n",
+			 resource->res_opts.node_id,
+			 nbc->md.node_id);
+		retcode = ERR_INVALID_REQUEST;
+		goto force_diskless_dec;
+	}
+
+	/* Make sure no bitmap slot has our own node id.
+	 * If we are operating in "drbd 8 compatibility mode", the node ID is
+	 * not yet initialized at this point, so just ignore this check.
+	 */
+	if (resource->res_opts.node_id != -1 &&
+	    nbc->md.peers[resource->res_opts.node_id].bitmap_index != -1) {
+		drbd_err_and_skb_info(&adm_ctx, "There is a bitmap for my own node id (%d)\n",
+			 resource->res_opts.node_id);
+		retcode = ERR_INVALID_REQUEST;
+		goto force_diskless_dec;
+	}
+
+	/* Make sure we have a bitmap slot for each peer id */
+	for_each_peer_device(peer_device, device) {
+		struct drbd_connection *connection = peer_device->connection;
+		int bitmap_index;
+
+		if (peer_device->bitmap_index != -1) {
+			drbd_err_and_skb_info(&adm_ctx,
+					"ASSERTION FAILED bitmap_index %d during attach, expected -1\n",
+					peer_device->bitmap_index);
+		}
+
+		bitmap_index = nbc->md.peers[connection->peer_node_id].bitmap_index;
+		if (want_bitmap(peer_device)) {
+			if (bitmap_index != -1)
+				peer_device->bitmap_index = bitmap_index;
+			else
+				slots_needed++;
+		} else if (bitmap_index != -1) {
+			/* Pretend in core that there is not bitmap for that peer,
+			   in the on disk meta-data we keep it until it is de-allocated
+			   with forget-peer */
+			nbc->md.peers[connection->peer_node_id].flags &= ~MDF_HAVE_BITMAP;
+		}
+	}
+	if (slots_needed) {
+		int slots_available = nbc->md.max_peers - used_bitmap_slots(nbc);
+
+		if (slots_needed > slots_available) {
+			drbd_err_and_skb_info(&adm_ctx, "Not enough free bitmap "
+				 "slots (available=%d, needed=%d)\n",
+				 slots_available,
+				 slots_needed);
+			retcode = ERR_INVALID_REQUEST;
 			goto force_diskless_dec;
 		}
+		for_each_peer_device(peer_device, device) {
+			if (peer_device->bitmap_index != -1 || !want_bitmap(peer_device))
+				continue;
+
+			err = allocate_bitmap_index(peer_device, nbc);
+			if (err) {
+				retcode = ERR_INVALID_REQUEST;
+				goto force_diskless_dec;
+			}
+		}
 	}
 
-	if (device->state.pdsk != D_UP_TO_DATE && device->ed_uuid &&
-	    (device->state.role == R_PRIMARY || device->state.peer == R_PRIMARY) &&
-            (device->ed_uuid & ~((u64)1)) != (nbc->md.uuid[UI_CURRENT] & ~((u64)1))) {
-		drbd_err(device, "Can only attach to data with current UUID=%016llX\n",
-		    (unsigned long long)device->ed_uuid);
-		retcode = ERR_DATA_NOT_CURRENT;
-		goto force_diskless_dec;
+	/* Assign the local node id (if not assigned already) */
+	nbc->md.node_id = resource->res_opts.node_id;
+
+	if (resource->role[NOW] == R_PRIMARY && device->exposed_data_uuid &&
+	    (device->exposed_data_uuid & ~UUID_PRIMARY) !=
+	    (nbc->md.current_uuid & ~UUID_PRIMARY)) {
+		int data_present = false;
+		for_each_peer_device(peer_device, device) {
+			if (peer_device->disk_state[NOW] == D_UP_TO_DATE)
+				data_present = true;
+		}
+		if (!data_present) {
+			drbd_err_and_skb_info(&adm_ctx, "Can only attach to data with current UUID=%016llX\n",
+				 (unsigned long long)device->exposed_data_uuid);
+			retcode = ERR_DATA_NOT_CURRENT;
+			goto force_diskless_dec;
+		}
 	}
 
 	/* Since we are diskless, fix the activity log first... */
@@ -1945,26 +3525,30 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 		goto force_diskless_dec;
 	}
 
-	/* Prevent shrinking of consistent devices ! */
-	{
-	unsigned long long nsz = drbd_new_dev_size(device, nbc, nbc->disk_conf->disk_size, 0);
-	unsigned long long eff = nbc->md.la_size_sect;
-	if (drbd_md_test_flag(nbc, MDF_CONSISTENT) && nsz < eff) {
-		if (nsz == nbc->disk_conf->disk_size) {
-			drbd_warn(device, "truncating a consistent device during attach (%llu < %llu)\n", nsz, eff);
-		} else {
-			drbd_warn(device, "refusing to truncate a consistent device (%llu < %llu)\n", nsz, eff);
-			drbd_msg_sprintf_info(adm_ctx.reply_skb,
-				"To-be-attached device has last effective > current size, and is consistent\n"
-				"(%llu > %llu sectors). Refusing to attach.", eff, nsz);
-			retcode = ERR_IMPLICIT_SHRINK;
+	/* Point of no return reached.
+	 * Devices and memory are no longer released by error cleanup below.
+	 * now device takes over responsibility, and the state engine should
+	 * clean it up somewhere.  */
+	D_ASSERT(device, device->ldev == NULL);
+	device->ldev = nbc;
+	nbc = NULL;
+	new_disk_conf = NULL;
+
+	if (drbd_md_dax_active(device->ldev)) {
+		/* The on-disk activity log is always initialized with the
+		 * non-pmem format. We have now decided to access it using
+		 * dax, so re-initialize it appropriately. */
+		if (drbd_dax_al_initialize(device)) {
+			retcode = ERR_IO_MD_DISK;
 			goto force_diskless_dec;
 		}
 	}
-	}
+
+	mutex_unlock(&resource->conf_update);
+	have_conf_update = false;
 
 	lock_all_resources();
-	retcode = drbd_resync_after_valid(device, new_disk_conf->resync_after);
+	retcode = drbd_resync_after_valid(device, device->ldev->disk_conf->resync_after);
 	if (retcode != NO_ERROR) {
 		unlock_all_resources();
 		goto force_diskless_dec;
@@ -1972,43 +3556,53 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 
 	/* Reset the "barriers don't work" bits here, then force meta data to
 	 * be written, to ensure we determine if barriers are supported. */
-	if (new_disk_conf->md_flushes)
+	if (device->ldev->disk_conf->md_flushes)
 		clear_bit(MD_NO_FUA, &device->flags);
 	else
 		set_bit(MD_NO_FUA, &device->flags);
 
-	/* Point of no return reached.
-	 * Devices and memory are no longer released by error cleanup below.
-	 * now device takes over responsibility, and the state engine should
-	 * clean it up somewhere.  */
-	D_ASSERT(device, device->ldev == NULL);
-	device->ldev = nbc;
-	device->resync = resync_lru;
-	device->rs_plan_s = new_plan;
-	nbc = NULL;
-	resync_lru = NULL;
-	new_disk_conf = NULL;
-	new_plan = NULL;
-
 	drbd_resync_after_changed(device);
-	drbd_bump_write_ordering(device->resource, device->ldev, WO_BDEV_FLUSH);
+	drbd_bump_write_ordering(resource, device->ldev, WO_BIO_BARRIER);
 	unlock_all_resources();
 
-	if (drbd_md_test_flag(device->ldev, MDF_CRASHED_PRIMARY))
+	/* Prevent shrinking of consistent devices ! */
+	{
+	unsigned long long nsz = drbd_new_dev_size(device, 0, device->ldev->disk_conf->disk_size, 0);
+	unsigned long long eff = device->ldev->md.effective_size;
+	if (drbd_md_test_flag(device->ldev, MDF_CONSISTENT) && nsz < eff) {
+		if (nsz == device->ldev->disk_conf->disk_size) {
+			drbd_warn(device, "truncating a consistent device during attach (%llu < %llu)\n", nsz, eff);
+		} else {
+			drbd_warn(device, "refusing to truncate a consistent device (%llu < %llu)\n", nsz, eff);
+			drbd_msg_sprintf_info(adm_ctx.reply_skb,
+				"To-be-attached device has last effective > current size, and is consistent\n"
+				"(%llu > %llu sectors). Refusing to attach.", eff, nsz);
+			retcode = ERR_IMPLICIT_SHRINK;
+			goto force_diskless_dec;
+		}
+	}
+	}
+
+	if (drbd_md_test_flag(device->ldev, MDF_HAVE_QUORUM) &&
+	    drbd_md_test_flag(device->ldev, MDF_WAS_UP_TO_DATE) &&
+	    device->ldev->md.prev_members == NODE_MASK(resource->res_opts.node_id))
+		set_bit(RESTORE_QUORUM, &device->flags);
+
+	if (drbd_md_test_flag(device->ldev, MDF_CRASHED_PRIMARY) &&
+	    !(resource->role[NOW] == R_PRIMARY && resource->susp_nod[NOW]) &&
+	    !device->exposed_data_uuid && !test_bit(NEW_CUR_UUID, &device->flags))
 		set_bit(CRASHED_PRIMARY, &device->flags);
 	else
 		clear_bit(CRASHED_PRIMARY, &device->flags);
 
-	if (drbd_md_test_flag(device->ldev, MDF_PRIMARY_IND) &&
-	    !(device->state.role == R_PRIMARY && device->resource->susp_nod))
-		set_bit(CRASHED_PRIMARY, &device->flags);
+	if (drbd_md_test_flag(device->ldev, MDF_PRIMARY_LOST_QUORUM) &&
+	    !device->have_quorum[NOW])
+		set_bit(PRIMARY_LOST_QUORUM, &device->flags);
 
-	device->send_cnt = 0;
-	device->recv_cnt = 0;
 	device->read_cnt = 0;
 	device->writ_cnt = 0;
 
-	drbd_reconsider_queue_parameters(device, device->ldev, NULL);
+	drbd_reconsider_queue_parameters(device, device->ldev);
 
 	/* If I am currently not R_PRIMARY,
 	 * but meta data primary indicator is set,
@@ -2024,147 +3618,163 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	 * so we can automatically recover from a crash of a
 	 * degraded but active "cluster" after a certain timeout.
 	 */
-	clear_bit(USE_DEGR_WFC_T, &device->flags);
-	if (device->state.role != R_PRIMARY &&
-	     drbd_md_test_flag(device->ldev, MDF_PRIMARY_IND) &&
-	    !drbd_md_test_flag(device->ldev, MDF_CONNECTED_IND))
-		set_bit(USE_DEGR_WFC_T, &device->flags);
-
-	dd = drbd_determine_dev_size(device, 0, NULL);
-	if (dd <= DS_ERROR) {
-		retcode = ERR_NOMEM_BITMAP;
-		goto force_diskless_dec;
-	} else if (dd == DS_GREW)
-		set_bit(RESYNC_AFTER_NEG, &device->flags);
-
-	if (drbd_md_test_flag(device->ldev, MDF_FULL_SYNC) ||
-	    (test_bit(CRASHED_PRIMARY, &device->flags) &&
-	     drbd_md_test_flag(device->ldev, MDF_AL_DISABLED))) {
-		drbd_info(device, "Assuming that all blocks are out of sync "
-		     "(aka FullSync)\n");
-		if (drbd_bitmap_io(device, &drbd_bmio_set_n_write,
-			"set_n_write from attaching", BM_LOCKED_MASK,
-			NULL)) {
-			retcode = ERR_IO_MD_DISK;
-			goto force_diskless_dec;
-		}
-	} else {
-		if (drbd_bitmap_io(device, &drbd_bm_read,
-			"read from attaching", BM_LOCKED_MASK,
-			NULL)) {
-			retcode = ERR_IO_MD_DISK;
-			goto force_diskless_dec;
-		}
+	for_each_peer_device(peer_device, device) {
+		clear_bit(USE_DEGR_WFC_T, &peer_device->flags);
+		if (resource->role[NOW] != R_PRIMARY &&
+		    drbd_md_test_flag(device->ldev, MDF_PRIMARY_IND) &&
+		    !drbd_md_test_peer_flag(peer_device, MDF_PEER_CONNECTED))
+			set_bit(USE_DEGR_WFC_T, &peer_device->flags);
 	}
 
-	if (_drbd_bm_total_weight(device) == drbd_bm_bits(device))
-		drbd_suspend_al(device); /* IO is still suspended here... */
-
-	spin_lock_irq(&device->resource->req_lock);
-	os = drbd_read_state(device);
-	ns = os;
-	/* If MDF_CONSISTENT is not set go into inconsistent state,
-	   otherwise investigate MDF_WasUpToDate...
-	   If MDF_WAS_UP_TO_DATE is not set go into D_OUTDATED disk state,
-	   otherwise into D_CONSISTENT state.
-	*/
-	if (drbd_md_test_flag(device->ldev, MDF_CONSISTENT)) {
-		if (drbd_md_test_flag(device->ldev, MDF_WAS_UP_TO_DATE))
-			ns.disk = D_CONSISTENT;
-		else
-			ns.disk = D_OUTDATED;
-	} else {
-		ns.disk = D_INCONSISTENT;
+	/*
+	 * If we are attaching to a disk that is marked as being up-to-date,
+	 * then we do not need to set the bitmap bits.
+	 */
+	dd = drbd_determine_dev_size(device, 0,
+			disk_state_from_md(device) == D_UP_TO_DATE ? DDSF_NO_RESYNC : 0,
+			NULL);
+	if (dd == DS_ERROR) {
+		retcode = ERR_NOMEM_BITMAP;
+		goto force_diskless_dec;
+	} else if (dd == DS_GREW) {
+		for_each_peer_device(peer_device, device)
+			set_bit(RESYNC_AFTER_NEG, &peer_device->flags);
 	}
 
-	if (drbd_md_test_flag(device->ldev, MDF_PEER_OUT_DATED))
-		ns.pdsk = D_OUTDATED;
-
-	rcu_read_lock();
-	if (ns.disk == D_CONSISTENT &&
-	    (ns.pdsk == D_OUTDATED || rcu_dereference(device->ldev->disk_conf)->fencing == FP_DONT_CARE))
-		ns.disk = D_UP_TO_DATE;
+	err = drbd_bitmap_io(device, &drbd_bm_read,
+			     "read from attaching", BM_LOCK_ALL,
+			     NULL);
+	if (err) {
+		retcode = ERR_IO_MD_DISK;
+		goto force_diskless_dec;
+	}
 
-	/* All tests on MDF_PRIMARY_IND, MDF_CONNECTED_IND,
-	   MDF_CONSISTENT and MDF_WAS_UP_TO_DATE must happen before
-	   this point, because drbd_request_state() modifies these
-	   flags. */
+	for_each_peer_device(peer_device, device) {
+		if ((test_bit(CRASHED_PRIMARY, &device->flags) &&
+		     drbd_md_test_flag(device->ldev, MDF_AL_DISABLED)) ||
+		    drbd_md_test_peer_flag(peer_device, MDF_PEER_FULL_SYNC)) {
+			drbd_info(peer_device, "Assuming that all blocks are out of sync "
+				  "(aka FullSync)\n");
+			if (drbd_bitmap_io(device, &drbd_bmio_set_n_write,
+				"set_n_write from attaching", BM_LOCK_ALL,
+				peer_device)) {
+				retcode = ERR_IO_MD_DISK;
+				goto force_diskless_dec;
+			}
+		}
+	}
 
-	if (rcu_dereference(device->ldev->disk_conf)->al_updates)
-		device->ldev->md.flags &= ~MDF_AL_DISABLED;
-	else
-		device->ldev->md.flags |= MDF_AL_DISABLED;
+	drbd_try_suspend_al(device); /* IO is still suspended here... */
 
-	rcu_read_unlock();
+	drbd_update_mdf_al_disabled(device, NOW);
 
-	/* In case we are C_CONNECTED postpone any decision on the new disk
-	   state after the negotiation phase. */
-	if (device->state.conn == C_CONNECTED) {
-		device->new_state_tmp.i = ns.i;
-		ns.i = os.i;
-		ns.disk = D_NEGOTIATING;
+	/* change_disk_state uses disk_state_from_md(device); in case D_NEGOTIATING not
+	   necessary, and falls back to a local state change */
+	rv = stable_state_change(resource, change_disk_state(device,
+				D_NEGOTIATING, CS_VERBOSE | CS_SERIALIZE, "attach", NULL));
 
-		/* We expect to receive up-to-date UUIDs soon.
-		   To avoid a race in receive_state, free p_uuid while
-		   holding req_lock. I.e. atomic with the state change */
-		kfree(device->p_uuid);
-		device->p_uuid = NULL;
+	if (rv < SS_SUCCESS) {
+		if (rv == SS_CW_FAILED_BY_PEER)
+			drbd_msg_put_info(adm_ctx.reply_skb,
+				"Probably this node is marked as intentional diskless on a peer");
+		retcode = rv;
+		goto force_diskless_dec;
 	}
 
-	rv = _drbd_set_state(device, ns, CS_VERBOSE, NULL);
-	spin_unlock_irq(&device->resource->req_lock);
-
-	if (rv < SS_SUCCESS)
-		goto force_diskless_dec;
+	device->device_conf.intentional_diskless = false; /* just in case... */
 
 	mod_timer(&device->request_timer, jiffies + HZ);
 
-	if (device->state.role == R_PRIMARY)
-		device->ldev->md.uuid[UI_CURRENT] |=  (u64)1;
+	if (resource->role[NOW] == R_PRIMARY
+	&&  device->ldev->md.current_uuid != UUID_JUST_CREATED)
+		device->ldev->md.current_uuid |= UUID_PRIMARY;
 	else
-		device->ldev->md.uuid[UI_CURRENT] &= ~(u64)1;
+		device->ldev->md.current_uuid &= ~UUID_PRIMARY;
 
-	drbd_md_mark_dirty(device);
 	drbd_md_sync(device);
 
 	kobject_uevent(&disk_to_dev(device->vdisk)->kobj, KOBJ_CHANGE);
 	put_ldev(device);
-	conn_reconfig_done(connection);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&resource->adm_mutex);
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 
  force_diskless_dec:
 	put_ldev(device);
  force_diskless:
-	drbd_force_state(device, NS(disk, D_DISKLESS));
-	drbd_md_sync(device);
+	change_disk_state(device, D_DISKLESS, CS_HARD, "attach", NULL);
  fail:
-	conn_reconfig_done(connection);
-	if (nbc) {
-		close_backing_dev(device, nbc->f_md_bdev,
-			  nbc->md_bdev != nbc->backing_bdev);
-		close_backing_dev(device, nbc->backing_bdev_file, true);
-		kfree(nbc);
-	}
-	kfree(new_disk_conf);
-	lc_destroy(resync_lru);
-	kfree(new_plan);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
- finish:
+	drbd_bm_free(device);
+	mutex_unlock_cond(&resource->conf_update, &have_conf_update);
+	drbd_backing_dev_free(device, nbc);
+	mutex_unlock(&resource->adm_mutex);
+ out_no_adm_mutex:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static int adm_detach(struct drbd_device *device, int force)
+static enum drbd_disk_state get_disk_state(struct drbd_device *device)
+{
+	struct drbd_resource *resource = device->resource;
+	enum drbd_disk_state disk_state;
+
+	read_lock_irq(&resource->state_rwlock);
+	disk_state = device->disk_state[NOW];
+	read_unlock_irq(&resource->state_rwlock);
+	return disk_state;
+}
+
+static int adm_detach(struct drbd_device *device, bool force, bool intentional_diskless,
+		      const char *tag, struct sk_buff *reply_skb)
 {
+	const char *err_str = NULL;
+	int ret, retcode;
+
+	device->device_conf.intentional_diskless = intentional_diskless;
 	if (force) {
 		set_bit(FORCE_DETACH, &device->flags);
-		drbd_force_state(device, NS(disk, D_FAILED));
-		return SS_SUCCESS;
+		change_disk_state(device, D_DETACHING, CS_HARD, tag, NULL);
+		retcode = SS_SUCCESS;
+		goto out;
 	}
 
-	return drbd_request_detach_interruptible(device);
+	drbd_suspend_io(device, READ_AND_WRITE); /* so no-one is stuck in drbd_al_begin_io */
+	retcode = stable_state_change(device->resource,
+		change_disk_state(device, D_DETACHING,
+			CS_VERBOSE | CS_SERIALIZE, tag, &err_str));
+	/*
+	 * D_DETACHING will transition to DISKLESS.
+	 * I did not use CS_WAIT_COMPLETE above since that would deadlock on a backing device that
+	 * does not finish the I/O requests from writing to internal meta-data.  Instead, I
+	 * explicitly flush the worker queue here to ensure w_after_state_change() is completed.
+	 */
+	drbd_flush_workqueue_interruptible(device);
+
+	drbd_resume_io(device);
+	ret = wait_event_interruptible(device->misc_wait,
+			get_disk_state(device) != D_DETACHING);
+	if (retcode >= SS_SUCCESS) {
+		wait_event_interruptible(device->misc_wait, !test_bit(GOING_DISKLESS, &device->flags));
+
+		device->al_writ_cnt = 0;
+		device->bm_writ_cnt = 0;
+		device->read_cnt = 0;
+		device->writ_cnt = 0;
+		clear_bit(AL_SUSPENDED, &device->flags);
+	} else {
+		device->device_conf.intentional_diskless = false;
+	}
+	if (retcode == SS_IS_DISKLESS)
+		retcode = SS_NOTHING_TO_DO;
+	if (ret)
+		retcode = ERR_INTR;
+out:
+	if (err_str) {
+		drbd_msg_put_info(reply_skb, err_str);
+		kfree(err_str);
+	} else if (retcode == SS_NO_UP_TO_DATE_DISK)
+		put_device_opener_info(device, reply_skb);
+	return retcode;
 }
 
 /* Detaching the disk is a process in multiple stages.  First we need to lock
@@ -2172,7 +3782,7 @@ static int adm_detach(struct drbd_device *device, int force)
  * Then we transition to D_DISKLESS, and wait for put_ldev() to return all
  * internal references as well.
  * Only then we have finally detached. */
-int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	enum drbd_ret_code retcode;
@@ -2182,8 +3792,6 @@ int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
 
 	if (info->attrs[DRBD_NLA_DETACH_PARMS]) {
 		err = detach_parms_from_attrs(&parms, info);
@@ -2194,9 +3802,14 @@ int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = adm_detach(adm_ctx.device, parms.force_detach);
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out;
+	}
+	retcode = (enum drbd_ret_code)adm_detach(adm_ctx.device, parms.force_detach,
+			parms.intentional_diskless_detach, "detach", adm_ctx.reply_skb);
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
+
 out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
@@ -2210,11 +3823,10 @@ static bool conn_resync_running(struct drbd_connection *connection)
 
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
-		if (device->state.conn == C_SYNC_SOURCE ||
-		    device->state.conn == C_SYNC_TARGET ||
-		    device->state.conn == C_PAUSED_SYNC_S ||
-		    device->state.conn == C_PAUSED_SYNC_T) {
+		if (peer_device->repl_state[NOW] == L_SYNC_SOURCE ||
+		    peer_device->repl_state[NOW] == L_SYNC_TARGET ||
+		    peer_device->repl_state[NOW] == L_PAUSED_SYNC_S ||
+		    peer_device->repl_state[NOW] == L_PAUSED_SYNC_T) {
 			rv = true;
 			break;
 		}
@@ -2232,9 +3844,8 @@ static bool conn_ov_running(struct drbd_connection *connection)
 
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
-		if (device->state.conn == C_VERIFY_S ||
-		    device->state.conn == C_VERIFY_T) {
+		if (peer_device->repl_state[NOW] == L_VERIFY_S ||
+		    peer_device->repl_state[NOW] == L_VERIFY_T) {
 			rv = true;
 			break;
 		}
@@ -2247,10 +3858,7 @@ static bool conn_ov_running(struct drbd_connection *connection)
 static enum drbd_ret_code
 _check_net_options(struct drbd_connection *connection, struct net_conf *old_net_conf, struct net_conf *new_net_conf)
 {
-	struct drbd_peer_device *peer_device;
-	int i;
-
-	if (old_net_conf && connection->cstate == C_WF_REPORT_PARAMS && connection->agreed_pro_version < 100) {
+	if (old_net_conf && connection->cstate[NOW] == C_CONNECTED && connection->agreed_pro_version < 100) {
 		if (new_net_conf->wire_protocol != old_net_conf->wire_protocol)
 			return ERR_NEED_APV_100;
 
@@ -2262,27 +3870,20 @@ _check_net_options(struct drbd_connection *connection, struct net_conf *old_net_
 	}
 
 	if (!new_net_conf->two_primaries &&
-	    conn_highest_role(connection) == R_PRIMARY &&
-	    conn_highest_peer(connection) == R_PRIMARY)
+	    connection->resource->role[NOW] == R_PRIMARY &&
+	    connection->peer_role[NOW] == R_PRIMARY)
 		return ERR_NEED_ALLOW_TWO_PRI;
 
 	if (new_net_conf->two_primaries &&
 	    (new_net_conf->wire_protocol != DRBD_PROT_C))
 		return ERR_NOT_PROTO_C;
 
-	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
-		struct drbd_device *device = peer_device->device;
-		if (get_ldev(device)) {
-			enum drbd_fencing_p fp = rcu_dereference(device->ldev->disk_conf)->fencing;
-			put_ldev(device);
-			if (new_net_conf->wire_protocol == DRBD_PROT_A && fp == FP_STONITH)
-				return ERR_STONITH_AND_PROT_A;
-		}
-		if (device->state.role == R_PRIMARY && new_net_conf->discard_my_data)
-			return ERR_DISCARD_IMPOSSIBLE;
-	}
+	if (new_net_conf->wire_protocol == DRBD_PROT_A &&
+	    new_net_conf->fencing_policy == FP_STONITH)
+		return ERR_STONITH_AND_PROT_A;
 
-	if (new_net_conf->on_congestion != OC_BLOCK && new_net_conf->wire_protocol != DRBD_PROT_A)
+	if (new_net_conf->on_congestion != OC_BLOCK &&
+	    new_net_conf->wire_protocol != DRBD_PROT_A)
 		return ERR_CONG_NOT_PROTO_A;
 
 	return NO_ERROR;
@@ -2292,22 +3893,11 @@ static enum drbd_ret_code
 check_net_options(struct drbd_connection *connection, struct net_conf *new_net_conf)
 {
 	enum drbd_ret_code rv;
-	struct drbd_peer_device *peer_device;
-	int i;
 
 	rcu_read_lock();
-	rv = _check_net_options(connection, rcu_dereference(connection->net_conf), new_net_conf);
+	rv = _check_net_options(connection, rcu_dereference(connection->transport.net_conf), new_net_conf);
 	rcu_read_unlock();
 
-	/* connection->peer_devices protected by genl_lock() here */
-	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
-		struct drbd_device *device = peer_device->device;
-		if (!device->bitmap) {
-			if (drbd_bm_init(device))
-				return ERR_NOMEM;
-		}
-	}
-
 	return rv;
 }
 
@@ -2318,48 +3908,88 @@ struct crypto {
 	struct crypto_shash *integrity_tfm;
 };
 
+static bool needs_key(struct crypto_shash *h)
+{
+	return h && (crypto_shash_get_flags(h) & CRYPTO_TFM_NEED_KEY);
+}
+
+/**
+ * alloc_shash() - Allocate a keyed or unkeyed shash algorithm
+ * @tfm: Destination crypto_shash
+ * @tfm_name: Which algorithm to use
+ * @type: The functionality that the hash is used for
+ * @must_unkeyed: If set, a check is included which ensures that the algorithm
+ * 	     does not require a key
+ * @reply_skb: for sending detailed error description to user-space
+ */
 static int
-alloc_shash(struct crypto_shash **tfm, char *tfm_name, int err_alg)
+alloc_shash(struct crypto_shash **tfm, char *tfm_name, const char *type, bool must_unkeyed,
+	    struct sk_buff *reply_skb)
 {
 	if (!tfm_name[0])
-		return NO_ERROR;
+		return 0;
 
 	*tfm = crypto_alloc_shash(tfm_name, 0, 0);
 	if (IS_ERR(*tfm)) {
+		drbd_msg_sprintf_info(reply_skb, "failed to allocate %s for %s\n", tfm_name, type);
 		*tfm = NULL;
-		return err_alg;
+		return -EINVAL;
 	}
 
-	return NO_ERROR;
+	if (must_unkeyed && needs_key(*tfm)) {
+		drbd_msg_sprintf_info(reply_skb,
+				      "may not use %s for %s. It requires an unkeyed algorithm\n",
+				      tfm_name, type);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static enum drbd_ret_code
-alloc_crypto(struct crypto *crypto, struct net_conf *new_net_conf)
+alloc_crypto(struct crypto *crypto, struct net_conf *new_net_conf, struct sk_buff *reply_skb)
 {
 	char hmac_name[CRYPTO_MAX_ALG_NAME];
-	enum drbd_ret_code rv;
+	int digest_size = 0;
+	int err;
+
+	err = alloc_shash(&crypto->csums_tfm, new_net_conf->csums_alg,
+			  "csums", true, reply_skb);
+	if (err)
+		return ERR_CSUMS_ALG;
+
+	err = alloc_shash(&crypto->verify_tfm, new_net_conf->verify_alg,
+			  "verify", true, reply_skb);
+	if (err)
+		return ERR_VERIFY_ALG;
+
+	err = alloc_shash(&crypto->integrity_tfm, new_net_conf->integrity_alg,
+			  "integrity", true, reply_skb);
+	if (err)
+		return ERR_INTEGRITY_ALG;
+
+	if (crypto->integrity_tfm) {
+		const int max_digest_size = sizeof(((struct drbd_connection *)0)->scratch_buffer.d.before);
+		digest_size = crypto_shash_digestsize(crypto->integrity_tfm);
+		if (digest_size > max_digest_size) {
+			drbd_msg_sprintf_info(reply_skb,
+				"we currently support only digest sizes <= %d bits, but digest size of %s is %d bits\n",
+				max_digest_size * 8, new_net_conf->integrity_alg, digest_size * 8);
+			return ERR_INTEGRITY_ALG;
+		}
+	}
 
-	rv = alloc_shash(&crypto->csums_tfm, new_net_conf->csums_alg,
-			 ERR_CSUMS_ALG);
-	if (rv != NO_ERROR)
-		return rv;
-	rv = alloc_shash(&crypto->verify_tfm, new_net_conf->verify_alg,
-			 ERR_VERIFY_ALG);
-	if (rv != NO_ERROR)
-		return rv;
-	rv = alloc_shash(&crypto->integrity_tfm, new_net_conf->integrity_alg,
-			 ERR_INTEGRITY_ALG);
-	if (rv != NO_ERROR)
-		return rv;
 	if (new_net_conf->cram_hmac_alg[0] != 0) {
 		snprintf(hmac_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
 			 new_net_conf->cram_hmac_alg);
 
-		rv = alloc_shash(&crypto->cram_hmac_tfm, hmac_name,
-				 ERR_AUTH_ALG);
+		err = alloc_shash(&crypto->cram_hmac_tfm, hmac_name,
+				  "hmac", false, reply_skb);
+		if (err)
+			return ERR_AUTH_ALG;
 	}
 
-	return rv;
+	return NO_ERROR;
 }
 
 static void free_crypto(struct crypto *crypto)
@@ -2370,11 +4000,12 @@ static void free_crypto(struct crypto *crypto)
 	crypto_free_shash(crypto->verify_tfm);
 }
 
-int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	enum drbd_ret_code retcode;
 	struct drbd_connection *connection;
+	struct drbd_transport *transport;
 	struct net_conf *old_net_conf, *new_net_conf = NULL;
 	int err;
 	int ovr; /* online verify running */
@@ -2384,11 +4015,12 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto finish;
 
 	connection = adm_ctx.connection;
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
 
 	new_net_conf = kzalloc_obj(struct net_conf);
 	if (!new_net_conf) {
@@ -2396,11 +4028,12 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 		goto out;
 	}
 
-	conn_reconfig_start(connection);
+	drbd_flush_workqueue(&connection->sender_work);
 
-	mutex_lock(&connection->data.mutex);
 	mutex_lock(&connection->resource->conf_update);
-	old_net_conf = connection->net_conf;
+	mutex_lock(&connection->mutex[DATA_STREAM]);
+	transport = &connection->transport;
+	old_net_conf = transport->net_conf;
 
 	if (!old_net_conf) {
 		drbd_msg_put_info(adm_ctx.reply_skb, "net conf missing, try connect");
@@ -2412,6 +4045,12 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 	if (should_set_defaults(info))
 		set_net_conf_defaults(new_net_conf);
 
+	/* The transport_name is immutable taking precedence over set_net_conf_defaults() */
+	memcpy(new_net_conf->transport_name, old_net_conf->transport_name,
+	       old_net_conf->transport_name_len);
+	new_net_conf->transport_name_len = old_net_conf->transport_name_len;
+	new_net_conf->load_balance_paths = old_net_conf->load_balance_paths;
+
 	err = net_conf_from_attrs_for_change(new_net_conf, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
@@ -2437,11 +4076,22 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 		goto fail;
 	}
 
-	retcode = alloc_crypto(&crypto, new_net_conf);
+	retcode = alloc_crypto(&crypto, new_net_conf, adm_ctx.reply_skb);
 	if (retcode != NO_ERROR)
 		goto fail;
 
-	rcu_assign_pointer(connection->net_conf, new_net_conf);
+	/* Call before updating net_conf in case the transport needs to compare
+	 * old and new configurations. */
+	err = transport->class->ops.net_conf_change(transport, new_net_conf);
+	if (err) {
+		drbd_msg_sprintf_info(adm_ctx.reply_skb, "transport net_conf_change failed: %d",
+				      err);
+		retcode = ERR_INVALID_REQUEST;
+		goto fail;
+	}
+
+	rcu_assign_pointer(transport->net_conf, new_net_conf);
+	connection->fencing_policy = new_net_conf->fencing_policy;
 
 	if (!rsr) {
 		crypto_free_shash(connection->csums_tfm);
@@ -2456,18 +4106,18 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 
 	crypto_free_shash(connection->integrity_tfm);
 	connection->integrity_tfm = crypto.integrity_tfm;
-	if (connection->cstate >= C_WF_REPORT_PARAMS && connection->agreed_pro_version >= 100)
+	if (connection->cstate[NOW] >= C_CONNECTED && connection->agreed_pro_version >= 100)
 		/* Do this without trying to take connection->data.mutex again.  */
 		__drbd_send_protocol(connection, P_PROTOCOL_UPDATE);
 
 	crypto_free_shash(connection->cram_hmac_tfm);
 	connection->cram_hmac_tfm = crypto.cram_hmac_tfm;
 
+	mutex_unlock(&connection->mutex[DATA_STREAM]);
 	mutex_unlock(&connection->resource->conf_update);
-	mutex_unlock(&connection->data.mutex);
 	kvfree_rcu_mightsleep(old_net_conf);
 
-	if (connection->cstate >= C_WF_REPORT_PARAMS) {
+	if (connection->cstate[NOW] >= C_CONNECTED) {
 		struct drbd_peer_device *peer_device;
 		int vnr;
 
@@ -2475,277 +4125,1037 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 			drbd_send_sync_param(peer_device);
 	}
 
-	goto done;
+	goto out;
 
  fail:
+	mutex_unlock(&connection->mutex[DATA_STREAM]);
 	mutex_unlock(&connection->resource->conf_update);
-	mutex_unlock(&connection->data.mutex);
 	free_crypto(&crypto);
 	kfree(new_net_conf);
- done:
-	conn_reconfig_done(connection);
  out:
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
- finish:
+ out_no_adm_mutex:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static void connection_to_info(struct connection_info *info,
-			       struct drbd_connection *connection)
+static int adjust_resync_fifo(struct drbd_peer_device *peer_device,
+			      struct peer_device_conf *conf,
+			      struct fifo_buffer **pp_old_plan)
 {
-	info->conn_connection_state = connection->cstate;
-	info->conn_role = conn_highest_peer(connection);
-}
+	struct fifo_buffer *old_plan, *new_plan = NULL;
+	unsigned int fifo_size;
 
-static void peer_device_to_info(struct peer_device_info *info,
-				struct drbd_peer_device *peer_device)
-{
-	struct drbd_device *device = peer_device->device;
+	fifo_size = (conf->c_plan_ahead * 10 * RS_MAKE_REQS_INTV) / HZ;
+
+	old_plan = rcu_dereference_protected(peer_device->rs_plan_s,
+			     lockdep_is_held(&peer_device->connection->resource->conf_update));
+	if (!old_plan || fifo_size != old_plan->size) {
+		new_plan = fifo_alloc(fifo_size);
+		if (!new_plan) {
+			drbd_err(peer_device, "kmalloc of fifo_buffer failed");
+			return -ENOMEM;
+		}
+		rcu_assign_pointer(peer_device->rs_plan_s, new_plan);
+		if (pp_old_plan)
+			*pp_old_plan = old_plan;
+	}
 
-	info->peer_repl_state =
-		max_t(enum drbd_conns, C_WF_REPORT_PARAMS, device->state.conn);
-	info->peer_disk_state = device->state.pdsk;
-	info->peer_resync_susp_user = device->state.user_isp;
-	info->peer_resync_susp_peer = device->state.peer_isp;
-	info->peer_resync_susp_dependency = device->state.aftr_isp;
+	return 0;
 }
 
-int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_peer_device_opts(struct sk_buff *skb, struct genl_info *info)
 {
-	struct connection_info connection_info;
-	enum drbd_notification_type flags;
-	unsigned int peer_devices = 0;
 	struct drbd_config_context adm_ctx;
-	struct drbd_peer_device *peer_device;
-	struct net_conf *old_net_conf, *new_net_conf = NULL;
-	struct crypto crypto = { };
-	struct drbd_resource *resource;
-	struct drbd_connection *connection;
 	enum drbd_ret_code retcode;
-	enum drbd_state_rv rv;
-	int i;
+	struct drbd_peer_device *peer_device;
+	struct peer_device_conf *old_peer_device_conf, *new_peer_device_conf = NULL;
+	struct fifo_buffer *old_plan = NULL;
+	struct drbd_device *device;
+	bool notify = false;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
-
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_DEVICE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
-	if (!(adm_ctx.my_addr && adm_ctx.peer_addr)) {
-		drbd_msg_put_info(adm_ctx.reply_skb, "connection endpoint(s) missing");
-		retcode = ERR_INVALID_REQUEST;
-		goto out;
+
+	peer_device = adm_ctx.peer_device;
+	device = peer_device->device;
+
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
 	}
+	mutex_lock(&adm_ctx.resource->conf_update);
 
-	/* No need for _rcu here. All reconfiguration is
-	 * strictly serialized on genl_lock(). We are protected against
-	 * concurrent reconfiguration/addition/deletion */
-	for_each_resource(resource, &drbd_resources) {
-		for_each_connection(connection, resource) {
-			if (nla_len(adm_ctx.my_addr) == connection->my_addr_len &&
-			    !memcmp(nla_data(adm_ctx.my_addr), &connection->my_addr,
-				    connection->my_addr_len)) {
-				retcode = ERR_LOCAL_ADDR;
-				goto out;
-			}
+	new_peer_device_conf = kzalloc_obj(struct peer_device_conf);
+	if (!new_peer_device_conf)
+		goto fail;
 
-			if (nla_len(adm_ctx.peer_addr) == connection->peer_addr_len &&
-			    !memcmp(nla_data(adm_ctx.peer_addr), &connection->peer_addr,
-				    connection->peer_addr_len)) {
-				retcode = ERR_PEER_ADDR;
-				goto out;
+	old_peer_device_conf = peer_device->conf;
+	*new_peer_device_conf = *old_peer_device_conf;
+	if (should_set_defaults(info))
+		set_peer_device_conf_defaults(new_peer_device_conf);
+
+	err = peer_device_conf_from_attrs_for_change(new_peer_device_conf, info);
+	if (err && err != -ENOMSG) {
+		retcode = ERR_MANDATORY_TAG;
+		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		goto fail_ret_set;
+	}
+
+	if (!old_peer_device_conf->bitmap && new_peer_device_conf->bitmap &&
+	    peer_device->bitmap_index == -1) {
+		if (get_ldev(device)) {
+			err = allocate_bitmap_index(peer_device, device->ldev);
+			put_ldev(device);
+			if (err) {
+				drbd_msg_put_info(adm_ctx.reply_skb,
+						  "No bitmap slot available in meta-data");
+				retcode = ERR_INVALID_REQUEST;
+				goto fail_ret_set;
 			}
+			drbd_info(peer_device,
+				  "Former intentional diskless peer got bitmap slot %d\n",
+				  peer_device->bitmap_index);
+			drbd_md_sync(device);
+			notify = true;
+		}
+	}
+
+	if (old_peer_device_conf->bitmap && !new_peer_device_conf->bitmap) {
+		enum drbd_disk_state pdsk = peer_device->disk_state[NOW];
+		enum drbd_disk_state disk = device->disk_state[NOW];
+		if (!(disk == D_DISKLESS || pdsk == D_DISKLESS || pdsk == D_UNKNOWN)) {
+			drbd_msg_put_info(adm_ctx.reply_skb,
+					  "Can not drop the bitmap when both sides have a disk");
+			retcode = ERR_INVALID_REQUEST;
+			goto fail_ret_set;
+		}
+		err = clear_peer_slot(device, peer_device->node_id, MDF_NODE_EXISTS);
+		if (!err) {
+			peer_device->bitmap_index = -1;
+			notify = true;
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	connection = first_connection(adm_ctx.resource);
-	conn_reconfig_start(connection);
+	if (!expect(peer_device, new_peer_device_conf->resync_rate >= 1))
+		new_peer_device_conf->resync_rate = 1;
 
-	if (connection->cstate > C_STANDALONE) {
-		retcode = ERR_NET_CONFIGURED;
+	if (new_peer_device_conf->c_plan_ahead > DRBD_C_PLAN_AHEAD_MAX)
+		new_peer_device_conf->c_plan_ahead = DRBD_C_PLAN_AHEAD_MAX;
+
+	err = adjust_resync_fifo(peer_device, new_peer_device_conf, &old_plan);
+	if (err)
 		goto fail;
-	}
 
-	/* allocation not in the IO path, drbdsetup / netlink process context */
-	new_net_conf = kzalloc_obj(*new_net_conf);
-	if (!new_net_conf) {
+	rcu_assign_pointer(peer_device->conf, new_peer_device_conf);
+
+	kvfree_rcu_mightsleep(old_peer_device_conf);
+	kfree(old_plan);
+
+	/* No need to call drbd_send_sync_param() here. The values in
+	 * peer_device->conf that we send are ignored by recent peers anyway. */
+
+	if (0) {
+fail:
 		retcode = ERR_NOMEM;
-		goto fail;
+fail_ret_set:
+		kfree(new_peer_device_conf);
 	}
 
-	set_net_conf_defaults(new_net_conf);
+	mutex_unlock(&adm_ctx.resource->conf_update);
+	mutex_unlock(&adm_ctx.resource->adm_mutex);
+out_no_adm_mutex:
+	if (notify)
+		drbd_broadcast_peer_device_state(peer_device);
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
 
-	err = net_conf_from_attrs(new_net_conf, info);
-	if (err && err != -ENOMSG) {
-		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
-		goto fail;
-	}
+}
 
-	retcode = check_net_options(connection, new_net_conf);
-	if (retcode != NO_ERROR)
-		goto fail;
+int drbd_create_peer_device_default_config(struct drbd_peer_device *peer_device)
+{
+	struct peer_device_conf *conf;
+	int err;
 
-	retcode = alloc_crypto(&crypto, new_net_conf);
-	if (retcode != NO_ERROR)
-		goto fail;
+	conf = kzalloc_obj(*conf);
+	if (!conf)
+		return -ENOMEM;
 
-	((char *)new_net_conf->shared_secret)[SHARED_SECRET_MAX-1] = 0;
+	set_peer_device_conf_defaults(conf);
+	err = adjust_resync_fifo(peer_device, conf, NULL);
+	if (err)
+		return err;
 
-	drbd_flush_workqueue(&connection->sender_work);
+	peer_device->conf = conf;
 
-	mutex_lock(&adm_ctx.resource->conf_update);
-	old_net_conf = connection->net_conf;
-	if (old_net_conf) {
-		retcode = ERR_NET_CONFIGURED;
-		mutex_unlock(&adm_ctx.resource->conf_update);
-		goto fail;
-	}
-	rcu_assign_pointer(connection->net_conf, new_net_conf);
+	return 0;
+}
 
-	conn_free_crypto(connection);
-	connection->cram_hmac_tfm = crypto.cram_hmac_tfm;
-	connection->integrity_tfm = crypto.integrity_tfm;
-	connection->csums_tfm = crypto.csums_tfm;
-	connection->verify_tfm = crypto.verify_tfm;
+static void connection_to_info(struct connection_info *info,
+			       struct drbd_connection *connection)
+{
+	info->conn_connection_state = connection->cstate[NOW];
+	info->conn_role = connection->peer_role[NOW];
+}
 
-	connection->my_addr_len = nla_len(adm_ctx.my_addr);
-	memcpy(&connection->my_addr, nla_data(adm_ctx.my_addr), connection->my_addr_len);
-	connection->peer_addr_len = nla_len(adm_ctx.peer_addr);
-	memcpy(&connection->peer_addr, nla_data(adm_ctx.peer_addr), connection->peer_addr_len);
+#define str_to_info(info, field, str) ({ \
+	strscpy(info->field, str, sizeof(info->field)); \
+	info->field ## _len = min(strlen(str), sizeof(info->field)); \
+})
 
-	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
-		peer_devices++;
-	}
+/* shared logic between peer_device_to_info and peer_device_state_change_to_info */
+static void __peer_device_to_info(struct peer_device_info *info,
+				  struct drbd_peer_device *peer_device,
+				  enum which_state which)
+{
+	info->peer_resync_susp_dependency = resync_susp_comb_dep(peer_device, which);
+	info->peer_is_intentional_diskless = !want_bitmap(peer_device);
+}
 
-	connection_to_info(&connection_info, connection);
-	flags = (peer_devices--) ? NOTIFY_CONTINUES : 0;
-	mutex_lock(&notification_mutex);
-	notify_connection_state(NULL, 0, connection, &connection_info, NOTIFY_CREATE | flags);
-	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
-		struct peer_device_info peer_device_info;
+static void peer_device_to_info(struct peer_device_info *info,
+				struct drbd_peer_device *peer_device)
+{
+	info->peer_repl_state = peer_device->repl_state[NOW];
+	info->peer_disk_state = peer_device->disk_state[NOW];
+	info->peer_resync_susp_user = peer_device->resync_susp_user[NOW];
+	info->peer_resync_susp_peer = peer_device->resync_susp_peer[NOW];
+	__peer_device_to_info(info, peer_device, NOW);
+}
 
-		peer_device_to_info(&peer_device_info, peer_device);
-		flags = (peer_devices--) ? NOTIFY_CONTINUES : 0;
-		notify_peer_device_state(NULL, 0, peer_device, &peer_device_info, NOTIFY_CREATE | flags);
+void peer_device_state_change_to_info(struct peer_device_info *info,
+				      struct drbd_peer_device_state_change *state_change)
+{
+	info->peer_repl_state = state_change->repl_state[NEW];
+	info->peer_disk_state = state_change->disk_state[NEW];
+	info->peer_resync_susp_user = state_change->resync_susp_user[NEW];
+	info->peer_resync_susp_peer = state_change->resync_susp_peer[NEW];
+	__peer_device_to_info(info, state_change->peer_device, NEW);
+}
+
+/* shared logic between device_to_info and device_state_change_to_info */
+static void __device_to_info(struct device_info *info,
+			     struct drbd_device *device)
+{
+	info->is_intentional_diskless = device->device_conf.intentional_diskless;
+	info->dev_is_open = device->open_cnt != 0;
+
+	rcu_read_lock();
+	if (get_ldev(device)) {
+		struct disk_conf *disk_conf =
+			rcu_dereference(device->ldev->disk_conf);
+		str_to_info(info, backing_dev_path, disk_conf->backing_dev);
+		put_ldev(device);
+	} else {
+		info->backing_dev_path[0] = '\0';
+		info->backing_dev_path_len = 0;
 	}
-	mutex_unlock(&notification_mutex);
-	mutex_unlock(&adm_ctx.resource->conf_update);
+	rcu_read_unlock();
+}
+
+void device_to_info(struct device_info *info,
+			   struct drbd_device *device)
+{
+	info->dev_disk_state = device->disk_state[NOW];
+	info->dev_has_quorum = device->have_quorum[NOW];
+	__device_to_info(info, device);
+}
+
+void device_state_change_to_info(struct device_info *info,
+				 struct drbd_device_state_change *state_change)
+{
+	info->dev_disk_state = state_change->disk_state[NEW];
+	info->dev_has_quorum = state_change->have_quorum[NEW];
+	__device_to_info(info, state_change->device);
+}
+
+static bool is_resync_target_in_other_connection(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_peer_device *p;
+
+	for_each_peer_device(p, device) {
+		if (p == peer_device)
+			continue;
+
+		if (p->repl_state[NOW] == L_SYNC_TARGET)
+			return true;
+	}
+
+	return false;
+}
+
+static enum drbd_ret_code drbd_check_name_str(const char *name, const bool strict);
+static void drbd_msg_put_name_error(struct sk_buff *reply_skb, enum drbd_ret_code ret_code);
+
+static enum drbd_ret_code drbd_check_conn_name(struct drbd_resource *resource, const char *new_name)
+{
+	struct drbd_connection *connection;
+	enum drbd_ret_code retcode;
+	const char *tmp_name;
+
+	retcode = drbd_check_name_str(new_name, drbd_strict_names);
+	if (retcode != NO_ERROR)
+		return retcode;
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		/* is this even possible? */
+		if (!connection->transport.net_conf)
+			continue;
+		tmp_name = connection->transport.net_conf->name;
+		if (!tmp_name)
+			continue;
+		if (strcmp(tmp_name, new_name))
+			continue;
+		retcode = ERR_ALREADY_EXISTS;
+		break;
+	}
+	rcu_read_unlock();
+	return retcode;
+}
+
+static int adm_new_connection(struct drbd_config_context *adm_ctx, struct genl_info *info)
+{
+	struct connection_info connection_info;
+	enum drbd_notification_type flags;
+	unsigned int peer_devices = 0;
+	struct drbd_device *device;
+	struct drbd_peer_device *peer_device;
+	struct net_conf *old_net_conf, *new_net_conf = NULL;
+	struct crypto crypto = { NULL, };
+	struct drbd_connection *connection;
+	enum drbd_ret_code retcode;
+	int i, err;
+	char *transport_name;
+	struct drbd_transport_class *tr_class;
+	struct drbd_transport *transport;
+
+	/* allocation not in the IO path, drbdsetup / netlink process context */
+	new_net_conf = kzalloc_obj(*new_net_conf);
+	if (!new_net_conf)
+		return ERR_NOMEM;
+
+	set_net_conf_defaults(new_net_conf);
+
+	err = net_conf_from_attrs(new_net_conf, info);
+	if (err) {
+		retcode = ERR_MANDATORY_TAG;
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
+		goto fail;
+	}
+
+	retcode = drbd_check_conn_name(adm_ctx->resource, new_net_conf->name);
+	if (retcode != NO_ERROR) {
+		drbd_msg_put_name_error(adm_ctx->reply_skb, retcode);
+		goto fail;
+	}
+
+	transport_name = new_net_conf->transport_name_len ? new_net_conf->transport_name :
+		new_net_conf->load_balance_paths ? "lb-tcp" : "tcp";
+	tr_class = drbd_get_transport_class(transport_name);
+	if (!tr_class) {
+		retcode = ERR_CREATE_TRANSPORT;
+		goto fail;
+	}
+
+	connection = drbd_create_connection(adm_ctx->resource, tr_class);
+	if (!connection) {
+		retcode = ERR_NOMEM;
+		goto fail_put_transport;
+	}
+	connection->peer_node_id = adm_ctx->peer_node_id;
+	/* transport class reference now owned by connection,
+	 * prevent double cleanup. */
+	tr_class = NULL;
+
+	mutex_lock(&adm_ctx->resource->conf_update);
+	retcode = check_net_options(connection, new_net_conf);
+	if (retcode != NO_ERROR)
+		goto unlock_fail_free_connection;
+
+	retcode = alloc_crypto(&crypto, new_net_conf, adm_ctx->reply_skb);
+	if (retcode != NO_ERROR)
+		goto unlock_fail_free_connection;
+
+	((char *)new_net_conf->shared_secret)[SHARED_SECRET_MAX-1] = 0;
+
+	idr_for_each_entry(&adm_ctx->resource->devices, device, i) {
+		int id;
+
+		retcode = ERR_NOMEM;
+		peer_device = create_peer_device(device, connection);
+		if (!peer_device)
+			goto unlock_fail_free_connection;
+		id = idr_alloc(&connection->peer_devices, peer_device,
+			       device->vnr, device->vnr + 1, GFP_KERNEL);
+		if (id < 0)
+			goto unlock_fail_free_connection;
+
+		if (get_ldev(device)) {
+			struct drbd_peer_md *peer_md =
+				&device->ldev->md.peers[adm_ctx->peer_node_id];
+			if (peer_md->flags & MDF_PEER_OUTDATED)
+				peer_device->disk_state[NOW] = D_OUTDATED;
+			put_ldev(device);
+		}
+	}
+
+	/* Set bitmap_index if it was allocated previously */
+	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
+		unsigned int bitmap_index;
+
+		device = peer_device->device;
+		if (!get_ldev(device))
+			continue;
+
+		bitmap_index = device->ldev->md.peers[adm_ctx->peer_node_id].bitmap_index;
+		if (bitmap_index != -1) {
+			if (want_bitmap(peer_device))
+				peer_device->bitmap_index = bitmap_index;
+			else
+				device->ldev->md.peers[adm_ctx->peer_node_id].flags &= ~MDF_HAVE_BITMAP;
+		}
+		put_ldev(device);
+	}
+
+	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
+		peer_device->send_cnt = 0;
+		peer_device->recv_cnt = 0;
+	}
+
+	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
+		struct drbd_device *device = peer_device->device;
+
+		peer_device->resync_susp_other_c[NOW] =
+			is_resync_target_in_other_connection(peer_device);
+		list_add_rcu(&peer_device->peer_devices, &device->peer_devices);
+		kref_get(&connection->kref);
+		kref_get(&device->kref);
+		peer_devices++;
+		peer_device->node_id = connection->peer_node_id;
+	}
+
+	write_lock_irq(&adm_ctx->resource->state_rwlock);
+
+	/*
+	 * Initialize to the current dagtag so that flushes can be acked even
+	 * if no further writes occur.
+	 */
+	connection->last_peer_ack_dagtag_seen = READ_ONCE(adm_ctx->resource->dagtag_sector);
+
+	list_add_tail_rcu(&connection->connections, &adm_ctx->resource->connections);
+	write_unlock_irq(&adm_ctx->resource->state_rwlock);
+
+	transport = &connection->transport;
+	old_net_conf = transport->net_conf;
+	if (old_net_conf) {
+		retcode = ERR_NET_CONFIGURED;
+		goto unlock_fail_free_connection;
+	}
+
+	err = transport->class->ops.net_conf_change(transport, new_net_conf);
+	if (err) {
+		drbd_msg_sprintf_info(adm_ctx->reply_skb, "transport net_conf_change failed: %d",
+				      err);
+		retcode = ERR_INVALID_REQUEST;
+		goto unlock_fail_free_connection;
+	}
+
+	rcu_assign_pointer(transport->net_conf, new_net_conf);
+	connection->fencing_policy = new_net_conf->fencing_policy;
+
+	connection->cram_hmac_tfm = crypto.cram_hmac_tfm;
+	connection->integrity_tfm = crypto.integrity_tfm;
+	connection->csums_tfm = crypto.csums_tfm;
+	connection->verify_tfm = crypto.verify_tfm;
+
+	/* transferred ownership. prevent double cleanup. */
+	new_net_conf = NULL;
+	memset(&crypto, 0, sizeof(crypto));
+
+	if (connection->peer_node_id > adm_ctx->resource->max_node_id)
+		adm_ctx->resource->max_node_id = connection->peer_node_id;
+
+	connection_to_info(&connection_info, connection);
+	flags = (peer_devices--) ? NOTIFY_CONTINUES : 0;
+	mutex_lock(&notification_mutex);
+	notify_connection_state(NULL, 0, connection, &connection_info, NOTIFY_CREATE | flags);
+	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
+		struct peer_device_info peer_device_info;
+
+		peer_device_to_info(&peer_device_info, peer_device);
+		flags = (peer_devices--) ? NOTIFY_CONTINUES : 0;
+		notify_peer_device_state(NULL, 0, peer_device, &peer_device_info, NOTIFY_CREATE | flags);
+	}
+	mutex_unlock(&notification_mutex);
+
+	mutex_unlock(&adm_ctx->resource->conf_update);
+
+	drbd_debugfs_connection_add(connection); /* after ->net_conf was assigned */
+	drbd_thread_start(&connection->sender);
+	return NO_ERROR;
+
+unlock_fail_free_connection:
+	drbd_unregister_connection(connection);
+	mutex_unlock(&adm_ctx->resource->conf_update);
+	synchronize_rcu();
+	drbd_reclaim_connection(&connection->rcu);
+fail_put_transport:
+	drbd_put_transport_class(tr_class);
+fail:
+	free_crypto(&crypto);
+	kfree(new_net_conf);
+
+	return retcode;
+}
+
+static bool addr_eq_nla(const struct sockaddr_storage *addr, const int addr_len, const struct nlattr *nla)
+{
+	return	nla_len(nla) == addr_len && memcmp(nla_data(nla), addr, addr_len) == 0;
+}
+
+static enum drbd_ret_code
+check_path_against_nla(const struct drbd_path *path,
+		       const struct nlattr *my_addr, const struct nlattr *peer_addr)
+{
+	enum drbd_ret_code ret = NO_ERROR;
+
+	if (addr_eq_nla(&path->my_addr, path->my_addr_len, my_addr))
+		ret = ERR_LOCAL_ADDR;
+	if (addr_eq_nla(&path->peer_addr, path->peer_addr_len, peer_addr))
+		ret = (ret == ERR_LOCAL_ADDR ? ERR_LOCAL_AND_PEER_ADDR : ERR_PEER_ADDR);
+	return ret;
+}
+
+static enum drbd_ret_code
+check_path_usable(const struct drbd_config_context *adm_ctx,
+		  const struct nlattr *my_addr, const struct nlattr *peer_addr)
+{
+	struct drbd_resource *resource;
+	struct drbd_connection *connection;
+	enum drbd_ret_code retcode;
+
+	if (!(my_addr && peer_addr)) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "connection endpoint(s) missing");
+		return ERR_INVALID_REQUEST;
+	}
+
+	for_each_resource_rcu(resource, &drbd_resources) {
+		for_each_connection_rcu(connection, resource) {
+			struct drbd_path *path;
+			list_for_each_entry_rcu(path, &connection->transport.paths, list) {
+				retcode = check_path_against_nla(path, my_addr, peer_addr);
+				if (retcode == NO_ERROR)
+					continue;
+				/* Within the same resource, it is ok to use
+				 * the same endpoint several times */
+				if (retcode != ERR_LOCAL_AND_PEER_ADDR &&
+				    resource == adm_ctx->resource)
+					continue;
+				return retcode;
+			}
+		}
+	}
+	return NO_ERROR;
+}
+
+
+static enum drbd_ret_code
+adm_add_path(struct drbd_config_context *adm_ctx,  struct genl_info *info)
+{
+	struct drbd_transport *transport = &adm_ctx->connection->transport;
+	struct drbd_resource *resource = adm_ctx->resource;
+	struct drbd_connection *connection = adm_ctx->connection;
+	struct nlattr **nested_attr_tb;
+	struct nlattr *my_addr, *peer_addr;
+	struct drbd_path *path;
+	struct net *existing_net;
+	enum drbd_ret_code retcode;
+	int err;
+
+	/* parse and validate only */
+	existing_net = drbd_net_assigned_to_connection(adm_ctx->connection);
+	if (existing_net && !net_eq(adm_ctx->net, existing_net)) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "connection already assigned to a different network namespace");
+		return ERR_INVALID_REQUEST;
+	}
+
+	err = path_parms_ntb_from_attrs(&nested_attr_tb, info);
+	if (err) {
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
+		return ERR_MANDATORY_TAG;
+	}
+	my_addr = nested_attr_tb[__nla_type(T_my_addr)];
+	peer_addr = nested_attr_tb[__nla_type(T_peer_addr)];
+	kfree(nested_attr_tb);
+	nested_attr_tb = NULL;
+
+	rcu_read_lock();
+	retcode = check_path_usable(adm_ctx, my_addr, peer_addr);
+	rcu_read_unlock();
+	if (retcode != NO_ERROR)
+		return retcode;
+
+	path = kzalloc(transport->class->path_instance_size, GFP_KERNEL);
+	if (!path)
+		return ERR_NOMEM;
+
+	path->net = adm_ctx->net;
+	path->my_addr_len = nla_len(my_addr);
+	memcpy(&path->my_addr, nla_data(my_addr), path->my_addr_len);
+	path->peer_addr_len = nla_len(peer_addr);
+	memcpy(&path->peer_addr, nla_data(peer_addr), path->peer_addr_len);
+
+	kref_get(&adm_ctx->connection->kref);
+	path->transport = transport;
+
+	kref_init(&path->kref);
+
+	if (connection->resource->res_opts.drbd8_compat_mode && resource->res_opts.node_id == -1) {
+		err = drbd_setup_node_ids_84(connection, path, adm_ctx->peer_node_id);
+		if (err) {
+			drbd_msg_put_info(adm_ctx->reply_skb,
+				err == -ENOTUNIQ ? "node-id from drbdsetup and meta-data differ" :
+				"error setting up node IDs");
+			kref_put(&path->kref, drbd_destroy_path);
+			return ERR_INVALID_REQUEST;
+		}
+	}
+
+	/* Exclusive with transport op "prepare_connect()" */
+	mutex_lock(&resource->conf_update);
+
+	err = transport->class->ops.add_path(path);
+
+	if (err) {
+		kref_put(&path->kref, drbd_destroy_path);
+		drbd_err(connection, "add_path() failed with %d\n", err);
+		drbd_msg_put_info(adm_ctx->reply_skb, "add_path on transport failed");
+		mutex_unlock(&resource->conf_update);
+		return ERR_INVALID_REQUEST;
+	}
+
+	/* Exclusive with reading state, in particular remember_state_change() */
+	write_lock_irq(&resource->state_rwlock);
+	list_add_tail_rcu(&path->list, &transport->paths);
+	write_unlock_irq(&resource->state_rwlock);
+
+	mutex_unlock(&resource->conf_update);
+
+	notify_path(adm_ctx->connection, path, NOTIFY_CREATE);
+	return NO_ERROR;
+}
+
+static int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	struct connect_parms parms = { 0, };
+	struct drbd_peer_device *peer_device;
+	struct drbd_connection *connection;
+	enum drbd_ret_code retcode;
+	enum drbd_state_rv rv;
+	enum drbd_conn_state cstate;
+	int i, err;
+
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
+	if (!adm_ctx.reply_skb)
+		return retcode;
+
+	connection = adm_ctx.connection;
+	cstate = connection->cstate[NOW];
+	if (cstate != C_STANDALONE) {
+		retcode = ERR_NET_CONFIGURED;
+		goto out;
+	}
+
+	if (first_path(connection) == NULL) {
+		drbd_msg_put_info(adm_ctx.reply_skb, "connection endpoint(s) missing");
+		retcode = ERR_INVALID_REQUEST;
+		goto out;
+	}
+
+	if (!net_eq(adm_ctx.net, drbd_net_assigned_to_connection(connection))) {
+		drbd_msg_put_info(adm_ctx.reply_skb, "connection assigned to a different network namespace");
+		retcode = ERR_INVALID_REQUEST;
+		goto out;
+	}
+
+	if (info->attrs[DRBD_NLA_CONNECT_PARMS]) {
+		err = connect_parms_from_attrs(&parms, info);
+		if (err) {
+			retcode = ERR_MANDATORY_TAG;
+			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			goto out;
+		}
+	}
+	if (parms.discard_my_data) {
+		if (adm_ctx.resource->role[NOW] == R_PRIMARY) {
+			retcode = ERR_DISCARD_IMPOSSIBLE;
+			goto out;
+		}
+		set_bit(CONN_DISCARD_MY_DATA, &connection->flags);
+	}
+	if (parms.tentative)
+		set_bit(CONN_DRY_RUN, &connection->flags);
+
+	/* Eventually allocate bitmap indexes for the peer_devices here */
+	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
+		struct drbd_device *device;
+
+		if (peer_device->bitmap_index != -1 || !want_bitmap(peer_device))
+			continue;
+
+		device = peer_device->device;
+		if (!get_ldev(device))
+			continue;
+
+		err = allocate_bitmap_index(peer_device, device->ldev);
+		put_ldev(device);
+		if (err) {
+			retcode = ERR_INVALID_REQUEST;
+			goto out;
+		}
+		drbd_md_mark_dirty(device);
+	}
+
+	rv = change_cstate_tag(connection, C_UNCONNECTED, CS_VERBOSE, "connect", NULL);
+	drbd_adm_finish(&adm_ctx, info, rv);
+	return 0;
+out:
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
+}
+
+static int drbd_adm_new_peer(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	struct drbd_connection *connection;
+	struct drbd_resource *resource;
+	enum drbd_ret_code retcode;
+	struct drbd_device *device;
+	int vnr, n_connections = 0;
+
+
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_NODE);
+	if (!adm_ctx.reply_skb)
+		return retcode;
+
+	resource = adm_ctx.resource;
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out;
+	}
+
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		bool fail = false;
+
+		if (get_ldev_if_state(device, D_FAILED)) {
+			fail = !device->ldev->disk_conf->d_bitmap;
+			put_ldev(device);
+		}
+		if (fail) {
+			rcu_read_unlock();
+			retcode = ERR_INVALID_REQUEST;
+			drbd_msg_sprintf_info(adm_ctx.reply_skb,
+			      "Cannot add a peer while having a disk without an allocated bitmap");
+			goto out_unlock;
+		}
+	}
+	rcu_read_unlock();
+
+	for_each_connection(connection, resource)
+		n_connections++;
+	if (resource->res_opts.drbd8_compat_mode && n_connections >= 1) {
+		retcode = ERR_INVALID_REQUEST;
+		drbd_msg_sprintf_info(adm_ctx.reply_skb,
+				      "drbd8 compat mode allows one peer at max");
+		goto out_unlock;
+	}
+
+	/* ensure uniqueness of peer_node_id by checking with adm_mutex */
+	connection = drbd_connection_by_node_id(resource, adm_ctx.peer_node_id);
+	if (adm_ctx.connection || connection) {
+		retcode = ERR_INVALID_REQUEST;
+		drbd_msg_sprintf_info(adm_ctx.reply_skb,
+				      "Connection for peer node id %d already exists",
+				      adm_ctx.peer_node_id);
+	} else {
+		retcode = adm_new_connection(&adm_ctx, info);
+	}
+
+out_unlock:
+	mutex_unlock(&resource->adm_mutex);
+out:
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
+}
+
+static int drbd_adm_new_path(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	enum drbd_ret_code retcode;
+
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
+	if (!adm_ctx.reply_skb)
+		return retcode;
+
+	/* remote transport endpoints need to be globally unique */
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+	} else {
+		retcode = adm_add_path(&adm_ctx, info);
+		mutex_unlock(&adm_ctx.resource->adm_mutex);
+	}
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
+}
+
+static enum drbd_ret_code
+adm_del_path(struct drbd_config_context *adm_ctx,  struct genl_info *info)
+{
+	struct drbd_resource *resource = adm_ctx->resource;
+	struct drbd_connection *connection = adm_ctx->connection;
+	struct drbd_transport *transport = &connection->transport;
+	struct nlattr **nested_attr_tb;
+	struct nlattr *my_addr, *peer_addr;
+	struct drbd_path *path;
+	int nr_paths = 0;
+	int err;
+
+	/* parse and validate only */
+	if (!net_eq(adm_ctx->net, drbd_net_assigned_to_connection(connection))) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "connection assigned to a different network namespace");
+		return ERR_INVALID_REQUEST;
+	}
+
+	err = path_parms_ntb_from_attrs(&nested_attr_tb, info);
+	if (err) {
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
+		return ERR_MANDATORY_TAG;
+	}
+	my_addr = nested_attr_tb[__nla_type(T_my_addr)];
+	peer_addr = nested_attr_tb[__nla_type(T_peer_addr)];
+	kfree(nested_attr_tb);
+	nested_attr_tb = NULL;
+
+	list_for_each_entry(path, &transport->paths, list)
+		nr_paths++;
+
+	if (nr_paths == 1 && connection->cstate[NOW] >= C_CONNECTING) {
+		drbd_msg_put_info(adm_ctx->reply_skb,
+				  "Can not delete last path, use disconnect first!");
+		return ERR_INVALID_REQUEST;
+	}
+
+	err = -ENOENT;
+	list_for_each_entry(path, &transport->paths, list) {
+		if (!addr_eq_nla(&path->my_addr, path->my_addr_len, my_addr))
+			continue;
+		if (!addr_eq_nla(&path->peer_addr, path->peer_addr_len, peer_addr))
+			continue;
+
+		/* Exclusive with transport op "prepare_connect()" */
+		mutex_lock(&resource->conf_update);
+
+		if (!transport->class->ops.may_remove_path(path)) {
+			err = -EBUSY;
+			mutex_unlock(&resource->conf_update);
+			break;
+		}
+
+		set_bit(TR_UNREGISTERED, &path->flags);
+		/* Ensure flag visible before list manipulation. */
+		smp_wmb();
+
+		/* Exclusive with reading state, in particular remember_state_change() */
+		write_lock_irq(&resource->state_rwlock);
+		list_del_rcu(&path->list);
+		write_unlock_irq(&resource->state_rwlock);
+
+		mutex_unlock(&resource->conf_update);
+
+		transport->class->ops.remove_path(path);
+		notify_path(connection, path, NOTIFY_DESTROY);
+		/* Transport modules might use RCU on the path list. */
+		call_rcu(&path->rcu, drbd_reclaim_path);
 
-	rcu_read_lock();
-	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
-		struct drbd_device *device = peer_device->device;
-		device->send_cnt = 0;
-		device->recv_cnt = 0;
+		return NO_ERROR;
 	}
-	rcu_read_unlock();
 
-	rv = conn_request_state(connection, NS(conn, C_UNCONNECTED), CS_VERBOSE);
+	drbd_err(connection, "del_path() failed with %d\n", err);
+	drbd_msg_put_info(adm_ctx->reply_skb,
+			  err == -ENOENT ? "no such path" : "del_path on transport failed");
+	return ERR_INVALID_REQUEST;
+}
 
-	conn_reconfig_done(connection);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	drbd_adm_finish(&adm_ctx, info, rv);
-	return 0;
+static int drbd_adm_del_path(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	enum drbd_ret_code retcode;
 
-fail:
-	free_crypto(&crypto);
-	kfree(new_net_conf);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
+	if (!adm_ctx.reply_skb)
+		return retcode;
 
-	conn_reconfig_done(connection);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-out:
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+	} else {
+		retcode = adm_del_path(&adm_ctx, info);
+		mutex_unlock(&adm_ctx.resource->adm_mutex);
+	}
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static enum drbd_state_rv conn_try_disconnect(struct drbd_connection *connection, bool force)
+int drbd_open_ro_count(struct drbd_resource *resource)
 {
-	enum drbd_conns cstate;
-	enum drbd_state_rv rv;
+	struct drbd_device *device;
+	int vnr, open_ro_cnt = 0;
 
-repeat:
-	rv = conn_request_state(connection, NS(conn, C_DISCONNECTING),
-			force ? CS_HARD : 0);
+	read_lock_irq(&resource->state_rwlock);
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		if (!device->writable)
+			open_ro_cnt += device->open_cnt;
+	}
+	read_unlock_irq(&resource->state_rwlock);
+
+	return open_ro_cnt;
+}
+
+static enum drbd_state_rv conn_try_disconnect(struct drbd_connection *connection, bool force,
+					      const char *tag, struct sk_buff *reply_skb)
+{
+	struct drbd_resource *resource = connection->resource;
+	enum drbd_conn_state cstate;
+	enum drbd_state_rv rv;
+	enum chg_state_flags flags = (force ? CS_HARD : 0) | CS_VERBOSE;
+	const char *err_str = NULL;
+	long t;
 
+    repeat:
+	rv = change_cstate_tag(connection, C_DISCONNECTING, flags, tag, &err_str);
 	switch (rv) {
-	case SS_NOTHING_TO_DO:
+	case SS_CW_FAILED_BY_PEER:
+	case SS_NEED_CONNECTION:
+		read_lock_irq(&resource->state_rwlock);
+		cstate = connection->cstate[NOW];
+		read_unlock_irq(&resource->state_rwlock);
+		if (cstate < C_CONNECTED)
+			goto repeat;
 		break;
+	case SS_NO_UP_TO_DATE_DISK:
+		if (resource->role[NOW] == R_PRIMARY)
+			break;
+		/* Most probably udev opened it read-only. That might happen
+		   if it was demoted very recently. Wait up to one second. */
+		t = wait_event_interruptible_timeout(resource->state_wait,
+						     drbd_open_ro_count(resource) == 0,
+						     HZ);
+		if (t <= 0)
+			break;
+		goto repeat;
 	case SS_ALREADY_STANDALONE:
-		return SS_SUCCESS;
-	case SS_PRIMARY_NOP:
-		/* Our state checking code wants to see the peer outdated. */
-		rv = conn_request_state(connection, NS2(conn, C_DISCONNECTING, pdsk, D_OUTDATED), 0);
-
-		if (rv == SS_OUTDATE_WO_CONN) /* lost connection before graceful disconnect succeeded */
-			rv = conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_VERBOSE);
-
+		rv = SS_SUCCESS;
 		break;
-	case SS_CW_FAILED_BY_PEER:
-		spin_lock_irq(&connection->resource->req_lock);
-		cstate = connection->cstate;
-		spin_unlock_irq(&connection->resource->req_lock);
-		if (cstate <= C_WF_CONNECTION)
+	case SS_IS_DISKLESS:
+	case SS_LOWER_THAN_OUTDATED:
+		rv = change_cstate_tag(connection, C_DISCONNECTING, CS_HARD, tag, NULL);
+		break;
+	case SS_NO_QUORUM:
+		if (!(flags & CS_VERBOSE)) {
+			flags |= CS_VERBOSE;
 			goto repeat;
-		/* The peer probably wants to see us outdated. */
-		rv = conn_request_state(connection, NS2(conn, C_DISCONNECTING,
-							disk, D_OUTDATED), 0);
-		if (rv == SS_IS_DISKLESS || rv == SS_LOWER_THAN_OUTDATED) {
-			rv = conn_request_state(connection, NS(conn, C_DISCONNECTING),
-					CS_HARD);
 		}
 		break;
 	default:;
 		/* no special handling necessary */
 	}
 
-	if (rv >= SS_SUCCESS) {
-		enum drbd_state_rv rv2;
-		/* No one else can reconfigure the network while I am here.
-		 * The state handling only uses drbd_thread_stop_nowait(),
-		 * we want to really wait here until the receiver is no more.
-		 */
-		drbd_thread_stop(&connection->receiver);
-
-		/* Race breaker.  This additional state change request may be
-		 * necessary, if this was a forced disconnect during a receiver
-		 * restart.  We may have "killed" the receiver thread just
-		 * after drbd_receiver() returned.  Typically, we should be
-		 * C_STANDALONE already, now, and this becomes a no-op.
-		 */
-		rv2 = conn_request_state(connection, NS(conn, C_STANDALONE),
-				CS_VERBOSE | CS_HARD);
-		if (rv2 < SS_SUCCESS)
-			drbd_err(connection,
-				"unexpected rv2=%d in conn_try_disconnect()\n",
-				rv2);
-		/* Unlike in DRBD 9, the state engine has generated
-		 * NOTIFY_DESTROY events before clearing connection->net_conf. */
+	if (rv >= SS_SUCCESS)
+		wait_event_interruptible_timeout(resource->state_wait,
+						 connection->cstate[NOW] == C_STANDALONE,
+						 HZ);
+	if (err_str) {
+		drbd_msg_put_info(reply_skb, err_str);
+		kfree(err_str);
 	}
+
 	return rv;
 }
 
-int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info)
+/* this can only be called immediately after a successful
+ * peer_try_disconnect, within the same resource->adm_mutex */
+static void del_connection(struct drbd_connection *connection, const char *tag)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_peer_device *peer_device;
+	enum drbd_state_rv rv2;
+	int vnr;
+
+	if (test_bit(C_UNREGISTERED, &connection->flags))
+		return;
+
+	/* No one else can reconfigure the network while I am here.
+	 * The state handling only uses drbd_thread_stop_nowait(),
+	 * we want to really wait here until the receiver is no more.
+	 */
+	drbd_thread_stop(&connection->receiver);
+
+	/* Race breaker.  This additional state change request may be
+	 * necessary, if this was a forced disconnect during a receiver
+	 * restart.  We may have "killed" the receiver thread just
+	 * after drbd_receiver() returned.  Typically, we should be
+	 * C_STANDALONE already, now, and this becomes a no-op.
+	 */
+	rv2 = change_cstate_tag(connection, C_STANDALONE, CS_VERBOSE | CS_HARD, tag, NULL);
+	if (rv2 < SS_SUCCESS)
+		drbd_err(connection,
+			"unexpected rv2=%d in del_connection()\n",
+			rv2);
+	/* Make sure the sender thread has actually stopped: state
+	 * handling only does drbd_thread_stop_nowait().
+	 */
+	drbd_thread_stop(&connection->sender);
+
+	mutex_lock(&resource->conf_update);
+	drbd_unregister_connection(connection);
+	mutex_unlock(&resource->conf_update);
+
+	/*
+	 * Flush the resource work queue to make sure that no more
+	 * events like state change notifications for this connection
+	 * are queued: we want the "destroy" event to come last.
+	 */
+	drbd_flush_workqueue(&resource->work);
+
+	mutex_lock(&notification_mutex);
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr)
+		notify_peer_device_state(NULL, 0, peer_device, NULL,
+					 NOTIFY_DESTROY | NOTIFY_CONTINUES);
+	notify_connection_state(NULL, 0, connection, NULL, NOTIFY_DESTROY);
+	mutex_unlock(&notification_mutex);
+	call_rcu(&connection->rcu, drbd_reclaim_connection);
+}
+
+static int adm_disconnect(struct sk_buff *skb, struct genl_info *info, bool destroy)
 {
 	struct drbd_config_context adm_ctx;
 	struct disconnect_parms parms;
 	struct drbd_connection *connection;
+	struct net *existing_net;
 	enum drbd_state_rv rv;
 	enum drbd_ret_code retcode;
-	int err;
+	const char *tag = destroy ? "del-peer" : "disconnect";
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto fail;
 
-	connection = adm_ctx.connection;
 	memset(&parms, 0, sizeof(parms));
 	if (info->attrs[DRBD_NLA_DISCONNECT_PARMS]) {
-		err = disconnect_parms_from_attrs(&parms, info);
+		int err = disconnect_parms_from_attrs(&parms, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
 			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
@@ -2753,55 +5163,114 @@ int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info)
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	rv = conn_try_disconnect(connection, parms.force_disconnect);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	if (rv < SS_SUCCESS) {
-		drbd_adm_finish(&adm_ctx, info, rv);
-		return 0;
+	existing_net = drbd_net_assigned_to_connection(adm_ctx.connection);
+	if (existing_net && !net_eq(adm_ctx.net, existing_net)) {
+		drbd_msg_put_info(adm_ctx.reply_skb, "connection assigned to a different network namespace");
+		retcode =  ERR_INVALID_REQUEST;
+		goto fail;
+	}
+
+	connection = adm_ctx.connection;
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto fail;
+	}
+	rv = conn_try_disconnect(connection, parms.force_disconnect, tag, adm_ctx.reply_skb);
+	if (rv >= SS_SUCCESS && destroy) {
+		del_connection(connection, tag);
 	}
-	retcode = NO_ERROR;
+	if (rv < SS_SUCCESS)
+		retcode = (enum drbd_ret_code)rv;
+	else
+		retcode = NO_ERROR;
+	mutex_unlock(&adm_ctx.resource->adm_mutex);
  fail:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-void resync_after_online_grow(struct drbd_device *device)
+static int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info)
 {
-	int iass; /* I am sync source */
+	return adm_disconnect(skb, info, 0);
+}
 
-	drbd_info(device, "Resync of new storage after online grow\n");
-	if (device->state.role != device->state.peer)
-		iass = (device->state.role == R_PRIMARY);
-	else
-		iass = test_bit(RESOLVE_CONFLICTS, &first_peer_device(device)->connection->flags);
+static int drbd_adm_del_peer(struct sk_buff *skb, struct genl_info *info)
+{
+	return adm_disconnect(skb, info, 1);
+}
 
-	if (iass)
-		drbd_start_resync(device, C_SYNC_SOURCE);
-	else
-		_drbd_request_state(device, NS(conn, C_WF_SYNC_UUID), CS_VERBOSE + CS_SERIALIZE);
+void resync_after_online_grow(struct drbd_peer_device *peer_device)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	bool sync_source = false;
+	s32 peer_id;
+
+	drbd_info(peer_device, "Resync of new storage after online grow\n");
+	if (device->resource->role[NOW] != connection->peer_role[NOW])
+		sync_source = (device->resource->role[NOW] == R_PRIMARY);
+	else if (connection->agreed_pro_version < 111)
+		sync_source = test_bit(RESOLVE_CONFLICTS,
+				&peer_device->connection->transport.flags);
+	else if (get_ldev(device)) {
+		/* multiple or no primaries, proto new enough, resolve by node-id */
+		s32 self_id = device->ldev->md.node_id;
+		put_ldev(device);
+		peer_id = peer_device->node_id;
+
+		sync_source = self_id < peer_id ? 1 : 0;
+	}
+
+	if (!sync_source && connection->agreed_pro_version < 110) {
+		stable_change_repl_state(peer_device, L_WF_SYNC_UUID,
+					 CS_VERBOSE | CS_SERIALIZE, "online-grow");
+		return;
+	}
+	drbd_start_resync(peer_device, sync_source ? L_SYNC_SOURCE : L_SYNC_TARGET, "online-grow");
+}
+
+sector_t drbd_local_max_size(struct drbd_device *device)
+{
+	struct drbd_backing_dev *tmp_bdev;
+	sector_t s;
+
+	tmp_bdev = kmalloc_obj(struct drbd_backing_dev, GFP_ATOMIC);
+	if (!tmp_bdev)
+		return 0;
+
+	*tmp_bdev = *device->ldev;
+	drbd_md_set_sector_offsets(tmp_bdev);
+	s = drbd_get_max_capacity(device, tmp_bdev, false);
+	kfree(tmp_bdev);
+
+	return s;
 }
 
-int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	struct disk_conf *old_disk_conf, *new_disk_conf = NULL;
 	struct resize_parms rs;
 	struct drbd_device *device;
-	enum drbd_ret_code retcode;
 	enum determine_dev_size dd;
 	bool change_al_layout = false;
 	enum dds_flags ddsf;
 	sector_t u_size;
-	int err;
+	int err, retcode;
+	struct drbd_peer_device *peer_device;
+	bool resolve_by_node_id = true;
+	bool has_up_to_date_primary;
+	bool traditional_resize = false;
+	sector_t local_max_size;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto finish;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
 	device = adm_ctx.device;
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
@@ -2820,20 +5289,58 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 		}
 	}
 
-	if (device->state.conn > C_CONNECTED) {
-		retcode = ERR_RESIZE_RESYNC;
+	device = adm_ctx.device;
+	for_each_peer_device(peer_device, device) {
+		if (peer_device->repl_state[NOW] > L_ESTABLISHED) {
+			retcode = ERR_RESIZE_RESYNC;
+			goto fail_ldev;
+		}
+	}
+
+
+	local_max_size = drbd_local_max_size(device);
+	if (rs.resize_size && local_max_size < (sector_t)rs.resize_size) {
+		drbd_err(device, "requested %llu sectors, backend seems only able to support %llu\n",
+			 (unsigned long long)(sector_t)rs.resize_size,
+			 (unsigned long long)local_max_size);
+		retcode = ERR_DISK_TOO_SMALL;
 		goto fail_ldev;
 	}
 
-	if (device->state.role == R_SECONDARY &&
-	    device->state.peer == R_SECONDARY) {
+	/* Maybe I could serve as sync source myself? */
+	has_up_to_date_primary =
+		device->resource->role[NOW] == R_PRIMARY &&
+		device->disk_state[NOW] == D_UP_TO_DATE;
+
+	if (!has_up_to_date_primary) {
+		for_each_peer_device(peer_device, device) {
+			/* ignore unless connection is fully established */
+			if (peer_device->repl_state[NOW] < L_ESTABLISHED)
+				continue;
+			if (peer_device->connection->agreed_pro_version < 111) {
+				resolve_by_node_id = false;
+				if (peer_device->connection->peer_role[NOW] == R_PRIMARY
+				&&  peer_device->disk_state[NOW] == D_UP_TO_DATE) {
+					has_up_to_date_primary = true;
+					break;
+				}
+			}
+		}
+	}
+
+	if (!has_up_to_date_primary && !resolve_by_node_id) {
 		retcode = ERR_NO_PRIMARY;
 		goto fail_ldev;
 	}
 
-	if (rs.no_resync && first_peer_device(device)->connection->agreed_pro_version < 93) {
-		retcode = ERR_NEED_APV_93;
-		goto fail_ldev;
+	for_each_peer_device(peer_device, device) {
+		struct drbd_connection *connection = peer_device->connection;
+		if (rs.no_resync &&
+		    connection->cstate[NOW] == C_CONNECTED &&
+		    connection->agreed_pro_version < 93) {
+			retcode = ERR_NEED_APV_93;
+			goto fail_ldev;
+		}
 	}
 
 	rcu_read_lock();
@@ -2856,21 +5363,21 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 			goto fail_ldev;
 		}
 
-		if (al_size_k < MD_32kB_SECT/2) {
+		if (al_size_k < (32768 >> 10)) {
 			retcode = ERR_MD_LAYOUT_TOO_SMALL;
 			goto fail_ldev;
 		}
 
+		/* Removed this pre-condition while merging from 8.4 to 9.0
 		if (device->state.conn != C_CONNECTED && !rs.resize_force) {
 			retcode = ERR_MD_LAYOUT_CONNECTED;
 			goto fail_ldev;
-		}
+		} */
 
 		change_al_layout = true;
 	}
 
-	if (device->ldev->known_size != drbd_get_capacity(device->ldev->backing_bdev))
-		device->ldev->known_size = drbd_get_capacity(device->ldev->backing_bdev);
+	device->ldev->known_size = drbd_get_capacity(device->ldev->backing_bdev);
 
 	if (new_disk_conf) {
 		mutex_lock(&device->resource->conf_update);
@@ -2883,9 +5390,17 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 		new_disk_conf = NULL;
 	}
 
-	ddsf = (rs.resize_force ? DDSF_FORCED : 0) | (rs.no_resync ? DDSF_NO_RESYNC : 0);
-	dd = drbd_determine_dev_size(device, ddsf, change_al_layout ? &rs : NULL);
-	drbd_md_sync(device);
+	ddsf = (rs.resize_force ? DDSF_ASSUME_UNCONNECTED_PEER_HAS_SPACE : 0)
+		| (rs.no_resync ? DDSF_NO_RESYNC : 0);
+
+	dd = change_cluster_wide_device_size(device, local_max_size, rs.resize_size, ddsf,
+					     change_al_layout ? &rs : NULL);
+	if (dd == DS_2PC_NOT_SUPPORTED) {
+		traditional_resize = true;
+		dd = drbd_determine_dev_size(device, 0, ddsf, change_al_layout ? &rs : NULL);
+	}
+
+	drbd_md_sync_if_dirty(device);
 	put_ldev(device);
 	if (dd == DS_ERROR) {
 		retcode = ERR_NOMEM_BITMAP;
@@ -2896,19 +5411,25 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 	} else if (dd == DS_ERROR_SHRINK) {
 		retcode = ERR_IMPLICIT_SHRINK;
 		goto fail;
+	} else if (dd == DS_2PC_ERR) {
+		retcode = SS_INTERRUPTED;
+		goto fail;
 	}
 
-	if (device->state.conn == C_CONNECTED) {
-		if (dd == DS_GREW)
-			set_bit(RESIZE_PENDING, &device->flags);
-
-		drbd_send_uuids(first_peer_device(device));
-		drbd_send_sizes(first_peer_device(device), 1, ddsf);
+	if (traditional_resize) {
+		for_each_peer_device(peer_device, device) {
+			if (peer_device->repl_state[NOW] == L_ESTABLISHED) {
+				if (dd == DS_GREW)
+					set_bit(RESIZE_PENDING, &peer_device->flags);
+				drbd_send_uuids(peer_device, 0, 0);
+				drbd_send_sizes(peer_device, rs.resize_size, ddsf);
+			}
+		}
 	}
 
  fail:
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
- finish:
+ out_no_adm_mutex:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 
@@ -2918,7 +5439,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 	goto fail;
 }
 
-int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	enum drbd_ret_code retcode;
@@ -2928,298 +5449,558 @@ int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info)
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto fail;
 
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out;
+	}
 	res_opts = adm_ctx.resource->res_opts;
 	if (should_set_defaults(info))
 		set_res_opts_defaults(&res_opts);
 
-	err = res_opts_from_attrs(&res_opts, info);
+	err = res_opts_from_attrs_for_change(&res_opts, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
 		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
 		goto fail;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	err = set_resource_options(adm_ctx.resource, &res_opts);
+	if (res_opts.explicit_drbd8_compat) {
+		struct drbd_connection *connection;
+		int n_connections = 0;
+
+		for_each_connection(connection, adm_ctx.resource)
+			n_connections++;
+
+		if (n_connections > 1) {
+			drbd_msg_sprintf_info(adm_ctx.reply_skb,
+					      "drbd8 compat mode allows one peer at max");
+			goto fail;
+		}
+	}
+
+	if (res_opts.node_id != -1) {
+#ifdef CONFIG_DRBD_COMPAT_84
+		if (!res_opts.drbd8_compat_mode && res_opts.explicit_drbd8_compat)
+			atomic_inc(&nr_drbd8_devices);
+		else if (res_opts.drbd8_compat_mode && !res_opts.explicit_drbd8_compat)
+			atomic_dec(&nr_drbd8_devices);
+#endif
+		res_opts.drbd8_compat_mode = res_opts.explicit_drbd8_compat;
+	}
+
+	err = set_resource_options(adm_ctx.resource, &res_opts, "resource-options");
 	if (err) {
 		retcode = ERR_INVALID_REQUEST;
 		if (err == -ENOMEM)
 			retcode = ERR_NOMEM;
 	}
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
 
 fail:
+	mutex_unlock(&adm_ctx.resource->adm_mutex);
+out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info)
+static enum drbd_state_rv invalidate_resync(struct drbd_peer_device *peer_device)
+{
+	struct drbd_resource *resource = peer_device->connection->resource;
+	enum drbd_state_rv rv;
+
+	drbd_flush_workqueue(&peer_device->connection->sender_work);
+
+	rv = change_repl_state(peer_device, L_STARTING_SYNC_T, CS_SERIALIZE, "invalidate");
+
+	if (rv < SS_SUCCESS && rv != SS_NEED_CONNECTION)
+		rv = stable_change_repl_state(peer_device, L_STARTING_SYNC_T,
+			CS_VERBOSE | CS_SERIALIZE, "invalidate");
+
+	wait_event_interruptible(resource->state_wait,
+				 peer_device->repl_state[NOW] != L_STARTING_SYNC_T);
+
+	return rv;
+}
+
+static enum drbd_state_rv invalidate_no_resync(struct drbd_device *device)
+{
+	struct drbd_resource *resource = device->resource;
+	struct drbd_peer_device *peer_device;
+	struct drbd_connection *connection;
+	unsigned long irq_flags;
+	enum drbd_state_rv rv;
+
+	begin_state_change(resource, &irq_flags, CS_VERBOSE);
+	for_each_connection(connection, resource) {
+		peer_device = conn_peer_device(connection, device->vnr);
+		if (peer_device->repl_state[NOW] >= L_ESTABLISHED) {
+			abort_state_change(resource, &irq_flags);
+			return SS_UNKNOWN_ERROR;
+		}
+	}
+	__change_disk_state(device, D_INCONSISTENT);
+	rv = end_state_change(resource, &irq_flags, "invalidate");
+
+	if (rv >= SS_SUCCESS) {
+		drbd_bitmap_io(device, &drbd_bmio_set_all_n_write,
+			       "set_n_write from invalidate",
+			       BM_LOCK_CLEAR | BM_LOCK_BULK,
+			       NULL);
+	}
+
+	return rv;
+}
+
+static int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
+	struct drbd_peer_device *sync_from_peer_device = NULL;
+	struct drbd_resource *resource;
 	struct drbd_device *device;
-	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
+	int retcode = 0; /* enum drbd_ret_code rsp. enum drbd_state_rv */
+	struct invalidate_parms inv = {
+		.sync_from_peer_node_id = -1,
+		.reset_bitmap = DRBD_INVALIDATE_RESET_BITMAP_DEF,
+	};
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
 
 	device = adm_ctx.device;
+
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
-		goto out;
+		goto out_no_ldev;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	resource = device->resource;
+
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
+
+	if (info->attrs[DRBD_NLA_INVALIDATE_PARMS]) {
+		int err;
+
+		err = invalidate_parms_from_attrs(&inv, info);
+		if (err) {
+			retcode = ERR_MANDATORY_TAG;
+			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			goto out_no_resume;
+		}
+
+		if (inv.sync_from_peer_node_id != -1) {
+			struct drbd_connection *connection =
+				drbd_connection_by_node_id(resource, inv.sync_from_peer_node_id);
+			sync_from_peer_device = conn_peer_device(connection, device->vnr);
+		}
+
+		if (!inv.reset_bitmap && sync_from_peer_device &&
+		    sync_from_peer_device->connection->agreed_pro_version < 120) {
+			retcode = ERR_APV_TOO_LOW;
+			drbd_msg_put_info(adm_ctx.reply_skb,
+					  "Need protocol level 120 to initiate bitmap based resync");
+			goto out_no_resume;
+		}
+	}
 
 	/* If there is still bitmap IO pending, probably because of a previous
 	 * resync just being finished, wait for it before requesting a new resync.
-	 * Also wait for it's after_state_ch(). */
-	drbd_suspend_io(device);
-	wait_event(device->misc_wait, !test_bit(BITMAP_IO, &device->flags));
-	drbd_flush_workqueue(&first_peer_device(device)->connection->sender_work);
-
-	/* If we happen to be C_STANDALONE R_SECONDARY, just change to
-	 * D_INCONSISTENT, and set all bits in the bitmap.  Otherwise,
-	 * try to start a resync handshake as sync target for full sync.
-	 */
-	if (device->state.conn == C_STANDALONE && device->state.role == R_SECONDARY) {
-		retcode = drbd_request_state(device, NS(disk, D_INCONSISTENT));
-		if (retcode >= SS_SUCCESS) {
-			if (drbd_bitmap_io(device, &drbd_bmio_set_n_write,
-				"set_n_write from invalidate", BM_LOCKED_MASK, NULL))
-				retcode = ERR_IO_MD_DISK;
+	 * Also wait for its after_state_ch(). */
+	drbd_suspend_io(device, READ_AND_WRITE);
+	wait_event(device->misc_wait, !atomic_read(&device->pending_bitmap_work.n));
+
+	if (sync_from_peer_device) {
+		if (inv.reset_bitmap) {
+			retcode = invalidate_resync(sync_from_peer_device);
+		} else {
+			retcode = change_repl_state(sync_from_peer_device, L_WF_BITMAP_T,
+					CS_VERBOSE | CS_CLUSTER_WIDE | CS_WAIT_COMPLETE |
+					CS_SERIALIZE, "invalidate");
 		}
-	} else
-		retcode = drbd_request_state(device, NS(conn, C_STARTING_SYNC_T));
-	drbd_resume_io(device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	put_ldev(device);
-out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
-	return 0;
-}
+	} else {
+		int retry = 3;
+		do {
+			struct drbd_connection *connection;
 
-static int drbd_adm_simple_request_state(struct sk_buff *skb, struct genl_info *info,
-		union drbd_state mask, union drbd_state val)
-{
-	struct drbd_config_context adm_ctx;
-	enum drbd_ret_code retcode;
+			for_each_connection(connection, resource) {
+				struct drbd_peer_device *peer_device;
+
+				peer_device = conn_peer_device(connection, device->vnr);
+				if (!peer_device)
+					continue;
+
+				if (inv.reset_bitmap) {
+					retcode = invalidate_resync(peer_device);
+				} else {
+					if (connection->agreed_pro_version < 120) {
+						retcode = ERR_APV_TOO_LOW;
+						continue;
+					}
+					retcode = change_repl_state(peer_device, L_WF_BITMAP_T,
+								CS_VERBOSE | CS_CLUSTER_WIDE |
+								CS_WAIT_COMPLETE | CS_SERIALIZE,
+								"invalidate");
+				}
+				if (retcode >= SS_SUCCESS)
+					goto out;
+			}
+			if (retcode != SS_NEED_CONNECTION)
+				break;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
+			retcode = invalidate_no_resync(device);
+		} while (retcode == SS_UNKNOWN_ERROR && retry--);
+	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = drbd_request_state(adm_ctx.device, mask, val);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
 out:
+	drbd_resume_io(device);
+out_no_resume:
+	mutex_unlock(&resource->adm_mutex);
+out_no_adm_mutex:
+	put_ldev(device);
+out_no_ldev:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static int drbd_bmio_set_susp_al(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local)
+static int drbd_bmio_set_susp_al(struct drbd_device *device, struct drbd_peer_device *peer_device)
 {
 	int rv;
 
 	rv = drbd_bmio_set_n_write(device, peer_device);
-	drbd_suspend_al(device);
+	drbd_try_suspend_al(device);
 	return rv;
 }
 
-int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info)
+static int full_sync_from_peer(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_resource *resource = device->resource;
+	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
+
+	retcode = stable_change_repl_state(peer_device, L_STARTING_SYNC_S, CS_SERIALIZE,
+			"invalidate-remote");
+	if (retcode < SS_SUCCESS) {
+		if (retcode == SS_NEED_CONNECTION && resource->role[NOW] == R_PRIMARY) {
+			/* The peer will get a resync upon connect anyways.
+			 * Just make that into a full resync. */
+			retcode = change_peer_disk_state(peer_device, D_INCONSISTENT,
+					CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE,
+					"invalidate-remote");
+			if (retcode >= SS_SUCCESS) {
+				if (drbd_bitmap_io(device, &drbd_bmio_set_susp_al,
+						   "set_n_write from invalidate_peer",
+						   BM_LOCK_CLEAR | BM_LOCK_BULK, peer_device))
+					retcode = ERR_IO_MD_DISK;
+			}
+		} else {
+			retcode = stable_change_repl_state(peer_device, L_STARTING_SYNC_S,
+					CS_VERBOSE | CS_SERIALIZE, "invalidate-remote");
+		}
+	}
+
+	return retcode;
+}
+
+
+static int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
-	int retcode; /* drbd_ret_code, drbd_state_rv */
+	struct drbd_peer_device *peer_device;
+	struct drbd_resource *resource;
 	struct drbd_device *device;
+	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
+	struct invalidate_peer_parms inv = {
+		.p_reset_bitmap = DRBD_INVALIDATE_RESET_BITMAP_DEF,
+	};
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_DEVICE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
 
-	device = adm_ctx.device;
+	peer_device = adm_ctx.peer_device;
+	device = peer_device->device;
+	resource = device->resource;
+
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
 		goto out;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
+
+	if (info->attrs[DRBD_NLA_INVAL_PEER_PARAMS]) {
+		int err;
+
+		err = invalidate_peer_parms_from_attrs(&inv, info);
+		if (err) {
+			retcode = ERR_MANDATORY_TAG;
+			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			goto out_unlock;
+		}
+		if (!inv.p_reset_bitmap && peer_device->connection->agreed_pro_version < 120) {
+			retcode = ERR_APV_TOO_LOW;
+			drbd_msg_put_info(adm_ctx.reply_skb,
+					  "Need protocol level 120 to initiate bitmap based resync");
+			goto out_unlock;
+		}
+	}
+
+	drbd_suspend_io(device, READ_AND_WRITE);
+	wait_event(device->misc_wait, !atomic_read(&device->pending_bitmap_work.n));
+	drbd_flush_workqueue(&peer_device->connection->sender_work);
 
-	/* If there is still bitmap IO pending, probably because of a previous
-	 * resync just being finished, wait for it before requesting a new resync.
-	 * Also wait for it's after_state_ch(). */
-	drbd_suspend_io(device);
-	wait_event(device->misc_wait, !test_bit(BITMAP_IO, &device->flags));
-	drbd_flush_workqueue(&first_peer_device(device)->connection->sender_work);
-
-	/* If we happen to be C_STANDALONE R_PRIMARY, just set all bits
-	 * in the bitmap.  Otherwise, try to start a resync handshake
-	 * as sync source for full sync.
-	 */
-	if (device->state.conn == C_STANDALONE && device->state.role == R_PRIMARY) {
-		/* The peer will get a resync upon connect anyways. Just make that
-		   into a full resync. */
-		retcode = drbd_request_state(device, NS(pdsk, D_INCONSISTENT));
-		if (retcode >= SS_SUCCESS) {
-			if (drbd_bitmap_io(device, &drbd_bmio_set_susp_al,
-				"set_n_write from invalidate_peer",
-				BM_LOCKED_SET_ALLOWED, NULL))
-				retcode = ERR_IO_MD_DISK;
-		}
-	} else
-		retcode = drbd_request_state(device, NS(conn, C_STARTING_SYNC_S));
+	if (inv.p_reset_bitmap) {
+		retcode = full_sync_from_peer(peer_device);
+	} else {
+		retcode = change_repl_state(peer_device, L_WF_BITMAP_S,
+				CS_VERBOSE | CS_CLUSTER_WIDE | CS_WAIT_COMPLETE | CS_SERIALIZE,
+				"invalidate-remote");
+	}
 	drbd_resume_io(device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+
+out_unlock:
+	mutex_unlock(&resource->adm_mutex);
+out_no_adm_mutex:
 	put_ldev(device);
 out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
+	struct drbd_peer_device *peer_device;
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_DEVICE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
+
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
 		goto out;
+	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	if (drbd_request_state(adm_ctx.device, NS(user_isp, 1)) == SS_NOTHING_TO_DO)
+	peer_device = adm_ctx.peer_device;
+	if (change_resync_susp_user(peer_device, true,
+			CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE) == SS_NOTHING_TO_DO)
 		retcode = ERR_PAUSE_IS_SET;
+
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
-out:
+ out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
-	union drbd_dev_state s;
+	struct drbd_peer_device *peer_device;
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_DEVICE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
+
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
 		goto out;
+	}
+
+	peer_device = adm_ctx.peer_device;
+	if (change_resync_susp_user(peer_device, false,
+			CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE) == SS_NOTHING_TO_DO) {
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	if (drbd_request_state(adm_ctx.device, NS(user_isp, 0)) == SS_NOTHING_TO_DO) {
-		s = adm_ctx.device->state;
-		if (s.conn == C_PAUSED_SYNC_S || s.conn == C_PAUSED_SYNC_T) {
-			retcode = s.aftr_isp ? ERR_PIC_AFTER_DEP :
-				  s.peer_isp ? ERR_PIC_PEER_DEP : ERR_PAUSE_IS_CLEAR;
+		if (peer_device->repl_state[NOW] == L_PAUSED_SYNC_S ||
+		    peer_device->repl_state[NOW] == L_PAUSED_SYNC_T) {
+			if (peer_device->resync_susp_dependency[NOW])
+				retcode = ERR_PIC_AFTER_DEP;
+			else if (peer_device->resync_susp_peer[NOW])
+				retcode = ERR_PIC_PEER_DEP;
+			else
+				retcode = ERR_PAUSE_IS_CLEAR;
 		} else {
 			retcode = ERR_PAUSE_IS_CLEAR;
 		}
 	}
+
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
-out:
+ out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_suspend_io(struct sk_buff *skb, struct genl_info *info)
+static bool io_drained(struct drbd_device *device)
 {
-	return drbd_adm_simple_request_state(skb, info, NS(susp, 1));
+	struct drbd_peer_device *peer_device;
+	bool drained = true;
+
+	if (atomic_read(&device->local_cnt))
+		return false;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		if (atomic_read(&peer_device->ap_pending_cnt)) {
+			drained = false;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return drained;
 }
 
-int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_suspend_io(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
+	struct drbd_resource *resource;
 	struct drbd_device *device;
-	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
+	int retcode, vnr, err = 0;
+	struct suspend_io_parms params = {
+		.bdev_freeze = true,
+	};
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
+	resource = adm_ctx.device->resource;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	device = adm_ctx.device;
-	if (test_bit(NEW_CUR_UUID, &device->flags)) {
-		if (get_ldev_if_state(device, D_ATTACHING)) {
-			drbd_uuid_new_current(device);
-			put_ldev(device);
-		} else {
-			/* This is effectively a multi-stage "forced down".
-			 * The NEW_CUR_UUID bit is supposedly only set, if we
-			 * lost the replication connection, and are configured
-			 * to freeze IO and wait for some fence-peer handler.
-			 * So we still don't have a replication connection.
-			 * And now we don't have a local disk either.  After
-			 * resume, we will fail all pending and new IO, because
-			 * we don't have any data anymore.  Which means we will
-			 * eventually be able to terminate all users of this
-			 * device, and then take it down.  By bumping the
-			 * "effective" data uuid, we make sure that you really
-			 * need to tear down before you reconfigure, we will
-			 * the refuse to re-connect or re-attach (because no
-			 * matching real data uuid exists).
-			 */
-			u64 val;
-			get_random_bytes(&val, sizeof(u64));
-			drbd_set_ed_uuid(device, val);
-			drbd_warn(device, "Resumed without access to data; please tear down before attempting to re-configure.\n");
+	if (info->attrs[DRBD_NLA_SUSPEND_IO_PARAMS]) {
+		err = suspend_io_parms_from_attrs(&params, info);
+		if (err) {
+			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			return err;
 		}
-		clear_bit(NEW_CUR_UUID, &device->flags);
 	}
-	drbd_suspend_io(device);
-	retcode = drbd_request_state(device, NS3(susp, 0, susp_nod, 0, susp_fen, 0));
-	if (retcode == SS_SUCCESS) {
-		if (device->state.conn < C_CONNECTED)
-			tl_clear(first_peer_device(device)->connection);
-		if (device->state.disk == D_DISKLESS || device->state.disk == D_FAILED)
-			tl_restart(first_peer_device(device)->connection, FAIL_FROZEN_DISK_IO);
+
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out;
+	}
+
+	idr_for_each_entry(&resource->devices, device, vnr)
+		if (params.bdev_freeze && !test_bit(BDEV_FROZEN, &device->flags)) {
+			err = bdev_freeze(device->vdisk->part0);
+			if (err)
+				goto out_thaw;
+
+			set_bit(BDEV_FROZEN, &device->flags);
+		}
+
+	retcode = stable_state_change(resource, change_io_susp_user(resource, true,
+						CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE));
+	mutex_unlock(&resource->adm_mutex);
+	if (retcode < SS_SUCCESS)
+		goto out;
+
+	idr_for_each_entry(&resource->devices, device, vnr)
+		wait_event_interruptible(device->misc_wait, io_drained(device));
+out:
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
+out_thaw:
+	idr_for_each_entry(&resource->devices, device, vnr)
+		if (test_and_clear_bit(BDEV_FROZEN, &device->flags))
+			bdev_thaw(device->vdisk->part0);
+
+	mutex_unlock(&resource->adm_mutex);
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return err;
+}
+
+static int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	struct drbd_connection *connection;
+	struct drbd_resource *resource;
+	struct drbd_device *device;
+	unsigned long irq_flags;
+	int vnr, retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
+
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	if (!adm_ctx.reply_skb)
+		return retcode;
+
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out;
 	}
+	device = adm_ctx.device;
+	resource = device->resource;
+	if (test_and_clear_bit(NEW_CUR_UUID, &device->flags))
+		drbd_uuid_new_current(device, false);
+	drbd_suspend_io(device, READ_AND_WRITE);
+	begin_state_change(resource, &irq_flags, CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE);
+	__change_io_susp_user(resource, false);
+	__change_io_susp_no_data(resource, false);
+	for_each_connection(connection, resource)
+		__change_io_susp_fencing(connection, false);
+
+	__change_io_susp_quorum(resource, false);
+	retcode = end_state_change(resource, &irq_flags, "resume-io");
 	drbd_resume_io(device);
+
+	idr_for_each_entry(&resource->devices, device, vnr)
+		if (test_and_clear_bit(BDEV_FROZEN, &device->flags))
+			bdev_thaw(device->vdisk->part0);
+
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
-out:
+ out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_outdate(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_outdate(struct sk_buff *skb, struct genl_info *info)
 {
-	return drbd_adm_simple_request_state(skb, info, NS(disk, D_OUTDATED));
+	struct drbd_config_context adm_ctx;
+	enum drbd_ret_code retcode;
+
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	if (!adm_ctx.reply_skb)
+		return retcode;
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+	} else {
+		retcode = stable_state_change(adm_ctx.device->resource,
+			change_disk_state(adm_ctx.device, D_OUTDATED,
+				  CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE, "outdate", NULL));
+		mutex_unlock(&adm_ctx.resource->adm_mutex);
+	}
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
 }
 
 static int nla_put_drbd_cfg_context(struct sk_buff *skb,
 				    struct drbd_resource *resource,
 				    struct drbd_connection *connection,
-				    struct drbd_device *device)
+				    struct drbd_device *device,
+				    struct drbd_path *path)
 {
 	struct nlattr *nla;
 	nla = nla_nest_start_noflag(skb, DRBD_NLA_CFG_CONTEXT);
 	if (!nla)
 		goto nla_put_failure;
-	if (device &&
-	    nla_put_u32(skb, T_ctx_volume, device->vnr))
-		goto nla_put_failure;
-	if (nla_put_string(skb, T_ctx_resource_name, resource->name))
-		goto nla_put_failure;
+	if (device)
+		nla_put_u32(skb, T_ctx_volume, device->vnr);
+	if (resource)
+		nla_put_string(skb, T_ctx_resource_name, resource->name);
 	if (connection) {
-		if (connection->my_addr_len &&
-		    nla_put(skb, T_ctx_my_addr, connection->my_addr_len, &connection->my_addr))
-			goto nla_put_failure;
-		if (connection->peer_addr_len &&
-		    nla_put(skb, T_ctx_peer_addr, connection->peer_addr_len, &connection->peer_addr))
-			goto nla_put_failure;
+		nla_put_u32(skb, T_ctx_peer_node_id, connection->peer_node_id);
+		rcu_read_lock();
+		if (connection->transport.net_conf)
+			nla_put_string(skb, T_ctx_conn_name, connection->transport.net_conf->name);
+		rcu_read_unlock();
+	}
+	if (path) {
+		nla_put(skb, T_ctx_my_addr, path->my_addr_len, &path->my_addr);
+		nla_put(skb, T_ctx_peer_addr, path->peer_addr_len, &path->peer_addr);
 	}
 	nla_nest_end(skb, nla);
 	return 0;
@@ -3250,7 +6031,7 @@ static struct nlattr *find_cfg_context_attr(const struct nlmsghdr *nlh, int attr
 
 static void resource_to_info(struct resource_info *, struct drbd_resource *);
 
-int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb)
+static int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct drbd_genlmsghdr *dh;
 	struct drbd_resource *resource;
@@ -3285,7 +6066,7 @@ int drbd_adm_dump_resources(struct sk_buff *skb, struct netlink_callback *cb)
 		goto out;
 	dh->minor = -1U;
 	dh->ret_code = NO_ERROR;
-	err = nla_put_drbd_cfg_context(skb, resource, NULL, NULL);
+	err = nla_put_drbd_cfg_context(skb, resource, NULL, NULL, NULL);
 	if (err)
 		goto out;
 	err = res_opts_to_skb(skb, &resource->res_opts, !capable(CAP_SYS_ADMIN));
@@ -3321,16 +6102,18 @@ static void device_to_statistics(struct device_statistics *s,
 		int n;
 
 		spin_lock_irq(&md->uuid_lock);
-		s->dev_current_uuid = md->uuid[UI_CURRENT];
-		BUILD_BUG_ON(sizeof(s->history_uuids) < UI_HISTORY_END - UI_HISTORY_START + 1);
-		for (n = 0; n < UI_HISTORY_END - UI_HISTORY_START + 1; n++)
-			history_uuids[n] = md->uuid[UI_HISTORY_START + n];
-		for (; n < HISTORY_UUIDS; n++)
-			history_uuids[n] = 0;
-		s->history_uuids_len = HISTORY_UUIDS;
+		s->dev_current_uuid = md->current_uuid;
+		BUILD_BUG_ON(sizeof(s->history_uuids) != sizeof(md->history_uuids));
+		for (n = 0; n < ARRAY_SIZE(md->history_uuids); n++)
+			history_uuids[n] = md->history_uuids[n];
+		s->history_uuids_len = sizeof(s->history_uuids);
 		spin_unlock_irq(&md->uuid_lock);
 
 		s->dev_disk_flags = md->flags;
+		/* originally, this used the bdi congestion framework,
+		 * but that was removed in linux 5.18.
+		 * so just never report the lower device as congested. */
+		s->dev_lower_blocked = false;
 		put_ldev(device);
 	}
 	s->dev_size = get_capacity(device->vdisk);
@@ -3338,10 +6121,11 @@ static void device_to_statistics(struct device_statistics *s,
 	s->dev_write = device->writ_cnt;
 	s->dev_al_writes = device->al_writ_cnt;
 	s->dev_bm_writes = device->bm_writ_cnt;
-	s->dev_upper_pending = atomic_read(&device->ap_bio_cnt);
+	s->dev_upper_pending = atomic_read(&device->ap_bio_cnt[READ]) +
+		atomic_read(&device->ap_bio_cnt[WRITE]);
 	s->dev_lower_pending = atomic_read(&device->local_cnt);
 	s->dev_al_suspended = test_bit(AL_SUSPENDED, &device->flags);
-	s->dev_exposed_data_uuid = device->ed_uuid;
+	s->dev_exposed_data_uuid = device->exposed_data_uuid;
 }
 
 static int put_resource_in_arg0(struct netlink_callback *cb, int holder_nr)
@@ -3355,13 +6139,12 @@ static int put_resource_in_arg0(struct netlink_callback *cb, int holder_nr)
 	return 0;
 }
 
-int drbd_adm_dump_devices_done(struct netlink_callback *cb) {
+static int drbd_adm_dump_devices_done(struct netlink_callback *cb)
+{
 	return put_resource_in_arg0(cb, 7);
 }
 
-static void device_to_info(struct device_info *, struct drbd_device *);
-
-int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
+static int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource;
@@ -3373,9 +6156,11 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 	struct idr *idr_to_search;
 
 	resource = (struct drbd_resource *)cb->args[0];
+
+	rcu_read_lock();
 	if (!cb->args[0] && !cb->args[1]) {
 		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
-		if (resource_filter) {
+		if (!IS_ERR_OR_NULL(resource_filter)) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
 			if (!resource)
@@ -3384,7 +6169,6 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 		}
 	}
 
-	rcu_read_lock();
 	minor = cb->args[1];
 	idr_to_search = resource ? &resource->devices : &drbd_devices;
 	device = idr_get_next(idr_to_search, &minor);
@@ -3410,7 +6194,7 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 	dh->minor = -1U;
 	if (retcode == NO_ERROR) {
 		dh->minor = device->minor;
-		err = nla_put_drbd_cfg_context(skb, device->resource, NULL, device);
+		err = nla_put_drbd_cfg_context(skb, device->resource, NULL, device, NULL);
 		if (err)
 			goto out;
 		if (get_ldev(device)) {
@@ -3422,6 +6206,9 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 			if (err)
 				goto out;
 		}
+		err = device_conf_to_skb(skb, &device->device_conf, !capable(CAP_SYS_ADMIN));
+		if (err)
+			goto out;
 		device_to_info(&device_info, device);
 		err = device_info_to_skb(skb, &device_info, !capable(CAP_SYS_ADMIN));
 		if (err)
@@ -3443,14 +6230,47 @@ int drbd_adm_dump_devices(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len;
 }
 
-int drbd_adm_dump_connections_done(struct netlink_callback *cb)
+static int drbd_adm_dump_connections_done(struct netlink_callback *cb)
 {
 	return put_resource_in_arg0(cb, 6);
 }
 
+static int connection_paths_to_skb(struct sk_buff *skb, struct drbd_connection *connection)
+{
+	struct drbd_path *path;
+	struct nlattr *tla = nla_nest_start_noflag(skb, DRBD_NLA_PATH_PARMS);
+	if (!tla)
+		goto nla_put_failure;
+
+	/* array of such paths. */
+	rcu_read_lock();
+	list_for_each_entry_rcu(path, &connection->transport.paths, list) {
+		if (nla_put(skb, T_my_addr, path->my_addr_len, &path->my_addr) ||
+				nla_put(skb, T_peer_addr, path->peer_addr_len, &path->peer_addr)) {
+			rcu_read_unlock();
+			goto nla_put_failure;
+		}
+	}
+	rcu_read_unlock();
+	nla_nest_end(skb, tla);
+	return 0;
+
+nla_put_failure:
+	if (tla)
+		nla_nest_cancel(skb, tla);
+	return -EMSGSIZE;
+}
+
+static void connection_to_statistics(struct connection_statistics *s, struct drbd_connection *connection)
+{
+	s->conn_congested = test_bit(NET_CONGESTED, &connection->transport.flags);
+	s->ap_in_flight = atomic_read(&connection->ap_in_flight);
+	s->rs_in_flight = atomic_read(&connection->rs_in_flight);
+}
+
 enum { SINGLE_RESOURCE, ITERATE_RESOURCES };
 
-int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
+static int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource = NULL, *next_resource;
@@ -3464,7 +6284,7 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 	resource = (struct drbd_resource *)cb->args[0];
 	if (!cb->args[0]) {
 		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
-		if (resource_filter) {
+		if (!IS_ERR_OR_NULL(resource_filter)) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
 			if (!resource)
@@ -3484,7 +6304,13 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 
     next_resource:
 	rcu_read_unlock();
-	mutex_lock(&resource->conf_update);
+	if (mutex_lock_interruptible(&resource->conf_update)) {
+		kref_put(&resource->kref, drbd_destroy_resource);
+		resource = NULL;
+		retcode = ERR_INTR;
+		rcu_read_lock();
+		goto put_result;
+	}
 	rcu_read_lock();
 	if (cb->args[2]) {
 		for_each_connection_rcu(connection, resource)
@@ -3497,8 +6323,6 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 
 found_connection:
 	list_for_each_entry_continue_rcu(connection, &resource->connections, connections) {
-		if (!has_net_conf(connection))
-			continue;
 		retcode = NO_ERROR;
 		goto put_result;  /* only one iteration */
 	}
@@ -3537,20 +6361,21 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 	if (retcode == NO_ERROR) {
 		struct net_conf *net_conf;
 
-		err = nla_put_drbd_cfg_context(skb, resource, connection, NULL);
+		err = nla_put_drbd_cfg_context(skb, resource, connection, NULL, NULL);
 		if (err)
 			goto out;
-		net_conf = rcu_dereference(connection->net_conf);
+		net_conf = rcu_dereference(connection->transport.net_conf);
 		if (net_conf) {
 			err = net_conf_to_skb(skb, net_conf, !capable(CAP_SYS_ADMIN));
 			if (err)
 				goto out;
 		}
 		connection_to_info(&connection_info, connection);
+		connection_paths_to_skb(skb, connection);
 		err = connection_info_to_skb(skb, &connection_info, !capable(CAP_SYS_ADMIN));
 		if (err)
 			goto out;
-		connection_statistics.conn_congested = test_bit(NET_CONGESTED, &connection->flags);
+		connection_to_statistics(&connection_statistics, connection);
 		err = connection_statistics_to_skb(skb, &connection_statistics, !capable(CAP_SYS_ADMIN));
 		if (err)
 			goto out;
@@ -3568,51 +6393,92 @@ int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len;
 }
 
-enum mdf_peer_flag {
-	MDF_PEER_CONNECTED =	1 << 0,
-	MDF_PEER_OUTDATED =	1 << 1,
-	MDF_PEER_FENCING =	1 << 2,
-	MDF_PEER_FULL_SYNC =	1 << 3,
-};
-
 static void peer_device_to_statistics(struct peer_device_statistics *s,
-				      struct drbd_peer_device *peer_device)
+				      struct drbd_peer_device *pd)
 {
-	struct drbd_device *device = peer_device->device;
+	struct drbd_device *device = pd->device;
+	struct drbd_md *md;
+	struct drbd_peer_md *peer_md;
+	struct drbd_bitmap *bm;
+	unsigned long now = jiffies;
+	unsigned long rs_left = 0;
+	int i;
+
+	/* userspace should get "future proof" units,
+	 * convert to sectors or milli seconds as appropriate */
 
 	memset(s, 0, sizeof(*s));
-	s->peer_dev_received = device->recv_cnt;
-	s->peer_dev_sent = device->send_cnt;
-	s->peer_dev_pending = atomic_read(&device->ap_pending_cnt) +
-			      atomic_read(&device->rs_pending_cnt);
-	s->peer_dev_unacked = atomic_read(&device->unacked_cnt);
-	s->peer_dev_out_of_sync = drbd_bm_total_weight(device) << (BM_BLOCK_SHIFT - 9);
-	s->peer_dev_resync_failed = device->rs_failed << (BM_BLOCK_SHIFT - 9);
-	if (get_ldev(device)) {
-		struct drbd_md *md = &device->ldev->md;
+	s->peer_dev_received = pd->recv_cnt;
+	s->peer_dev_sent = pd->send_cnt;
+	s->peer_dev_pending = atomic_read(&pd->ap_pending_cnt) +
+			      atomic_read(&pd->rs_pending_cnt);
+	s->peer_dev_unacked = atomic_read(&pd->unacked_cnt);
+	s->peer_dev_uuid_flags = pd->uuid_flags;
+
+	/* Below are resync / verify / bitmap / meta data stats.
+	 * Without disk, we don't have those.
+	 */
+	if (!get_ldev(device))
+		return;
 
-		spin_lock_irq(&md->uuid_lock);
-		s->peer_dev_bitmap_uuid = md->uuid[UI_BITMAP];
-		spin_unlock_irq(&md->uuid_lock);
-		s->peer_dev_flags =
-			(drbd_md_test_flag(device->ldev, MDF_CONNECTED_IND) ?
-				MDF_PEER_CONNECTED : 0) +
-			(drbd_md_test_flag(device->ldev, MDF_CONSISTENT) &&
-			 !drbd_md_test_flag(device->ldev, MDF_WAS_UP_TO_DATE) ?
-				MDF_PEER_OUTDATED : 0) +
-			/* FIXME: MDF_PEER_FENCING? */
-			(drbd_md_test_flag(device->ldev, MDF_FULL_SYNC) ?
-				MDF_PEER_FULL_SYNC : 0);
-		put_ldev(device);
+	bm = device->bitmap;
+	s->peer_dev_out_of_sync = bm_bit_to_sect(bm, drbd_bm_total_weight(pd));
+
+	if (is_verify_state(pd, NOW)) {
+		rs_left = bm_bit_to_sect(bm, atomic64_read(&pd->ov_left));
+		s->peer_dev_ov_start_sector = pd->ov_start_sector;
+		s->peer_dev_ov_stop_sector = pd->ov_stop_sector;
+		s->peer_dev_ov_position = pd->ov_position;
+		s->peer_dev_ov_left = bm_bit_to_sect(bm, atomic64_read(&pd->ov_left));
+		s->peer_dev_ov_skipped = bm_bit_to_sect(bm, pd->ov_skipped);
+	} else if (is_sync_state(pd, NOW)) {
+		rs_left = s->peer_dev_out_of_sync - bm_bit_to_sect(bm, pd->rs_failed);
+		s->peer_dev_resync_failed = bm_bit_to_sect(bm, pd->rs_failed);
+		s->peer_dev_rs_same_csum = bm_bit_to_sect(bm, pd->rs_same_csum);
+	}
+
+	if (rs_left) {
+		enum drbd_repl_state repl_state = pd->repl_state[NOW];
+		if (repl_state == L_SYNC_TARGET || repl_state == L_VERIFY_S)
+			s->peer_dev_rs_c_sync_rate = pd->c_sync_rate;
+
+		s->peer_dev_rs_total = bm_bit_to_sect(bm, pd->rs_total);
+
+		s->peer_dev_rs_dt_start_ms = jiffies_to_msecs(now - pd->rs_start);
+		s->peer_dev_rs_paused_ms = jiffies_to_msecs(pd->rs_paused);
+
+		i = (pd->rs_last_mark + 2) % DRBD_SYNC_MARKS;
+		s->peer_dev_rs_dt0_ms = jiffies_to_msecs(now - pd->rs_mark_time[i]);
+		s->peer_dev_rs_db0_sectors = bm_bit_to_sect(bm, pd->rs_mark_left[i]) - rs_left;
+
+		i = (pd->rs_last_mark + DRBD_SYNC_MARKS-1) % DRBD_SYNC_MARKS;
+		s->peer_dev_rs_dt1_ms = jiffies_to_msecs(now - pd->rs_mark_time[i]);
+		s->peer_dev_rs_db1_sectors = bm_bit_to_sect(bm, pd->rs_mark_left[i]) - rs_left;
+
+		/* long term average:
+		 * dt = rs_dt_start_ms - rs_paused_ms;
+		 * db = rs_total - rs_left, which is
+		 *   rs_total - (ov_left? ov_left : out_of_sync - rs_failed)
+		 */
 	}
+
+	md = &device->ldev->md;
+	peer_md = &md->peers[pd->node_id];
+
+	spin_lock_irq(&md->uuid_lock);
+	s->peer_dev_bitmap_uuid = peer_md->bitmap_uuid;
+	spin_unlock_irq(&md->uuid_lock);
+	s->peer_dev_flags = peer_md->flags;
+
+	put_ldev(device);
 }
 
-int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb)
+static int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb)
 {
 	return put_resource_in_arg0(cb, 9);
 }
 
-int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
+static int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource;
@@ -3623,9 +6489,11 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 	struct idr *idr_to_search;
 
 	resource = (struct drbd_resource *)cb->args[0];
+
+	rcu_read_lock();
 	if (!cb->args[0] && !cb->args[1]) {
 		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
-		if (resource_filter) {
+		if (!IS_ERR_OR_NULL(resource_filter)) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
 			if (!resource)
@@ -3634,7 +6502,6 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 		cb->args[0] = (long)resource;
 	}
 
-	rcu_read_lock();
 	minor = cb->args[1];
 	idr_to_search = resource ? &resource->devices : &drbd_devices;
 	device = idr_find(idr_to_search, minor);
@@ -3649,7 +6516,7 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 		}
 	}
 	if (cb->args[2]) {
-		for_each_peer_device(peer_device, device)
+		for_each_peer_device_rcu(peer_device, device)
 			if (peer_device == (struct drbd_peer_device *)cb->args[2])
 				goto found_peer_device;
 		/* peer device was probably deleted */
@@ -3660,8 +6527,6 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 
 found_peer_device:
 	list_for_each_entry_continue_rcu(peer_device, &device->peer_devices, peer_devices) {
-		if (!has_net_conf(peer_device->connection))
-			continue;
 		retcode = NO_ERROR;
 		goto put_result;  /* only one iteration */
 	}
@@ -3679,9 +6544,10 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 	if (retcode == NO_ERROR) {
 		struct peer_device_info peer_device_info;
 		struct peer_device_statistics peer_device_statistics;
+		struct peer_device_conf *peer_device_conf;
 
 		dh->minor = minor;
-		err = nla_put_drbd_cfg_context(skb, device->resource, peer_device->connection, device);
+		err = nla_put_drbd_cfg_context(skb, device->resource, peer_device->connection, device, NULL);
 		if (err)
 			goto out;
 		peer_device_to_info(&peer_device_info, peer_device);
@@ -3692,6 +6558,13 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 		err = peer_device_statistics_to_skb(skb, &peer_device_statistics, !capable(CAP_SYS_ADMIN));
 		if (err)
 			goto out;
+		peer_device_conf = rcu_dereference(peer_device->conf);
+		if (peer_device_conf) {
+			err = peer_device_conf_to_skb(skb, peer_device_conf, !capable(CAP_SYS_ADMIN));
+			if (err)
+				goto out;
+		}
+
 		cb->args[1] = minor;
 		cb->args[2] = (long)peer_device;
 	}
@@ -3704,362 +6577,150 @@ int drbd_adm_dump_peer_devices(struct sk_buff *skb, struct netlink_callback *cb)
 		return err;
 	return skb->len;
 }
-/*
- * Return the connection of @resource if @resource has exactly one connection.
- */
-static struct drbd_connection *the_only_connection(struct drbd_resource *resource)
-{
-	struct list_head *connections = &resource->connections;
 
-	if (list_empty(connections) || connections->next->next != connections)
-		return NULL;
-	return list_first_entry(&resource->connections, struct drbd_connection, connections);
+static int drbd_adm_dump_paths_done(struct netlink_callback *cb)
+{
+	return put_resource_in_arg0(cb, 10);
 }
 
-static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
-		const struct sib_info *sib)
+static int drbd_adm_dump_paths(struct sk_buff *skb, struct netlink_callback *cb)
 {
-	struct drbd_resource *resource = device->resource;
-	struct state_info *si = NULL; /* for sizeof(si->member); */
-	struct nlattr *nla;
-	int got_ldev;
-	int err = 0;
-	int exclude_sensitive;
-
-	/* If sib != NULL, this is drbd_bcast_event, which anyone can listen
-	 * to.  So we better exclude_sensitive information.
-	 *
-	 * If sib == NULL, this is drbd_adm_get_status, executed synchronously
-	 * in the context of the requesting user process. Exclude sensitive
-	 * information, unless current has superuser.
-	 *
-	 * NOTE: for drbd_adm_get_status_all(), this is a netlink dump, and
-	 * relies on the current implementation of netlink_dump(), which
-	 * executes the dump callback successively from netlink_recvmsg(),
-	 * always in the context of the receiving process */
-	exclude_sensitive = sib || !capable(CAP_SYS_ADMIN);
-
-	got_ldev = get_ldev(device);
-
-	/* We need to add connection name and volume number information still.
-	 * Minor number is in drbd_genlmsghdr. */
-	if (nla_put_drbd_cfg_context(skb, resource, the_only_connection(resource), device))
-		goto nla_put_failure;
-
-	if (res_opts_to_skb(skb, &device->resource->res_opts, exclude_sensitive))
-		goto nla_put_failure;
+	struct nlattr *resource_filter;
+	struct drbd_resource *resource = NULL, *next_resource;
+	struct drbd_connection *connection = NULL;
+	struct drbd_path *path = NULL;
+	int err = 0, retcode;
+	struct drbd_genlmsghdr *dh;
 
 	rcu_read_lock();
-	if (got_ldev) {
-		struct disk_conf *disk_conf;
-
-		disk_conf = rcu_dereference(device->ldev->disk_conf);
-		err = disk_conf_to_skb(skb, disk_conf, exclude_sensitive);
-	}
-	if (!err) {
-		struct net_conf *nc;
-
-		nc = rcu_dereference(first_peer_device(device)->connection->net_conf);
-		if (nc)
-			err = net_conf_to_skb(skb, nc, exclude_sensitive);
-	}
-	rcu_read_unlock();
-	if (err)
-		goto nla_put_failure;
-
-	nla = nla_nest_start_noflag(skb, DRBD_NLA_STATE_INFO);
-	if (!nla)
-		goto nla_put_failure;
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
-		goto nla_put_failure;
-
-	if (got_ldev) {
-		int err;
-
-		spin_lock_irq(&device->ldev->md.uuid_lock);
-		err = nla_put(skb, T_uuids, sizeof(si->uuids), device->ldev->md.uuid);
-		spin_unlock_irq(&device->ldev->md.uuid_lock);
-
-		if (err)
-			goto nla_put_failure;
-
-		if (nla_put_u32(skb, T_disk_flags, device->ldev->md.flags) ||
-		    nla_put_u64_0pad(skb, T_bits_total, drbd_bm_bits(device)) ||
-		    nla_put_u64_0pad(skb, T_bits_oos,
-				     drbd_bm_total_weight(device)))
-			goto nla_put_failure;
-		if (C_SYNC_SOURCE <= device->state.conn &&
-		    C_PAUSED_SYNC_T >= device->state.conn) {
-			if (nla_put_u64_0pad(skb, T_bits_rs_total,
-					     device->rs_total) ||
-			    nla_put_u64_0pad(skb, T_bits_rs_failed,
-					     device->rs_failed))
-				goto nla_put_failure;
-		}
-	}
-
-	if (sib) {
-		switch(sib->sib_reason) {
-		case SIB_SYNC_PROGRESS:
-		case SIB_GET_STATUS_REPLY:
-			break;
-		case SIB_STATE_CHANGE:
-			if (nla_put_u32(skb, T_prev_state, sib->os.i) ||
-			    nla_put_u32(skb, T_new_state, sib->ns.i))
-				goto nla_put_failure;
-			break;
-		case SIB_HELPER_POST:
-			if (nla_put_u32(skb, T_helper_exit_code,
-					sib->helper_exit_code))
-				goto nla_put_failure;
-			fallthrough;
-		case SIB_HELPER_PRE:
-			if (nla_put_string(skb, T_helper, sib->helper_name))
-				goto nla_put_failure;
-			break;
+	resource = (struct drbd_resource *)cb->args[0];
+	if (!cb->args[0]) {
+		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
+		if (!IS_ERR_OR_NULL(resource_filter)) {
+			retcode = ERR_RES_NOT_KNOWN;
+			resource = drbd_find_resource(nla_data(resource_filter));
+			if (!resource)
+				goto put_result;
+			cb->args[0] = (long)resource;
+			cb->args[1] = SINGLE_RESOURCE;
 		}
 	}
-	nla_nest_end(skb, nla);
-
-	if (0)
-nla_put_failure:
-		err = -EMSGSIZE;
-	if (got_ldev)
-		put_ldev(device);
-	return err;
-}
-
-int drbd_adm_get_status(struct sk_buff *skb, struct genl_info *info)
-{
-	struct drbd_config_context adm_ctx;
-	enum drbd_ret_code retcode;
-	int err;
-
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
-
-	err = nla_put_status_info(adm_ctx.reply_skb, adm_ctx.device, NULL);
-	if (err) {
-		nlmsg_free(adm_ctx.reply_skb);
-		return err;
+	if (!resource) {
+		if (list_empty(&drbd_resources))
+			goto out;
+		resource = list_first_entry(&drbd_resources, struct drbd_resource, resources);
+		kref_get(&resource->kref);
+		cb->args[0] = (long)resource;
+		cb->args[1] = ITERATE_RESOURCES;
 	}
-out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
-	return 0;
-}
-
-static int get_one_status(struct sk_buff *skb, struct netlink_callback *cb)
-{
-	struct drbd_device *device;
-	struct drbd_genlmsghdr *dh;
-	struct drbd_resource *pos = (struct drbd_resource *)cb->args[0];
-	struct drbd_resource *resource = NULL;
-	struct drbd_resource *tmp;
-	unsigned volume = cb->args[1];
-
-	/* Open coded, deferred, iteration:
-	 * for_each_resource_safe(resource, tmp, &drbd_resources) {
-	 *      connection = "first connection of resource or undefined";
-	 *	idr_for_each_entry(&resource->devices, device, i) {
-	 *	  ...
-	 *	}
-	 * }
-	 * where resource is cb->args[0];
-	 * and i is cb->args[1];
-	 *
-	 * cb->args[2] indicates if we shall loop over all resources,
-	 * or just dump all volumes of a single resource.
-	 *
-	 * This may miss entries inserted after this dump started,
-	 * or entries deleted before they are reached.
-	 *
-	 * We need to make sure the device won't disappear while
-	 * we are looking at it, and revalidate our iterators
-	 * on each iteration.
-	 */
 
-	/* synchronize with conn_create()/drbd_destroy_connection() */
+next_resource:
+	rcu_read_unlock();
+	mutex_lock(&resource->conf_update);
 	rcu_read_lock();
-	/* revalidate iterator position */
-	for_each_resource_rcu(tmp, &drbd_resources) {
-		if (pos == NULL) {
-			/* first iteration */
-			pos = tmp;
-			resource = pos;
-			break;
-		}
-		if (tmp == pos) {
-			resource = pos;
-			break;
+	if (cb->args[2]) {
+		for_each_connection_rcu(connection, resource) {
+			list_for_each_entry_rcu(path, &connection->transport.paths, list)
+				if (path == (struct drbd_path *)cb->args[2])
+					goto found_path;
 		}
+		/* path was probably deleted */
+		goto no_more_paths;
 	}
-	if (resource) {
-next_resource:
-		device = idr_get_next(&resource->devices, &volume);
-		if (!device) {
-			/* No more volumes to dump on this resource.
-			 * Advance resource iterator. */
-			pos = list_entry_rcu(resource->resources.next,
-					     struct drbd_resource, resources);
-			/* Did we dump any volume of this resource yet? */
-			if (volume != 0) {
-				/* If we reached the end of the list,
-				 * or only a single resource dump was requested,
-				 * we are done. */
-				if (&pos->resources == &drbd_resources || cb->args[2])
-					goto out;
-				volume = 0;
-				resource = pos;
-				goto next_resource;
-			}
-		}
-
-		dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
-				cb->nlh->nlmsg_seq, &drbd_genl_family,
-				NLM_F_MULTI, DRBD_ADM_GET_STATUS);
-		if (!dh)
-			goto out;
 
-		if (!device) {
-			/* This is a connection without a single volume.
-			 * Suprisingly enough, it may have a network
-			 * configuration. */
-			struct drbd_connection *connection;
+	connection = first_connection(resource);
+	if (!connection)
+		goto no_more_paths;
 
-			dh->minor = -1U;
-			dh->ret_code = NO_ERROR;
-			connection = the_only_connection(resource);
-			if (nla_put_drbd_cfg_context(skb, resource, connection, NULL))
-				goto cancel;
-			if (connection) {
-				struct net_conf *nc;
-
-				nc = rcu_dereference(connection->net_conf);
-				if (nc && net_conf_to_skb(skb, nc, 1) != 0)
-					goto cancel;
-			}
-			goto done;
-		}
+	path = list_entry(&connection->transport.paths, struct drbd_path, list);
 
-		D_ASSERT(device, device->vnr == volume);
-		D_ASSERT(device, device->resource == resource);
+found_path:
+	/* Advance to next path in connection. */
+	list_for_each_entry_continue_rcu(path, &connection->transport.paths, list) {
+		retcode = NO_ERROR;
+		goto put_result;  /* only one iteration */
+	}
 
-		dh->minor = device_to_minor(device);
-		dh->ret_code = NO_ERROR;
+	/* Advance to next connection. */
+	list_for_each_entry_continue_rcu(connection, &resource->connections, connections) {
+		path = first_path(connection);
+		if (!path)
+			continue;
+		retcode = NO_ERROR;
+		goto put_result;
+	}
 
-		if (nla_put_status_info(skb, device, NULL)) {
-cancel:
-			genlmsg_cancel(skb, dh);
-			goto out;
+no_more_paths:
+	if (cb->args[1] == ITERATE_RESOURCES) {
+		for_each_resource_rcu(next_resource, &drbd_resources) {
+			if (next_resource == resource)
+				goto found_resource;
 		}
-done:
-		genlmsg_end(skb, dh);
+		/* resource was probably deleted */
 	}
+	goto out;
 
-out:
-	rcu_read_unlock();
-	/* where to start the next iteration */
-	cb->args[0] = (long)pos;
-	cb->args[1] = (pos == resource) ? volume + 1 : 0;
-
-	/* No more resources/volumes/minors found results in an empty skb.
-	 * Which will terminate the dump. */
-        return skb->len;
-}
-
-/*
- * Request status of all resources, or of all volumes within a single resource.
- *
- * This is a dump, as the answer may not fit in a single reply skb otherwise.
- * Which means we cannot use the family->attrbuf or other such members, because
- * dump is NOT protected by the genl_lock().  During dump, we only have access
- * to the incoming skb, and need to opencode "parsing" of the nlattr payload.
- *
- * Once things are setup properly, we call into get_one_status().
- */
-int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
-{
-	const unsigned hdrlen = GENL_HDRLEN + GENL_MAGIC_FAMILY_HDRSZ;
-	struct nlattr *nla;
-	const char *resource_name;
-	struct drbd_resource *resource;
-	int maxtype;
-
-	/* Is this a followup call? */
-	if (cb->args[0]) {
-		/* ... of a single resource dump,
-		 * and the resource iterator has been advanced already? */
-		if (cb->args[2] && cb->args[2] != cb->args[0])
-			return 0; /* DONE. */
-		goto dump;
+found_resource:
+	list_for_each_entry_continue_rcu(next_resource, &drbd_resources, resources) {
+		mutex_unlock(&resource->conf_update);
+		kref_put(&resource->kref, drbd_destroy_resource);
+		resource = next_resource;
+		kref_get(&resource->kref);
+		cb->args[0] = (long)resource;
+		cb->args[2] = 0;
+		goto next_resource;
 	}
+	goto out;  /* no more resources */
 
-	/* First call (from netlink_dump_start).  We need to figure out
-	 * which resource(s) the user wants us to dump. */
-	nla = nla_find(nlmsg_attrdata(cb->nlh, hdrlen),
-			nlmsg_attrlen(cb->nlh, hdrlen),
-			DRBD_NLA_CFG_CONTEXT);
-
-	/* No explicit context given.  Dump all. */
-	if (!nla)
-		goto dump;
-	maxtype = ARRAY_SIZE(drbd_cfg_context_nl_policy) - 1;
-	nla = drbd_nla_find_nested(maxtype, nla, __nla_type(T_ctx_resource_name));
-	if (IS_ERR(nla))
-		return PTR_ERR(nla);
-	/* context given, but no name present? */
-	if (!nla)
-		return -EINVAL;
-	resource_name = nla_data(nla);
-	if (!*resource_name)
-		return -ENODEV;
-	resource = drbd_find_resource(resource_name);
-	if (!resource)
-		return -ENODEV;
-
-	kref_put(&resource->kref, drbd_destroy_resource); /* get_one_status() revalidates the resource */
+put_result:
+	dh = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
+			cb->nlh->nlmsg_seq, &drbd_genl_family,
+			NLM_F_MULTI, DRBD_ADM_GET_PATHS);
+	err = -ENOMEM;
+	if (!dh)
+		goto out;
+	dh->ret_code = retcode;
+	dh->minor = -1U;
+	if (retcode == NO_ERROR && connection && path) {
+		struct drbd_path_info path_info;
 
-	/* prime iterators, and set "filter" mode mark:
-	 * only dump this connection. */
-	cb->args[0] = (long)resource;
-	/* cb->args[1] = 0; passed in this way. */
-	cb->args[2] = (long)resource;
+		err = nla_put_drbd_cfg_context(skb, resource, connection, NULL, path);
+		if (err)
+			goto out;
+		path_info.path_established = test_bit(TR_ESTABLISHED, &path->flags);
+		err = drbd_path_info_to_skb(skb, &path_info, !capable(CAP_SYS_ADMIN));
+		if (err)
+			goto out;
+		cb->args[2] = (long)path;
+	}
+	genlmsg_end(skb, dh);
+	err = 0;
 
-dump:
-	return get_one_status(skb, cb);
+out:
+	rcu_read_unlock();
+	if (resource)
+		mutex_unlock(&resource->conf_update);
+	if (err)
+		return err;
+	return skb->len;
 }
 
-int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
+	struct drbd_peer_device *peer_device;
 	enum drbd_ret_code retcode;
 	struct timeout_parms tp;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_DEVICE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
+	peer_device = adm_ctx.peer_device;
 
 	tp.timeout_type =
-		adm_ctx.device->state.pdsk == D_OUTDATED ? UT_PEER_OUTDATED :
-		test_bit(USE_DEGR_WFC_T, &adm_ctx.device->flags) ? UT_DEGRADED :
+		peer_device->disk_state[NOW] == D_OUTDATED ? UT_PEER_OUTDATED :
+		test_bit(USE_DEGR_WFC_T, &peer_device->flags) ? UT_DEGRADED :
 		UT_DEFAULT;
 
 	err = timeout_parms_to_priv_skb(adm_ctx.reply_skb, &tp);
@@ -4067,28 +6728,29 @@ int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
 		nlmsg_free(adm_ctx.reply_skb);
 		return err;
 	}
-out:
+
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	struct drbd_device *device;
+	struct drbd_peer_device *peer_device;
 	enum drbd_ret_code retcode;
+	enum drbd_state_rv rv;
 	struct start_ov_parms parms;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_PEER_DEVICE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
 
-	device = adm_ctx.device;
+	peer_device = adm_ctx.peer_device;
+	device = peer_device->device;
 
 	/* resume from last known position, if possible */
-	parms.ov_start_sector = device->ov_start_sector;
+	parms.ov_start_sector = peer_device->ov_start_sector;
 	parms.ov_stop_sector = ULLONG_MAX;
 	if (info->attrs[DRBD_NLA_START_OV_PARMS]) {
 		int err = start_ov_parms_from_attrs(&parms, info);
@@ -4098,40 +6760,59 @@ int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
 			goto out;
 		}
 	}
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	if (!get_ldev(device)) {
+		retcode = ERR_NO_DISK;
+		goto out;
+	}
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_put_ldev;
+	}
 
 	/* w_make_ov_request expects position to be aligned */
-	device->ov_start_sector = parms.ov_start_sector & ~(BM_SECT_PER_BIT-1);
-	device->ov_stop_sector = parms.ov_stop_sector;
+	peer_device->ov_start_sector = parms.ov_start_sector & ~(bm_sect_per_bit(device->bitmap)-1);
+	peer_device->ov_stop_sector = parms.ov_stop_sector;
 
 	/* If there is still bitmap IO pending, e.g. previous resync or verify
 	 * just being finished, wait for it before requesting a new resync. */
-	drbd_suspend_io(device);
-	wait_event(device->misc_wait, !test_bit(BITMAP_IO, &device->flags));
-	retcode = drbd_request_state(device, NS(conn, C_VERIFY_S));
+	drbd_suspend_io(device, READ_AND_WRITE);
+	wait_event(device->misc_wait, !atomic_read(&device->pending_bitmap_work.n));
+	rv = stable_change_repl_state(peer_device,
+		L_VERIFY_S, CS_VERBOSE | CS_WAIT_COMPLETE | CS_SERIALIZE, "verify");
 	drbd_resume_io(device);
 
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	put_ldev(device);
+	drbd_adm_finish(&adm_ctx, info, rv);
+	return 0;
+
+out_put_ldev:
+	put_ldev(device);
 out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
+static bool should_skip_initial_sync(struct drbd_peer_device *peer_device)
+{
+	return peer_device->repl_state[NOW] == L_ESTABLISHED &&
+	       peer_device->connection->agreed_pro_version >= 90 &&
+	       drbd_current_uuid(peer_device->device) == UUID_JUST_CREATED;
+}
 
-int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	struct drbd_device *device;
+	struct drbd_peer_device *peer_device;
 	enum drbd_ret_code retcode;
-	int skip_initial_sync = 0;
 	int err;
 	struct new_c_uuid_parms args;
+	u64 nodes = 0, diskful = 0;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out_nolock;
 
 	device = adm_ctx.device;
 	memset(&args, 0, sizeof(args));
@@ -4140,12 +6821,18 @@ int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
 			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
-			goto out_nolock;
+			goto out_no_adm_mutex;
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	mutex_lock(device->state_mutex); /* Protects us against serialized state changes. */
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
+	if (down_interruptible(&device->resource->state_sem)) {
+		retcode = ERR_INTR;
+		goto out_no_state_sem;
+	}
 
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
@@ -4153,148 +6840,323 @@ int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	/* this is "skip initial sync", assume to be clean */
-	if (device->state.conn == C_CONNECTED &&
-	    first_peer_device(device)->connection->agreed_pro_version >= 90 &&
-	    device->ldev->md.uuid[UI_CURRENT] == UUID_JUST_CREATED && args.clear_bm) {
-		drbd_info(device, "Preparing to skip initial sync\n");
-		skip_initial_sync = 1;
-	} else if (device->state.conn != C_STANDALONE) {
-		retcode = ERR_CONNECTED;
-		goto out_dec;
+	for_each_peer_device(peer_device, device) {
+		if ((args.clear_bm || args.force_resync) && should_skip_initial_sync(peer_device)) {
+			if (peer_device->disk_state[NOW] >= D_INCONSISTENT) {
+				drbd_info(peer_device, "Preparing to %s initial sync\n",
+					  args.clear_bm ? "skip" : "force");
+				diskful |= NODE_MASK(peer_device->node_id);
+			}
+			nodes |= NODE_MASK(peer_device->node_id);
+		} else if (peer_device->repl_state[NOW] != L_OFF) {
+			retcode = ERR_CONNECTED;
+			goto out_dec;
+		}
 	}
 
-	drbd_uuid_set(device, UI_BITMAP, 0); /* Rotate UI_BITMAP to History 1, etc... */
-	drbd_uuid_new_current(device); /* New current, previous to UI_BITMAP */
+	drbd_uuid_new_current_by_user(device); /* New current, previous to UI_BITMAP */
+
+	if (args.force_resync) {
+		unsigned long irq_flags;
+		begin_state_change(device->resource, &irq_flags, CS_VERBOSE);
+		__change_disk_state(device, D_UP_TO_DATE);
+		end_state_change(device->resource, &irq_flags, "new-c-uuid");
+
+		for_each_peer_device(peer_device, device) {
+			if (NODE_MASK(peer_device->node_id) & nodes) {
+				if (NODE_MASK(peer_device->node_id) & diskful) {
+					drbd_info(peer_device, "Forcing resync");
+					set_bit(CONSIDER_RESYNC, &peer_device->flags);
+					drbd_send_uuids(peer_device, UUID_FLAG_RESYNC, 0);
+					drbd_send_current_state(peer_device);
+				} else {
+					drbd_send_uuids(peer_device, 0, 0);
+				}
+
+				drbd_print_uuids(peer_device, "forced resync UUID");
+			}
+		}
+	}
 
 	if (args.clear_bm) {
-		err = drbd_bitmap_io(device, &drbd_bmio_clear_n_write,
-			"clear_n_write from new_c_uuid", BM_LOCKED_MASK, NULL);
+		unsigned long irq_flags;
+
+		err = drbd_bitmap_io(device, &drbd_bmio_clear_all_n_write,
+			"clear_n_write from new_c_uuid", BM_LOCK_ALL, NULL);
 		if (err) {
 			drbd_err(device, "Writing bitmap failed with %d\n", err);
 			retcode = ERR_IO_MD_DISK;
 		}
-		if (skip_initial_sync) {
-			drbd_send_uuids_skip_initial_sync(first_peer_device(device));
-			_drbd_uuid_set(device, UI_BITMAP, 0);
-			drbd_print_uuids(device, "cleared bitmap UUID");
-			spin_lock_irq(&device->resource->req_lock);
-			_drbd_set_state(_NS2(device, disk, D_UP_TO_DATE, pdsk, D_UP_TO_DATE),
-					CS_VERBOSE, NULL);
-			spin_unlock_irq(&device->resource->req_lock);
+		for_each_peer_device(peer_device, device) {
+			if (NODE_MASK(peer_device->node_id) & nodes) {
+				_drbd_uuid_set_bitmap(peer_device, 0);
+				drbd_send_uuids(peer_device, UUID_FLAG_SKIP_INITIAL_SYNC, 0);
+				drbd_print_uuids(peer_device, "cleared bitmap UUID");
+			}
+		}
+		begin_state_change(device->resource, &irq_flags, CS_VERBOSE);
+		__change_disk_state(device, D_UP_TO_DATE);
+		for_each_peer_device(peer_device, device) {
+			if (NODE_MASK(peer_device->node_id) & diskful)
+				__change_peer_disk_state(peer_device, D_UP_TO_DATE);
 		}
+		end_state_change(device->resource, &irq_flags, "new-c-uuid");
 	}
 
-	drbd_md_sync(device);
+	drbd_md_sync_if_dirty(device);
 out_dec:
 	put_ldev(device);
 out:
-	mutex_unlock(device->state_mutex);
+	up(&device->resource->state_sem);
+out_no_state_sem:
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
-out_nolock:
+out_no_adm_mutex:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static enum drbd_ret_code
-drbd_check_resource_name(struct drbd_config_context *adm_ctx)
+/* name: a resource or connection name
+ * Comes from a NLA_NUL_STRING, and already passed validate_nla().
+ * It is known to be NUL-terminated within the bounds of our defined netlink
+ * attribute policy.
+ *
+ * It must not be empty.
+ * It must not be the literal "all".
+ *
+ * If strict:
+ * Only allow strict ascii alnum [0-9A-Za-z]
+ * and some hand selected punctuation characters
+ *
+ * If non strict:
+ * It must not contain '/', we use it as directory name in debugfs.
+ * It shall not contain "control characters" or space, as those may confuse
+ * utils when trying to parse the output of "drbdsetup events2" or similar.
+ * Otherwise, we don't care, it may be any tag that makes sense to userland,
+ * we do not enforce strict ascii or any other "encoding".
+ */
+static enum drbd_ret_code drbd_check_name_str(const char *name, const bool strict)
 {
-	const char *name = adm_ctx->resource_name;
-	if (!name || !name[0]) {
-		drbd_msg_put_info(adm_ctx->reply_skb, "resource name missing");
+	unsigned char c;
+	if (name == NULL || name[0] == 0)
 		return ERR_MANDATORY_TAG;
-	}
-	/* if we want to use these in sysfs/configfs/debugfs some day,
-	 * we must not allow slashes */
-	if (strchr(name, '/')) {
-		drbd_msg_put_info(adm_ctx->reply_skb, "invalid resource name");
+
+	/* Tools reserve the literal "all" to mean what you would expect. */
+	/* If we want to get really paranoid,
+	 * we could add a number of "reserved" names,
+	 * like the *_state_names defined in drbd_strings.c */
+	if (memcmp("all", name, 4) == 0)
 		return ERR_INVALID_REQUEST;
+
+	while ((c = *name++)) {
+		if (c == '/' || c <= ' ' || c == '\x7f')
+			return ERR_INVALID_REQUEST;
+		if (strict) {
+			switch (c) {
+			case '0' ... '9':
+			case 'A' ... 'Z':
+			case 'a' ... 'z':
+				/* if you change this, also change "strict_pattern" below */
+			case '+': case '-': case '.': case '_':
+				break;
+			default:
+				return ERR_INVALID_REQUEST;
+			}
+		}
 	}
 	return NO_ERROR;
 }
 
+int param_set_drbd_strict_names(const char *val, const struct kernel_param *kp)
+{
+	int err = 0;
+	bool new_value;
+	bool orig_value = *(bool *)kp->arg;
+	struct kernel_param dummy_kp = *kp;
+
+	dummy_kp.arg = &new_value;
+
+	err = param_set_bool(val, &dummy_kp);
+	if (err || new_value == orig_value)
+		return err;
+
+	if (new_value) {
+		struct drbd_resource *resource;
+		struct drbd_connection *connection;
+		int non_strict_cnt = 0;
+
+		/* If we transition from "not enforced" to "enforcing strict names",
+		 * we complain about all "non-strict names" that still exist,
+		 * but intentionally still enable the enforcing.
+		 *
+		 * That way we can prevent new "non-strict" from being created,
+		 * while allowing us to clean up the existing ones at some
+		 * "convenient time" later.
+		 */
+		rcu_read_lock();
+		for_each_resource_rcu(resource, &drbd_resources) {
+			for_each_connection_rcu(connection, resource) {
+				char *name = connection->transport.net_conf->name;
+				if (drbd_check_name_str(name, true) == NO_ERROR)
+					continue;
+				drbd_info(connection, "non-strict name still in use\n");
+				++non_strict_cnt;
+			}
+			if (drbd_check_name_str(resource->name, true) == NO_ERROR)
+				continue;
+			drbd_info(resource, "non-strict name still in use\n");
+			++non_strict_cnt;
+		}
+		rcu_read_unlock();
+		if (non_strict_cnt)
+			pr_notice("%u non-strict names still in use\n", non_strict_cnt);
+	}
+	if (!err) {
+		*(bool *)kp->arg = new_value;
+		pr_info("%s strict name checks\n", new_value ? "enabled" : "disabled");
+	}
+	return err;
+}
+
+static void drbd_msg_put_name_error(struct sk_buff *reply_skb, enum drbd_ret_code ret_code)
+{
+	char *strict_pattern = " (strict_names=1 allows only [0-9A-Za-z+._-])";
+	char *non_strict_pat = " (disallowed: ascii control, space, slash)";
+	if (ret_code == NO_ERROR)
+		return;
+	if (ret_code == ERR_INVALID_REQUEST) {
+		drbd_msg_sprintf_info(reply_skb, "invalid name%s",
+			drbd_strict_names ? strict_pattern : non_strict_pat);
+	} else if (ret_code == ERR_MANDATORY_TAG) {
+		drbd_msg_put_info(reply_skb, "name missing");
+	} else if (ret_code == ERR_ALREADY_EXISTS) {
+		drbd_msg_put_info(reply_skb, "name already exists");
+	} else {
+		drbd_msg_put_info(reply_skb, "unhandled error in drbd_check_name_str");
+	}
+}
+
+static enum drbd_ret_code drbd_check_resource_name(struct drbd_config_context *const adm_ctx)
+{
+	enum drbd_ret_code ret_code = drbd_check_name_str(adm_ctx->resource_name, drbd_strict_names);
+	drbd_msg_put_name_error(adm_ctx->reply_skb, ret_code);
+	return ret_code;
+}
+
 static void resource_to_info(struct resource_info *info,
 			     struct drbd_resource *resource)
 {
-	info->res_role = conn_highest_role(first_connection(resource));
-	info->res_susp = resource->susp;
-	info->res_susp_nod = resource->susp_nod;
-	info->res_susp_fen = resource->susp_fen;
+	info->res_role = resource->role[NOW];
+	info->res_susp = resource->susp_user[NOW];
+	info->res_susp_nod = resource->susp_nod[NOW];
+	info->res_susp_fen = is_suspended_fen(resource, NOW);
+	info->res_susp_quorum = resource->susp_quorum[NOW];
+	info->res_fail_io = resource->fail_io[NOW];
 }
 
-int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_connection *connection;
 	struct drbd_config_context adm_ctx;
+	struct drbd_resource *resource;
 	enum drbd_ret_code retcode;
 	struct res_opts res_opts;
 	int err;
 
+	mutex_lock(&resources_mutex);
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, 0);
-	if (!adm_ctx.reply_skb)
+	if (!adm_ctx.reply_skb) {
+		mutex_unlock(&resources_mutex);
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
+	}
 
 	set_res_opts_defaults(&res_opts);
+	res_opts.node_id = -1;
 	err = res_opts_from_attrs(&res_opts, info);
-	if (err && err != -ENOMSG) {
+	if (err) {
 		retcode = ERR_MANDATORY_TAG;
 		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
 		goto out;
 	}
 
+	/* ERR_ALREADY_EXISTS? */
+	if (adm_ctx.resource)
+		goto out;
+
 	retcode = drbd_check_resource_name(&adm_ctx);
 	if (retcode != NO_ERROR)
 		goto out;
 
-	if (adm_ctx.resource) {
-		if (info->nlhdr->nlmsg_flags & NLM_F_EXCL) {
-			retcode = ERR_INVALID_REQUEST;
-			drbd_msg_put_info(adm_ctx.reply_skb, "resource exists");
-		}
-		/* else: still NO_ERROR */
+	if (res_opts.explicit_drbd8_compat)
+		res_opts.drbd8_compat_mode = true;
+
+	if (res_opts.drbd8_compat_mode) {
+#ifdef CONFIG_DRBD_COMPAT_84
+		pr_info("drbd: running in DRBD 8 compatibility mode.\n");
+		/*
+		 * That means we ignore the value of node_id for now. That
+		 * will be set to an actual value when the resource is
+		 * connected later.
+		 */
+		atomic_inc(&nr_drbd8_devices);
+		res_opts.auto_promote = false;
+#else
+		drbd_msg_put_info(adm_ctx.reply_skb, "CONFIG_DRBD_COMPAT_84 not enabled");
+		goto out;
+#endif
+	} else if (res_opts.node_id >= DRBD_NODE_ID_MAX) {
+		pr_err("drbd: invalid node id (%d)\n", res_opts.node_id);
+		retcode = ERR_INVALID_REQUEST;
 		goto out;
 	}
 
-	/* not yet safe for genl_family.parallel_ops */
-	mutex_lock(&resources_mutex);
-	connection = conn_create(adm_ctx.resource_name, &res_opts);
+	if (!try_module_get(THIS_MODULE)) {
+		pr_err("drbd: Could not get a module reference\n");
+		retcode = ERR_INVALID_REQUEST;
+		goto out;
+	}
+
+	resource = drbd_create_resource(adm_ctx.resource_name, &res_opts);
 	mutex_unlock(&resources_mutex);
 
-	if (connection) {
+	if (resource) {
 		struct resource_info resource_info;
 
 		mutex_lock(&notification_mutex);
-		resource_to_info(&resource_info, connection->resource);
-		notify_resource_state(NULL, 0, connection->resource,
-				      &resource_info, NOTIFY_CREATE);
+		resource_to_info(&resource_info, resource);
+		notify_resource_state(NULL, 0, resource, &resource_info, NULL, NOTIFY_CREATE);
 		mutex_unlock(&notification_mutex);
-	} else
+	} else {
+		module_put(THIS_MODULE);
 		retcode = ERR_NOMEM;
-
+	}
+	goto out_no_unlock;
 out:
+	mutex_unlock(&resources_mutex);
+out_no_unlock:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-static void device_to_info(struct device_info *info,
-			   struct drbd_device *device)
-{
-	info->dev_disk_state = device->state.disk;
-}
-
-
-int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	struct drbd_genlmsghdr *dh = genl_info_userhdr(info);
+	struct device_conf device_conf;
+	struct drbd_resource *resource;
+	struct drbd_device *device;
 	enum drbd_ret_code retcode;
+	int err;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
+
+	set_device_conf_defaults(&device_conf);
+	err = device_conf_from_attrs(&device_conf, info);
+	if (err && err != -ENOMSG) {
+		retcode = ERR_MANDATORY_TAG;
+		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
 		goto out;
+	}
 
 	if (dh->minor > MINORMASK) {
 		drbd_msg_put_info(adm_ctx.reply_skb, "requested minor out of range");
@@ -4306,31 +7168,43 @@ int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 		retcode = ERR_INVALID_REQUEST;
 		goto out;
 	}
-
-	/* drbd_adm_prepare made sure already
-	 * that first_peer_device(device)->connection and device->vnr match the request. */
-	if (adm_ctx.device) {
-		if (info->nlhdr->nlmsg_flags & NLM_F_EXCL)
-			retcode = ERR_MINOR_OR_VOLUME_EXISTS;
-		/* else: still NO_ERROR */
+	if (device_conf.block_size != 512 && device_conf.block_size != 1024 &&
+	    device_conf.block_size != 2048 && device_conf.block_size != 4096) {
+		drbd_msg_put_info(adm_ctx.reply_skb, "block_size not 512, 1024, 2048, or 4096");
+		retcode = ERR_INVALID_REQUEST;
+		goto out;
+	}
+	if (device_conf.discard_granularity != DRBD_DISCARD_GRANULARITY_DEF &&
+	    device_conf.discard_granularity != 0 &&
+	    device_conf.discard_granularity % device_conf.block_size != 0) {
+		drbd_msg_put_info(adm_ctx.reply_skb,
+			"discard_granularity must be 0 or a multiple of block_size");
+		retcode = ERR_INVALID_REQUEST;
 		goto out;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = drbd_create_device(&adm_ctx, dh->minor);
+	if (adm_ctx.device)
+		goto out;
+
+	resource = adm_ctx.resource;
+	mutex_lock(&resource->conf_update);
+	for (;;) {
+		retcode = drbd_create_device(&adm_ctx, dh->minor, &device_conf, &device);
+		if (retcode != ERR_NOMEM ||
+		    schedule_timeout_interruptible(HZ / 10))
+			break;
+		/* Keep retrying until the memory allocations eventually succeed. */
+	}
 	if (retcode == NO_ERROR) {
-		struct drbd_device *device;
 		struct drbd_peer_device *peer_device;
 		struct device_info info;
 		unsigned int peer_devices = 0;
 		enum drbd_notification_type flags;
 
-		device = minor_to_device(dh->minor);
-		for_each_peer_device(peer_device, device) {
-			if (!has_net_conf(peer_device->connection))
-				continue;
+		drbd_reconsider_queue_parameters(device, NULL);
+
+		for_each_peer_device(peer_device, device)
 			peer_devices++;
-		}
 
 		device_to_info(&info, device);
 		mutex_lock(&notification_mutex);
@@ -4339,8 +7213,6 @@ int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 		for_each_peer_device(peer_device, device) {
 			struct peer_device_info peer_device_info;
 
-			if (!has_net_conf(peer_device->connection))
-				continue;
 			peer_device_to_info(&peer_device_info, peer_device);
 			flags = (peer_devices--) ? NOTIFY_CONTINUES : 0;
 			notify_peer_device_state(NULL, 0, peer_device, &peer_device_info,
@@ -4348,7 +7220,7 @@ int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 		}
 		mutex_unlock(&notification_mutex);
 	}
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&resource->conf_update);
 out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
@@ -4356,42 +7228,51 @@ int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 
 static enum drbd_ret_code adm_del_minor(struct drbd_device *device)
 {
+	struct drbd_resource *resource = device->resource;
 	struct drbd_peer_device *peer_device;
+	enum drbd_ret_code ret;
+	u64 im;
+
+	read_lock_irq(&resource->state_rwlock);
+	if (device->disk_state[NOW] == D_DISKLESS)
+		ret = test_and_set_bit(UNREGISTERED, &device->flags) ? ERR_MINOR_INVALID : NO_ERROR;
+	else
+		ret = ERR_MINOR_CONFIGURED;
+	read_unlock_irq(&resource->state_rwlock);
+
+	if (ret != NO_ERROR)
+		return ret;
 
-	if (device->state.disk == D_DISKLESS &&
-	    /* no need to be device->state.conn == C_STANDALONE &&
-	     * we may want to delete a minor from a live replication group.
-	     */
-	    device->state.role == R_SECONDARY) {
-		struct drbd_connection *connection =
-			first_connection(device->resource);
+	for_each_peer_device_ref(peer_device, im, device)
+		stable_change_repl_state(peer_device, L_OFF,
+					 CS_VERBOSE | CS_WAIT_COMPLETE, "del-minor");
+
+	/* If drbd_ldev_destroy() is pending, wait for it to run before
+	 * unregistering the device. */
+	wait_event(device->misc_wait, !test_bit(GOING_DISKLESS, &device->flags));
+	/*
+	 * Flush the resource work queue to make sure that no more events like
+	 * state change notifications for this device are queued: we want the
+	 * "destroy" event to come last.
+	 */
+	drbd_flush_workqueue(&resource->work);
 
-		_drbd_request_state(device, NS(conn, C_WF_REPORT_PARAMS),
-				    CS_VERBOSE + CS_WAIT_COMPLETE);
+	drbd_unregister_device(device);
 
-		/* If the state engine hasn't stopped the sender thread yet, we
-		 * need to flush the sender work queue before generating the
-		 * DESTROY events here. */
-		if (get_t_state(&connection->worker) == RUNNING)
-			drbd_flush_workqueue(&connection->sender_work);
+	mutex_lock(&notification_mutex);
+	for_each_peer_device_ref(peer_device, im, device)
+		notify_peer_device_state(NULL, 0, peer_device, NULL,
+					 NOTIFY_DESTROY | NOTIFY_CONTINUES);
+	notify_device_state(NULL, 0, device, NULL, NOTIFY_DESTROY);
+	mutex_unlock(&notification_mutex);
 
-		mutex_lock(&notification_mutex);
-		for_each_peer_device(peer_device, device) {
-			if (!has_net_conf(peer_device->connection))
-				continue;
-			notify_peer_device_state(NULL, 0, peer_device, NULL,
-						 NOTIFY_DESTROY | NOTIFY_CONTINUES);
-		}
-		notify_device_state(NULL, 0, device, NULL, NOTIFY_DESTROY);
-		mutex_unlock(&notification_mutex);
+	if (device->open_cnt == 0 && !test_and_set_bit(DESTROYING_DEV, &device->flags))
+		call_rcu(&device->rcu, drbd_reclaim_device);
 
-		drbd_delete_device(device);
-		return NO_ERROR;
-	} else
-		return ERR_MINOR_CONFIGURED;
+	return ret;
 }
 
-int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	enum drbd_ret_code retcode;
@@ -4399,168 +7280,159 @@ int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info)
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto out;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = adm_del_minor(adm_ctx.device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-out:
+	if (mutex_lock_interruptible(&adm_ctx.resource->adm_mutex)) {
+		retcode = ERR_INTR;
+	} else {
+		retcode = adm_del_minor(adm_ctx.device);
+		mutex_unlock(&adm_ctx.resource->adm_mutex);
+	}
+
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
 static int adm_del_resource(struct drbd_resource *resource)
 {
-	struct drbd_connection *connection;
+	int err;
 
-	for_each_connection(connection, resource) {
-		if (connection->cstate > C_STANDALONE)
-			return ERR_NET_CONFIGURED;
-	}
+	/*
+	 * Flush the resource work queue to make sure that no more events like
+	 * state change notifications are queued: we want the "destroy" event
+	 * to come last.
+	 */
+	drbd_flush_workqueue(&resource->work);
+
+	mutex_lock(&resources_mutex);
+	err = ERR_RES_NOT_KNOWN;
+	if (test_bit(R_UNREGISTERED, &resource->flags))
+		goto out;
+	err = ERR_NET_CONFIGURED;
+	if (!list_empty(&resource->connections))
+		goto out;
+	err = ERR_RES_IN_USE;
 	if (!idr_is_empty(&resource->devices))
-		return ERR_RES_IN_USE;
+		goto out;
+
+	set_bit(R_UNREGISTERED, &resource->flags);
+	list_del_rcu(&resource->resources);
+	drbd_debugfs_resource_cleanup(resource);
+	mutex_unlock(&resources_mutex);
+
+	if (cancel_work_sync(&resource->empty_twopc)) {
+		kref_put(&resource->kref, drbd_destroy_resource);
+	}
+	timer_shutdown_sync(&resource->twopc_timer);
+	timer_shutdown_sync(&resource->peer_ack_timer);
+	call_rcu(&resource->rcu, drbd_reclaim_resource);
 
-	/* The state engine has stopped the sender thread, so we don't
-	 * need to flush the sender work queue before generating the
-	 * DESTROY event here. */
 	mutex_lock(&notification_mutex);
-	notify_resource_state(NULL, 0, resource, NULL, NOTIFY_DESTROY);
+	notify_resource_state(NULL, 0, resource, NULL, NULL, NOTIFY_DESTROY);
 	mutex_unlock(&notification_mutex);
 
-	mutex_lock(&resources_mutex);
-	list_del_rcu(&resource->resources);
-	mutex_unlock(&resources_mutex);
-	/* Make sure all threads have actually stopped: state handling only
-	 * does drbd_thread_stop_nowait(). */
-	list_for_each_entry(connection, &resource->connections, connections)
-		drbd_thread_stop(&connection->worker);
-	synchronize_rcu();
-	drbd_free_resource(resource);
+	/* When the last resource was removed do an explicit synchronize RCU.
+	   Without this a immediately following rmmod would fail, since the
+	   resource's worker thread still has a reference count to the module. */
+	if (list_empty(&drbd_resources))
+		synchronize_rcu();
 	return NO_ERROR;
+out:
+	mutex_unlock(&resources_mutex);
+	return err;
 }
 
-int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
 	struct drbd_resource *resource;
 	struct drbd_connection *connection;
 	struct drbd_device *device;
 	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
-	unsigned i;
+	enum drbd_ret_code ret;
+	int i;
+	u64 im;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info,
+			DRBD_ADM_NEED_RESOURCE | DRBD_ADM_IGNORE_VERSION);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto finish;
 
 	resource = adm_ctx.resource;
-	mutex_lock(&resource->adm_mutex);
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
+	set_bit(DOWN_IN_PROGRESS, &resource->flags);
 	/* demote */
-	for_each_connection(connection, resource) {
-		struct drbd_peer_device *peer_device;
-
-		idr_for_each_entry(&connection->peer_devices, peer_device, i) {
-			retcode = drbd_set_role(peer_device->device, R_SECONDARY, 0);
-			if (retcode < SS_SUCCESS) {
-				drbd_msg_put_info(adm_ctx.reply_skb, "failed to demote");
-				goto out;
-			}
-		}
+	retcode = drbd_set_role(resource, R_SECONDARY, false, "down", adm_ctx.reply_skb);
+	if (retcode < SS_SUCCESS) {
+		drbd_msg_put_info(adm_ctx.reply_skb, "failed to demote");
+		goto out;
+	}
 
-		retcode = conn_try_disconnect(connection, 0);
-		if (retcode < SS_SUCCESS) {
-			drbd_msg_put_info(adm_ctx.reply_skb, "failed to disconnect");
+	for_each_connection_ref(connection, im, resource) {
+		retcode = SS_SUCCESS;
+		if (connection->cstate[NOW] > C_STANDALONE)
+			retcode = conn_try_disconnect(connection, 0, "down", adm_ctx.reply_skb);
+		if (retcode >= SS_SUCCESS) {
+			del_connection(connection, "down");
+		} else {
+			kref_put(&connection->kref, drbd_destroy_connection);
 			goto out;
 		}
 	}
 
-	/* detach */
+	/* detach and delete minor */
+	rcu_read_lock();
 	idr_for_each_entry(&resource->devices, device, i) {
-		retcode = adm_detach(device, 0);
+		kref_get(&device->kref);
+		rcu_read_unlock();
+		retcode = adm_detach(device, 0, 0, "down", adm_ctx.reply_skb);
+		mutex_lock(&resource->conf_update);
+		ret = adm_del_minor(device);
+		mutex_unlock(&resource->conf_update);
+		kref_put(&device->kref, drbd_destroy_device);
 		if (retcode < SS_SUCCESS || retcode > NO_ERROR) {
 			drbd_msg_put_info(adm_ctx.reply_skb, "failed to detach");
 			goto out;
 		}
-	}
-
-	/* delete volumes */
-	idr_for_each_entry(&resource->devices, device, i) {
-		retcode = adm_del_minor(device);
-		if (retcode != NO_ERROR) {
+		if (ret != NO_ERROR) {
 			/* "can not happen" */
 			drbd_msg_put_info(adm_ctx.reply_skb, "failed to delete volume");
 			goto out;
 		}
+		rcu_read_lock();
 	}
+	rcu_read_unlock();
 
+	mutex_lock(&resource->conf_update);
 	retcode = adm_del_resource(resource);
+	/* holding a reference to resource in adm_crx until drbd_adm_finish() */
+	mutex_unlock(&resource->conf_update);
 out:
+	opener_info(adm_ctx.resource, adm_ctx.reply_skb, (enum drbd_state_rv)retcode);
+	clear_bit(DOWN_IN_PROGRESS, &resource->flags);
 	mutex_unlock(&resource->adm_mutex);
-finish:
+out_no_adm_mutex:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-int drbd_adm_del_resource(struct sk_buff *skb, struct genl_info *info)
+static int drbd_adm_del_resource(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_config_context adm_ctx;
-	struct drbd_resource *resource;
 	enum drbd_ret_code retcode;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
 	if (!adm_ctx.reply_skb)
 		return retcode;
-	if (retcode != NO_ERROR)
-		goto finish;
-	resource = adm_ctx.resource;
 
-	mutex_lock(&resource->adm_mutex);
-	retcode = adm_del_resource(resource);
-	mutex_unlock(&resource->adm_mutex);
-finish:
+	retcode = adm_del_resource(adm_ctx.resource);
+
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
 }
 
-void drbd_bcast_event(struct drbd_device *device, const struct sib_info *sib)
-{
-	struct sk_buff *msg;
-	struct drbd_genlmsghdr *d_out;
-	unsigned seq;
-	int err = -ENOMEM;
-
-	seq = atomic_inc_return(&drbd_genl_seq);
-	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_NOIO);
-	if (!msg)
-		goto failed;
-
-	err = -EMSGSIZE;
-	d_out = genlmsg_put(msg, 0, seq, &drbd_genl_family, 0, DRBD_EVENT);
-	if (!d_out) /* cannot happen, but anyways. */
-		goto nla_put_failure;
-	d_out->minor = device_to_minor(device);
-	d_out->ret_code = NO_ERROR;
-
-	if (nla_put_status_info(msg, device, sib))
-		goto nla_put_failure;
-	genlmsg_end(msg, d_out);
-	err = drbd_genl_multicast_events(msg, GFP_NOWAIT);
-	/* msg has been consumed or freed in netlink_broadcast() */
-	if (err && err != -ESRCH)
-		goto failed;
-
-	return;
-
-nla_put_failure:
-	nlmsg_free(msg);
-failed:
-	drbd_err(device, "Error %d while broadcasting event. "
-			"Event seq:%u sib_reason:%u\n",
-			err, seq, sib->sib_reason);
-}
-
 static int nla_put_notification_header(struct sk_buff *msg,
 				       enum drbd_notification_type type)
 {
@@ -4575,6 +7447,7 @@ int notify_resource_state(struct sk_buff *skb,
 			   unsigned int seq,
 			   struct drbd_resource *resource,
 			   struct resource_info *resource_info,
+			   struct rename_resource_info *rename_resource_info,
 			   enum drbd_notification_type type)
 {
 	struct resource_statistics resource_statistics;
@@ -4583,7 +7456,7 @@ int notify_resource_state(struct sk_buff *skb,
 	int err;
 
 	if (!skb) {
-		seq = atomic_inc_return(&notify_genl_seq);
+		seq = atomic_inc_return(&drbd_genl_seq);
 		skb = genlmsg_new(NLMSG_GOODSIZE, GFP_NOIO);
 		err = -ENOMEM;
 		if (!skb)
@@ -4597,18 +7470,29 @@ int notify_resource_state(struct sk_buff *skb,
 		goto nla_put_failure;
 	dh->minor = -1U;
 	dh->ret_code = NO_ERROR;
-	if (nla_put_drbd_cfg_context(skb, resource, NULL, NULL) ||
-	    nla_put_notification_header(skb, type) ||
-	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
-	     resource_info_to_skb(skb, resource_info, true)))
+	if (nla_put_drbd_cfg_context(skb, resource, NULL, NULL, NULL) ||
+	    nla_put_notification_header(skb, type))
 		goto nla_put_failure;
+
+	if (resource_info) {
+		err = resource_info_to_skb(skb, resource_info, true);
+		if (err)
+			goto nla_put_failure;
+	}
+
 	resource_statistics.res_stat_write_ordering = resource->write_ordering;
 	err = resource_statistics_to_skb(skb, &resource_statistics, !capable(CAP_SYS_ADMIN));
 	if (err)
 		goto nla_put_failure;
+
+	if (rename_resource_info) {
+		err = rename_resource_info_to_skb(skb, rename_resource_info, !capable(CAP_SYS_ADMIN));
+		if (err)
+			goto nla_put_failure;
+	}
 	genlmsg_end(skb, dh);
 	if (multicast) {
-		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
+		err = drbd_genl_multicast_events(skb);
 		/* skb has been consumed or freed in netlink_broadcast() */
 		if (err && err != -ESRCH)
 			goto failed;
@@ -4635,7 +7519,7 @@ int notify_device_state(struct sk_buff *skb,
 	int err;
 
 	if (!skb) {
-		seq = atomic_inc_return(&notify_genl_seq);
+		seq = atomic_inc_return(&drbd_genl_seq);
 		skb = genlmsg_new(NLMSG_GOODSIZE, GFP_NOIO);
 		err = -ENOMEM;
 		if (!skb)
@@ -4649,7 +7533,7 @@ int notify_device_state(struct sk_buff *skb,
 		goto nla_put_failure;
 	dh->minor = device->minor;
 	dh->ret_code = NO_ERROR;
-	if (nla_put_drbd_cfg_context(skb, device->resource, NULL, device) ||
+	if (nla_put_drbd_cfg_context(skb, device->resource, NULL, device, NULL) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
 	     device_info_to_skb(skb, device_info, true)))
@@ -4658,7 +7542,7 @@ int notify_device_state(struct sk_buff *skb,
 	device_statistics_to_skb(skb, &device_statistics, !capable(CAP_SYS_ADMIN));
 	genlmsg_end(skb, dh);
 	if (multicast) {
-		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
+		err = drbd_genl_multicast_events(skb);
 		/* skb has been consumed or freed in netlink_broadcast() */
 		if (err && err != -ESRCH)
 			goto failed;
@@ -4673,6 +7557,7 @@ int notify_device_state(struct sk_buff *skb,
 	return err;
 }
 
+/* open coded path_parms_to_skb() iterating of the list */
 int notify_connection_state(struct sk_buff *skb,
 			     unsigned int seq,
 			     struct drbd_connection *connection,
@@ -4685,7 +7570,7 @@ int notify_connection_state(struct sk_buff *skb,
 	int err;
 
 	if (!skb) {
-		seq = atomic_inc_return(&notify_genl_seq);
+		seq = atomic_inc_return(&drbd_genl_seq);
 		skb = genlmsg_new(NLMSG_GOODSIZE, GFP_NOIO);
 		err = -ENOMEM;
 		if (!skb)
@@ -4699,16 +7584,17 @@ int notify_connection_state(struct sk_buff *skb,
 		goto nla_put_failure;
 	dh->minor = -1U;
 	dh->ret_code = NO_ERROR;
-	if (nla_put_drbd_cfg_context(skb, connection->resource, connection, NULL) ||
+	if (nla_put_drbd_cfg_context(skb, connection->resource, connection, NULL, NULL) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
 	     connection_info_to_skb(skb, connection_info, true)))
 		goto nla_put_failure;
-	connection_statistics.conn_congested = test_bit(NET_CONGESTED, &connection->flags);
+	connection_paths_to_skb(skb, connection);
+	connection_to_statistics(&connection_statistics, connection);
 	connection_statistics_to_skb(skb, &connection_statistics, !capable(CAP_SYS_ADMIN));
 	genlmsg_end(skb, dh);
 	if (multicast) {
-		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
+		err = drbd_genl_multicast_events(skb);
 		/* skb has been consumed or freed in netlink_broadcast() */
 		if (err && err != -ESRCH)
 			goto failed;
@@ -4736,7 +7622,7 @@ int notify_peer_device_state(struct sk_buff *skb,
 	int err;
 
 	if (!skb) {
-		seq = atomic_inc_return(&notify_genl_seq);
+		seq = atomic_inc_return(&drbd_genl_seq);
 		skb = genlmsg_new(NLMSG_GOODSIZE, GFP_NOIO);
 		err = -ENOMEM;
 		if (!skb)
@@ -4750,7 +7636,7 @@ int notify_peer_device_state(struct sk_buff *skb,
 		goto nla_put_failure;
 	dh->minor = -1U;
 	dh->ret_code = NO_ERROR;
-	if (nla_put_drbd_cfg_context(skb, resource, peer_device->connection, peer_device->device) ||
+	if (nla_put_drbd_cfg_context(skb, resource, peer_device->connection, peer_device->device, NULL) ||
 	    nla_put_notification_header(skb, type) ||
 	    ((type & ~NOTIFY_FLAGS) != NOTIFY_DESTROY &&
 	     peer_device_info_to_skb(skb, peer_device_info, true)))
@@ -4759,7 +7645,7 @@ int notify_peer_device_state(struct sk_buff *skb,
 	peer_device_statistics_to_skb(skb, &peer_device_statistics, !capable(CAP_SYS_ADMIN));
 	genlmsg_end(skb, dh);
 	if (multicast) {
-		err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
+		err = drbd_genl_multicast_events(skb);
 		/* skb has been consumed or freed in netlink_broadcast() */
 		if (err && err != -ESRCH)
 			goto failed;
@@ -4774,13 +7660,86 @@ int notify_peer_device_state(struct sk_buff *skb,
 	return err;
 }
 
+void drbd_broadcast_peer_device_state(struct drbd_peer_device *peer_device)
+{
+	struct peer_device_info peer_device_info;
+	mutex_lock(&notification_mutex);
+	peer_device_to_info(&peer_device_info, peer_device);
+	notify_peer_device_state(NULL, 0, peer_device, &peer_device_info, NOTIFY_CHANGE);
+	mutex_unlock(&notification_mutex);
+}
+
+static int notify_path_state(struct sk_buff *skb,
+		       unsigned int seq,
+		       /* until we have a backpointer in drbd_path, we need an explicit connection: */
+		       struct drbd_connection *connection,
+		       struct drbd_path *path,
+		       struct drbd_path_info *path_info,
+		       enum drbd_notification_type type)
+{
+	struct drbd_resource *resource = connection->resource;
+	struct drbd_genlmsghdr *dh;
+	bool multicast = false;
+	int err;
+
+	if (!skb) {
+		seq = atomic_inc_return(&drbd_genl_seq);
+		skb = genlmsg_new(NLMSG_GOODSIZE, GFP_NOIO);
+		err = -ENOMEM;
+		if (!skb)
+			goto failed;
+		multicast = true;
+	}
+
+	err = -EMSGSIZE;
+	dh = genlmsg_put(skb, 0, seq, &drbd_genl_family, 0, DRBD_PATH_STATE);
+	if (!dh)
+		goto nla_put_failure;
+
+	dh->minor = -1U;
+	dh->ret_code = NO_ERROR;
+	if (nla_put_drbd_cfg_context(skb, resource, connection, NULL, path) ||
+	    nla_put_notification_header(skb, type) ||
+	    drbd_path_info_to_skb(skb, path_info, true))
+		goto nla_put_failure;
+	genlmsg_end(skb, dh);
+	if (multicast) {
+		err = drbd_genl_multicast_events(skb);
+		/* skb has been consumed or freed in netlink_broadcast() */
+		if (err && err != -ESRCH)
+			goto failed;
+	}
+	return 0;
+
+nla_put_failure:
+	nlmsg_free(skb);
+failed:
+	/* FIXME add path specifics to our drbd_polymorph_printk.h */
+	drbd_err(connection, "path: Error %d while broadcasting event. Event seq:%u\n",
+		 err, seq);
+	return err;
+}
+
+int notify_path(struct drbd_connection *connection, struct drbd_path *path, enum drbd_notification_type type)
+{
+	struct drbd_path_info path_info;
+	int err;
+
+	path_info.path_established = test_bit(TR_ESTABLISHED, &path->flags);
+	mutex_lock(&notification_mutex);
+	err = notify_path_state(NULL, 0, connection, path, &path_info, type);
+	mutex_unlock(&notification_mutex);
+	return err;
+
+}
+
 void notify_helper(enum drbd_notification_type type,
 		   struct drbd_device *device, struct drbd_connection *connection,
 		   const char *name, int status)
 {
 	struct drbd_resource *resource = device ? device->resource : connection->resource;
 	struct drbd_helper_info helper_info;
-	unsigned int seq = atomic_inc_return(&notify_genl_seq);
+	unsigned int seq = atomic_inc_return(&drbd_genl_seq);
 	struct sk_buff *skb = NULL;
 	struct drbd_genlmsghdr *dh;
 	int err;
@@ -4801,12 +7760,12 @@ void notify_helper(enum drbd_notification_type type,
 	dh->minor = device ? device->minor : -1;
 	dh->ret_code = NO_ERROR;
 	mutex_lock(&notification_mutex);
-	if (nla_put_drbd_cfg_context(skb, resource, connection, device) ||
+	if (nla_put_drbd_cfg_context(skb, resource, connection, device, NULL) ||
 	    nla_put_notification_header(skb, type) ||
 	    drbd_helper_info_to_skb(skb, &helper_info, true))
 		goto unlock_fail;
 	genlmsg_end(skb, dh);
-	err = drbd_genl_multicast_events(skb, GFP_NOWAIT);
+	err = drbd_genl_multicast_events(skb);
 	skb = NULL;
 	/* skb has been consumed or freed in netlink_broadcast() */
 	if (err && err != -ESRCH)
@@ -4859,7 +7818,8 @@ static unsigned int notifications_for_state_change(struct drbd_state_change *sta
 	return 1 +
 	       state_change->n_connections +
 	       state_change->n_devices +
-	       state_change->n_devices * state_change->n_connections;
+	       state_change->n_devices * state_change->n_connections +
+	       state_change->n_paths;
 }
 
 static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
@@ -4871,7 +7831,7 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	int err = 0;
 
 	/* There is no need for taking notification_mutex here: it doesn't
-	   matter if the initial state events mix with later state chage
+	   matter if the initial state events mix with later state change
 	   events; we can always tell the events apart by the NOTIFY_EXISTS
 	   flag. */
 
@@ -4884,7 +7844,7 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	if (cb->args[4] < cb->args[3])
 		flags |= NOTIFY_CONTINUES;
 	if (n < 1) {
-		err = notify_resource_state_change(skb, seq, state_change->resource,
+		err = notify_resource_state_change(skb, seq, state_change,
 					     NOTIFY_EXISTS | flags);
 		goto next;
 	}
@@ -4895,6 +7855,18 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 		goto next;
 	}
 	n -= state_change->n_connections;
+	if (n < state_change->n_paths) {
+		struct drbd_path_state *path_state = &state_change->paths[n];
+		struct drbd_path_info path_info;
+
+		path_info.path_established = path_state->path_established;
+		err = notify_path_state(skb, seq,
+				path_state->connection,
+				path_state->path,
+				&path_info, NOTIFY_EXISTS | flags);
+		goto next;
+	}
+	n -= state_change->n_paths;
 	if (n < state_change->n_devices) {
 		err = notify_device_state_change(skb, seq, &state_change->devices[n],
 					   NOTIFY_EXISTS | flags);
@@ -4906,6 +7878,7 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 						NOTIFY_EXISTS | flags);
 		goto next;
 	}
+	n -= state_change->n_devices * state_change->n_connections;
 
 next:
 	if (cb->args[4] == cb->args[3]) {
@@ -4919,11 +7892,25 @@ static int get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 out:
 	if (err)
 		return err;
-	else
-		return skb->len;
+	return skb->len;
+}
+
+static int drbd_adm_get_initial_state_done(struct netlink_callback *cb)
+{
+	LIST_HEAD(head);
+	if (cb->args[0]) {
+		struct drbd_state_change *state_change =
+			(struct drbd_state_change *)cb->args[0];
+		cb->args[0] = 0;
+
+		/* connect list to head */
+		list_add(&head, &state_change->list);
+		free_state_changes(&head);
+	}
+	return 0;
 }
 
-int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
+static int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct drbd_resource *resource;
 	LIST_HEAD(head);
@@ -4931,14 +7918,6 @@ int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	if (cb->args[5] >= 1) {
 		if (cb->args[5] > 1)
 			return get_initial_state(skb, cb);
-		if (cb->args[0]) {
-			struct drbd_state_change *state_change =
-				(struct drbd_state_change *)cb->args[0];
-
-			/* connect list to head */
-			list_add(&head, &state_change->list);
-			free_state_changes(&head);
-		}
 		return 0;
 	}
 
@@ -4947,7 +7926,9 @@ int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	for_each_resource(resource, &drbd_resources) {
 		struct drbd_state_change *state_change;
 
-		state_change = remember_old_state(resource, GFP_KERNEL);
+		read_lock_irq(&resource->state_rwlock);
+		state_change = remember_state_change(resource, GFP_ATOMIC);
+		read_unlock_irq(&resource->state_rwlock);
 		if (!state_change) {
 			if (!list_empty(&head))
 				free_state_changes(&head);
@@ -4971,3 +7952,144 @@ int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 	cb->args[2] = cb->nlh->nlmsg_seq;
 	return get_initial_state(skb, cb);
 }
+
+static int drbd_adm_forget_peer(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	struct drbd_resource *resource;
+	struct drbd_device *device;
+	struct forget_peer_parms parms = { };
+	enum drbd_ret_code retcode;
+	int vnr, peer_node_id, err;
+
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
+	if (!adm_ctx.reply_skb)
+		return retcode;
+
+	resource = adm_ctx.resource;
+
+	err = forget_peer_parms_from_attrs(&parms, info);
+	if (err) {
+		retcode = ERR_MANDATORY_TAG;
+		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		goto out_no_adm_mutex;
+	}
+
+	if (mutex_lock_interruptible(&resource->adm_mutex)) {
+		retcode = ERR_INTR;
+		goto out_no_adm_mutex;
+	}
+
+	peer_node_id = parms.forget_peer_node_id;
+	if (drbd_connection_by_node_id(resource, peer_node_id)) {
+		retcode = ERR_NET_CONFIGURED;
+		goto out;
+	}
+
+	if (peer_node_id < 0 || peer_node_id >= DRBD_NODE_ID_MAX) {
+		retcode = ERR_INVALID_PEER_NODE_ID;
+		goto out;
+	}
+
+	idr_for_each_entry(&resource->devices, device, vnr)
+		clear_peer_slot(device, peer_node_id, 0);
+out:
+	mutex_unlock(&resource->adm_mutex);
+out_no_adm_mutex:
+	idr_for_each_entry(&resource->devices, device, vnr)
+		drbd_md_sync_if_dirty(device);
+
+	drbd_adm_finish(&adm_ctx, info, (enum drbd_ret_code)retcode);
+	return 0;
+
+}
+
+static enum drbd_ret_code validate_new_resource_name(const struct drbd_resource *resource, const char *new_name)
+{
+	enum drbd_ret_code retcode = drbd_check_name_str(new_name, drbd_strict_names);
+
+	if (retcode == NO_ERROR) {
+		struct drbd_resource *next_resource;
+		rcu_read_lock();
+		for_each_resource_rcu(next_resource, &drbd_resources) {
+			if (strcmp(next_resource->name, new_name) == 0) {
+				retcode = ERR_ALREADY_EXISTS;
+				break;
+			}
+		}
+		rcu_read_unlock();
+	}
+	return retcode;
+}
+
+static int drbd_adm_rename_resource(struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context adm_ctx;
+	struct drbd_resource *resource;
+	struct drbd_device *device;
+	struct rename_resource_info rename_resource_info;
+	struct rename_resource_parms parms = { };
+	char *old_res_name, *new_res_name;
+	enum drbd_ret_code retcode;
+	enum drbd_ret_code validate_err;
+	int err;
+	int vnr;
+
+	mutex_lock(&resources_mutex);
+	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
+	if (!adm_ctx.reply_skb) {
+		mutex_unlock(&resources_mutex);
+		return retcode;
+	}
+
+	resource = adm_ctx.resource;
+
+	err = rename_resource_parms_from_attrs(&parms, info);
+	if (err) {
+		retcode = ERR_MANDATORY_TAG;
+		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		goto out;
+	}
+
+	validate_err = validate_new_resource_name(resource, parms.new_resource_name);
+	if (validate_err != NO_ERROR) {
+		if (ERR_ALREADY_EXISTS) {
+			drbd_msg_sprintf_info(adm_ctx.reply_skb,
+				"Cannot rename to %s: a resource with that name already exists\n",
+				 parms.new_resource_name);
+		} else {
+			drbd_msg_put_name_error(adm_ctx.reply_skb, validate_err);
+		}
+		retcode = validate_err;
+		goto out;
+	}
+
+	drbd_info(resource, "Renaming to %s\n", parms.new_resource_name);
+
+	strscpy(rename_resource_info.res_new_name, parms.new_resource_name, sizeof(rename_resource_info.res_new_name));
+	rename_resource_info.res_new_name_len = min(strlen(parms.new_resource_name), sizeof(rename_resource_info.res_new_name));
+
+	mutex_lock(&notification_mutex);
+	notify_resource_state(NULL, 0, resource, NULL, &rename_resource_info, NOTIFY_RENAME);
+	mutex_unlock(&notification_mutex);
+
+	new_res_name = kstrdup(parms.new_resource_name, GFP_KERNEL);
+	if (!new_res_name) {
+		retcode = ERR_NOMEM;
+		goto out;
+	}
+	old_res_name = resource->name;
+	resource->name = new_res_name;
+	kvfree_rcu_mightsleep(old_res_name);
+
+	drbd_debugfs_resource_rename(resource, new_res_name);
+
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		kobject_uevent(&disk_to_dev(device->vdisk)->kobj, KOBJ_CHANGE);
+	}
+
+out:
+	mutex_unlock(&resources_mutex);
+	drbd_adm_finish(&adm_ctx, info, retcode);
+	return 0;
+}
-- 
2.53.0

