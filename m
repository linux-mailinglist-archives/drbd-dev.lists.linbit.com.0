Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C1C241BF
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:22:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8FF421627BB;
	Fri, 31 Oct 2025 10:21:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 923 seconds by postgrey-1.31 at mail19;
	Thu, 30 Oct 2025 10:38:28 CET
Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3FCB81608F1
	for <drbd-dev@lists.linbit.com>; Thu, 30 Oct 2025 10:38:28 +0100 (CET)
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4cxzCF3ckdzYlcX2;
	Thu, 30 Oct 2025 17:22:01 +0800 (CST)
Received: from a018.hihonor.com (10.68.17.250) by w012.hihonor.com
	(10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11;
	Thu, 30 Oct 2025 17:23:02 +0800
Received: from localhost.localdomain (10.144.20.219) by a018.hihonor.com
	(10.68.17.250) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11;
	Thu, 30 Oct 2025 17:23:02 +0800
From: zhongjinji <zhongjinji@honor.com>
To: <tj@kernel.org>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
Date: Thu, 30 Oct 2025 17:22:58 +0800
Message-ID: <20251030092258.2576-1-zhongjinji@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <aP-Ymcsoyls04jov@slm.duckdns.org>
References: <aP-Ymcsoyls04jov@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.20.219]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a018.hihonor.com
	(10.68.17.250)
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:20:24 +0100
Cc: linux-doc@vger.kernel.org, roman.gushchin@linux.dev, mhocko@kernel.org,
	liulu.liu@honor.com, shakeel.butt@linux.dev,
	philipp.reisner@linbit.com, drbd-dev@lists.linbit.com,
	corbet@lwn.net, jinji.z.zhong@gmail.com,
	senozhatsky@chromium.org, linux-block@vger.kernel.org,
	terrelln@fb.com, dsterba@suse.com, cgroups@vger.kernel.org,
	lars.ellenberg@linbit.com, axboe@kernel.dk, feng.han@honor.com,
	linux-mm@kvack.org, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	mkoutny@suse.com, hannes@cmpxchg.org, zhongjinji@honor.com,
	akpm@linux-foundation.org
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

> Hello,
> 
> On Sun, Oct 26, 2025 at 01:05:07AM +0000, jinji zhong wrote:
> > This patch introduces a per-cgroup compression priority mechanism,
> > where different compression priorities map to different algorithms.
> > This allows administrators to select appropriate compression
> > algorithms on a per-cgroup basis.
> 
> I don't think it makes sense to tie this to cgroups. Is there something
> preventing this from following the process hierarchy?
> Thanks.
Hello, Tejun,

There is also a layer of page tables between the process and the page,
so making it follow the process hierarchy would be complicated.
But you make a good point; it may indeed be unnecessary to introduce
a separate per-cgroup compression priority. As Nhat suggested,
we could try reusing the per-cgroup swap priority.

> -- 
> tejun
