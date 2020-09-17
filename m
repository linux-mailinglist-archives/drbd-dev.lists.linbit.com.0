Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEF26D7F5
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Sep 2020 11:46:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8ADC420E00;
	Thu, 17 Sep 2020 11:46:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D2F98420DE4
	for <drbd-dev@lists.linbit.com>; Thu, 17 Sep 2020 11:46:15 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6D705AFE5;
	Thu, 17 Sep 2020 09:46:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 5E80E1E12E1; Thu, 17 Sep 2020 11:46:15 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:46:15 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917094615.GI7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 02/12] drbd: remove dead code in
	device_to_statistics
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

On Thu 10-09-20 16:48:22, Christoph Hellwig wrote:
> Ever since the switch to blk-mq, a lower device not used for VM
> writeback will not be marked congested, so the check will never
> trigger.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/drbd/drbd_nl.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index 43c8ae4d9fca81..aaff5bde391506 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -3370,7 +3370,6 @@ static void device_to_statistics(struct device_statistics *s,
>  	if (get_ldev(device)) {
>  		struct drbd_md *md = &device->ldev->md;
>  		u64 *history_uuids = (u64 *)s->history_uuids;
> -		struct request_queue *q;
>  		int n;
>  
>  		spin_lock_irq(&md->uuid_lock);
> @@ -3384,11 +3383,6 @@ static void device_to_statistics(struct device_statistics *s,
>  		spin_unlock_irq(&md->uuid_lock);
>  
>  		s->dev_disk_flags = md->flags;
> -		q = bdev_get_queue(device->ldev->backing_bdev);
> -		s->dev_lower_blocked =
> -			bdi_congested(q->backing_dev_info,
> -				      (1 << WB_async_congested) |
> -				      (1 << WB_sync_congested));
>  		put_ldev(device);
>  	}
>  	s->dev_size = drbd_get_capacity(device->this_bdev);
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
