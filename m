Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 573271F82F5
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:30:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 35EC642040D;
	Sat, 13 Jun 2020 12:30:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1FFB3420439
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:51 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id e1so12309102wrt.5
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=TblIMkzhKEVNZyPa1dQf8kFQ+MgYlpgsesY6pOK1xME=;
	b=thvTjL5M0q9ifUyF/0142gOd1r/HDCk5zu0dn+S3/+8vo6APytpItxMx4rSILi4Gu6
	MNFUKba0hv3nCgKIFYzNwFqFpfRS8V1nmtQLbqofYLbc+ng/KH4UOUq2lZ3oVTkd88t9
	h3dfuNrz3Y8zBujTXS+WcLHgiJ8feKiNhy/mcBtMVQEvCUJ9K4oYEKgTbj8tGhCq61Sq
	mm0p1o7/TJe7ykagiT9yljAht5KPTh6KgSmPLqR2lq9mF8OB0fYAazb/GS3Rk4jxx9Xf
	8X+dkxM68gkCS9nF4h3HeKaa0gxUS4KM853o4w8ng5zMInOsBAZA3i/H0EiDgI8aJxSU
	bPOQ==
X-Gm-Message-State: AOAM530xNaeI99Z022sC0ickza4u8vEEud7cjj6Eiwq64czOOyRLTg97
	LJrfTM7cjyRfIfmqjd/sDmtzYrGfB2jCFrsL
X-Google-Smtp-Source: ABdhPJzzRlPvuBMWD8nwzqWgF1Gy9PavQ/SMpi/nkiJ6HubJcvgM2E+tjE21762xX7+jKOiNgB/ngQ==
X-Received: by 2002:adf:a1d3:: with SMTP id v19mr19021789wrv.245.1592042390352;
	Sat, 13 Jun 2020 02:59:50 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	v7sm13662171wme.46.2020.06.13.02.59.49
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:49 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:48 +0200
Resent-Message-ID: <20200613095948.GT4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF5B24203B3
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 22:25:29 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id h95so1722343pje.4
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TblIMkzhKEVNZyPa1dQf8kFQ+MgYlpgsesY6pOK1xME=;
	b=eTUIYqIrq5sxbgWQO/3JauOnTYpVr1lxYINDt5nKOAMkJOKF9ufyGFqb5XSmsRi3m+
	Uksx9+kJJ0xBVvvMTZtWdGvFYckH9URWghdJ/VSzZBwwBmizmaE949JntUM6qTfFIrip
	3zzyVfVtH7B2Lzj4WQ8kAWj65+Txwm/2hs5XFlhCKdRU1uedTRsD04P49ZgSRY5QBLTc
	CQBCbVHZuVCB29pP2Co0mZAOf0TgkJUljtb0VB8CHI8VhuigYp30PE+r/D7MHanlVYxK
	BKS8ooZdHaU0PWi8nTHb08bOMRG7dMr/qLVaTlH87DKKqIpufZxi7ZRUHWNmW4PpK4km
	2vlA==
X-Received: by 2002:a17:902:341:: with SMTP id
	59mr6129425pld.119.1591302328252; 
	Thu, 04 Jun 2020 13:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-4-keescook@chromium.org>
	<CAKwvOdnNuFySqAMk7s_cXqFM=dPX4JfvqNVLCuj90Gn4tzciAw@mail.gmail.com>
	<202006041316.A15D952@keescook>
In-Reply-To: <202006041316.A15D952@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Jun 2020 13:25:16 -0700
Message-ID: <CAKwvOdk9e19MqJNhGYV5mJisLOcjK+ba2sYzLgf7cvNerqNuwA@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
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
Subject: Re: [Drbd-dev] [PATCH 03/10] b43: Remove uninitialized_var() usage
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

On Thu, Jun 4, 2020 at 1:18 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Jun 04, 2020 at 01:08:44PM -0700, Nick Desaulniers wrote:
> > On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > > "unused variable"). If the compiler thinks it is uninitialized, either
> > > simply initialize the variable or make compiler changes. As a precursor
> > > to removing[2] this[3] macro[4], just initialize this variable to NULL,
> > > and make the (unreachable!) code do a conditional test.
> > >
> > > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  drivers/net/wireless/broadcom/b43/phy_n.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
> > > index d3c001fa8eb4..88cdcea10d61 100644
> > > --- a/drivers/net/wireless/broadcom/b43/phy_n.c
> > > +++ b/drivers/net/wireless/broadcom/b43/phy_n.c
> > > @@ -4222,7 +4222,7 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
> >
> > The TODOs and `#if 0` in this function are concerning.  It looks like
> > `rf_pwr_offset_table` is only used when `phy->rev` is >=7 && < 19.
> >
> > Further, the loop has a case for `phy->rev >= 19` but we would have
> > returned earlier if that was the case.

oh, and there's an early return for `phy->rev < 3` I just noticed.

>
> Yeah, that's why I put the "(unreachable!)" note in the commit log. ;)

I don't think that note is correct.

>
> >
> > >         u32 rfpwr_offset;
> > >         u8 pga_gain, pad_gain;
> > >         int i;
> > > -       const s16 *uninitialized_var(rf_pwr_offset_table);
> > > +       const s16 *rf_pwr_offset_table = NULL;
> > >
> > >         table = b43_nphy_get_tx_gain_table(dev);
> > >         if (!table)
> > > @@ -4256,9 +4256,13 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
> > >                         pga_gain = (table[i] >> 24) & 0xf;
> > >                         pad_gain = (table[i] >> 19) & 0x1f;
> > >                         if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
> > > -                               rfpwr_offset = rf_pwr_offset_table[pad_gain];
> > > +                               rfpwr_offset = rf_pwr_offset_table
> > > +                                               ? rf_pwr_offset_table[pad_gain]
> > > +                                               : 0;
> > >                         else
> > > -                               rfpwr_offset = rf_pwr_offset_table[pga_gain];
> > > +                               rfpwr_offset = rf_pwr_offset_table
> > > +                                               ? rf_pwr_offset_table[pga_gain]
> > > +                                               : 0;
> >
> >
> > The code is trying to check `phy->rev >= 7 && phy->rev < 19` once
> > before the loop, then set `rf_pwr_offset_table`, so having another
> > conditional on `rf_pwr_offset_table` in the loop is unnecessary. I'm
> > ok with initializing it to `NULL`, but I'm not sure the conditional
> > check is necessary.  Do you get a compiler warning otherwise?
>
> I mean, sort of the best thing to do is just remove nearly everything
> here since it's actually unreachable. But it is commented as "when

This code is reachable. Consider `phy->rev >= 7 && phy->rev < 19`.  If
`rf_pwr_offset_table` was NULL, it would have returned early on L4246,
so the checks added in this patch are unnecessary.  Forgive me if
there's some other control flow I'm not considering.

> supported ..." etc, so I figured I'd leave it. As part of that I didn't
> want to leave any chance of a NULL deref, so I added the explicit tests
> just for robustness.
>
> *shrug*
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
