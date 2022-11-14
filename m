Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AF627829
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Nov 2022 09:52:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 45AE342032E;
	Mon, 14 Nov 2022 09:52:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 546AB4201AA
	for <drbd-dev@lists.linbit.com>; Mon, 14 Nov 2022 09:52:42 +0100 (CET)
Received: by mail-ej1-f45.google.com with SMTP id t25so26533521ejb.8
	for <drbd-dev@lists.linbit.com>; Mon, 14 Nov 2022 00:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=user-agent:in-reply-to:content-transfer-encoding
	:content-disposition:mime-version:references:message-id:subject:cc
	:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=bmX62hR4MSusc/VRQi07FrIQob7wEqnGro3RqOAAHwU=;
	b=dwhwKgMrbFj8I+L5yTFhfjakl9EpqM1Lk24hQWfHxvg+LRMIt4IlSO/wiGD1VpItfa
	r7cwwoRQTCdGJRta97+o7/lDY1YyKl/UxLpHDKvia/efpu1O2nwyZb1dacWVlnEDP0gC
	Sn8QA23Wo4ZvIq740O/yBYaYfjcEqXqOt3Ik+VUp5vehShBRtJoBFo1c8LL223UyhWnq
	BuBBtHMV5W5bBEx1pTHYBYJ01ZO9BUSMai3tgNmMsT467rds2D9b5N1kAiLklV5iAEZw
	Syc6nrFHtM4C0A+h9t1Jbcp+clLspZtMD2gSq31rPKXLEp1LSambFpFk1IHIX+BYeWEA
	X+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=user-agent:in-reply-to:content-transfer-encoding
	:content-disposition:mime-version:references:message-id:subject:cc
	:to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=bmX62hR4MSusc/VRQi07FrIQob7wEqnGro3RqOAAHwU=;
	b=I+6AtWA4505SjyNzPcJEML4X+tiNWoe33OHyx0Pz91xFXeVYnRmOlh9o9+khOcemWB
	cJ5OZijef5AQv+YCDZP+rxIR/fYSY+i4/k6pM6uwovgEiVp/WEHvm5itsbfDGYNUqU1w
	4XahA648ZX/Ogm4G8N6tSa6/sUfrFNdH/gR1zwv7570nD/hh5HWOHHQ0JtVtWjip2Muv
	9VI760vT6X60YQAWYkGC5UvMWpBuimMGQGJwpxxt4svGY2s+yFvo/nXxB1+iPeH3aB10
	C/yszzfIoqng3zv7g3RjOLK+S9mdQ8EZhB7eNwvQR3+TacWVRgEmGRSvtwyv1ATLulfh
	EaGA==
X-Gm-Message-State: ANoB5pm2pSmuf8GD61W1tb3wjys1ExHMLtmpl1KH/8I/wd9AagiU9PPd
	IxycokjADOYQ+dOcQg2U6k+lGe3g8E9SdmJ6QpA=
X-Google-Smtp-Source: AA0mqf4ubStv9UzWO1qALjBwa0RynqHBSrjoJ9iMdLaKkIMUBGhQjczWzxLfea960q0CnqMobHuJRg==
X-Received: by 2002:a17:907:20a5:b0:78c:9b67:6655 with SMTP id
	pw5-20020a17090720a500b0078c9b676655mr9197625ejb.90.1668415962142;
	Mon, 14 Nov 2022 00:52:42 -0800 (PST)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	26-20020a170906311a00b007ae693cd265sm3879463ejx.150.2022.11.14.00.52.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Nov 2022 00:52:41 -0800 (PST)
Date: Mon, 14 Nov 2022 09:52:41 +0100
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <Y3IB2V2TXOzNac1H@rck.sh>
References: <Y2j1Lmr2afaEYvBu@m1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2j1Lmr2afaEYvBu@m1>
User-Agent: Mutt/2.0.5 (2021-01-21)
Cc: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
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

