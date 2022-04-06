Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DD4F58DB
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 11:20:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0035A420FC6;
	Wed,  6 Apr 2022 11:20:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C111420FBE
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 11:20:40 +0200 (CEST)
Received: by mail-ej1-f53.google.com with SMTP id dr20so2948941ejc.6
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:references:cc:from:in-reply-to:content-transfer-encoding;
	bh=cPA/bsRgdiVgbTJ1hE685J08E3jaB70rUNJ81hiw1vY=;
	b=vjJEp9awH2e6/CirKPbxJyFkWmJleCZsh+Jud/UCvf+NBBQsjRwrpJ1bs36uJsV4xH
	Kqlw1po9mhRBTqZqIDkKTh72zKTaG7KRRxNmhHOq0OoP7jpuj56QU4kAbW+Val9U7Y0g
	h7auwUj3Dlf9UifcU453hC9Ceq9y+k2MDbm8idYHIEjO79Mf0cJoBJEoOYVs+Zq2BKGL
	a7Ipsnlg/Y5kDPUyUb5uon37yifOwhUNasky7gdiL3TRXViCOcOO1/vyX0aZLMYPhnfb
	Gx9vMHW0uckmFlKfa1/xGUeWRyWZfD8BorGEVX+PnU27zmN+OeOaISp9SfbGFjb+GmXZ
	8g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:cc:from:in-reply-to
	:content-transfer-encoding;
	bh=cPA/bsRgdiVgbTJ1hE685J08E3jaB70rUNJ81hiw1vY=;
	b=sEO84mqkKeD/gw3wvM7mFRYA2ARkAoc8JNmaaelUQSX/4Wn7B0dc7wOZwrlUCrbmQo
	vSYFC1JmyOj21z0lUls7bi79aK7nDRnxcts37fj6b7pN/VXJGxefhQn4mzOoCUv903y8
	aXbwbuBcA9Cl/kdaUwI6he40jv4b/XirttmKR3jGRkZmXoHhc7gHHCwXnG9nFCVDaY5v
	/TIaxfec9lb8+n800LlqIB1iWClxwthTbHmpA/EW1JpS7RLbFPOYiKgmv4mjEONhj7Ch
	ACyF8gP/szpEGA1+xwSvk03P8COhdp3tFTazt4ySkKW5sJlVKFa0pZ6tYqQx5hsmi38W
	sbFA==
X-Gm-Message-State: AOAM533jiG++GnojdG3D1SQv7jP+7S5YXKKmMqycHX0ZRq/KWwsw6MOj
	WqycxeVZZkFaypf46E0zHxnN2UYQ
X-Google-Smtp-Source: ABdhPJxDsUD/X+dseJ9Jl2i+zvLw2FFnbZ61ORhd7f4V49vtcFHIEkYYNy4/rQfmJukZXq81hn5GSg==
X-Received: by 2002:a17:907:3f86:b0:6df:ad43:583 with SMTP id
	hr6-20020a1709073f8600b006dfad430583mr7361894ejc.535.1649236840577;
	Wed, 06 Apr 2022 02:20:40 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	b8-20020a056402350800b00419407f0dd9sm7708780edd.0.2022.04.06.02.20.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 02:20:39 -0700 (PDT)
Message-ID: <012329f8-01db-7b17-0f64-2d63e86afc75@linbit.com>
Date: Wed, 6 Apr 2022 11:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-6-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220406060516.409838-6-hch@lst.de>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 05/27] drbd: use bdev based limit helpers in
 drbd_send_sizes
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

