Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C017A61A
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:12:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92D684203EC;
	Thu,  5 Mar 2020 14:12:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 508 seconds by postgrey-1.31 at mail19;
	Thu, 05 Mar 2020 14:11:33 CET
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 730DB4203D8
	for <drbd-dev@lists.linbit.com>; Thu,  5 Mar 2020 14:11:33 +0100 (CET)
Received: by mail-wm1-f65.google.com with SMTP id a5so6249893wmb.0
	for <drbd-dev@lists.linbit.com>; Thu, 05 Mar 2020 05:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=cZtO5b5HmYLCRlFdOiLEI+d24Vf47y692jkQPlXYqI0=;
	b=Prnq94STvt9inIcoHCFZri0XmyYyDkreFfjnlbKYSqcbeoB2QIAol1Mlv9ZfIgQwxq
	rbr83+0bjJnnVslSQv2TLyEA6q1s0ieV2MrWeekZBZBN/2kjnn821jjHROLdnTwg6GNG
	gCXlJQqUk63eONZLT5fPScqVe55y9/l35mYYN06GSzpLPH8lQ3h2VBqFO3iIFD6UbJbk
	o9yg6V7GEnzfDz2cvLlGXiGek8RupXjqsiqoOft1VtLLaH9ZVhjPVYwJnOEYzueDOQ6t
	dnx7LbMAp3PUhvy6A/2sRkYaVlY38AeQOcGFjTnFpWy5DB9c4u40/s+VpK4gyqoNedyv
	ckdg==
X-Gm-Message-State: ANhLgQ0WWFBVOfr9yZUq62Y+Kgy+XFOrd1ngYhD2tynQaQj8Wv4mhTXb
	buXanP2BSdIB1n++KaNTSYvrCC7in/wK3OSh
X-Google-Smtp-Source: ADFU+vufCTUMLWRnGQukN3rb1fen55ttlmgzD9aiMNrDHuo8Ogfin6WicADQxQOK/erJpMnUkiy/PA==
X-Received: by 2002:a1c:7ed0:: with SMTP id z199mr10096226wmc.52.1583413383829;
	Thu, 05 Mar 2020 05:03:03 -0800 (PST)
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
