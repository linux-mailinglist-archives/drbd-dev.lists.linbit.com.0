Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLDvLc0Hx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:42:21 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6232E34C0F3
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:42:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7A6081630D6;
	Fri, 27 Mar 2026 23:42:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 122B016310D
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:02 +0100 (CET)
Received: by mail-wr1-f48.google.com with SMTP id
	ffacd0b85a97d-439d8df7620so1852508f8f.0
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651141;
	x=1775255941; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=MNit01cIPqF6YM0IlRfnsQOfEShgCrT9ZA8Q3b0a7hA=;
	b=yRCrKuqgdKLyEMJ/w6ZAr5VBC9lScavXrkS2i1A0e3l6SdEdbaVJ448vvthlU/JvaY
	7QG6Ipm+ET2q2168XCwJyI5dIG41ASg63CAjWuNjE9c+Y8smd85ykvtXRMDbxzybDnma
	1u2qTSFkmXfHg0ewdPnRZyRHa1eRM8uWfgmgrn7D7jRe9ROD3raxRtPMZ7nlEty18c2F
	MvdIXXR+tPDpnCuxDaefjowWtR28NBT8gGr+GnUxbeoSxd+WEwL0I4mGGc4GB8xc4KzL
	5YY2nBlZOmdO2IZzYLjERFiOxODOtuTTgK1jhVjfdS7gX0AtVrpXzbpWW/4dQTFPpSES
	rcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651141; x=1775255941;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=MNit01cIPqF6YM0IlRfnsQOfEShgCrT9ZA8Q3b0a7hA=;
	b=CtOTnKRk+pvAFuFZAjFxuMngOp4C2xRNebyl+IFBOQlZsTl/FAfgz99HASfIS9+sis
	3wT/frx6RWGmsD48VFo2gEoUH1Ew5px59gdZEDWE/JFUfSuuazsz84X0JxL7G0w2ovSH
	hBbWyiIcXXWS3EqIWgnBEewHFVLvEVmR8kts2+poG+/m6DP4AZYvGli02sXaCbxbuUue
	SDuXUSBO0O0r9EoOBsYfNfiwIBD1PLnuujeHWpvWzLkpo7Gggo+uQjqRI9EEa/apxiLf
	WLBaFV2hHMr9a5fFvncfLqhSq8KAfdO5g4BMi4BxGWh1hY+gzkhzRGSOOrO1vZ1YymL9
	w2kw==
X-Gm-Message-State: AOJu0Yz4aqS1aqIH252/G+RFwwcgWyofqKxVWwAoZGEJCppPZb7k3RfI
	fYTzWTpb5YddDMy8Bg0GWVBaQt/+d53gdyVjEfZF2/h+AovJZBhhTUU6/HMAaXhVpEsR/w==
X-Gm-Gg: ATEYQzz/Ixkq51HQFjOYYNqWm/eyh/0/HtWW4Mhh14ZnQOMVENstDn852WJBC9a+esT
	QuwVS+RB7alnTF5z5gjPBJugwcg2+943WY4mT5H6Hvsao6sKu2tbZ/mU74RiO10Mp6/JaMWyXFK
	m4bw2tBYEKxtzNthFZ1f/CNgS5z4sHXb1fOxiup6HApawDx2J1mQjO7+SWQO35ZW1z3z0jkdYYD
	zTVqecqCjV8vmoaJBbn0/+8P87mJfF9OeRKTnrXc9jAjAAgfuP/Gf46cRsQnT1X8kuuIBTFv484
	KmMC5htzH4Ud3Y7km2/7AvbQSsCDROT6ajxxixCGXO7dlfgTQhfjJPRc6mI5gJLR/wXvc/SUYiO
	rLoFHvXKt3efWzpjzXqOH/yhKjU/Ku43t636xHdNUBzXrbmaBxLTH9r1/Eo4BhPLOSVjSVg5yXs
	eoiWCRlCxLnHzfXIVW306bF8zJUIdr110V43NsBctZ/XBSNtMhlHuU5W5l7ljDehg/LtJqm43Kj
	vllp4uU3eFXS4nK5n8ibg==
X-Received: by 2002:a5d:5f96:0:b0:439:bcdb:95a8 with SMTP id
	ffacd0b85a97d-43b9e76a86bmr7136707f8f.0.1774651141226; 
	Fri, 27 Mar 2026 15:39:01 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.38.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:00 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/20] drbd: add load-balancing TCP transport
Date: Fri, 27 Mar 2026 23:38:07 +0100
Message-ID: <20260327223820.2244227-8-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	NEURAL_SPAM(0.00)[0.163];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:email,linbit.com:mid,connect_work.work:url,arg.data:url]
X-Rspamd-Queue-Id: 6232E34C0F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a second TCP transport implementation (lb-tcp) that distributes
replication traffic across multiple network paths simultaneously.
Unlike the standard TCP transport which treats paths as failover
alternatives, this transport connects all configured paths in parallel
and always sends on whichever path has the shortest send queue.

To make out-of-order delivery across paths coherent, each chunk of data
is prefixed with a sequence number so the receiver can reassemble
chunks in the correct order regardless of which path delivered them
first.

This transport can be optionally enabled and loaded as a separate
module; it does not affect the standard TCP transport.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig                 |   11 +
 drivers/block/drbd/Makefile                |    1 +
 drivers/block/drbd/drbd_transport_lb-tcp.c | 1905 ++++++++++++++++++++
 3 files changed, 1917 insertions(+)
 create mode 100644 drivers/block/drbd/drbd_transport_lb-tcp.c

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 203cfa2bf228..a214e92c32eb 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -84,6 +84,17 @@ config BLK_DEV_DRBD_TCP
 
 	  If unsure, say Y.
 
+config BLK_DEV_DRBD_LB_TCP
+	tristate "DRBD load-balanced TCP transport"
+	depends on BLK_DEV_DRBD
+	help
+
+	  Load-balanced TCP transport support for DRBD. This transport
+	  distributes DRBD replication traffic across multiple TCP
+	  connections for improved throughput.
+
+	  If unsure, say N.
+
 config BLK_DEV_DRBD_RDMA
 	tristate "DRBD RDMA transport"
 	depends on BLK_DEV_DRBD && INFINIBAND && INFINIBAND_ADDR_TRANS
diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index d47d311f76ea..7f2655a206aa 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -10,4 +10,5 @@ drbd-$(CONFIG_DEBUG_FS) += drbd_debugfs.o
 obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
 
 obj-$(CONFIG_BLK_DEV_DRBD_TCP) += drbd_transport_tcp.o
+obj-$(CONFIG_BLK_DEV_DRBD_LB_TCP) += drbd_transport_lb-tcp.o
 obj-$(CONFIG_BLK_DEV_DRBD_RDMA) += drbd_transport_rdma.o
