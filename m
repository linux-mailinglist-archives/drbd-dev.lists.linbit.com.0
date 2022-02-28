Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F15314C855D
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 08:40:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BD1F4217C9;
	Tue,  1 Mar 2022 08:40:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 373 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 23:07:32 CET
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6990F42006A
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 23:07:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5CBD2B8169B;
	Mon, 28 Feb 2022 22:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677EEC340F1;
	Mon, 28 Feb 2022 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646085677;
	bh=bmzYeqH+wd1Y/i05gxZoeqc9TywPR9wpt0imv9Fx7Nw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=lb9MoeFhEeGqaET4WoooJnliR/Aftbuf2qgeJWcsJRMUD7lxaPDCkpbBw1fltPmKc
	jIEBu8SnVjgO3Aaf+8FYuXvVgG5MgAciJgva3R/8WVNn/ktDFk3hANDz2GKUoZWtxI
	SvipV/Wo2m8Yu0T44/FsB9ncJWS6zqb8Cis19xBBpG1gsQAhwdKCM2xymmzy1B6vAh
	NLgpj3CkfoCj7XXB9+t8bZHUSaMtCcXi/0/BYE3ppk5zRyoiwaHoQXmDsDHRdh2g9L
	BKDOg0IEHzQ+qInzyklcGdLSrMWPhR+ZxEuCQewyXU3mL+4cdRVVpWMroWAhmtcL3w
	/5xJdekiDQkIw==
Date: Mon, 28 Feb 2022 23:59:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	=?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
	Linus	Torvalds <torvalds@linux-foundation.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
Message-ID: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
MIME-Version: 1.0
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

