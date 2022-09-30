Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A15F1067
	for <lists+drbd-dev@lfdr.de>; Fri, 30 Sep 2022 19:02:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6E1624205B7;
	Fri, 30 Sep 2022 19:02:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7EA264203DF
	for <drbd-dev@lists.linbit.com>; Fri, 30 Sep 2022 19:02:47 +0200 (CEST)
Received: by mail-ed1-f41.google.com with SMTP id a13so6817291edj.0
	for <drbd-dev@lists.linbit.com>; Fri, 30 Sep 2022 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:cc:references:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date;
	bh=cLdn4xajpjBAZzVS8DA/pKcP0z9vHCmd8syFpbJkUe8=;
	b=PXvV06VzB2UfjQR+NI7SLWoVr867yUmibfb2iCAWScBJbV9vV8FIqbOgyWJBcYGqSJ
	YfMljDiXO+Zak8iq55Z8XND6ZBczuGJkqijnkaADiMkHupGL6x9ZxifS52kYqNRR9bre
	MSwdODt9TNoWAoGIOjn+WpJ476A7Ipb4NhEc3m60b3Gl30okQfDmzNhH8MGsmmkifpyi
	nKzRgHdj1cW5rl5PxpRyMTtjWuyuSp8iMrPxkGkg7LMNq0uRPKjESNhfbmmqQiU58GhK
	l0DzPxxVm3u6FLxd+dLC7IvisGaG3VF1jzi54/6l2uVlJVoqlVHog/RkMpUCxjHRWpKV
	JGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:cc:references:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date;
	bh=cLdn4xajpjBAZzVS8DA/pKcP0z9vHCmd8syFpbJkUe8=;
	b=UYewZhFXkdaNPnY+bGe5ztNJ1IIejeX6csUMZ6kkeHndY/nlr8SKzJGUxUSHhdrHNz
	9fB2oNnAekLPIvBf32kH19HqJPZlqxu/QXMvlK0qH/NNxoPiSS9uLxtxZB1OmZpmefig
	Pk3D2re0rk8vlIS+D6hV017JZ9p3aM9UED622CnXNSlXkG62nNwiwrdv2/45dZ+QB5WL
	mNdJuIOK2Mj99lyIHv1uak6tSXJRKxy4ArSsR5oTmIYIt0HpeyVr0cAK8i9n41eCLy7m
	tD6vEdLz565N+gpJLloq2KszVoWEIhYamr2lDhPH6oMTNeAB47+EGKCnyz1nZVb1+Ikq
	f//Q==
X-Gm-Message-State: ACrzQf0DxdmXCFjC/dtIBBMMkZffGi1Yt2jvi23C5H1ZcY3qdHP2t/Qv
	+SJcJRt42iPOAC7OawoUPYVinSFO
X-Google-Smtp-Source: AMsMyM6QaCGmSfEaOdotrLDf9Bsu8XbUScq2m9JXGnabqwoZDSYQQ4AozIlPibVp5NDoMaGy2gnt7w==
X-Received: by 2002:a05:6402:1e96:b0:451:129e:1a2c with SMTP id
	f22-20020a0564021e9600b00451129e1a2cmr8713685edf.60.1664557366775;
	Fri, 30 Sep 2022 10:02:46 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	t12-20020a170906948c00b0078034812bc7sm1382826ejx.200.2022.09.30.10.02.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 30 Sep 2022 10:02:46 -0700 (PDT)
Message-ID: <10dbb972-a61a-6b89-b08b-d53e8a2a6cc7@linbit.com>
Date: Fri, 30 Sep 2022 19:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.3.0
Content-Language: en-US
To: Michael D Labriola <veggiemike@sourceruckus.org>
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
	<20220908211337.17090-4-veggiemike@sourceruckus.org>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220908211337.17090-4-veggiemike@sourceruckus.org>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/3] drbd: use bio_alloc_clone() instead of
 bio_clone_fast()
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

