Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D73961F82F2
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:29:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C0033420402;
	Sat, 13 Jun 2020 12:29:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28EC542043F
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:42 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id x14so12298791wrp.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=AFF1riO+rvi+JtGxWF5qzVLPXHH0Nzh8aZcDxBuji4s=;
	b=lwhJLPha9VN4X79OqL3uAMCr6ONccbmClZFEL244zlczmReLJ/b6R6PSQfpLQqre8q
	l43i51mmHxkrFUyKARAHVuXYaUDMEBvkwueYEa+vKkBak34O8N7CopnWDpeUC2cMb+rK
	4bIrI5px1YXp1Mbm2rk8LRM0m/obmCTxMpXhoMmAY6LUMBIBO3GqQyWy3p7hou/lNTrs
	EXAcZfdnDURCCMESGQCUqlHiYec/8YF124qFWDnjMffLLBklBAHKlM1n9GKDMiQ+4HJZ
	TiCl2bSUCniW0vqb9SoGIgt97aJBIGOHQURk191JwNddHgAyRc7vrmdGs9iG0QTXk+7a
	pT+w==
X-Gm-Message-State: AOAM533ATDtoiTZPLxtKf4+z/pmCIZ997dCZZY7IVLWPlMt4dMJNkmxq
	z2pQYG4zZoqCSah0ClNQfppxA2DbUoffWMwy
X-Google-Smtp-Source: ABdhPJzP1wEsIKHqfUWrRqUQ4G56ghaO6vFd49mScgvC1INf5zLMw0OeFmPtbOjLqrkoGBPqVxi+Ew==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr20662233wrt.56.1592042381506; 
	Sat, 13 Jun 2020 02:59:41 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c16sm12602934wml.45.2020.06.13.02.59.40
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:41 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:39 +0200
Resent-Message-ID: <20200613095939.GR4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A004B420302
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 22:08:57 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id o6so4035480pgh.2
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 13:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AFF1riO+rvi+JtGxWF5qzVLPXHH0Nzh8aZcDxBuji4s=;
	b=M0mkpsLd7B3310QKl3SLGg22ik2mXjNx5FY1vzJopMffJnCw8jRcmo9fV9LTIHikFp
	RUv7WnBJ6K5VaUslDx62awUaItJ+YKUKSU3/LS3bQT0QPBOUmH8h7pgLYyxlBLfTzZPU
	CwkTICvo+M0GUh+egz/pFlCv8tR424B81CNZ9aQO8/k4dMiV20ohQx7N7YX7tjfxxqqp
	JKfbJIsE+MYGNYLFN8gpzmr0Avp6j5x4qED0RF7A5OiE4WLh5w8/DvLwZz8GAkmSlO6c
	QbXytbk3xKeeMX1S4Xa0zICtEJbZ60RM6KlvqWwsKz3NAMy2eeUR9b8nqFf/OpAnG9F0
	SQHw==
X-Received: by 2002:a63:5644:: with SMTP id g4mr5811569pgm.381.1591301336363; 
	Thu, 04 Jun 2020 13:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-4-keescook@chromium.org>
In-Reply-To: <20200603233203.1695403-4-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Jun 2020 13:08:44 -0700
Message-ID: <CAKwvOdnNuFySqAMk7s_cXqFM=dPX4JfvqNVLCuj90Gn4tzciAw@mail.gmail.com>
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

On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
>
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings (e.g.
> "unused variable"). If the compiler thinks it is uninitialized, either
> simply initialize the variable or make compiler changes. As a precursor
> to removing[2] this[3] macro[4], just initialize this variable to NULL,
> and make the (unreachable!) code do a conditional test.
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/wireless/broadcom/b43/phy_n.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
> index d3c001fa8eb4..88cdcea10d61 100644
> --- a/drivers/net/wireless/broadcom/b43/phy_n.c
> +++ b/drivers/net/wireless/broadcom/b43/phy_n.c
> @@ -4222,7 +4222,7 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)

The TODOs and `#if 0` in this function are concerning.  It looks like
`rf_pwr_offset_table` is only used when `phy->rev` is >=7 && < 19.

Further, the loop has a case for `phy->rev >= 19` but we would have
returned earlier if that was the case.

>         u32 rfpwr_offset;
>         u8 pga_gain, pad_gain;
>         int i;
> -       const s16 *uninitialized_var(rf_pwr_offset_table);
> +       const s16 *rf_pwr_offset_table = NULL;
>
>         table = b43_nphy_get_tx_gain_table(dev);
>         if (!table)
> @@ -4256,9 +4256,13 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
>                         pga_gain = (table[i] >> 24) & 0xf;
>                         pad_gain = (table[i] >> 19) & 0x1f;
>                         if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
> -                               rfpwr_offset = rf_pwr_offset_table[pad_gain];
> +                               rfpwr_offset = rf_pwr_offset_table
> +                                               ? rf_pwr_offset_table[pad_gain]
> +                                               : 0;
>                         else
> -                               rfpwr_offset = rf_pwr_offset_table[pga_gain];
> +                               rfpwr_offset = rf_pwr_offset_table
> +                                               ? rf_pwr_offset_table[pga_gain]
> +                                               : 0;


The code is trying to check `phy->rev >= 7 && phy->rev < 19` once
before the loop, then set `rf_pwr_offset_table`, so having another
conditional on `rf_pwr_offset_table` in the loop is unnecessary. I'm
ok with initializing it to `NULL`, but I'm not sure the conditional
check is necessary.  Do you get a compiler warning otherwise?

>                 } else {
>                         pga_gain = (table[i] >> 24) & 0xF;
>                         if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200603233203.1695403-4-keescook%40chromium.org.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
