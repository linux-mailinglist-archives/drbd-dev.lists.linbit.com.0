Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AD54C9986
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Mar 2022 00:56:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C1D014217BB;
	Wed,  2 Mar 2022 00:56:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B9D04217AF
	for <drbd-dev@lists.linbit.com>; Wed,  2 Mar 2022 00:56:03 +0100 (CET)
Received: by mail-lj1-f180.google.com with SMTP id u11so23235lju.4
	for <drbd-dev@lists.linbit.com>; Tue, 01 Mar 2022 15:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4H0hy1V+vsSL/J4iRHU98fs6Ghx9E/bawvPg5OjXQmQ=;
	b=A1xSV6w+mnGI8KddmZFT+SVp47UhRqZlj7dZE7Ue1BgWjGw2+QCc51Zb6PIPvKiXuh
	/TGd1P3o63R0kiFyLwVU+kzDBf6Kt9wFSZwwJYnrWAqavu9szp3nfmKm0Qe68N3l8Mdl
	bWvesgtwBf4BWRSm4aUiCmj0pmAaHYwmzAjUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4H0hy1V+vsSL/J4iRHU98fs6Ghx9E/bawvPg5OjXQmQ=;
	b=XJtd1DKXO8u2A36/i2MVhsyIHaDNRDcHOWd1ciEqv3dC1ARNRkZVg8kNE0qlrCmci4
	kGnbJK8rvvMCGIgj9VphB1Tw8MhTbkYMkdNvQFI7iUx3A2KVxKHeHIHUWmtXBVMp0EXN
	0hFZ4NHRdjsnrwdZiZwN51HDPsRevJtllakpAp3cNxfAXTfJKGDOAkd7EIv5v0DDcixM
	ezUzQEO3HFiEnmeCCeztDgY0qb35LRau4xSwXjX4tKsrEbP1MGDQbKblrgoDzLdetTe/
	h4XafNV0RbBkBe7XNhSfJ/GhwcIUls4l592bNtGAxiyim9/qTfvYmFWe/N3Qlk2t7xz9
	N2UQ==
X-Gm-Message-State: AOAM533fNfhcnVkIrSA3Db7QbKDkhIHqN+vM9mjddCFzRqPe8otyiXiR
	uBbzqbpJrdGRNaos2gUHsKwqKwItMWNajm3NSkE=
X-Google-Smtp-Source: ABdhPJxSEsi/tVIY3htIDqN9qdhPaHq/c7eXLt+UxKznFDZ2b10MduKtUBI+72mqekNitueCpoTXzQ==
X-Received: by 2002:a2e:a4d6:0:b0:246:e66:90ed with SMTP id
	p22-20020a2ea4d6000000b002460e6690edmr19117408ljm.389.1646178962252;
	Tue, 01 Mar 2022 15:56:02 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
	[209.85.167.49]) by smtp.gmail.com with ESMTPSA id
	c19-20020a056512325300b004435b7107ddsm1730394lfr.185.2022.03.01.15.55.58
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 01 Mar 2022 15:55:59 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id b9so29634897lfv.7
	for <drbd-dev@lists.linbit.com>; Tue, 01 Mar 2022 15:55:58 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
	b2-20020a056512304200b0043796f5e68amr17643498lfb.449.1646178958685;
	Tue, 01 Mar 2022 15:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
	<7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
	<73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
	<CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
	<7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
	<CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
	<0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
In-Reply-To: <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 15:55:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
Message-ID: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
	"linux1394-devel@lists.sourceforge.net"
	<linux1394-devel@lists.sourceforge.net>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"kgdb-bugreport@lists.sourceforge.net"
	<kgdb-bugreport@lists.sourceforge.net>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	"v9fs-developer@lists.sourceforge.net"
	<v9fs-developer@lists.sourceforge.net>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Netdev <netdev@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	dma <dmaengine@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
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

On Tue, Mar 1, 2022 at 3:19 PM David Laight <David.Laight@aculab.com> wrote:
>
> Having said that there are so few users of list_entry_is_head()
> it is reasonable to generate two new names.

Well, the problem is that the users of list_entry_is_head() may be few
- but there are a number of _other_ ways to check "was that the HEAD
pointer", and not all of them are necessarily correct.

IOW, different places do different random tests for "did we walk the
whole loop without breaking out". And many of them happen to work. In
fact, in practice, pretty much *all* of them happen to work, and you
have to have the right struct layout and really really bad luck to hit
a case of "type confusion ended up causing the test to not work".

And *THAT* is the problem here. It's not the "there are 25ish places
that current use list_entry_is_head()".

It's the "there are ~480 places that use the type-confused HEAD entry
that has been cast to the wrong type".

And THAT is why I think we'd be better off with that bigger change
that simply means that you can't use the iterator variable at all
outside the loop, and try to make it something where the compiler can
help catch mis-uses.

Now, making the list_for_each_entry() thing force the iterator to NULL
at the end of the loop does fix the problem. The issue I have with it
is really just that you end up getting no warning at all from the
compiler if you mix old-style and new-style semantics. Now, you *will*
get an oops (if using a new-style iterator with an old-style check),
but many of these things will be in odd driver code and may happen
only for error cases.

And if you use a new-style check with an old-style iterator (ie some
backport problem), you will probably end up getting random memory
corruption, because you'll decide "it's not a HEAD entry", and then
you'll actually *use* the HEAD that has the wrong type cast associated
with it.

See what my worry is?

With the "don't use iterator outside the loop" approach, the exact
same code works in both the old world order and the new world order,
and you don't have the semantic confusion. And *if* you try to use the
iterator outside the loop, you'll _mostly_ (*) get a compiler warning
about it not being initialized.

             Linus

(*) Unless somebody initializes the iterator pointer pointlessly.
Which clearly does happen. Thus the "mostly". It's not perfect, and
that's most definitely not nice - but it should at least hopefully
make it that much harder to mess up.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
