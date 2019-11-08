Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB3F4500
	for <lists+drbd-dev@lfdr.de>; Fri,  8 Nov 2019 11:51:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D3894203DB;
	Fri,  8 Nov 2019 11:51:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 337 seconds by postgrey-1.31 at mail19;
	Fri, 08 Nov 2019 11:51:41 CET
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01D3C420342
	for <drbd-dev@lists.linbit.com>; Fri,  8 Nov 2019 11:51:41 +0100 (CET)
Received: by mail-wm1-f65.google.com with SMTP id z19so5709267wmk.3
	for <drbd-dev@lists.linbit.com>; Fri, 08 Nov 2019 02:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4CBruAMCJFKMfos8U5j6/UiYgs9P6E1HnVdReKS3MqA=;
	b=Q0cF/YSotKrJUQ00DzbNcgg5SFbACXfUSdCuM5kA3+CYUIWwO5opO0zdGQNlY205VJ
	MVromrhVqva64s7XtAeEGcDIxDI1qT4LP5+BWk5LLYfztAWH9P3AJx6YJoSobBT4k9Bf
	lcgblIAZmwVazUM3hlKgNWpwpk7yy8n5m47IVr9b+5h0pL3mHHzFp8mLJdH5xXnPZOX7
	QdAFOo3J9WRWmwwVDstsCrJqZVwQpZ4AtGEK1qw1PJrgRin4TH+oywZuAS/l4q48VOCT
	Z/9s2jq8l2DsTSFH/y1y6uNgDs5rGrGYVM92r0DDh3cgVOitYs4jka6NHdG+6oPDtWkq
	+0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4CBruAMCJFKMfos8U5j6/UiYgs9P6E1HnVdReKS3MqA=;
	b=JDK2OUe86NJc1jwOIeyPb3ZUvC+NR1Ese0qEECfsjzmpQ7re9yDB7HSuyUevODOGAr
	UgHRaK7I6Ime7THNo0lHy1EEPAKNdNFqzU1UFXfCbm4J0hlm0+jcf9kAavTPwJUH4ZNN
	1onSaCvSx07wf5xNEkPhWJIQvIsCe1Bj1c0dkDU7hEt8Sl2NM85YdckaVV7lGA2EU+n8
	IqM0Ql7wzhaQ+jbnvHfgT4r8TzX9ma8BD/1dHeLub86uukrxPUEjS/mFI33K9pn9t+nZ
	4zvNFWU8JBUnAMxhJI27OuysNaAGrXT/THogPOcHt5NuQ/MsUGKg1WCLyGkXsKu3jmYK
	UN9w==
X-Gm-Message-State: APjAAAULH0D+OXurQCqJlVRUSZ5YI7zaFw8EYihMuhGyPnCK/ipy1fz2
	JI7okXYvE3BXBGKaKMh/eX91aagI
X-Google-Smtp-Source: APXvYqz25njYbwovs9pg+pdBGnlz1bVNRBcz/NUAh6IHHrnzt0NMqxeo1MLcjvB3yCr+4j30r7AJSQ==
X-Received: by 2002:a1c:3d57:: with SMTP id k84mr7225203wma.156.1573209963618; 
	Fri, 08 Nov 2019 02:46:03 -0800 (PST)
Received: from fat-tyre.localnet ([2001:858:107:1:a5fe:1d4:97a0:40d8])
	by smtp.gmail.com with ESMTPSA id y6sm3240108wrr.19.2019.11.08.02.46.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Nov 2019 02:46:02 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Jens Axboe <axboe@kernel.dk>
Date: Fri, 08 Nov 2019 11:46:00 +0100
Message-ID: <6906816.cRlsrm7Sor@fat-tyre>
In-Reply-To: <20191107074847.GA11695@mwanda>
References: <20191107074847.GA11695@mwanda>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: drbd: remove a stay unlock in
	__drbd_send_protocol()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Dan,

yes, your patch it obviously correct. The comment you are
referring to is badly worded. We will remove it.

Jens,

are you taking this patch as it is?

best regards,
 Phil

Am Donnerstag, 7. November 2019, 08:48:47 CET schrieb Dan Carpenter:
> There are two callers of this function and they both unlock the mutex so
> this ends up being a double unlock.
> =

> Fixes: 44ed167da748 ("drbd: rcu_read_lock() and rcu_dereference() for
> tconn->net_conf") Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analisys.  Not tested.  There is a comment about the lock next to
> the caller in drbd_nl.c that I didn't understand:
> =

> drivers/block/drbd/drbd_nl.c
>   2509          crypto_free_shash(connection->integrity_tfm);
>   2510          connection->integrity_tfm =3D crypto.integrity_tfm;
>   2511          if (connection->cstate >=3D C_WF_REPORT_PARAMS &&
> connection->agreed_pro_version >=3D 100) 2512                  /* Do this
> without trying to take connection->data.mutex again.  */
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ What does th=
is
> mean?  We're already holding that lock.  We took it near the start of the
> function.
> =

>   2513                  __drbd_send_protocol(connection, P_PROTOCOL_UPDAT=
E);
> 2514
>   2515          crypto_free_shash(connection->cram_hmac_tfm);
>   2516          connection->cram_hmac_tfm =3D crypto.cram_hmac_tfm;
>   2517
>   2518          mutex_unlock(&connection->resource->conf_update);
>   2519          mutex_unlock(&connection->data.mutex);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Unlocked here.
> =

>  drivers/block/drbd/drbd_main.c | 1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_mai=
n.c
> index 5b248763a672..a18155cdce41 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -786,7 +786,6 @@ int __drbd_send_protocol(struct drbd_connection
> *connection, enum drbd_packet cm
> =

>  	if (nc->tentative && connection->agreed_pro_version < 92) {
>  		rcu_read_unlock();
> -		mutex_unlock(&sock->mutex);
>  		drbd_err(connection, "--dry-run is not supported by peer");
>  		return -EOPNOTSUPP;
>  	}


-- =

LINBIT | Keeping The Digital World Running

DRBD=AE and LINBIT=AE are registered trademarks of LINBIT, Austria.



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
