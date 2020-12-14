Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE432D9632
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 11:18:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 97C9C42080E;
	Mon, 14 Dec 2020 11:18:29 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 93168420809
	for <drbd-dev@lists.linbit.com>; Mon, 14 Dec 2020 11:18:28 +0100 (CET)
Received: by mail-ed1-f45.google.com with SMTP id h16so16566859edt.7
	for <drbd-dev@lists.linbit.com>; Mon, 14 Dec 2020 02:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WddE2ebQY8sYg+UqNS8FWbLtvA/LHefRpiaq1d9Whjw=;
	b=B+0D2OlJLgnco7LTsmGAB1X4jvVXwtjV5QxFRh3rS0lpvoid80nBJC3Atq9nzBN18S
	6KXOrciBB7tkgTb0ClFSu7dJrIhNDKVmpqpnvrwjLZ4Z7HcWlduWHaIabsN5PcvzIZ30
	soP1sPreThF4fA0rbgqLEkwCK3R/kRiaNfJgigskU1gLhgTuu9zev37lqGSuNkbI8KyU
	BcykSE3WW0k0KHvvjSBNJQ957QmNXBgejJV7GQepg34O2WDKP/DxLfNjPNxEb91QG/0y
	6n/c2Bj5TJQAbNLCo2SGFwENInDOujos8crl/71StuKhzOfiE8IvqOLC13xXPKgFK+Mm
	Jfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WddE2ebQY8sYg+UqNS8FWbLtvA/LHefRpiaq1d9Whjw=;
	b=Ry4ZivflOZRLod4oOdS++LfPFp1esGpTqhS1dKjSHsGqInsh33sUSags+xhWeCSLUu
	g08Lz0LLQBbEYVAbU0T8iR+oBu1U/l3YMSap7GSO7td/Od8cXVfTZEn7mowEStRcH9z1
	FSbz4dFRGo7KhcjQ79JAJY3gApe5Gj+3MgjQEY6RKp7fJGlpMwgEaoh0l9tzvEzVkpQw
	bHG/9mIIbTBIUd5QWoH1+esSgZiH6EvJpOIzGxP1Z8JmoBNacnk9JnNQNvBXmd9X53xX
	M1OTm9bXW1soig/giNJTJHzkccslvXyQQFLDTgM7KM//4F/CRuSvUfVWDCWxZPeGhy8s
	da2Q==
X-Gm-Message-State: AOAM532Hu7LvdOTJsbgphxY8oyykwkEp+FJk7nPD0BzD7iiFmdPhJMLY
	ZW8YRfdVHBMsYe24df1djziRZPz6V1kebgCE72jVtQ==
X-Google-Smtp-Source: ABdhPJw9WPQb8PJH0CCVJ7dW2FVg2SKdnbFYFY6kBYIX2Eyz9Yol5ic4QxucfhnCVBc8LyCsOxPMgg==
X-Received: by 2002:a05:6402:1597:: with SMTP id
	c23mr24422248edv.212.1607941107717; 
	Mon, 14 Dec 2020 02:18:27 -0800 (PST)
Received: from localhost.localdomain (77.119.229.20.static.drei.at.
	[77.119.229.20]) by smtp.gmail.com with ESMTPSA id
	u26sm14906088edo.37.2020.12.14.02.18.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 14 Dec 2020 02:18:27 -0800 (PST)
To: Michael D Labriola <michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <73f05081-b548-72cd-0068-5b1641f43ca9@linbit.com>
Date: Mon, 14 Dec 2020 11:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
Content-Language: en-US
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Get drbd-9.0 branch building with Linux 5.9 and 5.10
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

