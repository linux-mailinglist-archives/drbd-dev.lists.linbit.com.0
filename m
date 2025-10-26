Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB2C241A1
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:21:29 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 312B81627B1;
	Fri, 31 Oct 2025 10:20:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8622C162762
	for <drbd-dev@lists.linbit.com>; Sun, 26 Oct 2025 02:05:48 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id
	d2e1a72fcca58-7a23208a0c2so2614265b3a.0
	for <drbd-dev@lists.linbit.com>; Sat, 25 Oct 2025 18:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1761440747; x=1762045547;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=BrWku1aIMMMg9GTv7ArefROi2Vd01OtJJzpQozkukKo=;
	b=SZsDCErcipX5n4WfHTC5+RYpXwcQj/XVa/j3eve3U7itFsI3oSxZwIuXVecXZn/P3l
	MYTGq4uTAqPBhrh36EVxVqeg55wcQS5OgohRiSt24OC/tmq3gfhknFmBQifAOPmVikA3
	t2CJ4vjXnaPrjlONQVJ0vDyLyNQGzk1jy/L3ivMAry+Qmwd99KbXgYWm7n/tegRdzHgI
	xMVKbwuHhIKsI5VdZoco+98C0leSsXQkZluu9uMmnfYPSJL+7X7uEMlfCwuXxX6JIaJ9
	tWb44f2y4ibE9WmzEv994uypMPvBl0JD8sVvJCdQduGa35aSKXf3P43KiUalO9mxt5Tr
	+FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1761440747; x=1762045547;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=BrWku1aIMMMg9GTv7ArefROi2Vd01OtJJzpQozkukKo=;
	b=mM0KDxGDD9gwlWBWefRkByA16ok+fpu4d8mGYUP2Kj10tj0wuHzo5xccdNZAmx/6GS
	SRM3cMfJlSMzA+k2wAqB5YBsfMMqdynv5hCJlz7K7mHiMNzSMWmLN+LjRVq7zemwAi+U
	6VfuMESywe2rf/bkLufv+f0NPGvr0azQftleHAmWtLi5kFw53Ec03SyXuC+cWS+dugqv
	kCFYapG/rNmEPHRfqtKxuRxkbLMhC4C2FuEgz9GJ90idh1pt+oEb79XDKYjWnWsW+1uL
	uJJ+mK5qEVifytUH0EkQjnpPVtAHMFjMzAwedAH/j2+4XGe3nsL4ayDf9F7YkvOMTM43
	t7OQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCXi6hBKqSdvOKi4uziNLTgPObEdBOVWr9YWrRExDtYYC3tr1TBUdSz/S6zTFMpxXdLdB8y2tU6jEg==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw81kuXdEZ7Rl5MXsBF0rB1Cn9C9gIQLW2uJM4r2M7ElIvZ0u1P
	bk/+vZj5LVxywbmIryiCxIz9+PAPsVGTPmpoPtcEC+wIpN+7pkCYOR1S
X-Gm-Gg: ASbGncuKnL8l1xYk+NubtzLeRFqYFteg0a9wU57KCzlLuzH4yFm5ISEQtI1JPbkRysv
	hJLnG/nppyDOuqLg4O0M4d6TB7aBzRa/6W6xbT/8GfzJuhLQH6639M8hLtShIK2O//oEV/DJ8qn
	X2shIcP+7FyV/yLFt777yJ6u6i/YPBuWVqu5V20LKR9/xl6Xjs4kTAjankmwpdJax7QaxmgJZmJ
	nvCFHv7N1AmIwsRCuZw9o2uyrrEw+9AHp9GolYkXqdnwOS4GR1gV8I8X9h+vAKLvTFAhc9F29ap
	9FMGHAneU5HAZqtJN/PJzmqydgWrujq9vb68EpcAhJzyAQfgMlOYWZtgdNREfEuVl6NFexSLd/B
	5piYopvswjD2HhTrvpAjd0V4bh+hiIibdqv95PFYcDlmP/R89ta43iiXcvVrPKHFeOcRrS7taGV
	KDmX8=
