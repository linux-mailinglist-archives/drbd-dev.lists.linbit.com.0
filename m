Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 542CF903214
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 08:01:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D6A16420651;
	Tue, 11 Jun 2024 08:01:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC5E742039E
	for <drbd-dev@lists.linbit.com>;
	Tue, 11 Jun 2024 07:57:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ABDF60C8C;
	Tue, 11 Jun 2024 05:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8B3C2BD10;
	Tue, 11 Jun 2024 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085090;
	bh=n/truQQNALnyrE4ZbwFnrA1tq2cozaH91kaKcSN3ADo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ANn0WrF5kOQJZxWO+lYlEGkU5hVzQiFb2dNu1fRL0d2IWY3RReTj+asObSRTOVsDn
	nik3p07qhEGu9jO0A5uH0hbRiLwLOJ3d6qy5Lpfrdzdf1JpR8Qb6Y+TeigefvpTdHC
	PaMP9CtOKbfsr2fBnfzUYFtnczoPg5lf2QS4Trvu+DMNLb/UDOZQCC9uHBx6LdmPM8
	/dgqDFvO1q4KPpY9GF6hhisUoWhTc6hasUEAygvr3guCne7aOz50r92/yOBM880RPV
	/mezANfcSB8zUh/+nThd+2qNqFJrJ+m45Wswa5U72/uWVWbOFnW/S5hmwY1Gx82O5w
	+K3mqL1+sk3wQ==
Message-ID: <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
Date: Tue, 11 Jun 2024 14:51:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
	sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-3-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 11 Jun 2024 08:01:28 +0200
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
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

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move a bit of code that sets up the zone flag and the write granularity
> into sd_zbc_read_zones to be with the rest of the zoned limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/scsi/sd.c     | 21 +--------------------
>  drivers/scsi/sd_zbc.c | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 85b45345a27739..5bfed61c70db8f 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3308,29 +3308,10 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp,
>  		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
>  	}
>  
> -
> -#ifdef CONFIG_BLK_DEV_ZONED /* sd_probe rejects ZBD devices early otherwise */
> -	if (sdkp->device->type == TYPE_ZBC) {
> -		lim->zoned = true;
> -
> -		/*
> -		 * Per ZBC and ZAC specifications, writes in sequential write
> -		 * required zones of host-managed devices must be aligned to
> -		 * the device physical block size.
> -		 */
> -		lim->zone_write_granularity = sdkp->physical_block_size;
> -	} else {
> -		/*
> -		 * Host-aware devices are treated as conventional.
> -		 */
> -		lim->zoned = false;
> -	}
> -#endif /* CONFIG_BLK_DEV_ZONED */
> -
>  	if (!sdkp->first_scan)
>  		return;
>  
> -	if (lim->zoned)
> +	if (sdkp->device->type == TYPE_ZBC)

Nit: use sd_is_zoned() here ?

>  		sd_printk(KERN_NOTICE, sdkp, "Host-managed zoned block device\n");
>  	else if (sdkp->zoned == 1)
>  		sd_printk(KERN_NOTICE, sdkp, "Host-aware SMR disk used as regular disk\n");
> diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
> index 422eaed8457227..e9501db0450be3 100644
> --- a/drivers/scsi/sd_zbc.c
> +++ b/drivers/scsi/sd_zbc.c
> @@ -598,8 +598,19 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
>  	u32 zone_blocks = 0;
>  	int ret;
>  
> -	if (!sd_is_zoned(sdkp))
> +	if (!sd_is_zoned(sdkp)) {
> +		lim->zoned = false;

Maybe we should clear the other zone related limits here ? If the drive is
reformatted/converted from SMR to CMR (FORMAT WITH PRESET), the other zone
limits may be set already, no ?

>  		return 0;
> +	}
> +
> +	lim->zoned = true;
> +
> +	/*
> +	 * Per ZBC and ZAC specifications, writes in sequential write required
> +	 * zones of host-managed devices must be aligned to the device physical
> +	 * block size.
> +	 */
> +	lim->zone_write_granularity = sdkp->physical_block_size;
>  
>  	/* READ16/WRITE16/SYNC16 is mandatory for ZBC devices */
>  	sdkp->device->use_16_for_rw = 1;

-- 
Damien Le Moal
Western Digital Research

