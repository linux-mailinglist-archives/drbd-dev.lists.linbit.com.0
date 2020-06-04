Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 780121EEBB7
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 22:18:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 417FB4203DE;
	Thu,  4 Jun 2020 22:18:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C830A420302
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 22:18:34 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id h185so3794113pfg.2
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=KSgduwKhAGu1Me5hdrsNlT/LSTVts5IMrrdQbnnmgtM=;
	b=iwsRqxQEY+LpPM+s+DR5Kt1prnKy4GHGxqj/QUqqkkqSMBCDJe1CHdT/yKZJkiBDXL
	Y6szw+en5NZ6khTYpwS0FGviJsYX/r26zXRpTi2oURHUxJskaDdTNYF20YKqgU+50wUG
	aJZ2WjX85SJKBXLpicthf/oXnlRh2W1BmzGAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KSgduwKhAGu1Me5hdrsNlT/LSTVts5IMrrdQbnnmgtM=;
	b=hmMEBV2hq+GWIDuvQSA+HGxEad0sJHfOcRGaqlADvW2gDW3i0mgHFRbFc0rTspnRVi
	w8MiDO0eaWaXH1Ran3iqkSMut3DywpKnqOy75zyOe6JJ5GHBq4MOoF7URqgnEFNoiLlG
	ihdLwmp73uPGfXBgqcgomOhSM9S8kpk17NM+7H+OIGOdfnQ1iLdY5Jp2lqsusOaP6HeX
	HL//GQ6eR8lORs2d3j+/M61G0Eq5GHmRQUdVdsh1upMJzEAblzq4hVTGcy1/9dg859b1
	aGNCGgm9Al0A/FhktF13Jd9l0AMDqCemRq9RH4JfKudlCWhO6YPf9mBZu5GNmHQDNXRn
	VFJw==
X-Gm-Message-State: AOAM5317wPiFrTwFXZ/W/vCfvK06x1e20Tnzl9HFMDBvNDVOA3xbIANr
	64y/zJMWogxA185ZtPstowPKIw==
X-Google-Smtp-Source: ABdhPJy6jmo6NLjATFT9PEAZE69aJp2ake2/5E+UKA7LNV6vmFPBoWj+KBik/aUM7ISRTcCYuBBaWw==
X-Received: by 2002:a63:c58:: with SMTP id 24mr6232804pgm.246.1591301913875;
	Thu, 04 Jun 2020 13:18:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id r5sm5581320pji.20.2020.06.04.13.18.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 13:18:33 -0700 (PDT)
Date: Thu, 4 Jun 2020 13:18:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <202006041316.A15D952@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-4-keescook@chromium.org>
	<CAKwvOdnNuFySqAMk7s_cXqFM=dPX4JfvqNVLCuj90Gn4tzciAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnNuFySqAMk7s_cXqFM=dPX4JfvqNVLCuj90Gn4tzciAw@mail.gmail.com>
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

On Thu, Jun 04, 2020 at 01:08:44PM -0700, Nick Desaulniers wrote:
> On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > "unused variable"). If the compiler thinks it is uninitialized, either
> > simply initialize the variable or make compiler changes. As a precursor
> > to removing[2] this[3] macro[4], just initialize this variable to NULL,
> > and make the (unreachable!) code do a conditional test.
> >
> > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/net/wireless/broadcom/b43/phy_n.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
> > index d3c001fa8eb4..88cdcea10d61 100644
> > --- a/drivers/net/wireless/broadcom/b43/phy_n.c
> > +++ b/drivers/net/wireless/broadcom/b43/phy_n.c
> > @@ -4222,7 +4222,7 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
> 
> The TODOs and `#if 0` in this function are concerning.  It looks like
> `rf_pwr_offset_table` is only used when `phy->rev` is >=7 && < 19.
> 
> Further, the loop has a case for `phy->rev >= 19` but we would have
> returned earlier if that was the case.

Yeah, that's why I put the "(unreachable!)" note in the commit log. ;)

> 
> >         u32 rfpwr_offset;
> >         u8 pga_gain, pad_gain;
> >         int i;
> > -       const s16 *uninitialized_var(rf_pwr_offset_table);
> > +       const s16 *rf_pwr_offset_table = NULL;
> >
> >         table = b43_nphy_get_tx_gain_table(dev);
> >         if (!table)
> > @@ -4256,9 +4256,13 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
> >                         pga_gain = (table[i] >> 24) & 0xf;
> >                         pad_gain = (table[i] >> 19) & 0x1f;
> >                         if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
> > -                               rfpwr_offset = rf_pwr_offset_table[pad_gain];
> > +                               rfpwr_offset = rf_pwr_offset_table
> > +                                               ? rf_pwr_offset_table[pad_gain]
> > +                                               : 0;
> >                         else
> > -                               rfpwr_offset = rf_pwr_offset_table[pga_gain];
> > +                               rfpwr_offset = rf_pwr_offset_table
> > +                                               ? rf_pwr_offset_table[pga_gain]
> > +                                               : 0;
> 
> 
> The code is trying to check `phy->rev >= 7 && phy->rev < 19` once
> before the loop, then set `rf_pwr_offset_table`, so having another
> conditional on `rf_pwr_offset_table` in the loop is unnecessary. I'm
> ok with initializing it to `NULL`, but I'm not sure the conditional
> check is necessary.  Do you get a compiler warning otherwise?

I mean, sort of the best thing to do is just remove nearly everything
here since it's actually unreachable. But it is commented as "when
supported ..." etc, so I figured I'd leave it. As part of that I didn't
want to leave any chance of a NULL deref, so I added the explicit tests
just for robustness.

*shrug*

-Kees

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
