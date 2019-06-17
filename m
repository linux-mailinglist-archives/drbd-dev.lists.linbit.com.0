Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id F109250FA7
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2019 17:06:30 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8343B103B4AE;
	Mon, 24 Jun 2019 17:06:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 9218D1011BFF
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 17:06:04 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id f17so13757261wme.2
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 08:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:mime-version:references:in-reply-to:from:date:message-id
	:subject:to:cc;
	bh=LpZTAf50o7/PLh9CIzhk7vHJ2cGCWuaTKNqQ1cWqNqU=;
	b=j+F7c4fiq4fVRweYPDcp7GbUGhKcp7g4+KXi/cm00AO8N83pMkz5e6GPkKFRme3Eb0
	XRDJPE8h3ro6MeyO4YKiFYO26TwiM57YKBULaHz6gsHUplNkp7/uI5mSq55adNNsim0C
	q2Wnime+PhpqP2rWHSJSH4cAzezdBbPlvNR/+JbUsuenQDyTOML6QEM2+6/ebCyILS0U
	ZJGQfInncVr9fomcQZfw1wP2TfdjoZHZ9TiqbZzEJELw8yMAK1dmyjG3zrPCk6UaP2ie
	DaIoFos2R/nDWrkNfdeMLDYoEKRca02TOtTTQ/YPgPJFl90AOqJw39/7nJKUmKWuKjWo
	4C0w==
X-Gm-Message-State: APjAAAVh6f3T14P0CAdtVu82DDL8dm7jDiEqBcXraquw/4+H/FXgJDDS
	7lIqFoIjlbclW+Ga7GoIij7OQ2WMAfuxP1rd
X-Google-Smtp-Source: APXvYqy4/DP37bUXA7QJaVYqI+VP1STT6xzUuZhK9Au7op/CspKNY2NP4tvN5ge9h696MaQZmROlyw==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr16068105wmc.21.1561388763526; 
	Mon, 24 Jun 2019 08:06:03 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	f1sm10358190wml.28.2019.06.24.08.06.03
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jun 2019 08:06:03 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 24 Jun 2019 17:06:01 +0200
Resent-Message-ID: <20190624150601.GP30528@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 325 seconds by postgrey-1.31 at mail09;
	Mon, 17 Jun 2019 22:44:33 CEST
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 489001028A66
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 22:44:33 +0200 (CEST)
Received: by mail-qk1-f195.google.com with SMTP id d15so7110825qkl.4
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 13:44:33 -0700 (PDT)
X-Received: by 2002:a37:a4d3:: with SMTP id n202mr2958065qke.84.1560803946661; 
	Mon, 17 Jun 2019 13:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190617132440.2721536-1-arnd@arndb.de>
	<20190617143635.xkbmoug5swqoi5em@rck.sh>
In-Reply-To: <20190617143635.xkbmoug5swqoi5em@rck.sh>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jun 2019 22:38:49 +0200
Message-ID: <CAK8P3a3PDznLXbaQNtFpgtJyP29mh2gGSm8DeSk0NfZCgZQ_kA@mail.gmail.com>
To: Roland Kammerer <roland.kammerer@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>, Herbert Xu <herbert@gondor.apana.org.au>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Eric Biggers <ebiggers@google.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Kees Cook <keescook@chromium.org>
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

On Mon, Jun 17, 2019 at 4:36 PM Roland Kammerer
<roland.kammerer@linbit.com> wrote:
> > @@ -5572,6 +5579,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
> >       kfree(response);
> >       kfree(right_response);
> >       shash_desc_zero(desc);
> > +     kfree(desc);
> >
> >       return rv;
> >  }
>
> Hi Arnd,
>
> are you sure your cleanup is okay?
>
> >       shash_desc_zero(desc);
> > +     kfree(desc);
>
> You shash_desc_zero() a potential NULL pointer. memzero_expicit() in the
> function then dereferences it:
>
> memzero_explicit(desc,
>         sizeof(*desc) + crypto_shash_descsize(desc->tfm));
>
> Maybe some if (desc) guard?

Good catch. I guess kzfree() would have been the right thing to call.

        Arnd
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
