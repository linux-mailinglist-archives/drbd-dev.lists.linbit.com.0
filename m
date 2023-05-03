Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F04056F56EC
	for <lists+drbd-dev@lfdr.de>; Wed,  3 May 2023 13:07:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BD1742066F;
	Wed,  3 May 2023 13:07:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3A1F04202E9
	for <drbd-dev@lists.linbit.com>; Wed,  3 May 2023 13:06:59 +0200 (CEST)
Received: by mail-wm1-f44.google.com with SMTP id
	5b1f17b1804b1-3f4000ec71dso1972555e9.2
	for <drbd-dev@lists.linbit.com>; Wed, 03 May 2023 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1683111959;
	x=1685703959; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=zC1Gta3a1KlJpbjr0dHCub5GbkSXMMiO3N0auJSFEi4=;
	b=5WhYU1zjMzb3TRHB1ZMk7kLTS0gKNrQH6Y+bzmvOp+q02IjV9kk6xvjBSHRbTeiBU8
	9C9b40A8nGaZpu2kkWZINs88/ff/9yp228wkRX/6hdH3/mwpUMV10573pUulpY5gv7FA
	Xngnq88/iEOCk/UJA/wG0paP+7OyXCfo6DnTpibkGHznrTuCvdpgd1pOuDxkT8KkmOgq
	wK1Jxilbjc7JXsXzsTMDBAxC/SAG0N5epLX/RGX+H9VnewcAQiusg7zsjvxTN8o//g9s
	JTGRX2Hv0PF2oN5CkRkOyFGt95YQw0e96Gi5jnY7FQzfRE+iG1P4csBYqMzx1kqubBWe
	2kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1683111959; x=1685703959;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=zC1Gta3a1KlJpbjr0dHCub5GbkSXMMiO3N0auJSFEi4=;
	b=UaHdBxPHm6KzuviXZ6c9nmk+mLb6JOFWWJwZlVWUHkjkr1akoz6CedCihHkNGDfn7M
	PDJek7l3O5zttNDFhbUhvjB4CE8k7vsYlINIW9hDhzdf0qQCKHI2m7tKP28HMzQIpbe/
	6D3GZN2LIkvyt7jtoUfMyHyiyWk5WwqUzXsY+aLNW3IbZ+rIJZIjiedgTb9j0GUW1+m3
	Dq6kyCl5kpNVxcQYtkBfW3hHdhuzakLTNLgySb9FhX22nN+5+WuNVeKIJSWBFl2ejZqF
	y9GctFaOI48MVXNnEVufVzL0sqrS9DNYsEkIhKKJzfTUrti7FosFxDAYTqx2k0iI0/mI
	rPkA==
X-Gm-Message-State: AC+VfDw2190UJralr5v4AHY2pWxSOCXQ3Mg16rg34HogbuPSeY9kb4pa
	SQBAeZwEXFajEv4F33wqjxdsPkNl
X-Google-Smtp-Source: ACHHUZ7zkhTIpzWubzYVvlBwUFu5dNo6evewdVN6u2chVe57/nTRHxWkzD+fPR2/AIMcjUnNBk+8cQ==
X-Received: by 2002:adf:e2cc:0:b0:305:ed26:8576 with SMTP id
	d12-20020adfe2cc000000b00305ed268576mr9968284wrj.9.1683111959225;
	Wed, 03 May 2023 04:05:59 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	o2-20020a5d58c2000000b002fe522117fdsm33440960wrf.36.2023.05.03.04.05.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 03 May 2023 04:05:58 -0700 (PDT)
Message-ID: <b1568ca5-4daf-f6b5-7861-4881aa46e578@linbit.com>
Date: Wed, 3 May 2023 13:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.1
To: Christoph Hellwig <hch@infradead.org>
References: <20230502092922.175857-1-christoph.boehmwalder@linbit.com>
	<ZFHgefWofVt24tRl@infradead.org>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <ZFHgefWofVt24tRl@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Voegtle <tv@lio96.de>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: do not set REQ_PREFLUSH when
	submitting barrier
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

QW0gMDMuMDUuMjMgdW0gMDY6MTggc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBPbiBUdWUs
IE1heSAwMiwgMjAyMyBhdCAxMToyOToyMkFNICswMjAwLCBDaHJpc3RvcGggQsO2aG13YWxkZXIg
d3JvdGU6Cj4+ICAJc3RydWN0IGJpbyAqYmlvID0gYmlvX2FsbG9jKGRldmljZS0+bGRldi0+YmFj
a2luZ19iZGV2LCAwLAo+PiAtCQkJCSAgICBSRVFfT1BfRkxVU0ggfCBSRVFfUFJFRkxVU0gsIEdG
UF9OT0lPKTsKPj4gKwkJCQkgICAgUkVRX09QX0ZMVVNILCBHRlBfTk9JTyk7Cj4gCj4gVGhpcyBp
c24ndCBnb2luZyB0byB3b3JrLiAgZmx1c2ggYmlvcyBhcmUgKHNvbWV3aGF0IGNvbmZ1c2luZ2x5
KQoKSW5kZWVkLi4uCgo+IGltcGxlbWVudGVkIGFzIHdyaXRlcyB3aXRoIG5vIGRhdGEgYW5kIHRo
ZSBwcmVmbHVzaCBmbGFnLiAgU28gdGhpcwo+IHNob3VsZCBiZToKPiAKPiAJUkVRX09QX1dSSVRF
IHwgUkVRX1BSRUZMVVNILgo+IAo+IGFuZCBpdCBsb29rcyBsaWtlIHdoYXRldmVyIGZsdXNoaW5n
IHRoaXMgZG9lcyBoYXNuJ3Qgd3Jva2VkIGZvciBhIGxvbmcKPiB0aW1lLgoKVGhhbmtzIGZvciB0
aGUgaGludC4gSSdsbCBwcmVwYXJlIGEgdjIgdG9kYXkuCgotLSAKQ2hyaXN0b3BoIELDtmhtd2Fs
ZGVyCkxJTkJJVCB8IEtlZXBpbmcgdGhlIERpZ2l0YWwgV29ybGQgUnVubmluZwpEUkJEIEhBIOKA
lCAgRGlzYXN0ZXIgUmVjb3Zlcnkg4oCUIFNvZnR3YXJlIGRlZmluZWQgU3RvcmFnZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5n
IGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
