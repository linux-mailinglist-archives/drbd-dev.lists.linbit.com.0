Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899D915E25
	for <lists+drbd-dev@lfdr.de>; Tue, 25 Jun 2024 07:30:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C767420216;
	Tue, 25 Jun 2024 07:30:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 383 seconds by postgrey-1.31 at mail19;
	Mon, 24 Jun 2024 15:52:30 CEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 57F9C4200BE
	for <drbd-dev@lists.linbit.com>;
	Mon, 24 Jun 2024 15:52:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 511A060346;
	Mon, 24 Jun 2024 13:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6A4C32782;
	Mon, 24 Jun 2024 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719236766;
	bh=nEbRkmLliGbrhN7a0dFrrROolzsUWf2ymgDG1frRQgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPvBUv03t5fHmHl5Vdhl5NNvWh/1rmgJmDIUT78BrhNjkekMyiHBemsXBtITKK+pk
	Ph9y6SGv/k+x5Jl2xhlIMX2sddEfv5ScOkESPGjMaDvg1ZXM5kaST/YeMPDuDVXpgg
	iH6h0sucNAo73sjXdAnuoapZ6RfRXTSWnSxyRGyPeNDve4kUinDBuUenLUefA9rCqX
	54StG+jluCv5aLHX9mMsHCk5XhZuGMG20N2tbjRRxE9agT2YFzShKRFvN/weyUUZ99
	p5MaDhc41zpO0i44wkIP3EtvIWnOiXRYHg0365/uFE0+rIV0Jq+m7pwvM4OmoBjW+O
	CdaoXjn9E8fNg==
Date: Mon, 24 Jun 2024 15:45:57 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [axboe-block:for-next] [block] bd4a633b6f: fsmark.files_per_sec
	-64.5% regression
Message-ID: <Znl4lXRmK2ukDB7r@ryzen.lan>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
	<20240624083537.GA19941@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624083537.GA19941@lst.de>
X-Mailman-Approved-At: Tue, 25 Jun 2024 07:30:12 +0200
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org,
	fengwei.yin@intel.com, linux-mtd@lists.infradead.org,
	linux-bcache@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, lkp@intel.com,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, virtualization@lists.linux.dev,
	nbd@other.debian.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>,
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

On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> This is odd to say at least.  Any chance you can check the value
> of /sys/block/$DEVICE/queue/rotational for the relevant device before
> and after this commit?  And is this an ATA or NVMe SSD?
> 

Seems to be ATA SSD:
https://download.01.org/0day-ci/archive/20240624/202406241546.6bbd44a7-oliver.sang@intel.com/job.yaml

ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BG012T4_BTHC428201ZX1P2OGN-part1"

Most likely btrfs does something different depending on the nonrot flag
being set or not. (And like you are suggesting, most likely the value of
the nonrot flag is somehow different after commit bd4a633b6f)


Kind regards,
Niklas
