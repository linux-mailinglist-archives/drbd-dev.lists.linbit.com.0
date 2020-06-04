Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BC1EE720
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 16:59:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79BE04203E3;
	Thu,  4 Jun 2020 16:59:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 070F24203B3
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 16:59:47 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id d10so3580005pgn.4
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=xZR3lWkoYpLFg4eE+Etif6ukCUL5ApBdi/GoHnvWaEk=;
	b=TupHTdygAigywhS3pB8tAlBUKta4lXvoAYH4dzNzhrASd2l3DGn01fOXPA/fx+ddwx
	e63Z0EnMX9EmBApvSxhudimZg0Kyu1Ran7gh+CyYHPG3fZ0CjgSq6NhbXpLphCrF+Ouq
	t2GxHonz+RRUwsB+KYTkj8rNjo2/BKZIMEe8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=xZR3lWkoYpLFg4eE+Etif6ukCUL5ApBdi/GoHnvWaEk=;
	b=Hc+2hiScQxi0eSa7AG3hMnk89WdgZgfpNoNTZSimFAWm7v/hCzVa3i+koe7ikA5mBt
	9Kbfvd1tfOCjUGEhkiPhmDiW8QL1ihsP+JQt6vZNIreOZaVjRVDv7PIRgrLPa0NZvDXt
	9Yx3osFOUCLzpcprHYj3Aq18VHwLT7U16OQsi5ba5VCSycBLMypzRmCtMlcxCZi2yCO2
	Ju12MPpGlzGxtBxWe/u0oSTZwMmzbiUlWe1w+/2F7l79Vs2GWLVUcTQxxR82Tq8YmEne
	3b9U2fmcaHjdruUI2dOMo7tOgdf81CBtuaXP2Ye9QG5u8p7KOwrv4aCo1IFOR0YgkZkW
	Gu/w==
X-Gm-Message-State: AOAM531LBJbYQoP/APYm0KjCOQj6za+cFqka4kOjmdaXFpb5u2jkEQIS
	899VGvRAmZd8SyxDqAY4NEAapQ==
X-Google-Smtp-Source: ABdhPJwvM5Okdp4t/lqPdqt9FJOxz3H8PoeKTiCxL62lJBkvY0bVXGWNEvmo0e7yAT0Y8leJzLPW1g==
X-Received: by 2002:a63:d544:: with SMTP id v4mr4979382pgi.60.1591282782325;
	Thu, 04 Jun 2020 07:59:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	w65sm4752697pfb.160.2020.06.04.07.59.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 07:59:41 -0700 (PDT)
Date: Thu, 4 Jun 2020 07:59:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <202006040757.0DFC3F28E@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-10-keescook@chromium.org>
	<20200604132306.GO6578@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604132306.GO6578@ziepe.ca>
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
Subject: Re: [Drbd-dev] [PATCH 09/10] treewide: Remove uninitialized_var()
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

On Thu, Jun 04, 2020 at 10:23:06AM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 03, 2020 at 04:32:02PM -0700, Kees Cook wrote:
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings
> > (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> > either simply initialize the variable or make compiler changes.
> > 
> > I preparation for removing[2] the[3] macro[4], remove all remaining
> > needless uses with the following script:
> > 
> > git grep '\buninitialized_var\b' | cut -d: -f1 | sort -u | \
> > 	xargs perl -pi -e \
> > 		's/\buninitialized_var\(([^\)]+)\)/\1/g;
> > 		 s:\s*/\* (GCC be quiet|to make compiler happy) \*/$::g;'
> > 
> > drivers/video/fbdev/riva/riva_hw.c was manually tweaked to avoid
> > pathological white-space.
> > 
> > No outstanding warnings were found building allmodconfig with GCC 9.3.0
> > for x86_64, i386, arm64, arm, powerpc, powerpc64le, s390x, mips, sparc64,
> > alpha, and m68k.
> 
> At least in the infiniband part I'm confident that old gcc versions
> will print warnings after this patch.
> 
> As the warnings are wrong, do we care? Should old gcc maybe just -Wno-
> the warning?

I *think* a lot of those are from -Wmaybe-uninitialized, but Linus just
turned that off unconditionally in v5.7:
78a5255ffb6a ("Stop the ad-hoc games with -Wno-maybe-initialized")

I'll try to double-check with some older gcc versions. My compiler
collection is mostly single-axis: lots of arches, not lots of versions. ;)

> Otherwise the IB bits look ok to me
> 
> Acked-by: Jason Gunthorpe <jgg@mellanox.com>

Thanks!

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
