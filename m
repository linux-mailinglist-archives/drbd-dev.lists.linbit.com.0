Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 432FE1F82EA
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:26:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E79A420405;
	Sat, 13 Jun 2020 12:26:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4B3742043A
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:59:17 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id t18so12297496wru.6
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=Zd56CSP9N2M4FrfN9ySWd7Nzjr+sOLOVU8sX9ZsvxYk=;
	b=Z8z2HnlAv3Fy9JZ9pnjTj2sIzIMjJ5dYSF+xjJonPEvbKnSj0cc7o0pzrX9EzeygnS
	wuzpR8RslzYaD8/dbFrGJ68J3pjHKIQMDlEr7rwg5hozhTgKJXa3fJN/yeiub5zfvgC0
	BcyKuNhgrD/+5IMGcMzlZ6z4UMh5Vo5c1sQ8D+lwj4Nu+xzgeWm8AtxA3eOw7R4K/ZWi
	gIIwO1bLPDXvKo/BAUITZ4UQsgilskQPLX2yv4IcLaoa7xg8u3GZ/5SNl+HB5j8coL7Y
	28r4jRzrJoU3CvXrOYyUHhOUcZJikQ2XktNUmSqAi2KduW+YZm9zbZ2zoV/XaI52v25V
	3B+Q==
X-Gm-Message-State: AOAM533b7aD6yn/WENWwuRyVp7ipVL4HkSnpyXiKBBh79UWbMVakyVka
	JCh+OALjtAUPENMuWZKdisuAL886IePJUsx/
X-Google-Smtp-Source: ABdhPJwULiGTEsusMM9i/PZ+yFYpPREwMfRBDKsHzvbAqO626GDncw7ecUFFrj81n4rTfDXcgEsRfw==
X-Received: by 2002:adf:f882:: with SMTP id u2mr20327106wrp.40.1592042357185; 
	Sat, 13 Jun 2020 02:59:17 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	h188sm13340723wmh.2.2020.06.13.02.59.16
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:59:16 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:59:14 +0200
Resent-Message-ID: <20200613095914.GK4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3DC87420235
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 15:23:08 +0200 (CEST)
Received: by mail-qt1-f193.google.com with SMTP id c12so5113297qtq.11
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jun 2020 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=Zd56CSP9N2M4FrfN9ySWd7Nzjr+sOLOVU8sX9ZsvxYk=;
	b=Z1SifWi8Glj9s1ZlViEQIoOzrtW4kQqhJPAuBmH8BuAfTlSORzOP5/aBkVIpDCF065
	4tet6nf/xexKbX9HERYTEiH7bvvMa7jEzJZJ+Y9NbTVNdXZMe5cuQGHU5U8XYpc6rEpA
	0M5eGOL/GQzV1R+AsSeBTDbzXk+YExg+XOlZLmxAbhKhBOAjkHQZ06AbVHRZdzvZiU7w
	cHe+L3V8vNXxybekuzSoIvOp1xxWvK8SbdjJVplyLz5vYnbOtUIAIDcZULCyq5qUdBWf
	hegDa8ghfSlITKfZUXou8d2OJHz3pI/kZh5/E9mjrrfnPUc08cS9ulbxQPmbEBYY1pID
	+u9g==
X-Received: by 2002:aed:3fa5:: with SMTP id s34mr4444014qth.343.1591276988114; 
	Thu, 04 Jun 2020 06:23:08 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.48.30]) by smtp.gmail.com with ESMTPSA id
	126sm4330150qkj.89.2020.06.04.06.23.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Jun 2020 06:23:07 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
	id 1jgppq-001CIj-Sr; Thu, 04 Jun 2020 10:23:06 -0300
Date: Thu, 4 Jun 2020 10:23:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200604132306.GO6578@ziepe.ca>
References: <20200603233203.1695403-1-keescook@chromium.org>
	<20200603233203.1695403-10-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603233203.1695403-10-keescook@chromium.org>
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

On Wed, Jun 03, 2020 at 04:32:02PM -0700, Kees Cook wrote:
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings
> (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> either simply initialize the variable or make compiler changes.
> 
> I preparation for removing[2] the[3] macro[4], remove all remaining
> needless uses with the following script:
> 
> git grep '\buninitialized_var\b' | cut -d: -f1 | sort -u | \
> 	xargs perl -pi -e \
> 		's/\buninitialized_var\(([^\)]+)\)/\1/g;
> 		 s:\s*/\* (GCC be quiet|to make compiler happy) \*/$::g;'
> 
> drivers/video/fbdev/riva/riva_hw.c was manually tweaked to avoid
> pathological white-space.
> 
> No outstanding warnings were found building allmodconfig with GCC 9.3.0
> for x86_64, i386, arm64, arm, powerpc, powerpc64le, s390x, mips, sparc64,
> alpha, and m68k.

At least in the infiniband part I'm confident that old gcc versions
will print warnings after this patch.

As the warnings are wrong, do we care? Should old gcc maybe just -Wno-
the warning?

Otherwise the IB bits look ok to me

Acked-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
