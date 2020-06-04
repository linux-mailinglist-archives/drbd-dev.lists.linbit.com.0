Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9361F82DE
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:22:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 520E0420402;
	Sat, 13 Jun 2020 12:22:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6C93A42042E
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:57 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id l26so10039626wme.3
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to
	:reply-to:from:date:message-id:subject:to:cc;
	bh=iPa6WDxkXnezV97Gv8ktsN2vMvnblioziS1zAvyim80=;
	b=bKtbk5ZaJaIc0S9hwkvCCIv/nLvumwvF6v7j0JM+BXamW1thJoLY3//Jx/j0OS8Eq/
	fA4gv3/VSqzg/tkZ6xV4X/7XrlTgzPoxxGF1OuZ4V7j6dK0RBSKgLax85fzrmZZZQwDY
	MretSyTDz8sFTlgqp3x+5BbSgLbUiwpXWydRtDFz5To9Cx5veAZW04vV5/zZBT/jwooN
	KQWgGRly7nuCjWcrcyZiA35Qp7KhfpB5xAFZYxP/pwtQ7tpYxLmOUaSC/KJa6drSZByN
	nmWo/lD3gEhUhPyTrbaXy+J36QM7ZKC/OjqjMxP/zaSkefTehXo2gftBpvUH7dHnfcAS
	XUrw==
X-Gm-Message-State: AOAM533Cdj8YhoefWGZfgIz9kTVnYEiuKseUIA1RDIzl8/TjQ4O/W024
	fSdShvGigjTRwGfyv2Ep3jLyZc/n7HBdBgoW
X-Google-Smtp-Source: ABdhPJxPHFEQ8Yv+GAMup32GikFeA4zNtktcHPk+ALXUXTGRPU+YrzwlAR+Y/2r3cvKHZ49cvz8J1Q==
X-Received: by 2002:a1c:b182:: with SMTP id a124mr3103088wmf.114.1592042336853;
	Sat, 13 Jun 2020 02:58:56 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	o10sm14086644wrq.40.2020.06.13.02.58.56
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:56 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:54 +0200
Resent-Message-ID: <20200613095854.GC4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 548D242030B
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 04:53:47 +0200 (CEST)
Received: by mail-io1-f65.google.com with SMTP id h4so4658385iob.10
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 19:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:reply-to:from:date:message-id
	:subject:to:cc;
	bh=iPa6WDxkXnezV97Gv8ktsN2vMvnblioziS1zAvyim80=;
	b=gV3DINCKuZMpDCcJsHDr9sszAXGMneIMI9KCtZ/1A8KL8Ro8YmZMB8pbOf6XvwEEzL
	3s/WZ64Ad1THwC1yIcoFtMfrjuy9MChcgCUeVc2yt6Fhqv5YnQlKfybyJa868B56C64R
	SpWLnoPhud5yWqrZVnmnqlgYyhjIfWw9LqP/fxle2AdjsoTo956wTTJnEH2/k/fpJpV8
	AlEmkB8V6/jcUVOOJnMZ+E5Zm/eCneQHSejIbdNntpH48J0GSb9f7+yK1rM1n2Ds+iYc
	oegcVR8oOw7YMCXmQJAWTc+Zqvl8pQBXc+Tu4Mxm/lQXO2FR+n8tx0M6aLA2yfHxQbwF
	EZTA==
X-Received: by 2002:a05:6602:1616:: with SMTP id
	x22mr2465452iow.70.1591239226196; 
	Wed, 03 Jun 2020 19:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-9-keescook@chromium.org>
	<ff9087b0571e1fc499bd8a4c9fd99bfc0357f245.camel@perches.com>
	<202006031838.55722640DC@keescook>
	<6f921002478544217903ee4bfbe3c400e169687f.camel@perches.com>
	<202006031944.9551FAA68E@keescook>
In-Reply-To: <202006031944.9551FAA68E@keescook>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 04:53:34 +0200
Message-ID: <CA+icZUVg24VrpPgMdfsgPa+Wckci9XkzKUdtwhVB3ZW96uZOWw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>,
	Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 08/10] checkpatch: Remove awareness of
	uninitialized_var() macro
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

Hi Kees,

can you push that change also to kees/linux.git#kspp/uninit/v5.7/macro ?

Thanks in advance.

Regards,
- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=kspp/uninit/v5.7/macro

On Thu, Jun 4, 2020 at 4:44 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jun 03, 2020 at 06:47:13PM -0700, Joe Perches wrote:
> > On Wed, 2020-06-03 at 18:40 -0700, Kees Cook wrote:
> > > On Wed, Jun 03, 2020 at 05:02:29PM -0700, Joe Perches wrote:
> > > > On Wed, 2020-06-03 at 16:32 -0700, Kees Cook wrote:
> > > > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > > > (or can in the future), and suppresses unrelated compiler warnings
> > > > > (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> > > > > either simply initialize the variable or make compiler changes.
> > > > >
> > > > > In preparation for removing[2] the[3] macro[4], effectively revert
> > > > > commit 16b7f3c89907 ("checkpatch: avoid warning about uninitialized_var()")
> > > > > and remove all remaining mentions of uninitialized_var().
> > > > >
> > > > > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > > > > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > > > > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > > > > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> > > >
> > > > nack.  see below.
> > > >
> > > > I'd prefer a simple revert, but it shouldn't
> > > > be done here.
> > >
> > > What do you mean? (I can't understand this and "fine by me" below?)
> >
> > I did write "other than that"...
> >
> > I mean that the original commit fixed 2 issues,
> > one with the uninitialized_var addition, and
> > another with the missing void function declaration.
> >
> > I think I found the missing void function bit because
> > the uninitialized_var use looked like a function so I
> > fixed both things at the same time.
> >
> > If you change it, please just remove the bit that
> > checks for uninitialized_var.
>
> Ah! Gotcha. Thanks; I will update it.
>
> -Kees
>
> >
> > Thanks, Joe
> >
> > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > []
> > > > > @@ -4075,7 +4074,7 @@ sub process {
> > > > >                 }
> > > > >
> > > > >  # check for function declarations without arguments like "int foo()"
> > > > > -               if ($line =~ /(\b$Type\s*$Ident)\s*\(\s*\)/) {
> > > > > +               if ($line =~ /(\b$Type\s+$Ident)\s*\(\s*\)/) {
> > > >
> > > > This isn't right because $Type includes a possible trailing *
> > > > where there isn't a space between $Type and $Ident
> > >
> > > Ah, hm, that was changed in the mentioned commit:
> > >
> > > -               if ($line =~ /(\b$Type\s+$Ident)\s*\(\s*\)/) {
> > > +               if ($line =~ /(\b$Type\s*$Ident)\s*\(\s*\)/) {
> > >
> > > > e.g.:     int *bar(void);
> > > >
> > > > Other than that, fine by me...
> > >
> > > Thanks for looking it over! I'll adjust it however you'd like. :)
> > >
> >
>
> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202006031944.9551FAA68E%40keescook.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
