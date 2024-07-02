Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C51291F03A
	for <lists+drbd-dev@lfdr.de>; Tue,  2 Jul 2024 09:32:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F3EC4202D7;
	Tue,  2 Jul 2024 09:32:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B65F742016C
	for <drbd-dev@lists.linbit.com>; Tue,  2 Jul 2024 09:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yRJduJ4b13YGEVnBaImf8MBMoj+rPcyZfPfJ5uybrn0=;
	b=nxBkkv5533e0ibSUtWu/FWqca9
	T02UNeMXerA742jTnmxcJDpprQYJhN+AB5mjSyF1tkFtaC9NWv/DI0JPbLwQgi37wPeed5cA37c0e
	+2f4q+qCCkqKwjebfWNgYqdh3KcmHS4SeimB2eXIojre3wqBiKfJ74iCTIY0nzAi/62xdvvQQ9QVV
	ggumCBVJg78P9RdScYdX17RSGD42SxwMGXnk/F0Te2sI20BEGRBsqQOtoGA/KEqDDyMxAk9wtOs1O
	z/1WMLlWsZ6latPxKW85ISPYOrT1dPDdYNH/mzAspCJntQyhFPayqTd56frrg1OjYGXYjfO03yN/a
	E+Zh4hIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
	Hat Linux)) id 1sOXzk-00000005s56-0D5a;
	Tue, 02 Jul 2024 07:32:08 +0000
Date: Tue, 2 Jul 2024 00:32:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
	22.6% improvement
Message-ID: <ZoOs9wdR1yBPB-7J@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
	<ZnqGf49cvy6W-xWf@infradead.org>
	<Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
	<ZnuNhkH26nZi8fz6@infradead.org>
	<ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
	<ZnzwbYSaIlT0SIEy@infradead.org>
	<ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	feng.tang@intel.com, linux-nvme@lists.infradead.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	lkp@intel.com, linux-scsi@vger.kernel.org,
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

On Mon, Jul 01, 2024 at 04:22:19PM +0800, Oliver Sang wrote:
> from below, it seems the patchset doesn't introduce any performance improvement
> but a regression now. is this expected?

Not having the improvement at least alleviate my concerns about data
integrity.  I'm still curious where it comes from as it isn't exactly
expected.

