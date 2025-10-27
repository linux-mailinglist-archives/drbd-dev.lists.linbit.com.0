Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA2C0F361
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Oct 2025 17:17:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC1C816276C;
	Mon, 27 Oct 2025 17:16:53 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 597 seconds by postgrey-1.31 at mail19;
	Mon, 27 Oct 2025 17:16:49 CET
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CA987160952
	for <drbd-dev@lists.linbit.com>; Mon, 27 Oct 2025 17:16:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6C08604F8;
	Mon, 27 Oct 2025 16:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D84C4CEF1;
	Mon, 27 Oct 2025 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761581210;
	bh=lgYGdJqJLSXnsekhf4n7haNtiB25n4IV3mTGIwEdIt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtLEgncf3+Nx2+/q5LePpZKjn73XUJB/FjnjW8HOPme7rRrIUzbkPoZ9yLit4Xdd6
	1th/Izvrun+V9r9cyFF2FlcbICtJKaG7RzQ4ySXdiKJ0f+BrpN9c0DmY0cFNsethnt
	cdyTZ4OMaCzePVC69gtUtKBPD12NlwU2AB/Xoy51tq8Il91BP9lhqFAok/9W2zvVWJ
	NZ4g22e8RDxsHWMXBgWXmPN6PT9kHcGH9sNxc443NtmfgHkcK5kK/BwM3lywrlVfzC
	dR1hJ6hqKugOAnPoiTvkuXKy6Xx2ZYi4tCp7OGoNfX+KysZvHF1SvCGQlKhMyvcFdd
	M1GxuWkiW9oxw==
Date: Mon, 27 Oct 2025 06:06:49 -1000
From: Tejun Heo <tj@kernel.org>
To: jinji zhong <jinji.z.zhong@gmail.com>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
Message-ID: <aP-Ymcsoyls04jov@slm.duckdns.org>
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761439133.git.jinji.z.zhong@gmail.com>
Cc: linux-doc@vger.kernel.org, roman.gushchin@linux.dev,
	philipp.reisner@linbit.com, linux-mm@kvack.org,
	shakeel.butt@linux.dev, drbd-dev@lists.linbit.com,
	corbet@lwn.net, senozhatsky@chromium.org,
	linux-block@vger.kernel.org, terrelln@fb.com, dsterba@suse.com,
	cgroups@vger.kernel.org, mhocko@kernel.org,
	akpm@linux-foundation.org, axboe@kernel.dk, feng.han@honor.com,
	liulu.liu@honor.com, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	mkoutny@suse.com, hannes@cmpxchg.org, zhongjinji@honor.com,
	lars.ellenberg@linbit.com
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

Hello,

On Sun, Oct 26, 2025 at 01:05:07AM +0000, jinji zhong wrote:
> This patch introduces a per-cgroup compression priority mechanism,
> where different compression priorities map to different algorithms.
> This allows administrators to select appropriate compression
> algorithms on a per-cgroup basis.

I don't think it makes sense to tie this to cgroups. Is there something
preventing this from following the process hierarchy?

Thanks.

-- 
tejun
