Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94F3FE906
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Sep 2021 08:01:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3340442060C;
	Thu,  2 Sep 2021 08:01:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 417 seconds by postgrey-1.31 at mail19;
	Wed, 01 Sep 2021 17:31:56 CEST
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2951420043
	for <drbd-dev@lists.linbit.com>;
	Wed,  1 Sep 2021 17:31:56 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 8ECC91F43EF3
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Organization: Collabora
References: <20210830221000.179369-1-mcgrof@kernel.org>
	<20210830221000.179369-6-mcgrof@kernel.org>
Date: Wed, 01 Sep 2021 11:24:55 -0400
In-Reply-To: <20210830221000.179369-6-mcgrof@kernel.org> (Luis Chamberlain's
	message of "Mon, 30 Aug 2021 15:09:50 -0700")
Message-ID: <8735qotj20.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Sep 2021 08:01:11 +0200
Cc: ulf.hansson@linaro.org, justin@coraid.com, linux-kernel@vger.kernel.org,
	jcmvbkbc@gmail.com, tim@cyberelk.net, drbd-dev@lists.linbit.com,
	richard@nod.at, geert@linux-m68k.org,
	anton.ivanov@cambridgegreys.com, linux-xtensa@linux-xtensa.org,
	johannes.berg@intel.com, jdike@addtoit.com,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, hare@suse.de, axboe@kernel.dk,
	chris@zankel.net, philipp.reisner@linbit.com,
	chris.obbard@collabora.com, tj@kernel.org,
	lars.ellenberg@linbit.com, thehajime@gmail.com, zhuyifei1999@gmail.com
Subject: Re: [Drbd-dev] [PATCH 05/15] um/drivers/ubd_kern: add error
 handling support for add_disk()
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

Luis Chamberlain <mcgrof@kernel.org> writes:

> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> ubd_disk_register() never returned an error, so just fix
> that now and let the caller handle the error condition.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

> ---
>  arch/um/drivers/ubd_kern.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index cd9dc0556e91..81045c199c30 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -854,8 +854,8 @@ static const struct attribute_group *ubd_attr_groups[] = {
>  	NULL,
>  };
>  
> -static void ubd_disk_register(int major, u64 size, int unit,
> -			      struct gendisk *disk)
> +static int ubd_disk_register(int major, u64 size, int unit,
> +			     struct gendisk *disk)
>  {
>  	disk->major = major;
>  	disk->first_minor = unit << UBD_SHIFT;
> @@ -872,7 +872,7 @@ static void ubd_disk_register(int major, u64 size, int unit,
>  
>  	disk->private_data = &ubd_devs[unit];
>  	disk->queue = ubd_devs[unit].queue;
> -	device_add_disk(&ubd_devs[unit].pdev.dev, disk, ubd_attr_groups);
> +	return device_add_disk(&ubd_devs[unit].pdev.dev, disk, ubd_attr_groups);
>  }
>  
>  #define ROUND_BLOCK(n) ((n + (SECTOR_SIZE - 1)) & (-SECTOR_SIZE))
> @@ -919,10 +919,15 @@ static int ubd_add(int n, char **error_out)
>  	blk_queue_write_cache(ubd_dev->queue, true, false);
>  	blk_queue_max_segments(ubd_dev->queue, MAX_SG);
>  	blk_queue_segment_boundary(ubd_dev->queue, PAGE_SIZE - 1);
> -	ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
> +	err = ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
> +	if (err)
> +		goto out_cleanup_disk;
> +
>  	ubd_gendisk[n] = disk;
>  	return 0;
>  
> +out_cleanup_disk:
> +	blk_cleanup_disk(disk);
>  out_cleanup_tags:
>  	blk_mq_free_tag_set(&ubd_dev->tag_set);
>  out:

-- 
Gabriel Krisman Bertazi
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
