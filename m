Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD405FD2B7
	for <lists+drbd-dev@lfdr.de>; Thu, 13 Oct 2022 03:37:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BB8F420960;
	Thu, 13 Oct 2022 03:37:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
	[216.40.44.13])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6D48420372
	for <drbd-dev@lists.linbit.com>; Thu, 13 Oct 2022 03:37:33 +0200 (CEST)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 640C9120237;
	Thu, 13 Oct 2022 01:37:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
	omf20.hostedemail.com (Postfix) with ESMTPA id 56EDD20026; 
	Thu, 13 Oct 2022 01:37:01 +0000 (UTC)
Message-ID: <3f527ec95a12135eb40f5f2d156a2954feb7fbfe.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: David Laight <David.Laight@ACULAB.COM>, "Jason A. Donenfeld"
	<Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Date: Wed, 12 Oct 2022 18:37:11 -0700
In-Reply-To: <d45bd258e033453b85a137112e7694e1@AcuMS.aculab.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
	<20221005214844.2699-4-Jason@zx2c4.com>
	<f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel@perches.com>
	<d45bd258e033453b85a137112e7694e1@AcuMS.aculab.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=0.88
X-Stat-Signature: jmxt1u5agdpi9w76hr4tp6uotie3p373
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 56EDD20026
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18KEIRmyyr9pSEavQqF5X0dTzAEITyiJq4=
X-HE-Tag: 1665625021-540494
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"dev@openvswitch.org" <dev@openvswitch.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"dccp@vger.kernel.org" <dccp@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	"lvs-devel@vger.kernel.org" <lvs-devel@vger.kernel.org>,
	"coreteam@netfilter.org" <coreteam@netfilter.org>,
	"netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
	"brcm80211-dev-list.pdl@broadcom.com"
	<brcm80211-dev-list.pdl@broadcom.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"cake@lists.bufferbloat.net" <cake@lists.bufferbloat.net>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"SHA-cyfmac-dev-list@infineon.com" <SHA-cyfmac-dev-list@infineon.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Drbd-dev] [PATCH v1 3/5] treewide: use get_random_u32() when
	possible
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

On Wed, 2022-10-12 at 21:29 +0000, David Laight wrote:
> From: Joe Perches
> > Sent: 12 October 2022 20:17
> > 
> > On Wed, 2022-10-05 at 23:48 +0200, Jason A. Donenfeld wrote:
> > > The prandom_u32() function has been a deprecated inline wrapper around
> > > get_random_u32() for several releases now, and compiles down to the
> > > exact same code. Replace the deprecated wrapper with a direct call to
> > > the real function.
> > []
> > > diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
> > []
> > > @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
> > >  				   &ep->com.remote_addr;
> > >  	int ret;
> > >  	enum chip_type adapter_type = ep->com.dev->rdev.lldi.adapter_type;
> > > -	u32 isn = (prandom_u32() & ~7UL) - 1;
> > > +	u32 isn = (get_random_u32() & ~7UL) - 1;
> > 
> > trivia:
> > 
> > There are somewhat odd size mismatches here.
> > 
> > I had to think a tiny bit if random() returned a value from 0 to 7
> > and was promoted to a 64 bit value then truncated to 32 bit.
> > 
> > Perhaps these would be clearer as ~7U and not ~7UL
> 
> That makes no difference - the compiler will generate the same code.

True, more or less.  It's more a question for the reader.

> The real question is WTF is the code doing?

True.

> The '& ~7u' clears the bottom 3 bits.
> The '- 1' then sets the bottom 3 bits and decrements the
> (random) high bits.

Right.

> So is the same as get_random_u32() | 7.

True, it's effectively the same as the upper 29 bits are random
anyway and the bottom 3 bits are always set.

> But I bet the coder had something else in mind.

Likely.

And it was also likely copy/pasted a few times.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
