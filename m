Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDC4C7A9C
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 21:38:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B1BF7421784;
	Mon, 28 Feb 2022 21:38:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1268 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 21:38:20 CET
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B846542177F
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 21:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gzmb9gGTyCSEGFZjR7TUOSRZ1bWW/G5bAVEV+T9ChYA=;
	b=HMc4MBy8Vzw7Zw6bzwiCq0vper
	wGe8MnGgfy3P9tw37992OGwcjtB/nFZdz8dqNima3vpVALFvZyXZ3FLoo4RUIh3Ab9CrQCeBzKMqY
	Ctk97R68KJQlQYl84mgCzKSPEBlsm5unT7lh2/ssDfpaJ9kijdyJZ7M9Gq/AZ9YISpkY4qwyvfd22
	UNXuHqD0QUEzQlXJX3VELz7E5j90JJI15fiDqKM4f3XzpVoGyrKZNwsue1ODaw91KQCRdaBoqAoRS
	K+CsuK7iyfWO24fTeFRAPdlXgnD6RcCDMvrfP15+eL0CkbNFD8MwWSyqHmDh8nTOhNkj6bmyxGR8R
	ZvPOqL+g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nOmRT-008sRP-GZ; Mon, 28 Feb 2022 20:16:23 +0000
Date: Mon, 28 Feb 2022 20:16:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Yh0tl3Lni4weIMkl@casper.infradead.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	<CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos,
	H.J." <h.j.bos@vu.nl>, linux1394-devel@lists.sourceforge.net,
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
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
	Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Mon, Feb 28, 2022 at 12:10:24PM -0800, Linus Torvalds wrote:
> We can do
> 
>         typeof(pos) pos
> 
> in the 'for ()' loop, and never use __iter at all.
> 
> That means that inside the for-loop, we use a _different_ 'pos' than outside.

Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
it catches real bugs.

> +#define list_for_each_entry(pos, head, member)					\
> +	for (typeof(pos) pos = list_first_entry(head, typeof(*pos), member);	\
> +	     !list_entry_is_head(pos, head, member);	\
>  	     pos = list_next_entry(pos, member))
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
