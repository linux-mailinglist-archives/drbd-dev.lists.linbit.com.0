Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D124C92C0
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 19:15:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A1E04217A8;
	Tue,  1 Mar 2022 19:15:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E806A42179F
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 19:15:09 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id d17so15055120pfl.0
	for <drbd-dev@lists.linbit.com>; Tue, 01 Mar 2022 10:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=;
	b=O9Pc4FRhQaHO8JwtvKmEa7P/p93QhIWPziYnJxBP3SmXkKfXwbS/+UXcAcizlZe2qE
	5++D1AzgFSiNA6GVcHz58RghXwcZj0T+stAg2S8I6BdGwjnEpqEP1SHJlTJIwhdk7I/A
	Km+JuAoSqO/aabb7J1BxN3aslickTdbOZI2Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=;
	b=8AAmd2ludMH+1+8nC3xp5uFOQSaxXWzOtDw6UP7Mrlmj4gSEnhL7YVmyA+4ZFXi/bk
	zWHwY9GG2c/blYuPK3OCsQAnRSly0rcK41Yhr/1OLNO5u54fQAy+RFuHBwIyemgievXj
	zuyQYL3XFN5bmO3oQCuz7tX8TjICyqiAMpis0XML4A6Kld+l78xv4JXfEC5FuyZfVUhp
	KylBY2SaS1jWRQZiPge/nZOAdnfFCT/Oq2aQ7xZHVyr8Hy9wiwKB7jccIeGxATu5Tv51
	2bO4BXzLQZwv/AB2cRFJin2V9Xyf4NtgsAe/bmXPhR5TDBxfJRKu11CrfHsAkwkfKj6Y
	7S9g==
X-Gm-Message-State: AOAM532BJ6grG/sYpUvwHO1mrzn248UVHURs1MjYwN9VfDsJ/wjEHXZk
	tcY8AKRk9p79e+tEmWVj2r4jDg==
X-Google-Smtp-Source: ABdhPJwl/oZl7jTR8Xbiy0diMdVywUoBtjuUV8iCsVjT5dJdX8x+nPRIiFjmEv3Xm0s1V2wXWPjOfA==
X-Received: by 2002:a62:d156:0:b0:4cd:fd21:e406 with SMTP id
	t22-20020a62d156000000b004cdfd21e406mr28741951pfl.44.1646158448831;
	Tue, 01 Mar 2022 10:14:08 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	nn10-20020a17090b38ca00b001bc3a60b324sm2540095pjb.46.2022.03.01.10.14.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Mar 2022 10:14:08 -0800 (PST)
Date: Tue, 1 Mar 2022 10:14:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <202203011008.AA0B5A2D@keescook>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	<CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
	<Yh0tl3Lni4weIMkl@casper.infradead.org>
	<CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
	<Yh1aMm3hFe/j9ZbI@casper.infradead.org>
	<CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Matthew Wilcox <willy@infradead.org>,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>, "Bos,
	H.J." <h.j.bos@vu.nl>, Nathan Chancellor <nathan@kernel.org>,
	dma <dmaengine@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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

On Mon, Feb 28, 2022 at 04:45:11PM -0800, Linus Torvalds wrote:
> Really. The "-Wshadow doesn't work on the kernel" is not some new
> issue, because you have to do completely insane things to the source
> code to enable it.

The first big glitch with -Wshadow was with shadowed global variables.
GCC 4.8 fixed that, but it still yells about shadowed functions. What
_almost_ works is -Wshadow=local. At first glace, all the warnings
look solvable, but then one will eventually discover __wait_event()
and associated macros that mix when and how deeply it intentionally
shadows variables. :)

Another way to try to catch misused shadow variables is
-Wunused-but-set-varible, but it, too, has tons of false positives.

I tried to capture some of the rationale and research here:
https://github.com/KSPP/linux/issues/152

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
