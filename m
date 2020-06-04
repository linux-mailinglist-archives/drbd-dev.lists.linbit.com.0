Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCA1F82ED
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:27:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6F7E420407;
	Sat, 13 Jun 2020 12:27:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6725042042B
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:23 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id y17so12257799wrn.11
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=ylFM7xcrRPttXnSFsxxMsniM496bjo9TahOp0BQ4KWQ=;
	b=HVoUGPfvQCec+8fmJ6D9QTXPb72lCNSTyAcHWDTyxYozq0YNU2qP7u2CEYhQZpkGIY
	Ynk3OoQaFy2c3FQjB01s7YBeVsVQzWtJHlkULuVoie2Lx6PEHNgXuMHzrzZ8WoAOLPAb
	x31ShUco8GM9gN9d1zOD6X6MhRtxlRUK44W2YllCl233zXOHE+dKPlVK/SxTcraAaU7z
	Ay2S13u6isQjK2/ShnK9qpD8Xv3gTD1A+0RpWshdcOxo0Y44B751YoAI20It4dHAZD4+
	JBvQv3HwQv1gMarqZfkw31ypAng248SFI6NLYDSJvP7WZzwaka0dDjAnQgIkVOq2B1gd
	Godw==
X-Gm-Message-State: AOAM531S2APteawwiq2E5y7olWe4XYXNYksmR4HoFEPM56DcozMad1QL
	VTtQ1zLb+BPFRlGxdDAOK+E0VllShmRGYRYN
X-Google-Smtp-Source: ABdhPJz6cQtHkMGkJBMmy4fjtWzGephR97E5V6ooxw/YzWI+h+4wIE3Q0ZABo57k4XJQIsQrXr5Bxg==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr18416883wrb.270.1592042362867;
	Sat, 13 Jun 2020 02:59:22 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	s7sm14114053wrr.60.2020.06.13.02.59.22
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:22 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:20 +0200
Resent-Message-ID: <20200613095920.GM4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 71CCB420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 19:58:01 +0200 (CEST)
Received: by mail-qk1-f193.google.com with SMTP id w3so6995472qkb.6
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=ylFM7xcrRPttXnSFsxxMsniM496bjo9TahOp0BQ4KWQ=;
	b=dp1MW0oLsIVpf8P1GqlJ7ywKbTALgi380UyzwJhLZxxjLZbExXSS3+DNraBRJx+RxA
	2YNRIqPWKCJwUAt2Ionyk91M424aXFCth771TTbwhKuAi/5z09C6/Wr39Wytw6IFYat4
	ROGMU+gTfjKOfKx/KnMfK4lHl61/+H90NG+NU9ft1Ad329Ugd8oNWQRmnDyTDrH84VcG
	NHqJ/pa7Z8WtA7tv5ssR9OBolcmhh/Z0Chu/DqhjQRZD68jbMjVitMLn9/18eeVfDBtl
	W6iFo32dBc0/Xz9TBC1xS9lWFSwriSPTsiMKkjJI2/Fy1v0kJA0h8NiDLZa3m0zxOiRF
	iMLw==
X-Received: by 2002:ae9:ebd2:: with SMTP id b201mr5788109qkg.409.1591293480332;
	Thu, 04 Jun 2020 10:58:00 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.48.30]) by smtp.gmail.com with ESMTPSA id
	t43sm5788444qtj.85.2020.06.04.10.57.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 10:57:59 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
	id 1jgu7r-001H95-GE; Thu, 04 Jun 2020 14:57:59 -0300
Date: Thu, 4 Jun 2020 14:57:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200604175759.GQ6578@ziepe.ca>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-10-keescook@chromium.org>
	<20200604132306.GO6578@ziepe.ca> <202006040757.0DFC3F28E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202006040757.0DFC3F28E@keescook>
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

On Thu, Jun 04, 2020 at 07:59:40AM -0700, Kees Cook wrote:
> On Thu, Jun 04, 2020 at 10:23:06AM -0300, Jason Gunthorpe wrote:
> > On Wed, Jun 03, 2020 at 04:32:02PM -0700, Kees Cook wrote:
> > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > (or can in the future), and suppresses unrelated compiler warnings
> > > (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> > > either simply initialize the variable or make compiler changes.
> > > 
> > > I preparation for removing[2] the[3] macro[4], remove all remaining
> > > needless uses with the following script:
> > > 
> > > git grep '\buninitialized_var\b' | cut -d: -f1 | sort -u | \
> > > 	xargs perl -pi -e \
> > > 		's/\buninitialized_var\(([^\)]+)\)/\1/g;
> > > 		 s:\s*/\* (GCC be quiet|to make compiler happy) \*/$::g;'
> > > 
> > > drivers/video/fbdev/riva/riva_hw.c was manually tweaked to avoid
> > > pathological white-space.
> > > 
> > > No outstanding warnings were found building allmodconfig with GCC 9.3.0
> > > for x86_64, i386, arm64, arm, powerpc, powerpc64le, s390x, mips, sparc64,
> > > alpha, and m68k.
> > 
> > At least in the infiniband part I'm confident that old gcc versions
> > will print warnings after this patch.
> > 
> > As the warnings are wrong, do we care? Should old gcc maybe just -Wno-
> > the warning?
> 
> I *think* a lot of those are from -Wmaybe-uninitialized, but Linus just
> turned that off unconditionally in v5.7:
> 78a5255ffb6a ("Stop the ad-hoc games with -Wno-maybe-initialized")

Yah, that alone is justification enough to do this purge.

Jason
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
