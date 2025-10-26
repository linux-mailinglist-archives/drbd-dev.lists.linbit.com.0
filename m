Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC8C24193
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:20:53 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 508181627A3;
	Fri, 31 Oct 2025 10:20:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4CB016094D
	for <drbd-dev@lists.linbit.com>; Sun, 26 Oct 2025 02:05:23 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id
	d2e1a72fcca58-79ef9d1805fso3728838b3a.1
	for <drbd-dev@lists.linbit.com>; Sat, 25 Oct 2025 18:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1761440722; x=1762045522;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=yS34+uhylNdFYNWrvgsPGh1bBy7nTRn8Y42YGAOkzr0=;
	b=E5blmTyCDlShUOIgRqEXbkZ2OM5fiURxeAm71IWMmIdIQWhK0KN4HSPXJbGasL3gJl
	eF/hfU9sVMNsCvaZ/1T0EMx7uyDdDYaufOJROOfYO+eXI4w/TJzDvGlZNLlgNV5kiIkl
	Jpm6JGVixoX8TOFUnHvFk+TS/3sy4iQppYnPeyPHh3Azvnd08TMgqR6XHAKZ4TXwQBED
	wNx4vhV0UeicMc1AjGB9HNiColMaWPV0NGVq7ab4QxYE8H72XKIzXbjJ1AkYY70IXQD+
	7kK0/sSA4C9hN0IC7Ak2QsKRaqhiW03uwBB2U0n4LOzdgzlAghXiqhm5uzxIT0cHvkur
	lg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1761440722; x=1762045522;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=yS34+uhylNdFYNWrvgsPGh1bBy7nTRn8Y42YGAOkzr0=;
	b=rzeTh3Vfq0AqlrLpMVerIsk1f8nPTxzo0wobhv3YIBODjvigngpBUpYgvFk4y9ZWou
	vYPW5Ao11OidtsTdK0NpzPMKfPaIbmYcC4d/M+zslB7lv9cPRuewau2G+5SPWeDQXsTP
	cvFx0bFyNFYs9n4sZb75fP4kRp+pC37iuW+Xg4ve0IpnZA621tr1dPlHepVi9Yvhvqp6
	h8EmrTB4MsPGprEn8rM8XtDCp/Bfrqb93tcPIr9/tYBLYURRtPyMXqXLU3xeiOQd0755
	gaAtmiVtgoj6RhpRGp3/2hPRmHboKsg99oRN9MZ8lzA3bxoixPruzEDj0S41gJ88vorf
	SlpQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCX9VCdDbB69Kllx3I2bM4sbfywdyHWmmnb1jxz6mDBMegcbBcc3teyXDdNOkmWTXvDNPsf1xs5XOQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YzypflkfYbVeyDokTVbve4h0Bzn+eRo8WrJJJ89VyIpuuPRIiLm
	4K3twOSSnOzE1i77xYhELomtOuCvGoMVjJVJJdWgNavbd7kl5IiA9jXW
X-Gm-Gg: ASbGncvbfWBur8yPUv20PUkxjE4erDz8zu1U8Kg6H2vusC6BdvNFNmlTwNE5vCDUQLD
	hPvT4Zk2S6KtoFAXcu8/7F3T6D6cdNtrghIiPJWKVQOif2luQ6f3aTZxqHE+XYVOAi1RRoOHFBP
	P2vQ1kxw8Rte1ps2nnWiidK8TXsG6TKsAkB4x+bIIu0z0Ql6UcxJ/ftcf4lSHSo9Jo6pihpbWrz
	L86/kSGaj2tDOAzT4HN5RKpF68H84ib/FmGb1u/1FSJwKpVKN6lCUo1GuPtH68RvmV3G7kg76/L
	J2QLNYU1wEoEqMEcKpHnBHkkBQMhMd3zJ44PLDL/nZlWL0oEN2UQIaQ5wcl+vOGnIPjAERiHcFu
	i8LZ7c/OiN5VSDbG2OqsuJRFvoHX2h4hHlEIeZRmucv7EbfXfVFXp2GVAqnXaXtkHdG8UThJ62i
	vzKbs6w2I3z46HRA==
X-Google-Smtp-Source: AGHT+IGqJ3fK980blF3S2OhDDl1kPCFC3PDx3uiV6lRR9MlLGgQ+c3xMg89feF4XpI76Z2y7cP/wYQ==
X-Received: by 2002:a05:6a00:23c2:b0:780:f758:4133 with SMTP id
	d2e1a72fcca58-7a274ba91d9mr12147230b3a.10.1761440722260; 
	Sat, 25 Oct 2025 18:05:22 -0700 (PDT)
Received: from daniel.. ([221.218.137.209]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7a41404987esm3371597b3a.36.2025.10.25.18.05.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Oct 2025 18:05:21 -0700 (PDT)
From: jinji zhong <jinji.z.zhong@gmail.com>
To: minchan@kernel.org, senozhatsky@chromium.org, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
	corbet@lwn.net, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
	axboe@kernel.dk, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, akpm@linux-foundation.org, terrelln@fb.com,
	dsterba@suse.com
Subject: [RFC PATCH 0/3] Introduce per-cgroup compression priority
Date: Sun, 26 Oct 2025 01:05:07 +0000
Message-ID: <cover.1761439133.git.jinji.z.zhong@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:20:24 +0100
Cc: liulu.liu@honor.com, feng.han@honor.com, linux-doc@vger.kernel.org,
	muchun.song@linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	jinji zhong <jinji.z.zhong@gmail.com>, zhongjinji@honor.com,
	cgroups@vger.kernel.org, drbd-dev@lists.linbit.com
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

Hello everyone,

On Android, different applications have varying tolerance for
decompression latency. Applications with higher tolerance for
decompression latency are better suited for algorithms like ZSTD,
which provides high compression ratio but slower decompression
speed. Conversely, applications with lower tolerance for
decompression latency can use algorithms like LZ4 or LZO that
offer faster decompression but lower compression ratios. For example,
lightweight applications (with few anonymous pages) or applications
without foreground UI typically have higher tolerance for decompression
latency.

Similarly, in memory allocation slow paths or under high CPU
pressure, using algorithms with faster compression speeds might
be more appropriate.

This patch introduces a per-cgroup compression priority mechanism,
where different compression priorities map to different algorithms.
This allows administrators to select appropriate compression
algorithms on a per-cgroup basis.

Currently, this patch is experimental and we would greatly
appreciate community feedback. I'm uncertain whether obtaining
compression priority via get_cgroup_comp_priority in zram is the
best approach. While this implementation is convenient, it seems
somewhat unusual. Perhaps the next step should be to pass
compression priority through page->private.

jinji zhong (3):
  mm/memcontrol: Introduce per-cgroup compression priority
  zram: Zram supports per-cgroup compression priority
  Doc: Update documentation for per-cgroup compression priority

 Documentation/admin-guide/blockdev/zram.rst | 18 +++--
 Documentation/admin-guide/cgroup-v2.rst     |  7 ++
 drivers/block/zram/zram_drv.c               | 74 ++++++++++++++++++---
 drivers/block/zram/zram_drv.h               |  2 +
 include/linux/memcontrol.h                  | 19 ++++++
 mm/memcontrol.c                             | 31 +++++++++
 6 files changed, 139 insertions(+), 12 deletions(-)

-- 
2.48.1

