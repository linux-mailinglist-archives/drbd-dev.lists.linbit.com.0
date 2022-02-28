Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4FB4C855E
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 08:41:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2B5B4217CE;
	Tue,  1 Mar 2022 08:40:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 384 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 23:58:05 CET
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
	[185.70.41.104])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0AA2D42178C
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 23:58:04 +0100 (CET)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
	[51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4K6wbM1YPJz4wyMw
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 22:51:11 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (2048-bit key) header.d=protonmail.com
	header.i=@protonmail.com header.b="cBGwkD0d"
Date: Mon, 28 Feb 2022 22:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1646088609;
	bh=EcotLxkQaYgY6ajZYic/GfxM/AoG16BTcQ37oNetF9g=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	Message-ID;
	b=cBGwkD0dY6C6UZ8ZjhjHcbwM06BMDKF9S/uxRi+rS2UvdSsFLFOG1HSm6qlJyiCUO
	uC1XgssvVNSFSsxdHJ1aOl5NwIA18vjg17jCvCkv13dOUO+5hOt3OCcfXLX2AxvryX
	lsXEg4vAoBljMT4ewAP2cK1EUDuyezakLW8pnSEAczd9xFJNkZ4Y3ZLxhFb22yslY3
	3xdTS3cTZ9GeOv+wrf2xTPfY4Kamc1tDDmDy3yCaRm+7b1f1xP0Y+5xR0FjORV+5kM
	cK85iRo45YcxaJSZ64KqeuDyrCIZDsEiDwE78vJR0ycrL/ZWpMTXDPzJnBHTv4Qo8t
	TiTx0AcdTLM/g==
To: James Bottomley <James.Bottomley@HansenPartnership.com>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Message-ID: <Ax76nlte5gO6McgVlkdlM8SHBdfYoG0hb6pFO3MJ6iEg3VCk3kzPWFQ6HS2uVDB8eeyLSr4ku62pXF-FrsROsQvF_VDAW1I5lXTFZTkkMfk=@protonmail.com>
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
	<7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
	<73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch
X-Mailman-Approved-At: Tue, 01 Mar 2022 08:40:57 +0100
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
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
	Linus Torvalds <torvalds@linux-foundation.org>,
	=?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
	after loop body as a ptr
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

SGkKCgoyMDIyLiBmZWJydcOhciAyOC4sIGjDqXRmxZEgMjM6Mjgga2VsdGV6w6lzc2VsLCBKYW1l
cyBCb3R0b21sZXkgw61ydGE6Cj4gWy4uLl0KPiBXZWxsLCB5ZXMsIGJ1dCBteSBvYmplY3Rpb24g
aXMgbW9yZSB0byB0aGUgc2l6ZSBvZiBjaHVybiB0aGFuIHRoZQo+IGRlc2lyZSB0byBkbyBsb29w
IGxvY2FsLiAgSSdtIG5vdCBldmVuIHN1cmUgbG9vcCBsb2NhbCBpcyBwb3NzaWJsZSwKPiBiZWNh
dXNlIGl0J3MgYWx3YXlzIGFubm95ZWQgbWUgdGhhdCBmb3IgKGludCBpID0gMDsgLi4uICBpbiBD
KysgZGVmaW5lcwo+IGkgaW4gdGhlIG91dGVyIHNjb3BlIG5vdCB0aGUgbG9vcCBzY29wZSwgd2hp
Y2ggaXMgd2h5IEkgbmV2ZXIgdXNlIGl0LgoKSXQgaXMgYXJndWFibHkgb2ZmLXRvcGljIHRvIHRo
ZSBkaXNjdXNzaW9uIGF0IGhhbmQsIGJ1dCBJIHRoaW5rIHlvdSBtaWdodCBiZQp0aGlua2luZyBv
ZiBzb21ldGhpbmcgZWxzZSAob3IgbWF5YmUgaXQgd2FzIHRoZSBjYXNlIGluIGFuIGFuY2llbnQg
dmVyc2lvbiBvZiBDKyspCmJlY2F1c2UgdGhhdCBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgY2FzZS4g
SWYgaXQgd2VyZSwKCiAgZm9yIChpbnQgaSAuLi4pIHsgLi4uIH0KICBmb3IgKGludCBpIC4uLikg
eyAuLi4gfQoKd291bGQgaGF2ZSB0byB0cmlnZ2VyIGEgcmVkZWNsYXJhdGlvbiBlcnJvciwgYnV0
IHRoYXQgaGFwcGVucyBuZWl0aGVyIGluIEMrKyBub3IgaW4gQy4KVGhlIHZhcmlhYmxlIGlzIGFs
c28gaW5hY2Nlc3NpYmxlIG91dHNpZGUgdGhlIGxvb3AuCgoKPiBbLi4uXQoKClJlZ2FyZHMsCkJh
cm5hYsOhcyBQxZFjemUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0
cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
