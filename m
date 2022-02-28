Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 604FA4C7B74
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 22:13:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4866442178F;
	Mon, 28 Feb 2022 22:13:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
	[96.44.175.130])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5880C420365
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 22:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1646082795;
	bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fTQp+HhEyDWfdTRw9MD74D4dNoy4lJbDD6ufhn8pOCgDG9LKN5I5E2XfQsXuEnTyE
	o41BjR/wB9Zx796mcVO5HItpPdbUBqFA5gZFvpxw0W0+8SaIBYecaW0t63X4w0ysYd
	Uxmzs2O4chqjQ5mD0m0R9/q9wYnJ2eru8WGs04Zw=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id EE6F612811CE; 
	Mon, 28 Feb 2022 16:13:15 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fdilm1jMyJ2v; Mon, 28 Feb 2022 16:13:15 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1646082795;
	bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fTQp+HhEyDWfdTRw9MD74D4dNoy4lJbDD6ufhn8pOCgDG9LKN5I5E2XfQsXuEnTyE
	o41BjR/wB9Zx796mcVO5HItpPdbUBqFA5gZFvpxw0W0+8SaIBYecaW0t63X4w0ysYd
	Uxmzs2O4chqjQ5mD0m0R9/q9wYnJ2eru8WGs04Zw=
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:5c4:4300:c551::527])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	980CE1280320; Mon, 28 Feb 2022 16:13:11 -0500 (EST)
Message-ID: <ade13f419519350e460e7ef1e64477ec72e828ed.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Linus
	Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:13:09 -0500
In-Reply-To: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
	<0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
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
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gTW9uLCAyMDIyLTAyLTI4IGF0IDIxOjU2ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IAo+IEFtIDI4LjAyLjIyIHVtIDIxOjQyIHNjaHJpZWIgSmFtZXMgQm90dG9tbGV5Ogo+ID4g
T24gTW9uLCAyMDIyLTAyLTI4IGF0IDIxOjA3ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+ID4gPiBBbSAyOC4wMi4yMiB1bSAyMDo1NiBzY2hyaWViIExpbnVzIFRvcnZhbGRzOgo+ID4g
PiA+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDQ6MTkgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4g
PiA+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4gPiA+IFtTTklQXQo+ID4g
PiA+IEFueWJvZHkgaGF2ZSBhbnkgaWRlYXM/Cj4gPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIGxvb2sg
YXQgdGhlIHVzZSBjYXNlcyB3aHkgY29kZSBpcyB0b3VjaGluZwo+ID4gPiAocG9zKQo+ID4gPiBh
ZnRlciB0aGUgbG9vcC4KPiA+ID4gCj4gPiA+IEp1c3QgZnJvbSBza2ltbWluZyBvdmVyIHRoZSBw
YXRjaGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4gPiA+IHdpdGggdGhlIGRyaXZl
cnMvc3Vic3lzdGVtcyBJIGhlbHAgdG8gbWFpbnRhaW4gSSB0aGluayB0aGUKPiA+ID4gcHJpbWFy
eSBwYXR0ZXJuIGxvb2tzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPiA+IAo+ID4gPiBsaXN0X2Zv
cl9lYWNoX2VudHJ5KGVudHJ5LCBoZWFkLCBtZW1iZXIpIHsKPiA+ID4gICAgICAgaWYgKHNvbWVf
Y29uZGl0aW9uX2NoZWNraW5nKGVudHJ5KSkKPiA+ID4gICAgICAgICAgIGJyZWFrOwo+ID4gPiB9
Cj4gPiA+IGRvX3NvbWV0aGluZ193aXRoKGVudHJ5KTsKPiA+IAo+ID4gQWN0dWFsbHksIHdlIHVz
dWFsbHkgaGF2ZSBhIGNoZWNrIHRvIHNlZSBpZiB0aGUgbG9vcCBmb3VuZAo+ID4gYW55dGhpbmcs
IGJ1dCBpbiB0aGF0IGNhc2UgaXQgc2hvdWxkIHNvbWV0aGluZyBsaWtlCj4gPiAKPiA+IGlmIChs
aXN0X2VudHJ5X2lzX2hlYWQoZW50cnksIGhlYWQsIG1lbWJlcikpIHsKPiA+ICAgICAgcmV0dXJu
IHdpdGggZXJyb3I7Cj4gPiB9Cj4gPiBkb19zb21ldGhpbl93aXRoKGVudHJ5KTsKPiA+IAo+ID4g
U3VmZmljZT8gIFRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBtYWNybyBpcyBkZXNpZ25lZCB0byBj
b3BlIHdpdGgKPiA+IHRoZSBib2d1cyBlbnRyeSBvbiBoZWFkIHByb2JsZW0uCj4gCj4gVGhhdCB3
aWxsIHdvcmsgYW5kIGlzIGFsc28gd2hhdCBwZW9wbGUgYWxyZWFkeSBkby4KPiAKPiBUaGUga2V5
IHByb2JsZW0gaXMgdGhhdCB3ZSBsZXQgcGVvcGxlIGRvIHRoZSBzYW1lIHRoaW5nIG92ZXIgYW5k
Cj4gb3ZlciBhZ2FpbiB3aXRoIHNsaWdodGx5IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMuCj4g
Cj4gT3V0IGluIHRoZSB3aWxkIEkndmUgc2VlbiBhdCBsZWFzdCB1c2luZyBhIHNlcGFyYXRlIHZh
cmlhYmxlLCB1c2luZwo+IGEgYm9vbCB0byBpbmRpY2F0ZSB0aGF0IHNvbWV0aGluZyB3YXMgZm91
bmQgYW5kIGp1c3QgYXNzdW1pbmcgdGhhdAo+IHRoZSBsaXN0IGhhcyBhbiBlbnRyeS4KPiAKPiBU
aGUgbGFzdCBjYXNlIGlzIGJvZ3VzIGFuZCBiYXNpY2FsbHkgd2hhdCBjYW4gYnJlYWsgYmFkbHku
CgpZZXMsIEkgdW5kZXJzdGFuZCB0aGF0LiAgSSdtIHNheWluZyB3ZSBzaG91bGQgcmVwbGFjZSB0
aGF0IGJvZ3VzIGNoZWNrcwpvZiBlbnRyeS0+c29tZXRoaW5nIGFnYWluc3Qgc29tZV92YWx1ZSBs
b29wIHRlcm1pbmF0aW9uIGNvbmRpdGlvbiB3aXRoCnRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBt
YWNyby4gIFRoYXQgc2hvdWxkIGJlIGEgb25lIGxpbmUgYW5kIGZhaXJseQptZWNoYW5pY2FsIGNo
YW5nZSByYXRoZXIgdGhhbiB0aGUgZXhwbG9zaW9uIG9mIGNvZGUgY2hhbmdlcyB3ZSBzZWVtIHRv
CmhhdmUgaW4gdGhlIHBhdGNoIHNlcmllcy4KCkphbWVzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2
QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZHJiZC1kZXYK
