Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7DD53BA02
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Jun 2022 15:44:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF08D4202BA;
	Thu,  2 Jun 2022 15:44:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 84BFB420177
	for <drbd-dev@lists.linbit.com>; Thu,  2 Jun 2022 15:44:07 +0200 (CEST)
Received: by mail-pj1-f46.google.com with SMTP id n10so4951386pjh.5
	for <drbd-dev@lists.linbit.com>; Thu, 02 Jun 2022 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sourceruckus-org.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gPPwlQqvoQTbtECTxcrxrg6SFOdePdwoYFqfMm866F8=;
	b=kWePubxM0Bf0JaShuIx9jth0Mny3aF117Tm6SbJXyY0EEF/KT6H0Q08WgK8sK+fQYx
	JCdrosPpnC5pNrC4qA/OE/W9FOx9v8HYsoUsqIbfLZDechckenS6Mn3MSw+xOaPmonVM
	k20K4sSBXl7dFDtrmNMSMO5MYriEcz5hJ0BzMXrwNYBdM+JFGsjabfzhADVOM4td9ZYA
	mbJUS7Tv68kSnFK0MkotuBQ87Z/jMGpbR2EUHOV7uv5DvtNyMcZi6Tu168zW68dX3l2/
	ZWzm56RTGBgHL14rEDcapSBVo/WaJhVUnyH1TdM6I29A+MJ8Vk8cWfjuCz4K9AvTxmvY
	6ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gPPwlQqvoQTbtECTxcrxrg6SFOdePdwoYFqfMm866F8=;
	b=SZGy8O3Ec+7c3tmNtLaZw/yoOdnyugW9D06yqMFj45YXR4dMrwmyft2Ep+a6/B0HI4
	m/7G4z94sv9IiA9ZrmFwqlQXIw3pZQ2q9QyZdBQ87mdLPt3gI2ifYYDC4xGZvuvZK3nx
	p+ADBy5AlUWMgiQSZOkulj3jMskPYfbZLvoqxkfYOw8b4P6amv+lfDKs8rHU7zAgsDHX
	fRC/76DWbDbHGHc6AJ9MAgXlBO/Q1lXV53b7NqF/8ZKZwBdZOXpon+cz8D2NW3Uka+nt
	lp7D2gxLQBgo9QZlLj00PKZMcRXYGqfFQ+iYUusUE75YrMTINWARPwrxKE4S4bcmThlx
	tAbQ==
X-Gm-Message-State: AOAM533Q75qwzniFl/UKssmLBor4GBg5h+HqDIlJL4p59VT0h8Nhgj6c
	O45lrh+ZNH9H1hv5GgCRRd9PoVSZ7ocPH0xdwu0gTs9uDzb5fsLfTQI=
X-Google-Smtp-Source: ABdhPJz5VGg0IVzurOhnMLfR4Sv4ay1+nLsQESDqEFQYx4S0fBp67tQ4oXJEc/prDFJto1tZP0yUOUpSzLxkJDwORLg=
X-Received: by 2002:a17:903:40c4:b0:163:df09:904e with SMTP id
	t4-20020a17090340c400b00163df09904emr4946170pld.155.1654177446245;
	Thu, 02 Jun 2022 06:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAA1fRFhZrTfHegCWwNoSsUkmvBBfFmd9viQVsmCpSMFQNH5vTg@mail.gmail.com>
	<79d35a2a-2603-41fd-18b8-19f4544ca09a@linbit.com>
In-Reply-To: <79d35a2a-2603-41fd-18b8-19f4544ca09a@linbit.com>
From: Michael Labriola <veggiemike@sourceruckus.org>
Date: Thu, 2 Jun 2022 09:43:55 -0400
Message-ID: <CAA1fRFhU8NYwYWudMLM+S6FwaOY-SCkSv1jFkTdOKEAKq0=A0Q@mail.gmail.com>
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Linux 5.18 status
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

