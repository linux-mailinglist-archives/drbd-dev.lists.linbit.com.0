Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DA341A8
	for <lists+drbd-dev@lfdr.de>; Tue,  4 Jun 2019 10:20:14 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id CD4941028A71;
	Tue,  4 Jun 2019 10:20:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D9EB1028A61
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jun 2019 10:20:11 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id s3so6506112wms.2
	for <drbd-dev@lists.linbit.com>; Tue, 04 Jun 2019 01:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:subject:to:references:from:organization:cc
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=56873b31JTgEnT1i8IcBmKwdaAdF68c2Ox38x9gXs44=;
	b=HC5uG9kasmX8Tpb0GUhsCLAkMkpqXKd8V/3X+F5fbzeC7us6IH1Y2zEHTVuX+TGHnE
	QqKmzzQXSvNEyh1QKloeMw+jck6igzoAiI0V0u3D2PKeFwKaxIYlG9GWjpbKq1sXKgdv
	vZ1/JmhoJRqopQwpcbx8ciFO8QCOfa4d29F0JIIGojSII47Dnvht+je8t56MoJOrW0IB
	chHgnkGql9rp0nZ7Z9DSNi0xlmHDvn8+5PysM5peF27Glyto//R5f/+2a2xM3hhteNFx
	VC7JeHnPGZL7iDyJAXB8ZLdj1tCUX+bqGFjdnFGqCS7aE/DLcdTpDHQkZuJIAJ5EngiU
	40oQ==
X-Gm-Message-State: APjAAAWJRskd4riu7dcEVjEE0IG3JLuLy0s/pA1hvq859C16vBecHEXO
	Le4J9ObrsoqJwP3p9hnjVqerAOjyunr3cA==
X-Google-Smtp-Source: APXvYqwqb40vixneOD55kP6bZx6Y45rLwFOEqObPiY7w5t2uxQOps4B1SdGy2IFkaaC7yfvg0Y1pkg==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr5261100wmi.15.1559636410320;
	Tue, 04 Jun 2019 01:20:10 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	16sm12995825wmx.45.2019.06.04.01.20.09
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 01:20:10 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Tue, 4 Jun 2019 10:20:08 +0200
Resent-Message-ID: <20190604082008.GJ5803@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id C40D31028A61
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jun 2019 10:18:06 +0200 (CEST)
Received: by mail-io1-f52.google.com with SMTP id k8so16654892iot.1
	for <drbd-dev@lists.linbit.com>; Tue, 04 Jun 2019 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=56873b31JTgEnT1i8IcBmKwdaAdF68c2Ox38x9gXs44=;
	b=fc9MjGYK1CNByT7y7XbLRaKT53qh9p9OREvtaqPK6ytqrpOIKvv8ojBk3+fwpZlLd7
	Xr5Hs0tQB0EiNnru5Tg8fV9PkWi8tESSufwYm3hMjvavBzkIeVhqkh8IUN8ps5Lid01y
	tAtHdNg31bH+4BJT6HQLYyp4lE1YBXAU+8+giVafTulDizM6PVkmX3/fr2/Nix9OwdB8
	4aDS5tUDlzdWrYHfzOmyRDpLVBsokPp/zQk/e/Niie+b9XnuuIP8+f9mq/iCTM6YypgH
	OE0/cyav9A5b2PzRN0b20o4yrWHqToTS+JQVN+b+hDW6xxC2pG5e5L312BLHvfIixVEw
	0/MQ==
X-Received: by 2002:a6b:b556:: with SMTP id e83mr12852975iof.94.1559636285415; 
	Tue, 04 Jun 2019 01:18:05 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	k78sm7281950itb.10.2019.06.04.01.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 01:18:04 -0700 (PDT)
