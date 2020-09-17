Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBD26D788
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Sep 2020 11:23:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CDF12420DE8;
	Thu, 17 Sep 2020 11:23:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1012 seconds by postgrey-1.31 at mail19;
	Thu, 17 Sep 2020 11:23:45 CEST
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B358D420DE3
	for <drbd-dev@lists.linbit.com>; Thu, 17 Sep 2020 11:23:45 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EC534AE08;
	Thu, 17 Sep 2020 09:07:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id D5C071E12E1; Thu, 17 Sep 2020 11:06:52 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:06:52 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917090652.GB7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-10-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 09/12] mm: use SWP_SYNCHRONOUS_IO more
	intelligently
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

On Thu 10-09-20 16:48:29, Christoph Hellwig wrote:
> There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> is not set, as the device won't support it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/page_io.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/page_io.c b/mm/page_io.c
> index e485a6e8a6cddb..b199b87e0aa92b 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -403,15 +403,17 @@ int swap_readpage(struct page *page, bool synchronous)
>  		goto out;
>  	}
>  
> -	ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> -	if (!ret) {
> -		if (trylock_page(page)) {
> -			swap_slot_free_notify(page);
> -			unlock_page(page);
> -		}
> +	if (sis->flags & SWP_SYNCHRONOUS_IO) {
> +		ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> +		if (!ret) {
> +			if (trylock_page(page)) {
> +				swap_slot_free_notify(page);
> +				unlock_page(page);
> +			}
>  
> -		count_vm_event(PSWPIN);
> -		goto out;
> +			count_vm_event(PSWPIN);
> +			goto out;
> +		}
>  	}
>  
>  	ret = 0;
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
