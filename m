Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB67027AC
	for <lists+drbd-dev@lfdr.de>; Mon, 15 May 2023 10:57:24 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF4D1420AFD;
	Mon, 15 May 2023 10:57:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9AC64203AB
	for <drbd-dev@lists.linbit.com>; Mon, 15 May 2023 10:57:22 +0200 (CEST)
Received: by mail-wm1-f41.google.com with SMTP id
	5b1f17b1804b1-3f42c865534so66132545e9.2
	for <drbd-dev@lists.linbit.com>; Mon, 15 May 2023 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1684140982;
	x=1686732982; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=RIIUctl1bRw1HpPNpep3ud00oldyhc4jZQaYE88JU2w=;
	b=AnVH/q8mwdjUB48br4+XKQZhQjKQbgNYSstHOvj2e3WeVlatZYBIVBfOHaBvjDENC1
	TJml1+sFf6+CtIzSrmfXqsLZJDS1OE4aTvDkKCnw1TO2UTKzEcW6wZB95U+Cbvqd4od0
	LrWFzo1i2ItrbWY+lyKP/mw+jaA5nqh/TQQhmUZKWUceiaQ4FmrxTa/kKw+6e45SCSJb
	YPeejohM0NMDtIoI8dQVnLRX6rxDT0RTPaxNq6y89LSilDHmC6/TGynFTuOHrCgX2vzW
	cRS+xGHoK0NfkPD3bqeOqTBEsDbMMo1SzPngAjOAQS8Yp2YFNn8WGb4OnGlfzbuoCC8l
	As+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1684140982; x=1686732982;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=RIIUctl1bRw1HpPNpep3ud00oldyhc4jZQaYE88JU2w=;
	b=VZzmL1PhXfSgldhKlH3MP8Z/uPO+1cm2rO9mLv1P+dr0DeO7iLBKrP/tlL3bQDRscD
	6XoTbfprItxvHOh3yqL1HLrsDAcRtbTGpDlPBNzpLkuL3JFM9EwXG7K8G/4p6XBuunLe
	d+0V6NaqUL9zudNXV7V0VofBO842Uz1b/Th68bSYEHo29OX7RHN/TImDeuzav+7vdTEQ
	BKoZKFlliGYwB0H1JorLH6N/Np4xyxUYuDmahHc1SVx9wLXByJGmk7SWpItF9nKpATfB
	FI2ISMPBiiki7ejL3rr0tAygsZ8SeEMivFmBRIawdV6Z4Wc6rF9LUaDeS3ruWM1aXLTP
	UNnQ==
X-Gm-Message-State: AC+VfDx/Gb163UzenTPiKsIv7D0H35LowPmeNSdiqWou1666CJJ06F+L
	DxgYB4jzEKPMDa8WLjzzIy47XrTk
X-Google-Smtp-Source: ACHHUZ7g13ecAkip6L71Cbnmd6HuFKLHUoFfhXcrcFhVn5Igf53uR9sVnUnT/BWKQcOuILeas2FNmg==
X-Received: by 2002:a05:600c:3797:b0:3f4:20ec:7601 with SMTP id
	o23-20020a05600c379700b003f420ec7601mr23758879wmr.34.1684140982066;
	Mon, 15 May 2023 01:56:22 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	m21-20020a7bca55000000b003f4285629casm20862789wml.42.2023.05.15.01.56.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 15 May 2023 01:56:21 -0700 (PDT)
Message-ID: <2ec28ec3-1e22-e772-fc9a-d59c6d176b7d@linbit.com>
Date: Mon, 15 May 2023 10:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.1
To: mirimmad@outlook.com
References: <CY5PR12MB64555F99E4FEF60569050F1FC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
	<CY5PR12MB64558DB2E8ACBD592F26E61AC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <CY5PR12MB64558DB2E8ACBD592F26E61AC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, skhan@linuxfoundation.org,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com, mirimmad17@gmail.com
Subject: Re: [Drbd-dev] [PATCH v2] drdb: fix debugfs_create_dir and
 debugfs_create_symlink error handling
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

