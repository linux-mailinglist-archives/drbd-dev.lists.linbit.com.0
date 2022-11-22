Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA2633BF9
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 13:02:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 80555421743;
	Tue, 22 Nov 2022 13:01:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09507421743
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 13:01:53 +0100 (CET)
Received: by mail-wr1-f47.google.com with SMTP id s5so7166701wru.1
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=qb4RJR8ylDg3gto72YXsWpWWkJFXTlWFNAJNj7lhF2c=;
	b=IlZaDJz1Pp3VXP8AR9lNUegK3XlNLzsrtowBNmH/uMteoUt3vouFTIWaD3E3SC2rjv
	PJKWOE1QyHTH/Ue1stpp9ZhZUKiuGRmRg9AZntzUbbWjKzMvmz1cvAJUVshYtho7b6TN
	mI2YKvpfZzvuZm4rCS7Q+5i2gnoMke7yqLm3vJ8XOlyiLpMbSKoOzN7sgUX9qo+lJjL3
	+fwj8odyIqRSn9fAkAF+zoCZayjFLT3VNX/fp5+7jN1AuAfzy87lSW3CTTUiG0TmpZdo
	zkK8nAAsvEui9nCbBNU6tm8eQ6FqQrJWs496XpbsvqM4eCg986k8M92YJsCTUM1qIC5g
	rXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=qb4RJR8ylDg3gto72YXsWpWWkJFXTlWFNAJNj7lhF2c=;
	b=on/izJcBW83rvZBqHyJYlbzwz89qE236hYK6ar0aeeJvXYH7cXOB5U/q8k+R48qJw8
	2+reV9uHIZYQstETYnvF524dhPLRNjq9awZUkrZXHg25H3FUqATlZJ/Zvf81BQsM18NN
	8utbI9XQV4//7g9/iIiTFC+Bxufk5Bj/XxoAaNYug3R6rPSX8PR6YTF/Gh1XzkJ/dbXG
	83HTnuSyiJQRGSMRRwlIiM+/YMix9i2fm6aGqTVeyYXP3MQHqK+njKb1EQerVmOVna9t
	I95x9Jv/tZcl5NTjPuklmSrtNGhpDsvDBbPvf2RSfNFLtAeKFmZFN1+8rmVfYdcu+7Fl
	2maw==
X-Gm-Message-State: ANoB5pkeH4Ds779ys958ZuRI1X7cPD62IUvoaL0fHiSMmCfLwKCm+hc8
	yu3i8VILsYA16t9jl3ONXjY4maTY
X-Google-Smtp-Source: AA0mqf6ia2nZqMM6cTVqXCaMyp+QcMibSrdd2TYim5/9fDE0JEnPYYH3KTsM1Fat2m3lXTlVzvGtGQ==
X-Received: by 2002:a5d:430e:0:b0:241:bfb6:c6da with SMTP id
	h14-20020a5d430e000000b00241bfb6c6damr3253870wrq.204.1669118513405;
	Tue, 22 Nov 2022 04:01:53 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	m2-20020a1c2602000000b003cfd58409desm20448499wmm.13.2022.11.22.04.01.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 22 Nov 2022 04:01:52 -0800 (PST)
Message-ID: <feff21b0-e583-4df3-7c38-4990ee60c3e4@linbit.com>
Date: Tue, 22 Nov 2022 13:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.1
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20221122030427.731308-1-bobo.shaobowang@huawei.com>
	<20221122030427.731308-3-bobo.shaobowang@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221122030427.731308-3-bobo.shaobowang@huawei.com>
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, lars.ellenberg@linbit.com,
	liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 2/2] drbd: destroy workqueue when drbd
	device was freed
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

