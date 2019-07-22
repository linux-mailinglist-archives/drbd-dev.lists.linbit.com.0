Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id E1887706B0
	for <lists+drbd-dev@lfdr.de>; Mon, 22 Jul 2019 19:23:14 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 96712101AC48;
	Mon, 22 Jul 2019 19:23:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1491 seconds by postgrey-1.31 at mail09;
	Mon, 22 Jul 2019 19:23:12 CEST
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 13168101AC44
	for <drbd-dev@lists.linbit.com>; Mon, 22 Jul 2019 19:23:11 +0200 (CEST)
Received: by mail-oi1-f195.google.com with SMTP id v186so30151080oie.5
	for <drbd-dev@lists.linbit.com>; Mon, 22 Jul 2019 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=D5i5eeVRTyq7Qm2OPmoZkgOgQ/VLsd39M3tEbxvABCE=;
	b=lMVKoC32q6jdc5s52CXFaKProF9HEK95pIIg8BJ02KRdMo2T+G1UQFwnI3hhGF8+qU
	sA+I2b5X4bmmD3l4DMPwDW82vI93F3KlS+ABw8rfpPxwGuJjlU4ikbVcjw+QJS8Ok0+k
	NfKpy3LGpTZr6M9s+RV94qzCTTn8uIg1TOEHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=D5i5eeVRTyq7Qm2OPmoZkgOgQ/VLsd39M3tEbxvABCE=;
	b=QldEpaTuRSUN3aGpO71CRrn6H7zuJqIkVzBJY9XikNpyNevUSoDjQmw9/GUKrwcVW/
	xYL+/SV6wJmhlPwq654HLNeyv1xsO2+0kr28KnVkxg5hy++qyz5GcsnrDf7f/3kjmIlf
	r6iNqIa7vXXXzvFdcJj6C6tMPP17qs1/26iQMYrstMdy7GoHv0UsyxUMGnv5QhRbvIf5
	Yp+ihMgPqYS4MhqIJHLAGkRL8ifOw4wA5ZQnkUSiT4+FlGKl6SmSyuoi3OFqCei3jYqi
	AdxKBrASD+KStPUaXMPEE5pi2729FctfoV8n/KifL/c2z/atv5a50dk93aclWhAkjz7Q
	t85Q==
X-Gm-Message-State: APjAAAXiM9ZqpH3UR5rNbbdu57lIMQRDMrCXcOnPTn0h0NhelPksYzIP
	b/w/Yox8qgE8rhx0Y14Ovmy/yqbmYxA=
X-Google-Smtp-Source: APXvYqx5EPVBdAZB9hQMVYd5b0pm0ScpmGtAOsQZBAbG8Ghj6g8EOLpHTo6yIfQxYVdOh6K7G5nb9g==
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr70901703pgn.182.1563814351931;
	Mon, 22 Jul 2019 09:52:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	d8sm36678029pgh.45.2019.07.22.09.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jul 2019 09:52:31 -0700 (PDT)
Date: Mon, 22 Jul 2019 09:52:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <201907220952.EA05EEE9FC@keescook>
References: <20190722122647.351002-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722122647.351002-1-arnd@arndb.de>
Cc: Jens Axboe <axboe@kernel.dk>, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
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

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

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

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
