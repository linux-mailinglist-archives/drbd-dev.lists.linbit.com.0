Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 006FD1F82E0
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:23:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB259420404;
	Sat, 13 Jun 2020 12:23:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 80642420430
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:02 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id u26so10571570wmn.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=MtysUER1l5a/zqtCZtWbYXE2kDcmWMdAVlNOZNySUKQ=;
	b=Qvc4sk5PQTH3A/ceV5KxPUbnK2gqwEcSKzdtZu5w2dCdsFuMK6vzNNa30rH1vQXTw4
	PdSjG0fbYBf7impbLtmsdIsBkG5W1VPDj39bP4z1IboTPe0JU4w30N27JJgYh/VqqQ9F
	YVGaZUerkl2gmw2qWEKyt7IjaMjg7+dV1wC/yAEVit9hSphKqtQxqbmk0+7C6hNo5+ak
	g/4LKi1Fc562dsXL28nmF/49N7Q/lwn3Z819ECkifPGd9fGl1ylXPn5VgTXZgvszBJ44
	JWWGjz0qfg3IcLGmmA1Gtv6PG3BH2ILcw+1rPfb7VyX04cajYgFoCvwgAkA9dd3/3nNK
	Cxuw==
X-Gm-Message-State: AOAM532ZbgZT8ql93Wji4CyCozlpYokQ7aQkJz3aBkWWvkFPJ/7J2Tq9
	yzDjIiicbFt8CDIPPxsleBHLg/2Bg0WrLODd
X-Google-Smtp-Source: ABdhPJx618OdspcnvyuyTSkTxf1Ij+kAd09OyRhhymA9lr3JP5sG1pRrdhtfgqQ0b8TgIBf2soELiw==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr3289385wmf.4.1592042341939; 
	Sat, 13 Jun 2020 02:59:01 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	b143sm5951264wme.20.2020.06.13.02.59.01
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:01 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:59 +0200
Resent-Message-ID: <20200613095859.GE4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BA9942030B
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 05:33:50 +0200 (CEST)
Received: by mail-ot1-f65.google.com with SMTP id g5so3680155otg.6
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 20:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=MtysUER1l5a/zqtCZtWbYXE2kDcmWMdAVlNOZNySUKQ=;
	b=hAU6iC7SzuADMG5Aos+RZHGnFaCQ8z6d36F+7W8dHx8UydKYHSdkcMT8w6CUcGNzag
	njj37uaHb1XsQkeNNgODWxw+JmIPSJFsiOzWaiRts6JwLN85uBohYPmIU0IknkNXqApb
	3XrfusUHfNL5s13uf3b2DyoPaSWSJxflMEAZNaYtnurxuCdr4w+7UzwHmt4ux1uoSJZY
	VRuPqpiBPltoh715g3N7dXpDuR406aK9rtLam9pcwGJmc9amafFSMtWft6BzB9EYs6D1
	9LU1A/I8cVMacSajcwltKX+v5EE6MYClw1IEQtopq+DleI/1RwWeGJEmC369juox9UBM
	UuWg==
X-Received: by 2002:a9d:7387:: with SMTP id j7mr2354350otk.157.1591241630021; 
	Wed, 03 Jun 2020 20:33:50 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:4111:8b00::3])
	by smtp.gmail.com with ESMTPSA id z13sm969120oom.3.2020.06.03.20.33.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 20:33:49 -0700 (PDT)
Date: Wed, 3 Jun 2020 20:33:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200604033347.GA3962068@ubuntu-n2-xlarge-x86>
References: <20200603233203.1695403-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603233203.1695403-1-keescook@chromium.org>
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
Subject: Re: [Drbd-dev] [PATCH 00/10] Remove uninitialized_var() macro
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

On Wed, Jun 03, 2020 at 04:31:53PM -0700, Kees Cook wrote:
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings
> (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> either simply initialize the variable or make compiler changes.
> 
> As recommended[2] by[3] Linus[4], remove the macro.
> 
> Most of the 300 uses don't cause any warnings on gcc 9.3.0, so they're in
> a single treewide commit in this series. A few others needed to actually
> get cleaned up, and I broke those out into individual patches.
> 
> -Kees
> 
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> Kees Cook (10):
>   x86/mm/numa: Remove uninitialized_var() usage
>   drbd: Remove uninitialized_var() usage
>   b43: Remove uninitialized_var() usage
>   rtlwifi: rtl8192cu: Remove uninitialized_var() usage
>   ide: Remove uninitialized_var() usage
>   clk: st: Remove uninitialized_var() usage
>   spi: davinci: Remove uninitialized_var() usage
>   checkpatch: Remove awareness of uninitialized_var() macro
>   treewide: Remove uninitialized_var() usage
>   compiler: Remove uninitialized_var() macro

I applied all of these on top of cb8e59cc8720 and ran a variety of
builds with clang for arm32, arm64, mips, powerpc, s390, and x86_64 [1]
and only saw one warning pop up (which was about a variable being
unused, commented on patch 9 about it). No warnings about uninitialized
variables came up; clang's -Wuninitialized was not impacted by
78a5255ffb6a ("Stop the ad-hoc games with -Wno-maybe-initialized") so it
should have caught anything egregious.

[1]: https://github.com/nathanchance/llvm-kernel-testing

For the series, consider it:

Tested-by: Nathan Chancellor <natechancellor@gmail.com> [build]
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
