Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B59BF4CA6F8
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Mar 2022 15:04:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92F654217A2;
	Wed,  2 Mar 2022 15:04:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3828842179A
	for <drbd-dev@lists.linbit.com>; Wed,  2 Mar 2022 15:04:11 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	uk-mta-196-4Li6Fux3PdyQ14Lo-DMf3A-1; Wed, 02 Mar 2022 14:04:10 +0000
X-MC-Unique: 4Li6Fux3PdyQ14Lo-DMf3A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft
	SMTP Server (TLS) id 15.0.1497.28; Wed, 2 Mar 2022 14:04:06 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
	AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
	15.00.1497.028; Wed, 2 Mar 2022 14:04:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Xiaomeng Tong' <xiam0nd.tong@gmail.com>, "torvalds@linux-foundation.org"
	<torvalds@linux-foundation.org>
Thread-Topic: [PATCH 2/6] treewide: remove using list iterator after loop body
	as a ptr
Thread-Index: AQHYLhg9+DU/OogLf0+tiSFmjztyUKysHu+Q
Date: Wed, 2 Mar 2022 14:04:06 +0000
Message-ID: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
References: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
	<20220302093106.8402-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220302093106.8402-1-xiam0nd.tong@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"gustavo@embeddedor.com" <gustavo@embeddedor.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"kgdb-bugreport@lists.sourceforge.net"
	<kgdb-bugreport@lists.sourceforge.net>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"c.giuffrida@vu.nl" <c.giuffrida@vu.nl>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
	"linux1394-devel@lists.sourceforge.net"
	<linux1394-devel@lists.sourceforge.net>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"h.j.bos@vu.nl" <h.j.bos@vu.nl>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>,
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"bjohannesmeyer@gmail.com" <bjohannesmeyer@gmail.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"jakobkoschel@gmail.com" <jakobkoschel@gmail.com>,
	"v9fs-developer@lists.sourceforge.net"
	<v9fs-developer@lists.sourceforge.net>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"rppt@kernel.org" <rppt@kernel.org>
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

From: Xiaomeng Tong
> Sent: 02 March 2022 09:31
> 
> On Mon, 28 Feb 2022 16:41:04 -0800, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But basically to _me_, the important part is that the end result is
> > maintainable longer-term.
> 
> I couldn't agree more. And because of that, I stick with the following
> approach because it's maintainable longer-term than "type(pos) pos" one:
>  Implements a new macro for each list_for_each_entry* with _inside suffix.
>   #define list_for_each_entry_inside(pos, type, head, member)

I think that it would be better to make any alternate loop macro
just set the variable to NULL on the loop exit.
That is easier to code for and the compiler might be persuaded to
not redo the test.

It also doesn't need an extra variable defined in the for() statement
so can be back-ported to older kernels without required declaration
in the middle of blocks.

OTOH there may be alternative definitions that can be used to get
the compiler (or other compiler-like tools) to detect broken code.
Even if the definition can't possibly generate a working kerrnel.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
