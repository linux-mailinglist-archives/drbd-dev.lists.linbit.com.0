Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id E255D485C0
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2019 16:43:14 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A127C1028A71;
	Mon, 17 Jun 2019 16:43:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 393 seconds by postgrey-1.31 at mail09;
	Mon, 17 Jun 2019 16:43:10 CEST
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id F05BB1011B9A
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 16:43:10 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id s15so9411836wmj.3
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KCXEErRlP/VgSfc8Kg4eH/erTW//QnAw2fRJEs6JRxU=;
	b=e9qEJ+bcK9JflnlfwwGwrN4h4wHcIqG+ys8sJHZ7/CSdytLj3wWhYinN5+W0HhP4TZ
	l5n4Z1qd7JhVOZqB/eJ+x5RkAqQQ0KSAXtw6vY0eCMZqH0FyFoi3Yw1C42dLVrLLkydr
	1rViz3QCYvqRI7L8LMHWDshGnRd7b1dwKaSp6K75D1R48+RZ2IZiuXwGthudvCb2afEp
	w0mKh8+KbMex/bKVRdgiaz0LIscPlpV6jEAR5Opu+VBAYDpr7I7VvZ5NwtIAeM6DEV9V
	qm3nMMZVMaNwybXKIfMAaVurF0+oYttYoOOdTj8xa/8s4vAt6IpLNDNBklMzpgvkVPMA
	guQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KCXEErRlP/VgSfc8Kg4eH/erTW//QnAw2fRJEs6JRxU=;
	b=gR0VS1no2996n58+s6ffycH+cKMZ1eMIB2bMO2kt8iQBA8JQHzW2CL4LSyRx2EyWtC
	8xcetaNhzRwZvNhSrfMoWKSbFWoYlXDT36O3LGhatNvL1vVRqgXR1QSzp6mIyEQK0+cb
	UusSK4m2c3gVq8H7lbbxE+ruDIbwVCHkyL4Ch4KK6epmfeui5GF33XkeMn+ut33X6cKn
	iwvq1Vs5RQgo5AG1vWHczIHNfYIgbHHmN8qMSztpIFX7IBcWFseEo7Je1+1A55SZTZ++
	nzSKN6S5gunewrZSFF2Z+lTDr3hJd3R5ttTrk/E55BNu+4e+2DtVzSAcRSaikuszLD4Y
	dwkw==
X-Gm-Message-State: APjAAAUhxymHIl52M+BCQRymP8P8+NCwnR3Ib/QnEYtOOAV32nkK/tMl
	wvqy1HO4TfEH/fh5xuT2QtRKDWJPvMVaK8n6f/s=
X-Google-Smtp-Source: APXvYqyv836+V0UtaEzVzckkI+45TgYV548FwF4a1QDm57MM8ttFoqIGy22tTUSoJchU4jXEjCxs/w==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr19295976wmf.166.1560782196872;
	Mon, 17 Jun 2019 07:36:36 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	l1sm12697489wmg.13.2019.06.17.07.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Jun 2019 07:36:36 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:36:35 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190617143635.xkbmoug5swqoi5em@rck.sh>
References: <20190617132440.2721536-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617132440.2721536-1-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Jens Axboe <axboe@kernel.dk>, Herbert Xu <herbert@gondor.apana.org.au>,
	Kees Cook <keescook@chromium.org>, Eric Biggers <ebiggers@google.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com,
	Roland Kammerer <roland.kammerer@linbit.com>
Subject: Re: [Drbd-dev] [PATCH] drbd: dynamically allocate shash descriptor
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

On Mon, Jun 17, 2019 at 03:24:13PM +0200, Arnd Bergmann wrote:
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
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/block/drbd/drbd_receiver.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index 90ebfcae0ce6..10fb26e862d7 100644
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
> +			crypto_shash_descsize(connection->cram_hmac_tfm),
> +		       GFP_KERNEL);
> +	if (!desc) {
> +		rv = -1;
> +		goto fail;
> +	}
>  	desc->tfm = connection->cram_hmac_tfm;
>  
>  	rv = crypto_shash_setkey(connection->cram_hmac_tfm, (u8 *)secret, key_len);
> @@ -5572,6 +5579,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
>  	kfree(response);
>  	kfree(right_response);
>  	shash_desc_zero(desc);
> +	kfree(desc);
>  
>  	return rv;
>  }

Hi Arnd,

are you sure your cleanup is okay?

>  	shash_desc_zero(desc);
> +	kfree(desc);

You shash_desc_zero() a potential NULL pointer. memzero_expicit() in the
function then dereferences it:

memzero_explicit(desc,
	sizeof(*desc) + crypto_shash_descsize(desc->tfm));

Maybe some if (desc) guard?

Best, rck
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
