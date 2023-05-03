Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7805E6F5B63
	for <lists+drbd-dev@lfdr.de>; Wed,  3 May 2023 17:39:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC9F6420FB8;
	Wed,  3 May 2023 17:39:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
	[209.85.166.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 401A94203AB
	for <drbd-dev@lists.linbit.com>; Wed,  3 May 2023 17:39:51 +0200 (CEST)
Received: by mail-il1-f169.google.com with SMTP id
	e9e14a558f8ab-33110a36153so693555ab.0
	for <drbd-dev@lists.linbit.com>; Wed, 03 May 2023 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1683128390;
	x=1685720390; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=VVVLdXvIfrw5/3NYijIBIn8HUk/59pymTlkCnyX4gZk=;
	b=hhwOQ1IRNoMXnJdreafhurd7FFlfWlG7ggNpHvGfTwl86HQaxurUdjbTsPCn5g21J1
	WZJUWtptO9CY6OjNiJxnwf2pAtUpeg45ezOSpKhFaDLQj/DAo03745KRyQ2F+QyJoIC9
	4naFiUVk5u0JT3Ssp6HMtEKLywdZYoB54T3elj56qZ3er+ZZv4fyn9T/mJBkQ/dPt/tY
	tE/fUiEnL/YH6Y0TeFqQkPJI5ZEUkgUzquCEMsLcJOOtiES45axH7nEo7sWfo1YQQFRC
	eYhAld8YCZZzXDAqT3Q+RvaF8Lp4Cojc9jUdaquf4cvNbFV7wjzl8SMIGxY1Gjl7gFWK
	3YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1683128390; x=1685720390;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=VVVLdXvIfrw5/3NYijIBIn8HUk/59pymTlkCnyX4gZk=;
	b=j2kIPh4Q2HMKex9wTVRAMoz2b75/tshGUI4H+pR+Qd2COY6M8ltFIiL553fAcwtAVq
	9Sr3zZSHaKxM6LsZRu+kOrV8Zm44ocDvLjbHUd9mRGINEDgqdk5QNla0nYf7P5GCEvCW
	WxThuvvRDqAgMwTRe62TcfiUBf79t3qIHDFrsqRE8IIl6vVmQBhIF1MMbRE5J3aZHHkj
	DY6alkc0hucxnpJRjaoFk/NgKMy50oNpSo7i58CT9cg0SYAxtdhzkHza546tDhn5HkdM
	I5DbChoRzWJ0yKn4di/VqPWMTZUBedCbj08PuHHftCAUx2k4LTm1uAIBPQMxIdPFUPaa
	lp5g==
X-Gm-Message-State: AC+VfDyCDYMO9rhUg7ZTDOPNsQhxER6LD4MhvayUdohMZiYQgsW+2pZj
	a4AwRP0zgj2WQhRSxsrwDhcQ4LWN4nPJY1fqoFs=
X-Google-Smtp-Source: ACHHUZ5d4YwH96Tpn6LfKIxiZcp69KtZgmoa3BJZVXRNO88gwL/jKwNV6SF+0qAXwiCYWhzG65q3sg==
X-Received: by 2002:a92:7402:0:b0:330:a1eb:c5a4 with SMTP id
	p2-20020a927402000000b00330a1ebc5a4mr4047857ilc.1.1683128389782;
	Wed, 03 May 2023 08:39:49 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	cd23-20020a0566381a1700b00406147dad72sm10232284jab.104.2023.05.03.08.39.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 May 2023 08:39:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230503121937.17232-1-christoph.boehmwalder@linbit.com>
References: <20230503121937.17232-1-christoph.boehmwalder@linbit.com>
Message-Id: <168312838868.941317.975898202413701616.b4-ty@kernel.dk>
Date: Wed, 03 May 2023 09:39:48 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-00303
Cc: Christoph Hellwig <hch@infradead.org>, Thomas Voegtle <tv@lio96.de>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: correctly submit flush bio on barrier
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

Ck9uIFdlZCwgMDMgTWF5IDIwMjMgMTQ6MTk6MzcgKzAyMDAsIENocmlzdG9waCBCw7ZobXdhbGRl
ciB3cm90ZToKPiBXaGVuIHdlIHJlY2VpdmUgYSBmbHVzaCBjb21tYW5kIChvciAiYmFycmllciIg
aW4gRFJCRCksIHdlIGN1cnJlbnRseSB1c2UKPiBhIFJFUV9PUF9GTFVTSCB3aXRoIHRoZSBSRVFf
UFJFRkxVU0ggZmxhZyBzZXQuCj4gCj4gVGhlIGNvcnJlY3Qgd2F5IHRvIHN1Ym1pdCBhIGZsdXNo
IGJpbyBpcyBieSB1c2luZyBhIFJFUV9PUF9XUklURSB3aXRob3V0Cj4gYW55IGRhdGEsIGFuZCBz
ZXQgdGhlIFJFUV9QUkVGTFVTSCBmbGFnLgo+IAo+IFNpbmNlIGNvbW1pdCBiNGE2YmIzYTY3YWEg
KCJibG9jazogYWRkIGEgc2FuaXR5IGNoZWNrIGZvciBub24td3JpdGUKPiBmbHVzaC9mdWEgYmlv
cyIpLCB0aGlzIHRyaWdnZXJzIGEgd2FybmluZyBpbiB0aGUgYmxvY2sgbGF5ZXIsIGJ1dCB0aGlz
Cj4gaGFzIGJlZW4gYnJva2VuIGZvciBxdWl0ZSBzb21lIHRpbWUgYmVmb3JlIHRoYXQuCj4gCj4g
Wy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGRyYmQ6IGNvcnJlY3RseSBzdWJtaXQgZmx1
c2ggYmlvIG9uIGJhcnJpZXIKICAgICAgY29tbWl0OiAzODk5ZDk0ZTM4MzFlZTA3ZWE2ODIxYzAz
MmRjMjk3YWVjODA1ODZhCgpCZXN0IHJlZ2FyZHMsCi0tIApKZW5zIEF4Ym9lCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcg
bGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
