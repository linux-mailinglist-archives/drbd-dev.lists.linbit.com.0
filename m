Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733890A56B
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 08:23:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF70C4206C7;
	Mon, 17 Jun 2024 08:23:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0882D420657
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 08:23:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 93B9FCE0FF0;
	Mon, 17 Jun 2024 06:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0EEC4AF1D;
	Mon, 17 Jun 2024 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718605412;
	bh=uMvSBiMCv5pxii/WRMe23vNNUZcfAqUN7YYlV2bv5Ko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BLJEJwmMsCdQfpgeuSDFFhnTeYFrqXQ3GLsKdxLZUdhrqVCdlccETSs3reVgf76Rb
	4NtHvzGyiVxgePozGjF6t5kslEhri7LHZl0DvN4BR4smuIdi3fWqPb/I1vVcfCYeYi
	fiVbKgy6qBR19yAJJ+QQiLpd0oScLx6sTzGkD0QZlko71H6Yz0ku2d3RgXA7QaUtXr
	GCCeiq+Ax8cIg0E+JxaozXjwtykL41yfJ3EoBVzh7JOK3qIJv+ADxMbH5/c2pw1ot4
	Uz1JoQGCWSohEy6+TWZP70VoRi8sStV1FCojepppq975Nhv9oB4B67NtvIDhRuNUUc
	t0DawHP78ZCMQ==
Message-ID: <3247433c-b356-425c-a888-8f7904351a2f@kernel.org>
Date: Mon, 17 Jun 2024 15:23:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] block: move cache control settings out of
	queue->flags
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-14-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

On 6/17/24 15:04, Christoph Hellwig wrote:
> Move the cache control settings into the queue_limits so that the flags
> can be set atomically with the device queue frozen.
> 
> Add new features and flags field for the driver set flags, and internal
> (usually sysfs-controlled) flags in the block layer.  Note that we'll
> eventually remove enough field from queue_limits to bring it back to the
> previous size.
> 
> The disable flag is inverted compared to the previous meaning, which
> means it now survives a rescan, similar to the max_sectors and
> max_discard_sectors user limits.
> 
> The FLUSH and FUA flags are now inherited by blk_stack_limits, which
> simplified the code in dm a lot, but also causes a slight behavior
> change in that dm-switch and dm-unstripe now advertise a write cache
> despite setting num_flush_bios to 0.  The I/O path will handle this
> gracefully, but as far as I can tell the lack of num_flush_bios
> and thus flush support is a pre-existing data integrity bug in those
> targets that really needs fixing, after which a non-zero num_flush_bios
> should be required in dm for targets that map to underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org> [mmc]

A few nits below. With these fixed,

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +Implementation details for bio based block drivers
> +--------------------------------------------------
> +
> +For bio based drivers the REQ_PREFLUSH and REQ_FUA bit are simplify passed on

...bit are simplify... -> ...bits are simply...

> +to the driver if the drivers sets the BLK_FEAT_WRITE_CACHE flag and the drivers
> +needs to handle them.

s/drivers/driver (2 times)

> -and the driver must handle write requests that have the REQ_FUA bit set
> -in prep_fn/request_fn.  If the FUA bit is not natively supported the block
> -layer turns it into an empty REQ_OP_FLUSH request after the actual write.
> +When the BLK_FEAT_FUA flags is set, the REQ_FUA bit simplify passed on for the

s/bit simplify/bit is simply


-- 
Damien Le Moal
Western Digital Research

