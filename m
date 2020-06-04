Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39B1F82E2
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:23:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AB07420405;
	Sat, 13 Jun 2020 12:23:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5E11420431
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:04 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id b82so1527387wmb.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:content-transfer-encoding
	:in-reply-to:references:subject:from:cc:to:date:message-id
	:user-agent;
	bh=H+yv+HFWJQzExaR2AUnWxL9/UAqo4BkeuEm6/in5QnA=;
	b=UUzToyuGXw1UDcFEUPmCNw3S8zaUWgnlCVQXUDVuh/1yZMFCIiGQ5BmtDUm3rQ+E3U
	bg3/0pkuMwDiCpTEx2rW+csJK+eEcdQ3RTf43Qaapl4VXwzxk7CyQhPI4hYR9ZXXTk91
	OJ32nlDRpxQMtdHEruRGefq4MtUKmF4c+OqeknQr1MIePApgVHyPx/jUgVb1xmk0D/Iu
	J0es4L/VwdYqwKCsa2zzbNZckKRNcxAZV2+BrJQhn7frnTrCvd5+7m6D/u6rT96B262H
	WJghrS22lNxJEmUroYe/mmKlqj1EMnimqVGt+7XMDC3If05hdRheDKZM04Wms23g5vGF
	vtTQ==
X-Gm-Message-State: AOAM531h589Rb9dllxcJ1DhAZU/WdHwQrEoc8DVKdKeP/JxgsFmSwi7j
	uL6YHNF6SMkdqoCcUS8Fsmztyvp9/CTfbUxr
X-Google-Smtp-Source: ABdhPJwOGtLyNP3jyISnyL81/QpUNy2bVaza/v3tGXku5wKU8RJmvXueZLiC15Mw6S2dJciNOY9fsA==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr3283768wmy.79.1592042344434; 
	Sat, 13 Jun 2020 02:59:04 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	j11sm13422593wru.69.2020.06.13.02.59.03
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:03 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:02 +0200
Resent-Message-ID: <20200613095902.GF4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 398 seconds by postgrey-1.31 at mail19;
	Thu, 04 Jun 2020 06:45:16 CEST
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 62E98420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 06:45:16 +0200 (CEST)
Received: from kernel.org (unknown [104.132.0.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 04A91206C3;
	Thu,  4 Jun 2020 04:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591245517;
	bh=2lMQ7ysGCU8GBBi628ZDf5NUJ8tIyihWdEeZRWeBBRs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rjNKa+NoPrDtpvFIskphpRAzqIuZC2EDaeiH8NLviKFG4z0voPiz2uE07z0nrysfQ
	2eLhdaruaSQ74UQKr1AOe02dy7ouM14/8cQEr/sK93Ykg+9oEquqLX/ary5lgIdgf1
	J8RYhQkIfWZ8Ohep5Uxh6ufpuFKZW5VLYrPucY5o=
MIME-Version: 1.0
In-Reply-To: <20200603233203.1695403-7-keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-7-keescook@chromium.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Date: Wed, 03 Jun 2020 21:38:36 -0700
Message-ID: <159124551620.69627.18245138803269803785@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, clang-built-linux@googlegroups.com,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 06/10] clk: st: Remove uninitialized_var()
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

Quoting Kees Cook (2020-06-03 16:31:59)
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings (e.g.
> "unused variable"). If the compiler thinks it is uninitialized, either
> simply initialize the variable or make compiler changes. As a precursor
> to removing[2] this[3] macro[4], just remove this variable since it was
> actually unused:
> 
> drivers/clk/st/clkgen-fsyn.c: In function \u2018quadfs_set_rate\u2019:
> drivers/clk/st/clkgen-fsyn.c:793:6: warning: unused variable \u2018i\u2019 [-Wunused-variable]
>   793 |  int i;
>       |      ^
> 
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