T24gVGh1LCBKdW4gMiwgMjAyMiBhdCA3OjIxIEFNIENocmlzdG9waCBCw7ZobXdhbGRlcgo8Y2hy
aXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+IHdyb3RlOgo+Cj4gQW0gMDEuMDYuMjIgdW0g
MTY6MDMgc2NocmllYiBNaWNoYWVsIExhYnJpb2xhOgo+ID4gQWhveSEgIExvb2tzIGxpa2UgdGhl
IGRyYmQtOS4xIGJyYW5jaCBkb2Vzbid0IGNvbXBpbGUgYWdhaW5zdCA1LjE4Cj4gPiB5ZXQuICBJ
cyBzb21lYm9keSB3b3JraW5nIHRocm91Z2ggdGhlIDUuMTggYmxvY2sgbGF5ZXIgY2hhbmdlcwo+
ID4gYWxyZWFkeT8gIElmIGFueW9uZSdzIGdvdCBhIGJyYW5jaCB0byB0ZXN0LCBJJ2QgZ2xhZGx5
IHRyeSBpdCBvdXQuCj4gPgo+ID4gLS0KPiA+IE1pY2hhZWwgRCBMYWJyaW9sYQo+ID4gNDAxLTMx
Ni05ODQ0IChjZWxsKQo+Cj4gSGksCj4KPiBJJ20gd29ya2luZyBvbiA1LjE4IGNvbXBhdCBhcyB3
ZSBzcGVhay4gU2luY2Ugbm8gZGlzdHJpYnV0aW9uIHdlIGJ1aWxkCj4gZm9yIGlzIHVzaW5nIDUu
MTgsIHRoaXMgaGFzIGEgc29tZXdoYXQgbG93ZXIgcHJpb3JpdHksIGJ1dCBpdCBpcyBiZWluZyBk
b25lLgoKVGhhdCdzIGdvb2QgdG8gaGVhci4gIEkgdG9vayBhIGxvb2sgYXQgdGhlIGNoYW5nZXMg
dGhlIG90aGVyIGRheSwgYW5kCnRoZXkgbG9va2VkIGEgbGl0dGxlIHRvbyBkZWVwIGZvciBtZSB0
byBzYWZlbHkgZml4IG9uIG15IG93bi4KCj4gSSB3b3VsZCBlc3RpbWF0ZSB3ZSBoYXZlIGFyb3Vu
ZCA1IG9yIDYgcmVtYWluaW5nIG5vbi10cml2aWFsIHBhdGNoZXMKPiB0aGF0IHJlcXVpcmUgcmVh
bCBhdHRlbnRpb24gYmVmb3JlIHdlIGNhbiBidWlsZCBmb3IgNS4xOC4KPgo+IElmIGV2ZXJ5dGhp
bmcgZ29lcyB0byBwbGFuLCB0aGUgZml4ZXMgbWlnaHQgbWFrZSBpdCBpbnRvIHRoZSBuZXh0IERS
QkQKPiByZWxlYXNlIGluIG1pZC1KdW5lLCBidXQgSSByZWFsbHkgY2FuJ3QgbWFrZSBhbnkgcHJv
bWlzZXMuCgpJJ2QgbG92ZSB0byBoZWxwIHRlc3QgdGhpbmdzIG91dCBhcyB0aGluZ3Mgc3RhcnQg
dG8gY29tZSB0b2dldGhlci4KTGV0IG1lIGtub3cgd2hlcmUgdG8gcHVsbCBmcm9tLCBhbmQgSSds
bCBjb21waWxlIGFuZCBnaXZlIGl0IHNvbWUKZ2VudGxlIHRlc3Rpbmcgb24gYSAzLW5vZGUgc2V0
dXAuCgpJIGhpc3RvcmljYWxseSBtYWtlIGRyYmQ5IHdvcmsgImZvci1tZSIgb24gbmV3IGtlcm5l
bHMgYXMgdGhleSBjb21lCm91dCB3aXRoIHRoZSBpbnRlbnQgb2YgcHJldHR5aW5nIHVwIG15IHBh
dGNoZXMgYW5kIHN1Ym1pdHRpbmcgdGhlbQpoZXJlIChlLmcuLCBjb21wYXQgcGF0Y2ggYnVpbGQg
c3lzdGVtIHN0dWZmIGZvciBvbGRlciBrZXJuZWxzKSwgYnV0CnJhcmVseSBtYW5hZ2UgdG8gZm9s
bG93IHRocm91Z2ggYmVmb3JlIHlvdSBndXlzIGZpeCBpdCB1cHN0cmVhbS4KCi0tCk1pY2hhZWwg
RCBMYWJyaW9sYQo0MDEtMzE2LTk4NDQgKGNlbGwpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
