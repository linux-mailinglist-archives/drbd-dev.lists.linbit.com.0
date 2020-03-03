Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9B17A62E
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:15:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3FF144203E2;
	Thu,  5 Mar 2020 14:15:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 488914203D5
	for <drbd-dev@lists.linbit.com>; Thu,  5 Mar 2020 14:14:49 +0100 (CET)
Received: by mail-lj1-f194.google.com with SMTP id a12so6020581ljj.2
	for <drbd-dev@lists.linbit.com>; Thu, 05 Mar 2020 05:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:resent-from:resent-date:resent-message-id:resent-to
	:subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=cZtO5b5HmYLCRlFdOiLEI+d24Vf47y692jkQPlXYqI0=;
	b=ArIZausB1mu5bWmu4/YdZlCuWFM9fDiBqD9Gw+u1J2Jt/OG8A+FAiXf7JkzA7Y7Ai2
	VS/HSBIKkqmR9EqIIlXLe5Cp3xMboQSnF0aIHGNAZ1dHR3OOs5Xai6+bEmBj6ktj7NoU
	al23Q7OflFNxeKVGYZmuW0PjrjKq2XrAzBGNmg4LgltBwqwMBuzId92z8hzGbc9jIgOs
	T1dk0TS2rrT+AERPPtkvKlg9SdgVX48tIXs32tsV1zgsYO7F55t94YgUYPGWaddib0bP
	53yZO7xFG3B42AxG+gGh3/wlqOnANmaDaPUTXLWjROffEfOw5VdJ/tSXuPDHuC+oeJ8u
	G1+A==
X-Gm-Message-State: ANhLgQ3hMolnZ+3qnPzhDO8m1lYKqGeJ018iNZZ/gfSNbTU/+/BpJ277
	8Uwhm+f0ma28yIoQWh65rywmNlmfJe8IUgYn
X-Google-Smtp-Source: ADFU+vsVotdS3wNP48QUjAgnh08eDpcc7BZYRVKj1nUsHgrYJvxg3RfnjXWOlgWuzdPT/B8Hem+DOg==
X-Received: by 2002:a05:6000:189:: with SMTP id
	p9mr10137722wrx.391.1583413551199; 
	Thu, 05 Mar 2020 05:05:51 -0800 (PST)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id c26sm8928431wmb.8.2020.03.05.05.05.50
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Mar 2020 05:05:50 -0800 (PST)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Thu, 5 Mar 2020 14:05:49 +0100
Resent-Message-ID: <20200305130549.GG19467@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id v2sm9147580wme.2.2020.03.05.05.03.02
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Mar 2020 05:03:03 -0800 (PST)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Thu, 5 Mar 2020 14:03:01 +0100
Resent-Message-ID: <20200305130301.GE19467@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 312 seconds by postgrey-1.31 at mail19;
	Tue, 03 Mar 2020 02:35:09 CET
Received: from m97138.mail.qiye.163.com (m97138.mail.qiye.163.com
	[220.181.97.138])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A9FB420386
	for <drbd-dev@lists.linbit.com>; Tue,  3 Mar 2020 02:35:08 +0100 (CET)
Received: from [10.0.2.15] (unknown [218.94.118.90])
	by smtp9 (Coremail) with SMTP id u+CowACn10sNs11eoMpkAA--.7121S2;
	Tue, 03 Mar 2020 09:29:50 +0800 (CST)
To: Zhang Duan <duan.zhang@easystack.cn>, drbd-dev@lists.linbit.com,
	philipp.reisner@linbit.com
References: <76806ec7-77fd-56b9-96f5-954cfcb24eee@easystack.cn>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <19e10edf-803e-1ea4-4fe6-38e1f516993a@easystack.cn>
Date: Tue, 3 Mar 2020 09:29:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <76806ec7-77fd-56b9-96f5-954cfcb24eee@easystack.cn>
X-CM-TRANSID: u+CowACn10sNs11eoMpkAA--.7121S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUJLIDDUUUU
X-Originating-IP: [218.94.118.90]
X-CM-SenderInfo: 5grqw2pkhqwhp1dqwq5hdv52pwdfyhdfq/1tbiPA7belyqEX1jgAAAsq
Subject: Re: [Drbd-dev] [PATCH] drbd: Ignore negotiation result with the
 peer who is also negotiating
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

