Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766B4F582F
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 11:09:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2402420FC0;
	Wed,  6 Apr 2022 11:09:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1A76420FBB
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 11:09:25 +0200 (CEST)
Received: by mail-ej1-f53.google.com with SMTP id dr20so2892553ejc.6
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=wB8UMmxJgv5LvDfeLDltY32XYTo3n5XcwQ+iaIyF/Og=;
	b=WXm7syME4XdRB4NJGS4GQb5Ax36M1AlMT49VPwWxN+ZXxTMx8CRhOYeB0lRJxT8brq
	pnkxL/5FhxWQg3xeUJYqtDY/m6WYSw7oYJceeeULLalxUjm3+cdBAn+ui7mqF9rRTXuL
	2k3SJhuFtj1UuevWdUM1LjH45bWzsVou59a8PfuTsFMZxK2cf91uLo3colj2PfNfMziH
	ManeoUZnjK/m9d7Z26M1Cl9KC1T1c2D+u4BYg+n4nlmQbK7hkCXTZodRbAOqWrU6yOMN
	W4uV+4q5icDeOh9eWCFiomSibo6GEPqr0Q0J2pmoyDtgUdEckwuGzu6W4VQJZdtpI4dW
	oDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=wB8UMmxJgv5LvDfeLDltY32XYTo3n5XcwQ+iaIyF/Og=;
	b=bDi4ZPIVNG2plEOEmPN+S1QEnoMDGooGdICJ+3DY2y5YhFq4E8Z7aKryP/g2E+QGR9
	qrrrk8AuDjqIAH9nj236QJimj3tQBCxNqNOEsjm0DUwI5sRIEQNBxmsU48WBIzVWVcqb
	NlSnHHx5n6jbGX6a7hvfGdf9rKzrFek0BxFyCDI8vSoTqCwmB/7R2T9QhqwRF5CTygDp
	qkTHWP7NwRM11zauP0u6cO+uLJIzdYRA0gqWAQyet59WZyVQkpfFoo39LXdooT1GOSEn
	pTyn24XzaRiPglow3y7oV17w4lyywDb/a8gMYmBAeB5q3XdaX9EXuEuA0nlWtxk+Gru+
	1phw==
X-Gm-Message-State: AOAM533CmrttNsKGZmsuumrzirePueAJznJeZ9Jf6pQ3654QNAZn1mPu
	BluuZ59wk0jj978gScxiLycmBlH4
X-Google-Smtp-Source: ABdhPJyIdk1UwYDrlq6+n4T7hvAK7lZsJilf9jybv8rdA9wBUUKHTLlxaOsDN5nk9M5bR3LdK0kbsQ==
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
	j1-20020a170906830100b006e4896d59b1mr7152842ejx.396.1649236165020;
	Wed, 06 Apr 2022 02:09:25 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	m3-20020a17090679c300b006cf9ce53354sm6352697ejo.190.2022.04.06.02.09.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 02:09:24 -0700 (PDT)
Message-ID: <d2626d2f-d348-49a1-e36b-a3eb598ac327@linbit.com>
Date: Wed, 6 Apr 2022 11:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-5-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220406060516.409838-5-hch@lst.de>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 04/27] drbd: remove assign_p_sizes_qlim
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

Am 06.04.22 um 08:04 schrieb Christoph Hellwig:
> Fold each branch into its only caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/drbd/drbd_main.c | 50 ++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 9676a1d214bc5..74b1b2424efff 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -903,31 +903,6 @@ void drbd_gen_and_send_sync_uuid(struct drbd_peer_device *peer_device)
>  	}
>  }
>  
> -/* communicated if (agreed_features & DRBD_FF_WSAME) */
> -static void
> -assign_p_sizes_qlim(struct drbd_device *device, struct p_sizes *p,
> -					struct request_queue *q)
> -{
> -	if (q) {
> -		p->qlim->physical_block_size = cpu_to_be32(queue_physical_block_size(q));
> -		p->qlim->logical_block_size = cpu_to_be32(queue_logical_block_size(q));
> -		p->qlim->alignment_offset = cpu_to_be32(queue_alignment_offset(q));
> -		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> -		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> -		p->qlim->discard_enabled = blk_queue_discard(q);
> -		p->qlim->write_same_capable = 0;
> -	} else {
> -		q = device->rq_queue;
> -		p->qlim->physical_block_size = cpu_to_be32(queue_physical_block_size(q));
> -		p->qlim->logical_block_size = cpu_to_be32(queue_logical_block_size(q));
> -		p->qlim->alignment_offset = 0;
> -		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> -		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> -		p->qlim->discard_enabled = 0;
> -		p->qlim->write_same_capable = 0;
> -	}
> -}
> -
>  int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enum dds_flags flags)
>  {
>  	struct drbd_device *device = peer_device->device;
> @@ -957,14 +932,35 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
>  		q_order_type = drbd_queue_order_type(device);
>  		max_bio_size = queue_max_hw_sectors(q) << 9;
>  		max_bio_size = min(max_bio_size, DRBD_MAX_BIO_SIZE);
> -		assign_p_sizes_qlim(device, p, q);
> +		p->qlim->physical_block_size =
> +			cpu_to_be32(queue_physical_block_size(q));
> +		p->qlim->logical_block_size =
> +			cpu_to_be32(queue_logical_block_size(q));
> +		p->qlim->alignment_offset =
> +			cpu_to_be32(queue_alignment_offset(q));
> +		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> +		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> +		p->qlim->discard_enabled = blk_queue_discard(q);
> +		p->qlim->write_same_capable =
> +			!!q->limits.max_write_same_sectors;

queue_limits.max_write_same_sectors was removed in 73bd66d9c834, so this
does not compile. It's removed in the next patch, so the big picture is
fine, just this one commit is broken.

>  		put_ldev(device);
>  	} else {
> +		struct request_queue *q = device->rq_queue;
> +
> +		p->qlim->physical_block_size =
> +			cpu_to_be32(queue_physical_block_size(q));
> +		p->qlim->logical_block_size =
> +			cpu_to_be32(queue_logical_block_size(q));
> +		p->qlim->alignment_offset = 0;
> +		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> +		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> +		p->qlim->discard_enabled = 0;
> +		p->qlim->write_same_capable = 0;
> +
>  		d_size = 0;
>  		u_size = 0;
>  		q_order_type = QUEUE_ORDERED_NONE;
>  		max_bio_size = DRBD_MAX_BIO_SIZE; /* ... multiple BIOs per peer_request */
> -		assign_p_sizes_qlim(device, p, NULL);
>  	}
>  
>  	if (peer_device->connection->agreed_pro_version <= 94)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
