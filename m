Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A39176E1
	for <lists+drbd-dev@lfdr.de>; Wed, 26 Jun 2024 05:40:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B30D4203C0;
	Wed, 26 Jun 2024 05:40:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87E7E420216
	for <drbd-dev@lists.linbit.com>; Wed, 26 Jun 2024 05:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q35hat2STPhlr4DAn4+ABXn/NxJWaK5wgb5DlM6xpCg=;
	b=v38aUgExch/0roE+EfRJ2Glql8
	NJM5fN+YEIB1TYrzijSpWBKOBPz4ePJWBmxAeIq8Vy0dgCM+B8D7e2Uu/8N8Um6Vr/QojQ2rgIn5c
	kZ0Qn4LEY3fOdOmfyKwMWEDOh9Ymv1GdTyRuFBajkXiPOidtU70du4sEE9xKuUof+3qQcWAWRaj21
	Q277QHf25k5Hs4ZG2a3z7KhsZxdHv16NmcJJI6IIXWv8/dTL6K+es5s2mnReHc51vjem7WfsNQ2Oh
	GFZANqqhPdUBbop3nLGkV+BdHz5dumNmTIDB8b0TUPLkhRAW/U3MN14I64qofM3LTvdEoRKFoAPJn
	ZHT0K0YA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
	Hat Linux)) id 1sMJVe-00000005Ecx-3HCZ;
	Wed, 26 Jun 2024 03:39:50 +0000
Date: Tue, 25 Jun 2024 20:39:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
	22.6% improvement
Message-ID: <ZnuNhkH26nZi8fz6@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
	<ZnqGf49cvy6W-xWf@infradead.org>
	<Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	feng.tang@intel.com, linux-nvme@lists.infradead.org,
	linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com, lkp@intel.com, linux-scsi@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, ying.huang@intel.com,
	xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, virtualization@lists.linux.dev,
	nbd@other.debian.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	fengwei.yin@intel.com, oe-lkp@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
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

On Wed, Jun 26, 2024 at 10:10:49AM +0800, Oliver Sang wrote:
> I'm not sure I understand this test request. as in title, we see a good
> improvement of aim7 for 1122c0c1cc, and we didn't observe other issues for
> this commit.

The improvement suggests we are not sending cache flushes when we should
send them, or at least just handle them in md.

> do you mean this improvement is not expected or exposes some problems instead?
> then by below patch, should the performance back to the level of parent of
> 1122c0c1cc?
> 
> sure! it's our great pleasure to test your patches. I noticed there are
> [1]
> https://lore.kernel.org/all/20240625110603.50885-2-hch@lst.de/
> which includes "[PATCH 1/7] md: set md-specific flags for all queue limits"
> [2]
> https://lore.kernel.org/all/20240625145955.115252-2-hch@lst.de/
> which includes "[PATCH 1/8] md: set md-specific flags for all queue limits"
> 
> which one you suggest us to test?
> do we only need to apply the first patch "md: set md-specific flags for all queue limits"
> upon 1122c0c1cc?
> then is the expectation the performance back to parent of 1122c0c1cc?

Either just the patch in reply or the entire [2] series would be fine.

Thanks!

