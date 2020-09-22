Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7C273E47
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Sep 2020 11:14:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 05AD9420B9F;
	Tue, 22 Sep 2020 11:14:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40CA4420B9C
	for <drbd-dev@lists.linbit.com>; Tue, 22 Sep 2020 11:14:14 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3198DAEEF;
	Tue, 22 Sep 2020 09:13:51 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 1C2AD1E12E3; Tue, 22 Sep 2020 11:13:14 +0200 (CEST)
Date: Tue, 22 Sep 2020 11:13:14 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200922091314.GD16464@quack2.suse.cz>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921080734.452759-8-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 07/13] block: lift setting the readahead size
 into the block layer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Mon 21-09-20 10:07:28, Christoph Hellwig wrote:
> Drivers shouldn't really mess with the readahead size, as that is a VM
> concept.  Instead set it based on the optimal I/O size by lifting the
> algorithm from the md driver when registering the disk.  Also set
> bdi->io_pages there as well by applying the same scheme based on
> max_sectors.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
...
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 76a7e03bcd6cac..01049e9b998f1d 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -452,6 +452,8 @@ EXPORT_SYMBOL(blk_limits_io_opt);
>  void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
>  {
>  	blk_limits_io_opt(&q->limits, opt);
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
>  }
>  EXPORT_SYMBOL(blk_queue_io_opt);
>  
> @@ -628,9 +630,6 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
>  		printk(KERN_NOTICE "%s: Warning: Device %s is misaligned\n",
>  		       top, bottom);
>  	}
> -
> -	t->backing_dev_info->io_pages =
> -		t->limits.max_sectors >> (PAGE_SHIFT - 9);
>  }
>  EXPORT_SYMBOL(disk_stack_limits);

One thing I've noticed is that blk_stack_limits() does not use
blk_queue_io_opt() to set new optimal limit. That means that ra_pages won't
be updated for the new queue. E.g. your DRDB change below will result in
ra_pages not being properly updated AFAICT.

Similarly it isn't clear to me how io_pages would get updated after
blk_stack_limits() updates max_hw_sectors...

Otherwise the patch looks good.

								Honza

> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index aaff5bde391506..f8fb1c9b1bb6c1 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -1360,18 +1360,8 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
>  	decide_on_discard_support(device, q, b, discard_zeroes_if_aligned);
>  	decide_on_write_same_support(device, q, b, o, disable_write_same);
>  
> -	if (b) {
> +	if (b)
>  		blk_stack_limits(&q->limits, &b->limits, 0);
> -
> -		if (q->backing_dev_info->ra_pages !=
> -		    b->backing_dev_info->ra_pages) {
> -			drbd_info(device, "Adjusting my ra_pages to backing device's (%lu -> %lu)\n",
> -				 q->backing_dev_info->ra_pages,
> -				 b->backing_dev_info->ra_pages);
> -			q->backing_dev_info->ra_pages =
> -						b->backing_dev_info->ra_pages;
> -		}
> -	}
>  	fixup_discard_if_not_supported(q);
>  	fixup_write_zeroes(device, q);
>  }
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
