Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDVFMLU2+2nUXwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:40:21 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 1100B4DA55E
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:40:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 742F9164D92;
	Wed,  6 May 2026 14:40:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 91C57164D6A
	for <drbd-dev@lists.linbit.com>; Wed,  6 May 2026 14:39:43 +0200 (CEST)
Received: by mail-wm1-f52.google.com with SMTP id
	5b1f17b1804b1-48d102471a4so31343695e9.2
	for <drbd-dev@lists.linbit.com>; Wed, 06 May 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1778071183;
	x=1778675983; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=H+J3XqbnCoYpAGIzRu85OxjjRlSoL1F1apznBZBvmL0=;
	b=unDnpRQtYHAvxaFX46SxgC9pR6NNkq43HZ7EY8HgAj64Mou26slq6pTOjlG273bnmF
	/Oe1hUBSuKWdjxLvJEJMKNGbl2W5vXAc6ASMOTLKU5Rv/rc2AFO9N7Sq3CPYqG7dNNsu
	O001BkgvPERjznyjkJMFB4byaPKHeKPhJoHYoNGJ/WAksfvfhUt27lhEPRD7Mr3qtDCi
	+jdaG/jj+EO+b4hIl3pIsOPtqkQjghw52VJipeesDjh73oQEGJVdv7X38K2OkRqEemUR
	vDH4/UcFom0KOvgVrD/TePCj0oQKvPXYdiUk/qJuWtXm7l/t2KVWdaddutS1aY37RTBc
	HKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1778071183; x=1778675983;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=H+J3XqbnCoYpAGIzRu85OxjjRlSoL1F1apznBZBvmL0=;
	b=JtVdqu/THy2K2Atp0c0XTLdWe/XIvdTa7CqrGh4ckaAohb8M9h8ZozHJXWJ2fWNMYD
	GsnX4epO55Xce9hHiStVSvWeqA7i0/lPqTuBsU7g7UKac2p/2lDdqy1yeQXS+EN/UFqK
	wCKMPhz9fL5QSyr+psaMBi67bSRa6xoRnduN6e9E1/UGK6PqUuFrePb2vVS360IiHIkQ
	/F9xwensMb7GMr/Tl1R4PEuriBd/kouhIr2ipSAk0C3JTEKjNbPo0L2UF/9wFE0eAV6u
	PVSphFsv6hblZH2vphpiFjpPGar8G9sXcAvCzQ2kZ5pH1eDGagayziJ4y89iOfNyIDPt
	zexA==
X-Gm-Message-State: AOJu0Ywd6kftI4PXaMfQ3UPLwuksXnMzUpKdGDxx8PrNrWoP9Uq6+xr7
	dON1TR4jsX/sL0an4aOT7XF7z3mbqR9szoiFRqN45EkEI8Q9kJGgNsqINet0MIZLhO3ayA==
X-Gm-Gg: AeBDievbDmKRs+xV7nN1Ximm2QDSvfJnEBnnnl7wejNwDIaqVGIn9lJ7QNNHXA+9ezI
	cr3ey7d52FoK0UV6weqsnqknfA4MCZSgzcv0Yr1K+OxyKlfrMoW8Y2G5h1oAXjXhZbrpw1kLmwW
	qsxwK0hQ0PpByw3Iq74wbg7joqoEeMbP+hdeA9aVbw/EnR80XRU692RGVdFlRLX3grjDOnsIGiX
	ioHNHqTdaSbYWlPBZVRkU+O9sbnlKzLcoldrfYZc6fyjMozwMElSmhSpUGbBCUN+sJ+M5hMMJ8x
	aFTJkBLLs+4/uD9Otkmwn5UHm2+Zh3S3A5r+XpgAnZD7x6BGYuyjSDWdtYQ7D5AW6E5/A9HqvDR
	/TJejdqsjXZtX3fiRNjycW9u6nvcYqI7PQ4A/54b9C61dzSqK4ekZgR4PWYCo4zx+Y1S9F5YgtS
	zcbxhiF3kojLLVzeerrqiU2wVj+XnSA5tUmvMGrGl4mc3KP/6bFj31ZD9uc+7LCWZWlfV2RKlu5
	fXY7Ft19ZoyzVHDBfO/9XOoKSjCLEpw
X-Received: by 2002:a05:600d:8408:b0:489:fec9:a17e with SMTP id
	5b1f17b1804b1-48e51f30534mr42486405e9.12.1778071182844; 
	Wed, 06 May 2026 05:39:42 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48e53891d62sm76399015e9.1.2026.05.06.05.39.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 May 2026 05:39:42 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 1/2] drbd: move UAPI headers to include/uapi/linux/
Date: Wed,  6 May 2026 14:39:25 +0200
Message-ID: <20260506123926.1944290-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
References: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
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
X-Rspamd-Queue-Id: 1100B4DA55E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.544];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:mid,linbit.com:email]

drbd.h and drbd_limits.h contain only type definitions, enums, and
constants shared between kernel and userspace. These should be part of
UAPI.

Split the genl_api header into two: the genlmsghdr and the enums are
UAPI, the rest stays there for now (it will be removed by one of the
next commits in this series).

drbd_config.h is clearly DRBD-internal, so move it there.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_buildtag.c            |  2 +-
 .../block/drbd}/drbd_config.h                 |  0
 drivers/block/drbd/drbd_int.h                 |  2 +-
 include/linux/drbd_genl_api.h                 | 40 ------------------
 include/{ => uapi}/linux/drbd.h               | 42 ++++++++++++++++++-
 include/{ => uapi}/linux/drbd_limits.h        |  2 +-
 6 files changed, 44 insertions(+), 44 deletions(-)
 rename {include/linux => drivers/block/drbd}/drbd_config.h (100%)
 rename include/{ => uapi}/linux/drbd.h (87%)
 rename include/{ => uapi}/linux/drbd_limits.h (99%)

