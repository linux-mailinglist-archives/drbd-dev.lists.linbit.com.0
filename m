Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLQ5D10Hx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:40:29 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 11F0934C076
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:40:29 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BCBE816313C;
	Fri, 27 Mar 2026 23:40:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C2AC11630D7
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:38:54 +0100 (CET)
Received: by mail-wr1-f52.google.com with SMTP id
	ffacd0b85a97d-439b97a8a8cso2632868f8f.1
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651134;
	x=1775255934; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=f8kGJT+PX/v6FfB6tXPwBVdQICjIFXaurNYHjxAWpMc=;
	b=Hojl5m00gGkDYrx2FuYayt06ftjqaPCrfMiugcGWCiJwFgYh30K8gz1Jyk4XhsPx7i
	8EEfdY9Ka5gy4HQbMII1dltB7YjpS6UsqfxvZmfwjU500SiSNHHKYysvetZhFlSmIlMa
	M0vH+v0uU1w05cDVv/FYjVVUxonDsN04Y8jXYbXzlh/YHX/ugsWL3Y/CQIx3fQMnTydQ
	+LWIc2Aq61ylZWmFyXEQaF7sHoDQLInWf2936lZRD7P8t2xz/bHRzIo/2scKIfw3VZ+y
	V5s4hxxUTinbPFbQavKSmbPusbxPr9lwr0AMb1wGZR0HDTyzSxsycg544pUcZcoPmz1P
	XykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651134; x=1775255934;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=f8kGJT+PX/v6FfB6tXPwBVdQICjIFXaurNYHjxAWpMc=;
	b=jNKq073HeY7nj4dmeTMQ7pR6/uiRVYn99oB9JgTmQkirz3zfQDt3kJv5xqMNeQzsVF
	Y3m+/WnLB3ryuqLN1hOwrkXmuF+7lHRcc6/oeWyYAEOiVe8JwAbLZSs/lhadcfdET+ob
	Dt/vQ0plvua/rvEemoQ7kWIyetlLPNPe6xJnmLfjUralk4vUC2s5c0keoYaOCzVEnMU9
	pBvTvyzTOo36rfTi6BaDZR8iEzhJJ2MK31SMP3g86Q6C84Hc13QbQqyB7IxqFN9ZvcC3
	q9ZDariH5CnUc7V186t58auIebvUnUMKx4Z1yKX3giIQ+4DvtO+FBN64uaqMViMUfvom
	SodA==
X-Gm-Message-State: AOJu0YzpnU/qW+LzwcjDmoBVpBFk5WP6/iZlleSu2gH1pvprlGmPzet1
	ZNPIboPJpFt5P8PDMoheJgihx+FjeM/5/8g0h2Aq9iuFK7suOjDRDEq+CJVPEQR4LPG1ak1nQ3r
	iAvfXNmc=
X-Gm-Gg: ATEYQzxgg6WXaW7aV0sQQpICOWUUnpzJCfOPMVbGTpu0w+VURZo+Y1Vs7v72ZOv2z+1
	nEflq8WR7n+VgFx28ZfdtqazWhZbytmBZD/U3iwW5Hx9j/1U3V4yBIYYytxcetY4J/bFgfC6rtW
	ISPrWhleNAjl/0gU8gGcoarZeDTxK6qraE/Ndvw5lnp+J6D3R9wLuRWDIqueOmwvE5qZZiCXG2r
	fM280Apy3P2Cw4cJC5HE5vwQPNB6Ax6TCULf0y498QU1hY4Tyysm97ZDRqKS6n4gF4qO/QCMiB7
	KB5H38VYWJ4j0oK3st8k9J+8qSsysUyy3l9fcHZlpQRo0cuQnktlDoYRxpERm7UDJ9HSZnM0Wvo
	sMXo+zcPGg0V3by0N/AddvYoT8HFznaMsVixDXDJKRJZ9ibx/UtXCxhb79mADS713Tbk5ZtTlwg
	pafnjy2WqWw4NI+jnW/NMLzwOgF1rvClsLWVfQ7ZJ6RsjDungpK47aUiTz7fEeBc/R0Qx75RSkG
	7a8ac4KiVQ+JQslsnKpWAlOsOuS0alI
X-Received: by 2002:a05:6000:430e:b0:43b:42e2:f4fc with SMTP id
	ffacd0b85a97d-43b9ea4a677mr6761038f8f.26.1774651134038; 
	Fri, 27 Mar 2026 15:38:54 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.38.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:38:52 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/20] drbd: introduce DRBD 9 on-disk metadata format
Date: Fri, 27 Mar 2026 23:38:03 +0100
Message-ID: <20260327223820.2244227-4-christoph.boehmwalder@linbit.com>
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
	NEURAL_HAM(-0.00)[-0.589];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 11F0934C076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new header that captures the DRBD 9 on-disk metadata layout,
enabling state tracking for mutiple peers.
It includes the per-device superblock and per-peer slot structures
needed to track bitmap UUIDs and sync state for each peer.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_meta_data.h | 126 ++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 drivers/block/drbd/drbd_meta_data.h

