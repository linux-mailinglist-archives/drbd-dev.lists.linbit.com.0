Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A675F5245
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 12:09:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A40F8421743;
	Wed,  5 Oct 2022 12:09:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
	[209.85.218.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DFB9C4210C8
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 12:09:23 +0200 (CEST)
Received: by mail-ej1-f54.google.com with SMTP id nb11so34395374ejc.5
	for <drbd-dev@lists.linbit.com>; Wed, 05 Oct 2022 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date;
	bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
	b=14U7AJwniruZFzbiY4kC6nsZlRvuSqb1QwTnO87x+fRvRhg52kqE3PLwic1cv6UI+b
	wxtaRyO+WZozOGf88hqNDIS0d8kGRHu94b0rcdjOrBTtNpMPKnxQUp9fyDFQVv1p4lwT
	9oAVJcqYseFceKxqgBWeZoSLo0DTN9Gz10LmFz2RpAA6luRa1gTkoumLHyuNtsjb23R3
	66037Fgcf54ctnyPbt6chWKdOLNMSKtWOPcxoIwbnX5WXyAom4hZa4oyF9nXf24bWT0P
	K9lw1zG3qgaRtbZiESDdnst2UoGyEh+WJg9WXPuCoOF4o8xgJN6xITBbcoTm7hcV1syU
	KUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date;
	bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
	b=VhDPjcHtW59WhdiIT53YCIxoLbcoe5vXTrLBvTyiZUktpAtdxmgzlsajPmnQ+Ijuba
	LmmKYpeNEtFPvjsfqFWW+6H4m/g79zdvrIOoIL17xIIYHUTBo4sW3D5In+yk/HjTjOTW
	sSWlCGao/qSddFHdMnJA3G6OzVHp37BH31F/ADHBzSxN/ZuoFCiM/Q8ZPoIohvJX40w8
	dGyQ5ki42OcJiBeK+PChqxq4QTYNx0UzTr44xMlNMExq68S3xcGIK8lvUVJOIm4oV/WU
	TfV0YjBAKkyuJqhTj2mxDMdTx5BCZY/ZIwOzzD5Yw5JFz43yc55n9yRZ5hgUC/jfkBGS
	rAEw==
X-Gm-Message-State: ACrzQf3Z8ti/hvlf3peSZrJB2b9HuyEq9rTCEiymlzbTi4bkQ/6ZgrP+
	2TvKf6hMXhZwC/8E+MOHl0r3tzse
X-Google-Smtp-Source: AMsMyM6XbFaI9HeMTnZcx9bHunTFZSA7fhJuT5NL+agaUKW54kA1JC5km35OuPCP5GklKV/YoQTu8A==
X-Received: by 2002:a17:907:1c08:b0:782:a340:56d7 with SMTP id
	nc8-20020a1709071c0800b00782a34056d7mr22357872ejc.98.1664964563179;
	Wed, 05 Oct 2022 03:09:23 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	r10-20020a1709061baa00b00782539a02absm8398012ejg.194.2022.10.05.03.09.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 05 Oct 2022 03:09:22 -0700 (PDT)
Message-ID: <e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com>
Date: Wed, 5 Oct 2022 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.3.0
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
	<20221005050027.39591-6-kch@nvidia.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221005050027.39591-6-kch@nvidia.com>
Cc: vincent.fu@samsung.com, vigneshr@ti.com, philipp.reisner@linbit.com,
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
	jinpu.wang@ionos.com, tim@cyberelk.net,
	drbd-dev@lists.linbit.com, bvanassche@acm.org, richard@nod.at,
	damien.lemoal@opensource.wdc.com, shinichiro.kawasaki@wdc.com,
	ogeert@linux-m68k.org, josef@toxicpanda.com, efremov@linux.com,
	nbd@other.debian.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, hare@suse.de,
	ming.lei@redhat.com, axboe@kernel.dk, johannes.thumshirn@wdc.com,
	linux-kernel@vger.kernel.org, mcgrof@kernel.org,
	haris.iqbal@ionos.com, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [RFC PATCH 05/18] drbd: use init disk helper
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

QW0gMDUuMTAuMjIgdW0gMDc6MDAgc2NocmllYiBDaGFpdGFueWEgS3Vsa2Fybmk6Cj4gQWRkIGFu
ZCB1c2UgdGhlIGhlbHBlciB0byBpbml0aWFsaXplIHRoZSBjb21tb24gZmllbGRzIG9mIHN0cnVj
dCBnZW5kaXNrCj4gc3VjaCBhcyBtYWpvciwgZmlyc3RfbWlub3IsIG1pbm9ycywgZGlza19uYW1l
LCBwcml2YXRlX2RhdGEsIGFuZCBvcHMuCj4gVGhpcyBpbml0aWFsaXphdGlvbiBpcyBzcHJlYWQg
YWxsIG92ZXIgdGhlIGJsb2NrIGRyaXZlcnMuIFRoaXMgYXZvaWRzCj4gY29kZSByZXBldGF0aW9u
IG9mIGluaWFsaXphdGlvbiBjb2RlIG9mIGdlbmRpc2sgaW4gY3VycmVudCBibG9jayBkcml2ZXJz
Cj4gYW5kIGFueSBmdXR1cmUgb25lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3Vs
a2FybmkgPGtjaEBudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4u
YyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+IGluZGV4IGYzZTRkYjE2ZmQwNy4u
NThmYWUxMjJkZTE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4u
Ywo+ICsrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+IEBAIC0yNzA2LDEzICsy
NzA2LDkgQEAgZW51bSBkcmJkX3JldF9jb2RlIGRyYmRfY3JlYXRlX2RldmljZShzdHJ1Y3QgZHJi
ZF9jb25maWdfY29udGV4dCAqYWRtX2N0eCwgdW5zaWcKPiAgCj4gIAlzZXRfZGlza19ybyhkaXNr
LCB0cnVlKTsKPiAgCj4gLQlkaXNrLT5tYWpvciA9IERSQkRfTUFKT1I7Cj4gLQlkaXNrLT5maXJz
dF9taW5vciA9IG1pbm9yOwo+IC0JZGlzay0+bWlub3JzID0gMTsKPiAtCWRpc2stPmZvcHMgPSAm
ZHJiZF9vcHM7Cj4gIAlkaXNrLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwo+ICAJc3ByaW50
ZihkaXNrLT5kaXNrX25hbWUsICJkcmJkJWQiLCBtaW5vcik7Cj4gLQlkaXNrLT5wcml2YXRlX2Rh
dGEgPSBkZXZpY2U7Cj4gKwlpbml0X2Rpc2soZGlzaywgRFJCRF9NQUpPUiwgbWlub3IsIDEsIDAs
IGRldmljZSwgJmRyYmRfb3BzKTsKPiAgCj4gIAlibGtfcXVldWVfZmxhZ19zZXQoUVVFVUVfRkxB
R19TVEFCTEVfV1JJVEVTLCBkaXNrLT5xdWV1ZSk7Cj4gIAlibGtfcXVldWVfd3JpdGVfY2FjaGUo
ZGlzay0+cXVldWUsIHRydWUsIHRydWUpOwoKVGhpcyBub3cgZG9lcyBhIHNldF9jYXBhY2l0eSgu
Li4sIDApLCB3aGljaCBpdCBkaWQgbm90IGRvIGJlZm9yZS4KSSdtIGd1ZXNzaW5nIHRoaXMgZG9l
cyBub3QgaGF2ZSBhbnkgc2lkZSBlZmZlY3RzIGFzIHRoZSBjYXBhY2l0eSBzaG91bGQKYWxyZWFk
eSBiZSBpbml0aWFsaXplZCB0byAwPyBEbyB5b3Uga25vdyB0aGlzIGZvciBzdXJlPwoKLS0gCkNo
cmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1
bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVk
IFN0b3JhZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9s
aXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
