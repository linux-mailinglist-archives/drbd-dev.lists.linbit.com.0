Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F81EDA83
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 03:40:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 586E54203E1;
	Thu,  4 Jun 2020 03:40:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8BA3E42030B
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 03:40:12 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id h95so387739pje.4
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 18:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=RZTkgHwXnV/Mmq7iR84jWoY6DwZ1rOj4qUQ+qrZYDwc=;
	b=D25kXdKhWQJ/MUHuNLgCYDZUO7VYifzgRU57sW3cCgSotuT36cS0gwMFjJehcx+vT7
	Qo+Rryfzbt2dW0wLdUcGj9Q0InUDL3Kms87BacBCRrJrfyyPbeQNxvn25asBf8woO+z3
	+P77gIynfVAOQsI2dG7+NHySk/5WZ7LfsfFJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=RZTkgHwXnV/Mmq7iR84jWoY6DwZ1rOj4qUQ+qrZYDwc=;
	b=InZWIdxXaoiMhEtKm6lJ+kfUSyvkczG6fajepPqU9aIpvgOfD8PNpqA/Pn8uBg5Vp+
	NrPlUXbot5DUK60LgbjG/1l/GlKIwou0C4ztMUmR+d0jPBGrPTCndZoBMumIsIF/eGfC
	DE1muJ5nMWRWYACVXhUQwl3nfVHvmBDjdSegg8EBda6jjFFXrzUJUFb5hrzZfQafDMWY
	qKIozg1RDccYGLsmXPVmu5vP6oHwHwNe2vQxtRN2+DmoJ05vTukToIx0dUOYXCcbAlIj
	hY/Pgs5vxt1unEnUiC6cnMneQqt73KtVAg60oYX/buXKXN3dIfE31/3b9BFKJgm3GvrJ
	pcQg==
X-Gm-Message-State: AOAM530X81mbVQwgWEGy0Ofjxi8ov66Kx9AFjxnj01bsI9hdoPTnm/Io
	AeuAeoZ27lUDQc7hxCF7tUr11g==
X-Google-Smtp-Source: ABdhPJyG3cK5GuU0RarjdGROX8AagUDp+h912sluu+H/wdjYIyX1M3u7CAMpBcEf90rpTZQM3JGTsw==
X-Received: by 2002:a17:90a:dd44:: with SMTP id
	u4mr2890350pjv.132.1591234811278; 
	Wed, 03 Jun 2020 18:40:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	o13sm2589124pgs.82.2020.06.03.18.40.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 18:40:10 -0700 (PDT)
Date: Wed, 3 Jun 2020 18:40:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Message-ID: <202006031838.55722640DC@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-9-keescook@chromium.org>
	<ff9087b0571e1fc499bd8a4c9fd99bfc0357f245.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff9087b0571e1fc499bd8a4c9fd99bfc0357f245.camel@perches.com>
Cc: clang-built-linux@googlegroups.com, linux-ide@vger.kernel.org,
	netdev@vger.kernel.org, x86@kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Andy Whitcroft <apw@canonical.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 08/10] checkpatch: Remove awareness of
 uninitialized_var() macro
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

On Wed, Jun 03, 2020 at 05:02:29PM -0700, Joe Perches wrote:
> On Wed, 2020-06-03 at 16:32 -0700, Kees Cook wrote:
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings
> > (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> > either simply initialize the variable or make compiler changes.
> > 
> > In preparation for removing[2] the[3] macro[4], effectively revert
> > commit 16b7f3c89907 ("checkpatch: avoid warning about uninitialized_var()")
> > and remove all remaining mentions of uninitialized_var().
> > 
> > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> nack.  see below.
> 
> I'd prefer a simple revert, but it shouldn't
> be done here.

What do you mean? (I can't understand this and "fine by me" below?)

> 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -4075,7 +4074,7 @@ sub process {
> >  		}
> >  
> >  # check for function declarations without arguments like "int foo()"
> > -		if ($line =~ /(\b$Type\s*$Ident)\s*\(\s*\)/) {
> > +		if ($line =~ /(\b$Type\s+$Ident)\s*\(\s*\)/) {
> 
> This isn't right because $Type includes a possible trailing *
> where there isn't a space between $Type and $Ident

Ah, hm, that was changed in the mentioned commit:

-               if ($line =~ /(\b$Type\s+$Ident)\s*\(\s*\)/) {
+               if ($line =~ /(\b$Type\s*$Ident)\s*\(\s*\)/) {

> 
> e.g.:	int *bar(void);
> 
> Other than that, fine by me...

Thanks for looking it over! I'll adjust it however you'd like. :)

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