diff --git a/drivers/block/drbd/drbd_meta_data.h b/drivers/block/drbd/drbd_meta_data.h
new file mode 100644
index 000000000000..af77e8d53f02
--- /dev/null
+++ b/drivers/block/drbd/drbd_meta_data.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef DRBD_META_DATA_H
+#define DRBD_META_DATA_H
+
+/* how I came up with this magic?
+ * base64 decode "actlog==" ;) */
+#define DRBD_AL_MAGIC 0x69cb65a2
+
+#define BM_BLOCK_SHIFT_4k	12			 /* 4k per bit */
+#define BM_BLOCK_SHIFT_MIN	BM_BLOCK_SHIFT_4k
+#define BM_BLOCK_SHIFT_MAX	20
+#define BM_BLOCK_SIZE_4k	4096
+#define BM_BLOCK_SIZE_MIN	(1<<BM_BLOCK_SHIFT_MIN)
+#define BM_BLOCK_SIZE_MAX	(1<<BM_BLOCK_SHIFT_MAX)
+
+struct peer_dev_md_on_disk_9 {
+	__be64 bitmap_uuid;
+	__be64 bitmap_dagtag;
+	__be32 flags;
+	__be32 bitmap_index;
+	__be32 reserved_u32[2];
+} __packed;
+
+struct meta_data_on_disk_9 {
+	__be64 effective_size;    /* last agreed size */
+	__be64 current_uuid;
+	__be64 members;		  /* only if MDF_HAVE_MEMBERS_MASK is in the flags */
+	__be64 reserved_u64[3];   /* to have the magic at the same position as in v07, and v08 */
+	__be64 device_uuid;
+	__be32 flags;             /* MDF */
+	__be32 magic;
+	__be32 md_size_sect;
+	__be32 al_offset;         /* offset to this block */
+	__be32 al_nr_extents;     /* important for restoring the AL */
+	__be32 bm_offset;         /* offset to the bitmap, from here */
+	__be32 bm_bytes_per_bit;  /* BM_BLOCK_SIZE */
+	__be32 la_peer_max_bio_size;   /* last peer max_bio_size */
+	__be32 bm_max_peers;
+	__be32 node_id;
+
+	/* see al_tr_number_to_on_disk_sector() */
+	__be32 al_stripes;
+	__be32 al_stripe_size_4k;
+
+	__be32 reserved_u32[2];
+
+	struct peer_dev_md_on_disk_9 peers[DRBD_PEERS_MAX];
+	__be64 history_uuids[HISTORY_UUIDS];
+
+	unsigned char padding_start[0];
+	unsigned char padding_end[0] __aligned(4096);
+} __packed;
+
+/* Attention, these two are defined in drbd_int.h as well! */
+#define AL_UPDATES_PER_TRANSACTION 64
+#define AL_CONTEXT_PER_TRANSACTION 919
+
+enum al_transaction_types {
+	AL_TR_UPDATE = 0,
+	AL_TR_INITIALIZED = 0xffff
+};
+/* all fields on disc in big endian */
+struct __packed al_transaction_on_disk {
+	/* don't we all like magic */
+	__be32	magic;
+
+	/* to identify the most recent transaction block
+	 * in the on disk ring buffer */
+	__be32	tr_number;
+
+	/* checksum on the full 4k block, with this field set to 0. */
+	__be32	crc32c;
+
+	/* type of transaction, special transaction types like:
+	 * purge-all, set-all-idle, set-all-active, ... to-be-defined
+	 * see also enum al_transaction_types */
+	__be16	transaction_type;
+
+	/* we currently allow only a few thousand extents,
+	 * so 16bit will be enough for the slot number. */
+
+	/* how many updates in this transaction */
+	__be16	n_updates;
+
+	/* maximum slot number, "al-extents" in drbd.conf speak.
+	 * Having this in each transaction should make reconfiguration
+	 * of that parameter easier. */
+	__be16	context_size;
+
+	/* slot number the context starts with */
+	__be16	context_start_slot_nr;
+
+	/* Some reserved bytes.  Expected usage is a 64bit counter of
+	 * sectors-written since device creation, and other data generation tag
+	 * supporting usage */
+	__be32	__reserved[4];
+
+	/* --- 36 byte used --- */
+
+	/* Reserve space for up to AL_UPDATES_PER_TRANSACTION changes
+	 * in one transaction, then use the remaining byte in the 4k block for
+	 * context information.  "Flexible" number of updates per transaction
+	 * does not help, as we have to account for the case when all update
+	 * slots are used anyways, so it would only complicate code without
+	 * additional benefit.
+	 */
+	__be16	update_slot_nr[AL_UPDATES_PER_TRANSACTION];
+
+	/* but the extent number is 32bit, which at an extent size of 4 MiB
+	 * allows to cover device sizes of up to 2**54 Byte (16 PiB) */
+	__be32	update_extent_nr[AL_UPDATES_PER_TRANSACTION];
+
+	/* --- 420 bytes used (36 + 64*6) --- */
+
+	/* 4096 - 420 = 3676 = 919 * 4 */
+	__be32	context[AL_CONTEXT_PER_TRANSACTION];
+};
+
+#define DRBD_AL_PMEM_MAGIC 0x6aa667a6 /* "al==pmem" */
+
+struct __packed al_on_pmem {
+	__be32 magic;
+	__be32 slots[];
+};
+
+#endif
-- 
2.53.0

