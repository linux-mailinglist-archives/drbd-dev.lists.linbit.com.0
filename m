Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C021F1F82DB
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:20:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A80534203FD;
	Sat, 13 Jun 2020 12:20:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C5139420413
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:49 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id x14so12297422wrp.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=MPLZOT/4bCsndxaWJtW6FhRuUjguIqCFp5N2dwDtYQ8=;
	b=Ay6Wu50i5JOEBkZ2WfDq6EHrKBSAUZllUEMGeIjtRzBH/tl9RHZEA1dkvoOPd3F/CD
	ZuvtbrkgndeEwvydeYPAbItrVGC5sQatsmuRJMfCjxAz9TUtU6uRcvlCGs5wedAtUR6g
	KiCwHWAXzv0QEsVAtD/cNfrQPOS+fTHmhiPwzKvuqpcgDVXqFCc1W5UwXpiqoGvhFUxD
	9H+iN+kvkaUqZm0SkOc/G3LA1SwN3FdA8/xT17LIl2s8HzWZTf4RCHMIrdf7RVTzwQ6A
	cA2xcgjgAQ9+ZiCkyOW6G91HtN1xN+t/ijt+JqXmg+5iN2ZjiYGNg10HR4jEHedOtzR9
	skRA==
X-Gm-Message-State: AOAM533CJ/vIFo31efN5X8ZqSVt4P50oiWOCA2hjh0q+4nHCCr7DKGS+
	0o8FMiUw+TfxfswC3A+GYas/8ApERW1CY01j
X-Google-Smtp-Source: ABdhPJzQmS0vvB2LGO6gE7CnnJiFPxutrDyhX6qClz40otbFcKxgp7tEPSJg4dwmhlwLQ1OeZ/yXtw==
X-Received: by 2002:adf:e883:: with SMTP id d3mr18905426wrm.274.1592042329296; 
	Sat, 13 Jun 2020 02:58:49 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	k64sm12955727wmf.34.2020.06.13.02.58.48
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:48 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:47 +0200
Resent-Message-ID: <20200613095847.GZ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 65C1442030B
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 02:50:39 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id s1so5142125ljo.0
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MPLZOT/4bCsndxaWJtW6FhRuUjguIqCFp5N2dwDtYQ8=;
	b=jjo5yXOjBc6ExBZ0xU0p0U1vrAbDQBGzKMjBMieodOVuBzHGTF9DfthYYNAfEr4O8H
	rweetJbTqqdkWZQ2Mh+tJNCGkpf/fkl1rkUJQ8mQL3qjchZnqA0v3AMF1MBb2R/OeUUh
	DuErOylpGthQHIdGEr+3RVWllhk+DcvmzUIeBDjSdh5bWQzbscb+Y3ruNHUM8Dkq3sMo
	nn/nsSopZsp2D2DmmTBE1rVlfsSS3jD71ToiAPKVqzTq2U2pcrz+IKipSkRRITVVt4/Q
	y9VjEOyTc4mzSfqGsdsgNMIeHMEoqdZSRH5tVyANTF0vpIJUjGxVhNnyKfbEjw81HuWV
	wblw==
X-Received: by 2002:a05:651c:11c7:: with SMTP id
	z7mr899332ljo.29.1591231838573; 
	Wed, 03 Jun 2020 17:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-11-keescook@chromium.org>
In-Reply-To: <20200603233203.1695403-11-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2020 02:50:27 +0200
Message-ID: <CANiq72nJhZZ7Bc+VQpPrDjey0iD9TspbtodtGpKaZNz8NCaHww@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>, Linux-MM <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 10/10] compiler: Remove uninitialized_var()
	macro
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

Hi Kees,

On Thu, Jun 4, 2020 at 1:32 AM Kees Cook <keescook@chromium.org> wrote:
>
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings
> (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> either simply initialize the variable or make compiler changes.
>
> As recommended[2] by[3] Linus[4], remove the macro.
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

+1, one less trick split between `compiler*` files.

Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
