Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA11EEDD3
	for <lists+drbd-dev@lfdr.de>; Fri,  5 Jun 2020 00:39:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 988174203E1;
	Fri,  5 Jun 2020 00:39:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFA974203B3
	for <drbd-dev@lists.linbit.com>; Fri,  5 Jun 2020 00:39:31 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id ga6so1735712pjb.1
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=zP55TDVJhIIf3D70exLW80PJ5Fxq6s8zGifToJ/Z0dc=;
	b=STEhsSBGd7DFiZ3UGgyOyWz0+OZ9/KhsvcAnzAOd8JPwZ+zr9/aF/KViUCztgCBy92
	FatcX4M5pGBoOm8c8fRwdwYT3SzCZxJMA26B6VZq+yhs3wn+33OYZkPO81JIjxz9C4lx
	SscwjwS9vUKhcxU5a1rLbY73RBqedLSon2/zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=zP55TDVJhIIf3D70exLW80PJ5Fxq6s8zGifToJ/Z0dc=;
	b=V5IE9wn63XGbYwtODYE6WC33aSRIX17/boHulUh5xbRECHWhLqeTkFq4gVECLE7Za0
	zmsBksRetNDeDUbyg95igIXxQVpj2RSOGHR606ifdz55cJnBVE5YmsUgkAOOXXzs2+73
	2kou8LfCJ318MaE5Qb1B2P+6x2BKn0JGarO7DGgeUxc6sGCsEP2OCnPXAvsz+8Dy6ukF
	lPLW89v7Y5PF8Q1awQMox7IYzqX9OnavTtd1+uLeEjvZdfz8y8044jrOiAKFUpvP7tK6
	ObCxYpd2+m6TgP46dBoI5V1qBpvBbX6+eoTRj4SrfrygLxPvVJfmwaRAAfpaYeEL/23+
	102A==
X-Gm-Message-State: AOAM531ASY4MfHtO34sHygGH1QnGy0gEiAp5/rzLxBlbj1wjVW6UtQqf
	7A008dTc+3t/bqu8C1cP6wRZcg==
X-Google-Smtp-Source: ABdhPJz5rSeyZzVAkY37cQQqAUZMY9xHYrA838IOdkb8jskKkK6guA0WdZONNuWfyJeZYfJH5ZIBCw==
X-Received: by 2002:a17:90a:c293:: with SMTP id
	f19mr8170642pjt.91.1591310370635; 
	Thu, 04 Jun 2020 15:39:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	nl8sm7407988pjb.13.2020.06.04.15.39.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 15:39:29 -0700 (PDT)
Date: Thu, 4 Jun 2020 15:39:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <202006041539.B8C0C768@keescook>
References: <20200603233203.1695403-2-keescook@chromium.org>
	<874krr8dps.fsf@nanos.tec.linutronix.de>
	<202006040728.8797FAA4@keescook>
	<87zh9i7bpi.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zh9i7bpi.fsf@nanos.tec.linutronix.de>
Cc: Andy Whitcroft <apw@canonical.com>, clang-built-linux@googlegroups.com,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/10] x86/mm/numa: Remove
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

On Thu, Jun 04, 2020 at 11:39:05PM +0200, Thomas Gleixner wrote:
> Kees Cook <keescook@chromium.org> writes:
> >> > -#define NODE_NOT_IN_PAGE_FLAGS
> >> > +#define NODE_NOT_IN_PAGE_FLAGS 1
> >> 
> >> but if we ever lose the 1 then the above will silently compile the code
> >> within the IS_ENABLED() section out.
> >
> > That's true, yes. I considered two other ways to do this:
> >
> > 1) smallest patch, but more #ifdef:
> > 2) medium size, weird style:
> >
> > and 3 is what I sent: biggest, but removes #ifdef
> >
> > Any preference?
> 
> From a readbility POV I surely prefer #3. i"m just wary. Add a big fat
> comment to the define might mitigate that, hmm?

Sure! I'll add it.

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
