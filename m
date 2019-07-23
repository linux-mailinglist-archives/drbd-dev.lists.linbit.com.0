Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D27134C
	for <lists+drbd-dev@lfdr.de>; Tue, 23 Jul 2019 09:53:25 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6553F101AC48;
	Tue, 23 Jul 2019 09:53:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 380 seconds by postgrey-1.31 at mail09;
	Tue, 23 Jul 2019 09:53:23 CEST
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 27DBC101AC43
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2019 09:53:22 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id p17so42009319wrf.11
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2019 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k7Xz7HKINwi2ffVMf/EFtJWFSDc7hqESTclfwKAt7K4=;
	b=c/ZNarot1m0Bl1tmWrYyhQmPxIX3DYs2q2Gj5GPhiIoalP+pZaR0Bxcjs+qbtQggL+
	HpYpvcffxSSoQ6e3vzPC+Jr1+Y7fqOWhByZoh68dmXrg2pmNrtn6QP4yekhQWLe32Smv
	Lgcpdg3yij/uHiT6xRLXikibHtWQkH9y/yNWC8LWj1R9GmlW1Ow+dA4jDjhQER8wtODg
	P3HNoJOjAMlxmxOQEDK0kNEfxcwZj8zCoRBY1pdZmhobsS52JB4o5lYmEFTwKw9bMbYD
	P1FPqibH2KmI7rd/iym26Pv/u/mJxGS3RR6+vfownrLRWIsxXw7FD+oC8MyDj4OyJB3d
	//sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k7Xz7HKINwi2ffVMf/EFtJWFSDc7hqESTclfwKAt7K4=;
	b=T9tHiAmLSITrOM6h3StZFhmaV5FpOZ2huem1S49ltP1vGhUyIVs06aFSLzbNP5/yU5
	RxUmFtsyWBChbXalcS+I4SMJULYjP6am00ezRsF1Z1A7EQwbdj9YRNYx4YTWjx2Fm0rQ
	ES7LHbo3fFlryOLsSEMP/8hDHlde2HYBBoa4b5dAotHXrO1GGCLu4EjYJCkQNWFGywDX
	SaZ/2qzEHaDy9Pr0z0hoPP9JuPd3Ln/+io7Pf3KLFwFBB1yLm0qSTZzswHMWXfUyppeP
	iZXOKnDH6r6UbYp3mqFsqDMKtZN1lVR/bdWTPI/fViLSQf1cFa2VBd5awKyeJVW0S7eo
	cepA==
X-Gm-Message-State: APjAAAU+rsQlwcUA+RCCL0g3bL/SULdJQER0+s76XgPZqZ9904cy24GE
	LHTBcknLbyqS+Jfi5bZ5ayuweKjjnoQc8rMN7Is=
X-Google-Smtp-Source: APXvYqz/ejC83D8aGx+4kC8dKQ0Qld0zLqocNAoCUYcBJW7FNfVPBFPaYnNJes3G5pDAlnW0XtkZBA==
X-Received: by 2002:adf:c803:: with SMTP id d3mr4552216wrh.130.1563868022896; 
	Tue, 23 Jul 2019 00:47:02 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20])
	by smtp.gmail.com with ESMTPSA id c1sm89787659wrh.1.2019.07.23.00.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jul 2019 00:47:02 -0700 (PDT)
Date: Tue, 23 Jul 2019 09:47:01 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190723074701.fp2qjjm5dwj4i2x7@rck.sh>
References: <20190722122647.351002-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722122647.351002-1-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Jens Axboe <axboe@kernel.dk>, Herbert Xu <herbert@gondor.apana.org.au>,
	Kees Cook <keescook@chromium.org>, Eric Biggers <ebiggers@google.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com,
	Roland Kammerer <roland.kammerer@linbit.com>
Subject: Re: [Drbd-dev] [PATCH] [v2] drbd: dynamically allocate shash
	descriptor
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

On Mon, Jul 22, 2019 at 02:26:34PM +0200, Arnd Bergmann wrote:
> Building with clang and KASAN, we get a warning about an overly large
> stack frame on 32-bit architectures:
> 
> drivers/block/drbd/drbd_receiver.c:921:31: error: stack frame size of 1280 bytes in function 'conn_connect'
>       [-Werror,-Wframe-larger-than=]
> 
> We already allocate other data dynamically in this function, so
> just do the same for the shash descriptor, which makes up most of
> this memory.
> 
> Link: https://lore.kernel.org/lkml/20190617132440.2721536-1-arnd@arndb.de/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Roland Kammerer <roland.kammerer@linbit.com>

> ---
> v2:
> - don't try to zero a NULL descriptor pointer,
>   based on review from Roland Kammerer.
> ---
>  drivers/block/drbd/drbd_receiver.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index 90ebfcae0ce6..2b3103c30857 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -5417,7 +5417,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
>  	unsigned int key_len;
>  	char secret[SHARED_SECRET_MAX]; /* 64 byte */
>  	unsigned int resp_size;
> -	SHASH_DESC_ON_STACK(desc, connection->cram_hmac_tfm);
> +	struct shash_desc *desc;
>  	struct packet_info pi;
>  	struct net_conf *nc;
>  	int err, rv;
> @@ -5430,6 +5430,13 @@ static int drbd_do_auth(struct drbd_connection *connection)
>  	memcpy(secret, nc->shared_secret, key_len);
>  	rcu_read_unlock();
>  
> +	desc = kmalloc(sizeof(struct shash_desc) +
> +		       crypto_shash_descsize(connection->cram_hmac_tfm),
> +		       GFP_KERNEL);
> +	if (!desc) {
> +		rv = -1;
> +		goto fail;
> +	}
>  	desc->tfm = connection->cram_hmac_tfm;
>  
>  	rv = crypto_shash_setkey(connection->cram_hmac_tfm, (u8 *)secret, key_len);
> @@ -5571,7 +5578,10 @@ static int drbd_do_auth(struct drbd_connection *connection)
>  	kfree(peers_ch);
>  	kfree(response);
>  	kfree(right_response);
> -	shash_desc_zero(desc);
> +	if (desc) {
> +		shash_desc_zero(desc);
> +		kfree(desc);
> +	}
>  
>  	return rv;
>  }
> -- 
> 2.20.0
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
