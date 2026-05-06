Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIovOQs4+2nUXwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:46:03 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 71DE84DA701
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:46:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1FF30164D96;
	Wed,  6 May 2026 14:46:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D94A1622C5
	for <drbd-dev@lists.linbit.com>; Wed,  6 May 2026 14:45:47 +0200 (CEST)
Received: by mail-wm1-f48.google.com with SMTP id
	5b1f17b1804b1-488b150559bso44180275e9.1
	for <drbd-dev@lists.linbit.com>; Wed, 06 May 2026 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1778071547;
	x=1778676347; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=xduljJRFZGdlBnAgyasd2iQDnZmICTkUp84nQkKVvPE=;
	b=xyyRLw7c9JRqKCUDnZTLN7hFleV6M34TvWrtLUtB2wp3xHmqGlH6V3z3gPybs1u+/8
	r/sT7l5Hx2pXAfurIyUUUJz7eAC3Kko0dh5Z/mwbdj138OcRpXInVo1K6GCDuAbEnO0A
	ZiFeM1KM3O0AWMnSF63KnC8lIhxZlX46P03V/HJh/6WeoLCJXx3tA/hJ7gRe6Cod3O/B
	toEoVtDZmO0KCIrT8IlBn0tD08ErGq/OMHpApOEvuwbtJW8/fj9YCeMX+mpS3amoad1n
	KyWSkjqlWYLhHv+yw1zo6YjhmRyDeRk28IwyuijGw9wRVS0XFmER5zgx3XR179nHTweT
	IG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1778071547; x=1778676347;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=xduljJRFZGdlBnAgyasd2iQDnZmICTkUp84nQkKVvPE=;
	b=Eir/UCGsrqAsE5bEaj8byw+XMjMFOxyLKm3JI2/j8X+RKEAFOKjWB8yt4gFX2rG5UY
	JG0fObM8fKk4OhFi2iTLkgJUds+ATIVMBib87Nc+xC5jPvEWoCFfhUIFUHfwFOiSihyE
	OlzJh7nBi1FPj6Vj4Ih5yRPUDTjp0ApeALyW5WUhlUDmT8/fF9CGpwhHKWo0hozm7iPD
	UCgG9Dc2KTLDKGBcGW9sk0/mAqQTMWUhcf2m9TXegHrq0nwFUHxN0/Wy2Ge7WjMZWQ2y
	FsP4cHbA3yYljfAGP/GPaQWvyB92b34l9bptj8vU+diMVeLFEap7875eCj6JIP88roz2
	PjTQ==
X-Gm-Message-State: AOJu0YxYQjhzJIxKVepdbIa+BoxHAi9Wf4Jp3nI/SKhdH+tvcpuV+Jdn
	8RL+owSidj6287fcm0bfok3iUqB5zsTm0VZ1vwpw29xH1kTRAVIFf5vFW9ANAgpJgTBL+A==
X-Gm-Gg: AeBDiesiM4M2vmvaKAkVK5yH8GisY+bAMc1XnNGRZQG8qNhRic1zkaJVlIP+Rm49zGg
	QamrqJyjfu4osNx1wRNMLRPNCRxFLFmePeoMPXUBSi265p6xTe8xlqxZB1IiC4C75JRQXiXVJDW
	6vsozoPBepaW1DG1d/9378/tqlHjOiZ+yy1iY1OEKRItYFLGVgV+ju9qHf2OwAO5jOSYZsEx6fQ
	qchquQBzAWeB0QHIJcB0Owhdvh3vt9m6+Ue+ZxSkNCm8quiaYF+voM+WMXwcl+Y8ankCaIanbhP
	airKe/ATQglwfd8k3GXZhsRPNiLjOVFWEhSiB73pbYjk6EtqCBsF3yKZroSRMjEjnDDV/0EYjff
	SeWE0WNPoSQhD/gJ7IJJssx+7rl5zlecMEz5UqQE5rkrMWb0WheLZimBN1T/4pRsF1ipsqjZzku
	ClCrfBYz5NOcrZX6qXWz4zM/BNbuMkf9Z+CunMBZytSoP7g20fPXWsyZMKNjGLrGSq05aObnOgj
	CzyWBU+qG8aVV6w2A7hOtJOLucvc+ij
X-Received: by 2002:a05:600c:4592:b0:489:1ff1:74d3 with SMTP id
	5b1f17b1804b1-48e51f3c4cemr59553125e9.20.1778071546568; 
	Wed, 06 May 2026 05:45:46 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48e538d2878sm74792275e9.15.2026.05.06.05.45.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 May 2026 05:45:46 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v3 0/2] drbd: switch from genl_magic to YNL
Date: Wed,  6 May 2026 14:45:39 +0200
Message-ID: <20260506124541.1951772-1-christoph.boehmwalder@linbit.com>
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
X-Rspamd-Queue-Id: 71DE84DA701
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
	NEURAL_SPAM(0.00)[0.597];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:mid]

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

Changes from v2:
- Fix compile error

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
 include/{ => uapi}/linux/drbd.h               |   45 +-
 include/uapi/linux/drbd_genl.h                |  359 +++
 include/{ => uapi}/linux/drbd_limits.h        |    2 +-
 17 files changed, 3653 insertions(+), 1466 deletions(-)
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

