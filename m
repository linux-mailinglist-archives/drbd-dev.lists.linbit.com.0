Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D831F82E8
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:25:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF71B420403;
	Sat, 13 Jun 2020 12:25:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0698B420435
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:15 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id t18so12297422wru.6
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=R0o4OOvzJQjARhQ6/49UmmkOyadJDn2uKBj3nrOAqQo=;
	b=QLDAT565seapTBEv8LeSMLSb0JHmXUTjZ2tIDrtcdPDUdnjtbWhSFyG+WLsGmhl32I
	fxqiUbxz0BXOWqcPrIZvw9haAkV77o10vZrpiMMR8deDfsbm2Q3HZ7+XsvFbvVENyX2o
	PkaPH4UMmxlB1ikTRJFU1cNSc8LW474Qvr9VCStFTlJst8qSDd5rbI7n75/M7nXmIXMj
	7y5D+fgVaKY8CDqYV2jchG4+M6jlW6jV1Yx6trcvOTMLxBKVQ7nuZ1oiLRaps62x59lS
	ZU6n4ShitK5z00uQ7lIoReFLyDZyP0F1bqtCSViUbnLAkuhL1vvd5Z9ymvOjzL2Zxsrq
	W7GA==
X-Gm-Message-State: AOAM532ly0CL+ZF4AHO7aUafd8TV3cum6pJ/dPvH8N0YWT4eaKOCkL3S
	C1PJ3NknsSw38IpTONIBY92ohzc+XaDKaANw
X-Google-Smtp-Source: ABdhPJz3rxioZpghcs5W2I1P95Q0xSwzxz0HN450URB8Ehp6W+2upMN5F0LnXbtArsi4uBZDfbWFxg==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr19699390wrs.67.1592042354504; 
	Sat, 13 Jun 2020 02:59:14 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	s18sm16821666wra.85.2020.06.13.02.59.13
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:14 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:12 +0200
Resent-Message-ID: <20200613095912.GJ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4B6B420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 13:41:19 +0200 (CEST)
Received: by mail-lj1-f195.google.com with SMTP id z18so6797526lji.12
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R0o4OOvzJQjARhQ6/49UmmkOyadJDn2uKBj3nrOAqQo=;
	b=uOadSoLGhaseNrsSLG0CEfcx1B7ZyXtznA1jW/71TjOkJaQ3v7NhDn32mtbkkPd0Q+
	1UDuNRM26ag+jysBJHImSQ2kyqAxp6Pbe8OVsuK3/X6E6BLOFRucdGoxisc/QkPMQfn9
	DSP221R/DYOdjftqL2dmeYiibVPWWApyDr996ybowslc4DnYfcHTAWJ50hppvye4onSW
	Wki6t+mbrF7ejKkqVkq6hFcUNg4F2aeKBWSYX0y86zDfF0gdQIlIFvOHHUjNdXP4a7ct
	pto6mvk/UvVFDpzwyBErLblgdgk4M9JUrlkGy+vs2gLKfjfB2m/WaWMIrcXH9QqP6urW
	FvAw==
X-Received: by 2002:a05:651c:11c7:: with SMTP id
	z7mr2085283ljo.29.1591270878905; 
	Thu, 04 Jun 2020 04:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-2-keescook@chromium.org>
	<874krr8dps.fsf@nanos.tec.linutronix.de>
In-Reply-To: <874krr8dps.fsf@nanos.tec.linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2020 13:41:07 +0200
Message-ID: <CANiq72kLqvriYmMkdD3yU+xJwbn-68Eiu-fTNtC+Lb+1ZRM75g@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Kees Cook <keescook@chromium.org>, linux-ide@vger.kernel.org,
	Network Development <netdev@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>, Linux-MM <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>, b43-dev@lists.infradead.org,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/10] x86/mm/numa: Remove
	uninitialized_var() usage
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

On Thu, Jun 4, 2020 at 9:58 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> but if we ever lose the 1 then the above will silently compile the code
> within the IS_ENABLED() section out.

Yeah, I believe `IS_ENABLED()` is only meant for Kconfig symbols, not
macro defs in general. A better option would be `__is_defined()` which
works for defined-to-nothing too.

Cheers,
Miguel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