QW0gMTQuMDUuMjMgdW0gMTY6MTAgc2NocmllYiBtaXJpbW1hZEBvdXRsb29rLmNvbToKPiBGcm9t
OiBJbW1hZCBNaXIgPG1pcmltbWFkMTdAZ21haWwuY29tPgo+IAo+IGRlYnVnZnNfY3JlYXRlX2Rp
ciBhbmQgZGVidWdmc19jcmVhdGVfc3ltbGluayByZXR1cm4gRVJSX1BUUiBpbmNhc2Ugb2YKPiBh
IGZhaWx1cmUgd2hpY2ggbXVzdCBiZSBjaGVja2VkIHdpdGggdGhlIGlubGluZSBmdW5jdGlvbiBJ
U19FUlIuIFRoaXMKPiBwYXRjaCBhdHRlbXB0cyB0byBkbyB0aGUgc2FtZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBJbW1hZCBNaXIgPG1pcmltbWFkMTdAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMg
aW4gdjI6Cj4gICAgIC0gRml4IGluZGVudGF0aW9uCj4gICAgIC0gRml4IHBvdGVudGlhbCBtZW1v
cnkgbGVhawo+IAo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMgfCAxMyArKysr
KysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMg
Yi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMKPiBpbmRleCAxMjQ2MGI1ODQuLmFi
NDMxYTNmMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMK
PiArKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMKPiBAQCAtNzgxLDYgKzc4
MSw3IEBAIHZvaWQgZHJiZF9kZWJ1Z2ZzX2RldmljZV9hZGQoc3RydWN0IGRyYmRfZGV2aWNlICpk
ZXZpY2UpCj4gCj4gIAlzbnByaW50Zih2bnJfYnVmLCBzaXplb2Yodm5yX2J1ZiksICIldSIsIGRl
dmljZS0+dm5yKTsKPiAgCWRlbnRyeSA9IGRlYnVnZnNfY3JlYXRlX2Rpcih2bnJfYnVmLCB2b2xz
X2Rpcik7Cj4gKyAgICBpZiAoSVNfRVJSKGRlbnRyeSkpIGdvdG8gZmFpbDsKPiAgCWRldmljZS0+
ZGVidWdmc192b2wgPSBkZW50cnk7Cj4gCj4gIAlzbnByaW50ZihtaW5vcl9idWYsIHNpemVvZiht
aW5vcl9idWYpLCAiJXUiLCBkZXZpY2UtPm1pbm9yKTsKPiBAQCAtNzg5LDkgKzc5MCwxNSBAQCB2
b2lkIGRyYmRfZGVidWdmc19kZXZpY2VfYWRkKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlKQo+
ICAJaWYgKCFzbGlua19uYW1lKQo+ICAJCWdvdG8gZmFpbDsKPiAgCWRlbnRyeSA9IGRlYnVnZnNf
Y3JlYXRlX3N5bWxpbmsobWlub3JfYnVmLCBkcmJkX2RlYnVnZnNfbWlub3JzLCBzbGlua19uYW1l
KTsKPiAtCWRldmljZS0+ZGVidWdmc19taW5vciA9IGRlbnRyeTsKPiAtCWtmcmVlKHNsaW5rX25h
bWUpOwo+IC0Jc2xpbmtfbmFtZSA9IE5VTEw7Cj4gKyAgICBpZiAoIUlTX0VSUihkZW50cnkpKSB7
Cj4gKyAgICAgICAgZGV2aWNlLT5kZWJ1Z2ZzX21pbm9yID0gZGVudHJ5Owo+ICsgICAgICAgIGtm
cmVlKHNsaW5rX25hbWUpOwo+ICsgICAgICAgIHNsaW5rX25hbWUgPSBOVUxMOwo+ICsgICAgfSBl
bHNlIHsKPiArICAgICAgICBrZnJlZShzbGlua19uYW1lKTsKPiArICAgICAgICBzbGlua19uYW1l
ID0gTlVMTDsKPiArICAgICAgICBnb3RvIGZhaWw7Cj4gKyAgICB9Cj4gCj4gICNkZWZpbmUgRENG
KG5hbWUpCWRvIHsJCQkJCVwKPiAgCWRlbnRyeSA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoI25hbWUs
IDA0NDAsCVwKPiAtLQo+IDIuNDAuMAo+IAo+IAoKSGksIHRoYW5rcyBmb3IgdGhlIHBhdGNoLgoK
UGxlYXNlIHNlZSB0aGlzIGNvbW1pdDoKCmNvbW1pdCBkMjdlODRhMzA1OTgwYWM2MWRmMGE2ODQx
MDU5ZDBlYjA5YjgyODNkCkF1dGhvcjogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KRGF0ZTogICBUdWUgSnVuIDE4IDE3OjQ1OjQ5IDIwMTkgKzAyMDAKCiAg
ICBibG9jazogZHJiZDogbm8gbmVlZCB0byBjaGVjayByZXR1cm4gdmFsdWUgb2YgZGVidWdmc19j
cmVhdGUgZnVuY3Rpb25zCgogICAgV2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVy
ZSBpcyBubyBuZWVkIHRvIGV2ZXIgY2hlY2sgdGhlCiAgICByZXR1cm4gdmFsdWUuICBUaGUgZnVu
Y3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQgdGhlIGNvZGUgbG9naWMgc2hvdWxkCiAgICBuZXZl
ciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCgpBbHNvLCBpdCBzdGlsbCBs
b29rcyBsaWtlIHRoYXQgd2hpdGVzcGFjZSBpcyBnYXJibGVkLgoKTkFLLgoKLS0gCkNocmlzdG9w
aCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcK
RFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3Jh
Z2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1k
ZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5s
aW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
