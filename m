Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C54101F82FB
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:31:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B1ECE420411;
	Sat, 13 Jun 2020 12:31:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A3D0420441
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:56 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id c3so12245538wru.12
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to
	:reply-to:from:date:message-id:subject:to:cc;
	bh=Qe+5VsgePcwf6ejrqCiKCctQ/WjhPUBGKBkCEYX6uA4=;
	b=qre2s1kpk1oobXlX8WoFxtb2CMkw4KUWiEL2pu6T/iRSwHVwywjP6wzHLvw/HCrlbj
	Xl9NXTi2bin35/rOFeV3ns6fe4oYnLn/t/A3MhvzvwK1VoIZrZS6RElWdvmS5kPQPW9B
	XIlBrqteLNkAm6dEfXyIQO062JLx02iOmh61SaZZIZocP0mQk6+18Pmuw29C1ddw0CHB
	4uinFRPSW1GD8UujSbSfmtK36H0g2OxYd4qaWvNvC0ZcuJlW28hsphaWEsG2VYSw1P+R
	Kd9xCffknPIAvbTafKj/DRfzGPAfYPh+a+hGmFf9kDTv8WO23F421QYrlVkQwRTNFUTe
	pNSg==
X-Gm-Message-State: AOAM531czumi9L2rcqAGY+4QgygMqlBylmKRX8xAtga6FAvrHh60c61o
	phQXeTW77Z0t80uQnh5H4s+1Pi1R/gpqGnvj
X-Google-Smtp-Source: ABdhPJxo1coYtUiTsAnLP7EBRtGYNvBOB/hMPVo73balM2g5ih6tSEKqqKq4Vpenb51w278KHL3QcQ==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr20410329wrt.150.1592042395464;
	Sat, 13 Jun 2020 02:59:55 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	y25sm19202814wmi.2.2020.06.13.02.59.54
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:54 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:53 +0200
Resent-Message-ID: <20200613095953.GV4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18B1A420302
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 22:58:14 +0200 (CEST)
Received: by mail-io1-f66.google.com with SMTP id d5so7929704ios.9
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:reply-to:from:date:message-id
	:subject:to:cc;
	bh=Qe+5VsgePcwf6ejrqCiKCctQ/WjhPUBGKBkCEYX6uA4=;
	b=odXbhUUcIf+wDeJdjDiEFXtAYFDHAH8SAaNwcJFDM9qyOS5kIxKELihPixhgMuWsuM
	P3ftGyZTm8N3iRqAE/zGh/6Tj/FwKzi+e312hNAri4dLyhuZsVZ6pvT0TGWVr82qZhqP
	xpzITULxMsu9HCeR/Fu8fY00Ujga47C2NYw0ZWpAq8nhchSjrc9Gx1hdB9IUk3cXGfsx
	VWi9Q6APAlhH+HlN+wzjZ2rOVsUqe/9ob+rhxSJYeRVHffy8QZ1CHAECUXaQz476rziC
	s3Xe2jQo9509hzQq9oZweKonvblBmfe30dX1ICjs/m7aTkmW94D1z6eVMJOHyrzwGabS
	qQKA==
X-Received: by 2002:a02:ca18:: with SMTP id i24mr6012139jak.70.1591304293893; 
	Thu, 04 Jun 2020 13:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-6-keescook@chromium.org>
	<CAKwvOdm5zDide5RuppY_jG=r46=UMdVJBrkBqD5x=dOMTG9cZg@mail.gmail.com>
	<202006041318.B0EA9059C7@keescook>
In-Reply-To: <202006041318.B0EA9059C7@keescook>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 22:58:02 +0200
Message-ID: <CA+icZUX7HE6cVoyiKtvOe85F+npUzGy5wmScTNCKRVeCEy8Juw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
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
Reply-To: sedat.dilek@gmail.com
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

On Thu, Jun 4, 2020 at 10:20 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Jun 04, 2020 at 12:29:17PM -0700, Nick Desaulniers wrote:
> > On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > > "unused variable"). If the compiler thinks it is uninitialized, either
> > > simply initialize the variable or make compiler changes. As a precursor
> > > to removing[2] this[3] macro[4], just remove this variable since it was
> > > actually unused:
> > >
> > > drivers/ide/ide-taskfile.c:232:34: warning: unused variable 'flags' [-Wunused-variable]
> > >         unsigned long uninitialized_var(flags);
> > >                                         ^
> > >
> > > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks for the reviews!
>
> > Fixes ce1e518190ea ("ide: don't disable interrupts during kmap_atomic()")
>
> I originally avoided adding Fixes tags because I didn't want these
> changes backported into a -stable without -Wmaybe-uninitialized
> disabled, but in these cases (variable removal), that actually does make
> sense. Thanks!
>

Fixes tag does not automatically mean it is "for-stable".

[1] says:

> Patches that fix a severe bug in a released kernel should be directed
> toward the stable maintainers by putting a line like this::
>
>   Cc: stable@vger.kernel.org

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n299
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
