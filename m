Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A01F82F8
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:31:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 647A5420415;
	Sat, 13 Jun 2020 12:31:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69680420440
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:53 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id l26so10041000wme.3
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=bnsaMm5xHsmGTKM8crY5633RBfnrE452zASAiUrFU6c=;
	b=QL9Y/XuYnnKaamaQ7E40DEu2mDrzLITXJjTv0iu9uj9TGOW/lpGmz55ZAEca7+6TtS
	4GvNHYCOjJ8PoSsc5VaEhXWvAv0ivSfsKAWU1dWe19wjirTcAFePPuP4kcxJc/1nKmxk
	OvntWmzfeZvdKKI7sPxS50k43S6bdGo0UHZl3ti+FPqKBEBMgQ23rX+W+cvXArYxqKj8
	JS66fVDwc+gThOz4IvtxgyO5UuoJVLZTwML+NttHdpmAeN/ZrH9x3WKfAnR9wdNnLdPh
	Y3P4HQgr0aAFhvxUld2YDSPjscWL2QJqTcz6DEO7gmLwiPqcOoWCXLLo987TUMA7m6vA
	8sFg==
X-Gm-Message-State: AOAM53380gCiRuonyA5N+wbtVJzUYR9zKHfZnQxO0OTvKCUq9WpxqIyX
	FBQKT1QEpqiYzPwHQ9byLgr5eAizrEfbtbG8
X-Google-Smtp-Source: ABdhPJwrJ7LG+6ctfjmOy0nmiysQcCWtA8qvazk1AplnAv3EaJH+Pn9BMSaOCGA1thw/Vzpbga3sGA==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr3352360wma.102.1592042392839; 
	Sat, 13 Jun 2020 02:59:52 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c12sm6135323wml.39.2020.06.13.02.59.52
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:52 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:50 +0200
Resent-Message-ID: <20200613095950.GU4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ABE014203B3
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 22:29:57 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id p21so3996442pgm.13
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bnsaMm5xHsmGTKM8crY5633RBfnrE452zASAiUrFU6c=;
	b=N9f0DBz11v8qKCu5VA9JXvurX/AQtTOXbiTH5jmNKefXzNsIFm+M7WPzmoaUlp4aH2
	r+jMi/YmukLuVqYctzsJtxcn0mVNYhMsSNT9VA6N7PnsQg5yUlK9mfLk/5/Ruh0U/Pwu
	PDPRxMt4IzbnxQDI/neSyUM1ytXRkW/vLuLZKE80o7Nj5PUF2JyDsoKL+PvQ95dTnNfZ
	KgrObLpuy2lSQ1b3DD2riryZUDl8/MGtuP3prwyWT2YzcrBoR4Z0ygA8w4IwkVOIQfT2
	XknAaA0BFuOmwbwTbgOy7UCAxJmRzkJu3RwBQHvX6d2dQvm2RBoWXIh1YpGHB5SsL5b+
	hRAg==
X-Received: by 2002:a63:f00d:: with SMTP id k13mr6286936pgh.263.1591302596138; 
	Thu, 04 Jun 2020 13:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-6-keescook@chromium.org>
	<CAKwvOdm5zDide5RuppY_jG=r46=UMdVJBrkBqD5x=dOMTG9cZg@mail.gmail.com>
	<202006041318.B0EA9059C7@keescook>
In-Reply-To: <202006041318.B0EA9059C7@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Jun 2020 13:29:44 -0700
Message-ID: <CAKwvOdk3Wc1gC0UMsFZsZqQ8n_bkPjNAJo5u3nfcyXcBaZCMHw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Saravana Kannan <saravanak@google.com>, linux-ide@vger.kernel.org,
	Network Development <netdev@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: Re: [Drbd-dev] [PATCH 05/10] ide: Remove uninitialized_var() usage
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

On Thu, Jun 4, 2020 at 1:20 PM Kees Cook <keescook@chromium.org> wrote:
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

Saravana showed me a cool trick for quickly finding commits that
removed a particular identifier that I find faster than `git blame` or
vim-fugitive for the purpose of Fixes tags:
$ git log -S <string> <file>
I've added it to our wiki:
https://github.com/ClangBuiltLinux/linux/wiki/Command-line-tips-and-tricks#for-finding-which-commit-may-have-removed-a-string-try.
I should update the first tip; what was your suggestion for
constraining the search to the current remote?
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
