Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671363596F
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Nov 2022 11:16:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFEBF4252F7;
	Wed, 23 Nov 2022 11:16:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 243004252F2
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 11:16:02 +0100 (CET)
Received: by mail-wr1-f49.google.com with SMTP id x5so24585212wrt.7
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 02:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=myxP9QEkyYqaVrVe1TQMCWc6JB21jpqjpRuaT56xqR4=;
	b=ujrxI624TqsSqPUxNaUT0yOYo4gXvhv9lkHeqEaSJCChOnF3bFWDTu+65Y7ONJZzrR
	Yeh6ySwaSJ+gGPbo85lHe3gn8z+/ih4U2lnhMnlMl/xuZ3C6ZVi5TQax/ZNbAKDUnkXM
	sGHxP/4LRjUQswBuU2WMYCadFH2L7QUMPpiBp7xOqW73BI5+bHIYUoyWzKvVZO6J3ONW
	BLFemZclgqfTwFPZ9Pnbln02pXv2RhuPLZ1QUVxTMin7sShjd6HOPxhnGD806EhVpbV+
	mdQn5/jcDckLE1fGGrvoJenhVJxaUS+mtF1X8h0ekypEO2yK0eZNKM52S5J3TxCdUll6
	iJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=myxP9QEkyYqaVrVe1TQMCWc6JB21jpqjpRuaT56xqR4=;
	b=XcpMthLNCmmyc/FEwutHeT/taLoJHbBjZkijmNs0ETNPs3GzB5HlTqwYeUZMhL8+BR
	azOsgpVlbfRVfT0bktLcB9aZvjLqxU3jzxetpqPPq2aSvWSfaDQb0219tVVJP7K33TjS
	jZDif2PhOA7lk9WkP5R7Enz6P5HtKK80rPDHKkU9/d8US/OLE9DcPlbAordlow/xQD3V
	/WRDuoHX+ExzUXNuhXzr28BHzvuaPZpDfy4m8Gqt6OMKkFxTufA5utJpy0/J4Yel51HS
	poL/YppR/Z1APzdyl1EV4gXdKIqxhrsAPb9wPt6+Sa3FmVHCW6nM6/g9qV7WgWFPPzKd
	URiA==
X-Gm-Message-State: ANoB5plUDgKFPJlSHyjSfy8zTxWWMguOth4XaOvBf98HAlXmrSOyRnaV
	Hodj3NSTLdX6XnkeptkC97m3YOKa
X-Google-Smtp-Source: AA0mqf6QP/aXHYq2bDk7tA2e5u9jknzUIDXixL3OTnNqjdpGBytgmxYg7wZPXNrh/ilSjfqvhPLsCg==
X-Received: by 2002:adf:fe47:0:b0:241:9aea:4396 with SMTP id
	m7-20020adffe47000000b002419aea4396mr17189386wrs.438.1669198561660;
	Wed, 23 Nov 2022 02:16:01 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	y3-20020adfee03000000b002365254ea42sm16246969wrn.1.2022.11.23.02.16.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 23 Nov 2022 02:16:01 -0800 (PST)
Message-ID: <7d972801-148a-87b2-9fe1-9992b943916f@linbit.com>
Date: Wed, 23 Nov 2022 11:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.1
Content-Language: en-US
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20221123020355.2470160-1-bobo.shaobowang@huawei.com>
	<20221123020355.2470160-2-bobo.shaobowang@huawei.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221123020355.2470160-2-bobo.shaobowang@huawei.com>
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, lars.ellenberg@linbit.com,
	liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3 1/2] drbd: remove call to memset before
 free device/resource/connection
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

