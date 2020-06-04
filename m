Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BBD1EDA98
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 03:44:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CBE634203E4;
	Thu,  4 Jun 2020 03:44:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 86AEF420325
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 03:44:42 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id z64so2634040pfb.1
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=Wpybr1+0oFA6UqMQJBfZL+PEEh3VzZMl9GH1YHu1354=;
	b=AbKWjJtgEgSZdlRzZpINmLHh+V8xJj2UZ2odKQ2c5ZSQmdk1BLZaB0K4agCmc9jSmi
	AAmX5SqtRhMCVwb4wbdCeXmP+MI0pU+26rg/PWtbK/suB70n8LKxY+RL9wU3Qn6Y4nm2
	zGn/UOyM2NglkPBkMHcXSP1vQ8Fpyy930e1GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Wpybr1+0oFA6UqMQJBfZL+PEEh3VzZMl9GH1YHu1354=;
	b=EoWNPqPVX97WUNJpQUKoOfHc8yc5lW7iN8CK8sZIP/e1iOVzBLulZGFpFYn1HpVH3s
	jYokdZUkzrR/X2pgwEIpHRK4/IFvqQT4l+tG8RHhMcq7K/0VsNwkXUtiuS0ENx0JmB+v
	a74/1tudxwJdEgzWgMWSy05X9lizT+9g/946ijDj7C4LRCFbTlQkVz7HVshgeOrRUYD/
	EpGkY3JVzxev6fVR2mT0LuUAPrabkPyXfDev80yzUJNL8NOM+iysPJdCo35NKEysG2QJ
	d55haoIksb0JHuJ8fsIqK2bCzxHFa/50O6IGr2PDh8GfX5FZIufi6y1ZhAW+NTE0NNUK
	VJ2g==
X-Gm-Message-State: AOAM530emUbYCiAU5i6Y7F70wqlBcF0oNKqcig5sSsRqoGNv99x7kvUJ
	LStlqRfQc6V/t3Lwz0DP2YnOHw==
X-Google-Smtp-Source: ABdhPJw6n1UeZs2KwVXXpsKVlKB/eX8l0Vu/Wi69L010BRhnAwssMdnRSJ//zeA4lceo/p+HCVbgnA==
X-Received: by 2002:a63:5f90:: with SMTP id t138mr2082803pgb.122.1591235081380;
	Wed, 03 Jun 2020 18:44:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	i21sm2541029pgn.20.2020.06.03.18.44.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 18:44:40 -0700 (PDT)
Date: Wed, 3 Jun 2020 18:44:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Message-ID: <202006031840.E2F0D15D8B@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<CA+icZUVZwjM9o7aNXAkYu8K2BQAajw=60varP4g+NizCqu5gRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+icZUVZwjM9o7aNXAkYu8K2BQAajw=60varP4g+NizCqu5gRw@mail.gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>,
	Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
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

On Thu, Jun 04, 2020 at 03:23:28AM +0200, Sedat Dilek wrote:
> what is the base for your patchset?

Hi! This was actually on Linus's latest tree (which is basically -next),
mostly because I figured this might be a bit of an RFC but if it was
clean enough, it might actually make the merge window (I can dream).

> I would like to test on top of Linux v5.7.
> 
> Can you place the series in your Git tree for easy fetching, please?

Sure! https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git in
the kspp/uninit/v5.7/macro branch. There were three small differences.
I'm doing the "all my cross compilers allmodconfig" build run now, but
figured I'd push it for you now so you didn't have to wait.

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
