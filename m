Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA51EEBC8
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 22:20:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A1C4F4203E3;
	Thu,  4 Jun 2020 22:20:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00A0B4203B3
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 22:20:02 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id b7so2497381pju.0
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 13:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=gz66RqxXF5KGuRHQ0GYBuygtpEJiPzNI0sTLh4Vu69Y=;
	b=jAmWlkIQJZzKdLIy24SnHWINuzTVOS3/wjvm2cU2AFi5wGPpwqQkjWfOwBraDHgs8k
	bMHElbdbRxBbtC27xZm6mEe99uDc96pKouYmbV/dc0+e2MIiE2jcwrdVq98w16mgeguV
	2DhLtfyu1wmL1bs6o/3S7BQ/OXA9/tFItMGTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=gz66RqxXF5KGuRHQ0GYBuygtpEJiPzNI0sTLh4Vu69Y=;
	b=BnJ4p/Bxp/ha8I5xlByy3A2e8XfaBEz0D2kQ8aU15LgUeprOOlqOZ+oh5WcYDHKN7M
	YjjMmPhURpWVe4Qch5f0zTo96N1DMTK7wOAx6hXq5VLbY4G0VGTHEHg7J6EAN7jk/NKA
	JYG/NN8sZfWXv0LgAR24ZDb3WxYcZ8GK4r3mkSgUBmOSJSqMOjHFmGWK84kdN1HQedrV
	kAGukUMHjTsmLP68YS+KuV+Dy+tNDWsagIhvu8/2dIEvU9pwDqn4obOQRgj1xBSTwzBq
	ximl3F54l7dx/a6wEMX2j4WjmqZ7d4DSozC8DdrDECfQf83evXnstToxHwEA/MSsy6Bx
	qleA==
X-Gm-Message-State: AOAM531letEaVmJSCWLZMQ1mvEQsTGzQWIOuUguR6JSkUyHYI8ugpIgb
	bI2irjfNQ7s5XGZ4MP5TL37Rsg==
X-Google-Smtp-Source: ABdhPJxkV30NNQPml+L5dx48JHt30SosyvH9CeJOsvPeKMxl1Di1uyDaJOg4t+7npffgj0Ki2XTH3Q==
X-Received: by 2002:a17:90a:7043:: with SMTP id
	f61mr7838452pjk.140.1591302001916; 
	Thu, 04 Jun 2020 13:20:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	g17sm1432553pju.11.2020.06.04.13.20.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 13:20:01 -0700 (PDT)
Date: Thu, 4 Jun 2020 13:20:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <202006041318.B0EA9059C7@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-6-keescook@chromium.org>
	<CAKwvOdm5zDide5RuppY_jG=r46=UMdVJBrkBqD5x=dOMTG9cZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdm5zDide5RuppY_jG=r46=UMdVJBrkBqD5x=dOMTG9cZg@mail.gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 05/10] ide: Remove uninitialized_var() usage
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

On Thu, Jun 04, 2020 at 12:29:17PM -0700, Nick Desaulniers wrote:
> On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > "unused variable"). If the compiler thinks it is uninitialized, either
> > simply initialize the variable or make compiler changes. As a precursor
> > to removing[2] this[3] macro[4], just remove this variable since it was
> > actually unused:
> >
> > drivers/ide/ide-taskfile.c:232:34: warning: unused variable 'flags' [-Wunused-variable]
> >         unsigned long uninitialized_var(flags);
> >                                         ^
> >
> > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the reviews!

> Fixes ce1e518190ea ("ide: don't disable interrupts during kmap_atomic()")

I originally avoided adding Fixes tags because I didn't want these
changes backported into a -stable without -Wmaybe-uninitialized
disabled, but in these cases (variable removal), that actually does make
sense. Thanks!

-Kees

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
