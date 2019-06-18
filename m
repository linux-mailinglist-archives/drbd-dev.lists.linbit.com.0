Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872350FB1
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2019 17:07:31 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B106103B4DB;
	Mon, 24 Jun 2019 17:07:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0CD7E1028A7B
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 17:06:23 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id p11so14288564wre.7
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2019 08:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yeAbLE7FghFYgPCRNwhrcJDXAy4XIHTVO1g7KWKs9mM=;
	b=H8/WOkO1yrFurlbiVItQgIjxN9bk37xl/oXtbdgqcvyXqTq/vQjgHn5J1K7zZI5MXn
	2aoTECFMeVG/Z0ndwLssYDdifvWr5ec5CkAOHD5q+rE6/+7Sh/4FshjSPCPNXQX+PWwC
	Z7fs6ddApTfhx2Gh7SE5Ix9evR0yN7eFKejpEbgxDPKLEb6EXUaH6O+1mnQkhyg3cc4L
	Ns/8em2tOUR0hM0Od3i40Als163tK6DuJ9tj/HrZNwPA7tnKNJnxDQj/2yikHDf5N0Ra
	ehj9MPYGvXvMIJ3fNUO9Vtf363SPq9B6bnTVw5FC8vr43x7mPeqBXrYCYCzka66y+kwZ
	svXw==
X-Gm-Message-State: APjAAAXg3octcvxlLehCK2083Pjz032HQF4PZ9EcJY+v4wVZE86arsfD
	q5VylBPisHkgqNlYo0AM+DrAYITv7C99HO4p
X-Google-Smtp-Source: APXvYqw5Rk/NTkT2TVt3OK2z16CXccS+DqX0ap7UQdxlmOrdvuZXXSfoQi2iosm6arqse50LaGCY5w==
X-Received: by 2002:a5d:4941:: with SMTP id r1mr22149830wrs.225.1561388783404; 
	Mon, 24 Jun 2019 08:06:23 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	j7sm15598436wru.54.2019.06.24.08.06.22
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jun 2019 08:06:23 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 24 Jun 2019 17:06:21 +0200
Resent-Message-ID: <20190624150621.GR30528@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E7AF1019AC6
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 05:42:57 +0200 (CEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hd51A-0001Hk-N6; Tue, 18 Jun 2019 11:42:44 +0800
Received: from herbert by gondobar with local (Exim 4.89)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hd516-0004RQ-Ap; Tue, 18 Jun 2019 11:42:40 +0800
Date: Tue, 18 Jun 2019 11:42:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190618034240.m4cnyjsbe4txth72@gondor.apana.org.au>
References: <20190617132440.2721536-1-arnd@arndb.de>
	<20190617144335.q243r7l7ox7galhl@gondor.apana.org.au>
	<CAK8P3a2g4ZDcyxuSOkYzOmqV3Hc3YF3Anc3GQysvGo9bijYufQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2g4ZDcyxuSOkYzOmqV3Hc3YF3Anc3GQysvGo9bijYufQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

On Mon, Jun 17, 2019 at 10:58:58PM +0200, Arnd Bergmann wrote:
>
> The warning is gone with this patch. Instead of 1280 bytes for drbd_receiver,
> I now see 512 bytes, and 768 bytes for drbd_get_response, everything else is
> under 160 bytes in this file.
> 
> However, with the call chain of
> 
> drbd_receiver
>    conn_connect
>        drbd_do_auth
>              drbd_get_response
> 
> This still adds up to as much as before, so it only shuts up the
> warning but does not reduce the maximum stack usage.

OK so it doesn't really reduce it.  Let's just go with your patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
