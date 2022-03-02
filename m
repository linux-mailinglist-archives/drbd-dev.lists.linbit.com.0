Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 239834CB087
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Mar 2022 22:00:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF0A142179A;
	Wed,  2 Mar 2022 22:00:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A99CB421796
	for <drbd-dev@lists.linbit.com>; Wed,  2 Mar 2022 22:00:30 +0100 (CET)
Received: by mail-pg1-f178.google.com with SMTP id o26so2650304pgb.8
	for <drbd-dev@lists.linbit.com>; Wed, 02 Mar 2022 13:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=R/oQqieG0aXWXHs93Td97reRxAIjZoSgBmUtDJFVhjU=;
	b=d2ZFN7FzXJICmnX4Tyt0wAx0nHny3V7g7RBF7BzoFi4JqvMjvTlFe6r9CSmtZHYpfY
	sI7cCbacBhQSn0c2nYjk/wWGRSWn9quhJSSynH9lMYRKPPdVW/LYlF+HQ4F3tfS4GoN+
	rfxT6gA9HHGJJFfNnOWheyqKpysRyPxkd0f8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=R/oQqieG0aXWXHs93Td97reRxAIjZoSgBmUtDJFVhjU=;
	b=u0/RzR5shdenxIXjNVNHDPjnVIlPmTTSKMjyPtErIlB/ViuslPAGfMDW43pRYQTMTH
	hUbUdLI1UJD8GI5nNBYYBude0RkYOsAeIRO0ww20WQmkFMg0PIfrFwqbzJurH79Xz7zY
	ehm+w8LkyE7ew2CXw431d6vKgfeyMhJCRTA4jMfC3D1hamuw9jwJ5C77TCHUICmE/lu3
	MBOphp3BtOBS1q8goUQAQNeGFVYBQyDN8JiyBoAEblJR1aiAR4dUkZYCmewj4nP5vzKl
	KqghKBRx0DOxBscaOUCobVU0sYEGydRFyVc1aywRgkJIXz30oOxgDEEgS4MYLqhTr3dP
	JDqQ==
X-Gm-Message-State: AOAM532XD53GWyTJmC/nhZgV7vXN7/okk7PaHarEFfDgWagO0qwWMikr
	ZBfsg6CzKXfsOACdItIZ4BFKjw==
X-Google-Smtp-Source: ABdhPJwV5Vftpu3BNFYOd1YAI3xcgBfQbmCq2DPnKYT59xnVma61vCMoUamoUdgwMbiUWTPibOctJw==
X-Received: by 2002:a63:595e:0:b0:378:b203:a74e with SMTP id
	j30-20020a63595e000000b00378b203a74emr13280856pgm.328.1646254769698;
	Wed, 02 Mar 2022 12:59:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	z9-20020a655a49000000b00373459df190sm58337pgs.35.2022.03.02.12.59.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Mar 2022 12:59:29 -0800 (PST)
Date: Wed, 2 Mar 2022 12:59:28 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <202203021256.69D7C4BCA6@keescook>
References: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
	<73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
	<CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
	<7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
	<CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
	<0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
	<CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
	<78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
	<202203021158.DB5204A0@keescook>
	<CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
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
	Jason Gunthorpe <jgg@ziepe.ca>, David Laight <David.Laight@aculab.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"kgdb-bugreport@lists.sourceforge.net"
	<kgdb-bugreport@lists.sourceforge.net>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
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

On Wed, Mar 02, 2022 at 12:18:45PM -0800, Linus Torvalds wrote:
> On Wed, Mar 2, 2022 at 12:07 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > I've long wanted to change kfree() to explicitly set pointers to NULL on
> > free. https://github.com/KSPP/linux/issues/87
> 
> We've had this discussion with the gcc people in the past, and gcc
> actually has some support for it, but it's sadly tied to the actual
> function name (ie gcc has some special-casing for "free()")
> 
> See
> 
>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94527
> 
> for some of that discussion.
> 
> Oh, and I see some patch actually got merged since I looked there last
> so that you can mark "deallocator" functions, but I think it's only
> for the context matching, not for actually killing accesses to the
> pointer afterwards.

Ah! I missed that getting added in GCC 11. But yes, there it is:

https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-malloc-function-attribute

Hah, now we may need to split __malloc from __alloc_size. ;)

I'd still like the NULL assignment behavior, though, since some things
can easily avoid static analysis.

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
