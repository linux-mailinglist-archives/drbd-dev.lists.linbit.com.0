Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBc+MggHx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:39:04 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6C59434C025
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:39:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56CFF163027;
	Fri, 27 Mar 2026 23:38:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA76116084B
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:38:46 +0100 (CET)
Received: by mail-wm1-f42.google.com with SMTP id
	5b1f17b1804b1-4852b81c73aso23389425e9.3
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651126;
	x=1775255926; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=+ah7Jc7k71YR5et9OmCfsg+DC7q9Eb/m1sFtjVOghFI=;
	b=AZQy6mBCb0p8KaW/F3JbgeXwdmT/r4Qtjlz0vOXsr5omj+eE1yCp/ikbJJsqwCvYkm
	A3bNKEcYE4ZEz7JO0xgCFMoMwIHd0wuJQUUJnyY7EG3fp/bxVVWfW58dsDgOitQi7P6s
	nMzksaSXR76tqsqEuQJPTkzhjQnIVYGRwLm1MlxDJ105iszm+YpM9L27wG4c0/9d3tg1
	tCxf9Q7pocOA9mrak6gugua+uhLISNx5euWBnK0nyoMIOYZmFqo8J+1/xjvGWzl5fX+j
	E858tN4gUnZuBzOHAJ5kyEu2Bk9LCPBHyCUSae9VHpUxqSKFXfczZQbiNAYF3kJs0Sod
	zaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651126; x=1775255926;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=+ah7Jc7k71YR5et9OmCfsg+DC7q9Eb/m1sFtjVOghFI=;
	b=ZsqFi6pbTytz+QYCgJvGdGU8ARNy/6mQWCu21ch9Pkhn0ZeODjd+YbPqwTT9WQbxSB
	ryZuDy7SpOc4jV3/C4DkIg9kGWKJEKcKUPTDpMnx9mZCIJeHZksQPNA4C0aC6RflNYTT
	k0M4cWFiqzz6TbNIcnqUppm/BX0hPWJPkcp3ZHdKJgyu4epHCbm3VIXCWJ13waB6GCq3
	s9RdClRif9qI2VgToiZxkUixZr22TtjZrGMT9pku1Z4RIYbtJTo9jEKfkkNx6NzIQVrb
	b1Ibg34cq/SOfogFThFvtIBre7VZ1DIj7+2n/zkQeQsBtEU9Dg/30WBY8FS4a7IT460D
	5bnA==
X-Gm-Message-State: AOJu0YzNA35LducFXajB7MGZyw5zSVJrulb2mDxmXWtJiWDZ+csMc9hc
	BQ21AZltc4UqxuLwSwR28FAm9gl7wWt89yajo2Dht6JqiXC3LQUkwjoeNleIYyqrGm/9kg==
X-Gm-Gg: ATEYQzwHQP46rvZdLPJlSVd5BH9JCB3S1+5cQVpNPd63bemHF/NN6hS7EsFw8krAS14
	le0RUfgFLqjQu0kYFDwJKxwwV8tTB4SShOCMCyBgatqpeROh6EF8XrjEOnNvOho44sOXBBmmZQl
	CIdp3jw/+OZUq6V7hxQhUQsH5wFb3piXsR//Me/Z3GKUw9s1JJJbguyUnZVrJckgIBF5Kl/68x5
	nU54xcR9lKEB5cu4hw/4FGddDpkMU5PzlAckXsoLiE7IG66he9hxMciuleg/DivFpWhzcIvXgbg
	owNqz4a5VH9pUt+/7Yp0Mn+ycaSaS1AvexqxQUN2HZVurrxlRTw81Yqs6ZOvuLu3E90etw26+mz
	oY+bG2h3L6ImTx5K8DnS7bcZYWK7aorUnEx3cGDAAXCYbycGjQu83opInnEHh3Wq7zMsfSnxXAv
	Pi2pd/856EiXqOjpCZw79S62X3hoDhdiXAKds2vkipG8kLY0buR6DLdUbYcKPgrIwdMrtyKCiRz
	oDLkgFlocuutuwJIpDbVw==
X-Received: by 2002:a05:6000:2006:b0:43b:41df:705e with SMTP id
	ffacd0b85a97d-43b9ea77850mr7212627f8f.49.1774651126061; 
	Fri, 27 Mar 2026 15:38:46 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.38.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:38:45 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 00/20] DRBD 9 rework
Date: Fri, 27 Mar 2026 23:38:00 +0100
Message-ID: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [0.65 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	NEURAL_SPAM(0.00)[0.821];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid]
X-Rspamd-Queue-Id: 6C59434C025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As discussed (context: [0]), here is the first version of our DRBD 9
rework series, intended for for-next via for-7.1/drbd.

This replays about 10-15 years of active out-of-tree development work
[1], depending on your way of counting. The out-of-tree module has
severely diverged from the in-tree version over the years, which is
what we are aiming to fix now.

Hopefully that somewhat excuses (or at least explains) the massive
diffs -- we've tried to come up with a way to group the changes by
topic, but I realize it's still not exactly trivial to review.

We've been polishing this series for a while now, and we have taken
great care to make it as "upstream-presentable" as possible. That said,
there are still probably imperfections. It's a start -- feedback welcome!

The main blocker that still remains is that this technically breaks
userspace: some ancient versions of the DRBD userspace utilities will
not be able to talk to this version of the driver (v8 and v9 genetlink
families are completely incompatible).
We will fix that by introducing a completely new genetlink family (think
"drbd2") that follows all modern conventions. Then we can register both
families, going through a compat layer for the old family.

A prerequisite for that is converting the genl_magic macro
infrastructure we use now to YNL. That is already in the pipeline, we
expect to have it ready by the 7.2 merge window.