SGkgTWljaGFlbCwKClRoYW5rcyBmb3IgdGhpcyBncmVhdCBjb250cmlidXRpb24hCgpVbmZvcnR1
bmF0ZWx5LCB3ZSBkdXBsaWNhdGVkIHNvbWUgd29yayBoZXJlLCBidXQgbmVpdGhlciBvZiB1cyBj
b3VsZCAKaGF2ZSBrbm93biB0aGF0IDopCk92ZXIgdGhlIGxhc3QgZmV3IGRheXMgSSBmYWJyaWNh
dGVkIHNvbWUgcGF0Y2hlcyB0aGF0IGZpeCBzb21lIG9mIHRoZSAKc2FtZSBwcm9ibGVtcywgdWx0
aW1hdGVseSBsZWFkaW5nIHRvIHRoZSBzYW1lIHJlc3VsdC4KCkknbGwgcmV2aWV3IHlvdXIgcGF0
Y2hlcyDigJMgb24gZmlyc3QgZ2xhbmNlIGl0IHNlZW1zIGxpa2Ugc29tZSBvZiB5b3VyIAphcHBy
b2FjaGVzIG1heSBhY3R1YWxseSBiZSBiZXR0ZXIgdGhhbiBtaW5lLiBJZiB0aGUgcGF0Y2hlcyBh
cmUgZXhhY3RseSAKdGhlIHNhbWUsIEknbGwgYXR0cmlidXRlIHlvdSBzaW5jZSB5b3UgcHVibGlz
aGVkIHlvdXIgcGF0Y2hlcyBmaXJzdC4gCkknbGwgbWl4IGFuZCBtYXRjaCB3aXRoIG15IHBhdGNo
ZXMsIHNpbmNlIHRoZXkgYXJlIG1vcmUgdGhvcm91Z2ggaW4gc29tZSAKcGxhY2VzIChmb3IgZXhh
bXBsZSwgSSBkaWQgZ28gdG8gdGhlIHRyb3VibGUgb2YgY3JlYXRpbmcgYSBjb21wYXQgdGVzdCAK
Zm9yIHNjaGVkX3NldHNjaGVkdWxlcigpKS4KClNvbWUgb2YgdGhlc2UgcGF0Y2hlcyBhcmUgc3Rp
bGwgdW5kZXIgaW50ZXJuYWwgcmV2aWV3LCBzbyB0aGlzIG1heSB0YWtlIApzb21lIHRpbWUsIGJ1
dCBJJ2xsIGxldCB5b3Uga25vdyB3aGljaCBvZiB5b3VycyBJIGNob3NlLgoKVGhhbmtzIGFnYWlu
IQoKLS0KQ2hyaXN0b3BoIELDtmhtd2FsZGVyCkxJTkJJVCB8IEtlZXBpbmcgdGhlIERpZ2l0YWwg
V29ybGQgUnVubmluZwpEUkJEIEhBIOKAlCAgRGlzYXN0ZXIgUmVjb3Zlcnkg4oCUIFNvZnR3YXJl
IGRlZmluZWQgU3RvcmFnZQoKT24gMTIvMTMvMjAgNjo1OCBBTSwgTWljaGFlbCBEIExhYnJpb2xh
IHdyb3RlOgo+IEhleSwgZXZlcnlvbmUhIEkgaGFkIHRoZSBjaGFuY2UgdG8gdHJ5IGJ1aWxkaW5n
IHRoZSBsYXRlc3QgZHJiZC05LjAKPiBjb2RlIGFnYWluc3QgdGhlIDUuOSBhbmQgNS4xMCBrZXJu
ZWxzIHRoaXMgYWZ0ZXJub29uLiBUaGluZ3MgYWxtb3N0Cj4gYnVpbHQsIGJ1dCBub3QgcXVpdGUu
ICBJIG1hZGUgYSBzZXJpZXMgb2YgY29tbWl0cyB0byBnZXQgdGhpbmdzCj4gY29tcGlsaW5nLiAg
TW9zdCBvZiBpdCBpcyB0cml2aWFsIGNvbXBhdCB0ZXN0IGNoYW5nZXMgYW5kIGZvbGxvd2luZwo+
IGFsb25nIHcvIHdoYXQncyBhbHJlYWR5IGJlZW4gZG9uZSBpbiB0aGUgbWFpbmxpbmUgZHJiZDgg
bW9kdWxlIHRvIGdldAo+IGl0IHJlYWR5IGZvciA1LjEwLgo+IAo+IEkgZGlkIG5vdCBjcmVhdGUg
YSBjb21wYXQgdGVzdCBmb3IgdGhlIHN3aXRjaCBmcm9tCj4gc2NoZWRfc2V0c2NoZWR1bGVyKCkg
dG8gc2NoZWRfc2V0X2ZpZm9fbG93KCkgeWV0LiAgTW9zdGx5LCBiZWNhdXNlCj4gSSd2ZSBuZXZl
ciBkb25lIHRoYXQgYW5kIGhhdmUgdG8gd3JhcCBteSBoZWFkIGFyb3VuZCBob3cgdG8gYWRkCj4g
YW5vdGhlciB0ZXN0LiA7LSkKPiAKPiBJIHRyaWVkIHN1Ym1pdHRpbmcgYSBwdWxsIHJlcXVlc3Qg
dmlhIGdpdGh1YiwgYnV0IGdvdCB0aGUgYXV0by1jbG9zZQo+IG1lc3NhZ2UuICBTbywgaGVyZSdz
IHRha2UgdHdvLgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJiZC1kZXYgbWFpbGluZyBsaXN0Cj4gZHJiZC1kZXZAbGlzdHMubGluYml0
LmNvbQo+IGh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQt
ZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMu
bGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
