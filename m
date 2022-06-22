Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 48015554C55
	for <lists+drbd-dev@lfdr.de>; Wed, 22 Jun 2022 16:13:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F0239420620;
	Wed, 22 Jun 2022 16:12:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C7B3C4204BE
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 16:12:56 +0200 (CEST)
Received: by mail-ed1-f47.google.com with SMTP id o10so24101133edi.1
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=fG5D+uGBwwK40MTabwUY6wsv1epKDtgAgJdk4dbADg8=;
	b=AVxqSYm2tQicUHoKP/CQ7yVFeY1/yS3p6olpcI8LxibnzNqI0LwIFgedn3fJON+uLF
	4y/ScsW+Av9Owd0pW239PDzkOZAGy5EYoLVnJqLECv3CE8N6mltknxWBBRtWeUk+JTP8
	PL5kUFzheHzaWkGqv3gEUmN7pMTipy2e3YNdtuxY+QSnHEPKQUEudnxqNhbY4BfxDpd+
	7uCRZUaFSxaWpKM3+SBtXo7OvWUXYhf/Rcy4NEJIr1y+f3hm6rn6cHazffo3Xu4r7Bwi
	lJP+t9S171aqRH1t76uT2Wzxg1EurjYBhMYT0oz7dYAL7SJw7NFP+DIT/jDkFq84YOzR
	3ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=fG5D+uGBwwK40MTabwUY6wsv1epKDtgAgJdk4dbADg8=;
	b=lQCn/DszDtxRyc3hwaLMNe+L8rRLIBFpkODbCRAXBueUyKOtrcB0ZhGJMRPfT98+H9
	ilNSPVhQHBfpwmY0OlwacpXLWnykwIvdVXMMVda8SaxfOcm0IreJxx8WLb8z8WX0Wxbj
	GHHfhteQtAuyNDQdc0fxDyz3QYpWPaW+5YT5q4VbjRmUTclvs3r8kqPS9gfrSQTZHQ+O
	J2/7mDzwnJpXhCr6Bmb3AtXiBpT4G7hY3nEbUDLE1PtlfAo7sguH3/pIA3stgjydWBzc
	4TwxlTU0QKs4nZOWin7kNPOTZEY+O7AYMhDbEbXQROv2I3gV0MRrvqA9FwxbVinF+Qt5
	zeWg==
X-Gm-Message-State: AJIora9xIXQMtHU3kqnqR9kJDjHVCa27J/hr5NQXOwelLI4WDkCjPIfA
	elepzBhgeSNOlMg9QFE3RZgpZq+U
X-Google-Smtp-Source: AGRyM1uUESYrbLTpgv2oZVuiUBydC1onWAi2Dy56rj0mDfvLHWZ0vYGmEitukPRk/QfY457MKqHLxQ==
X-Received: by 2002:a05:6402:3587:b0:435:b9a1:d5c5 with SMTP id
	y7-20020a056402358700b00435b9a1d5c5mr2403935edc.219.1655907176277;
	Wed, 22 Jun 2022 07:12:56 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ch11-20020a0564021bcb00b0043586bee560sm6526365edb.68.2022.06.22.07.12.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Jun 2022 07:12:55 -0700 (PDT)
Message-ID: <b628a808-bb07-c94f-9d70-6bd4eb4be690@linbit.com>
Date: Wed, 22 Jun 2022 16:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.10.0
Content-Language: en-US
To: Xiang wangx <wangxiang@cdjrlc.com>
References: <20220616143227.4004-1-wangxiang@cdjrlc.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220616143227.4004-1-wangxiang@cdjrlc.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Fix typo in comment
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

QW0gMTYuMDYuMjIgdW0gMTY6MzIgc2NocmllYiBYaWFuZyB3YW5neDoKPiBEZWxldGUgdGhlIHJl
ZHVuZGFudCB3b3JkICdhbmQnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpYW5nIHdhbmd4IDx3YW5n
eGlhbmdAY2RqcmxjLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0bWFw
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYyBiL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX2JpdG1hcC5jCj4gaW5kZXggOWUwNjBlNDliM2Y4Li44YWZk
ZGU0MDBlMzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0bWFwLmMK
PiArKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYwo+IEBAIC04Niw3ICs4Niw3
IEBAIHN0cnVjdCBkcmJkX2JpdG1hcCB7Cj4gIAo+ICAJLyogZXhjbHVzaXZlbHkgdG8gYmUgdXNl
ZCBieSBfX2FsX3dyaXRlX3RyYW5zYWN0aW9uKCksCj4gIAkgKiBkcmJkX2JtX21hcmtfZm9yX3dy
aXRlb3V0KCkgYW5kCj4gLQkgKiBhbmQgZHJiZF9ibV93cml0ZV9oaW50ZWQoKSAtPiBibV9ydygp
IGNhbGxlZCBmcm9tIHRoZXJlLgo+ICsJICogZHJiZF9ibV93cml0ZV9oaW50ZWQoKSAtPiBibV9y
dygpIGNhbGxlZCBmcm9tIHRoZXJlLgo+ICAJICovCj4gIAl1bnNpZ25lZCBpbnQgbl9iaXRtYXBf
aGludHM7Cj4gIAl1bnNpZ25lZCBpbnQgYWxfYml0bWFwX2hpbnRzW0FMX1VQREFURVNfUEVSX1RS
QU5TQUNUSU9OXTsKClRoYW5rcyEKCkFja2VkLWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNo
cmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRl
cgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQg
IERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBs
aXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21h
aWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
