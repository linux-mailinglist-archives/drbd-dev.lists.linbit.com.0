Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7E72DC1
	for <lists+drbd-dev@lfdr.de>; Wed, 24 Jul 2019 13:37:25 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D3399101AC48;
	Wed, 24 Jul 2019 13:37:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 7A53A101AC43
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 13:37:22 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id f9so46563728wre.12
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aQfNFiJgGsv9UgTyWY3tUqj/qF9PNqN3A4wyBds+Y/Y=;
	b=hrVbr11+OiUw0odEuipDamOn+CeA1FYWaQZFMbx5tm88oSpJoJScJfyS/Bu5jYPICg
	7cDHOGH2yau3gw2mLzSSI03+SpYiwqppzZGErfQ8LHNCVcbsk+x9OsDTPZN1GkUUFfVQ
	Is1m7ROJqjwHQklsHgWAYs3daEfx7XHTqHrYT0qlBMD7ZLIPF7/GaD0vnSBR8GIxffqs
	uwMky4QRnl6v1PUjlk1HCJHMPA1ILomAWcsvtMmnEEDyECYgAhyUNqk4WzfYwhiLrSjG
	aBJG3s83NMAuYcZyCTXDehDYQCVI9rqsxnRzI9R2TyvPOpO+GkiBXBFj3UfQ/fu91tfC
	jQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aQfNFiJgGsv9UgTyWY3tUqj/qF9PNqN3A4wyBds+Y/Y=;
	b=tKOz1o8hZxdk9mWAsBhMmDYjOs4DdnuEyEUGnaV4MXyEgjmW2Iwp4cWrKjQBaPqbGw
	UaUKzbTr1UNrAFGHG1x09F6KLO/DDfhEb/N6E2d3TibmWZhh0/erYuat5T9BiTc4V7os
	Y3W7nSUXNqpJOXVXKFUijAsFu6h4/QALj/QntdNGY2R63Mnu514934FBN7l3BSQPNMA+
	rkm0MIQCIYQbv/5WA1U5KpSCWX9IJDsE1xdua8nmdKae4+5/1EH3MGhAHKn+/3PM0Tj/
	o/ADcir4i+tRrBDfMjdIc1mD2/h+L9/Du1dyNMdNE7x1ykQWgrugpMDNFmpSKtXpKLeO
	pTmw==
X-Gm-Message-State: APjAAAXkzZa8nKzk7CQBDPPl43g7WDtNfn3nzzbptxLWGwQYIVq/GtS9
	TaQAupnvSNtsw5IN65Ub5KiTGzBY
X-Google-Smtp-Source: APXvYqyJbaRTnQola4b6eYJh8U7ie0ZzV/HGXTrlrS53rgawi0WhJg+42OgkqSTdv6HOjFzxYcwY/w==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr36583242wrs.160.1563968241541;
	Wed, 24 Jul 2019 04:37:21 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	u13sm54814133wrq.62.2019.07.24.04.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jul 2019 04:37:20 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:37:20 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <20190724113720.gis6v2ziltmmv4zt@rck.sh>
References: <20190724034926.28755-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724034926.28755-1-baijiaju1990@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/2] block: drbd: Fix a possible null-pointer
 dereference in is_valid_state()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Jul 24, 2019 at 11:49:26AM +0800, Jia-Ju Bai wrote:
> In is_valid_state(), there is an if statement on line 839 to check
> whether nc is NULL:
>     if (nc)
> 
> When nc is NULL, it is used on line 880:
>     (nc->verify_alg[0] == 0)
> 
> Thus, a possible null-pointer dereference may occur.
> 
> To fix this bug, nc is also checked on line 880.
> 
> This bug is found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/block/drbd/drbd_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
> index eeaa3b49b264..3cf477e9cf6a 100644
> --- a/drivers/block/drbd/drbd_state.c
> +++ b/drivers/block/drbd/drbd_state.c
> @@ -877,7 +877,7 @@ is_valid_state(struct drbd_device *device, union drbd_state ns)
>  		rv = SS_CONNECTED_OUTDATES;
>  
>  	else if ((ns.conn == C_VERIFY_S || ns.conn == C_VERIFY_T) &&
> -		 (nc->verify_alg[0] == 0))
> +		 (nc && nc->verify_alg[0] == 0))
>  		rv = SS_NO_VERIFY_ALG;

AFAIK it is "impossible" to reach such a DRBD state without having a
valid net conf. Anyways, a check is a good idea, but the logic is wrong,
I would propose something like this:

 	else if ((ns.conn == C_VERIFY_S || ns.conn == C_VERIFY_T) &&
-		 (nc->verify_alg[0] == 0))
+		 (!nc || nc->verify_alg[0] == 0))
 		rv = SS_NO_VERIFY_ALG;

Regards, rck
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
