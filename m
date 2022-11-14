Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A727C6287B5
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Nov 2022 19:01:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 33BC842066F;
	Mon, 14 Nov 2022 19:01:17 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from fx.arvanta.net (static-213-198-238-194.adsl.eunet.rs
	[213.198.238.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC2BB4203B4
	for <drbd-dev@lists.linbit.com>; Mon, 14 Nov 2022 19:01:14 +0100 (CET)
Received: from m1 (ab.arvanta.net [10.5.1.5])
	by fx.arvanta.net (Postfix) with ESMTP id 1674D283DC;
	Mon, 14 Nov 2022 19:01:14 +0100 (CET)
Date: Mon, 14 Nov 2022 19:01:12 +0100
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: Roland Kammerer <roland.kammerer@linbit.com>
Message-ID: <Y3KCaAhsz9ViOKz9@m1>
References: <Y2j1Lmr2afaEYvBu@m1>
 <Y3IB2V2TXOzNac1H@rck.sh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3IB2V2TXOzNac1H@rck.sh>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [BUG] drbdadm_parser.c:1968:63: error: 'glob_t' has
 no member named 'gl_flags'
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

SGksCgpbIFBsZWFzZSBDYyB0byBtZSwgSSdtIG5vdCBzdWJzY3JpYmVkIHRvIHRoaXMgbWFpbGlu
ZyBsaXN0IF0KCk9uIE1vbiwgMjAyMi0xMS0xNCBhdCAwOTo1MiwgUm9sYW5kIEthbW1lcmVyIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDA3LCAyMDIyIGF0IDAxOjA4OjE0UE0gKzAxMDAsIE1pbGFuIFAu
IFN0YW5pxIcgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gWyBQbGVhc2UgQ2MgdG8gbWUsIEknbSBu
b3Qgc3Vic2NyaWJlZCB0byB0aGlzIG1haWxpbmcgbGlzdCBdCj4gPiAKPiA+IEknbSB0cnlpbmcg
dG8gYnVpbGQgZHJiZC10b29scyA5LjIyLjAgb24gQWxwaW5lIExpbnV4IHdoaWNoIGlzIGJhc2Vk
IG9uCj4gPiBtdXNsIGxpYmMgKGFuZCBub3QgZ2xpYmMpLgo+ID4gCj4gPiBbLi4uXQo+ID4gCj4g
PiBNdXNsIGxpYmMgZ2xvYi5oIGRvZXNuJ3QgaGF2ZSBnbF9mbGFncyBub3IgR0xPQl9NQUdDSEFS
IGJlY2F1c2UgaXQgaXMKPiA+IG5vbiBzdGFuZGFyZCBnbGliYyBleHRlbnNpb24uCj4gCj4gdGhh
bmtzIGZvciByZXBvcnRpbmcsIHRoaXMgc2hvdWxkIGJlIGZpeGVkIGluCj4gaHR0cHM6Ly9naXRo
dWIuY29tL0xJTkJJVC9kcmJkLXV0aWxzL2NvbW1pdC8zM2Q1ZThmNzA2NjExNmJkMGE3MDZjN2Nk
ZGE0OTUwODk1MTY0ZDM0Cj4gCj4gPiBJIHJldmVydGVkIGh0dHBzOi8vZ2l0aHViLmNvbS9MSU5C
SVQvZHJiZC11dGlscy9jb21taXQvNGExYjU5MDA5MGJmNjc2Y2RmYjEwYzE5ODUwNWI5NWI5ZWVi
MzEyMAo+ID4gY29tbWl0IGFuZCB0aGVuIGRyYmQtdG9vbHMgYnVpbGRzIGZpbmUuCj4gPiAKPiA+
IE5vdCBzdXJlIGlzIHRoaXMgcmV2ZXJ0IHNhZmUgdG8gcHVzaCBkcmJkLXV0aWxzIGluIG5leHQg
QWxwaW5lIHJlbGVhc2UKPiA+ICh3aGljaCBwbGFubmVkIGZvciBuZXh0IHdlZWspIG9yIHRoZXJl
IGlzIGJldHRlciBmaXguCj4gCj4gSSB0aGluayByZXZlcnRpbmcgZm9yIG5vdyBpcyBwZXJmZWN0
bHkgZmluZSwgdGhpcyBkZXNlcnZlZCBhIGZpeCwgYnV0IEkKPiBkb24ndCB0aGluayBpdCBhY3R1
YWxseSBoYXBwZW5lZCBpbiB0aGUgd2lsZCB0aGF0IG9mdGVuLi4uIE9yIHlvdSBwaWNrCj4gdGhl
IHByb3Bvc2VkIGZpeCwgd2hpY2ggd291bGQgYmUgYSBnb29kIHRlc3QgZm9yIHVzIGFzIHdlbGwu
IEN1cnJlbnRseQoKSSBwaWNrZWQgYWJvdmUgY29tbWl0IGFuZCBidWlsZCB3aXRoIGl0IHBhc3Nl
ZCBmaW5lLgpUaGFuayB5b3UgZm9yIGZpeC4KCj4gSSdtIG5vdCBzdXJlIHdoZW4gdGhlIG5leHQg
b2ZmaWNpYWwgcmVsZWFzZSB3aWxsIGJlIGRvbmUsIGN1cnJlbnQgZ3V0Cj4gZmVlbGluZyBpcyBu
b3QgZW5vdWdoIGludGVyZXN0aW5nIHRoaW5ncyBwZW9wbGUgd291bGQgd2FpdCBmb3IgaGFzIGhh
dmUKPiBoYXBwZW5lZC4KCi0tIApLaW5kIHJlZ2FyZHMKCj4gCj4gUmVnYXJkcywgcmNrCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxp
bmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