QW0gMjMuMTEuMjIgdW0gMDM6MDMgc2NocmllYiBXYW5nIFNoYW9CbzoKPiBUaGlzIHJldmVydCBj
MjI1OGZmYzU2ZjIgKCJkcmJkOiBwb2lzb24gZnJlZSdkIGRldmljZSwgcmVzb3VyY2UgYW5kCj4g
Y29ubmVjdGlvbiBzdHJ1Y3RzIiksIGFkZCBtZW1zZXQgaXMgb2RkIGhlcmUgZm9yIGRlYnVnZ2lu
ZywgdGhlcmUgYXJlCj4gc29tZSBtZXRob2RzIHRvIGFjY3VyYXRlbHkgc2hvdyB3aGF0IGhhcHBl
bmVkLCBzdWNoIGFzIGtkdW1wLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgU2hhb0JvIDxib2Jv
LnNoYW9ib3dhbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bWFpbi5jIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX21haW4uYwo+IGluZGV4IDg1MzJiODM5YTM0My4uNzhjYWU0ZTc1YWYxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX21haW4uYwo+IEBAIC0yMjE3LDcgKzIyMTcsNiBAQCB2b2lkIGRyYmRf
ZGVzdHJveV9kZXZpY2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gIAkJa3JlZl9wdXQoJnBlZXJfZGV2
aWNlLT5jb25uZWN0aW9uLT5rcmVmLCBkcmJkX2Rlc3Ryb3lfY29ubmVjdGlvbik7Cj4gIAkJa2Zy
ZWUocGVlcl9kZXZpY2UpOwo+ICAJfQo+IC0JbWVtc2V0KGRldmljZSwgMHhmZCwgc2l6ZW9mKCpk
ZXZpY2UpKTsKPiAgCWtmcmVlKGRldmljZSk7Cj4gIAlrcmVmX3B1dCgmcmVzb3VyY2UtPmtyZWYs
IGRyYmRfZGVzdHJveV9yZXNvdXJjZSk7Cj4gIH0KPiBAQCAtMjMwOSw3ICsyMzA4LDYgQEAgdm9p
ZCBkcmJkX2Rlc3Ryb3lfcmVzb3VyY2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gIAlpZHJfZGVzdHJv
eSgmcmVzb3VyY2UtPmRldmljZXMpOwo+ICAJZnJlZV9jcHVtYXNrX3ZhcihyZXNvdXJjZS0+Y3B1
X21hc2spOwo+ICAJa2ZyZWUocmVzb3VyY2UtPm5hbWUpOwo+IC0JbWVtc2V0KHJlc291cmNlLCAw
eGYyLCBzaXplb2YoKnJlc291cmNlKSk7Cj4gIAlrZnJlZShyZXNvdXJjZSk7Cj4gIH0KPiAgCj4g
QEAgLTI2NTAsNyArMjY0OCw2IEBAIHZvaWQgZHJiZF9kZXN0cm95X2Nvbm5lY3Rpb24oc3RydWN0
IGtyZWYgKmtyZWYpCj4gIAlkcmJkX2ZyZWVfc29ja2V0KCZjb25uZWN0aW9uLT5kYXRhKTsKPiAg
CWtmcmVlKGNvbm5lY3Rpb24tPmludF9kaWdfaW4pOwo+ICAJa2ZyZWUoY29ubmVjdGlvbi0+aW50
X2RpZ192dik7Cj4gLQltZW1zZXQoY29ubmVjdGlvbiwgMHhmYywgc2l6ZW9mKCpjb25uZWN0aW9u
KSk7Cj4gIAlrZnJlZShjb25uZWN0aW9uKTsKPiAgCWtyZWZfcHV0KCZyZXNvdXJjZS0+a3JlZiwg
ZHJiZF9kZXN0cm95X3Jlc291cmNlKTsKPiAgfQoKVGhhbmtzIQoKQWNrZWQtYnk6IENocmlzdG9w
aCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+CgotLSAKQ2hy
aXN0b3BoIELDtmhtd2FsZGVyCkxJTkJJVCB8IEtlZXBpbmcgdGhlIERpZ2l0YWwgV29ybGQgUnVu
bmluZwpEUkJEIEhBIOKAlCAgRGlzYXN0ZXIgUmVjb3Zlcnkg4oCUIFNvZnR3YXJlIGRlZmluZWQg
U3RvcmFnZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xp
c3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
