Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNKAFSNA1Wk73gcAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 19:34:27 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id EA4763B265F
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 19:34:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28D61163130;
	Tue,  7 Apr 2026 19:34:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 816841622C4
	for <drbd-dev@lists.linbit.com>; Tue,  7 Apr 2026 19:34:10 +0200 (CEST)
Received: by mail-wm1-f44.google.com with SMTP id
	5b1f17b1804b1-4852a9c6309so49324795e9.0
	for <drbd-dev@lists.linbit.com>; Tue, 07 Apr 2026 10:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1775583250;
	x=1776188050; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=8RvP1qL9GHPweA7UFv71M7qDWUSH6dTBdOKH8YAv1Ek=;
	b=cEzS5ce2nDa3Cl+yoDi9dRI+UCPlvGBR+j4epI1z8j87Xf0Iz5Fg/Sb+973ia2rZ5/
	qkjLPFn9fR2OPK99SJl5aksHdB8jkAgDV1SLIEtzJqseMmI0KUF1NRunzi9j6REn0fpO
	79tgl5KT5IHlstE88w/iKdwQgg9x1iw2GfMWjN2zBupEzvqvL3uXfi4QAXACpZAFqTEU
	Oza3Zwc2D+40GLo47S0Ff77gvkCna5CFf/fTL0LHvsma9pYHDyfZ4+Q0UkOO0yzrWSC5
	4IEg17TRgeStKbBw74Nq8Bkm//OR5tGXuF91QjXIJ+fUrAwJqcdiDW3LVanNgfhXZgo5
	pZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775583250; x=1776188050;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8RvP1qL9GHPweA7UFv71M7qDWUSH6dTBdOKH8YAv1Ek=;
	b=cIt6isYH1NrP80YGJObSF/tCnTXv/7ORN/rpoJQS/9JlrMyciFY7BQQzpxKrSqlR43
	G0CGe3K6eArJYf2rGRUGHURWWsaa04g8TXzW6Ggw9Zph8IzbJYTBpBlDVTQWb6G+cuxs
	97apmT9MGKlXmS1SOYT0KCHdZE4BC+3AYS68w5kqfLjSeCpHmCe6Y4FtRzD7rkAbEFzK
	WtOI/EsD1d2nas8BMcKn/8V1x/tt/QbjehqddKXxQ7meuqoYr+yNqdhue0Ep6E0dV//c
	HoPbyc2oaAd6ZYw/fQU4TsYGOx6tMUmQxrNnPVu37bGFvOZwntZZvW0NIMKXLVDyCzBe
	Pzlw==
X-Gm-Message-State: AOJu0YxZzZ7/OXz1JCfixRCEK4yIdFN/V1lZ3bzZSjwaNTd+sFbgs3Es
	eGjM/yflgx1t+a9h+zfs3Sb73ycAKx0q/DYXRe5jmWFXudwZW8VRzbnEO2QkxvyifMvQJw==
X-Gm-Gg: AeBDietHNyqOJ9XvS5eNYOO9PwoUM09nDhcehX7+u3+1ShvDaH3dp1tfgGHgz3+9TIb
	8bv8glTcE1ZiqyuKwqw8xQUsrbmX3zdGwOhBwTA8yaD2zgsSmYrio4nBi7kN+XlrQjqDchY61jd
	astYr5WVZQLONyu6BVQ9NmpXGrsZbRf1c6A9C1IDnhUevezNq2Tey+42ovY8z2ykGFpn+KzYbrT
	jhvbA5zh/tZMAu5Njf7bFz2mBXFR0TT0m/T/9eVMb+L/vYie77YP4yQHA6YDSjwJvP4OhCvMOUx
	Gc8+3z8udoWJvgL3VLh5MDYayV/Qaoyk3jAPsRvyvB91lsDUqOQwD5jEZjyjvI02sEp1QJzoKAM
	X5htECqGyZ0ZL2gPCbYc1/UPrhfWODWJ9FaDrRggQqLJcBUbCYn1FeNHhSk4OUomgunsQ0pk8Ls
	RBWBCmBFFTZhEvXheV4ZZGMdtcxRplixM4S5pDg0OCiJguYxSPCY6rmy7DGrmmEROpp2QpEjGfQ
	qaMTgQXDAcIur2wcXh3fg==
