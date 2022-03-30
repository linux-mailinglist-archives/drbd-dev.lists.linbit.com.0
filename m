Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D99814ED856
	for <lists+drbd-dev@lfdr.de>; Thu, 31 Mar 2022 13:21:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D0610420835;
	Thu, 31 Mar 2022 13:21:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EA2A4205F5
	for <drbd-dev@lists.linbit.com>;
	Wed, 30 Mar 2022 21:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
	t=1648668702; x=1680204702;
	h=from:to:cc:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version:subject;
	bh=/wUg19F4bho3UrdXcKxpKP+dFuU7a5qpHTH21Holqd8=;
	b=HJIBWfczqoXH3kLS84PAATiHnMg4vxbyl1AydR9VVGzaYZrMvwPPXN5B
	jmHJb37cCkQhxUdKOFxiiMHdofmt3Hr0zBRsQ9/qR+U7G5j910zPkr/Jz
	Oh7190LpM+FQXGw3Z7k3NnsOdGv95CI5l6Edd36hSv0rTg1Mobahm4vkw U=;
X-IronPort-AV: E=Sophos;i="5.90,223,1643673600"; d="scan'208";a="189068137"
Thread-Topic: [Drbd-dev] state of drbd in mainline
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
	email-inbound-relay-iad-1d-7a21ed79.us-east-1.amazon.com)
	([10.43.8.2]) by smtp-border-fw-6002.iad6.amazon.com with ESMTP;
	30 Mar 2022 19:31:41 +0000
Received: from EX13MTAUWB001.ant.amazon.com
	(iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-7a21ed79.us-east-1.amazon.com (Postfix)
	with ESMTPS id 98E43220F87; Wed, 30 Mar 2022 19:31:40 +0000 (UTC)
Received: from EX13D21UWA002.ant.amazon.com (10.43.160.246) by
	EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server
	(TLS) id 15.0.1497.32; Wed, 30 Mar 2022 19:31:32 +0000
Received: from EX13D23UWA003.ant.amazon.com (10.43.160.194) by
	EX13D21UWA002.ant.amazon.com (10.43.160.246) with Microsoft SMTP Server
	(TLS) id 15.0.1497.32; Wed, 30 Mar 2022 19:31:32 +0000
Received: from EX13D23UWA003.ant.amazon.com ([10.43.160.194]) by
	EX13D23UWA003.ant.amazon.com ([10.43.160.194]) with mapi id
	15.00.1497.033; Wed, 30 Mar 2022 19:31:32 +0000
From: "Kiselev, Oleg" <okiselev@amazon.com>
To: Philipp Reisner <philipp.reisner@linbit.com>, Jens Axboe <axboe@kernel.dk>
Thread-Index: AQHYREo/hxsLFmWyRUaMnu9akgwu46zX25aA
Date: Wed, 30 Mar 2022 19:31:32 +0000
Message-ID: <7AD2D6DC-0609-42F9-A481-B6E5C0F58180@amazon.com>
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
	<CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
	<f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
	<CADGDV=WN2TFR6dO7ZdiQ2ijPjs+7HSsvk0ZCHsHj6ZG5t-oEdA@mail.gmail.com>
	<3c42b1ed-7c03-64e6-409e-e92247288cac@kernel.dk>
	<CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
In-Reply-To: <CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.160.98]
Content-ID: <BBE82A3345660541908687EF8C2DC1D0@amazon.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Mar 2022 13:21:03 +0200
Cc: "Herrenschmidt, Benjamin" <benh@amazon.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, "Smith,
	Stewart" <trawets@amazon.com>, Christoph Hellwig <hch@lst.de>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] state of drbd in mainline
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

