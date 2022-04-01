Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57C4EED2B
	for <lists+drbd-dev@lfdr.de>; Fri,  1 Apr 2022 14:31:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 959EE420600;
	Fri,  1 Apr 2022 14:31:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7350242017F
	for <drbd-dev@lists.linbit.com>; Fri,  1 Apr 2022 14:31:30 +0200 (CEST)
Received: by mail-wm1-f49.google.com with SMTP id r7so1601680wmq.2
	for <drbd-dev@lists.linbit.com>; Fri, 01 Apr 2022 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DjHen8SjurGesv2/euau4gflSw1KQFpZxY2bQ80GWWc=;
	b=4nmMhJBetoYm1lZlMCb31TT7Q/YqTMXFw/vdDDCiqMQui8pdlrPAgDSr4iLNLk81lt
	P4L7OZEbahfo6oNPilxT3fAnrGwcQemIOCzIyvg/Jlh9luW+74eaHIsWgXQ+gSacnCtb
	quzW+wSAWHt89ynaCi6u/Sj4hKMIoRbGzKbW6CNEkgHiqiVKMDz4hm6MKC1FT8vqXI9w
	nMfOLDSgBfsbypS1MRrXzUKuBFkal+Mbdyu2Qhh1tSMRWO6k0YAvAst4gto2/HjQG8rs
	a98p7sGLSQxmKh6G2U/AXLdknnV7dKcKKbiCZtcPkkj6GoAfqV0ctTLKiSYTQ7kvjnFk
	lyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DjHen8SjurGesv2/euau4gflSw1KQFpZxY2bQ80GWWc=;
	b=gAvlnwmsEpSemMEneOWeHNTh4OBI7MVmsvvBgeTfnYw8Ea9m/VRs5uINlXNyKavx5B
	ydYjut4BFpVY3yy6FjA5F+6w0AOGxc5VKJX5gVqFxmt0nvmXjEvpJN2Dy544XihwDc5+
	bBYXjiZhIwpy+g/4ppXk1Oe0/PMFizP9/ykAbN/M/vJX7b8P/ui516shqda4+tpk5NuB
	6KrR32p7YH9svpxuqIJJGKq/dgt1/kM/sltwN78tZCfpwlDbz2TEK0wICsmMAoopDXT6
	68T3u2VxCVSwIdvykD1gaCxFQc6PhROQ6kegHv5WkQB2FotBgEXKeV20q6Vb/3u9w+Rx
	7HBw==
X-Gm-Message-State: AOAM532hNf5Yin78wKszxf06/227DSch8JNnbVMKpVu6Qdb0XtriD2gs
	+JELCODM7Tw9KxETz9ZQwxKrr+glA6YWHMSEFQYYBvyP
X-Google-Smtp-Source: ABdhPJz4Cw8Lc3YzkpvNHzTnf1J5O+dJbnkNlNzONropveVyQes/R3govCZ1BmuhcVKV3tOg49L9fnv0+pqgJWj6/OM=
X-Received: by 2002:a05:600c:3009:b0:381:194a:8cb5 with SMTP id
	j9-20020a05600c300900b00381194a8cb5mr8871178wmh.43.1648816289933;
	Fri, 01 Apr 2022 05:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220401083637.2407766-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220401083637.2407766-1-lv.ruyi@zte.com.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 1 Apr 2022 14:31:18 +0200
Message-ID: <CADGDV=Wf9MpS7_3C6=RNTBO5rqxjtWOz170=7K215R9X38yc5w@mail.gmail.com>
To: cgel.zte@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, Lv Ruyi <lv.ruyi@zte.com.cn>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Zeal Robot <zealci@zte.com.cn>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: fix potential dereference null pointer
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

Hi Lv Ruyi,

This patch does not make sense to me. A request can only get "TO_BE_SENT"
when the connection is established with the corresponding
cstate. Establishing a connection can only work if net_conf is set. net_conf
can be exchanged to a new one, but never become NULL.

Please share more details why you think this NULL check is necessary here?



On Fri, Apr 1, 2022 at 10:36 AM <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> rcu_dereference may return NULL, so check the returned pointer.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>  drivers/block/drbd/drbd_req.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index e1e58e91ee58..8ab6da155e2f 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -577,6 +577,10 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
>                 D_ASSERT(device, !(req->rq_state & RQ_NET_MASK));
>                 rcu_read_lock();
>                 nc = rcu_dereference(connection->net_conf);
> +               if (!nc) {
> +                       rcu_read_unlock();
> +                       break;
> +               }
>                 p = nc->wire_protocol;
>                 rcu_read_unlock();
>                 req->rq_state |=
> @@ -690,6 +694,10 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
>                 /* close the epoch, in case it outgrew the limit */
>                 rcu_read_lock();
>                 nc = rcu_dereference(connection->net_conf);
> +               if (!nc) {
> +                       rcu_read_unlock();
> +                       break;
> +               }
>                 p = nc->max_epoch_size;
>                 rcu_read_unlock();
>                 if (connection->current_tle_writes >= p)
> --
> 2.25.1
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