QW0gMjIuMTEuMjIgdW0gMDQ6MDQgc2NocmllYiBXYW5nIFNoYW9CbzoKPiBBIHN1Ym1pdHRlciB3
b3JrcXVldWUgaXMgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGJ5IGluaXRfc3VibWl0dGVyKCkKPiBj
YWxsZWQgYnkgZHJiZF9jcmVhdGVfZGV2aWNlKCksIHdlIHNob3VsZCBkZXN0cm95IGl0IHdoZW4g
dGhpcwo+IGRldmljZSBpcyBub3QgbmVlZGVkIG9yIGRlc3Ryb3llZC4KPiAKPiBGaXhlczogMTEz
ZmVmOWUyMGUwICgiZHJiZDogcHJlcGFyZSB0byBxdWV1ZSB3cml0ZSByZXF1ZXN0cyBvbiBhIHN1
Ym1pdCB3b3JrZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgU2hhb0JvIDxib2JvLnNoYW9ib3dh
bmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIHwg
NCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfbWFpbi5jCj4gaW5kZXggNzhjYWU0ZTc1YWYxLi4yZDZiNmQxYzVmZjQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbWFpbi5jCj4gQEAgLTIyMTcsNiArMjIxNyw4IEBAIHZvaWQgZHJiZF9kZXN0cm95
X2RldmljZShzdHJ1Y3Qga3JlZiAqa3JlZikKPiAgCQlrcmVmX3B1dCgmcGVlcl9kZXZpY2UtPmNv
bm5lY3Rpb24tPmtyZWYsIGRyYmRfZGVzdHJveV9jb25uZWN0aW9uKTsKPiAgCQlrZnJlZShwZWVy
X2RldmljZSk7Cj4gIAl9Cj4gKwlpZiAoZGV2aWNlLT5zdWJtaXQud3EpCj4gKwkJZGVzdHJveV93
b3JrcXVldWUoZGV2aWNlLT5zdWJtaXQud3EpOwo+ICAJa2ZyZWUoZGV2aWNlKTsKPiAgCWtyZWZf
cHV0KCZyZXNvdXJjZS0+a3JlZiwgZHJiZF9kZXN0cm95X3Jlc291cmNlKTsKPiAgfQo+IEBAIC0y
ODA3LDYgKzI4MDksOCBAQCBlbnVtIGRyYmRfcmV0X2NvZGUgZHJiZF9jcmVhdGVfZGV2aWNlKHN0
cnVjdCBkcmJkX2NvbmZpZ19jb250ZXh0ICphZG1fY3R4LCB1bnNpZwo+ICAJcHV0X2Rpc2soZGlz
ayk7Cj4gIG91dF9ub19kaXNrOgo+ICAJa3JlZl9wdXQoJnJlc291cmNlLT5rcmVmLCBkcmJkX2Rl
c3Ryb3lfcmVzb3VyY2UpOwo+ICsJaWYgKGRldmljZS0+c3VibWl0LndxKQo+ICsJCWRlc3Ryb3lf
d29ya3F1ZXVlKGRldmljZS0+c3VibWl0LndxKTsKPiAgCWtmcmVlKGRldmljZSk7Cj4gIAlyZXR1
cm4gZXJyOwo+ICB9CgpUaGFua3MsIHRoYXQgaXMgYmV0dGVyLgoKSnVzdCBvbmUgbW9yZSBuaXRw
aWNrOiBpbiBkcmJkX2NyZWF0ZV9kZXZpY2UsIHdlIHVzdWFsbHkgb3JkZXIgdGhlCmFsbG9jYXRp
b25zL2ZyZWVzIGluIGEgImxhc3QgaW4sIGZpcnN0IG91dCIgZmFzaGlvbi4gVGhhdCBpcywgZGF0
YQpzaG91bGQgYmUgcmVsZWFzZWQgaW4gdGhlIHJldmVyc2Ugb3JkZXIgdGhhdCBpdCB3YXMgYWxs
b2NhdGVkLiBUaGlzIGFsc28KaGVscHMgd2l0aCBlcnJvciBoYW5kbGluZywgd2hpY2ggaXMgd2hh
dCB0aGUgb3V0XyogbGFiZWxzIGFyZSB1c2VkIGZvci4KClNvIG1heWJlIHdlIGNhbiBwdXQgdGhh
dCBkZXN0cm95X3dvcmtxdWV1ZSgpIHVuZGVyIGl0cyBvd24gb3V0XyogbGFiZWwKYW5kIG1ha2Ug
c3VyZSBpdCBnZXRzIGZyZWVkIGZpcnN0IGluIHRoZSBjbGVhbnVwIHNlY3Rpb24gKHNpbmNlIGl0
IGdldHMKYWxsb2NhdGVkIGxhc3QpLgoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQg
fCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVy
IFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQt
ZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlz
dGluZm8vZHJiZC1kZXYK
