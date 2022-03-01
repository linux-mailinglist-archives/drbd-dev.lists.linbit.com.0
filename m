Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904B4C937E
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 19:47:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44BAC4217AF;
	Tue,  1 Mar 2022 19:47:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ED56F42179C
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 19:47:36 +0100 (CET)
Received: by mail-lf1-f50.google.com with SMTP id m14so28436092lfu.4
	for <drbd-dev@lists.linbit.com>; Tue, 01 Mar 2022 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JZw99KMpsKBs3Ab/LBNeIPMebXALTITXobBfJpN/EsI=;
	b=ZEWbFFu3eWrZxUgaaScwD4ZJ//Z7mV4SGMyACB20WwCKEMFGKIBMMEXVkM4kZXdOyd
	EokMKBVyAcoYChV/SvtOh5q5h0Yafm3wlsC3jCGOeoM0h4pn550KTbE+/sUn3z3m8p0V
	ZL0gG9ZTrYCOlyUURTCDAGrluijISoqXbB1wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JZw99KMpsKBs3Ab/LBNeIPMebXALTITXobBfJpN/EsI=;
	b=Hx/1Kuby4gId30pgWmLYe38h1Wsfc9C1vr9higobFtzBdJeo8PGWog3JalMGjUSqgX
	5QxJx1dnyMetrOvyI826TP0mPqI956/o6snx2vzThvHWMhjRu6FCTW9SPLe/R6ytBvuX
	d7JtWfezK4ABuNE5o7U5sleiIcauidcmC4E7/odCnFIbF3xrRpH9Q3k2uBIezN4qkfuh
	M1EFqJOcoLkX8x8jfBI23QNHOPD9ZWKUfa7ZqbZSMX7pNeG+RKw96mg4o3Y2kYsJNHJD
	fdyixFWFXnx73eV1vhz633cVAxBj0/jdNsk4p/5L684zGLnZKwj5dtuOZs1vzBv9D7Iu
	vxqA==
X-Gm-Message-State: AOAM530MdcrKeL+RJtP9tJksztZEifQPywQpy0qL68nyug3bOd69KV42
	DwXtvyj3OWjBlzS7dU3Hzj1SFoCof0zj+H1W7w8=
X-Google-Smtp-Source: ABdhPJxKk1cpwoJrm3vz+eGDW/Aw63oF6dG7i5ne/mUuHuJvbjC6iToF1E9UwbLz3cqgw6zHDZYyAA==
X-Received: by 2002:ac2:47e3:0:b0:43a:9d5b:8a9e with SMTP id
	b3-20020ac247e3000000b0043a9d5b8a9emr16363543lfp.67.1646160455477;
	Tue, 01 Mar 2022 10:47:35 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
	[209.85.167.43]) by smtp.gmail.com with ESMTPSA id
	u9-20020ac251c9000000b0044395adab20sm1616520lfm.222.2022.03.01.10.47.32
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 01 Mar 2022 10:47:33 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id g39so28373729lfv.10
	for <drbd-dev@lists.linbit.com>; Tue, 01 Mar 2022 10:47:32 -0800 (PST)
X-Received: by 2002:a05:6512:2033:b0:443:3d49:dac with SMTP id
	s19-20020a056512203300b004433d490dacmr16440784lfs.52.1646160451271;
	Tue, 01 Mar 2022 10:47:31 -0800 (PST)
MIME-Version: 1.0
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
	<202203011008.AA0B5A2D@keescook>
In-Reply-To: <202203011008.AA0B5A2D@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 10:47:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whccSm8HKANQbomYrF8cqBa1wUi1dvUEUc3Nf=WoX3WHQ@mail.gmail.com>
Message-ID: <CAHk-=whccSm8HKANQbomYrF8cqBa1wUi1dvUEUc3Nf=WoX3WHQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
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
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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

On Tue, Mar 1, 2022 at 10:14 AM Kees Cook <keescook@chromium.org> wrote:
>
> The first big glitch with -Wshadow was with shadowed global variables.
> GCC 4.8 fixed that, but it still yells about shadowed functions. What
> _almost_ works is -Wshadow=local.

Heh. Yeah, I just have long memories of "-Wshadow was a disaster". You
looked into the details.

> Another way to try to catch misused shadow variables is
> -Wunused-but-set-varible, but it, too, has tons of false positives.

That on the face of it should be an easy warning to get technically
right for a compiler.

So I assume the "false positives" are simply because we end up having
various variables that really don't end up being used - and
"intentionally" so).

Or rather, they might only be used under some config option - perhaps
the use is even syntactically there and parsed, but the compiler
notices that it's turned off under some

        if (IS_ENABLED(..))

option? Because yeah, we have a lot of those.

I think that's a common theme with a lot of compiler warnings: on the
face of it they sound "obviously sane" and nobody should ever write
code like that.

A conditional that is always true? Sounds idiotic, and sounds like a
reasonable thing for a compiler to warn about, since why would you
have a conditional in the first place for that?

But then you realize that maybe the conditional is a build config
option, and "always true" suddenly makes sense. Or it's a test for
something that is always true on _that_architecture_ but not in some
general sense (ie testing "sizeof()"). Or it's a purely syntactic
conditional, like "do { } while (0)".

It's why I'm often so down on a lot of the odd warnings that are
hiding under W=1 and friends. They all may make sense in the trivial
case ("That is insane") but then in the end they happen for sane code.

And yeah, -Wshadow has had tons of history with macro nesting, and
just being badly done in the first place (eg "strlen" can be a
perfectly fine local variable).

That said, maybe people could ask the gcc and clan people for a way to
_mark_ the places where we expect to validly see shadowing. For
example, that "local variable in a macro expression statement" thing
is absolutely horrendous to fix with preprocessor tricks to try to
make for unique identifiers.

But I think it would be much more syntactically reasonable to add (for
example) a "shadow" attribute to such a variable exactly to tell the
compiler "yeah, yeah, I know this identifier could shadow an outer
one" and turn it off that way.

               Linus
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