The plan is to submit one new version of this series for every merge
window, which should end up in linux-next. Within a few kernel
releases, we will hopefully be close enough to get this over the line
and submitted for real.

Thanks,
Christoph

[0] https://lore.kernel.org/linux-next/899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk/
[1] https://github.com/LINBIT/drbd

Christoph Böhmwalder (20):
  drbd: mark as BROKEN during DRBD 9 rework
  drbd: extend wire protocol definitions for DRBD 9
  drbd: introduce DRBD 9 on-disk metadata format
  drbd: add transport layer abstraction
  drbd: add TCP transport implementation
  drbd: add RDMA transport implementation
  drbd: add load-balancing TCP transport
  drbd: add DAX/PMEM support for metadata access
  drbd: add optional compatibility layer for DRBD 8.4
  drbd: rename drbd_worker.c to drbd_sender.c
  drbd: rework sender for DRBD 9 multi-peer
  drbd: replace per-device state model with multi-peer data structures
  drbd: rewrite state machine for DRBD 9 multi-peer clusters
  drbd: rework activity log and bitmap for multi-peer replication
  drbd: rework request processing for DRBD 9 multi-peer IO
  drbd: rework module core for DRBD 9 transport and multi-peer
  drbd: rework receiver for DRBD 9 transport and multi-peer protocol
  drbd: rework netlink management interface for DRBD 9
  drbd: update monitoring interfaces for multi-peer topology
  drbd: remove BROKEN for DRBD

 drivers/block/drbd/Kconfig                    |    58 +
 drivers/block/drbd/Makefile                   |     9 +-
 drivers/block/drbd/drbd_actlog.c              |  1122 +-
 drivers/block/drbd/drbd_bitmap.c              |  1824 +--
 drivers/block/drbd/drbd_buildtag.c            |     2 +-
 drivers/block/drbd/drbd_config.h              |    38 +
 drivers/block/drbd/drbd_dax_pmem.c            |   158 +
 drivers/block/drbd/drbd_dax_pmem.h            |    40 +
 drivers/block/drbd/drbd_debugfs.c             |  1657 ++-
 drivers/block/drbd/drbd_debugfs.h             |     2 +
 .../block/drbd}/drbd_genl_api.h               |    19 +-
 drivers/block/drbd/drbd_int.h                 |  3278 +++--
 drivers/block/drbd/drbd_interval.c            |    35 +-
 drivers/block/drbd/drbd_interval.h            |   156 +-
 drivers/block/drbd/drbd_legacy_84.c           |   564 +
 drivers/block/drbd/drbd_legacy_84.h           |    27 +
 drivers/block/drbd/drbd_main.c                |  6008 +++++---
 drivers/block/drbd/drbd_meta_data.h           |   126 +
 drivers/block/drbd/drbd_nl.c                  |  7248 ++++++---
 drivers/block/drbd/drbd_nla.c                 |     2 +-
 drivers/block/drbd/drbd_nla.h                 |     7 +-
 drivers/block/drbd/drbd_polymorph_printk.h    |   265 +-
 drivers/block/drbd/drbd_proc.c                |   320 +-
 drivers/block/drbd/drbd_protocol.h            |   519 +-
 drivers/block/drbd/drbd_receiver.c            | 12258 +++++++++++-----
 drivers/block/drbd/drbd_req.c                 |  2990 ++--
 drivers/block/drbd/drbd_req.h                 |   303 +-
 drivers/block/drbd/drbd_sender.c              |  3871 +++++
 drivers/block/drbd/drbd_state.c               |  7724 +++++++---
 drivers/block/drbd/drbd_state.h               |   298 +-
 drivers/block/drbd/drbd_state_change.h        |    66 +-
 drivers/block/drbd/drbd_strings.c             |   219 +-
 drivers/block/drbd/drbd_strings.h             |    25 +-
 drivers/block/drbd/drbd_transport.c           |   403 +
 drivers/block/drbd/drbd_transport.h           |   340 +
 drivers/block/drbd/drbd_transport_lb-tcp.c    |  1905 +++
 drivers/block/drbd/drbd_transport_rdma.c      |  3496 +++++
 drivers/block/drbd/drbd_transport_tcp.c       |  1670 +++
 drivers/block/drbd/drbd_transport_template.c  |   160 +
 drivers/block/drbd/drbd_worker.c              |  2223 ---
 include/linux/drbd.h                          |   190 +-
 include/linux/drbd_config.h                   |    16 -
 include/linux/drbd_genl.h                     |   352 +-
 include/linux/drbd_limits.h                   |   112 +-
 include/linux/genl_magic_func.h               |    50 +-
 45 files changed, 45891 insertions(+), 16264 deletions(-)
 create mode 100644 drivers/block/drbd/drbd_config.h
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.c
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.h
 rename {include/linux => drivers/block/drbd}/drbd_genl_api.h (68%)
 create mode 100644 drivers/block/drbd/drbd_legacy_84.c
 create mode 100644 drivers/block/drbd/drbd_legacy_84.h
 create mode 100644 drivers/block/drbd/drbd_meta_data.h
 create mode 100644 drivers/block/drbd/drbd_sender.c
 create mode 100644 drivers/block/drbd/drbd_transport.c
 create mode 100644 drivers/block/drbd/drbd_transport.h
 create mode 100644 drivers/block/drbd/drbd_transport_lb-tcp.c
 create mode 100644 drivers/block/drbd/drbd_transport_rdma.c
 create mode 100644 drivers/block/drbd/drbd_transport_tcp.c
 create mode 100644 drivers/block/drbd/drbd_transport_template.c
 delete mode 100644 drivers/block/drbd/drbd_worker.c
 delete mode 100644 include/linux/drbd_config.h


base-commit: 67807fbaf12719fca46a622d759484652b79c7c3
-- 
2.53.0

