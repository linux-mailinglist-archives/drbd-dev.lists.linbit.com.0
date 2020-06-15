Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163B1FA051
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Jun 2020 21:32:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 729EE4203EC;
	Mon, 15 Jun 2020 21:32:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 90A0C4203E7
	for <drbd-dev@lists.linbit.com>; Mon, 15 Jun 2020 21:32:52 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id j4so3957263plk.3
	for <drbd-dev@lists.linbit.com>; Mon, 15 Jun 2020 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=ZjAXfZy5BudfnO86h+8mAf1S7F89/y7Ht34uQW17/+U=;
	b=QBeg3rvb86U6Tj0IyJR5u6BBRDaGksrhbixbVGEFMNAmYYAm2vi8ezn7Pzjsx+8Y/N
	0spIQQjXlTeZa6JYxyI0WQLYZewE/IOrv1eu80kZOYOGkcIsaJYdoUbYKY8F56IoVrW7
	todjyiaALbdigpVH6qkq1a3bhohRwm98ntcpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ZjAXfZy5BudfnO86h+8mAf1S7F89/y7Ht34uQW17/+U=;
	b=RiG4y7yvYuJ/QjXx8n2rK/E5F2HB724XbeaR/gECasw2cyxAL7rj5+PldN+YYXEbdm
	AtyKek1KLSowSh1oSo9Wf6G6Ble0V3skCtXU9P37K0S2MXE6NEL5OoQgaTNOgoh8iSrA
	zSsmqVQAhgl0Dia7MLJpE6iRqomvND+RuZNWRiyy/6yMhVVv5KjeSM9KtRfG0w2C8NIB
	OhQEeDWlbQdaerY59CSSXHe+KE04BkxYqU24P++1eHxGN1B/luec0aJ4fWODoP65RDfA
	ALVF1P8EnZL6IJ1PXfqZ892vR9Ku0DqzyspwDT/EJL1AxcOz9ufbTbtv0aZCGlDMuIHW
	LAOg==
X-Gm-Message-State: AOAM532WJDkKOQAwAfGACsvpTw1iOjlHOWfEjzX77puHQWRxey+b3pz/
	4oR6UUMxKqgKDy1SveJVIpP44g==
X-Google-Smtp-Source: ABdhPJxugszkh+55zcQ6ID8nCD+Y2mp2lHGMEtD9VsXD4kV92TrXKjIOZPR9BYw/ID9xL1GXxiQnCg==
X-Received: by 2002:a17:90b:23d2:: with SMTP id
	md18mr774459pjb.179.1592249571413; 
	Mon, 15 Jun 2020 12:32:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	n189sm14973604pfn.108.2020.06.15.12.32.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 15 Jun 2020 12:32:50 -0700 (PDT)
Date: Mon, 15 Jun 2020 12:32:49 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <202006151231.74D2315450@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-6-keescook@chromium.org>
	<CAKwvOdm5zDide5RuppY_jG=r46=UMdVJBrkBqD5x=dOMTG9cZg@mail.gmail.com>
	<202006041318.B0EA9059C7@keescook>
	<CAKwvOdk3Wc1gC0UMsFZsZqQ8n_bkPjNAJo5u3nfcyXcBaZCMHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdk3Wc1gC0UMsFZsZqQ8n_bkPjNAJo5u3nfcyXcBaZCMHw@mail.gmail.com>
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

On Thu, Jun 04, 2020 at 01:29:44PM -0700, Nick Desaulniers wrote:
> On Thu, Jun 4, 2020 at 1:20 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Jun 04, 2020 at 12:29:17PM -0700, Nick Desaulniers wrote:
> > > On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > > > "unused variable"). If the compiler thinks it is uninitialized, either
> > > > simply initialize the variable or make compiler changes. As a precursor
> > > > to removing[2] this[3] macro[4], just remove this variable since it was
> > > > actually unused:
> > > >
> > > > drivers/ide/ide-taskfile.c:232:34: warning: unused variable 'flags' [-Wunused-variable]
> > > >         unsigned long uninitialized_var(flags);
> > > >                                         ^
> > > >
> > > > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > > > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > > > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > > > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> > > >
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > >
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > Thanks for the reviews!
> >
> > > Fixes ce1e518190ea ("ide: don't disable interrupts during kmap_atomic()")
> >
> > I originally avoided adding Fixes tags because I didn't want these
> > changes backported into a -stable without -Wmaybe-uninitialized
> > disabled, but in these cases (variable removal), that actually does make
> > sense. Thanks!
> 
> Saravana showed me a cool trick for quickly finding commits that
> removed a particular identifier that I find faster than `git blame` or
> vim-fugitive for the purpose of Fixes tags:
> $ git log -S <string> <file>

Ah yes, I always have to look up "-S". Good reminder!

> I've added it to our wiki:
> https://github.com/ClangBuiltLinux/linux/wiki/Command-line-tips-and-tricks#for-finding-which-commit-may-have-removed-a-string-try.
> I should update the first tip; what was your suggestion for
> constraining the search to the current remote?

Ah cool. I've updated it now. It was really to narrow to a "known set of
tags", and Linus's tree's tags always start with "v".

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
