Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DB4CAF6F
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Mar 2022 21:08:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F95442179B;
	Wed,  2 Mar 2022 21:08:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5D17420177
	for <drbd-dev@lists.linbit.com>; Wed,  2 Mar 2022 21:08:06 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id q11so2508864pln.11
	for <drbd-dev@lists.linbit.com>; Wed, 02 Mar 2022 12:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=9llME+iRL2iH9L07jwvbWbmbHLr47Rbz7WJ4fOgTlZc=;
	b=IvpJRwG7ynxkReEE85KaN5rJUYtD4xKNHA+hy6TwBmoQ8B3uYeJI+QViQcnaGiWq86
	F88M3HTERkoil1v4VBpPtCvYuei+/tfueI2kCXzM7ddvcotxLyWZwiewhTHLUCy28lRK
	BraqPBOXvwYRthhpbxTgJWS9pGCc3zSZJBqHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=9llME+iRL2iH9L07jwvbWbmbHLr47Rbz7WJ4fOgTlZc=;
	b=NBXQX+1EfDgIxqh8urMRnzBIBzV393lxPDJUL4l5QZLs//Sb14qDeHBXSQ66tlt29Y
	VRiuxKxHJPyPrkUJls4dTHAsimCwRsgGRB4tYsR3xT8yrCi7pNRdu+7uLy8zL8a6P4mc
	4OL9Nv1R0htw0AM6Bd+uZIcu1e9flkxF40Q0foy5F4zqe6Pi3OVsRxk4gs6RNZS1utIQ
	vBrcga71OVEHCvHbLooPsf941u74hWpeERZDA4biRIjC/UEi286MIRVX3H8aS2swqXuU
	EcIispV61A3DM6TLJkrbdlF70W0muKUR0z0uGQyUQCXk0ywqQAIMptAZBe67pAnA4KYx
	k40A==
X-Gm-Message-State: AOAM531F8R/x7GRN2isxE11bfgqEVMEdeIvSvdAhHaZ1qyJsuO3JKIv2
	51j4P/9H806qvYKBgIjBkREZ4Q==
X-Google-Smtp-Source: ABdhPJyalZw/yElDAQSdRYusWOxjkvZUrvn+e5j/jboS/+hXUtUpvVb6mMnbBbqlv1j/a0ygzQBPkQ==
X-Received: by 2002:a17:90b:94e:b0:1bc:c99f:ede1 with SMTP id
	dw14-20020a17090b094e00b001bcc99fede1mr1518926pjb.49.1646251625762;
	Wed, 02 Mar 2022 12:07:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	d25-20020a637359000000b0037843afb785sm6664pgn.25.2022.03.02.12.07.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Mar 2022 12:07:05 -0800 (PST)
Date: Wed, 2 Mar 2022 12:07:04 -0800
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <202203021158.DB5204A0@keescook>
References: <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
	<7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
	<73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
	<CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
	<7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
	<CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
	<0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
	<CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
	<78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	linux-block <linux-block@vger.kernel.org>,
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
	Jason Gunthorpe <jgg@ziepe.ca>, David Laight <David.Laight@aculab.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"kgdb-bugreport@lists.sourceforge.net"
	<kgdb-bugreport@lists.sourceforge.net>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
	Linus Torvalds <torvalds@linux-foundation.org>,
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

On Wed, Mar 02, 2022 at 10:29:31AM +0100, Rasmus Villemoes wrote:
> This won't help the current issue (because it doesn't exist and might
> never), but just in case some compiler people are listening, I'd like to
> have some sort of way to tell the compiler "treat this variable as
> uninitialized from here on". So one could do
> 
> #define kfree(p) do { __kfree(p); __magic_uninit(p); } while (0)
> 
> with __magic_uninit being a magic no-op that doesn't affect the
> semantics of the code, but could be used by the compiler's "[is/may be]
> used uninitialized" machinery to flag e.g. double frees on some odd
> error path etc. It would probably only work for local automatic
> variables, but it should be possible to just ignore the hint if p is
> some expression like foo->bar or has side effects. If we had that, the
> end-of-loop test could include that to "uninitialize" the iterator.

I've long wanted to change kfree() to explicitly set pointers to NULL on
free. https://github.com/KSPP/linux/issues/87

The thing stopping a trivial transformation of kfree() is:

	kfree(get_some_pointer());

I would argue, though, that the above is poor form: the thing holding
the pointer should be the thing freeing it, so these cases should be
refactored and kfree() could do the NULLing by default.

Quoting myself in the above issue:


Without doing massive tree-wide changes, I think we need compiler
support. If we had something like __builtin_is_lvalue(), we could
distinguish function returns from lvalues. For example, right now a
common case are things like:

	kfree(get_some_ptr());

But if we could at least gain coverage of the lvalue cases, and detect
them statically at compile-time, we could do:

#define __kfree_and_null(x) do { __kfree(*x); *x = NULL; } while (0)
#define kfree(x) __builtin_choose_expr(__builtin_is_lvalue(x),
			__kfree_and_null(&(x)), __kfree(x))

Alternatively, we could do a tree-wide change of the former case (findable
with Coccinelle) and change them into something like kfree_no_null()
and redefine kfree() itself:

#define kfree_no_null(x) do { void *__ptr = (x); __kfree(__ptr); } while (0)
#define kfree(x) do { __kfree(x); x = NULL; } while (0)

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
