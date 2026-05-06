Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PiiEJw2+2nUXwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:39:56 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id D6C364DA550
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:39:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69AEE164D3A;
	Wed,  6 May 2026 14:39:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1367E1622C5
	for <drbd-dev@lists.linbit.com>; Wed,  6 May 2026 14:39:38 +0200 (CEST)
Received: by mail-wm1-f50.google.com with SMTP id
	5b1f17b1804b1-4891c00e7aeso54375855e9.2
	for <drbd-dev@lists.linbit.com>; Wed, 06 May 2026 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1778071178;
	x=1778675978; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=lfZRl/C1nUWxOaIb1UiTP5bzQ2aypWAqsTH4UFzskcU=;
	b=CPF6DJGutZT5VcGT4kA1NRJhm3tjMj5HQDJUjbotIhk7jKcaW6GS2ZAEGbxsMTRSPy
	QpcKbImX2VCjSm4Jyx/wipG1jV9Ug8PRU683vumG+PSED6W8xsGyCoJtn1G8fLhSZQ/P
	gCdW4gV7IjYFgoDBm+TXRZ+yrqq20gwKu1IkYxda70eObDzFFBW4nbscFI258zSihPMs
	ODDhF1bIDmQBdgyncpaRvwd6D5wETYzZgcQIETmVhO0U48o2QCfVYRk5VhZwD5TvWdnK
	kfhBgrKMU/9n79BEp9iIWurGDo9u8yNYGRXNQ+nNpiq0ujq5lLIoEr2vN+eb4R6T9avS
	GBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1778071178; x=1778675978;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=lfZRl/C1nUWxOaIb1UiTP5bzQ2aypWAqsTH4UFzskcU=;
	b=paReItgOhFByxxg3+pShR5uY/KxCtvyZZfC5PwURkxT0pHsCswO8a4lkjFn3q+p5/B
	x+9VgR/2VL7AVSwkebRiFADMPeLhzX4NGFH6LtbEKETgnJg0ovx4ZmW+2+JKTpr1rEwe
	F6wYxV8hdOgctyP2EoZY0Sw61EWwSXRONX/Iuv+aMxjNSUdF9w5+J522sIm9iYMawC/C
	uYp5yCx0OaN7CNlxy2w9K8WghCX5Vv9BaFCiryatL3TA4oXRhxUlyFgPmbtRIShKWzM6
	Jt8APvsz9d67lZLi3HGP9C6r2uKEWuTwrOHSIvG6S17iuIUiGOVxEoLpifLYqrD/PPvX
	aCXQ==
X-Gm-Message-State: AOJu0Yz0wBDCqbcDN3wvGz+ei8ailgDTBDpH8gxK/l+YVYx+orvGiVIj
	F/CQudG3+XkfWw3H2unZd5P9sGkoB4UHMv5mDIIGf6dwdjJxkQKeHps46xRz2g5ukhbPVQ==
X-Gm-Gg: AeBDievhKH6kDLYk/Jo/i4bZQddE1Cqkez8O3v+c+PhWX/5NJIJXg/Wu/Zx4N2k+jqH
	rb1VT46k0ApO6vCJXeayJA+eW4Hp8h6syaaLjoudcavsQwWMlYJwRfDsIgayPyb7Aqk5Nk4Ih+U
	XvmGmpXpUqE+NMouuo6nixho3wh99WOOjl7F16cm9w5gTMmbKQRgV+LnT0Hpw6wIBcoPIUzGGoM
	E/6npCrkIaiVtKYsElR5FCRODMW3oN1J2Cu+mIGIpeh4hbIbi88GOWud/iRANGik6TEIvvOs/mf
	mz/JFQUZ+FbBljdLNWD8eNtvdGmd5UrmLDLWLtmFVk5QhBmQ4wI8u+X8+KQpV3+Xdof2H7ne8Ix
	p/5QCRS9u1hsR6kM13XstD2GME7QqQls76xa+7/Tx3YFA04DS0DzPDBMDZsYf0Z1GhYbbRXKekh
	Q+qQnPXmnkm5yTHSnMgrh3VUHr29JngCsrToeXjXKqwsz4q2YH0K0bw/Zb/bHVAgIb++ZvbYoOz
	/Vw76v0bpZAP54iY7JzdlHawsJikp/K
