Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4FC241D4
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:22:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F82D1627BF;
	Fri, 31 Oct 2025 10:21:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1105 seconds by postgrey-1.31 at mail19;
	Thu, 30 Oct 2025 12:51:00 CET
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE6C71608F1
	for <drbd-dev@lists.linbit.com>; Thu, 30 Oct 2025 12:51:00 +0100 (CET)
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cy24h54rFzYkxgw;
	Thu, 30 Oct 2025 19:31:32 +0800 (CST)
Received: from a018.hihonor.com (10.68.17.250) by w002.hihonor.com
	(10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11;
	Thu, 30 Oct 2025 19:32:33 +0800
Received: from localhost.localdomain (10.144.20.219) by a018.hihonor.com
	(10.68.17.250) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11;
	Thu, 30 Oct 2025 19:32:32 +0800
From: zhongjinji <zhongjinji@honor.com>
To: <shakeel.butt@linux.dev>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
Date: Thu, 30 Oct 2025 19:32:28 +0800
Message-ID: <20251030113228.18817-1-zhongjinji@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <k6jwua5rlkds7dxomwvxotwtjq4hauyevvyoxd5hjz733k7kk5@mmezlradxhpu>
References: <k6jwua5rlkds7dxomwvxotwtjq4hauyevvyoxd5hjz733k7kk5@mmezlradxhpu>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.20.219]
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a018.hihonor.com
	(10.68.17.250)
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:20:24 +0100
Cc: linux-doc@vger.kernel.org, roman.gushchin@linux.dev, mhocko@kernel.org,
	liulu.liu@honor.com, philipp.reisner@linbit.com,
	drbd-dev@lists.linbit.com, corbet@lwn.net,
	jinji.z.zhong@gmail.com, senozhatsky@chromium.org,
	linux-block@vger.kernel.org, terrelln@fb.com, dsterba@suse.com,
	cgroups@vger.kernel.org, lars.ellenberg@linbit.com,
	axboe@kernel.dk, feng.han@honor.com, linux-mm@kvack.org,
	muchun.song@linux.dev, linux-kernel@vger.kernel.org,
	minchan@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org,
	tj@kernel.org, zhongjinji@honor.com, akpm@linux-foundation.org
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

> Hi Jinji,
> 
> On Sun, Oct 26, 2025 at 01:05:07AM +0000, jinji zhong wrote:
> > Hello everyone,
> > 
> > On Android, different applications have varying tolerance for
> > decompression latency. Applications with higher tolerance for
> > decompression latency are better suited for algorithms like ZSTD,
> > which provides high compression ratio but slower decompression
> > speed. Conversely, applications with lower tolerance for
> > decompression latency can use algorithms like LZ4 or LZO that
> > offer faster decompression but lower compression ratios. For example,
> > lightweight applications (with few anonymous pages) or applications
> > without foreground UI typically have higher tolerance for decompression
> > latency.
> > 
> > Similarly, in memory allocation slow paths or under high CPU
> > pressure, using algorithms with faster compression speeds might
> > be more appropriate.
> > 
> > This patch introduces a per-cgroup compression priority mechanism,
> > where different compression priorities map to different algorithms.
> > This allows administrators to select appropriate compression
> > algorithms on a per-cgroup basis.
> > 
> > Currently, this patch is experimental and we would greatly
> > appreciate community feedback. I'm uncertain whether obtaining
> > compression priority via get_cgroup_comp_priority in zram is the
> > best approach. While this implementation is convenient, it seems
> > somewhat unusual. Perhaps the next step should be to pass
> > compression priority through page->private.
> > 
> 
> Setting aside the issues in the implementation (like changing
> compression algorithm of a cgroup while it already has some memory

Zram uses flags to track the compression priority of each page,
which should be ok when the page is decompressed.

> compressed using older algo), I don't think memcg interface is the right
> way to go about it. We usually add interfaces to memcg that have
> hierarchical semantics.

Thanks a lot, Shakeel. I got it.

> Anyways if you want to have this feature, I think BPF might be the way
> to get this flexibility without introducing any stable API and then you
> can experiment and evaluate if this really helps.