QW0gMDYuMDQuMjIgdW0gMDg6MDQgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBVc2UgdGhl
IGJkZXYgYmFzZWQgbGltaXRzIGhlbHBlcnMgd2hlcmUgdGhleSBleGlzdC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfbWFpbi5jIHwgMTUgKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYwo+IGluZGV4IDc0YjFiMjQyNGVmZmYuLmQyMGQ4NGVlN2E4OGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbWFpbi5jCj4gQEAgLTkyNCw3ICs5MjQsOSBAQCBpbnQgZHJiZF9zZW5kX3NpemVzKHN0
cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdnZXJfcmVwbHksIGVu
dQo+ICAKPiAgCW1lbXNldChwLCAwLCBwYWNrZXRfc2l6ZSk7Cj4gIAlpZiAoZ2V0X2xkZXZfaWZf
c3RhdGUoZGV2aWNlLCBEX05FR09USUFUSU5HKSkgewo+IC0JCXN0cnVjdCByZXF1ZXN0X3F1ZXVl
ICpxID0gYmRldl9nZXRfcXVldWUoZGV2aWNlLT5sZGV2LT5iYWNraW5nX2JkZXYpOwo+ICsJCXN0
cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldjsKPiAr
CQlzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSA9IGJkZXZfZ2V0X3F1ZXVlKGJkZXYpOwo+ICsKPiAg
CQlkX3NpemUgPSBkcmJkX2dldF9tYXhfY2FwYWNpdHkoZGV2aWNlLT5sZGV2KTsKPiAgCQlyY3Vf
cmVhZF9sb2NrKCk7Cj4gIAkJdV9zaXplID0gcmN1X2RlcmVmZXJlbmNlKGRldmljZS0+bGRldi0+
ZGlza19jb25mKS0+ZGlza19zaXplOwo+IEBAIC05MzMsMTYgKzkzNSwxNSBAQCBpbnQgZHJiZF9z
ZW5kX3NpemVzKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdn
ZXJfcmVwbHksIGVudQo+ICAJCW1heF9iaW9fc2l6ZSA9IHF1ZXVlX21heF9od19zZWN0b3JzKHEp
IDw8IDk7Cj4gIAkJbWF4X2Jpb19zaXplID0gbWluKG1heF9iaW9fc2l6ZSwgRFJCRF9NQVhfQklP
X1NJWkUpOwo+ICAJCXAtPnFsaW0tPnBoeXNpY2FsX2Jsb2NrX3NpemUgPQo+IC0JCQljcHVfdG9f
YmUzMihxdWV1ZV9waHlzaWNhbF9ibG9ja19zaXplKHEpKTsKPiArCQkJY3B1X3RvX2JlMzIoYmRl
dl9waHlzaWNhbF9ibG9ja19zaXplKGJkZXYpKTsKPiAgCQlwLT5xbGltLT5sb2dpY2FsX2Jsb2Nr
X3NpemUgPQo+IC0JCQljcHVfdG9fYmUzMihxdWV1ZV9sb2dpY2FsX2Jsb2NrX3NpemUocSkpOwo+
ICsJCQljcHVfdG9fYmUzMihiZGV2X2xvZ2ljYWxfYmxvY2tfc2l6ZShiZGV2KSk7Cj4gIAkJcC0+
cWxpbS0+YWxpZ25tZW50X29mZnNldCA9Cj4gIAkJCWNwdV90b19iZTMyKHF1ZXVlX2FsaWdubWVu
dF9vZmZzZXQocSkpOwo+IC0JCXAtPnFsaW0tPmlvX21pbiA9IGNwdV90b19iZTMyKHF1ZXVlX2lv
X21pbihxKSk7Cj4gLQkJcC0+cWxpbS0+aW9fb3B0ID0gY3B1X3RvX2JlMzIocXVldWVfaW9fb3B0
KHEpKTsKPiArCQlwLT5xbGltLT5pb19taW4gPSBjcHVfdG9fYmUzMihiZGV2X2lvX21pbihiZGV2
KSk7Cj4gKwkJcC0+cWxpbS0+aW9fb3B0ID0gY3B1X3RvX2JlMzIoYmRldl9pb19vcHQoYmRldikp
Owo+ICAJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19xdWV1ZV9kaXNjYXJkKHEpOwo+
IC0JCXAtPnFsaW0tPndyaXRlX3NhbWVfY2FwYWJsZSA9Cj4gLQkJCSEhcS0+bGltaXRzLm1heF93
cml0ZV9zYW1lX3NlY3RvcnM7Cj4gKwkJcC0+cWxpbS0+d3JpdGVfc2FtZV9jYXBhYmxlID0gMDsK
PiAgCQlwdXRfbGRldihkZXZpY2UpOwo+ICAJfSBlbHNlIHsKPiAgCQlzdHJ1Y3QgcmVxdWVzdF9x
dWV1ZSAqcSA9IGRldmljZS0+cnFfcXVldWU7CgpBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2Fs
ZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQt
ZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlz
dGluZm8vZHJiZC1kZXYK
