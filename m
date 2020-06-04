Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4881EDBD6
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 05:46:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 780794203E1;
	Thu,  4 Jun 2020 05:46:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2648C420302
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 05:46:20 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id q16so1600991plr.2
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 20:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=AKUvLro9S597CUdKLkHtfULaMJzReX6aR4Vd+jg9MWw=;
	b=hKAsiTFpLHHgYk7uxEc64hy/HUaA1WkUjC8d9BKcLM3A/W0jWDjCQVcYLc0TzJIb6c
	CVvGbgMTwJtWW3d38WnReaNXfUDB6Z7+PjsIdPE8tJzwBE5kkiQFZuUsHl9gXF2t3hNz
	P/mhkULSwbWlOZpcliQwUyTPCPRZerjJhSiPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=AKUvLro9S597CUdKLkHtfULaMJzReX6aR4Vd+jg9MWw=;
	b=XLmcpSUr1FGfMjJnsiAvdt1b2SJkBc14rCpLPnxwz8EdAGBXUbepOXe61fMrWIquQv
	06A0qdYrrBz2JwbMv95AAoaNBvFfNtc33Mugza/LsSAL2L3Z95aRRwTrCu3Wsu3TqSTu
	zqPBx2TC9G+wGqUBFQEZm8JZKyTRuF6Royie/CbtvlJ5A7L8Nj/WK/tK79cT1pYDIVJy
	I+T95o3MkWR0FlP8dxp/UvdYSHzR7vDSjsjGxcrRQFnZZdmzWieMqqM4Jvfh4hCktHTI
	rlEj61invgTA3RV3YtIhJYJgbGm118KPLMG/sLAH08JrrrqWWWOHWTBPkBnvWkiSxLKH
	y9Eg==
X-Gm-Message-State: AOAM531UwT0f6YVWon4SDnO8KeAjp0vYV5Ae0tLwkYZ1tluv8BpGjHj4
	sFIxYb6FwLmIzeNWk9fFESKMGA==
X-Google-Smtp-Source: ABdhPJwgOC5Nh6YRgoFEBFoD4RiNjZ8EE9ykV4UyBnz631Lr2h8YJbe7vzR1a+QiANBM9x+EA79IfA==
X-Received: by 2002:a17:90a:2461:: with SMTP id
	h88mr3702337pje.180.1591242379970; 
	Wed, 03 Jun 2020 20:46:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id a5sm3056506pfi.41.2020.06.03.20.46.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 20:46:18 -0700 (PDT)
Date: Wed, 3 Jun 2020 20:46:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Message-ID: <202006032046.96A726426@keescook>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-9-keescook@chromium.org>
	<ff9087b0571e1fc499bd8a4c9fd99bfc0357f245.camel@perches.com>
	<202006031838.55722640DC@keescook>
	<6f921002478544217903ee4bfbe3c400e169687f.camel@perches.com>
	<202006031944.9551FAA68E@keescook>
	<CA+icZUVg24VrpPgMdfsgPa+Wckci9XkzKUdtwhVB3ZW96uZOWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+icZUVg24VrpPgMdfsgPa+Wckci9XkzKUdtwhVB3ZW96uZOWw@mail.gmail.com>
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

On Thu, Jun 04, 2020 at 04:53:34AM +0200, Sedat Dilek wrote:
> can you push that change also to kees/linux.git#kspp/uninit/v5.7/macro ?

Done! :)

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
