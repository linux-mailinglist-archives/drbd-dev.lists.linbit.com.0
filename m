Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA33632143
	for <lists+drbd-dev@lfdr.de>; Mon, 21 Nov 2022 12:51:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6EEE44210CC;
	Mon, 21 Nov 2022 12:51:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CD6E442066F
	for <drbd-dev@lists.linbit.com>; Mon, 21 Nov 2022 12:51:36 +0100 (CET)
Received: by mail-ej1-f50.google.com with SMTP id n12so27846231eja.11
	for <drbd-dev@lists.linbit.com>; Mon, 21 Nov 2022 03:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=q+H0cjFSbZ2NYb5IOmqZhEkYfmqZxas//5HpSyQajMM=;
	b=SHV0eCpZqjwnUaMw04SDLes0LCt6CEx/9ClffLY20Cz0aH+xHM2BjEOrdhS2651Mz/
	dRGchDq+loJGLlUACmo3bf8c3kKUM41rUBbxhQYbeZl860bwog4aSEZVR6UGssPfvl0v
	mWdrUtgHOmpj+1gEdj0ngyBPWaaZHwjgQ1xv/FMeds+Y6LxzCA1qZQNjNyoK8QHVLRRW
	kWwSUSHu1h7ANGCuLrLTAKgHITw4guqVjcLEmyrsAS8gJVWRls8S8sN3j5lkWGytoDcu
	CjArIFf4ARk9xKC+N2ZOESWk0Ki4R/2RhvpY5vWYvp5LsFxjAJUU9nwIE3J7+iF3LtS2
	+8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=q+H0cjFSbZ2NYb5IOmqZhEkYfmqZxas//5HpSyQajMM=;
	b=JXEVKMrPqONKQQuuzhe51bcBkox1fW7Di9Cp7lq3LlSMtmRFwcTWonacqkd6zxjXZ/
	Eg5SoLx7J+uxF4H0Iq0X56OhLIx0ahfrvIgTJvveqUEhEsQ3MObqQMPiucbpwKfP4gf7
	Mmd3Q8gfRosig9/OY2/qBBRC/47Z78AyZxzT68hVNuNJoCGmKlfYNpMWCAg88II8NUAa
	r/FvJ3rP6fgeFwfdqwm57P+GWzw4QsDXZUN1A3Sq2bstianzVcI0am9N26S+8HWNNSgx
	9mgnYeAKxxyEFuX7uMd03ft5yggFUNYOYv3uJmDpqpzlUws9r2RrIKGl+kjomiOW8L2K
	yhkQ==
X-Gm-Message-State: ANoB5pkjRpIP+9sAfIq3/Hls2uj/c7F/ZkEeoWB5O4vc91Xk1lJUBzZY
	1NaVzimB8vJecU7XOE52wtsxjGCG
X-Google-Smtp-Source: AA0mqf40LwWPAZsMgJuW1DO7GYQI5qt7733/8RiNE/Z0spkiNSRxXsspRKdks236/YaTyeBjewz2bw==
X-Received: by 2002:a17:906:3289:b0:78d:4cb3:f65d with SMTP id
	9-20020a170906328900b0078d4cb3f65dmr4177725ejw.79.1669031496137;
	Mon, 21 Nov 2022 03:51:36 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	kw10-20020a170907770a00b0078d4ee47c82sm4914081ejc.129.2022.11.21.03.51.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 21 Nov 2022 03:51:35 -0800 (PST)
Message-ID: <3603e71c-cd9d-fd27-7c52-1eed263e8717@linbit.com>
Date: Mon, 21 Nov 2022 12:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.1
Content-Language: en-US
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20221121111138.3665586-1-bobo.shaobowang@huawei.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221121111138.3665586-1-bobo.shaobowang@huawei.com>
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, liwei391@huawei.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: destroy workqueue when drbd device was
	freed
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