X-Received: by 2002:a05:600c:b8a:b0:48a:5333:811e with SMTP id
	5b1f17b1804b1-48e51f2f91cmr56154685e9.15.1778071178092; 
	Wed, 06 May 2026 05:39:38 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48e53891d62sm76399015e9.1.2026.05.06.05.39.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 May 2026 05:39:37 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 0/2] drbd: switch from genl_magic to YNL
Date: Wed,  6 May 2026 14:39:24 +0200
Message-ID: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
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
X-Rspamd-Queue-Id: D6C364DA550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.553];
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

DRBD's genetlink interface was defined using a custom multi-include
macro system, genl_magic_{func,struct}.h. This system generated struct
definitions, netlink policies, serialization functions and more
from a single "magic" header.
It never really caught on; DRBD is its only user, its internal macro
jungle is next to impossible to understand, and even harder to debug.

This series replaces it with the standard solution, YNL.
The *_gen.[ch] files were created with a modified YNL generator, but
these modifications are not shipped because the current DRBD family is
effectively frozen.

Note: this family primarily aims for compatibility with existing
userspace. The next planned step is a new (also YNL-based) family,
"drbd2", which will implement all the actual modern recommendations for
new netlink families.

Changes from v1:
- Remove YNL generator patches, ship just the generated code

Christoph Böhmwalder (2):
  drbd: move UAPI headers to include/uapi/linux/
  drbd: replace genl_magic with explicit netlink serialization

 drivers/block/drbd/Makefile                   |    1 +
 drivers/block/drbd/drbd_buildtag.c            |    2 +-
 .../block/drbd}/drbd_config.h                 |    0
 drivers/block/drbd/drbd_debugfs.c             |    2 +-
 drivers/block/drbd/drbd_int.h                 |    6 +-
 drivers/block/drbd/drbd_main.c                |    6 +-
 drivers/block/drbd/drbd_nl.c                  |  416 +--
 drivers/block/drbd/drbd_nl_gen.c              | 2606 +++++++++++++++++
 drivers/block/drbd/drbd_nl_gen.h              |  395 +++
 drivers/block/drbd/drbd_proc.c                |    2 +-
 include/linux/drbd_genl.h                     |  536 ----
 include/linux/drbd_genl_api.h                 |   56 -
 include/linux/genl_magic_func.h               |  413 ---
 include/linux/genl_magic_struct.h             |  272 --
 include/{ => uapi}/linux/drbd.h               |   42 +-
 include/uapi/linux/drbd_genl.h                |  359 +++
 include/{ => uapi}/linux/drbd_limits.h        |    2 +-
 17 files changed, 3650 insertions(+), 1466 deletions(-)
 rename {include/linux => drivers/block/drbd}/drbd_config.h (100%)
 create mode 100644 drivers/block/drbd/drbd_nl_gen.c
 create mode 100644 drivers/block/drbd/drbd_nl_gen.h
 delete mode 100644 include/linux/drbd_genl.h
 delete mode 100644 include/linux/drbd_genl_api.h
 delete mode 100644 include/linux/genl_magic_func.h
 delete mode 100644 include/linux/genl_magic_struct.h
 rename include/{ => uapi}/linux/drbd.h (87%)
 create mode 100644 include/uapi/linux/drbd_genl.h
 rename include/{ => uapi}/linux/drbd_limits.h (99%)


base-commit: a9c4b1d37622ed01b75f94a4f68cf55f33153a31
-- 
2.53.0

