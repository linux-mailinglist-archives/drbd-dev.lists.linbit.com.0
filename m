Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF63FDD3C
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Sep 2021 15:42:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3443542061C;
	Wed,  1 Sep 2021 15:42:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7CE93420603
	for <drbd-dev@lists.linbit.com>; Wed,  1 Sep 2021 15:41:59 +0200 (CEST)
Received: by mail-vs1-f52.google.com with SMTP id l9so2441841vsb.8
	for <drbd-dev@lists.linbit.com>; Wed, 01 Sep 2021 06:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/xOCv7duiKV85YEAr3p0lxEIgvNf6vJOyFaux8D3sgc=;
	b=siCsukuVaRYx1b4P0oLpQvQGPmSil8XZ2ggRvKsYsVL+rx5CTUtm3+dpem0UorrK80
	IGpg/XxIoYxyiQxqTwQJYYvyu/LnpSxQj+Ytst9T/VpuTuJxM5HuJ+WuppoSwGCTmQ4j
	egOEtTvDf+Rn6yOwH2zDedBDSDl3xjqP4c4lT6J+V9GcMEQk8mAkmWrdjlhgMPs8v5mH
	zIOAHlNe/GOpU2iSd8ptWdJGZdP71WSaVYX1sZsssoCsMGQvzVKIkq4Z0ZnpUXe4hT3x
	eb59i1H8pCpHejdc1AGnBh3nnBGJKrf7TACtRrN8Z1aDgLbvg5+4JvD1ZmqS01iH5ZG3
	fUBQ==
X-Gm-Message-State: AOAM5317lqC2GAzxtNbPcTpvrNJUa78oGO8rnlaUu8QeuJqI4FpPV6KJ
	DRq7/9oktzj1jZG+nKOsv3kh4bKV20d/pBYuppU=
X-Google-Smtp-Source: ABdhPJx/jw1Hd9z5dejjk2bylHrBEE4LNmlEMO2utTQ/YLBtNm+pHtrY/uki14hOKxAFDVFkelRD3cReRgD5NymWjeI=
X-Received: by 2002:a05:6102:34c9:: with SMTP id
	a9mr18408820vst.26.1630503718663; 
	Wed, 01 Sep 2021 06:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210830221000.179369-1-mcgrof@kernel.org>
	<20210830221000.179369-2-mcgrof@kernel.org>
In-Reply-To: <20210830221000.179369-2-mcgrof@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Sep 2021 15:41:47 +0200
Message-ID: <CAMuHMdUUrp-ktVmOPRs7KinykrVKEMx-dG42RapPc-egxODNnQ@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, justin@coraid.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Tim Waugh <tim@cyberelk.net>, Lars Ellenberg <drbd-dev@lists.linbit.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>, Johannes Berg <johannes.berg@intel.com>,
	Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
	linux-block@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
	Chris Zankel <chris@zankel.net>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	chris.obbard@collabora.com, Tejun Heo <tj@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, thehajime@gmail.com,
	YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [Drbd-dev] [PATCH 01/15] z2ram: add error handling support for
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

Hi Luis,

On Tue, Aug 31, 2021 at 12:10 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling. Only the disk is cleaned up inside
> z2ram_register_disk() as the caller deals with the rest.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Thanks for your patch!

> --- a/drivers/block/z2ram.c
> +++ b/drivers/block/z2ram.c
> @@ -318,6 +318,7 @@ static const struct blk_mq_ops z2_mq_ops = {
>  static int z2ram_register_disk(int minor)
>  {
>         struct gendisk *disk;
> +       int err;
>
>         disk = blk_mq_alloc_disk(&tag_set, NULL);
>         if (IS_ERR(disk))
> @@ -333,8 +334,10 @@ static int z2ram_register_disk(int minor)
>                 sprintf(disk->disk_name, "z2ram");
>
>         z2ram_gendisk[minor] = disk;
> -       add_disk(disk);
> -       return 0;
> +       err = add_disk(disk);
> +       if (err)
> +               blk_cleaup_disk(disk);

blk_cleanup_disk()?

Seems like lkp already detected this back in July...

> +       return err;
>  }
>
>  static int __init z2_init(void)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