QW0gMDguMDkuMjIgdW0gMjM6MTMgc2NocmllYiBNaWNoYWVsIEQgTGFicmlvbGE6Cj4gQmV0d2Vl
biA1LjE3IGFuZCA1LjE4LCBiaW9fY2xvbmVfZmFzdCgpIHdhcyBtb2RpZmllZCB0byB0YWtlIGEK
PiBibG9ja19kZXZpY2UgYW5kIHRoZSBmdW5jdGlvbiB3YXMgcmVuYW1lZC4gIFRoaXMgY29tbWl0
IG1pZ3JhdGVzIHRvCj4gdGhlIG5ldyB1c2FnZS4KPiAKPiBVcHN0cmVhbSBjb21taXRzOgo+IGFi
ZmM0MjZkIGJsb2NrOiBwYXNzIGEgYmxvY2tfZGV2aWNlIHRvIGJpb19jbG9uZV9mYXN0Cj4gCj4g
U2lnbmVkLW9mZi1ieTogTWljaGFlbCBEIExhYnJpb2xhIDx2ZWdnaWVtaWtlQHNvdXJjZXJ1Y2t1
cy5vcmc+Cj4gLS0tCj4gIGRyYmQvZHJiZF9yZXEuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyYmQvZHJi
ZF9yZXEuYyBiL2RyYmQvZHJiZF9yZXEuYwo+IGluZGV4IGZjN2RmYjhkLi4wNmJhOGNlOCAxMDA2
NDQKPiAtLS0gYS9kcmJkL2RyYmRfcmVxLmMKPiArKysgYi9kcmJkL2RyYmRfcmVxLmMKPiBAQCAt
MTcxNSw3ICsxNzE1LDcgQEAgZHJiZF9yZXF1ZXN0X3ByZXBhcmUoc3RydWN0IGRyYmRfZGV2aWNl
ICpkZXZpY2UsIHN0cnVjdCBiaW8gKmJpbywKPiAgCXJlcS0+c3RhcnRfamlmID0gYmlvX3N0YXJ0
X2lvX2FjY3QocmVxLT5tYXN0ZXJfYmlvKTsKPiAgCj4gIAlpZiAoZ2V0X2xkZXYoZGV2aWNlKSkg
ewo+IC0JCXJlcS0+cHJpdmF0ZV9iaW8gID0gYmlvX2Nsb25lX2Zhc3QoYmlvLCBHRlBfTk9JTywg
JmRyYmRfaW9fYmlvX3NldCk7Cj4gKwkJcmVxLT5wcml2YXRlX2JpbyAgPSBiaW9fYWxsb2NfY2xv
bmUoYmlvLT5iaV9iZGV2LCBiaW8sIEdGUF9OT0lPLCAmZHJiZF9pb19iaW9fc2V0KTsKPiAgCQly
ZXEtPnByaXZhdGVfYmlvLT5iaV9wcml2YXRlID0gcmVxOwo+ICAJCXJlcS0+cHJpdmF0ZV9iaW8t
PmJpX2VuZF9pbyA9IGRyYmRfcmVxdWVzdF9lbmRpbzsKPiAgCX0KClRoYW5rcyBmb3IgdGhlIHBh
dGNoIQoKQXBwbGllZCBhcwpodHRwczovL2dpdGh1Yi5jb20vTElOQklUL2RyYmQvY29tbWl0Lzk0
NWI1ZTU4YWQxNzYxYzFmNmU4NzRlMGRiN2FlZTdmNDJkMTE4MjcuCgooQW5kIGZpeGVkIHVwIGlu
Cmh0dHBzOi8vZ2l0aHViLmNvbS9MSU5CSVQvZHJiZC9jb21taXQvN2U3MTExYjk0YjhlZjEwMGE2
ZTNiNWZlYTA4NDEwNTEyMmFkMDU0Ngo7KQoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRlcgpMSU5C
SVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQgIERpc2Fz
dGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