T24gTW9uLCBOb3YgMDcsIDIwMjIgYXQgMDE6MDg6MTRQTSArMDEwMCwgTWlsYW4gUC4gU3RhbmnE
hyB3cm90ZToKPiBIaSwKPiAKPiBbIFBsZWFzZSBDYyB0byBtZSwgSSdtIG5vdCBzdWJzY3JpYmVk
IHRvIHRoaXMgbWFpbGluZyBsaXN0IF0KPiAKPiBJJ20gdHJ5aW5nIHRvIGJ1aWxkIGRyYmQtdG9v
bHMgOS4yMi4wIG9uIEFscGluZSBMaW51eCB3aGljaCBpcyBiYXNlZCBvbgo+IG11c2wgbGliYyAo
YW5kIG5vdCBnbGliYykuCj4gCj4gWy4uLl0KPiAKPiBNdXNsIGxpYmMgZ2xvYi5oIGRvZXNuJ3Qg
aGF2ZSBnbF9mbGFncyBub3IgR0xPQl9NQUdDSEFSIGJlY2F1c2UgaXQgaXMKPiBub24gc3RhbmRh
cmQgZ2xpYmMgZXh0ZW5zaW9uLgoKdGhhbmtzIGZvciByZXBvcnRpbmcsIHRoaXMgc2hvdWxkIGJl
IGZpeGVkIGluCmh0dHBzOi8vZ2l0aHViLmNvbS9MSU5CSVQvZHJiZC11dGlscy9jb21taXQvMzNk
NWU4ZjcwNjYxMTZiZDBhNzA2YzdjZGRhNDk1MDg5NTE2NGQzNAoKPiBJIHJldmVydGVkIGh0dHBz
Oi8vZ2l0aHViLmNvbS9MSU5CSVQvZHJiZC11dGlscy9jb21taXQvNGExYjU5MDA5MGJmNjc2Y2Rm
YjEwYzE5ODUwNWI5NWI5ZWViMzEyMAo+IGNvbW1pdCBhbmQgdGhlbiBkcmJkLXRvb2xzIGJ1aWxk
cyBmaW5lLgo+IAo+IE5vdCBzdXJlIGlzIHRoaXMgcmV2ZXJ0IHNhZmUgdG8gcHVzaCBkcmJkLXV0
aWxzIGluIG5leHQgQWxwaW5lIHJlbGVhc2UKPiAod2hpY2ggcGxhbm5lZCBmb3IgbmV4dCB3ZWVr
KSBvciB0aGVyZSBpcyBiZXR0ZXIgZml4LgoKSSB0aGluayByZXZlcnRpbmcgZm9yIG5vdyBpcyBw
ZXJmZWN0bHkgZmluZSwgdGhpcyBkZXNlcnZlZCBhIGZpeCwgYnV0IEkKZG9uJ3QgdGhpbmsgaXQg
YWN0dWFsbHkgaGFwcGVuZWQgaW4gdGhlIHdpbGQgdGhhdCBvZnRlbi4uLiBPciB5b3UgcGljawp0
aGUgcHJvcG9zZWQgZml4LCB3aGljaCB3b3VsZCBiZSBhIGdvb2QgdGVzdCBmb3IgdXMgYXMgd2Vs
bC4gQ3VycmVudGx5CkknbSBub3Qgc3VyZSB3aGVuIHRoZSBuZXh0IG9mZmljaWFsIHJlbGVhc2Ug
d2lsbCBiZSBkb25lLCBjdXJyZW50IGd1dApmZWVsaW5nIGlzIG5vdCBlbm91Z2ggaW50ZXJlc3Rp
bmcgdGhpbmdzIHBlb3BsZSB3b3VsZCB3YWl0IGZvciBoYXMgaGF2ZQpoYXBwZW5lZC4KClJlZ2Fy
ZHMsIHJjawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xp
c3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
