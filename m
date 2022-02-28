Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817B4C7D45
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 23:29:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7FEBD421793;
	Mon, 28 Feb 2022 23:29:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
	[96.44.175.130])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A7F594201F2
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 23:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1646087344;
	bh=gnitHaDoKtFYFmdfHx7ZmUK+2K99mC4OdMWiGF3yqts=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=aDv+zUJMVLbpHnTobs88HMeKXt8e/Fsm3NyltqbtXmut8dDpKPmgZQHvU7CQAhpxT
	x8yyOH8cKkqI9wCCVd7mWgGGPtOdFvurEvTcoJzgoG8F+eqVyUcxI30U1Z3UyKmv+s
	JFRv6cmaJ/MAgdj571KO+Pve8Zec5bTLqNmzMPjU=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2FE4A1281036; 
	Mon, 28 Feb 2022 17:29:04 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UdsLtl38GfVe; Mon, 28 Feb 2022 17:29:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1646087343;
	bh=gnitHaDoKtFYFmdfHx7ZmUK+2K99mC4OdMWiGF3yqts=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=u33hwQnb0VqdOXP8ulufSc5IRuZCZipVBGZNcGF9+k1EE0TmKFXpcGOMGd4fMwEgO
	9syQhDBoNk9Z7GUqfbwA47rALQtXFHUxFeSSP/G0sxjEsJWs9EMuAmppU6twhzQzk+
	fAgT3F3AJIbVTwM2ufsCoBYKhhHBSRhleqdyR2l4=
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:5c4:4300:c551::527])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	C21DB1280D34; Mon, 28 Feb 2022 17:28:59 -0500 (EST)
Message-ID: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mike Rapoport <rppt@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 17:28:58 -0500
In-Reply-To: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
	<7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