QVdTIFJEUyBpcyBhIG1ham9yIHVzZXIgb2YgZHJiZC4gIFdlIGFyZSBwcm9iYWJseSByZXNwb25z
aWJsZSBmb3IgdGhlIHN1YnN0YW50aWFsIHBlcmNlbnRhZ2Ugb2YgZHJiZCB1c2VycyBpbiB0aGUg
d29ybGQuICBXZSBhcmUgY3VycmVudGx5IG9uIGRyYmQtOC40LiAgV2Ugd2lsbCBldmVudHVhbGx5
IG1pZ3JhdGUgdG8gZHJiZC05LCBidXQgYXQgb3VyIHNjYWxlIHRoaXMgaXNuJ3QgZ29pbmcgdG8g
aGFwcGVuIHZlcnkgc29vbi4gIA0KDQpUaGUgbGFzdCB0aW1lIHdlIG5lZWRlZCB0byBwYXRjaCBk
cmJkIHdhcyBiYWNrIGluIDIwMTguICBXZSd2ZSBub3QgZGlhZ25vc2VkIGFueSByZXBvcnRhYmxl
IGlzc3VlcyB3aXRoIGRyYmQtOC40IGluIHRoZSBwYXN0IH40IHllYXJzLiAgIEl0J3MgYSBzdGFi
bGUsIG1hdHVyZSBkcml2ZXIuICAgV2Ugd291bGQgcHJlZmVyIGZvciBkcmJkLTggdG8gY29udGlu
dWUgYmVpbmcgYXZhaWxhYmxlIGluIHRoZSB1cHN0cmVhbSB0cmVlLiAgV2UnZCBhbHNvIHdlbGNv
bWUgZHJiZC05IGJlaW5nIGF2YWlsYWJsZSBpbi10cmVlIGFzIHNvb24gYXMgcG9zc2libGU6IGl0
IHdpbGwgbWFrZSBsaWZlIG11Y2ggZWFzaWVyIGZvciBvdGhlciBBV1MgdGVhbXMgdGhhdCBhcmUg
Y3VycmVudGx5IHdvcmtpbmcgb24gRFJCRCBkZXBsb3ltZW50Lg0KDQrvu79PbiAzLzMwLzIyLCA4
OjI0IEFNLCAiZHJiZC1kZXYtYm91bmNlc0BsaXN0cy5saW5iaXQuY29tIG9uIGJlaGFsZiBvZiBQ
aGlsaXBwIFJlaXNuZXIiIDxkcmJkLWRldi1ib3VuY2VzQGxpc3RzLmxpbmJpdC5jb20gb24gYmVo
YWxmIG9mIHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPiB3cm90ZToNCg0KICAgIENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29u
ZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoNCg0KDQogICAg
PiA+IEplbnMsIG15IGludGVudGlvbiBpcyB0byBrZWVwIGl0IGluLXRyZWUsIGFuZCBhdCBzb21l
IHBvaW50IHVwZGF0ZSBpdC4NCiAgICA+ID4gUmVnYXJkaW5nIHlvdXIgcXVlc3Rpb25zOg0KICAg
ID4NCiAgICA+IFRoYXQnZCBiZSBncmVhdCwgYnV0IGl0J3MgYmVlbiB5ZWFycyBzaW5jZSB0aGVy
ZSB3YXMgYW55IHNpZ25pZmljYW50DQogICAgPiB1cGRhdGVzIHRvIHRoZSBpbi1rZXJuZWwgZHJi
ZC4uLiBJIHdvdWxkIHN0cm9uZ2x5IHN1Z2dlc3QgdGhhdCB0aGUNCiAgICA+IGluLWtlcm5lbCBi
ZSBicm91Z2h0IGNsb3NlciB0byB3aGF0IHBlb3BsZSBhcmUgbW9zdGx5IHJ1bm5pbmcsIGFzIGl0
DQogICAgPiBzdGFuZHMgaXQncyBiYXNpY2FsbHkgdW5tYWludGFpbmVkLg0KDQogICAgVGhlIGNo
YW5nZXMgd2Ugd29ya2VkIG9uIG92ZXIgbWFueSBZZWFycyBpbiB0aGUgbW9yZSByZWNlbnQgZHJi
ZC05LngNCiAgICBicmFuY2hlcyBhcmUganVzdCB0b28gZnVuZGFtZW50YWwgdG8gZG8gdGhlbSBp
biBzbWFsbCBjaHVua3MsIHdlIGNvdWxkDQogICAgdXBzdHJlYW0gYml0IGJ5IGJpdC4gIFdlIG5l
ZWQgdG8gZ2V0IHRoYXQgcmV2aWV3ZWQgaW4gYSBiaWcgc2VyaWVzLiAgSWYgSQ0KICAgIHN0YXJ0
ZWQgdG8gZHVtcCB0aGVtIG9uIGxpbnV4LWJsb2NrIHJpZ2h0IGF3YXksIG5vYm9keSB3b3VsZCBs
b29rIGF0IGl0DQogICAgc2VyaW91c2x5LCBzaW5jZSBpdCB3b3VsZCBiZSB0b28gbXVjaC4gIEkg
aW50ZW5kIHRvIGdldCBwZW9wbGUgZnJvbSByZWQNCiAgICBoYXQvc3VzZSBhc3NpZ25lZCB0byBk
byBzdWNoIGEgcmV2aWV3LiBUaGVuIHdlIHdpbGwgZG8gdGhhdCBvbiBsaW51eC1ibG9jaywNCiAg
ICBzbyB0aGF0IGV2ZXJ5b25lIHdobyBjYXJlcyBzZWVzIHdoYXQgaGFwcGVucy4NCg0KICAgIFsu
Li5dDQogICAgPiBUaGUgbWFpbiBkaXNjcmVwYW5jeSBoZXJlIGlzIHRoYXQgdGhlcmUgYXJlIGFw
cGFyZW50bHkgaHVnZSBudW1iZXJzIG9mDQogICAgPiBpbi10cmVlIHVzZXJzLCB5ZXQgbm8gZml4
ZXMgb3IgcGF0Y2hlcyBhdCBhbGwgbWFraW5nIGl0IHRvIG1haW5saW5lLg0KICAgID4gRWl0aGVy
IGRyYmQgaXMgYnVnIGZyZWUgYW5kIGRvZXNuJ3QgcmVxdWlyZSBhbnkgZml4ZXMgYXQgYWxsLCB3
aGljaCBJDQogICAgPiB2ZXJ5IG11Y2ggd291bGQgZG91YnQsIG9yIGZpeGVzIGFyZW4ndCBiZWlu
ZyBzZW50IHVwc3RyZWFtLg0KDQogICAgSXQgaXMgdGhlIGJyb2FkIGNvbnNlbnQgYW1vbmcgdGhl
IHVzZXJzIG9mIHRoZSBkcmJkLTguNCBicmFuY2ggKHRoYXQgaXMgd2hhdA0KICAgIGlzIGluLXRy
ZWUpLCBpcyB0aGF0IGl0IHdvcmtzIGZvciBpdHMgcHVycG9zZS4gSXQgaXMgZm9yIHN1cmUgbm90
IGJ1Zy1mcmVlLA0KICAgIGJ1dCBwZW9wbGUgYXJlIG5vdCBydW5uaW5nIGludG8gYnVncyBhbnlt
b3JlLiBTbywgY2FsbCBpdCBmcmVlIG9mIHJlbGV2YW50DQogICAgYnVncywgaWYgeW91IHdhbnQu
ICBObyBuZXcgZmVhdHVyZXMgZ28gaW50byB0aGF0IGJyYW5jaCwgb24gcHVycG9zZS4gVG8ga2Vl
cA0KICAgIGl0IHRoYXQgd2F5Lg0KDQogICAgSGF2ZSBhIGxvb2sgYXQgdGhhdCBvbmUgcmVhbCBi
dWctZml4IHRoYXQgd2FzIGlkZW50aWZpZWQgaW4gdGhlIGxhc3QgWWVhci4NCiAgICAyMDIxMDQy
NjE2MzAzMi4zNDU0MTI5LTEtY2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20gPGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1ibG9jay9wYXRjaC88YSBocmVm
PT4vIj5odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYmxvY2svcGF0
Y2gvMjAyMTA0MjYxNjMwMzIuMzQ1NDEyOS0xLWNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQu
Y29tLw0KDQogICAgV2hlbiBkbyB5b3Ugd2FudCB0byBoYXZlIHRoYXQgcmVwb3N0ZWQgdG8geW91
Pw0KICAgIHJpZ2h0IG5vdz8gSnVzdCBiZWZvcmUgdGhlIG5leHQgbWVyZ2Ugd2luZG93IG9wZW5z
Pw0KICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQog
ICAgZHJiZC1kZXYgbWFpbGluZyBsaXN0DQogICAgZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQ0K
ICAgIGh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2
IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGlu
Yml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
