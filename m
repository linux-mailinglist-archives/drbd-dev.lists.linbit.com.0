Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05B4C77B5
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 19:27:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 017E3421780;
	Mon, 28 Feb 2022 19:27:30 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 361 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 19:27:28 CET
Received: from relay4.hostedemail.com (relay4.hostedemail.com [64.99.140.36])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 343AA42177D
	for <drbd-dev@lists.linbit.com>;
	Mon, 28 Feb 2022 19:27:27 +0100 (CET)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id 8480C81766;
	Mon, 28 Feb 2022 18:20:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
	omf09.hostedemail.com (Postfix) with ESMTPA id 5C4272002A; 
	Mon, 28 Feb 2022 18:20:29 +0000 (UTC)
Message-ID: <0be9de3920442df490f01b6fb1c42521c3de6190.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Jakob Koschel
	<jakobkoschel@gmail.com>
Date: Mon, 28 Feb 2022 10:20:28 -0800
In-Reply-To: <20220228112413.GA2812@kadam>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-2-jakobkoschel@gmail.com>
	<20220228112413.GA2812@kadam>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: 1e1i8ombnsc3cdkptu3anccezjc89zox
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5C4272002A
X-Spam-Status: No, score=0.10
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+i6vY6IDwHpNq++UEo/5hqvP4PvgQNb4E=
X-HE-Tag: 1646072429-12569
Cc: v9fs-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Villemoes <linux@rasmusvillemoes.dk>, alsa-devel@alsa-project.org,
	dri-devel@lists.freedesktop.org,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
	Mike@linbit.com, kvm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
	"Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
	intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com, Rasmus@linbit.com,
	linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Arnd@linbit.com,
	linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
	linux-block@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 1/6] drivers: usb: remove usage of list
 iterator past the loop body
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

On Mon, 2022-02-28 at 14:24 +0300, Dan Carpenter wrote:

> a multi-line indent gets curly braces for readability even though
> it's not required by C.  And then both sides would get curly braces.

That's more your personal preference than a coding style guideline.


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
