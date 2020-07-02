Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D9B2127AB
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Jul 2020 17:22:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B5B0F4203F3;
	Thu,  2 Jul 2020 17:21:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 424764203EA
	for <drbd-dev@lists.linbit.com>; Thu,  2 Jul 2020 17:21:42 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id gc15so4209949pjb.0
	for <drbd-dev@lists.linbit.com>; Thu, 02 Jul 2020 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=85NgcoW6jBNBGz0tQzl+oqewL1I9o/iwYquf90s0iyI=;
	b=fz3Jh9EbW2QNq/2MyLiNywl+Bw+HpwfpGyCppJTlFpNOcSFS1TexJkrkG1UxqufMgU
	DTnt8qDgoR6kpc5Uov/N8ZFtF9gBkglTu3rbJlgEgXDnMffWLDd4jgcOStrGlPxU6l/S
	kAv+vOh2+5LMMHeltnDKRB/tSSiTCWUefTVYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=85NgcoW6jBNBGz0tQzl+oqewL1I9o/iwYquf90s0iyI=;
	b=uRcNdYjVx3tl9kDw6TjX0vxG+gQx6W2JWv6ytx5jgyKKftLa1hhvj+oiY5qNu4mn8H
	7OO3COkqDd9DfJWW9mQRl7to7mziyT/0NIDkxwv2nJBHSpJshKbp7Dz2kyTYnngYrzCB
	EZJOy4XIpTpiw+eqEkct6KTInVrl9U102wEXypvNB3Q2hxFNC2CfnjDtUmKBwlhxY5mp
	1U7xkuDqapZfxO4qjBx4/YLZ78Ld069quEWgwhvAhWI4zs9p3ojU+8Nhl6WRZjowMfuh
	I91IoHwoj1c1ZsZKQQgZYpNyrFVC7g1joW6TWPeCLp0CoEWrImjMvQZaYt60IMT6wAWo
	mc3g==
X-Gm-Message-State: AOAM530gPKioBaVBY8kOkrmLsJDaQu4t/6Aa7w+TnOQcke8rvp5/EV3M
	Ya4XDZthihNSy6RZPtX8ooiRaQ==
X-Google-Smtp-Source: ABdhPJyPnF33faJF3QEw2ElnpTvwp44zuiTBz6WWqS/hEjfBUUANHOACCnQyGoZR2gBcK7ir4/OsKg==
X-Received: by 2002:a17:90a:cb0e:: with SMTP id
	z14mr31267430pjt.140.1593703302136; 
	Thu, 02 Jul 2020 08:21:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	c19sm8151174pjs.11.2020.07.02.08.21.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jul 2020 08:21:41 -0700 (PDT)
Date: Thu, 2 Jul 2020 08:21:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <202007020819.318824DA@keescook>
References: <20200620033007.1444705-1-keescook@chromium.org>
	<20200620033007.1444705-9-keescook@chromium.org>
	<20200701203920.GC3776@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701203920.GC3776@sirena.org.uk>
Cc: Andy Whitcroft <apw@canonical.com>, linux-wireless@vger.kernel.org,
	clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, x86@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 08/16] spi: davinci: Remove
	uninitialized_var() usage
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

On Wed, Jul 01, 2020 at 09:39:20PM +0100, Mark Brown wrote:
> On Fri, Jun 19, 2020 at 08:29:59PM -0700, Kees Cook wrote:
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > "unused variable"). If the compiler thinks it is uninitialized, either
> > simply initialize the variable or make compiler changes. As a precursor
> > to removing[2] this[3] macro[4], just remove this variable since it was
> > actually unused:
> 
> Please copy maintainers on patches :(

Hi! Sorry about that; the CC list was giant, so I had opted for using
subsystem mailing lists where possible.

> Acked-by: Mark Brown <broonie@kernel.org>

Thanks!

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