X-Google-Smtp-Source: AGHT+IEfMl6RnbpkDRz3xPKw02ZxvVMy5U+m1L9klxFtFN/jBXClYLwUkIitj9v1zCClkhcSl7XzQA==
X-Received: by 2002:a05:6a00:a15:b0:7a2:7893:b17a with SMTP id
	d2e1a72fcca58-7a27893b21dmr11885518b3a.6.1761440747382; 
	Sat, 25 Oct 2025 18:05:47 -0700 (PDT)
Received: from daniel.. ([221.218.137.209]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7a41404987esm3371597b3a.36.2025.10.25.18.05.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Oct 2025 18:05:47 -0700 (PDT)
From: jinji zhong <jinji.z.zhong@gmail.com>
To: minchan@kernel.org, senozhatsky@chromium.org, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
	corbet@lwn.net, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
	axboe@kernel.dk, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, akpm@linux-foundation.org, terrelln@fb.com,
	dsterba@suse.com
Subject: [RFC PATCH 3/3] Doc: Update documentation for per-cgroup compression
	priority
Date: Sun, 26 Oct 2025 01:05:10 +0000
Message-ID: <25cab6bc87a6cd69983e2fa0908441bc37015c98.1761439133.git.jinji.z.zhong@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1761439133.git.jinji.z.zhong@gmail.com>
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
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

This patch updates the documentation, describing the newly
introduced per-cgroup compression priority mechanism.
---
 Documentation/admin-guide/blockdev/zram.rst | 18 ++++++++++++++----
 Documentation/admin-guide/cgroup-v2.rst     |  7 +++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 3e273c1bb749..de4ab060f664 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -452,12 +452,12 @@ using more effective algorithm and, hence, reduce zsmalloc memory usage.
 With CONFIG_ZRAM_MULTI_COMP, zram supports up to 4 compression algorithms:
 one primary and up to 3 secondary ones. Primary zram compressor is explained
 in "3) Select compression algorithm", secondary algorithms are configured
-using recomp_algorithm device attribute.
+using multi_comp_algorithm device attribute.
 
 Example:::
 
 	#show supported recompression algorithms
-	cat /sys/block/zramX/recomp_algorithm
+	cat /sys/block/zramX/multi_comp_algorithm
 	#1: lzo lzo-rle lz4 lz4hc [zstd]
 	#2: lzo lzo-rle lz4 [lz4hc] zstd
 
@@ -468,10 +468,10 @@ Alternative compression algorithm's priority is provided during algorithms
 configuration:::
 
 	#select zstd recompression algorithm, priority 1
-	echo "algo=zstd priority=1" > /sys/block/zramX/recomp_algorithm
+	echo "algo=zstd priority=1" > /sys/block/zramX/multi_comp_algorithm
 
 	#select deflate recompression algorithm, priority 2
-	echo "algo=deflate priority=2" > /sys/block/zramX/recomp_algorithm
+	echo "algo=deflate priority=2" > /sys/block/zramX/multi_comp_algorithm
 
 Another device attribute that CONFIG_ZRAM_MULTI_COMP enables is recompress,
 which controls recompression.
@@ -524,6 +524,16 @@ This can be achieved by providing a `algo` or `priority` parameter:::
 	#use zstd algorithm only (if zstd was registered under priority 1)
 	echo "type=huge priority=1" > /sys/block/zramX/recompress
 
+per-cgroup compression algorithms
+-------------
+With CONFIG_ZRAM_MULTI_COMP, zram can compress pages using the compression
+algorithm determined by the cgroup. It will get the compression priority from
+the cgroup and use the corresponding compression algorithm to compress the page.
+
+To use the feature, admin should enable per-cgroup compression via::
+
+	echo 1 > /sys/block/zramX/per_cgroup_comp_enable
+
 memory tracking
 ===============
 
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 0e6c67ac585a..1706d8f0d225 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1871,6 +1871,13 @@ The following nested keys are defined.
 	higher than the limit for an extended period of time.  This
 	reduces the impact on the workload and memory management.
 
+  memory.swap.compress_priority
+	A read-write single value file which exists on non-root
+	cgroups.  The default is "0".
+
+	swap compress priority for the cgroup. Different compression
+	priorities mean different compression algorithms.
+
   memory.zswap.current
 	A read-only single value file which exists on non-root
 	cgroups.
-- 
2.48.1

