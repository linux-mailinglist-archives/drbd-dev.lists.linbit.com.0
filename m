Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB650FAB
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2019 17:07:00 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id CDA5A103B4D7;
	Mon, 24 Jun 2019 17:06:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D3CE91028A78
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 17:06:12 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id k11so14327574wrl.1
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 08:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:mime-version:references:in-reply-to:from:date:message-id
	:subject:to:cc;
	bh=nIPHa48eC477VDjHx1ZCYDwdsGRn2h4fpH2GcgXY5WE=;
	b=RrjxwjQZc3p+HHCOs+0866gDpYbmm5Zb/Wc+wZL+QgE+QYgovc6/Sq4lgoAiaNyW+F
	HdSN2w0h6RWfJ3rxmKWjwPyQtDlxiWN2RCIgUU9s56RqPBNKb30DdX3ceM9nJpdYqRem
	2snebiu71msqWS0ktOkotsUotxHoawTlEaE+yvI2Fh6eSZmcC9PVIXlEeteZ5u+I/M51
	hEorhPOkwlNuZksqtsTHewX17FlQErhe/LHMWpS2HG6vIAsm2domtOWNMO1V28W9pafg
	JlF62ZIKdXE47G1q//RM3j764yaWxyXITvys+RrjT4bUtMm6etdPtkq0gbNe71iQFuJK
	QrOQ==
X-Gm-Message-State: APjAAAV7txQff9CZgNoIo7nbA0kp0Ohwl6ES6mvLMIknyNL+nFNQ/16/
	8ScacaMg2OE122LWIlcVvawKxVUJ/Jd0loIO
X-Google-Smtp-Source: APXvYqwB1c8T+gxwDrel+ohcA9BiE8k3qcyA4sarH7Ct0pdr6tsd0Kyh62v7nq8P+lxek3xue6wopQ==
X-Received: by 2002:adf:f104:: with SMTP id r4mr18223577wro.140.1561388771908; 
	Mon, 24 Jun 2019 08:06:11 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	t198sm16882284wmt.2.2019.06.24.08.06.11
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jun 2019 08:06:11 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 24 Jun 2019 17:06:10 +0200
Resent-Message-ID: <20190624150610.GQ30528@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 339 seconds by postgrey-1.31 at mail09;
	Mon, 17 Jun 2019 23:04:56 CEST
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 7008D1011BF7
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 23:04:56 +0200 (CEST)
Received: by mail-qt1-f194.google.com with SMTP id d23so12629521qto.2
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 14:04:56 -0700 (PDT)
X-Received: by 2002:a0c:b758:: with SMTP id q24mr23622267qve.45.1560805155468; 
	Mon, 17 Jun 2019 13:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190617132440.2721536-1-arnd@arndb.de>
	<20190617144335.q243r7l7ox7galhl@gondor.apana.org.au>
In-Reply-To: <20190617144335.q243r7l7ox7galhl@gondor.apana.org.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jun 2019 22:58:58 +0200
Message-ID: <CAK8P3a2g4ZDcyxuSOkYzOmqV3Hc3YF3Anc3GQysvGo9bijYufQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>,
	Eric Biggers <ebiggers@google.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
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

On Mon, Jun 17, 2019 at 4:43 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Mon, Jun 17, 2019 at 03:24:13PM +0200, Arnd Bergmann wrote:
> > Building with clang and KASAN, we get a warning about an overly large
> > stack frame on 32-bit architectures:
> >
> > drivers/block/drbd/drbd_receiver.c:921:31: error: stack frame size of 1280 bytes in function 'conn_connect'
> >       [-Werror,-Wframe-larger-than=]
> >
> > We already allocate other data dynamically in this function, so
> > just do the same for the shash descriptor, which makes up most of
> > this memory.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/block/drbd/drbd_receiver.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
>
> Does this patch fix the warning as well?

The warning is gone with this patch. Instead of 1280 bytes for drbd_receiver,
I now see 512 bytes, and 768 bytes for drbd_get_response, everything else is
under 160 bytes in this file.

However, with the call chain of

drbd_receiver
   conn_connect
       drbd_do_auth
             drbd_get_response

This still adds up to as much as before, so it only shuts up the
warning but does not reduce the maximum stack usage.

If we are sure that is ok, then your patch would be nicer,
possibly with a 'noinline_for_stack' tag on drbd_get_response.

       Arnd
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
