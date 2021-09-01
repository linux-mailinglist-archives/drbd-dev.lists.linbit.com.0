Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB383FE32B
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Sep 2021 21:38:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 199D642061C;
	Wed,  1 Sep 2021 21:38:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BBC89420603
	for <drbd-dev@lists.linbit.com>; Wed,  1 Sep 2021 21:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wGnx/rmz0OqMpEcvhGWrN84A7v4283xqEJSD+WpfhBU=;
	b=WrYWDlmxdtUHZZUeFY6LJYlLFt
	y57bI6R7XBLggF1C9/BdG718ZnykUK1PEksOdZI3/zipDNGy9cOpLHeCby3lYwt0Pkmd3f1nXyud+
	jooZeSTzWBk+Czt58gK83qjjWGzP8NKQD1W1eFcM8zzN9djcFH5JuSIOjFmdJZvHGXUbMqa5L+Meu
	IeXG2IuLmb2+likZOUZX6+zrC/qx7UHXBNe/2/tEk0NygberUWqrlKTW79Zynag2KyIN4TC7urN5h
	66AOUiA2DBy+e4ST7s3rJPmDRy/VSLVGbvbC9lGGeCF2iuJzF7iWO5bS5vP7SVe/NGjTp7nexSxxN
	+0h+dHCQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mLW43-0077KJ-TT; Wed, 01 Sep 2021 19:38:27 +0000
Date: Wed, 1 Sep 2021 12:38:27 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes.berg@intel.com, chris.obbard@collabora.com,
	krisman@collabora.com, zhuyifei1999@gmail.com, thehajime@gmail.com,
	chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Message-ID: <YS/Ws2iD1suaut39@bombadil.infradead.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
	<20210830221000.179369-16-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830221000.179369-16-mcgrof@kernel.org>
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 15/15] pd: add error handling support for
	add_disk()
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

On Mon, Aug 30, 2021 at 03:10:00PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/block/paride/pd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/paride/pd.c b/drivers/block/paride/pd.c
> index 500b89a4bdaf..226ed5c93b68 100644
> --- a/drivers/block/paride/pd.c
> +++ b/drivers/block/paride/pd.c
> @@ -938,8 +938,12 @@ static int pd_probe_drive(struct pd_unit *disk, int autoprobe, int port,
>  	if (ret)
>  		goto put_disk;
>  	set_capacity(disk->gd, disk->capacity);
> -	add_disk(disk->gd);
> +	ret = add_disk(disk->gd);
> +	if (ret)
> +		goto cleanup_disk;
>  	return 0;
> +cleanup_disk:
> +	blk_cleanup_disk(&disk);

This should be blk_cleanup_disk(disk->gd); Will fix up in my v2.

  Luis
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
