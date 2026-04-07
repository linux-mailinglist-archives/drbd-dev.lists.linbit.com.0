Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOSQGW9A1Wk73gcAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 19:35:43 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id DCA533B26BA
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 19:35:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2631A16314C;
	Tue,  7 Apr 2026 19:35:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4C88163134
	for <drbd-dev@lists.linbit.com>; Tue,  7 Apr 2026 19:34:14 +0200 (CEST)
Received: by mail-wm1-f53.google.com with SMTP id
	5b1f17b1804b1-482f454be5bso1390935e9.0
	for <drbd-dev@lists.linbit.com>; Tue, 07 Apr 2026 10:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1775583254;
	x=1776188054; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=wDFphN3wEBZ2/j/hQ0KPwh3mjCyQF43Yq/fgsvMgTUc=;
	b=uPLOby5qkLLhc41MrpCOFomvn8e/SEaxqXGq4c04tY6ahTqqIWMA+GVpMU45FmaYqj
	bA3mK1XQEhJs4iw8n85Mdp1fJhoM7EZ46U4seP+prKfzZ7rzFii+MvtPLrhUJO/t8GPC
	zD2Oi/ZHvwKuCQwQMgEgevk1TDvOIvK46KGZAv4Wg65Rs2yJMqLG0/tBa/0GSGEyUC2Z
	oYiisOy3jF2+nMKyt0gI/Sf0hxjRnOqvaSwRs1Eoh6V+iYV9ay8UdsKzP6cpfAGeG/t8
	S/OVhmzuuq8bt/7YmykgZ3bmqdQZ0zuPrUwTpEZDPdRyE9Ofc+9zvno1071Fy49tN2VZ
	+3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775583254; x=1776188054;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=wDFphN3wEBZ2/j/hQ0KPwh3mjCyQF43Yq/fgsvMgTUc=;
	b=RxBsw1q149GoSns8dtseNjE6qTwNXagW+bw+Wl0kpAn+O3wlsBXHfIMNOaebE9FGWG
	SqTXaktC1lYbHvPZiL1NSCJM0Q9PJuqXE45nlQHHnW8zJ+izaZbnRl6ZVpylMO3pGdxg
	+rsaZwqIMr0CkOx8t6hBCg+FId42X7ghJ4Uo3EWOpvJ5Iic0lnch5PIhBwtu4GMdJ1Gt
	29UDGu+INCNVorwsPp850CJAGtBSffgS1ifJ0sBlOkKraePVKbwUZq3btv9RVx9+7QAG
	hI24gmaNd7FUXbu5IHAUAWIi7RklN/KlKAJDK9JMWC8FD3TFHlj67Xw4sEjXDKBKfWEP
	+mjw==
X-Gm-Message-State: AOJu0YyypreZwYd5sbPmeXXEvjLcgLNaxUofMMm0OTN/o0z0NAHlVYxf
	BgLZ1nT3DMYrNg9kdnLROm2I4t7LioJKzuQjJ/MDLJsME+NPWQxKLWOGigwMbZyavc/lMQ==
X-Gm-Gg: AeBDieudfr0e02gA3cziJgqX9jiLLJrS3WkN38i/oKN7WbjQtbkmcGp1xzaWDN6ALNw
	ujrITGRo0vlHdhNpLDQbTgJnIkoe1kJQhYrHIyNVHwmE8hb1/yxXR91EeGMPsuzjVJk9K1s6TTl
	sSy0azkJItcvDoneInWJ941U+kNNS9qNz2S5H3qSfZS8Yob+BioOXlZND3F4mTCM5BTqNG6CSI7
	9gzVzwLO2X5tm08DPOdfy97l6SH5YbjxlA7L19VxN4pSkxulKQGr8Z36AjjyJUeWuCN7GQpRJka
	cPf/Sp1h9FEaZ1n49ftPtEp1E3fDttWZ+RGQ3zvcp/hOixz8YL4zfGbMHpEBGHVI+sEKuQXXk/j
	sk1Dql+m+1gl/K5iliVX4NtdD8vps+OjJ7QyrYh6MCwttyOuuey7mPjdHaElcUhklTO9FaoCEUA
	J55kt6fhnesBHxql5xq7VAjp8xs4MYm5KQFkELwpdyoDWDjwx00XPlIiyYI2Y0CQ8kDEL5IGRlr
	siBm1yGiIfibrWPjNqVsA==
