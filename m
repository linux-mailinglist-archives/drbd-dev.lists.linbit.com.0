Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 00137586DE9
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Aug 2022 17:40:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D670E420634;
	Mon,  1 Aug 2022 17:40:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AEF004203DF
	for <drbd-dev@lists.linbit.com>; Mon,  1 Aug 2022 17:40:54 +0200 (CEST)
Received: by mail-ej1-f41.google.com with SMTP id k26so5363196ejx.5
	for <drbd-dev@lists.linbit.com>; Mon, 01 Aug 2022 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=eAe7alzTmYY/YiuNxHp3jFfpoVXuSFHK6N9OKpdBXM4=;
	b=dqXElW12x3Nf1adve0FLN6Dupn3kHSUgN9sYbnFl8W2foA8kCRBB4Oqz3YXG1deXaj
	o9YDAMA4hmvBfemzoDBv44euEEL4C0tcGCUWrXBTUBb9rxMTTedgAUqTZyIKNPWYYev9
	PXZZ/EILKOAjF3Ap07eBe8OJtVzCPglRxSIjD+Pjoz0Jx0TYPzWVC1UFJmTno0gg/N+/
	ER8cX31HqvQVufz/Ptm+durPDQW0AHRNWGDBTexyGkot90rq4/qRINnF33axnPFrngNd
	mf/Jr5rGy+4hV+4A52lPKySYxrYFaKUFZvlT3IlgQoJL30YYudZ/2Gkqo2OUNz+70Cie
	GBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=eAe7alzTmYY/YiuNxHp3jFfpoVXuSFHK6N9OKpdBXM4=;
	b=d0ahu1scRhFrb6a7mcBm92LWbONayo47CIy2zuFEycnrRObf5OIFVkggJYa7FcVTuq
	/Q00dHsHX0vtD9mfjJPGUa0OHY3ZoAieLD+xczRGcYE6sMLkyef1QQm3xJMYMYBwZJDP
	3xuw/4Wz+mtXvovuxRQe50cfQyGDpvb+A8MAcc7HzMzEf0fPwHgGR/V+6SNTGYoyVNjm
	PA3zugs3q4BbAszD4rW4RSWFOScySjJlpAr24EaAsHa2/kY6SBmiYvRAsgcetKYAytAA
	/zyuBBRbrgWVf9VLwTV/7dvFKRZR7xM6nROUgRDrfU5P/cK2H4L4Rzk82YmJMRu3Bybx
	FVvw==
X-Gm-Message-State: AJIora8i4m2qBINTafU+Jo90tl5L8XToc14KcHeJFSn+7VLo/z78wDcI
	JbFaqzbFRMYLxlqNjFmmA6u5xleL
X-Google-Smtp-Source: AGRyM1uoM9kb4OzQLKOyKkYYZNlkvzM2RV8lA/tro3D3ap0Fiqp2LXBXSiy6IZGJCFZQibND2NCRlA==
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
	my39-20020a1709065a6700b0072b610d4aa4mr13352511ejc.294.1659368454005;
	Mon, 01 Aug 2022 08:40:54 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	o18-20020a170906775200b006fe8c831632sm5264510ejn.73.2022.08.01.08.40.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 01 Aug 2022 08:40:53 -0700 (PDT)
Message-ID: <4d88538d-c401-ebaf-8f63-8e8b7ad9e632@linbit.com>
Date: Mon, 1 Aug 2022 17:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.12.0
Content-Language: en-US
To: John Sanpe <sanpeqf@gmail.com>
References: <20220723075931.163245-1-sanpeqf@gmail.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220723075931.163245-1-sanpeqf@gmail.com>
Cc: lars.ellenberg@linbit.com, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] lib/lru_cache: Fixed array overflow caused
 by incorrect boundary handling.
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

QW0gMjMuMDcuMjIgdW0gMDk6NTkgc2NocmllYiBKb2huIFNhbnBlOgo+IFRoaXMgcHJvYmxlbSBv
Y2N1cnMgd2hlbiBtYWxsb2MgZWxlbWVudCBmYWlsZWQgb24gdGhlIGZpcnN0IHRpbWUuCj4gQXQg
dGhpcyB0aW1lLCB0aGUgY291bnRlciBpIGlzIDAuIFdoZW4gaXQncyByZWxlYXNlZCwgd2Ugc3Vi
dHJhY3QgMQo+IGluIGFkdmFuY2Ugd2l0aG91dCBjaGVja2luZywgd2hpY2ggd2lsbCBjYXVzZSBp
IHRvIGJlY29tZSBVSU5UX01BWCwKPiByZXN1bHRpbmcgaW4gYXJyYXkgb3ZlcmZsb3cuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSm9obiBTYW5wZSA8c2FucGVxZkBnbWFpbC5jb20+Cj4gLS0tCj4gIGxp
Yi9scnVfY2FjaGUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9scnVfY2FjaGUuYyBiL2xpYi9scnVf
Y2FjaGUuYwo+IGluZGV4IDUyMzEzYWNiZmE2Mi4uMDRkOTVkZTkyNjAyIDEwMDY0NAo+IC0tLSBh
L2xpYi9scnVfY2FjaGUuYwo+ICsrKyBiL2xpYi9scnVfY2FjaGUuYwo+IEBAIC0xNDcsNyArMTQ3
LDcgQEAgc3RydWN0IGxydV9jYWNoZSAqbGNfY3JlYXRlKGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVj
dCBrbWVtX2NhY2hlICpjYWNoZSwKPiAgCQlyZXR1cm4gbGM7Cj4gIAo+ICAJLyogZWxzZTogY291
bGQgbm90IGFsbG9jYXRlIGFsbCBlbGVtZW50cywgZ2l2ZSB1cCAqLwo+IC0JZm9yIChpLS07IGk7
IGktLSkgewo+ICsJd2hpbGUgKGktLSkgewo+ICAJCXZvaWQgKnAgPSBlbGVtZW50W2ldOwo+ICAJ
CWttZW1fY2FjaGVfZnJlZShjYWNoZSwgcCAtIGVfb2ZmKTsKPiAgCX0KClRoYW5rcyBmb3IgdGhl
IGZpeCwgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBDaHJpc3RvcGggQsO2aG13YWxk
ZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgoKLS0gCkNocmlzdG9waCBCw7Zo
bXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBI
QSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFp
bGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