CgpPbiBGZWJydWFyeSAyOCwgMjAyMiAxMDo0Mjo1MyBQTSBHTVQrMDI6MDAsIEphbWVzIEJvdHRv
bWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4gd3JvdGU6Cj5PbiBN
b24sIDIwMjItMDItMjggYXQgMjE6MDcgKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDI4LjAyLjIyIHVtIDIwOjU2IHNjaHJpZWIgTGludXMgVG9ydmFsZHM6Cj4+ID4gT24gTW9u
LCBGZWIgMjgsIDIwMjIgYXQgNDoxOSBBTSBDaHJpc3RpYW4gS8O2bmlnCj4+ID4gPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgdXNpbmcg
dGhlIGV4dHJhIHZhcmlhYmxlIG1ha2VzIHRoZSBjb2RlIGluIGFueQo+PiA+ID4gd2F5Cj4+ID4g
PiBtb3JlIHJlbGlhYmxlIG9yIGVhc2llciB0byByZWFkLgo+PiA+IFNvIEkgdGhpbmsgdGhlIG5l
eHQgc3RlcCBpcyB0byBkbyB0aGUgYXR0YWNoZWQgcGF0Y2ggKHdoaWNoCj4+ID4gcmVxdWlyZXMK
Pj4gPiB0aGF0ICItc3RkPWdudTExIiB0aGF0IHdhcyBkaXNjdXNzZWQgaW4gdGhlIG9yaWdpbmFs
IHRocmVhZCkuCj4+ID4gCj4+ID4gVGhhdCB3aWxsIGd1YXJhbnRlZSB0aGF0IHRoZSAncG9zJyBw
YXJhbWV0ZXIgb2YKPj4gPiBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkKPj4gPiBpcyBvbmx5IHVwZGF0
ZWQgSU5TSURFIHRoZSBmb3JfZWFjaF9saXN0X2VudHJ5KCkgbG9vcCwgYW5kIGNhbgo+PiA+IG5l
dmVyCj4+ID4gcG9pbnQgdG8gdGhlICh3cm9uZ2x5IHR5cGVkKSBoZWFkIGVudHJ5Lgo+PiA+IAo+
PiA+IEFuZCBJIHdvdWxkIGFjdHVhbGx5IGhvcGUgdGhhdCBpdCBzaG91bGQgYWN0dWFsbHkgY2F1
c2UgY29tcGlsZXIKPj4gPiB3YXJuaW5ncyBhYm91dCBwb3NzaWJseSB1bmluaXRpYWxpemVkIHZh
cmlhYmxlcyBpZiBwZW9wbGUgdGhlbiB1c2UKPj4gPiB0aGUKPj4gPiAncG9zJyBwb2ludGVyIG91
dHNpZGUgdGhlIGxvb3AuIEV4Y2VwdAo+PiA+IAo+PiA+ICAgKGEpIHRoYXQgY29kZSBpbiBzZ3gv
ZW5jbC5jIGN1cnJlbnRseSBpbml0aWFsaXplcyAndG1wJyB0byBOVUxMCj4+ID4gZm9yCj4+ID4g
aW5leHBsaWNhYmxlIHJlYXNvbnMgLSBwb3NzaWJseSBiZWNhdXNlIGl0IGFscmVhZHkgZXhwZWN0
ZWQgdGhpcwo+PiA+IGJlaGF2aW9yCj4+ID4gCj4+ID4gICAoYikgd2hlbiBJIHJlbW92ZSB0aGF0
IE5VTEwgaW5pdGlhbGl6ZXIsIEkgc3RpbGwgZG9uJ3QgZ2V0IGEKPj4gPiB3YXJuaW5nLAo+PiA+
IGJlY2F1c2Ugd2UndmUgZGlzYWJsZWQgLVduby1tYXliZS11bmluaXRpYWxpemVkIHNpbmNlIGl0
IHJlc3VsdHMgaW4KPj4gPiBzbwo+PiA+IG1hbnkgZmFsc2UgcG9zaXRpdmVzLgo+PiA+IAo+PiA+
IE9oIHdlbGwuCj4+ID4gCj4+ID4gQW55d2F5LCBnaXZlIHRoaXMgcGF0Y2ggYSBsb29rLCBhbmQg
YXQgbGVhc3QgaWYgaXQncyBleHBhbmRlZCB0byBkbwo+PiA+ICIocG9zKSA9IE5VTEwiIGluIHRo
ZSBlbnRyeSBzdGF0ZW1lbnQgZm9yIHRoZSBmb3ItbG9vcCwgaXQgd2lsbAo+PiA+IGF2b2lkIHRo
ZSBIRUFEIHR5cGUgY29uZnVzaW9uIHRoYXQgSmFrb2IgaXMgd29ya2luZyBvbi4gQW5kIEkgdGhp
bmsKPj4gPiBpbiBhIGNsZWFuZXIgd2F5IHRoYW4gdGhlIGhvcnJpZCBnYW1lcyBoZSBwbGF5cy4K
Pj4gPiAKPj4gPiAoQnV0IGl0IHdvbid0IGF2b2lkIHBvc3NpYmxlIENQVSBzcGVjdWxhdGlvbiBv
ZiBzdWNoIHR5cGUKPj4gPiBjb25mdXNpb24uIFRoYXQsIGluIG15IG9waW5pb24sIGlzIGEgY29t
cGxldGVseSBkaWZmZXJlbnQgaXNzdWUpCj4+IAo+PiBZZXMsIGNvbXBsZXRlbHkgYWdyZWUuCj4+
IAo+PiA+IEkgZG8gd2lzaCB3ZSBjb3VsZCBhY3R1YWxseSBwb2lzb24gdGhlICdwb3MnIHZhbHVl
IGFmdGVyIHRoZSBsb29wCj4+ID4gc29tZWhvdyAtIGJ1dCBjbGVhcmx5IHRoZSAibWlnaHQgYmUg
dW5pbml0aWFsaXplZCIgSSB3YXMgaG9waW5nIGZvcgo+PiA+IGlzbid0IHRoZSB3YXkgdG8gZG8g
aXQuCj4+ID4gCj4+ID4gQW55Ym9keSBoYXZlIGFueSBpZGVhcz8KPj4gCj4+IEkgdGhpbmsgd2Ug
c2hvdWxkIGxvb2sgYXQgdGhlIHVzZSBjYXNlcyB3aHkgY29kZSBpcyB0b3VjaGluZyAocG9zKQo+
PiBhZnRlciB0aGUgbG9vcC4KPj4gCj4+IEp1c3QgZnJvbSBza2ltbWluZyBvdmVyIHRoZSBwYXRj
aGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4+IHdpdGggdGhlIGRyaXZlcnMvc3Vi
c3lzdGVtcyBJIGhlbHAgdG8gbWFpbnRhaW4gSSB0aGluayB0aGUgcHJpbWFyeQo+PiBwYXR0ZXJu
IGxvb2tzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+IAo+PiBsaXN0X2Zvcl9lYWNoX2VudHJ5KGVu
dHJ5LCBoZWFkLCBtZW1iZXIpIHsKPj4gICAgICBpZiAoc29tZV9jb25kaXRpb25fY2hlY2tpbmco
ZW50cnkpKQo+PiAgICAgICAgICBicmVhazsKPj4gfQo+PiBkb19zb21ldGhpbmdfd2l0aChlbnRy
eSk7Cj4KPgo+QWN0dWFsbHksIHdlIHVzdWFsbHkgaGF2ZSBhIGNoZWNrIHRvIHNlZSBpZiB0aGUg
bG9vcCBmb3VuZCBhbnl0aGluZywKPmJ1dCBpbiB0aGF0IGNhc2UgaXQgc2hvdWxkIHNvbWV0aGlu
ZyBsaWtlCj4KPmlmIChsaXN0X2VudHJ5X2lzX2hlYWQoZW50cnksIGhlYWQsIG1lbWJlcikpIHsK
PiAgICByZXR1cm4gd2l0aCBlcnJvcjsKPn0KPmRvX3NvbWV0aGluX3dpdGgoZW50cnkpOwo+Cj5T
dWZmaWNlPyAgVGhlIGxpc3RfZW50cnlfaXNfaGVhZCgpIG1hY3JvIGlzIGRlc2lnbmVkIHRvIGNv
cGUgd2l0aCB0aGUKPmJvZ3VzIGVudHJ5IG9uIGhlYWQgcHJvYmxlbS4KCldvbid0IHN1ZmZpY2Ug
YmVjYXVzZSB0aGUgZW5kIGdvYWwgb2YgdGhpcyB3b3JrIGlzIHRvIGxpbWl0IHNjb3BlIG9mIGVu
dHJ5IG9ubHkgdG8gbG9vcC4gSGVuY2UgdGhlIG5lZWQgZm9yIGFkZGl0aW9uYWwgdmFyaWFibGUu
CgpCZXNpZGVzLCB0aGVyZSBhcmUgbm8gZ3VhcmFudGVlcyB0aGF0IHBlb3BsZSB3b24ndCBkb19z
b21ldGhpbmdfd2l0aChlbnRyeSkgd2l0aG91dCB0aGUgY2hlY2sgb3Igd29uJ3QgY29tcGFyZSBl
bnRyeSB0byBOVUxMIHRvIGNoZWNrIGlmIHRoZSBsb29wIGZpbmlzaGVkIHdpdGggYnJlYWsgb3Ig
bm90LgoKPkphbWVzCgoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJi
ZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kcmJkLWRldgo=
