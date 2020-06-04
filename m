Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E41EE6A1
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 16:27:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9DE7D4203DE;
	Thu,  4 Jun 2020 16:27:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C05F6420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 16:27:46 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id h95so1252690pje.4
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=ELp8NKpDU/b4oaZzGkEuk3yIxekW0FfVsfMh0kEq3DQ=;
	b=e7eITrZAAG4SVhaatsNGEFfKSAV4mgFFeMordqmQufFe6/vzeagmQ484X5shPhREQO
	NcIW+cQNizrMWNfglE0Jh5V6uWSzvceN4EXsYppzfKNVQcK2K6MGcm3eAbNC9iODqDY1
	7i/uriuA9VGz8WZ62VSr78LapWZNk/5N3ydBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ELp8NKpDU/b4oaZzGkEuk3yIxekW0FfVsfMh0kEq3DQ=;
	b=jHPO50Mm60vjLIssaSi9dRhVrZJk4uWAxww6nhfSMzx9LISkDmIPW8j3n8QEiHIm0X
	NuVOUZJuyMO8bFUDOsk+w82wB5lhoHaN5uuN0R6Q9A2NVjfl7b6k/SC1kM0V59t9cINj
	pQw0N+n2a4x7/J7PoYt/Jdaecq6PgJFQvuqqZoMExMu2XNlfg9zfdQT9UYoq6tL0of0c
	1IFOvcAd9TWrJzr7mWs85fB7Wz45bFGAWpD6j2XCiV/XmI+9aiqzE/4gnL7nPbahEYzQ
	hpkwuRjXVcTZTvWWHk4KbHksco2cTDMrjsJmfoKb6DzRJgi6YNjQY6/ZfiVgvarZGS9r
	iilQ==
X-Gm-Message-State: AOAM533uyOUTVGCnNvHrAkbkAX1TUhJIy7EvQw65mwBAIhgqmx/Tixnv
	2IJRS0eOMuZA7T+mKV0e+XyEmQ==
X-Google-Smtp-Source: ABdhPJyh46iXXKU9Sh1DXTFOzkFXYm4paCXLSWoWqbxFRDWCjy8xbqFVrhjjddGEPZlvsY+JnIndAg==
X-Received: by 2002:a17:90b:188d:: with SMTP id
	mn13mr6391960pjb.84.1591280865425; 
	Thu, 04 Jun 2020 07:27:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	j15sm5944936pjj.12.2020.06.04.07.27.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 07:27:44 -0700 (PDT)
Date: Thu, 4 Jun 2020 07:27:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Message-ID: <202006040727.265B0E586@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200604033347.GA3962068@ubuntu-n2-xlarge-x86>
	<CA+icZUU4Re5g3rRJ=WF3_KiCEc3CUmbH_PibTunuK_E1QskEjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+icZUU4Re5g3rRJ=WF3_KiCEc3CUmbH_PibTunuK_E1QskEjQ@mail.gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>,
	Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Joe Perches <joe@perches.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
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

On Thu, Jun 04, 2020 at 09:26:58AM +0200, Sedat Dilek wrote:
> On Thu, Jun 4, 2020 at 5:33 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Wed, Jun 03, 2020 at 04:31:53PM -0700, Kees Cook wrote:
> > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > (or can in the future), and suppresses unrelated compiler warnings
> > > (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> > > either simply initialize the variable or make compiler changes.
> > >
> > > As recommended[2] by[3] Linus[4], remove the macro.
> > [...]
> > For the series, consider it:
> >
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com> [build]
> [...]
> 
> I tried with updated version (checkpatch) of your tree and see no
> (new) warnings in my build-log.
> 
> Feel free to add my...
> 
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Awesome! Thank you both! :)

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
