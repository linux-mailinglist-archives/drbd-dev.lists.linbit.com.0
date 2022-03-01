Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A20E4C8440
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 07:43:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1FCCF4217B9;
	Tue,  1 Mar 2022 07:43:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 629 seconds by postgrey-1.31 at mail19;
	Tue, 01 Mar 2022 07:43:02 CET
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 828D94217B4
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 07:43:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F0DDB816AD;
	Tue,  1 Mar 2022 06:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB1BC340F0;
	Tue,  1 Mar 2022 06:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646116351;
	bh=/Yg/Wtj2qqC5DtZph9xh9a5I6i9ac63I49JjnGAnbz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VNHL/rpf4xC8OfR4t6vo9UDhccraY87hqDEaB5+IcVN4t3xSDpu027UghrvvyPQSS
	4QuUBVLbP+fb/wau99bJi4r7o82Cq8bpmARbff3Kmy/AtDhoQCnd/xuFpD/mZTaTLe
	NB4lRdgymAA7RGUyYzHE9lasNH7iZMQkKEkyzKBO3tOdshLibbcwpXFMt0/8PjfBOI
	eBOAlJkJQ4cQoPLzxj+EO1bIuaMcgSLjX7K2SicEKpT/LLsGPP1i6N98tAlqdrYU3i
	Kp9mElgbXeQQFbCmQa35pv8BJ12s3DBVkk5Xbz9WcUOYNg9YRr2X/a7+Y15htjkLBQ
	B1WsfW9PNeplw==
Date: Mon, 28 Feb 2022 22:32:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20220228223228.24cf3fd4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	<CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
	<FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
	<CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
MIME-Version: 1.0
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	"Bos,  H.J." <h.j.bos@vu.nl>, linux1394-devel@lists.sourceforge.net,
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>,
	linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>, Arnd@linbit.com,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, dma <dmaengine@vger.kernel.org>,
	linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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

On Mon, 28 Feb 2022 16:41:04 -0800 Linus Torvalds wrote:
> So yes, initially my idea had been to just move the iterator entirely
> inside the macro. But specifying the type got so ugly that I think
> that
> 
>         typeof (pos) pos
> 
> trick inside the macro really ends up giving us the best of all worlds:
> 
>  (a) let's us keep the existing syntax and code for all the nice cases
> that did everything inside the loop anyway
> 
>  (b) gives us a nice warning for any normal use-after-loop case
> (unless you explicitly initialized it like that
> sgx_mmu_notifier_release() function did for no good reason
> 
>  (c) also guarantees that even if you don't get a warning,
> non-converted (or newly written) bad code won't actually _work_
> 
> so you end up getting the new rules without any ambiguity or mistaken

I presume the goal is that we can do this without changing existing
code? Otherwise actually moving the iterator into the loop body would
be an option, by creating a different hidden variable:

#define list_iter(head)						\
	for (struct list head *_l = (head)->next; _l != (head); _l = _l->next)

#define list_iter_entry(var, member)		\
	list_entry(_l, typeof(*var), member)


	list_iter(&p->a_head) {
		struct entry *e = list_iter_entry(e, a_member);

		/* use e->... */
	}


Or we can slide into soft insanity and exploit one of Kees'es tricks
to encode the type of the entries "next to" the head:

#define LIST_HEAD_MEM(name, type)			\
	union {						\
		struct list_head name;			\
		type *name ## _entry;			\
	}

struct entry {
	struct list_head a_member;
};

struct parent {
	LIST_HEAD_MEM(a_head, struct entry);
};

#define list_for_each_magic(pos, head, member)				\
	for (typeof(**(head ## _entry)) *pos = list_first_entry(head, typeof(**(head ## _entry)), member); \
	     &pos->member != (head);					\
	     pos = list_next_entry(pos, member))


	list_for_each_magic(e, &p->a_head, a_member) {
		/* use e->... */
	}


I'll show myself out...
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