To: Lars Ellenberg <lars.ellenberg@linbit.com>
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
Date: Tue, 4 Jun 2019 02:18:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
Content-Language: en-US
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] drbd_nl.c:drbd_adm_prepare() indexes drbd_genl_ops[]
 by cmd number
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gNi8zLzE5IDExOjQzIFBNLCBMYXJzIEVsbGVuYmVyZyB3cm90ZToKPiBUaGluayBhZ2Fpbjog
aG93IGlzIGZhbWlseS0+b3BzIGluZXhlZD8KCklmIHlvdSBtZWFuIHRoZSBnZW5sX2ZhbWlseSwg
aXRzIG9wcyBhcmUga2VwdCBvbiBhIGxpc3QsIHdoaWNoIGlzIHNlYXJjaGVkIHVzaW5nIGdlbmxf
Z2V0X2NtZCgpLgpDb25zdHJ1Y3RlZCBhcyBhIGxpc3QsIGl0IGRvZXNuJ3QgZXZlbiAobmVjZXNz
YXJpbHkpIGhhdmUgYW4gYW4gdW5kZXJseWluZyBhcnJheSBvbmUgbWlnaHQgYmUgdGVtcHRlZCB0
byBpbmRleC4KCj4gSG93IGlzIGRyYmRfZ2VubF9vcHMgaW5kZXhlZD8KCkl0IGlzIGFuIGFycmF5
LCBidXQgaXQgaXNuJ3QgaW5kZXhlZCBieSBjb21tYW5kIG51bWJlciwgZXhjZXB0IGluIHRoaXMg
b25lIHBsYWNlIGluIGRyYmRfYWRtX3ByZXBhcmUoKS4KClRoZSBhcnJheSBpcyBnZW5lcmF0ZWQg
YnkgdGhlIEdFTkxfb3AoKSBtYWNyb3MgaW4gZHJiZC1oZWFkZXJzL2xpbnV4L2RyYmRfZ2VubC5o
LCB3aXRoIGNvbW1hbmRzIGluIG5vIG9idmlvdXMgb3JkZXIuClRoZSBmaXJzdCBvbmUgaXMgY29t
bWFuZCBudW1iZXIgNToKCUdFTkxfb3AoRFJCRF9BRE1fTkVXX01JTk9SLCA1LCBHRU5MX2RvaXQo
ZHJiZF9hZG1fbmV3X21pbm9yKSwKClRoZXJlIGFyZSAzNiBHRU5MX29wIGVudHJpZXMgaW4gZHJi
ZF9nZW5sLmgsIHJlc3VsdGluZyBpbiAzNiBlbnRyaWVzIGluIHRoZSBkcmJkX2dlbmxfb3BzW10g
YXJyYXkuCkJ1dCB0aGUgaGlnaGVzdCBjb21tYW5kIG51bWJlciBpcyA0Nywgc28gaW5kZXhpbmcg
YnkgY29tbWFuZCBudW1iZXIgaXMgbGlhYmxlIHRvIGV4Y2VlZCB0aGUgYm91bmRzIG9mIHRoZSBh
cnJheS4KCkZvciBleGFtcGxlLCBoZXJlJ3MgYW5vdGhlciBHRU5MX29wKCkgZW50cnkgZnJvbSBk
cmJkX2dlbmwuaCwgd2hpY2ggYXBwZWFycyBhdCBkcmJkX2dlbmxfb3BzWzVdOgoJR0VOTF9vcChE
UkJEX0FETV9ORVdfUEVFUiwgNDQsIEdFTkxfZG9pdChkcmJkX2FkbV9uZXdfcGVlciksCgpUaGlz
IGNvbW1hbmQgYXR0ZW1wdHMgdG8gYWNjZXNzIGRyYmRfZ2VubF9vcHNbNDRdLCBsZWFkaW5nIHRv
IGEgcnVudGltZSBlcnJvciBhdCBkcmJkX25sLmM6MjIyOgoJZHJiZHNldHVwIG5ldy1wZWVyIHIw
IDEgLS1fbmFtZT12YWdyYW50CgpkcmJkX25sLmM6MjIyOjIwOiBydW50aW1lIGVycm9yOiBpbmRl
eCA0NCBvdXQgb2YgYm91bmRzIGZvciB0eXBlICdnZW5sX29wcyBbMzZdJwpkcmJkX25sLmM6MjIy
OjI1OiBydW50aW1lIGVycm9yOiBsb2FkIG9mIGFkZHJlc3MgMHgwMDAwMDEwNDMwZTQgd2l0aCBp
bnN1ZmZpY2llbnQgc3BhY2UgZm9yIGFuIG9iamVjdCBvZiB0eXBlICd1bnNpZ25lZCBpbnQnCjB4
MDAwMDAxMDQzMGU0OiBub3RlOiBwb2ludGVyIHBvaW50cyBoZXJlCiAgNzAgMzkgYzIgMDAgMDAg
MDAgMDAgMDAgIDZkIDAwIDAwIDAwIDA1IDAwIDAwIDAwICA1YyAyZiAwNCAwMSAwMCAwMCAwMCAw
MCAgMDMgMDMgMDAgMDAgMDAgMDAgMDAgMDAKICAgICAgICAgICAgICBeIAoKIDIyMiAgICAgICAg
IGlmICgoZHJiZF9nZW5sX29wc1tjbWRdLmZsYWdzICYgR0VOTF9BRE1JTl9QRVJNKSAmJgogMjIz
ICAgICAgICAgICAgIGRyYmRfc2VjdXJpdHlfbmV0bGlua19yZWN2KHNrYiwgQ0FQX1NZU19BRE1J
TikpCiAyMjQgICAgICAgICAgICAgICAgIHJldHVybiAtRVBFUk07CgpXaHkgZG9lcyBvbmUgbmVl
ZCB0byBiZSBpdGVyYXRlZCBvdmVyIGFuZCBjb21wYXJlIGEgbWVtYmVyIHdpdGggdGhlIHNlYXJj
aCBrZXkgYW5kIHRoZSBvdGhlciBkb2VzIG5vdD8KCkkgZG8gbm90IHVuZGVyc3RhbmQgdGhhdCB0
byBiZSB0aGUgY2FzZS4gIEl0IGxvb2tzIGxpa2UgdGhlIGRlZmluaXRpb24gb2YgR0VOTF9vcCgp
IGZvciBaWlpfZ2VubF9vcHNbXQppbiBnZW5sX21hZ2ljX2Z1bmMuaCBkb2VzIG5vdCByZWNvcmQg
dGhlIG9wIG51bWJlciBpbnRvIHRoZSBnZW5lcmF0ZWQgZW50cmllcy4gIEkgZ3Vlc3MgdGhhdCB3
aWxsIG5lZWQKdG8gYmUgYWRkZWQgZm9yIGNvbXBhcmlzb24gd2l0aCB0aGUgc2VhcmNoIGtleS4K
ClJlZ2FyZHMsCkRhdmUgQnV0dGVyZmllbGQKCj4gRGF2aWQgQnV0dGVyZmllbGQgPGRhYjIxNzc0
QGdtYWlsLmNvbSA8bWFpbHRvOmRhYjIxNzc0QGdtYWlsLmNvbT4+IHNjaHJpZWIgYW0gRGkuLCA0
LiBKdW5pIDIwMTksIDAxOjU4Ogo+IAo+ICAgICAoSSB0cmllZCAiZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbSA8bWFpbHRvOmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20+IiBmaXJzdCwgYnV0IG1l
c3NhZ2UgbmV2ZXIgbWFkZSBpdCBpbnRvIHRoZSBhcmNoaXZlLikKPiAKPiAKPiAgICAgLS0tLS0t
LS0gRm9yd2FyZGVkIE1lc3NhZ2UgLS0tLS0tLS0KPiAgICAgVG86IGRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20gPG1haWx0bzpkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tPgo+ICAgICBGcm9tOiBE
YXZpZCBCdXR0ZXJmaWVsZCA8ZGFiMjE3NzRAZ21haWwuY29tIDxtYWlsdG86ZGFiMjE3NzRAZ21h
aWwuY29tPj4KPiAgICAgU3ViamVjdDogZHJiZF9ubC5jOmRyYmRfYWRtX3ByZXBhcmUoKSBpbmRl
eGVzIGRyYmRfZ2VubF9vcHNbXSBieSBjbWQgbnVtYmVyCj4gICAgIERhdGU6IEZyaSwgMzEgTWF5
IDIwMTkgMTM6MDE6MjQgLTA2MDAKPiAgICAgVXNlci1BZ2VudDogTW96aWxsYS81LjAgKFgxMTsg
TGludXggeDg2XzY0OyBydjo2MC4wKSBHZWNrby8yMDEwMDEwMSBUaHVuZGVyYmlyZC82MC42LjEK
PiAgICAgTUlNRS1WZXJzaW9uOiAxLjAKPiAgICAgQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PXV0Zi04Cj4gCj4gICAgIChJcyB0aGlzIHRoZSByaWdodCBwbGFjZSB0byBzZW5kIGNv
bW1lbnRzIG9uIHRoZSBzb3VyY2UgY29kZSBzdWNoIGFzIHRoaXMgb25lPykKPiAKPiAgICAgSW4g
ZHJiZF9ubC5jOgo+IAo+ICAgICDCoCBzdGF0aWMgaW50IGRyYmRfYWRtX3ByZXBhcmUoc3RydWN0
IGRyYmRfY29uZmlnX2NvbnRleHQgKmFkbV9jdHgsCj4gICAgIMKgIMKgIMKgIMKgIHN0cnVjdCBz
a19idWZmICpza2IsIHN0cnVjdCBnZW5sX2luZm8gKmluZm8sIHVuc2lnbmVkIGZsYWdzKQo+ICAg
ICDCoCB7Cj4gICAgIMKgIMKgIMKgIMKgIHN0cnVjdCBkcmJkX2dlbmxtc2doZHIgKmRfaW4gPSBp
bmZvLT51c2VyaGRyOwo+ICAgICDCoCDCoCDCoCDCoCBjb25zdCB1OCBjbWQgPSBpbmZvLT5nZW5s
aGRyLT5jbWQ7Cj4gICAgIMKgIMKgIMKgIMKgIGludCBlcnI7Cj4gCj4gICAgIMKgIMKgIMKgIMKg
IG1lbXNldChhZG1fY3R4LCAwLCBzaXplb2YoKmFkbV9jdHgpKTsKPiAKPiAgICAgK8KgIMKgIMKg
IMKgLy9YWFggSSBkbyBub3QgdGhpbmsgeW91IGNhbiBmaW5kIHRoZSBvcHMgZm9yIGEgY29tbWFu
ZCBudW1iZXIgYnkgaW5kZXhpbmcgdGhpcyBhcnJheS4KPiAgICAgK8KgIMKgIMKgIMKgLy9YWFgg
VGhlIGFycmF5IGlzIHVub3JkZXJlZCBhbmQgcGFja2VkLsKgIEkgdGhpbmsgaXQgbXVzdCBzZWFy
Y2ggbGlrZSBnZW5sX2dldF9jbWQoKS4KPiAgICAgwqAgwqAgwqAgwqAgLyoKPiAgICAgwqAgwqAg
wqAgwqAgwqAqIGdlbmxfcmN2X21zZygpIG9ubHkgY2hlY2tzIGlmIGNvbW1hbmRzIHdpdGggdGhl
IEdFTkxfQURNSU5fUEVSTSBmbGFnCj4gICAgIMKgIMKgIMKgIMKgIMKgKiBzZXQgaGF2ZSBDQVBf
TkVUX0FETUlOOyB3ZSBhbHNvIHJlcXVpcmUgQ0FQX1NZU19BRE1JTiBmb3IKPiAgICAgwqAgwqAg
wqAgwqAgwqAqIGFkbWluaXN0cmF0aXZlIGNvbW1hbmRzLgo+ICAgICDCoCDCoCDCoCDCoCDCoCov
Cj4gICAgIMKgIMKgIMKgIMKgIGlmICgoZHJiZF9nZW5sX29wc1tjbWRdLmZsYWdzICYgR0VOTF9B
RE1JTl9QRVJNKSAmJgo+ICAgICDCoCDCoCDCoCDCoCDCoCDCoCBkcmJkX3NlY3VyaXR5X25ldGxp
bmtfcmVjdihza2IsIENBUF9TWVNfQURNSU4pKQo+ICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCByZXR1cm4gLUVQRVJNOwo+IAo+ICAgICDCoCDCoCDCoCDCoCBhZG1fY3R4LT5yZXBseV9za2Ig
PSBnZW5sbXNnX25ldyhOTE1TR19HT09EU0laRSwgR0ZQX0tFUk5FTCk7Cj4gICAgIMKgIMKgIMKg
IMKgIGlmICghYWRtX2N0eC0+cmVwbHlfc2tiKSB7Cj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGVyciA9IC1FTk9NRU07Cj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gZmFp
bDsKPiAgICAgwqAgwqAgwqAgwqAgfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20KaHR0cDovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRl
dgo=
