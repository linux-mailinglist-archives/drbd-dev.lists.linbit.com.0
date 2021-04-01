Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914A3515FD
	for <lists+drbd-dev@lfdr.de>; Thu,  1 Apr 2021 17:14:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 129E3420951;
	Thu,  1 Apr 2021 17:14:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from ustc.edu.cn (smtp2.ustc.edu.cn [202.38.64.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 99BEB42094C
	for <drbd-dev@lists.linbit.com>; Thu,  1 Apr 2021 17:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=IMWqcG5DEpdf8+c6+2Rmv2KzMd3Qr2bVAXkr
	IuCz158=; b=m6GHA/rBlvJ3Oxw04oYG2J7cBsbXWAUKTu6T7dl28ofUwFycj6Zm
	SN7Z6mvoAHnppI4lQitWk63Sp1XS5gPpX5Pz87eCVGIZFRJc3wEdtNY3olQzqjSY
	WPFn014sfDOs5xiK5y0YiSLiKEwsv/e9+rjVf0YxfEVuJGWUzP4Us2k=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Thu, 1 Apr
	2021 23:13:58 +0800 (GMT+08:00)
X-Originating-IP: [156.234.142.150]
Date: Thu, 1 Apr 2021 23:13:58 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: lyl2019@mail.ustc.edu.cn
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
	20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <cb0f43e4-bfde-ac77-5153-f2f3cbed0172@linbit.com>
References: <20210401115753.3684-1-lyl2019@mail.ustc.edu.cn>
	<cb0f43e4-bfde-ac77-5153-f2f3cbed0172@linbit.com>
X-SendMailWithSms: false
MIME-Version: 1.0
Message-ID: <5b14fa53.26b7e.1788dff8d13.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygA3P28242VgN8+CAA--.0W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQoSBlQhn5pzrwAAsz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Fix a use after free in
 get_initial_state
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

DQoNCg0KPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tDQo+IOWPkeS7tuS6ujogIkNocmlzdG9waCBC
w7ZobXdhbGRlciIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPg0KPiDlj5HpgIHm
l7bpl7Q6IDIwMjEtMDQtMDEgMjE6MDE6MjAgKOaYn+acn+WbmykNCj4g5pS25Lu25Lq6OiAiTHYg
WXVubG9uZyIgPGx5bDIwMTlAbWFpbC51c3RjLmVkdS5jbj4NCj4g5oqE6YCBOiBwaGlsaXBwLnJl
aXNuZXJAbGluYml0LmNvbSwgbGFycy5lbGxlbmJlcmdAbGluYml0LmNvbSwgYXhib2VAa2VybmVs
LmRrLCBsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcsIGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20NCj4g5Li76aKYOiBSZTogW0RyYmQtZGV2
XSBbUEFUQ0hdIGRyYmQ6IEZpeCBhIHVzZSBhZnRlciBmcmVlIGluIGdldF9pbml0aWFsX3N0YXRl
DQo+IA0KPiBPbiA0LzEvMjEgMTo1NyBQTSwgTHYgWXVubG9uZyB3cm90ZToNCj4gPiBJbiBnZXRf
aW5pdGlhbF9zdGF0ZSwgaXQgY2FsbHMgbm90aWZ5X2luaXRpYWxfc3RhdGVfZG9uZShza2IsLi4p
IGlmDQo+ID4gY2ItPmFyZ3NbNV09PTEuIEkgc2VlIHRoYXQgaWYgZ2VubG1zZ19wdXQoKSBmYWls
ZWQgaW4NCj4gPiBub3RpZnlfaW5pdGlhbF9zdGF0ZV9kb25lKCksIHRoZSBza2Igd2lsbCBiZSBm
cmVlZCBieSBubG1zZ19mcmVlKHNrYikuDQo+ID4gVGhlbiBnZXRfaW5pdGlhbF9zdGF0ZSB3aWxs
IGdvdG8gb3V0IGFuZCB0aGUgZnJlZWQgc2tiIHdpbGwgYmUgdXNlZCBieQ0KPiA+IHJldHVybiB2
YWx1ZSBza2ItPmxlbi4NCj4gPiANCj4gPiBNeSBwYXRjaCBsZXRzIHNrYl9sZW4gPSBza2ItPmxl
biBhbmQgcmV0dXJuIHRoZSBza2JfbGVuIHRvIGF2b2lkIHRoZSB1YWYuDQo+ID4gDQo+ID4gRml4
ZXM6IGEyOTcyODQ2M2IyNTQgKCJkcmJkOiBCYWNrcG9ydCB0aGUgImV2ZW50czIiIGNvbW1hbmQi
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEx2IFl1bmxvbmcgPGx5bDIwMTlAbWFpbC51c3RjLmVkdS5j
bj4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMgfCAzICsrLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIGIvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbmwuYw0KPiA+IGluZGV4IGJmN2RlNGM3Yjk2Yy4uNDc0Zjg0Njc1
ZDBhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jDQo+ID4gQEAgLTQ5MDUsNiArNDkwNSw3
IEBAIHN0YXRpYyBpbnQgZ2V0X2luaXRpYWxfc3RhdGUoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3Ry
dWN0IG5ldGxpbmtfY2FsbGJhY2sgKmNiKQ0KPiA+ICAgCXN0cnVjdCBkcmJkX3N0YXRlX2NoYW5n
ZSAqc3RhdGVfY2hhbmdlID0gKHN0cnVjdCBkcmJkX3N0YXRlX2NoYW5nZSAqKWNiLT5hcmdzWzBd
Ow0KPiA+ICAgCXVuc2lnbmVkIGludCBzZXEgPSBjYi0+YXJnc1syXTsNCj4gPiAgIAl1bnNpZ25l
ZCBpbnQgbjsNCj4gPiArCXVuc2lnbmVkIGludCBza2JfbGVuID0gc2tiLT5sZW47DQo+ID4gICAJ
ZW51bSBkcmJkX25vdGlmaWNhdGlvbl90eXBlIGZsYWdzID0gMDsNCj4gPiAgIA0KPiA+ICAgCS8q
IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRha2luZyBub3RpZmljYXRpb25fbXV0ZXggaGVyZTogaXQg
ZG9lc24ndA0KPiA+IEBAIC00OTE1LDcgKzQ5MTYsNyBAQCBzdGF0aWMgaW50IGdldF9pbml0aWFs
X3N0YXRlKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRsaW5rX2NhbGxiYWNrICpjYikN
Cj4gPiAgIAljYi0+YXJnc1s1XS0tOw0KPiA+ICAgCWlmIChjYi0+YXJnc1s1XSA9PSAxKSB7DQo+
ID4gICAJCW5vdGlmeV9pbml0aWFsX3N0YXRlX2RvbmUoc2tiLCBzZXEpOw0KPiA+IC0JCWdvdG8g
b3V0Ow0KPiA+ICsJCXJldHVybiBza2JfbGVuOw0KPiA+ICAgCX0NCj4gPiAgIAluID0gY2ItPmFy
Z3NbNF0rKzsNCj4gPiAgIAlpZiAoY2ItPmFyZ3NbNF0gPCBjYi0+YXJnc1szXSkNCj4gPiANCj4g
DQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQ0KPiANCj4gSSB0aGluayB0aGUgcHJvYmxlbSBnb2Vz
IGV2ZW4gZnVydGhlcjogc2tiIGNhbiBhbHNvIGJlIGZyZWVkIGluIHRoZSANCj4gbm90aWZ5Xypf
c3RhdGVfY2hhbmdlIC0+IG5vdGlmeV8qX3N0YXRlIGNhbGxzIGJlbG93Lg0KPiANCj4gQWxzbywg
YXQgdGhlIHBvaW50IHdoZXJlIHdlIHNhdmUgc2tiLT5sZW4gaW50byBza2JfbGVuLCBza2IgaXMg
bm90IA0KPiBpbml0aWFsaXplZCB5ZXQuIE1heWJlIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gbm90
IHJldHVybiBhIGxlbmd0aCBpbiB0aGUgDQo+IGZpcnN0IHBsYWNlIGhlcmUsIGJ1dCBhbiBlcnJv
ciBjb2RlIGluc3RlYWQuDQo+IA0KPiAtLSANCj4gQ2hyaXN0b3BoIELDtmhtd2FsZGVyDQo+IExJ
TkJJVCB8IEtlZXBpbmcgdGhlIERpZ2l0YWwgV29ybGQgUnVubmluZw0KPiBEUkJEIEhBIOKAlCAg
RGlzYXN0ZXIgUmVjb3Zlcnkg4oCUIFNvZnR3YXJlIGRlZmluZWQgU3RvcmFnZQ0KDQpPaywgSSBz
ZWUuDQpJIGZvdW5kIHRoYXQgZHJiZF9hZG1fZ2V0X2luaXRpYWxfc3RhdGUoKSBoYXMgY2FsbGVk
IHRoZSBnZXRfaW5pdGlhbF9zdGF0ZSgpLA0KYW5kIHJldHVybiAtRU5PTUVNIGlmIGl0IGNhbGxz
IHJlbWVtYmVyX29sZF9zdGF0ZSgpIGZhaWxlZC4NCg0KU28sIGkgdGhpbmsgdGhhdCBtZWFucyBp
ZiBnZXRfaW5pdGlhbF9zdGF0ZSgpIGZhaWxlZCBvbiB0aGUgbm90aWZ5X2luaXRpYWxfc3RhdGVf
ZG9uZSgpLA0KaXQgc2hvdWxkIHJldHVybiAtRU5PTUVNIHRvby4NCg0KSSB3aWxsIHN1Ym1pdCB0
aGUgUEFUQ0ggdjIgdG8gZml4IHRoZSBmaXJzdCBwbGFjZS4gVGhlIGZpeGVzIG9mIHRoZSBmdXJ0
aGVyIHByb2JsZW0gaXMgDQpoYXJkIGZvciBtZS4NCg0KVGhhbmtzLg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