diff --git a/drivers/block/drbd/drbd_transport_lb-tcp.c b/drivers/block/drbd/drbd_transport_lb-tcp.c
new file mode 100644
index 000000000000..497fca8c413c
--- /dev/null
+++ b/drivers/block/drbd/drbd_transport_lb-tcp.c
@@ -0,0 +1,1905 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * drbd_transport_lb-tcp.c
+ *
+ * This file is part of DRBD.
+ *
+ *  Copyright (C) 2014-2023, LINBIT HA-Solutions GmbH.
+ */
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/socket.h>
+#include <linux/pkt_sched.h>
+#include <linux/sched/signal.h>
+#include <linux/net.h>
+#include <linux/tcp.h>
+#include <linux/highmem.h>
+#include <linux/bio.h>
+#include <linux/drbd_genl_api.h>
+#include <linux/drbd_config.h>
+#include <net/tcp.h>
+#include "drbd_protocol.h"
+#include "drbd_transport.h"
+
+
+MODULE_AUTHOR("Philipp Reisner <philipp.reisner@linbit.com>");
+MODULE_AUTHOR("Lars Ellenberg <lars.ellenberg@linbit.com>");
+MODULE_AUTHOR("Roland Kammerer <roland.kammerer@linbit.com>");
+MODULE_DESCRIPTION("Load balancing TCP transport layer for DRBD");
+MODULE_LICENSE("GPL");
+MODULE_VERSION(REL_VERSION);
+
+/* TCP keepalive has proven to be vital in many deployment scenarios.
+ * Without keepalive, after a device has seen a sufficiently long period of
+ * idle time, packets on our "bulk data" socket may be dropped because an
+ * overly "smart" network infrastructure decided that TCP session was stale.
+ * Note that we don't try to use this to detect "broken" tcp sessions here,
+ * these will still be handled by the DRBD effective network timeout via
+ * timeout / ko-count settings.
+ * We use this to try to keep "idle" TCP sessions "alive".
+ * Default to send a probe every 23 seconds.
+ */
+#define DRBD_KEEP_IDLE	23
+#define DRBD_KEEP_INTVL 23
+#define DRBD_KEEP_CNT	9
+static unsigned int drbd_keepcnt = DRBD_KEEP_CNT;
+module_param_named(keepcnt, drbd_keepcnt, uint, 0664);
+MODULE_PARM_DESC(keepcnt, "see tcp(7) tcp_keepalive_probes; set TCP_KEEPCNT for data sockets; default: 9");
+static unsigned int drbd_keepidle = DRBD_KEEP_IDLE;
+module_param_named(keepidle, drbd_keepidle, uint, 0664);
+MODULE_PARM_DESC(keepidle, "see tcp(7) tcp_keepalive_time; set TCP_KEEPIDLE for data sockets; default: 23s");
+static unsigned int drbd_keepintvl = DRBD_KEEP_INTVL;
+module_param_named(keepintvl, drbd_keepintvl, uint, 0664);
+MODULE_PARM_DESC(keepintvtl, "see tcp(7) tcp_keepalive_intvl; set TCP_KEEPINTVL for data sockets; default: 23s");
+
+#define DTL_CONNECTING 1
+#define DTL_LOAD_BALANCE 2
+
+struct dtl_flow;
+
+struct dtl_header {
+	u32 sequence;
+	u32 bytes;
+} __packed;
+
+struct buffer {
+	void *base;
+	void *pos;
+};
+
+struct dtl_stream {
+	unsigned int send_sequence;
+	struct dtl_flow *recv_flow;
+	unsigned int recv_sequence;
+	long rcvtimeo;
+};
+
+struct dtl_transport {
+	struct drbd_transport transport; /* Must be first! */
+	spinlock_t control_recv_lock;
+	unsigned long flags;
+	struct timer_list control_timer;
+	struct delayed_work connect_work;
+	wait_queue_head_t data_ready;
+	wait_queue_head_t write_space;
+	struct dtl_stream streams[2];
+	struct buffer rbuf;
+	int connected_paths;
+	wait_queue_head_t connected_paths_change;
+	int err;
+};
+
+struct dtl_listener {
+	struct drbd_listener listener;
+
+	struct work_struct accept_work;
+	void (*original_sk_state_change)(struct sock *sk);
+	struct socket *s_listen;
+};
+
+struct dtl_flow {
+	struct socket *sock;
+	unsigned int recv_sequence;
+	int recv_bytes; /* The number of bytes to receive before the next dtl_header */
+	struct {
+		union {
+			struct dtl_header header;
+			u8 bytes[8];
+		};
+		int avail;
+	} control_reassemble;
+
+	void (*original_sk_state_change)(struct sock *sk);
+	void (*original_sk_data_ready)(struct sock *sk);
+	void (*original_sk_write_space)(struct sock *sk);
+
+	enum drbd_stream stream_nr;
+};
+
+struct dtl_path {
+	struct drbd_path path;
+	struct dtl_flow flow[2];
+};
+
+
+static int dtl_init(struct drbd_transport *transport);
+static void dtl_free(struct drbd_transport *transport, enum drbd_tr_free_op free_op);
+static void dtl_socket_free(struct drbd_transport *transport, struct socket **sock);
+static int dtl_prepare_connect(struct drbd_transport *transport);
+static int dtl_connect(struct drbd_transport *transport);
+static void dtl_finish_connect(struct drbd_transport *transport);
+static int dtl_recv(struct drbd_transport *transport, enum drbd_stream stream, void **buf,
+		    size_t size, int flags);
+static int dtl_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain,
+			  size_t size);
+static void dtl_stats(struct drbd_transport *transport, struct drbd_transport_stats *stats);
+static int dtl_net_conf_change(struct drbd_transport *transport, struct net_conf *new_net_conf);
+static void dtl_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream,
+			     long timeout);
+static long dtl_get_rcvtimeo(struct drbd_transport *transport, enum drbd_stream stream);
+static int dtl_send_page(struct drbd_transport *transport, enum drbd_stream, struct page *page,
+		int offset, size_t size, unsigned int msg_flags);
+static int dtl_send_zc_bio(struct drbd_transport *, struct bio *bio);
+static bool dtl_stream_ok(struct drbd_transport *transport, enum drbd_stream stream);
+static bool dtl_hint(struct drbd_transport *transport, enum drbd_stream stream,
+		     enum drbd_tr_hints hint);
+static void dtl_debugfs_show(struct drbd_transport *transport, struct seq_file *m);
+static int dtl_add_path(struct drbd_path *path);
+static bool dtl_may_remove_path(struct drbd_path *);
+static void dtl_remove_path(struct drbd_path *);
+static void dtl_control_timer_fn(struct timer_list *t);
+static void dtl_write_space(struct sock *sk);
+static void dtl_connect_work_fn(struct work_struct *work);
+static void dtl_accept_work_fn(struct work_struct *work);
+static int dtl_set_active(struct drbd_transport *transport, bool active);
+static int dtl_path_adjust_listener(struct dtl_path *path, bool active);
+static int dtl_init_listener(struct drbd_transport *transport, const struct sockaddr *addr,
+			     struct net *net, struct drbd_listener *drbd_listener);
+static void dtl_destroy_listener(struct drbd_listener *generic_listener);
+static void dtl_set_socket_callbacks(struct dtl_transport *dtl_transport, struct dtl_flow *flow);
+
+
+static struct drbd_transport_class dtl_transport_class = {
+	.name = "lb-tcp",
+	.instance_size = sizeof(struct dtl_transport),
+	.path_instance_size = sizeof(struct dtl_path),
+	.listener_instance_size = sizeof(struct dtl_listener),
+	.ops = (struct drbd_transport_ops) {
+		.init = dtl_init,
+		.free = dtl_free,
+		.init_listener = dtl_init_listener,
+		.release_listener = dtl_destroy_listener,
+		.prepare_connect = dtl_prepare_connect,
+		.connect = dtl_connect,
+		.finish_connect = dtl_finish_connect,
+		.recv = dtl_recv,
+		.recv_pages = dtl_recv_pages,
+		.stats = dtl_stats,
+		.net_conf_change = dtl_net_conf_change,
+		.set_rcvtimeo = dtl_set_rcvtimeo,
+		.get_rcvtimeo = dtl_get_rcvtimeo,
+		.send_page = dtl_send_page,
+		.send_zc_bio = dtl_send_zc_bio,
+		.stream_ok = dtl_stream_ok,
+		.hint = dtl_hint,
+		.debugfs_show = dtl_debugfs_show,
+		.add_path = dtl_add_path,
+		.may_remove_path = dtl_may_remove_path,
+		.remove_path = dtl_remove_path,
+	},
+	.module = THIS_MODULE,
+	.list = LIST_HEAD_INIT(dtl_transport_class.list),
+};
+
+static int dtl_init(struct drbd_transport *transport)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+
+	spin_lock_init(&dtl_transport->control_recv_lock);
+
+	dtl_transport->transport.class = &dtl_transport_class;
+	timer_setup(&dtl_transport->control_timer, dtl_control_timer_fn, 0);
+
+	init_waitqueue_head(&dtl_transport->data_ready);
+	init_waitqueue_head(&dtl_transport->write_space);
+	INIT_DELAYED_WORK(&dtl_transport->connect_work, dtl_connect_work_fn);
+	dtl_transport->connected_paths = 0;
+	dtl_transport->flags = 0;
+	init_waitqueue_head(&dtl_transport->connected_paths_change);
+
+	dtl_transport->rbuf.base = (void *)__get_free_page(GFP_KERNEL);
+	dtl_transport->rbuf.pos = dtl_transport->rbuf.base;
+	if (!dtl_transport->rbuf.base)
+		return -ENOMEM;
+
+	return 0;
+}
+
+
+static void dtl_free(struct drbd_transport *transport, enum drbd_tr_free_op free_op)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct drbd_path *drbd_path;
+	/* free the socket specific stuff, mutexes are handled by caller */
+
+	dtl_set_active(transport, false);
+	list_for_each_entry(drbd_path, &transport->paths, list) {
+		bool was_established = test_and_clear_bit(TR_ESTABLISHED, &drbd_path->flags);
+
+		if (free_op == CLOSE_CONNECTION && was_established)
+			drbd_path_event(transport, drbd_path);
+	}
+
+	timer_delete_sync(&dtl_transport->control_timer);
+	cancel_delayed_work_sync(&dtl_transport->connect_work);
+
+	if (free_op == DESTROY_TRANSPORT) {
+		free_page((unsigned long)dtl_transport->rbuf.base);
+		dtl_transport->rbuf.base = NULL;
+	}
+}
+
+static int _dtl_send(struct dtl_transport *dtl_transport, struct dtl_flow *flow,
+		      void *buf, size_t size, unsigned int msg_flags)
+{
+	struct socket *sock = flow->sock;
+	struct kvec iov;
+	struct msghdr msg;
+	int rv, sent = 0;
+
+	/* THINK  if (signal_pending) return ... ? */
+
+	iov.iov_base = buf;
+	iov.iov_len  = size;
+
+	msg.msg_name       = NULL;
+	msg.msg_namelen    = 0;
+	msg.msg_control    = NULL;
+	msg.msg_controllen = 0;
+	msg.msg_flags      = msg_flags | MSG_NOSIGNAL;
+
+	do {
+		rv = kernel_sendmsg(sock, &msg, &iov, 1, iov.iov_len);
+		if (rv == -EAGAIN) {
+			struct drbd_transport *transport = &dtl_transport->transport;
+
+			if (drbd_stream_send_timed_out(transport, flow->stream_nr))
+				break;
+			continue;
+		}
+		if (rv == -EINTR) {
+			flush_signals(current);
+			rv = 0;
+		}
+		if (rv < 0)
+			break;
+		sent += rv;
+		iov.iov_base += rv;
+		iov.iov_len  -= rv;
+	} while (sent < size);
+
+	if (rv <= 0)
+		return rv;
+
+	return sent;
+}
+
+static int dtl_recv_short(struct socket *sock, void *buf, size_t size, int flags)
+{
+	struct kvec iov = {
+		.iov_base = buf,
+		.iov_len = size,
+	};
+	struct msghdr msg = {
+		.msg_flags = (flags ? flags : MSG_WAITALL | MSG_NOSIGNAL)
+	};
+
+	return kernel_recvmsg(sock, &msg, &iov, 1, size, msg.msg_flags);
+}
+
+static void dtl_data_ready(struct sock *sk)
+{
+	struct dtl_flow *flow = sk->sk_user_data;
+	struct dtl_path *path = container_of(flow, struct dtl_path, flow[flow->stream_nr]);
+	struct dtl_transport *dtl_transport =
+		container_of(path->path.transport, struct dtl_transport, transport);
+
+	wake_up(&dtl_transport->data_ready);
+
+	flow->original_sk_data_ready(sk);
+}
+
+static int dtl_wait_data_cond(struct dtl_transport *dtl_transport,
+			      enum drbd_stream st, struct dtl_flow **rh_fl)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	struct dtl_stream *stream = &dtl_transport->streams[st];
+	struct drbd_path *drbd_path;
+	struct dtl_flow *flow;
+	struct tcp_sock *tp;
+	struct sock *sk;
+	int err = -ENOTCONN;
+
+	for_each_path_ref(drbd_path, transport) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+
+		if (!test_bit(TR_ESTABLISHED, &drbd_path->flags))
+			continue;
+		flow = &path->flow[st];
+		if (!flow->sock)
+			continue;
+		sk = flow->sock->sk;
+		tp = tcp_sk(sk);
+		if (sk->sk_state != TCP_ESTABLISHED)
+			continue;
+		if (flow->recv_sequence == stream->recv_sequence + 1)
+			goto found;
+		err = -EAGAIN;
+		if (READ_ONCE(tp->rcv_nxt) - READ_ONCE(tp->copied_seq) < sizeof(struct dtl_header))
+			continue;
+		if (flow->recv_bytes)
+			continue;
+
+		*rh_fl = flow;
+		err = -EBFONT; /* Abusing strange errno to activate outer loop */
+		kref_put(&drbd_path->kref, drbd_destroy_path); /* aborting for_each_path_ref */
+		goto out;
+	}
+	if (err > 0)
+		err = -EAGAIN;
+
+	goto out;
+found:
+	kref_put(&drbd_path->kref, drbd_destroy_path); /* aborted for_each_path_ref */
+	stream->recv_sequence++;
+	stream->recv_flow = flow;
+	err = 0;
+out:
+	return err;
+}
+
+static int dtl_select_recv_flow(struct dtl_transport *dtl_transport, enum drbd_stream st,
+				struct dtl_flow **flow)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	struct dtl_stream *stream = &dtl_transport->streams[st];
+	long rem, timeout = stream->rcvtimeo;
+	int err;
+
+	if (stream->recv_flow) {
+		if (!stream->recv_flow->sock)
+			return -ENOTCONN;
+
+		*flow = stream->recv_flow;
+		return 0;
+	}
+
+	while (true) {
+		struct dtl_header header;
+		struct dtl_flow *rh_fl;
+
+		rem = wait_event_interruptible_timeout(dtl_transport->data_ready,
+			(err = dtl_wait_data_cond(dtl_transport, st, &rh_fl)) != -EAGAIN,
+			timeout);
+		if (rem < 0)
+			return rem;
+		if (!err)
+			break;
+		if (err != -EBFONT)
+			return err;
+
+		err = dtl_recv_short(rh_fl->sock, &header, sizeof(header), 0);
+		if (err < 0)
+			return err;
+		if (err < sizeof(header)) {
+			tr_warn(transport, "got too little %d\n", err);
+			return -EIO;
+		}
+		rh_fl->recv_sequence = be32_to_cpu(header.sequence);
+		rh_fl->recv_bytes = be32_to_cpu(header.bytes);
+		if (rh_fl->recv_sequence == stream->recv_sequence + 1) {
+			stream->recv_sequence++;
+			stream->recv_flow = rh_fl;
+			break;
+		}
+	}
+
+	*flow = stream->recv_flow;
+	return 0;
+}
+
+static void dtl_received(struct dtl_transport *dtl_transport, struct dtl_flow *flow, int size)
+{
+	if (test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags)) {
+		flow->recv_bytes -= size;
+		if (flow->recv_bytes == 0)
+			dtl_transport->streams[flow->stream_nr].recv_flow = NULL;
+	}
+}
+
+static int
+dtl_recv(struct drbd_transport *transport, enum drbd_stream st, void **buf, size_t size, int flags)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct dtl_flow *flow;
+	void *buffer;
+	int err;
+
+	err = dtl_select_recv_flow(dtl_transport, st, &flow);
+	if (err)
+		return err;
+
+	if (flags & CALLER_BUFFER) {
+		buffer = *buf;
+		err = dtl_recv_short(flow->sock, buffer, size, flags & ~CALLER_BUFFER);
+	} else if (flags & GROW_BUFFER) {
+		TR_ASSERT(transport, *buf == dtl_transport->rbuf.base);
+		buffer = dtl_transport->rbuf.pos;
+		TR_ASSERT(transport, (buffer - *buf) + size <= PAGE_SIZE);
+
+		err = dtl_recv_short(flow->sock, buffer, size, flags & ~GROW_BUFFER);
+	} else {
+		buffer = dtl_transport->rbuf.base;
+
+		err = dtl_recv_short(flow->sock, buffer, size, flags);
+		if (err > 0)
+			*buf = buffer;
+	}
+
+	if (err > 0) {
+		dtl_received(dtl_transport, flow, err);
+		dtl_transport->rbuf.pos = buffer + err;
+	}
+
+	return err;
+}
+
+static int
+_dtl_recv_page(struct dtl_transport *dtl_transport, struct page *page, int size)
+{
+	void *data = kmap_local_page(page);
+	void *pos = data;
+	struct dtl_flow *flow;
+	int err;
+
+	while (size) {
+		err = dtl_select_recv_flow(dtl_transport, DATA_STREAM, &flow);
+		if (err)
+			goto out;
+
+		err = dtl_recv_short(flow->sock, data, min(size, flow->recv_bytes), 0);
+		if (err < 0)
+			goto out;
+		size -= err;
+		pos += err;
+		dtl_received(dtl_transport, flow, err);
+	}
+	err = pos - data;
+out:
+	kunmap_local(data);
+	return err;
+}
+
+static int
+dtl_recv_pages(struct drbd_transport *transport, struct drbd_page_chain_head *chain, size_t size)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct page *page;
+	int err;
+
+	drbd_alloc_page_chain(transport, chain, DIV_ROUND_UP(size, PAGE_SIZE), GFP_TRY);
+	page = chain->head;
+	if (!page)
+		return -ENOMEM;
+
+	page_chain_for_each(page) {
+		size_t len = min_t(int, size, PAGE_SIZE);
+
+		err = _dtl_recv_page(dtl_transport, page, len);
+		if (err < 0)
+			goto fail;
+		set_page_chain_offset(page, 0);
+		set_page_chain_size(page, len);
+		size -= err;
+	}
+	if (unlikely(size)) {
+		tr_warn(transport, "Not enough data received; missing %zu bytes\n", size);
+		err = -ENODATA;
+		goto fail;
+	}
+	return 0;
+fail:
+	drbd_free_page_chain(transport, chain);
+	return err;
+}
+
+static void dtl_stats(struct drbd_transport *transport, struct drbd_transport_stats *stats)
+{
+	struct drbd_transport_stats s = {};
+	struct drbd_path *drbd_path;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(drbd_path, &transport->paths, list) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct dtl_flow *flow = &path->flow[DATA_STREAM];
+
+		if (flow->sock) {
+			struct sock *sk = flow->sock->sk;
+			struct tcp_sock *tp = tcp_sk(sk);
+
+			s.unread_received += tp->rcv_nxt - tp->copied_seq;
+			s.unacked_send += tp->write_seq - tp->snd_una;
+			s.send_buffer_size += sk->sk_sndbuf;
+			s.send_buffer_used += sk->sk_wmem_queued;
+		}
+	}
+	rcu_read_unlock();
+
+	*stats = s;
+}
+
+static void dtl_setbufsize(struct socket *sock, unsigned int snd, unsigned int rcv)
+{
+	struct sock *sk = sock->sk;
+
+	/* open coded SO_SNDBUF, SO_RCVBUF */
+	if (snd) {
+		sk->sk_sndbuf = snd;
+		sk->sk_userlocks |= SOCK_SNDBUF_LOCK;
+		/* Wake up sending tasks if we upped the value. */
+		sk->sk_write_space(sk);
+	} else {
+		sk->sk_userlocks &= ~SOCK_SNDBUF_LOCK;
+	}
+
+	if (rcv) {
+		sk->sk_rcvbuf = rcv;
+		sk->sk_userlocks |= SOCK_RCVBUF_LOCK;
+	} else {
+		sk->sk_userlocks &= ~SOCK_RCVBUF_LOCK;
+	}
+}
+
+static bool dtl_path_cmp_addr(struct dtl_path *path)
+{
+	struct drbd_path *drbd_path = &path->path;
+	int addr_size;
+
+	addr_size = min(drbd_path->my_addr_len, drbd_path->peer_addr_len);
+	return memcmp(&drbd_path->my_addr, &drbd_path->peer_addr, addr_size) > 0;
+}
+
+static int
+dtl_try_connect(struct drbd_transport *transport, struct dtl_path *path, struct socket **ret_sock)
+{
+	const char *what;
+	struct socket *sock;
+	struct sockaddr_storage my_addr, peer_addr;
+	struct net_conf *nc;
+	int err;
+	int sndbuf_size, rcvbuf_size, connect_int;
+
+	rcu_read_lock();
+	nc = rcu_dereference(transport->net_conf);
+	if (!nc) {
+		rcu_read_unlock();
+		return -EIO;
+	}
+	sndbuf_size = nc->sndbuf_size;
+	rcvbuf_size = nc->rcvbuf_size;
+	connect_int = nc->connect_int;
+	rcu_read_unlock();
+
+	my_addr = path->path.my_addr;
+	if (my_addr.ss_family == AF_INET6)
+		((struct sockaddr_in6 *)&my_addr)->sin6_port = 0;
+	else
+		((struct sockaddr_in *)&my_addr)->sin_port = 0; /* AF_INET & AF_SCI */
+
+	/* The network stack might change peer_addr.ss_family, so use a copy here. */
+	peer_addr = path->path.peer_addr;
+
+	what = "sock_create_kern";
+	err = sock_create_kern(path->path.net, my_addr.ss_family, SOCK_STREAM, IPPROTO_TCP,
+			       &sock);
+	if (err < 0) {
+		sock = NULL;
+		goto out;
+	}
+
+	sock->sk->sk_rcvtimeo =
+	sock->sk->sk_sndtimeo = connect_int * HZ;
+	dtl_setbufsize(sock, sndbuf_size, rcvbuf_size);
+
+	/* explicitly bind to the configured IP as source IP
+	 * for the outgoing connections.
+	 * This is needed for multihomed hosts and to be
+	 * able to use lo: interfaces for drbd.
+	 * Make sure to use 0 as port number, so linux selects
+	 * a free one dynamically.
+	 */
+	what = "bind before connect";
+	err = sock->ops->bind(sock, (struct sockaddr_unsized *) &my_addr, path->path.my_addr_len);
+	if (err < 0)
+		goto out;
+
+	/* connect may fail, peer not yet available. stay C_CONNECTING */
+	what = "connect";
+	err = sock->ops->connect(sock, (struct sockaddr_unsized *) &peer_addr,
+				   path->path.peer_addr_len, 0);
+	if (err < 0) {
+		switch (err) {
+		case -ETIMEDOUT:
+		case -EINPROGRESS:
+		case -EINTR:
+		case -ERESTARTSYS:
+		case -ECONNREFUSED:
+		case -ECONNRESET:
+		case -ENETUNREACH:
+		case -EHOSTDOWN:
+		case -EHOSTUNREACH:
+			err = -EAGAIN;
+			break;
+		case -EINVAL:
+			err = -EADDRNOTAVAIL;
+			break;
+		}
+	}
+
+out:
+	if (err < 0) {
+		if (sock)
+			sock_release(sock);
+		if (err != -EAGAIN && err != -EADDRNOTAVAIL)
+			tr_err(transport, "%s failed, err = %d\n", what, err);
+	} else {
+		*ret_sock = sock;
+	}
+
+	return err;
+}
+
+static int dtl_send_first_packet(struct dtl_transport *dtl_transport,
+				 struct dtl_flow *flow, enum drbd_packet cmd)
+{
+	struct p_header80 h;
+	int msg_flags = 0;
+	int err;
+
+	if (!flow->sock)
+		return -EIO;
+
+	if (test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags)) {
+		struct dtl_header hdr = { .sequence = 0, .bytes = cpu_to_be32(sizeof(h)) };
+
+		err = _dtl_send(dtl_transport, flow, &hdr, sizeof(hdr), msg_flags | MSG_MORE);
+		if (err < 0)
+			return err;
+	}
+
+	h.magic = cpu_to_be32(DRBD_MAGIC);
+	h.command = cpu_to_be16(cmd);
+	h.length = 0;
+
+	err = _dtl_send(dtl_transport, flow, &h, sizeof(h), msg_flags);
+
+	return err;
+}
+
+/**
+ * dtl_socket_free() - Free the socket
+ * @transport:	DRBD transport.
+ * @sock:	pointer to the pointer to the socket.
+ */
+static void dtl_socket_free(struct drbd_transport *transport, struct socket **sock)
+{
+	struct socket *s = xchg(sock, NULL);
+
+	if (!s)
+		return;
+
+	synchronize_rcu();
+	kernel_sock_shutdown(s, SHUT_RDWR);
+	sock_release(s);
+}
+
+/**
+ * dtl_socket_ok_or_free() - Free the socket if its connection is not okay
+ * @transport:	DRBD transport.
+ * @sock:	pointer to the pointer to the socket.
+ */
+static bool dtl_socket_ok_or_free(struct drbd_transport *transport, struct socket **sock)
+{
+	struct socket *s;
+	bool rv;
+
+	rcu_read_lock();
+	s = rcu_dereference(*sock);
+	rv = s && s->sk->sk_state == TCP_ESTABLISHED;
+	rcu_read_unlock();
+
+	if (s && !rv)
+		dtl_socket_free(transport, sock);
+
+	return rv;
+}
+
+static bool _dtl_path_established(struct drbd_transport *transport, struct dtl_path *path)
+{
+	return	dtl_socket_ok_or_free(transport, &path->flow[DATA_STREAM].sock) &&
+		dtl_socket_ok_or_free(transport, &path->flow[CONTROL_STREAM].sock);
+}
+
+static bool dtl_deactivate_other_paths(struct dtl_path *path)
+{
+	struct drbd_transport *transport = path->path.transport;
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	bool active = test_and_clear_bit(DTL_CONNECTING, &dtl_transport->flags);
+	struct drbd_path *drbd_path;
+
+	if (active) {
+		for_each_path_ref(drbd_path, transport)
+			dtl_path_adjust_listener(path, false);
+	}
+
+	return active;
+}
+
+static bool dtl_path_established(struct drbd_transport *transport, struct dtl_path *path)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	bool lb = test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags);
+	struct drbd_path *drbd_path = &path->path;
+	struct net_conf *nc;
+	enum drbd_stream i;
+	bool established;
+	int timeout;
+
+	rcu_read_lock();
+	nc = rcu_dereference(transport->net_conf);
+	timeout = (nc->sock_check_timeo ?: nc->ping_timeo) * HZ / 10;
+	rcu_read_unlock();
+	schedule_timeout_interruptible(timeout);
+
+	established = _dtl_path_established(transport, path);
+
+	if (established && !lb) {
+		established = dtl_deactivate_other_paths(path);
+
+		if (!established) {
+			dtl_socket_free(transport, &path->flow[DATA_STREAM].sock);
+			dtl_socket_free(transport, &path->flow[CONTROL_STREAM].sock);
+		}
+	}
+
+	if (!established) {
+		if (test_and_clear_bit(TR_ESTABLISHED, &drbd_path->flags)) {
+			dtl_transport->connected_paths--;
+			drbd_path_event(transport, drbd_path);
+		}
+	} else if (!test_and_set_bit(TR_ESTABLISHED, &drbd_path->flags)) {
+		dtl_transport->connected_paths++;
+
+		for (i = DATA_STREAM; i <= CONTROL_STREAM; i++) {
+			if (lb) {
+				path->flow[i].recv_sequence = 0;
+				path->flow[i].recv_bytes = 0;
+			} else {
+				path->flow[i].recv_sequence = 1;
+				path->flow[i].recv_bytes = INT_MAX;
+				dtl_transport->streams[i].recv_flow = &path->flow[i];
+			}
+		}
+		wake_up(&dtl_transport->data_ready);
+		drbd_put_listener(drbd_path);
+		dtl_set_socket_callbacks(dtl_transport, &path->flow[DATA_STREAM]);
+		dtl_set_socket_callbacks(dtl_transport, &path->flow[CONTROL_STREAM]);
+		drbd_path_event(transport, drbd_path);
+	}
+
+	return established;
+}
+
+static void unregister_state_change(struct sock *sk, struct dtl_listener *listener)
+{
+	write_lock_bh(&sk->sk_callback_lock);
+	sk->sk_state_change = listener->original_sk_state_change;
+	sk->sk_user_data = NULL;
+	write_unlock_bh(&sk->sk_callback_lock);
+}
+
+
+static int dtl_receive_first_packet(struct dtl_transport *dtl_transport, struct dtl_path *path,
+				    struct socket *sock)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	struct p_header80 header;
+	struct net_conf *nc;
+	int err;
+
+	rcu_read_lock();
+	nc = rcu_dereference(transport->net_conf);
+	if (!nc) {
+		rcu_read_unlock();
+		return -EIO;
+	}
+	sock->sk->sk_rcvtimeo = nc->ping_timeo * 4 * HZ / 10;
+	rcu_read_unlock();
+
+	if (test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags)) {
+		struct dtl_header hdr;
+
+		err = dtl_recv_short(sock, &hdr, sizeof(hdr), 0);
+		if (err != sizeof(hdr)) {
+			if (err >= 0)
+				err = -EIO;
+			return err;
+		}
+	}
+	err = dtl_recv_short(sock, &header, sizeof(header), 0);
+	if (err != sizeof(header)) {
+		if (err >= 0)
+			err = -EIO;
+		return err;
+	}
+	if (header.magic != cpu_to_be32(DRBD_MAGIC)) {
+		tr_err(transport, "Wrong magic value 0x%08x in receive_first_packet\n",
+			 be32_to_cpu(header.magic));
+		return -EINVAL;
+	}
+	return be16_to_cpu(header.command);
+}
+
+static struct dtl_flow *dtl_control_next_flow_in_seq(struct dtl_transport *dtl_transport)
+{
+	struct dtl_stream *stream = &dtl_transport->streams[CONTROL_STREAM];
+	struct drbd_transport *transport = &dtl_transport->transport;
+	struct drbd_path *drbd_path;
+	struct dtl_flow *flow;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(drbd_path, &transport->paths, list) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+
+		flow = &path->flow[CONTROL_STREAM];
+		if (flow->sock &&
+		    flow->recv_sequence == stream->recv_sequence + 1 && flow->recv_bytes > 0) {
+			struct sock *sk = flow->sock->sk;
+			struct tcp_sock *tp = tcp_sk(sk);
+
+			if (READ_ONCE(tp->rcv_nxt) - READ_ONCE(tp->copied_seq))
+				goto found;
+		}
+	}
+	flow = NULL;
+found:
+	rcu_read_unlock();
+	return flow;
+}
+
+static int dtl_control_tcp_input(read_descriptor_t *rd_desc, struct sk_buff *skb,
+				 unsigned int offset, size_t len)
+{
+	struct dtl_flow *flow = rd_desc->arg.data;
+	struct dtl_path *path = container_of(flow, struct dtl_path, flow[flow->stream_nr]);
+	struct dtl_transport *dtl_transport =
+		container_of(path->path.transport, struct dtl_transport, transport);
+	struct dtl_stream *stream = &dtl_transport->streams[CONTROL_STREAM];
+	struct drbd_transport *transport = &dtl_transport->transport;
+	int overall_avail, avail, consumed = 0;
+	struct drbd_const_buffer buffer;
+	struct skb_seq_state seq;
+
+	if (flow->recv_bytes &&
+	    flow->recv_sequence != stream->recv_sequence + 1)
+		return 0;
+
+	skb_prepare_seq_read(skb, offset, skb->len, &seq);
+	do {
+		/*
+		 * skb_seq_read() returns the length of the block assigned to buffer. This might
+		 * be more than is actually ready, so we ensure we only mark as available what
+		 * is ready.
+		 */
+		overall_avail = skb_seq_read(consumed, &buffer.buffer, &seq);
+		if (!overall_avail)
+			break;
+		avail = min_t(int, overall_avail, len - consumed);
+		while (avail) {
+			if (flow->recv_bytes == 0) {
+				const struct dtl_header *hdr = (struct dtl_header *)buffer.buffer;
+				int size = sizeof(struct dtl_header);
+				bool hdr_frag = flow->control_reassemble.avail || avail < size;
+
+				if (hdr_frag) {
+					int cra = flow->control_reassemble.avail;
+
+					size = min(size - cra, avail);
+					memcpy(flow->control_reassemble.bytes + cra, hdr, size);
+					flow->control_reassemble.avail += size;
+				}
+				consumed += size;
+				avail -= size;
+				buffer.buffer += size;
+				if (hdr_frag) {
+					if (flow->control_reassemble.avail < sizeof(*hdr))
+						continue;
+					hdr = &flow->control_reassemble.header;
+					flow->control_reassemble.avail = 0;
+				}
+
+				flow->recv_sequence = be32_to_cpu(hdr->sequence);
+				flow->recv_bytes = be32_to_cpu(hdr->bytes);
+				if (flow->recv_sequence != stream->recv_sequence + 1)
+					goto out;
+			}
+			buffer.avail = min(flow->recv_bytes, avail);
+			if (!buffer.avail)
+				continue;
+			consumed += buffer.avail;
+			avail -= buffer.avail;
+			if (test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags))
+				flow->recv_bytes -= buffer.avail;
+			drbd_control_data_ready(transport, &buffer);
+			if (flow->recv_bytes == 0)
+				stream->recv_sequence++;
+		}
+	} while (consumed < len);
+out:
+	skb_abort_seq_read(&seq);
+	return consumed;
+}
+
+static void dtl_control_data_ready(struct sock *sk)
+{
+	struct dtl_flow *flow = sk->sk_user_data;
+	struct dtl_path *path = container_of(flow, struct dtl_path, flow[flow->stream_nr]);
+	struct dtl_transport *dtl_transport =
+		container_of(path->path.transport, struct dtl_transport, transport);
+
+	read_descriptor_t rd_desc = {
+		.count = 1,
+		.arg = { .data = flow },
+	};
+	mod_timer(&dtl_transport->control_timer, jiffies + sk->sk_rcvtimeo);
+
+	spin_lock_bh(&dtl_transport->control_recv_lock);
+	tcp_read_sock(sk, &rd_desc, dtl_control_tcp_input);
+
+	/* in case another flow became the next in sequence */
+	while ((flow = dtl_control_next_flow_in_seq(dtl_transport))) {
+		sk = flow->sock->sk;
+		rd_desc.arg.data = flow;
+		tcp_read_sock(sk, &rd_desc, dtl_control_tcp_input);
+	}
+	spin_unlock_bh(&dtl_transport->control_recv_lock);
+}
+
+static void dtl_control_state_change(struct sock *sk)
+{
+	struct dtl_flow *flow = sk->sk_user_data;
+	struct dtl_path *path = container_of(flow, struct dtl_path, flow[flow->stream_nr]);
+	struct dtl_transport *dtl_transport =
+		container_of(path->path.transport, struct dtl_transport, transport);
+	struct drbd_transport *transport = &dtl_transport->transport;
+
+	switch (sk->sk_state) {
+	case TCP_FIN_WAIT1:
+	case TCP_CLOSE_WAIT:
+	case TCP_CLOSE:
+	case TCP_LAST_ACK:
+	case TCP_CLOSING:
+		drbd_control_event(transport, CLOSED_BY_PEER);
+		break;
+	default:
+		tr_warn(transport, "unhandled state %d\n", sk->sk_state);
+	}
+
+	flow->original_sk_state_change(sk);
+}
+
+static void dtl_incoming_connection(struct sock *sk)
+{
+	struct dtl_listener *listener = sk->sk_user_data;
+	void (*state_change)(struct sock *sk);
+
+	state_change = listener->original_sk_state_change;
+	state_change(sk);
+
+	spin_lock(&listener->listener.waiters_lock);
+	listener->listener.pending_accepts++;
+	spin_unlock(&listener->listener.waiters_lock);
+	kref_get(&listener->listener.kref);
+	if (!schedule_work(&listener->accept_work))
+		kref_put(&listener->listener.kref, drbd_listener_destroy);
+}
+
+static void dtl_control_timer_fn(struct timer_list *t)
+{
+	struct dtl_transport *dtl_transport = timer_container_of(dtl_transport, t, control_timer);
+	struct drbd_transport *transport = &dtl_transport->transport;
+
+	drbd_control_event(transport, TIMEOUT);
+}
+
+static void dtl_destroy_listener(struct drbd_listener *generic_listener)
+{
+	struct dtl_listener *listener =
+		container_of(generic_listener, struct dtl_listener, listener);
+
+	if (!listener->s_listen)
+		return;
+	unregister_state_change(listener->s_listen->sk, listener);
+	sock_release(listener->s_listen);
+}
+
+static int dtl_init_listener(struct drbd_transport *transport,
+			     const struct sockaddr *addr,
+			     struct net *net,
+			     struct drbd_listener *drbd_listener)
+{
+	int err, sndbuf_size, rcvbuf_size, addr_len;
+	struct sockaddr_storage my_addr;
+	struct dtl_listener *listener = container_of(drbd_listener, struct dtl_listener, listener);
+	struct socket *s_listen;
+	struct net_conf *nc;
+	const char *what = "";
+
+
+	INIT_WORK(&listener->accept_work, dtl_accept_work_fn);
+	rcu_read_lock();
+	nc = rcu_dereference(transport->net_conf);
+	if (!nc) {
+		rcu_read_unlock();
+		return -EINVAL;
+	}
+	sndbuf_size = nc->sndbuf_size;
+	rcvbuf_size = nc->rcvbuf_size;
+	rcu_read_unlock();
+
+	my_addr = *(struct sockaddr_storage *)addr;
+
+	err = sock_create_kern(net, my_addr.ss_family, SOCK_STREAM, IPPROTO_TCP, &s_listen);
+	if (err < 0) {
+		s_listen = NULL;
+		what = "sock_create_kern";
+		goto out;
+	}
+
+	s_listen->sk->sk_reuse = SK_CAN_REUSE; /* SO_REUSEADDR */
+	dtl_setbufsize(s_listen, sndbuf_size, rcvbuf_size);
+
+	addr_len = addr->sa_family == AF_INET6 ? sizeof(struct sockaddr_in6)
+		: sizeof(struct sockaddr_in);
+
+	err = s_listen->ops->bind(s_listen, (struct sockaddr_unsized *)&my_addr, addr_len);
+	if (err < 0) {
+		what = "bind before listen";
+		goto out;
+	}
+
+	listener->s_listen = s_listen;
+	write_lock_bh(&s_listen->sk->sk_callback_lock);
+	listener->original_sk_state_change = s_listen->sk->sk_state_change;
+	s_listen->sk->sk_state_change = dtl_incoming_connection;
+	s_listen->sk->sk_user_data = listener;
+	write_unlock_bh(&s_listen->sk->sk_callback_lock);
+
+	err = s_listen->ops->listen(s_listen, DRBD_PEERS_MAX * 2);
+	if (err < 0) {
+		what = "listen";
+		goto out;
+	}
+
+	listener->listener.listen_addr = my_addr;
+
+	return 0;
+out:
+	if (s_listen)
+		sock_release(s_listen);
+
+	if (err < 0 &&
+	    err != -EAGAIN && err != -EINTR && err != -ERESTARTSYS && err != -EADDRINUSE &&
+	    err != -EADDRNOTAVAIL)
+		tr_err(transport, "%s failed, err = %d\n", what, err);
+
+	return err;
+}
+
+static void dtl_setup_socket(struct dtl_transport *dtl_transport, struct socket *sock,
+			     struct dtl_flow *flow)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	bool use_for_data = flow->stream_nr == DATA_STREAM;
+	struct net_conf *nc;
+	long timeout = HZ;
+
+	sock->sk->sk_reuse = SK_CAN_REUSE; /* SO_REUSEADDR */
+	/* We are a block device, we are in the write-out path,
+	 * we may need memory to facilitate memory reclaim
+	 */
+	sock->sk->sk_use_task_frag = false;
+	sock->sk->sk_allocation = GFP_ATOMIC;
+	sk_set_memalloc(sock->sk);
+
+	sock->sk->sk_priority = use_for_data ? TC_PRIO_INTERACTIVE_BULK : TC_PRIO_INTERACTIVE;
+	tcp_sock_set_nodelay(sock->sk);
+
+	rcu_read_lock();
+	nc = rcu_dereference(transport->net_conf);
+	if (nc)
+		timeout = nc->timeout * HZ / 10;
+	rcu_read_unlock();
+
+	sock->sk->sk_sndtimeo = timeout;
+	sock_set_keepalive(sock->sk);
+
+	if (use_for_data) {
+		if (drbd_keepidle)
+			tcp_sock_set_keepidle(sock->sk, drbd_keepidle);
+		if (drbd_keepcnt)
+			tcp_sock_set_keepcnt(sock->sk, drbd_keepcnt);
+		if (drbd_keepintvl)
+			tcp_sock_set_keepintvl(sock->sk, drbd_keepintvl);
+	}
+	flow->sock = sock;
+}
+
+static void dtl_set_socket_callbacks(struct dtl_transport *dtl_transport, struct dtl_flow *flow)
+{
+	bool use_for_data = flow->stream_nr == DATA_STREAM;
+	struct socket *sock = flow->sock;
+
+	write_lock_bh(&sock->sk->sk_callback_lock);
+	if (sock->sk->sk_data_ready != dtl_data_ready &&
+	    sock->sk->sk_data_ready != dtl_control_data_ready) {
+		sock->sk->sk_user_data = flow;
+		flow->original_sk_data_ready = sock->sk->sk_data_ready;
+		if (use_for_data) {
+			flow->original_sk_write_space = sock->sk->sk_write_space;
+			sock->sk->sk_data_ready = dtl_data_ready;
+			sock->sk->sk_write_space = dtl_write_space;
+		} else {
+			flow->original_sk_state_change = sock->sk->sk_state_change;
+			sock->sk->sk_data_ready = dtl_control_data_ready;
+			sock->sk->sk_state_change = dtl_control_state_change;
+		}
+	}
+	write_unlock_bh(&sock->sk->sk_callback_lock);
+}
+
+static void dtl_do_first_packet(struct dtl_transport *dtl_transport, struct dtl_path *path,
+				struct socket *s)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	int fp;
+
+	fp = dtl_receive_first_packet(dtl_transport, path, s);
+
+	dtl_socket_ok_or_free(transport, &path->flow[DATA_STREAM].sock);
+	dtl_socket_ok_or_free(transport, &path->flow[CONTROL_STREAM].sock);
+
+	switch (fp) {
+	case P_INITIAL_DATA:
+		if (path->flow[DATA_STREAM].sock)
+			tr_warn(transport, "initial packet S crossed\n");
+		dtl_socket_free(transport, &path->flow[DATA_STREAM].sock);
+		dtl_setup_socket(dtl_transport, s, &path->flow[DATA_STREAM]);
+		break;
+	case P_INITIAL_META:
+		if (path->flow[CONTROL_STREAM].sock)
+			tr_warn(transport, "initial packet M crossed\n");
+		dtl_socket_free(transport, &path->flow[CONTROL_STREAM].sock);
+		dtl_setup_socket(dtl_transport, s, &path->flow[CONTROL_STREAM]);
+		break;
+	default:
+		tr_warn(transport, "Error receiving initial packet. err = %d\n", fp);
+		kernel_sock_shutdown(s, SHUT_RDWR);
+		sock_release(s);
+		return;
+	}
+
+	if (dtl_path_established(transport, path)) {
+		if (dtl_transport->connected_paths == 1 && fp == P_INITIAL_META)
+			set_bit(RESOLVE_CONFLICTS, &transport->flags);
+	} else {
+		/* successful accept, not yet both -> speed up next connect attempt */
+		if (test_bit(DTL_CONNECTING, &dtl_transport->flags))
+			mod_delayed_work(system_wq, &dtl_transport->connect_work, 1);
+	}
+
+	if (!dtl_transport->err && fp < 0)
+		dtl_transport->err = fp;
+
+	wake_up_all(&dtl_transport->connected_paths_change);
+}
+
+static void dtl_accept_work_fn(struct work_struct *work)
+{
+	struct dtl_listener *listener = container_of(work, struct dtl_listener, accept_work);
+	struct dtl_transport *dtl_transport;
+	struct drbd_path *drbd_path;
+	struct dtl_path *path;
+	struct socket *s;
+	int err, tries = 5;
+
+	while (listener->listener.pending_accepts && tries > 0) {
+		struct sockaddr_storage peer_addr;
+
+		s = NULL;
+		err = kernel_accept(listener->s_listen, &s, O_NONBLOCK);
+
+		tries--;
+		if (err || !s)
+			continue;
+
+		unregister_state_change(s->sk, listener);
+		s->ops->getname(s, (struct sockaddr *)&peer_addr, 2);
+
+		spin_lock_bh(&listener->listener.waiters_lock);
+		listener->listener.pending_accepts--;
+		drbd_path = drbd_find_path_by_addr(&listener->listener, &peer_addr);
+		if (drbd_path)
+			kref_get(&drbd_path->kref);
+		spin_unlock_bh(&listener->listener.waiters_lock);
+
+		if (!drbd_path) {
+			switch (peer_addr.ss_family) {
+				struct sockaddr_in6 *from_sin6;
+				struct sockaddr_in *from_sin;
+
+			case AF_INET6:
+				from_sin6 = (struct sockaddr_in6 *)&peer_addr;
+				pr_notice("drbd: Closing unexpected connection from %pI6\n",
+					  &from_sin6->sin6_addr);
+				break;
+			default:
+				from_sin = (struct sockaddr_in *)&peer_addr;
+				pr_notice("drbd: Closing unexpected connection from %pI4\n",
+					  &from_sin->sin_addr);
+				break;
+			}
+			kernel_sock_shutdown(s, SHUT_RDWR);
+			sock_release(s);
+			continue;
+		}
+
+		path = container_of(drbd_path, struct dtl_path, path);
+		dtl_transport = container_of(path->path.transport, struct dtl_transport, transport);
+
+		/* Do not add sockets to a path after DTL_CONNECTING was cleared! */
+		if (test_bit(DTL_CONNECTING, &dtl_transport->flags)) {
+			dtl_do_first_packet(dtl_transport, path, s);
+		} else {
+			kernel_sock_shutdown(s, SHUT_RDWR);
+			sock_release(s);
+		}
+		kref_put(&drbd_path->kref, drbd_destroy_path);
+	}
+	kref_put(&listener->listener.kref, drbd_listener_destroy);
+}
+
+static void dtl_connect_work_fn(struct work_struct *work)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(work, struct dtl_transport, connect_work.work);
+	struct drbd_transport *transport = &dtl_transport->transport;
+	int connected_paths = dtl_transport->connected_paths;
+	int err, nr_paths = 0, to_connect = 0, err_ret = 0;
+	struct drbd_path *drbd_path;
+
+	for_each_path_ref(drbd_path, transport) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct socket *s = NULL;
+		bool use_for_data;
+
+		nr_paths++;
+		if (_dtl_path_established(transport, path))
+			continue;
+
+		to_connect++;
+		err = dtl_try_connect(transport, path, &s);
+		if (err < 0) {
+			if (err != -EAGAIN && err != -EADDRNOTAVAIL && !err_ret)
+				err_ret = err;
+			continue;
+		}
+
+		dtl_socket_ok_or_free(transport, &path->flow[DATA_STREAM].sock);
+		dtl_socket_ok_or_free(transport, &path->flow[CONTROL_STREAM].sock);
+
+		if (!path->flow[DATA_STREAM].sock && !path->flow[CONTROL_STREAM].sock) {
+			use_for_data = dtl_path_cmp_addr(path);
+		} else if (!path->flow[DATA_STREAM].sock) {
+			use_for_data = true;
+		} else {
+			if (path->flow[CONTROL_STREAM].sock) {
+				tr_err(transport, "Logic error in conn_connect()\n");
+				dtl_socket_free(transport, &s);
+				continue;
+			}
+			use_for_data = false;
+		}
+
+		if (use_for_data) {
+			struct dtl_flow tmp_flow = path->flow[DATA_STREAM];
+
+			tmp_flow.sock = s;
+			err = dtl_send_first_packet(dtl_transport, &tmp_flow, P_INITIAL_DATA);
+			dtl_setup_socket(dtl_transport, s, &path->flow[DATA_STREAM]);
+
+		} else {
+			struct dtl_flow tmp_flow = path->flow[CONTROL_STREAM];
+
+			tmp_flow.sock = s;
+			err = dtl_send_first_packet(dtl_transport, &tmp_flow, P_INITIAL_META);
+			dtl_setup_socket(dtl_transport, s, &path->flow[CONTROL_STREAM]);
+		}
+
+		if (dtl_path_established(transport, path)) {
+			if (dtl_transport->connected_paths == 1 && !use_for_data)
+				clear_bit(RESOLVE_CONFLICTS, &transport->flags);
+		}
+	}
+
+	if (to_connect && test_bit(DTL_CONNECTING, &dtl_transport->flags)) {
+		struct net_conf *nc;
+		int connect_int = HZ;
+
+		rcu_read_lock();
+		nc = rcu_dereference(transport->net_conf);
+		if (nc)
+			connect_int = nc->connect_int;
+		rcu_read_unlock();
+
+		schedule_delayed_work(&dtl_transport->connect_work, connect_int * HZ);
+	}
+
+	if (nr_paths == to_connect && err_ret && !dtl_transport->err)
+		dtl_transport->err = err_ret;
+
+	if (connected_paths != dtl_transport->connected_paths || err_ret)
+		wake_up_all(&dtl_transport->connected_paths_change);
+}
+
+static int dtl_path_adjust_listener(struct dtl_path *path, bool active)
+{
+	struct drbd_path *drbd_path = &path->path;
+	struct drbd_listener *listener = READ_ONCE(drbd_path->listener);
+	int err = 0;
+
+	if (!active && listener)
+		drbd_put_listener(drbd_path);
+	else if (active && !listener)
+		err = drbd_get_listener(drbd_path);
+
+	return err;
+}
+
+static int dtl_set_active(struct drbd_transport *transport, bool active)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct drbd_path *drbd_path;
+
+	if (active)
+		set_bit(DTL_CONNECTING, &dtl_transport->flags);
+	else
+		clear_bit(DTL_CONNECTING, &dtl_transport->flags);
+
+	for_each_path_ref(drbd_path, transport) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		enum drbd_stream i;
+		int err;
+
+		for (i = DATA_STREAM; i <= CONTROL_STREAM; i++) {
+			if (path->flow[i].sock && path->flow[i].original_sk_state_change) {
+				write_lock_bh(&path->flow[i].sock->sk->sk_callback_lock);
+				path->flow[i].sock->sk->sk_state_change =
+					path->flow[i].original_sk_state_change;
+				write_unlock_bh(&path->flow[i].sock->sk->sk_callback_lock);
+			}
+
+			dtl_socket_free(transport, &path->flow[i].sock);
+		}
+
+		err = dtl_path_adjust_listener(path, active);
+
+		if (err) {
+			kref_put(&drbd_path->kref, drbd_destroy_path);
+			return err;
+		}
+	}
+	return 0;
+}
+
+static int dtl_prepare_connect(struct drbd_transport *transport)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+
+	dtl_transport->connected_paths = 0;
+	dtl_transport->err = 0;
+	flush_signals(current);
+	timer_delete_sync(&dtl_transport->control_timer);
+	dtl_transport->err = dtl_set_active(transport, true);
+
+	return dtl_transport->err;
+}
+
+static int dtl_connect(struct drbd_transport *transport)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	int err;
+
+	schedule_work(&dtl_transport->connect_work.work);
+	err = wait_event_interruptible(dtl_transport->connected_paths_change,
+				       dtl_transport->connected_paths > 0);
+
+	if (err < 0)
+		dtl_transport->err = err;
+
+	return dtl_transport->err;
+}
+
+static void dtl_finish_connect(struct drbd_transport *transport)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	bool lb = test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags);
+	enum drbd_stream i;
+
+	if (dtl_transport->err) {
+		dtl_set_active(transport, false);
+		cancel_delayed_work_sync(&dtl_transport->connect_work);
+	}
+
+	for (i = DATA_STREAM; i <= CONTROL_STREAM; i++) {
+		dtl_transport->streams[i].send_sequence = 1;
+		dtl_transport->streams[i].recv_sequence = 0;
+		if (lb)
+			dtl_transport->streams[i].recv_flow = NULL;
+	}
+}
+
+static int dtl_net_conf_change(struct drbd_transport *transport, struct net_conf *new_net_conf)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct drbd_path *drbd_path;
+
+	if (new_net_conf->load_balance_paths)
+		__set_bit(DTL_LOAD_BALANCE, &dtl_transport->flags);
+
+	for_each_path_ref(drbd_path, transport) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct socket *data_sock = path->flow[DATA_STREAM].sock;
+		struct socket *control_sock = path->flow[CONTROL_STREAM].sock;
+
+		if (data_sock)
+			dtl_setbufsize(data_sock, new_net_conf->sndbuf_size,
+				       new_net_conf->rcvbuf_size);
+
+		if (control_sock)
+			dtl_setbufsize(control_sock, new_net_conf->sndbuf_size,
+				       new_net_conf->rcvbuf_size);
+	}
+
+	return 0;
+}
+
+static void dtl_set_rcvtimeo(struct drbd_transport *transport, enum drbd_stream st, long timeout)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct dtl_stream *stream = &dtl_transport->streams[st];
+	struct drbd_path *drbd_path;
+
+	stream->rcvtimeo = timeout;
+	for_each_path_ref(drbd_path, transport) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct socket *sock = path->flow[st].sock;
+
+		if (!sock)
+			continue;
+
+		sock->sk->sk_rcvtimeo = timeout;
+
+		if (st == CONTROL_STREAM)
+			mod_timer(&dtl_transport->control_timer, jiffies + timeout);
+	}
+}
+
+static long dtl_get_rcvtimeo(struct drbd_transport *transport, enum drbd_stream st)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct dtl_stream *stream = &dtl_transport->streams[st];
+
+	return stream->rcvtimeo;
+}
+
+static bool dtl_stream_ok(struct drbd_transport *transport, enum drbd_stream stream)
+{
+	struct drbd_path *drbd_path;
+	bool established = false;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(drbd_path, &transport->paths, list) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct socket *sock = path->flow[stream].sock;
+
+		established = sock && sock->sk && sock->sk->sk_state == TCP_ESTABLISHED;
+		if (established)
+			break;
+	}
+	rcu_read_unlock();
+
+	return established;
+}
+
+static void dtl_write_space(struct sock *sk)
+{
+	struct dtl_flow *flow = sk->sk_user_data;
+	struct dtl_path *path = container_of(flow, struct dtl_path, flow[flow->stream_nr]);
+	struct dtl_transport *dtl_transport =
+		container_of(path->path.transport, struct dtl_transport, transport);
+
+	flow->original_sk_write_space(sk);
+	wake_up(&dtl_transport->write_space);
+}
+
+static int dtl_select_send_flow_cond(struct dtl_transport *dtl_transport,
+			      enum drbd_stream st, struct dtl_flow **result)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	int best_wmem = INT_MAX;
+	struct drbd_path *drbd_path;
+	struct dtl_flow *best = NULL;
+	bool empty;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(drbd_path, &transport->paths, list) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct dtl_flow *flow = &path->flow[st];
+
+		if (!test_bit(TR_ESTABLISHED, &drbd_path->flags))
+			continue;
+
+		if (flow->sock) {
+			struct sock *sk = flow->sock->sk;
+			int wmem = sk_stream_min_wspace(sk);
+			/* int wmem_queued = READ_ONCE(sk->sk_wmem_queued); */
+
+			if (st == DATA_STREAM) {
+				if (wmem < best_wmem && wmem < sk->sk_sndbuf) {
+					best = flow;
+					best_wmem = wmem;
+				}
+			} else {
+				if (wmem < sk->sk_sndbuf)
+					best = flow;
+				/* Only use first established control flow. */
+				break;
+			}
+		}
+	}
+	empty = list_empty(&transport->paths);
+	rcu_read_unlock();
+
+	if (!best) {
+		if (empty)
+			return -ENOTCONN;
+
+		set_bit(NET_CONGESTED, &dtl_transport->transport.flags);
+		return -EAGAIN;
+	}
+	clear_bit(NET_CONGESTED, &dtl_transport->transport.flags);
+
+	*result = best;
+	return 0;
+}
+
+static int dtl_select_send_flow(struct dtl_transport *dtl_transport,
+				enum drbd_stream st, struct dtl_flow **result)
+{
+	struct drbd_transport *transport = &dtl_transport->transport;
+	struct net_conf *nc;
+	long rem, timeout = HZ;
+	int err;
+
+	rcu_read_lock();
+	nc = rcu_dereference(transport->net_conf);
+	if (nc)
+		timeout = nc->timeout * HZ / 10;
+	rcu_read_unlock();
+
+	rem = wait_event_interruptible_timeout(dtl_transport->write_space,
+		(err = dtl_select_send_flow_cond(dtl_transport, st, result)) != -EAGAIN,
+		timeout);
+
+	return rem < 0 ? rem : err;
+}
+
+static int _dtl_send_page(struct dtl_transport *dtl_transport, struct dtl_flow *flow,
+			  struct page *page, int offset, size_t size, unsigned int msg_flags)
+{
+	struct msghdr msg = { .msg_flags = msg_flags | MSG_NOSIGNAL | MSG_SPLICE_PAGES };
+	struct drbd_transport *transport = &dtl_transport->transport;
+	struct socket *sock = flow->sock;
+	struct bio_vec bvec;
+	int len = size;
+	int err = -EIO;
+
+	do {
+		int sent;
+
+		bvec_set_page(&bvec, page, len, offset);
+		iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, len);
+
+		sent = sock_sendmsg(sock, &msg);
+		if (sent <= 0) {
+			if (sent == -EAGAIN) {
+				if (drbd_stream_send_timed_out(transport, flow->stream_nr))
+					break;
+				continue;
+			}
+			tr_warn(transport, "%s: size=%d len=%d sent=%d\n",
+			     __func__, (int)size, len, sent);
+			if (sent < 0)
+				err = sent;
+			break;
+		}
+		len    -= sent;
+		offset += sent;
+		/* NOTE: it may take up to twice the socket timeout to have it
+		 * return -EAGAIN, the first timeout will likely happen with a
+		 * partial send, masking the timeout.  Maybe we want to export
+		 * drbd_stream_should_continue_after_partial_send(transport, stream)
+		 * and add that to the while() condition below.
+		 */
+	} while (len > 0 /* THINK && peer_device->repl_state[NOW] >= L_ESTABLISHED */);
+
+	if (len == 0)
+		err = 0;
+
+	return err;
+}
+
+static int dtl_send_page(struct drbd_transport *transport, enum drbd_stream stream,
+			 struct page *page, int offset, size_t size, unsigned int msg_flags)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct dtl_header header;
+	struct dtl_flow *flow;
+	int err;
+
+	err = dtl_select_send_flow(dtl_transport, stream, &flow);
+	if (err)
+		return err;
+
+	if (test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags)) {
+		header.sequence = cpu_to_be32(dtl_transport->streams[stream].send_sequence++);
+		header.bytes = cpu_to_be32(size);
+
+		err = _dtl_send(dtl_transport, flow, &header, sizeof(header), msg_flags | MSG_MORE);
+		if (err < 0)
+			goto out;
+	}
+	err = _dtl_send_page(dtl_transport, flow, page, offset, size, msg_flags);
+
+out:
+	return err;
+}
+
+static int dtl_bio_chunk_size_available(struct bio *bio, int wmem_available,
+		struct bvec_iter *iter_scan)
+{
+	struct bio_vec bvec;
+	int chunk = 0;
+
+	while (chunk < wmem_available && iter_scan->bi_size) {
+		bvec = bio_iter_iovec(bio, *iter_scan);
+		chunk += bvec.bv_len;
+		bio_advance_iter_single(bio, iter_scan, bvec.bv_len);
+	}
+
+	return chunk;
+}
+
+static int dtl_send_bio_pages(struct dtl_transport *dtl_transport, struct dtl_flow *flow,
+		struct bio *bio, struct bvec_iter *iter, int chunk)
+{
+	struct bio_vec bvec;
+
+	while (chunk > 0 && iter->bi_size) {
+		int err;
+
+		bvec = bio_iter_iovec(bio, *iter);
+		err = _dtl_send_page(dtl_transport, flow, bvec.bv_page,
+				bvec.bv_offset, bvec.bv_len,
+				bio_iter_last(bvec, *iter) ? 0 : MSG_MORE);
+		if (err)
+			return err;
+		chunk -= bvec.bv_len;
+		bio_advance_iter_single(bio, iter, bvec.bv_len);
+	}
+
+	return 0;
+}
+
+static int dtl_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
+{
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct dtl_stream *stream = &dtl_transport->streams[DATA_STREAM];
+	bool lb = test_bit(DTL_LOAD_BALANCE, &dtl_transport->flags);
+	struct bvec_iter iter_scan = bio->bi_iter;
+	struct bvec_iter iter = bio->bi_iter;
+	int err;
+
+	if (!bio_has_data(bio)) /* e.g. REQ_OP_DISCARD */
+		return 0;
+
+	do {
+		struct dtl_flow *flow;
+		struct sock *sk;
+		int chunk, wmem_available;
+
+		err = dtl_select_send_flow(dtl_transport, DATA_STREAM, &flow);
+		if (err)
+			goto out;
+
+		sk = flow->sock->sk;
+		wmem_available = READ_ONCE(sk->sk_sndbuf) - READ_ONCE(sk->sk_wmem_queued);
+
+		if (lb && iter.bi_size > wmem_available) {
+			chunk = dtl_bio_chunk_size_available(bio, wmem_available, &iter_scan);
+		} else {
+			chunk = iter.bi_size;
+		}
+
+		if (lb) {
+			struct dtl_header header;
+
+			header.sequence = cpu_to_be32(stream->send_sequence++);
+			header.bytes = cpu_to_be32(chunk);
+			err = _dtl_send(dtl_transport, flow, &header, sizeof(header), MSG_MORE);
+			if (err < 0)
+				goto out;
+		}
+
+		err = dtl_send_bio_pages(dtl_transport, flow, bio, &iter, chunk);
+		if (err)
+			goto out;
+	} while (iter.bi_size);
+out:
+	return err;
+}
+
+static bool dtl_hint(struct drbd_transport *transport, enum drbd_stream stream,
+		enum drbd_tr_hints hint)
+{
+	struct drbd_path *drbd_path;
+
+	for_each_path_ref(drbd_path, transport) {
+		struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+		struct socket *sock = path->flow[stream].sock;
+
+		if (!sock)
+			continue;
+
+		switch (hint) {
+		case CORK:
+			tcp_sock_set_cork(sock->sk, true);
+			break;
+		case UNCORK:
+			tcp_sock_set_cork(sock->sk, false);
+			break;
+		case NODELAY:
+			tcp_sock_set_nodelay(sock->sk);
+			break;
+		case NOSPACE:
+			if (sock->sk->sk_socket)
+				set_bit(SOCK_NOSPACE, &sock->sk->sk_socket->flags);
+			break;
+		case QUICKACK:
+			tcp_sock_set_quickack(sock->sk, 2);
+			break;
+		}
+	}
+
+	return true;
+}
+
+static void dtl_debugfs_show_stream(struct seq_file *m, struct socket *sock)
+{
+	struct sock *sk = sock->sk;
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	seq_printf(m, "unread receive buffer: %u Byte\n",
+		   tp->rcv_nxt - tp->copied_seq);
+	seq_printf(m, "unacked send buffer: %u Byte\n",
+		   tp->write_seq - tp->snd_una);
+	seq_printf(m, "send buffer size: %u Byte\n", sk->sk_sndbuf);
+	seq_printf(m, "send buffer used: %u Byte\n", sk->sk_wmem_queued);
+}
+
+static void dtl_debugfs_show(struct drbd_transport *transport, struct seq_file *m)
+{
+	struct drbd_path *drbd_path;
+
+	/* BUMP me if you change the file format/content/presentation */
+	seq_printf(m, "v: %u\n\n", 0);
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(drbd_path, &transport->paths, list) {
+		enum drbd_stream i;
+
+		seq_printf(m, "%pISpc - %pISpc:\n",
+			   &drbd_path->my_addr,
+			   &drbd_path->peer_addr);
+
+		for (i = DATA_STREAM; i <= CONTROL_STREAM ; i++) {
+			struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+			struct socket *sock = path->flow[i].sock;
+
+			if (!sock)
+				continue;
+			seq_printf(m, "%s stream\n", i == DATA_STREAM ? "data" : "control");
+			dtl_debugfs_show_stream(m, sock);
+		}
+		seq_puts(m, "\n");
+	}
+	rcu_read_unlock();
+}
+
+static int dtl_add_path(struct drbd_path *drbd_path)
+{
+	struct drbd_transport *transport = drbd_path->transport;
+	struct dtl_transport *dtl_transport =
+		container_of(transport, struct dtl_transport, transport);
+	struct dtl_path *path = container_of(drbd_path, struct dtl_path, path);
+	bool active = test_bit(DTL_CONNECTING, &dtl_transport->flags);
+	enum drbd_stream i;
+
+	for (i = DATA_STREAM; i <= CONTROL_STREAM ; i++)
+		path->flow[i].stream_nr = i;
+
+	clear_bit(TR_ESTABLISHED, &drbd_path->flags);
+
+	return dtl_path_adjust_listener(path, active);
+}
+
+static bool dtl_may_remove_path(struct drbd_path *drbd_path)
+{
+	return !test_bit(TR_ESTABLISHED, &drbd_path->flags);
+}
+
+static void dtl_remove_path(struct drbd_path *drbd_path)
+{
+	drbd_put_listener(drbd_path);
+}
+
+static int __init dtl_initialize(void)
+{
+	return drbd_register_transport_class(&dtl_transport_class,
+					     DRBD_TRANSPORT_API_VERSION,
+					     sizeof(struct drbd_transport));
+}
+
+static void __exit dtl_cleanup(void)
+{
+	drbd_unregister_transport_class(&dtl_transport_class);
+}
+
+module_init(dtl_initialize)
+module_exit(dtl_cleanup)
-- 
2.53.0

