Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215F1F82F1
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:29:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6FACE4203F7;
	Sat, 13 Jun 2020 12:29:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8EC0342043E
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:39 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id u26so10572311wmn.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=JchjGYZl0wqUOrU5YQvGeZV5DROtdtYOgYQQhEiIskY=;
	b=a00xw2o8w58vlF9lAN5/ABVBmeXGeOrbzox4jV7gLeh2X5RjED47ES7sfSa4XrpZ3j
	tpe79OPubVqcHCgkycvJAG3CKs2Ys8BLVN9OmUFO7qReSHh2oxIRvabnmtBIERgvuLnz
	+vD1T3VIcnsbbOUfxj8smBHFmaWESgAIUVhd41Oi2tfjxi1cEiaI7Px9DKad7QQjKH+a
	tiDnaqZuH4k62+yhXoeugAee8BsA6VwL1n3PcjEeOGSEJ/nwyMeUOxLekStsvbC8KGFL
	xUB2bVjaDztQ4bXYh5utdcDHNwgfuNTkhgNSQYws2FdQMGPbnuaLmDzYZN3cRzYs3lVz
	fi5w==
X-Gm-Message-State: AOAM532PWrYzH3I4hc7BS+rv/8jG2TKo2B7jLKRu+NLMro3s0LqB/EqX
	0+oQnW5qVuCJeeAiXhMdafK/xsC9RyGs/ARZ
X-Google-Smtp-Source: ABdhPJx1gZrT/fKdPpspQlR5Gp5uuf81vTRda3ySK0/BdMV7wZe8eENdJ6Zt8LjzRur6N2yfLP9qCw==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr3475098wmt.154.1592042379017; 
	Sat, 13 Jun 2020 02:59:39 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	v66sm13709181wme.13.2020.06.13.02.59.38
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:38 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:36 +0200
Resent-Message-ID: <20200613095936.GQ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F1531420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 21:56:24 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id n23so3966621pgb.12
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JchjGYZl0wqUOrU5YQvGeZV5DROtdtYOgYQQhEiIskY=;
	b=qPGYj+Fa3kUn8rqUio1Dqo/wmmdxLTwJv3dkdlE3ClgOnCxbEa6OJED06WKQ9xZ/S5
	drxLk5d97vcv5eQ6d4d6pUs5J9MwW0FbQj4r4wLXcZG5wYgEinukAsqpd6SbNEpGTiIL
	ybbjkH30SzUTY9QY0bM3t5oBYgf/gdFtcqSjGZ4Vd93wXluzmD0tkk2N1s4+IczoK5T8
	73LFTDcT2N2adp5wR2Mlu3UFct0QurWe1qbINXwuT+3G9C5se3K/oYDgtwvOmb8nMB81
	9/qgL3YapcLXLfnBA8fVq9DtyGqYOQK0MGNYMtExoxZdmGcyOrFvw2budA/p7MR7MkMh
	dTFw==
X-Received: by 2002:a63:f00d:: with SMTP id k13mr6167247pgh.263.1591300583418; 
	Thu, 04 Jun 2020 12:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-3-keescook@chromium.org>
In-Reply-To: <20200603233203.1695403-3-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Jun 2020 12:56:11 -0700
Message-ID: <CAKwvOdmfOSGAZiuapXOaiU74AQVMDgimrnCiRDjzw4p4oh1vaw@mail.gmail.com>
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
Subject: Re: [Drbd-dev] [PATCH 02/10] drbd: Remove uninitialized_var() usage
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
> to removing[2] this[3] macro[4], just initialize this variable to NULL.
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Fixes: a29728463b25 ("drbd: Backport the "events2" command")

> ---
>  drivers/block/drbd/drbd_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
> index eeaa3b49b264..0067d328f0b5 100644
> --- a/drivers/block/drbd/drbd_state.c
> +++ b/drivers/block/drbd/drbd_state.c
> @@ -1604,7 +1604,7 @@ static void broadcast_state_change(struct drbd_state_change *state_change)
>         unsigned int n_device, n_connection, n_peer_device, n_peer_devices;
>         void (*last_func)(struct sk_buff *, unsigned int, void *,
>                           enum drbd_notification_type) = NULL;
> -       void *uninitialized_var(last_arg);
> +       void *last_arg = NULL;
>
>  #define HAS_CHANGED(state) ((state)[OLD] != (state)[NEW])
>  #define FINAL_STATE_CHANGE(type) \
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200603233203.1695403-3-keescook%40chromium.org.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
