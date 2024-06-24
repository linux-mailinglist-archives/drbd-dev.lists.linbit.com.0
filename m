Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D98A91550B
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 19:08:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ACEC74203BF;
	Mon, 24 Jun 2024 19:08:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2590C420324
	for <drbd-dev@lists.linbit.com>;
	Mon, 24 Jun 2024 19:08:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EF2B60E16;
	Mon, 24 Jun 2024 17:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682D2C2BBFC;
	Mon, 24 Jun 2024 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719248903;
	bh=c5IMwi2AkSm61J7nCdd2EBXV6o3vo+7AANeGa2JN45A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8C/s3NgDhBmDzX7X6Z3a8NgLG1XRNWm3AVon41eJewAqY4XNmD50+AdQpjukysaA
	0+c9peZEcs8AURzleAxgVmV3zaxrAP0+WMQxnkR3oNoVdRegLrw7QTozLmVentUZPE
	P0BMSL1dkoExQoFoaBFFudfcpEmdYCHeKJ0irUoLxUFwgxCKTvfHLKHNHL2RN4iLoh
	ki4NFa+liGK52kKToNiMhO53pIJVSGFwHndW7Uw+1UTH4eb3kjlEU/UFxvZz4PM4y3
	BbdO/dVn76ts+09ZmrGp9NorxeNYJ2cNYzLcTNejNMPSMmam7/bl5ZZAKhBMTTCFIl
	W6hH1Idyq3vZQ==
Date: Mon, 24 Jun 2024 11:08:16 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
Message-ID: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-15-hch@lst.de>
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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

On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
> -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, &(q)->queue_flags)
> +#define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)

This is inverted. Should be:

 #define blk_queue_nonrot(q)	(!((q)->limits.features & BLK_FEAT_ROTATIONAL))
