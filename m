Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 238FB1F82D8
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:19:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E24A14203EB;
	Sat, 13 Jun 2020 12:19:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ECD82420426
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:42 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id l10so12264076wrr.10
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YEG4z8qEcvv8kNO2YGjz6EufWfplHbPF3VC80TUbdQE=;
	b=bPtVp3le3foASU7q4wt+iW7IsvCG1DPbKq1OHuPC7oKt49jyvl9OQxNtMEHYD4IbKD
	CbktxCER0zbaJTuIFA+UuYCV/dojYbevNlmWSoLHRxOZIR+GDgCBsD5xiYWEw6DSK04W
	rvcKBgj8baDqu4lPbrN8n8Qo6Espid+3QnWP7Ov3rkusp21eK4Dmw/OKNyoi6kvt2lki
	b5EsXnB83d4UIHPfz6i2UKC27tke1VKjC7/xKXqIP/2VJK81N/8M68A8rk/zPxH7i5Bg
	i4ZAvGKWGcaaQ/LaTwcl+KOrVh7581fqxqOH38R0vI6vIlSzXB1Chl+CpScfZE21qAmB
	apWQ==
X-Gm-Message-State: AOAM531M7kZ1X2UcNJn009zx/iENDzs6q9XzeNtHDDFKOGeFL5mmrQv9
	yhifuBZajwIE8/EHP95ZBBMnAtgPMELkZQ==
X-Google-Smtp-Source: ABdhPJyP989VokAPPzy5JNlZgaOLFjT+IweqZbvtjdqKGG//1EBIlw/dN/MFCoqK+7rxk1J/9v72dw==
X-Received: by 2002:adf:e545:: with SMTP id z5mr18468250wrm.89.1592042322323; 
	Sat, 13 Jun 2020 02:58:42 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	d11sm14283898wrm.64.2020.06.13.02.58.41
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:42 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:40 +0200
Resent-Message-ID: <20200613095840.GW4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
	[5.45.199.163])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 402E94202C3
	for <drbd-dev@lists.linbit.com>; Mon, 25 May 2020 14:35:09 +0200 (CEST)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9EE2C2E1382;
	Mon, 25 May 2020 15:28:09 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
	(vla1-81430ab5870b.qloud-c.yandex.net
	[2a02:6b8:c0d:35a1:0:640:8143:ab5])
	by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	DQMsTfsjhQ-S7TS4oeT; Mon, 25 May 2020 15:28:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1590409689; bh=YEG4z8qEcvv8kNO2YGjz6EufWfplHbPF3VC80TUbdQE=;
	h=In-Reply-To:Message-ID:From:Date:References:To:Subject:Cc;
	b=bl+2kqRCQsVFwc9oTK+K5T3oNcaVdrBTh8bHsU39tv2jjpDgfTTU+DaYxax9ko5mr
	GkBjjARumtZaYQY+WluCS9B++huWYaI+1Kc/c/bUZQJoKuhSB7l6BMJKR9h9hxWZez
	IRPdeajMC85tfdsFdxT0QjpQeA4oHy6Rq/6jCKlc=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b081:603::1:c])
	by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id 2d5hQC4EbC-S7Xq4M1X; Mon, 25 May 2020 15:28:07 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200525113014.345997-1-hch@lst.de>
	<20200525113014.345997-2-hch@lst.de>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <fafb94a9-cdce-5ea0-e73f-9463766a9f19@yandex-team.ru>
Date: Mon, 25 May 2020 15:28:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525113014.345997-2-hch@lst.de>
Content-Language: en-CA
Cc: linux-nvdimm@lists.01.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, dm-devel@redhat.com,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/16] block: add disk/bio-based accounting
	helpers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 25/05/2020 14.29, Christoph Hellwig wrote:
> Add two new helpers to simplify I/O accounting for bio based drivers.
> Currently these drivers use the generic_start_io_acct and
> generic_end_io_acct helpers which have very cumbersome calling
> conventions, don't actually return the time they started accounting,
> and try to deal with accounting for partitions, which can't happen
> for bio based drivers.  The new helpers will be used to subsequently
> replace uses of the old helpers.
> 
> The main function is the bio based wrappes in blkdev.h, but for zram
> which wants to account rw_page based I/O lower level routines are
> provided as well.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/blk-core.c       | 34 ++++++++++++++++++++++++++++++++++
>   include/linux/blkdev.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 77e57c2e8d602..8973104f88d90 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1432,6 +1432,40 @@ void blk_account_io_start(struct request *rq, bool new_io)
>   	part_stat_unlock();
>   }
>   
> +unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
> +		unsigned int op)
> +{
> +	struct hd_struct *part = &disk->part0;
> +	const int sgrp = op_stat_group(op);
> +	unsigned long now = READ_ONCE(jiffies);
> +
> +	part_stat_lock();
> +	update_io_ticks(part, now, false);
> +	part_stat_inc(part, ios[sgrp]);
> +	part_stat_add(part, sectors[sgrp], sectors);
> +	part_stat_local_inc(part, in_flight[op_is_write(op)]);
> +	part_stat_unlock();
> +
> +	return now;
> +}
> +EXPORT_SYMBOL(disk_start_io_acct);
> +
> +void disk_end_io_acct(struct gendisk *disk, unsigned int op,
> +		unsigned long start_time)
> +{
> +	struct hd_struct *part = &disk->part0;
> +	const int sgrp = op_stat_group(op);
> +	unsigned long now = READ_ONCE(jiffies);
> +	unsigned long duration = now - start_time;

I think it would be better to leave this jiffies legacy nonsense in
callers and pass here request duration in nanoseconds.

So rewriting them to nanoseconds later wouldn't touch generic code.

> +
> +	part_stat_lock();
> +	update_io_ticks(part, now, true);
> +	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
> +	part_stat_local_dec(part, in_flight[op_is_write(op)]);
> +	part_stat_unlock();
> +}
> +EXPORT_SYMBOL(disk_end_io_acct);
> +
>   /*
>    * Steal bios from a request and add them to a bio list.
>    * The request must not have been partially completed before.
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 7d10f4e632325..76d01a8a13b80 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1892,4 +1892,30 @@ static inline void blk_wake_io_task(struct task_struct *waiter)
>   		wake_up_process(waiter);
>   }
>   
> +unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
> +		unsigned int op);
> +void disk_end_io_acct(struct gendisk *disk, unsigned int op,
> +		unsigned long start_time);
> +
> +/**
> + * bio_start_io_acct - start I/O accounting for bio based drivers
> + * @bio:	bio to start account for
> + *
> + * Returns the start time that should be passed back to bio_end_io_acct().
> + */
> +static inline unsigned long bio_start_io_acct(struct bio *bio)
> +{
> +	return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bio));
> +}
> +
> +/**
> + * bio_end_io_acct - end I/O accounting for bio based drivers
> + * @bio:	bio to end account for
> + * @start:	start time returned by bio_start_io_acct()
> + */
> +static inline void bio_end_io_acct(struct bio *bio, unsigned long start_time)
> +{
> +	return disk_end_io_acct(bio->bi_disk, bio_op(bio), start_time);
> +}
> +
>   #endif
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
