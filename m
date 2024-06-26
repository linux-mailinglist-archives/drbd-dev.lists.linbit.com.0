Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E33999178B9
	for <lists+drbd-dev@lfdr.de>; Wed, 26 Jun 2024 08:18:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E05514203CE;
	Wed, 26 Jun 2024 08:18:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D49794200BE
	for <drbd-dev@lists.linbit.com>; Wed, 26 Jun 2024 08:18:06 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 85E4B68BEB; Wed, 26 Jun 2024 08:18:04 +0200 (CEST)
Date: Wed, 26 Jun 2024 08:18:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f:
	fsmark.files_per_sec -64.5% regression
Message-ID: <20240626061804.GA23481@lst.de>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
	<20240624083537.GA19941@lst.de>
	<Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org,
	fengwei.yin@intel.com, linux-mtd@lists.infradead.org,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com,
	xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, virtualization@lists.linux.dev,
	nbd@other.debian.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
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

On Wed, Jun 26, 2024 at 02:11:11PM +0800, Oliver Sang wrote:
> hi, Christoph Hellwig,
> 
> On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> > This is odd to say at least.  Any chance you can check the value
> > of /sys/block/$DEVICE/queue/rotational for the relevant device before
> > and after this commit?  And is this an ATA or NVMe SSD?
> > 
> 
> yeah, as Niklas mentioned, it's an ATA SSD.
> 
> I checked the /sys/block/$DEVICE/queue/rotational before and after this commit,
> both show '0'. not sure if this is expected.
> 
> anyway, I noticed you send a patch [1]
> 
> so I applied this patch upon bd4a633b6f, and found the performance restored.

Thanks for testing!