X-Received: by 2002:a05:600c:354b:b0:486:fe83:861c with SMTP id
	5b1f17b1804b1-4889947fd78mr235801885e9.7.1775583253782; 
	Tue, 07 Apr 2026 10:34:13 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-488c4e930c7sm6667275e9.6.2026.04.07.10.34.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2026 10:34:13 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/4] drbd: add YNL genetlink specification
Date: Tue,  7 Apr 2026 19:33:55 +0200
Message-ID: <20260407173356.873887-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:email,linbit.com:mid]
X-Rspamd-Queue-Id: DCA533B26BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a YNL-conformant YAML spec for the DRBD genetlink interface.

This uses the genetlink-legacy schema since DRBD has a fixed protocol
header (drbd_genlmsghdr) and pre-existing conventions that userspace
depends on.

s32 fields (meta-dev-idx, resync-after) use nla-policy-type: u32 to
preserve wire compatibility with existing userspace; the original spec
predates kernel NLA_S32 support.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 Documentation/netlink/specs/drbd.yaml | 1109 +++++++++++++++++++++++++
 include/uapi/linux/drbd.h             |    3 +
 2 files changed, 1112 insertions(+)
 create mode 100644 Documentation/netlink/specs/drbd.yaml

diff --git a/Documentation/netlink/specs/drbd.yaml b/Documentation/netlink/specs/drbd.yaml
new file mode 100644
index 000000000000..d5de2a4506e0
--- /dev/null
+++ b/Documentation/netlink/specs/drbd.yaml
@@ -0,0 +1,1109 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+name: drbd
+protocol: genetlink-legacy
+uapi-header: linux/drbd_genl.h
+kernel-family:
+  emit-structs: true
+doc: |
+  DRBD genetlink protocol for configuring and monitoring replication resources,
+  devices, and connections.
+
+definitions:
+  - name: shared-secret-max
+    type: const
+    header: linux/drbd.h
+  - name: drbd-cpu-mask-size
+    type: const
+    header: linux/drbd.h
+  - name: drbd-nl-uuids-size
+    type: const
+    header: linux/drbd.h
+  - name: drbd-nl-history-uuids-size
+    type: const
+    header: linux/drbd.h
+  - name: drbd-minor-count-max
+    type: const
+    header: linux/drbd_limits.h
+
+attribute-sets:
+  -
+    name: drbd
+    name-prefix: drbd-nla-
+    doc: Top-level DRBD attribute space (all TLAs are nested).
+    attributes:
+      - name: cfg-reply
+        type: nest
+        value: 1
+        nested-attributes: drbd-cfg-reply
+      - name: cfg-context
+        type: nest
+        value: 2
+        nested-attributes: drbd-cfg-context
+      - name: disk-conf
+        type: nest
+        value: 3
+        nested-attributes: disk-conf
+      - name: resource-opts
+        type: nest
+        value: 4
+        nested-attributes: res-opts
+      - name: net-conf
+        type: nest
+        value: 5
+        nested-attributes: net-conf
+      - name: set-role-parms
+        type: nest
+        value: 6
+        nested-attributes: set-role-parms
+      - name: resize-parms
+        type: nest
+        value: 7
+        nested-attributes: resize-parms
+      - name: state-info
+        type: nest
+        value: 8
+        nested-attributes: state-info
+      - name: start-ov-parms
+        type: nest
+        value: 9
+        nested-attributes: start-ov-parms
+      - name: new-c-uuid-parms
+        type: nest
+        value: 10
+        nested-attributes: new-c-uuid-parms
+      - name: timeout-parms
+        type: nest
+        value: 11
+        nested-attributes: timeout-parms
+      - name: disconnect-parms
+        type: nest
+        value: 12
+        nested-attributes: disconnect-parms
+      - name: detach-parms
+        type: nest
+        value: 13
+        nested-attributes: detach-parms
+      - name: resource-info
+        type: nest
+        value: 15
+        nested-attributes: resource-info
+      - name: device-info
+        type: nest
+        value: 16
+        nested-attributes: device-info
+      - name: connection-info
+        type: nest
+        value: 17
+        nested-attributes: connection-info
+      - name: peer-device-info
+        type: nest
+        value: 18
+        nested-attributes: peer-device-info
+      - name: resource-statistics
+        type: nest
+        value: 19
+        nested-attributes: resource-statistics
+      - name: device-statistics
+        type: nest
+        value: 20
+        nested-attributes: device-statistics
+      - name: connection-statistics
+        type: nest
+        value: 21
+        nested-attributes: connection-statistics
+      - name: peer-device-statistics
+        type: nest
+        value: 22
+        nested-attributes: peer-device-statistics
+      - name: notification-header
+        type: nest
+        value: 23
+        nested-attributes: drbd-notification-header
+      - name: helper
+        type: nest
+        value: 24
+        nested-attributes: drbd-helper-info
+  -
+    name: drbd-cfg-reply
+    attributes:
+      - name: info-text
+        type: string
+        value: 1
+  -
+    name: drbd-cfg-context
+    attributes:
+      - name: ctx-volume
+        type: u32
+        value: 1
+      - name: ctx-resource-name
+        type: string
+        value: 2
+        checks:
+          max-len: 128
+      - name: ctx-my-addr
+        type: binary
+        value: 3
+        checks:
+          max-len: 128
+      - name: ctx-peer-addr
+        type: binary
+        value: 4
+        checks:
+          max-len: 128
+  -
+    name: disk-conf
+    attributes:
+      - name: backing-dev
+        type: string
+        value: 1
+        required: true
+        checks:
+          max-len: 128
+      - name: meta-dev
+        type: string
+        value: 2
+        required: true
+        checks:
+          max-len: 128
+      - name: meta-dev-idx
+        type: s32
+        value: 3
+        required: true
+        nla-policy-type: u32
+      - name: disk-size
+        type: u64
+        value: 4
+      - name: max-bio-bvecs
+        type: u32
+        value: 5
+      - name: on-io-error
+        type: u32
+        value: 6
+        default: DRBD_ON_IO_ERROR_DEF
+      - name: fencing
+        type: u32
+        value: 7
+        default: DRBD_FENCING_DEF
+      - name: resync-rate
+        type: u32
+        value: 8
+        default: DRBD_RESYNC_RATE_DEF
+      - name: resync-after
+        type: s32
+        value: 9
+        default: DRBD_MINOR_NUMBER_DEF
+        nla-policy-type: u32
+      - name: al-extents
+        type: u32
+        value: 10
+        default: DRBD_AL_EXTENTS_DEF
+      - name: c-plan-ahead
+        type: u32
+        value: 11
+        default: DRBD_C_PLAN_AHEAD_DEF
+      - name: c-delay-target
+        type: u32
+        value: 12
+        default: DRBD_C_DELAY_TARGET_DEF
+      - name: c-fill-target
+        type: u32
+        value: 13
+        default: DRBD_C_FILL_TARGET_DEF
+      - name: c-max-rate
+        type: u32
+        value: 14
+        default: DRBD_C_MAX_RATE_DEF
+      - name: c-min-rate
+        type: u32
+        value: 15
+        default: DRBD_C_MIN_RATE_DEF
+      - name: disk-barrier
+        type: u8
+        value: 16
+        default: DRBD_DISK_BARRIER_DEF
+      - name: disk-flushes
+        type: u8
+        value: 17
+        default: DRBD_DISK_FLUSHES_DEF
+      - name: disk-drain
+        type: u8
+        value: 18
+        default: DRBD_DISK_DRAIN_DEF
+      - name: md-flushes
+        type: u8
+        value: 19
+        default: DRBD_MD_FLUSHES_DEF
+      - name: disk-timeout
+        type: u32
+        value: 20
+        default: DRBD_DISK_TIMEOUT_DEF
+      - name: read-balancing
+        type: u32
+        value: 21
+        default: DRBD_READ_BALANCING_DEF
+      - name: al-updates
+        type: u8
+        value: 23
+        default: DRBD_AL_UPDATES_DEF
+      - name: discard-zeroes-if-aligned
+        type: u8
+        value: 24
+        default: DRBD_DISCARD_ZEROES_IF_ALIGNED_DEF
+      - name: rs-discard-granularity
+        type: u32
+        value: 25
+        default: DRBD_RS_DISCARD_GRANULARITY_DEF
+      - name: disable-write-same
+        type: u8
+        value: 26
+        default: DRBD_DISABLE_WRITE_SAME_DEF
+  -
+    name: res-opts
+    attributes:
+      - name: cpu-mask
+        type: string
+        value: 1
+        default: ""
+        checks:
+          max-len: DRBD_CPU_MASK_SIZE
+      - name: on-no-data
+        type: u32
+        value: 2
+        default: DRBD_ON_NO_DATA_DEF
+  -
+    name: net-conf
+    attributes:
+      - name: shared-secret
+        type: string
+        value: 1
+        default: ""
+        checks:
+          max-len: SHARED_SECRET_MAX
+      - name: cram-hmac-alg
+        type: string
+        value: 2
+        default: ""
+        checks:
+          max-len: SHARED_SECRET_MAX
+      - name: integrity-alg
+        type: string
+        value: 3
+        default: ""
+        checks:
+          max-len: SHARED_SECRET_MAX
+      - name: verify-alg
+        type: string
+        value: 4
+        default: ""
+        checks:
+          max-len: SHARED_SECRET_MAX
+      - name: csums-alg
+        type: string
+        value: 5
+        default: ""
+        checks:
+          max-len: SHARED_SECRET_MAX
+      - name: wire-protocol
+        type: u32
+        value: 6
+        default: DRBD_PROTOCOL_DEF
+      - name: connect-int
+        type: u32
+        value: 7
+        default: DRBD_CONNECT_INT_DEF
+      - name: timeout
+        type: u32
+        value: 8
+        default: DRBD_TIMEOUT_DEF
+      - name: ping-int
+        type: u32
+        value: 9
+        default: DRBD_PING_INT_DEF
+      - name: ping-timeo
+        type: u32
+        value: 10
+        default: DRBD_PING_TIMEO_DEF
+      - name: sndbuf-size
+        type: u32
+        value: 11
+        default: DRBD_SNDBUF_SIZE_DEF
+      - name: rcvbuf-size
+        type: u32
+        value: 12
+        default: DRBD_RCVBUF_SIZE_DEF
+      - name: ko-count
+        type: u32
+        value: 13
+        default: DRBD_KO_COUNT_DEF
+      - name: max-buffers
+        type: u32
+        value: 14
+        default: DRBD_MAX_BUFFERS_DEF
+      - name: max-epoch-size
+        type: u32
+        value: 15
+        default: DRBD_MAX_EPOCH_SIZE_DEF
+      - name: unplug-watermark
+        type: u32
+        value: 16
+        default: DRBD_UNPLUG_WATERMARK_DEF
+      - name: after-sb-0p
+        type: u32
+        value: 17
+        default: DRBD_AFTER_SB_0P_DEF
+      - name: after-sb-1p
+        type: u32
+        value: 18
+        default: DRBD_AFTER_SB_1P_DEF
+      - name: after-sb-2p
+        type: u32
+        value: 19
+        default: DRBD_AFTER_SB_2P_DEF
+      - name: rr-conflict
+        type: u32
+        value: 20
+        default: DRBD_RR_CONFLICT_DEF
+      - name: on-congestion
+        type: u32
+        value: 21
+        default: DRBD_ON_CONGESTION_DEF
+      - name: cong-fill
+        type: u32
+        value: 22
+        default: DRBD_CONG_FILL_DEF
+      - name: cong-extents
+        type: u32
+        value: 23
+        default: DRBD_CONG_EXTENTS_DEF
+      - name: two-primaries
+        type: u8
+        value: 24
+        default: DRBD_ALLOW_TWO_PRIMARIES_DEF
+      - name: discard-my-data
+        type: u8
+        value: 25
+      - name: tcp-cork
+        type: u8
+        value: 26
+        default: DRBD_TCP_CORK_DEF
+      - name: always-asbp
+        type: u8
+        value: 27
+        default: DRBD_ALWAYS_ASBP_DEF
+      - name: tentative
+        type: u8
+        value: 28
+      - name: use-rle
+        type: u8
+        value: 29
+        default: DRBD_USE_RLE_DEF
+      - name: csums-after-crash-only
+        type: u8
+        value: 33
+        default: DRBD_CSUMS_AFTER_CRASH_ONLY_DEF
+      - name: sock-check-timeo
+        type: u32
+        value: 34
+        default: DRBD_SOCKET_CHECK_TIMEO_DEF
+  -
+    name: set-role-parms
+    attributes:
+      - name: assume-uptodate
+        type: u8
+        value: 1
+  -
+    name: resize-parms
+    attributes:
+      - name: resize-size
+        type: u64
+        value: 1
+      - name: resize-force
+        type: u8
+        value: 2
+      - name: no-resync
+        type: u8
+        value: 3
+      - name: al-stripes
+        type: u32
+        value: 4
+        default: DRBD_AL_STRIPES_DEF
+      - name: al-stripe-size
+        type: u32
+        value: 5
+        default: DRBD_AL_STRIPE_SIZE_DEF
+  -
+    name: state-info
+    attributes:
+      - name: sib-reason
+        type: u32
+        value: 1
+      - name: current-state
+        type: u32
+        value: 2
+        required: true
+      - name: capacity
+        type: u64
+        value: 3
+      - name: ed-uuid
+        type: u64
+        value: 4
+      - name: prev-state
+        type: u32
+        value: 5
+      - name: new-state
+        type: u32
+        value: 6
+      - name: uuids
+        type: binary
+        value: 7
+        checks:
+          max-len: DRBD_NL_UUIDS_SIZE
+      - name: disk-flags
+        type: u32
+        value: 8
+      - name: bits-total
+        type: u64
+        value: 9
+      - name: bits-oos
+        type: u64
+        value: 10
+      - name: bits-rs-total
+        type: u64
+        value: 11
+      - name: bits-rs-failed
+        type: u64
+        value: 12
+      - name: helper
+        type: string
+        value: 13
+        checks:
+          max-len: 32
+      - name: helper-exit-code
+        type: u32
+        value: 14
+      - name: send-cnt
+        type: u64
+        value: 15
+      - name: recv-cnt
+        type: u64
+        value: 16
+      - name: read-cnt
+        type: u64
+        value: 17
+      - name: writ-cnt
+        type: u64
+        value: 18
+      - name: al-writ-cnt
+        type: u64
+        value: 19
+      - name: bm-writ-cnt
+        type: u64
+        value: 20
+      - name: ap-bio-cnt
+        type: u32
+        value: 21
+      - name: ap-pending-cnt
+        type: u32
+        value: 22
+      - name: rs-pending-cnt
+        type: u32
+        value: 23
+  -
+    name: start-ov-parms
+    attributes:
+      - name: ov-start-sector
+        type: u64
+        value: 1
+      - name: ov-stop-sector
+        type: u64
+        value: 2
+  -
+    name: new-c-uuid-parms
+    attributes:
+      - name: clear-bm
+        type: u8
+        value: 1
+  -
+    name: timeout-parms
+    attributes:
+      - name: timeout-type
+        type: u32
+        value: 1
+        required: true
+  -
+    name: disconnect-parms
+    attributes:
+      - name: force-disconnect
+        type: u8
+        value: 1
+  -
+    name: detach-parms
+    attributes:
+      - name: force-detach
+        type: u8
+        value: 1
+  -
+    name: resource-info
+    attributes:
+      - name: res-role
+        type: u32
+        value: 1
+      - name: res-susp
+        type: u8
+        value: 2
+      - name: res-susp-nod
+        type: u8
+        value: 3
+      - name: res-susp-fen
+        type: u8
+        value: 4
+  -
+    name: device-info
+    attributes:
+      - name: dev-disk-state
+        type: u32
+        value: 1
+  -
+    name: connection-info
+    attributes:
+      - name: conn-connection-state
+        type: u32
+        value: 1
+      - name: conn-role
+        type: u32
+        value: 2
+  -
+    name: peer-device-info
+    attributes:
+      - name: peer-repl-state
+        type: u32
+        value: 1
+      - name: peer-disk-state
+        type: u32
+        value: 2
+      - name: peer-resync-susp-user
+        type: u32
+        value: 3
+      - name: peer-resync-susp-peer
+        type: u32
+        value: 4
+      - name: peer-resync-susp-dependency
+        type: u32
+        value: 5
+  -
+    name: resource-statistics
+    attributes:
+      - name: res-stat-write-ordering
+        type: u32
+        value: 1
+  -
+    name: device-statistics
+    attributes:
+      - name: dev-size
+        type: u64
+        value: 1
+      - name: dev-read
+        type: u64
+        value: 2
+      - name: dev-write
+        type: u64
+        value: 3
+      - name: dev-al-writes
+        type: u64
+        value: 4
+      - name: dev-bm-writes
+        type: u64
+        value: 5
+      - name: dev-upper-pending
+        type: u32
+        value: 6
+      - name: dev-lower-pending
+        type: u32
+        value: 7
+      - name: dev-upper-blocked
+        type: u8
+        value: 8
+      - name: dev-lower-blocked
+        type: u8
+        value: 9
+      - name: dev-al-suspended
+        type: u8
+        value: 10
+      - name: dev-exposed-data-uuid
+        type: u64
+        value: 11
+      - name: dev-current-uuid
+        type: u64
+        value: 12
+      - name: dev-disk-flags
+        type: u32
+        value: 13
+      - name: history-uuids
+        type: binary
+        value: 14
+        checks:
+          max-len: DRBD_NL_HISTORY_UUIDS_SIZE
+  -
+    name: connection-statistics
+    attributes:
+      - name: conn-congested
+        type: u8
+        value: 1
+  -
+    name: peer-device-statistics
+    attributes:
+      - name: peer-dev-received
+        type: u64
+        value: 1
+      - name: peer-dev-sent
+        type: u64
+        value: 2
+      - name: peer-dev-pending
+        type: u32
+        value: 3
+      - name: peer-dev-unacked
+        type: u32
+        value: 4
+      - name: peer-dev-out-of-sync
+        type: u64
+        value: 5
+      - name: peer-dev-resync-failed
+        type: u64
+        value: 6
+      - name: peer-dev-bitmap-uuid
+        type: u64
+        value: 7
+      - name: peer-dev-flags
+        type: u32
+        value: 9
+  -
+    name: drbd-notification-header
+    attributes:
+      - name: nh-type
+        type: u32
+        value: 1
+  -
+    name: drbd-helper-info
+    attributes:
+      - name: helper-name
+        type: string
+        value: 1
+        checks:
+          max-len: 32
+      - name: helper-status
+        type: u32
+        value: 2
+
+operations:
+  name-prefix: drbd-adm-
+  fixed-header: drbd-genlmsghdr
+  list:
+    - name: event
+      doc: Legacy state broadcast (DRBD 8.4).
+      value: 1
+
+    - name: get-status
+      doc: Query status of a single device (by minor) or dump all.
+      value: 2
+      attribute-set: drbd
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+      dump:
+        request:
+          attributes:
+            - cfg-context
+    - name: new-minor
+      doc: Add a DRBD minor device as a volume to a resource.
+      value: 5
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: del-minor
+      doc: Delete a DRBD minor device.
+      value: 6
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: new-resource
+      doc: Create a new DRBD resource.
+      value: 7
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - resource-opts
+    - name: del-resource
+      doc: Delete a DRBD resource.
+      value: 8
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: resource-opts
+      doc: Change resource options.
+      value: 9
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - resource-opts
+    - name: connect
+      doc: Connect to a peer.
+      value: 10
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - net-conf
+    - name: disconnect
+      doc: Disconnect from a peer.
+      value: 11
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - disconnect-parms
+    - name: attach
+      doc: Attach a local backing device to a DRBD minor.
+      value: 12
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - disk-conf
+    - name: resize
+      doc: Resize the DRBD device.
+      value: 13
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - resize-parms
+    - name: primary
+      doc: Promote a device to primary role.
+      value: 14
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - set-role-parms
+    - name: secondary
+      doc: Demote a device to secondary role.
+      value: 15
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - set-role-parms
+    - name: new-c-uuid
+      doc: Generate a new current UUID.
+      value: 16
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - new-c-uuid-parms
+    - name: start-ov
+      doc: Start online verification.
+      value: 17
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - start-ov-parms
+    - name: detach
+      doc: Detach the local backing device.
+      value: 18
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - detach-parms
+    - name: invalidate
+      doc: Invalidate local data, start full resync as sync target.
+      value: 19
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: inval-peer
+      doc: Invalidate peer data, start full resync as sync source.
+      value: 20
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: pause-sync
+      doc: Pause resynchronization.
+      value: 21
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: resume-sync
+      doc: Resume resynchronization.
+      value: 22
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: suspend-io
+      doc: Suspend I/O on a device.
+      value: 23
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: resume-io
+      doc: Resume I/O on a device.
+      value: 24
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: outdate
+      doc: Mark a device as outdated.
+      value: 25
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: get-timeout-type
+      doc: Query the current timeout type.
+      value: 26
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: down
+      doc: Shut down a DRBD resource (demote, disconnect, detach, delete).
+      value: 27
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+    - name: chg-disk-opts
+      doc: Change disk options on an attached device.
+      value: 28
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - disk-conf
+    - name: chg-net-opts
+      doc: Change network options on a connection.
+      value: 29
+      attribute-set: drbd
+      flags:
+        - admin-perm
+      do:
+        pre: drbd-pre-doit
+        post: drbd-post-doit
+        request:
+          attributes:
+            - cfg-context
+            - net-conf
+    - name: get-resources
+      doc: Dump all resources with info and statistics.
+      value: 30
+      attribute-set: drbd
+      dump:
+        request:
+          attributes:
+            - cfg-context
+            - resource-info
+            - resource-statistics
+    - name: get-devices
+      doc: Dump all devices with info and statistics.
+      value: 31
+      attribute-set: drbd
+      dump:
+        request:
+          attributes:
+            - cfg-context
+            - device-info
+            - device-statistics
+        post: drbd-adm-dump-devices-done
+    - name: get-connections
+      doc: Dump all connections with info and statistics.
+      value: 32
+      attribute-set: drbd
+      dump:
+        request:
+          attributes:
+            - cfg-context
+            - connection-info
+            - connection-statistics
+        post: drbd-adm-dump-connections-done
+    - name: get-peer-devices
+      doc: Dump all peer devices with info and statistics.
+      value: 33
+      attribute-set: drbd
+      dump:
+        request:
+          attributes:
+            - cfg-context
+            - peer-device-info
+            - peer-device-statistics
+        post: drbd-adm-dump-peer-devices-done
+    - name: resource-state
+      doc: Resource state change notification.
+      value: 34
+
+    - name: device-state
+      doc: Device state change notification.
+      value: 35
+
+    - name: connection-state
+      doc: Connection state change notification.
+      value: 36
+
+    - name: peer-device-state
+      doc: Peer device state change notification.
+      value: 37
+
+    - name: get-initial-state
+      doc: Dump current state of all objects as a notification stream.
+      value: 38
+      attribute-set: drbd
+      dump:
+        request:
+          attributes:
+            - cfg-context
+    - name: helper
+      doc: Helper invocation notification.
+      value: 40
+
+    - name: initial-state-done
+      doc: Signals end of initial state dump.
+      value: 41
+
+
+mcast-groups:
+  list:
+    - name: events
diff --git a/include/uapi/linux/drbd.h b/include/uapi/linux/drbd.h
index 7930a972d8a4..5d4d677cf1ad 100644
--- a/include/uapi/linux/drbd.h
+++ b/include/uapi/linux/drbd.h
@@ -333,6 +333,9 @@ enum drbd_uuid_index {
 
 #define HISTORY_UUIDS MAX_PEERS
 
+#define DRBD_NL_UUIDS_SIZE		(UI_SIZE * sizeof(__u64))
+#define DRBD_NL_HISTORY_UUIDS_SIZE	(HISTORY_UUIDS * sizeof(__u64))
+
 enum drbd_timeout_flag {
 	UT_DEFAULT      = 0,
 	UT_DEGRADED     = 1,
-- 
2.53.0

