Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id B85669033A1
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 09:30:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B03F4208DE;
	Tue, 11 Jun 2024 09:30:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E9F542089E
	for <drbd-dev@lists.linbit.com>;
	Tue, 11 Jun 2024 09:30:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E9A560D2B;
	Tue, 11 Jun 2024 07:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC6CC2BD10;
	Tue, 11 Jun 2024 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718091045;
	bh=mXwlDhzGw5x2p2Nr8gAFPISP2nDIAfZIJOaFJyvJXOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VCI1eDgXTsePnpt155uEye/3wYDicIPNZJ3+S2Hq2BKZNkLNvV5I0fT+JdCzdUnSb
	yuXJ7xiSHP9TiSA6PVPXt+qO9Dn4e1NQaWtG0WZKRDKr7qk2obBVABl9+DPiAto15R
	ZY06Qeaqugg7VSWPCcJ0qkt9/u4FV8hF/W3PG2hU6Xg27Ev50hNdLuTn4EcUBYyJ8n
	S+KRGHhRfCxLhpogZoDRTutfmrs5hXd1HvW8FhrlCCZSHQ5haYJkZbrzON8/BzrfEH
	kcYMtKu/xYq8uguhHsXhgHJwfT/OivpjDtyI/mVqW6dF9WSlmB2m2KaCIH1Th4AQTt
	8udJurnL3fqPA==
Message-ID: <fdfc024a-368a-4495-8b85-b5ab7741f6d4@kernel.org>
Date: Tue, 11 Jun 2024 16:30:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when they
	fail
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-11-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
> blkfront always had a robust negotiation protocol for detecting a write
> cache.  Stop simply disabling cache flushes when they fail as that is
> a grave error.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me but maybe mention that removal of xlvbd_flush() as well ?
And it feels like the "stop disabling cache flushes when they fail" part should
be a fix patch sent separately...

Anyway, for both parts, feel free to add:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/block/xen-blkfront.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 9b4ec3e4908cce..9794ac2d3299d1 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -982,18 +982,6 @@ static const char *flush_info(struct blkfront_info *info)
>  		return "barrier or flush: disabled;";
>  }
>  
> -static void xlvbd_flush(struct blkfront_info *info)
> -{
> -	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
> -			      info->feature_fua ? true : false);
> -	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
> -		info->gd->disk_name, flush_info(info),
> -		"persistent grants:", info->feature_persistent ?
> -		"enabled;" : "disabled;", "indirect descriptors:",
> -		info->max_indirect_segments ? "enabled;" : "disabled;",
> -		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
> -}
> -
>  static int xen_translate_vdev(int vdevice, int *minor, unsigned int *offset)
>  {
>  	int major;
> @@ -1162,7 +1150,15 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
>  	info->sector_size = sector_size;
>  	info->physical_sector_size = physical_sector_size;
>  
> -	xlvbd_flush(info);
> +	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
> +			      info->feature_fua ? true : false);
> +
> +	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
> +		info->gd->disk_name, flush_info(info),
> +		"persistent grants:", info->feature_persistent ?
> +		"enabled;" : "disabled;", "indirect descriptors:",
> +		info->max_indirect_segments ? "enabled;" : "disabled;",
> +		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
>  
>  	if (info->vdisk_info & VDISK_READONLY)
>  		set_disk_ro(gd, 1);
> @@ -1622,13 +1618,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
> -			if (unlikely(blkif_req(req)->error)) {
> -				if (blkif_req(req)->error == BLK_STS_NOTSUPP)
> -					blkif_req(req)->error = BLK_STS_OK;
> -				info->feature_fua = 0;
> -				info->feature_flush = 0;
> -				xlvbd_flush(info);
> -			}
>  			fallthrough;
>  		case BLKIF_OP_READ:
>  		case BLKIF_OP_WRITE:

-- 
Damien Le Moal
Western Digital Research