X-Received: by 2002:a05:600c:4b23:b0:488:a723:ea53 with SMTP id
	5b1f17b1804b1-488a723ebddmr100893325e9.7.1775583249679; 
	Tue, 07 Apr 2026 10:34:09 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-488c4e930c7sm6667275e9.6.2026.04.07.10.34.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2026 10:34:09 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 0/4] drbd: switch from genl_magic to YNL
Date: Tue,  7 Apr 2026 19:33:52 +0200
Message-ID: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[1.000];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linbit.com,google.com,kernel.org,lists.linbit.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: EA4763B265F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DRBD's genetlink interface was defined using a custom multi-include
macro system, genl_magic_{func,struct}.h. This system generated struct
definitions, netlink policies, serialization functions and more
from a single "magic" header.
It never really caught on; DRBD is its only user, its internal macro
jungle is next to impossible to understand, and even harder to debug.

This series replaces it with the standard solution, YNL.

First, shuffle some headers around because the YNL generator expects
to generate UAPI headers.
Then, add some optional extensions to the YNL generator to support a
minimal set of old genl_magic features required for backward
compatibility.
Then create a "genetlink-legacy" based spec for DRBD and switch to it.

Note: this family primarily aims for compatiblity with existing
userspace. The next planned step is a new (also YNL-based) family,
"drbd2", which will implement all the actual modern recommendations for
new netlink families.

Christoph Böhmwalder (4):
  drbd: move UAPI headers to include/uapi/linux/
  tools: ynl-gen-c: optionally emit structs and helpers
  drbd: add YNL genetlink specification
  drbd: switch from genl_magic macros to YNL-generated code

 Documentation/netlink/genetlink-legacy.yaml   |   23 +
 Documentation/netlink/specs/drbd.yaml         | 1109 +++++++
 drivers/block/drbd/Makefile                   |    1 +
 drivers/block/drbd/drbd_buildtag.c            |    2 +-
 .../block/drbd}/drbd_config.h                 |    0
 drivers/block/drbd/drbd_debugfs.c             |    2 +-
 drivers/block/drbd/drbd_int.h                 |    6 +-
 drivers/block/drbd/drbd_main.c                |    6 +-
 drivers/block/drbd/drbd_nl.c                  |  416 +--
 drivers/block/drbd/drbd_nl_gen.c              | 2610 +++++++++++++++++
 drivers/block/drbd/drbd_nl_gen.h              |  399 +++
 drivers/block/drbd/drbd_proc.c                |    2 +-
 include/linux/drbd_genl.h                     |  536 ----
 include/linux/drbd_genl_api.h                 |   56 -
 include/linux/genl_magic_func.h               |  413 ---
 include/linux/genl_magic_struct.h             |  272 --
 include/{ => uapi}/linux/drbd.h               |   45 +-
 include/uapi/linux/drbd_genl.h                |  363 +++
 include/{ => uapi}/linux/drbd_limits.h        |    2 +-
 tools/net/ynl/pyynl/ynl_gen_c.py              |  293 +-
 20 files changed, 5087 insertions(+), 1469 deletions(-)
 create mode 100644 Documentation/netlink/specs/drbd.yaml
 rename {include/linux => drivers/block/drbd}/drbd_config.h (100%)
 create mode 100644 drivers/block/drbd/drbd_nl_gen.c
 create mode 100644 drivers/block/drbd/drbd_nl_gen.h
 delete mode 100644 include/linux/drbd_genl.h
 delete mode 100644 include/linux/drbd_genl_api.h
 delete mode 100644 include/linux/genl_magic_func.h
 delete mode 100644 include/linux/genl_magic_struct.h
 rename include/{ => uapi}/linux/drbd.h (86%)
 create mode 100644 include/uapi/linux/drbd_genl.h
 rename include/{ => uapi}/linux/drbd_limits.h (99%)


base-commit: a9c4b1d37622ed01b75f94a4f68cf55f33153a31
-- 
2.53.0