SGkgUGhpbGlwcCwKCiDCoMKgwqDCoCBXaGF0J3MgeW91ciBvcGluaW9uIG9uIHRoaXMgcGF0Y2g/
CgpUaGFueAoKWWFuZwoK5ZyoIDMvMi8yMDIwIDg6MzEgUE0sIFpoYW5nIER1YW4g5YaZ6YGTOgo+
Cj4KPiBXZSBoYXZlIGEgdGVzdCBvbiAzIG5vZGVzIGNsdXN0ZXIgaW4gd2hpY2ggdGhlIHByaW1h
cnkgaXMgdXB0b2RhdGUgYW5kIAo+IHRoZSBvdGhlciB0d28gc2Vjb25kYXJ5Cj4gaXMgZGlza2xl
c3MgYnkgZG9pbmcgZHJiZGFkbSBkZXRhY2guIFRoZW4gYWZ0ZXIgZG9pbmcgZHJiZGFkbSBhdHRh
Y2ggCj4gb24gdGhlIHR3byBzZWNvbmRhcnkgYXQKPiB0aGUgc2FtZSB0aW1lLCBvbmUgc3RhdHVz
IGhhbmdzIGF0IE5FR09USUFUSU5HIHdoaWxlIGFub3RoZXIgaGFuZ3MgYXQgCj4gQVRUQUNISU5H
Lgo+Cj4gVGhhdCBpcyBiZWNhdXNlIGlmIGEgbmVnb3RpYXRpbmcgcGVlciByZWNlaXZlcyBhbm90
aGVyJ3MgCj4gd2lkZS1jbHVzdGVyLWNoYW5nZSBmcm9tIERJU0tMRVNTIHRvCj4gTkVHT1RJQVRJ
TkcsIGl0IHdpbGwgcmVqZWN0IGl0IGR1ZSB0byBtb3JlIHRoYW4gb25lIG5lZ290aWF0aW9uIAo+
IHRocm91Z2hvdXQgdGhlIGNsdXN0ZXIsIGJ1dCB0aGUKPiBuZXcgZGlzayBzdGF0ZSBvZiB0aGF0
IG5vZGUgcmVtYWlucyBORUdPVElBVElORyBhZnRlciBhIGZhaWxlZCBzdGF0ZSAKPiBjaGFuZ2Uu
IFRoZW4gbmVpdGhlciBvZgo+IHR3byBwZWVycyBjYW4gZ2V0IGEgbmVnb3RpYXRpbmcgcmVzdWx0
IHdoYXQgdGhleSB3YW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWmhhbmdEdWFuCj4gLS0tCj4gZHJi
ZC9kcmJkX3N0YXRlLmMgfCA0ICsrKy0KPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJiZC9kcmJkX3N0YXRlLmMgYi9kcmJk
L2RyYmRfc3RhdGUuYwo+IGluZGV4IGM5MTlkNzU5Li44NTkxMGYxZSAxMDA2NDQKPiAtLS0gYS9k
cmJkL2RyYmRfc3RhdGUuYwo+ICsrKyBiL2RyYmQvZHJiZF9zdGF0ZS5jCj4gQEAgLTE4MzUsOCAr
MTgzNSwxMCBAQCBzdGF0aWMgdm9pZCBzYW5pdGl6ZV9zdGF0ZShzdHJ1Y3QgZHJiZF9yZXNvdXJj
ZSAKPiAqcmVzb3VyY2UpCj4gZm9yX2VhY2hfcGVlcl9kZXZpY2VfcmN1KHBlZXJfZGV2aWNlLCBk
ZXZpY2UpIHsKPiBlbnVtIGRyYmRfcmVwbF9zdGF0ZSBuciA9IHBlZXJfZGV2aWNlLT5uZWdvdGlh
dGlvbl9yZXN1bHQ7Cj4gZW51bSBkcmJkX2Rpc2tfc3RhdGUgcGRzayA9IHBlZXJfZGV2aWNlLT5k
aXNrX3N0YXRlW05FV107Cj4gKyBlbnVtIGRyYmRfZGlza19zdGF0ZSBwZHNrX29sZCA9IHBlZXJf
ZGV2aWNlLT5kaXNrX3N0YXRlW09MRF07Cj4KPiAtIGlmIChwZHNrID09IERfVU5LTk9XTiB8fCBw
ZHNrIDwgRF9ORUdPVElBVElORykKPiArIGlmICgocGRzayA9PSBEX1VOS05PV04gfHwgcGRzayA8
IERfTkVHT1RJQVRJTkcpIHx8Cj4gKyAocGRza19vbGQgPCBEX05FR09USUFUSU5HICYmIHBkc2sg
PT0gRF9ORUdPVElBVElORykpCj4gY29udGludWU7Cj4KPiBpZiAocGRzayA9PSBEX1VQX1RPX0RB
VEUpCj4gLS0gCj4gMi4yNC4wLndpbmRvd3MuMgo+Cj4gLS0gCj4gU2luY2VyZWx5IFlvdXJzLAo+
IFpoYW5nIER1YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBz
Oi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