QW0gMjEuMTEuMjIgdW0gMTI6MTEgc2NocmllYiBXYW5nIFNoYW9CbzoKPiBBIHN1Ym1pdHRlciB3
b3JrcXVldWUgaXMgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGJ5IGluaXRfc3VibWl0dGVyKCkKPiBj
YWxsZWQgYnkgZHJiZF9jcmVhdGVfZGV2aWNlKCksIHdlIHNob3VsZCBkZXN0cm95IGl0IHdoZW4g
dGhpcwo+IGRldmljZSB3YXMgbm90IG5lZWRlZCBvciBkZXN0cm95ZWQuCj4gCj4gRml4ZXM6IDEx
M2ZlZjllMjBlMCAoImRyYmQ6IHByZXBhcmUgdG8gcXVldWUgd3JpdGUgcmVxdWVzdHMgb24gYSBz
dWJtaXQgd29ya2VyIikKPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFNoYW9CbyA8Ym9iby5zaGFvYm93
YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyB8
IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9tYWluLmMKPiBpbmRleCA4NTMyYjgzOWEzNDMuLjQ2N2M0OThlM2FkZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKPiArKysgYi9kcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9tYWluLmMKPiBAQCAtMjIxOCw2ICsyMjE4LDkgQEAgdm9pZCBkcmJkX2Rlc3Ry
b3lfZGV2aWNlKHN0cnVjdCBrcmVmICprcmVmKQo+ICAJCWtmcmVlKHBlZXJfZGV2aWNlKTsKPiAg
CX0KPiAgCW1lbXNldChkZXZpY2UsIDB4ZmQsIHNpemVvZigqZGV2aWNlKSk7Cj4gKwo+ICsJaWYg
KGRldmljZS0+c3VibWl0LndxKQo+ICsJCWRlc3Ryb3lfd29ya3F1ZXVlKGRldmljZS0+c3VibWl0
LndxKTsKPiAgCWtmcmVlKGRldmljZSk7Cj4gIAlrcmVmX3B1dCgmcmVzb3VyY2UtPmtyZWYsIGRy
YmRfZGVzdHJveV9yZXNvdXJjZSk7Cj4gIH0KPiBAQCAtMjgxMCw2ICsyODEzLDggQEAgZW51bSBk
cmJkX3JldF9jb2RlIGRyYmRfY3JlYXRlX2RldmljZShzdHJ1Y3QgZHJiZF9jb25maWdfY29udGV4
dCAqYWRtX2N0eCwgdW5zaWcKPiAgCXB1dF9kaXNrKGRpc2spOwo+ICBvdXRfbm9fZGlzazoKPiAg
CWtyZWZfcHV0KCZyZXNvdXJjZS0+a3JlZiwgZHJiZF9kZXN0cm95X3Jlc291cmNlKTsKPiArCWlm
IChkZXZpY2UtPnN1Ym1pdC53cSkKPiArCQlkZXN0cm95X3dvcmtxdWV1ZShkZXZpY2UtPnN1Ym1p
dC53cSk7Cj4gIAlrZnJlZShkZXZpY2UpOwo+ICAJcmV0dXJuIGVycjsKPiAgfQoKVGhhbmtzIGZv
ciB0aGUgcGF0Y2guCgpVbmZvcnR1bmF0ZWx5LCAoYXQgbGVhc3QpIHRoZSBmaXJzdCBodW5rIGlz
IGJ1Z2d5OiB3ZSBtZW1zZXQoKSB0aGUKZGV2aWNlIHRvIGFsbCAweGZkLCBhbmQgdHJ5IHRvIGFj
Y2VzcyBpdCBpbW1lZGlhdGVseSBhZnRlcndhcmRzLgoKVGhpcyBvYnZpb3VzbHkgbGVhZHMgdG8g
aW52YWxpZCBtZW1vcnkgYWNjZXNzLgoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQg
fCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVy
IFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQt
ZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlz
dGluZm8vZHJiZC1kZXYK