User-Agent: Evolution 3.34.4 
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
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gTW9uLCAyMDIyLTAyLTI4IGF0IDIzOjU5ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+
IAo+IE9uIEZlYnJ1YXJ5IDI4LCAyMDIyIDEwOjQyOjUzIFBNIEdNVCswMjowMCwgSmFtZXMgQm90
dG9tbGV5IDwKPiBKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPiB3cm90ZToK
PiA+IE9uIE1vbiwgMjAyMi0wMi0yOCBhdCAyMTowNyArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3
cm90ZToKWy4uLl0KPiA+ID4gPiBJIGRvIHdpc2ggd2UgY291bGQgYWN0dWFsbHkgcG9pc29uIHRo
ZSAncG9zJyB2YWx1ZSBhZnRlciB0aGUKPiA+ID4gPiBsb29wIHNvbWVob3cgLSBidXQgY2xlYXJs
eSB0aGUgIm1pZ2h0IGJlIHVuaW5pdGlhbGl6ZWQiIEkgd2FzCj4gPiA+ID4gaG9waW5nIGZvciBp
c24ndCB0aGUgd2F5IHRvIGRvIGl0Lgo+ID4gPiA+IAo+ID4gPiA+IEFueWJvZHkgaGF2ZSBhbnkg
aWRlYXM/Cj4gPiA+IAo+ID4gPiBJIHRoaW5rIHdlIHNob3VsZCBsb29rIGF0IHRoZSB1c2UgY2Fz
ZXMgd2h5IGNvZGUgaXMgdG91Y2hpbmcKPiA+ID4gKHBvcykgYWZ0ZXIgdGhlIGxvb3AuCj4gPiA+
IAo+ID4gPiBKdXN0IGZyb20gc2tpbW1pbmcgb3ZlciB0aGUgcGF0Y2hlcyB0byBjaGFuZ2UgdGhp
cyBhbmQgZXhwZXJpZW5jZQo+ID4gPiB3aXRoIHRoZSBkcml2ZXJzL3N1YnN5c3RlbXMgSSBoZWxw
IHRvIG1haW50YWluIEkgdGhpbmsgdGhlCj4gPiA+IHByaW1hcnkgcGF0dGVybiBsb29rcyBzb21l
dGhpbmcgbGlrZSB0aGlzOgo+ID4gPiAKPiA+ID4gbGlzdF9mb3JfZWFjaF9lbnRyeShlbnRyeSwg
aGVhZCwgbWVtYmVyKSB7Cj4gPiA+ICAgICAgaWYgKHNvbWVfY29uZGl0aW9uX2NoZWNraW5nKGVu
dHJ5KSkKPiA+ID4gICAgICAgICAgYnJlYWs7Cj4gPiA+IH0KPiA+ID4gZG9fc29tZXRoaW5nX3dp
dGgoZW50cnkpOwo+ID4gCj4gPiBBY3R1YWxseSwgd2UgdXN1YWxseSBoYXZlIGEgY2hlY2sgdG8g
c2VlIGlmIHRoZSBsb29wIGZvdW5kCj4gPiBhbnl0aGluZywgYnV0IGluIHRoYXQgY2FzZSBpdCBz
aG91bGQgc29tZXRoaW5nIGxpa2UKPiA+IAo+ID4gaWYgKGxpc3RfZW50cnlfaXNfaGVhZChlbnRy
eSwgaGVhZCwgbWVtYmVyKSkgewo+ID4gICAgcmV0dXJuIHdpdGggZXJyb3I7Cj4gPiB9Cj4gPiBk
b19zb21ldGhpbl93aXRoKGVudHJ5KTsKPiA+IAo+ID4gU3VmZmljZT8gIFRoZSBsaXN0X2VudHJ5
X2lzX2hlYWQoKSBtYWNybyBpcyBkZXNpZ25lZCB0byBjb3BlIHdpdGgKPiA+IHRoZSBib2d1cyBl
bnRyeSBvbiBoZWFkIHByb2JsZW0uCj4gCj4gV29uJ3Qgc3VmZmljZSBiZWNhdXNlIHRoZSBlbmQg
Z29hbCBvZiB0aGlzIHdvcmsgaXMgdG8gbGltaXQgc2NvcGUgb2YKPiBlbnRyeSBvbmx5IHRvIGxv
b3AuIEhlbmNlIHRoZSBuZWVkIGZvciBhZGRpdGlvbmFsIHZhcmlhYmxlLgoKV2VsbCwgeWVzLCBi
dXQgbXkgb2JqZWN0aW9uIGlzIG1vcmUgdG8gdGhlIHNpemUgb2YgY2h1cm4gdGhhbiB0aGUKZGVz
aXJlIHRvIGRvIGxvb3AgbG9jYWwuICBJJ20gbm90IGV2ZW4gc3VyZSBsb29wIGxvY2FsIGlzIHBv
c3NpYmxlLApiZWNhdXNlIGl0J3MgYWx3YXlzIGFubm95ZWQgbWUgdGhhdCBmb3IgKGludCBpID0g
MDsgLi4uICBpbiBDKysgZGVmaW5lcwppIGluIHRoZSBvdXRlciBzY29wZSBub3QgdGhlIGxvb3Ag
c2NvcGUsIHdoaWNoIGlzIHdoeSBJIG5ldmVyIHVzZSBpdC4KCkhvd2V2ZXIsIGlmIHRoZSBkZXNp
cmUgaXMgcmVhbGx5IHRvIHBvaXNvbiB0aGUgbG9vcCB2YXJpYWJsZSB0aGVuIHdlCmNhbiBkbwoK
I2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcywgaGVhZCwgbWVtYmVyKQkJCQlcCglmb3Ig
KHBvcyA9IGxpc3RfZmlyc3RfZW50cnkoaGVhZCwgdHlwZW9mKCpwb3MpLCBtZW1iZXIpOwlcCgkg
ICAgICFsaXN0X2VudHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpICYmICgocG9zID0gTlVM
TCkgPT0gTlVMTDsJCQlcCgkgICAgIHBvcyA9IGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikp
CgpXaGljaCB3b3VsZCBhdCBsZWFzdCBzZXQgcG9zIHRvIE5VTEwgd2hlbiB0aGUgbG9vcCBjb21w
bGV0ZXMuCgo+IEJlc2lkZXMsIHRoZXJlIGFyZSBubyBndWFyYW50ZWVzIHRoYXQgcGVvcGxlIHdv
bid0Cj4gZG9fc29tZXRoaW5nX3dpdGgoZW50cnkpIHdpdGhvdXQgdGhlIGNoZWNrIG9yIHdvbid0
IGNvbXBhcmUgZW50cnkgdG8KPiBOVUxMIHRvIGNoZWNrIGlmIHRoZSBsb29wIGZpbmlzaGVkIHdp
dGggYnJlYWsgb3Igbm90LgoKSSBnZXQgdGhlIHdpZGVyIGdvYWwsIGJ1dCB3ZSBoYXZlIHRvIHBh
dGNoIHRoZSBwcm9ibGVtIGNhc2VzIG5vdyBhbmQgYQpzaW1wbGUgb25lLWxpbmVyIGlzIGJldHRl
ciB0aGFuIGEgbGFyZ2VyIHBhdGNoIHRoYXQgbWF5IG9yIG1heSBub3Qgd29yawppZiB3ZSBldmVy
IGFjaGlldmUgdGhlIGxvY2FsIGRlZmluaXRpb24gb3IgdmFsdWUgcG9pc29uaW5nIGlkZWEuICBJ
J20KYWxzbyBmYWlybHkgY2VydGFpbiBjb2NjaW5lbGxlIGNhbiBjb21lIHVwIHdpdGggYSB1c2Ug
d2l0aG91dCBjaGVja2luZwpmb3IgbG9vcCBjb21wbGV0aW9uIHNlbWFudGljIHBhdGNoIHdoaWNo
IHdlIGNhbiBhZGQgdG8gMGRheS4KCkphbWVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3Rz
LmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJi
ZC1kZXYK