diff --git a/drivers/block/drbd/drbd_buildtag.c b/drivers/block/drbd/drbd_buildtag.c
index cb1aa66d7d5d..cd0389488f63 100644
--- a/drivers/block/drbd/drbd_buildtag.c
+++ b/drivers/block/drbd/drbd_buildtag.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <linux/drbd_config.h>
+#include "drbd_config.h"
 #include <linux/module.h>
 
 const char *drbd_buildtag(void)
diff --git a/include/linux/drbd_config.h b/drivers/block/drbd/drbd_config.h
similarity index 100%
rename from include/linux/drbd_config.h
rename to drivers/block/drbd/drbd_config.h
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index f6d6276974ee..f3d746a6d6fd 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -34,7 +34,7 @@
 #include <linux/prefetch.h>
 #include <linux/drbd_genl_api.h>
 #include <linux/drbd.h>
-#include <linux/drbd_config.h>
+#include "drbd_config.h"
 #include "drbd_strings.h"
 #include "drbd_state.h"
 #include "drbd_protocol.h"
diff --git a/include/linux/drbd_genl_api.h b/include/linux/drbd_genl_api.h
index 70682c058027..19d263924852 100644
--- a/include/linux/drbd_genl_api.h
+++ b/include/linux/drbd_genl_api.h
@@ -2,46 +2,6 @@
 #ifndef DRBD_GENL_STRUCT_H
 #define DRBD_GENL_STRUCT_H
 
-/**
- * struct drbd_genlmsghdr - DRBD specific header used in NETLINK_GENERIC requests
- * @minor:
- *     For admin requests (user -> kernel): which minor device to operate on.
- *     For (unicast) replies or informational (broadcast) messages
- *     (kernel -> user): which minor device the information is about.
- *     If we do not operate on minors, but on connections or resources,
- *     the minor value shall be (~0), and the attribute DRBD_NLA_CFG_CONTEXT
- *     is used instead.
- * @flags: possible operation modifiers (relevant only for user->kernel):
- *     DRBD_GENL_F_SET_DEFAULTS
- * @volume:
- *     When creating a new minor (adding it to a resource), the resource needs
- *     to know which volume number within the resource this is supposed to be.
- *     The volume number corresponds to the same volume number on the remote side,
- *     whereas the minor number on the remote side may be different
- *     (union with flags).
- * @ret_code: kernel->userland unicast cfg reply return code (union with flags);
- */
-struct drbd_genlmsghdr {
-	__u32 minor;
-	union {
-	__u32 flags;
-	__s32 ret_code;
-	};
-};
-
-/* To be used in drbd_genlmsghdr.flags */
-enum {
-	DRBD_GENL_F_SET_DEFAULTS = 1,
-};
-
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
diff --git a/include/linux/drbd.h b/include/uapi/linux/drbd.h
similarity index 87%
rename from include/linux/drbd.h
rename to include/uapi/linux/drbd.h
index 5468a2399d48..7930a972d8a4 100644
--- a/include/linux/drbd.h
+++ b/include/uapi/linux/drbd.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
 /*
   drbd.h
   Kernel module for 2.6.x Kernels
@@ -389,4 +389,44 @@ enum write_ordering_e {
 
 #define DRBD_CPU_MASK_SIZE 32
 
+/**
+ * struct drbd_genlmsghdr - DRBD specific header used in NETLINK_GENERIC requests
+ * @minor:
+ *     For admin requests (user -> kernel): which minor device to operate on.
+ *     For (unicast) replies or informational (broadcast) messages
+ *     (kernel -> user): which minor device the information is about.
+ *     If we do not operate on minors, but on connections or resources,
+ *     the minor value shall be (~0), and the attribute DRBD_NLA_CFG_CONTEXT
+ *     is used instead.
+ * @flags: possible operation modifiers (relevant only for user->kernel):
+ *     DRBD_GENL_F_SET_DEFAULTS
+ * @volume:
+ *     When creating a new minor (adding it to a resource), the resource needs
+ *     to know which volume number within the resource this is supposed to be.
+ *     The volume number corresponds to the same volume number on the remote side,
+ *     whereas the minor number on the remote side may be different
+ *     (union with flags).
+ * @ret_code: kernel->userland unicast cfg reply return code (union with flags);
+ */
+struct drbd_genlmsghdr {
+	__u32 minor;
+	union {
+		__u32 flags;
+		__s32 ret_code;
+	};
+};
+
+/* To be used in drbd_genlmsghdr.flags */
+enum {
+	DRBD_GENL_F_SET_DEFAULTS = 1,
+};
+
+enum drbd_state_info_bcast_reason {
+	SIB_GET_STATUS_REPLY = 1,
+	SIB_STATE_CHANGE = 2,
+	SIB_HELPER_PRE = 3,
+	SIB_HELPER_POST = 4,
+	SIB_SYNC_PROGRESS = 5,
+};
+
 #endif
diff --git a/include/linux/drbd_limits.h b/include/uapi/linux/drbd_limits.h
similarity index 99%
rename from include/linux/drbd_limits.h
rename to include/uapi/linux/drbd_limits.h
index 5b042fb427e9..a72a102d1ca7 100644
--- a/include/linux/drbd_limits.h
+++ b/include/uapi/linux/drbd_limits.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
 /*
   drbd_limits.h
   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-- 
2.53.0

