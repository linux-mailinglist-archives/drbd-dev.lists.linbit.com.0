Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFC204265
	for <lists+drbd-dev@lfdr.de>; Mon, 22 Jun 2020 23:04:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 845394203DB;
	Mon, 22 Jun 2020 23:04:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B86D42032B
	for <drbd-dev@lists.linbit.com>; Mon, 22 Jun 2020 23:04:06 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id k1so8116291pls.2
	for <drbd-dev@lists.linbit.com>; Mon, 22 Jun 2020 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=XaQAHgI/fJz5n4PH9+AAQxpUaFNfDOAFJjIvvuWc6mg=;
	b=ILThu+fBeQLbDkY3Saa7Zr6fXvZla6p/mhaacfaAod5Ou2LCXGVY9rmI/SQ12/gRGw
	0OyvuZwHPdhHMhqZNfaygaAuqkjJxQw9ecwhpY877rYeLJOYo7K1LFnWVKMlDLVDvRVU
	aO7im+xhoBSS7Rfzh9EnHnbqHF0AGGKdOIZCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=XaQAHgI/fJz5n4PH9+AAQxpUaFNfDOAFJjIvvuWc6mg=;
	b=B7zx6w1xpb+eCzp7F7bOobUc4T0s4Y89beghIiuy0SM9q1hueJD2fQgIFwGQMXpkDn
	I33Li3YErXWJ0Edin/aE3VQ3qUER8nPEx1Wp49jeb06jKFdf66Bufe2xhjIMdBZuyLYI
	Q6c4wkGbx0px32bEd22e+R5GQqpv6w3igf3vq7/Z2TrXd10Yy0LLFLg78tmA+mklO0fU
	7eio9Mh/FW2/RwdhtCzfE3+Fi0FF7pYS+/aPmZGeTLmz4Gp+xCUYhfPT/4RWaCjS/GeD
	gWWeCPM335SUzmlcmhpRXBeVbD1DHtjqB7T1cUOWs2Y63ls8RSq4ireUUaUmi/VITZor
	TgOQ==
X-Gm-Message-State: AOAM530RoewU4/sDphZa/ZNPrqLiJJXx2BrdUxpjaCSVAeeq+hwr2G+6
	toQygsTU/1kAt91yyN+FQrXtIQ==
X-Google-Smtp-Source: ABdhPJxa2RKG+txMKUm/MEMBUFpa2Kv9XKoAQ0+Lw2FAoqT0JOWKLV1rtyBoAVQcAiWWStDNJ+p+nQ==
X-Received: by 2002:a17:902:b942:: with SMTP id
	h2mr20581705pls.163.1592859846012; 
	Mon, 22 Jun 2020 14:04:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id d2sm10586968pfc.1.2020.06.22.14.04.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 22 Jun 2020 14:04:05 -0700 (PDT)
Date: Mon, 22 Jun 2020 14:04:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <202006221403.EEAD37E94B@keescook>
References: <20200620033007.1444705-1-keescook@chromium.org>
	<20200620033007.1444705-5-keescook@chromium.org>
	<CAKwvOdmsXuqx-3Rt_KNFq4psAeFjG2-7qQaqkJ7dDqqmscUFNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdmsXuqx-3Rt_KNFq4psAeFjG2-7qQaqkJ7dDqqmscUFNw@mail.gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 04/16] b43: Remove uninitialized_var()
	usage
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

On Mon, Jun 22, 2020 at 10:04:18AM -0700, Nick Desaulniers wrote:
> On Fri, Jun 19, 2020 at 8:30 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > "unused variable"). If the compiler thinks it is uninitialized, either
> > simply initialize the variable or make compiler changes. As a precursor
> > to removing[2] this[3] macro[4], just initialize this variable to NULL.
> > No later NULL deref is possible due to the early returns outside of the
> > (phy->rev >= 7 && phy->rev < 19) case, which explicitly tests for NULL.
> >
> > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> >
> > Fixes: 58619b14d106 ("b43: move under broadcom vendor directory")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> I see three total uses of uninitialized_var() in this file, do we want
> to eliminate all of them?

This is the only one that needed an explicit initialization -- all the
others are handled in the treewide patch. I *could* split it out here,
but I found it easier to keep the "no op" changes together in the
treewide patch.

-Kees

> 
> > ---
> >  drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
> > index c33b4235839d..46db91846007 100644
> > --- a/drivers/net/wireless/broadcom/b43/phy_n.c
> > +++ b/drivers/net/wireless/broadcom/b43/phy_n.c
> > @@ -4222,7 +4222,7 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
> >         u32 rfpwr_offset;
> >         u8 pga_gain, pad_gain;
> >         int i;
> > -       const s16 *uninitialized_var(rf_pwr_offset_table);
> > +       const s16 *rf_pwr_offset_table = NULL;
> >
> >         table = b43_nphy_get_tx_gain_table(dev);
> >         if (!table)
> > --
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
