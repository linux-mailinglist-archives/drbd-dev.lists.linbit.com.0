Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 683964C855C
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 08:40:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 29BED4217C4;
	Tue,  1 Mar 2022 08:40:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3569 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 23:02:45 CET
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E77C4421787
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 23:02:45 +0100 (CET)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21SKr95E005627;
	Mon, 28 Feb 2022 14:53:09 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 21SKr7Xe005624;
	Mon, 28 Feb 2022 14:53:07 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
	segher@kernel.crashing.org using -f
Date: Mon, 28 Feb 2022 14:53:07 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20220228205307.GD614@gate.crashing.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	<CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
	<CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
X-Mailman-Approved-At: Tue, 01 Mar 2022 08:40:57 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos,
	H.J." <h.j.bos@vu.nl>, samba-technical@lists.samba.org,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
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

On Mon, Feb 28, 2022 at 12:14:44PM -0800, Linus Torvalds wrote:
> On Mon, Feb 28, 2022 at 12:10 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > We can do
> >
> >         typeof(pos) pos
> >
> > in the 'for ()' loop, and never use __iter at all.
> >
> > That means that inside the for-loop, we use a _different_ 'pos' than outside.
> 
> The thing that makes me throw up in my mouth a bit is that in that
> 
>         typeof(pos) pos
> 
> the first 'pos' (that we use for just the typeof) is that outer-level
> 'pos', IOW it's a *different* 'pos' than the second 'pos' in that same
> declaration that declares the inner level shadowing new 'pos'
> variable.

The new "pos" has not yet been declared, so this has to refer to the
outer "pos", it cannot be the inner one.  Because it hasn't been
declared yet :-)

Compare this to
  typeof (pos) pos = pos;
where that last "pos" *does* refer to the newly declared one: that
declaration has already been done!  (So this code is UB btw, 6.3.2.1/2).

> If I was a compiler person, I would say "Linus, that thing is too ugly
> to live", and I would hate it. I'm just hoping that even compiler
> people say "that's *so* ugly it's almost beautiful".

It is perfectly well-defined.  Well, it would be good if we (GCC) would
document it does work, and if someone tested it on LLVM as well.  But it
is really hard to implement it to *not* work :-)

> Because it does seem to work. It's not pretty, but hey, it's not like
> our headers are really ever be winning any beauty contests...

It is very pretty!  Needs a comment though :-)


Segher
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
