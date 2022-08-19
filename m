Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B889599E1D
	for <lists+drbd-dev@lfdr.de>; Fri, 19 Aug 2022 17:24:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CB5442097C;
	Fri, 19 Aug 2022 17:24:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C06CB4207B8
	for <drbd-dev@lists.linbit.com>; Fri, 19 Aug 2022 17:24:52 +0200 (CEST)
Received: by mail-ej1-f49.google.com with SMTP id qn6so9406383ejc.11
	for <drbd-dev@lists.linbit.com>; Fri, 19 Aug 2022 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc; bh=QcjuSMkjgvmcMVSZtEnP4HKDq1IJJzuLOO5WZsbK0+U=;
	b=agmJAUC8jfOsl/gS4hT8lv5H6fTz01qf2pe3Iv5R9j9Ate9ewR22RfAhjEhwJ6X7ah
	6i2gUSjqWAQUwG7vDL22TL3OJ2DhWyK4iGyCxaZDkZBo8C5fdnjLhkpYDW7Sa1kKJ0m9
	nTTLPu80zYWs5VKFI/soqsQZ2m3SZwMJLkyAN+lFaM/+QA0zpsdobhOAVHSxJY09NVpJ
	unBTEPM3BaQo8lZAI/3LxHBqdI4Xtjfj+l91HslXfgpBHq8BMYj8CpA31LlMMIn6dSW8
	vv42Aj7Ht2909aymuONX4UFmgeVzYDTPM0HNunn/RXfrH17hgsFeGl4AuF4WAgPFBbnL
	B9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc;
	bh=QcjuSMkjgvmcMVSZtEnP4HKDq1IJJzuLOO5WZsbK0+U=;
	b=YeLSoh0eG3lP+oN2qBxxdXgPb0yMidF7I+p+w5/Jser+x0clcv7KDPhYTMDAo3QN2O
	hqwUfnZI0xysmSfJfMYtxtQWxiXu2+drwtYQj6hC6HPguXdYpfSMiD6r3uAe1zFd0q28
	+CV9O2NNnKhdZnKEiyEUc4oVHRqpZPDCJDQ6fsHi3Pmh5GocZW5cUK8UFgi1YAU3WdAs
	H7cRDNiBh61Adeg4FhrKhmCijII0uzrc1it199regdZaDDietdka30P7062ywiESp/75
	hr6gqiwEtb/vJI4Psa/BvYhi+sWvSgTzBQBnBIqAuAOjvzlzCk0rsita9AQsXTjv5sHc
	1VvQ==
X-Gm-Message-State: ACgBeo0jzt35iI9u5Bhs/vE9aG7zEJJiqWQRbz1HUumEbgHtZBKilgk8
	3a8JfJFbC5GVMg5isQBY86H04Z/B
X-Google-Smtp-Source: AA6agR5mq+T7k3AHmZCAgqpwHVwskje+A0igISLSMji1ANW7KLAUFwidL9UZ9jQ29SXqclEdOTfxgg==
X-Received: by 2002:a17:907:7fa5:b0:730:5d54:4c24 with SMTP id
	qk37-20020a1709077fa500b007305d544c24mr5248538ejc.641.1660922691995;
	Fri, 19 Aug 2022 08:24:51 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	h10-20020aa7c60a000000b0043cc2c9f5adsm3270313edq.40.2022.08.19.08.24.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 19 Aug 2022 08:24:51 -0700 (PDT)
Message-ID: <a6d3e3a8-f0a6-dffc-c3b6-45d81efc7664@linbit.com>
Date: Fri, 19 Aug 2022 17:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.12.0
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
Cc: Jens Axboe <axboe@kernel.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Jim Paris <jim@jtan.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: move from strlcpy with unused retval
	to strscpy
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

QW0gMTguMDguMjIgdW0gMjI6NTkgc2NocmllYiBXb2xmcmFtIFNhbmc6Cj4gRm9sbG93IHRoZSBh
ZHZpY2Ugb2YgdGhlIGJlbG93IGxpbmsgYW5kIHByZWZlciAnc3Ryc2NweScgaW4gdGhpcwo+IHN1
YnN5c3RlbS4gQ29udmVyc2lvbiBpcyAxOjEgYmVjYXVzZSB0aGUgcmV0dXJuIHZhbHVlIGlzIG5v
dCB1c2VkLgo+IEdlbmVyYXRlZCBieSBhIGNvY2NpbmVsbGUgc2NyaXB0Lgo+IAo+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvQ0FIay09d2dmUm5YejBXM0QzN2QwMXEzSkZrcl9pX3VU
TD1WNkE2RzFvVVpjcHJta253QG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFdvbGZy
YW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvYmxvY2svYnJkLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX25sLmMgICAgICB8ICAyICstCgpGb3IgdGhlIGRyYmQgcGFydDoKCkFja2VkLWJ5OiBD
aHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgoK
PiAgZHJpdmVycy9ibG9jay9tdGlwMzJ4eC9tdGlwMzJ4eC5jIHwgMTIgKysrKysrLS0tLS0tCj4g
IGRyaXZlcnMvYmxvY2svcHMzdnJhbS5jICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxv
Y2svenJhbS96cmFtX2Rydi5jICAgICB8ICA2ICsrKy0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQouLi4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbmwuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKPiBp
bmRleCAwMTNkMzU1YTIwMzMuLjg2NGM5OGU3NDg3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9ubC5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwo+
IEBAIC00NzUyLDcgKzQ3NTIsNyBAQCB2b2lkIG5vdGlmeV9oZWxwZXIoZW51bSBkcmJkX25vdGlm
aWNhdGlvbl90eXBlIHR5cGUsCj4gIAlzdHJ1Y3QgZHJiZF9nZW5sbXNnaGRyICpkaDsKPiAgCWlu
dCBlcnI7Cj4gIAo+IC0Jc3RybGNweShoZWxwZXJfaW5mby5oZWxwZXJfbmFtZSwgbmFtZSwgc2l6
ZW9mKGhlbHBlcl9pbmZvLmhlbHBlcl9uYW1lKSk7Cj4gKwlzdHJzY3B5KGhlbHBlcl9pbmZvLmhl
bHBlcl9uYW1lLCBuYW1lLCBzaXplb2YoaGVscGVyX2luZm8uaGVscGVyX25hbWUpKTsKPiAgCWhl
bHBlcl9pbmZvLmhlbHBlcl9uYW1lX2xlbiA9IG1pbihzdHJsZW4obmFtZSksIHNpemVvZihoZWxw
ZXJfaW5mby5oZWxwZXJfbmFtZSkpOwo+ICAJaGVscGVyX2luZm8uaGVscGVyX3N0YXR1cyA9IHN0
YXR1czsKPgotLSAKQ2hyaXN0b3BoIELDtmhtd2FsZGVyCkxJTkJJVCB8IEtlZXBpbmcgdGhlIERp
Z2l0YWwgV29ybGQgUnVubmluZwpEUkJEIEhBIOKAlCAgRGlzYXN0ZXIgUmVjb3Zlcnkg4oCUIFNv
ZnR3YXJlIGRlZmluZWQgU3RvcmFnZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0
LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
