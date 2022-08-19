Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922E59A2EC
	for <lists+drbd-dev@lfdr.de>; Fri, 19 Aug 2022 19:34:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A36B420BA2;
	Fri, 19 Aug 2022 19:33:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1434 seconds by postgrey-1.31 at mail19;
	Fri, 19 Aug 2022 17:48:33 CEST
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 77CCF4207AF
	for <drbd-dev@lists.linbit.com>; Fri, 19 Aug 2022 17:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tb0EOcj/cP/ZuwLYxWcP43h5C3E6flLzxmX2a1wEjWs=;
	b=Q5keVqP0r9w7d9aLb3DgGx7Ytw
	5UBgPFlT3NnvngRx82tAQhpQmKXgysZ3PFvV1gDsRBGB2a+s9IBjZsvS8fMKv2tanvmNoj619SOil
	CouctGihln6nnZfiOtGIhl0rEVKsFC5VmZPyoGAOSEvzjTsJQmCrVxAQCu7viSwktTwFbZJjB13K/
	BcUKVoyTWq1DpTsP6/Z6pCwJ3fsu1RcTSossiXXHE1a4KGo+omusLuRZBROtlerIoeYSREp9fkQa/
	SgjARaqLNZhtzbBl3rBx6AyCS3M9juEwPlF3jm+xR7WmYgPPvV7xoMw39jsnlEKo1TuyEjw8xJXyl
	PZQYEHzg==;
Received: from [2600:1702:3c30:6ca0:77cd:43b1:3d69:dd7b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP3ow-00BHmH-Fb; Fri, 19 Aug 2022 15:22:02 +0000
Message-ID: <66f8a3a6-22d5-8a1b-e011-c50de8e19e6c@infradead.org>
Date: Fri, 19 Aug 2022 08:21:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.11.0
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
References: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
X-Mailman-Approved-At: Fri, 19 Aug 2022 19:33:56 +0200
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: move from strlcpy with unused retval
	to strscpy
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

On 8/18/22 13:59, Wolfram Sang wrote:
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
> 
> Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
...
> diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
> index e1d080f680ed..c76e0148eada 100644
> --- a/drivers/block/ps3vram.c
> +++ b/drivers/block/ps3vram.c
> @@ -745,7 +745,7 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
>  	gendisk->flags |= GENHD_FL_NO_PART;
>  	gendisk->fops = &ps3vram_fops;
>  	gendisk->private_data = dev;
> -	strlcpy(gendisk->disk_name, DEVICE_NAME, sizeof(gendisk->disk_name));
> +	strscpy(gendisk->disk_name, DEVICE_NAME, sizeof(gendisk->disk_name));
>  	set_capacity(gendisk, priv->size >> 9);
>  	blk_queue_max_segments(gendisk->queue, BLK_MAX_SEGMENTS);
>  	blk_queue_max_segment_size(gendisk->queue, BLK_MAX_SEGMENT_SIZE);

Seems OK for ps3vram.

Acked-by: Geoff Levand <geoff@infradead.org>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
