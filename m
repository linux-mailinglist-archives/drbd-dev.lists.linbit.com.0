Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4304F699F
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:11:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 65AC0420FFC;
	Wed,  6 Apr 2022 21:11:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15C18420FDD
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:08:53 +0200 (CEST)
Received: by mail-io1-f44.google.com with SMTP id p21so4169846ioj.4
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=me+fcgRSm8+g0b6jcT9D2oZ2E2KRY2O76WiEXkXSbms=;
	b=o/FsVnDPL+0anaOigwidAaEH7TK8DP4aDi5UM6zbDbj6nwSVImMCDNcEqosv+5Lcao
	5XUBQjFBjZfdeChfMlaimrhGHm8KN9h9SreKhw/5JIgf54/0Hay3urZe3WAWVZtheSSK
	fSNu4pMXo05i6w/P33JQ63FTpS8k4xm5yMvY/+f8hFU8MufJ7Fr+u13qHCrBcnMiHxqu
	uKWOjOGgNWyQb606eQDCXz2Ekzk8MASU2THvn4pJYpzQ/JOzT+sYkeMDm8J5tiiwVPp2
	yduwXRyzIX1ddqPZEbe/QplDUaO4bfajnfDGBOw7FULQ56h5j/5cXQx3suuWKNYrN41p
	LRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=me+fcgRSm8+g0b6jcT9D2oZ2E2KRY2O76WiEXkXSbms=;
	b=6exWEWobywT0UTqtT/pku+Xxy2s2/CBd5k/6Srfa4sGX4XRp8E2jCf2U7GLXFj04pD
	oc6wnzEq7Udz3r7l4xvzPtAJEJCFjp6OTfpJ3Doj9qln2Ir6Sa7g+d5zaF6u3UPNFAWl
	bFvCeOuNp1KCL/SrWzzYoUffz6TtCtWI1an056+Mj2hoDIeCAK4GiyDVeFZimqL8LyMg
	zZa0UnZ5dCo1Pao2U+CH4dp351H3br98LkivT2XrNxfmiVxg28VbzmCoPuvvOOatLgzD
	WBsQ4K8+39TmBlcTQxs33oGinroTZCwb3yKbQ2V8QsGnbf8qLYOegp370MZ10Uk4Tnax
	McdA==
X-Gm-Message-State: AOAM533dxZ2I6whdl/Ul0nxYBzbyZ4hSX4CRjWEIKS0bFXTPpWfQeWU6
	NcrktYpnUuk+TVzPu4dTw3/56A==
X-Google-Smtp-Source: ABdhPJy534Xn0E7r2znTIqgGP9rj9pXvn5paA6sEmwZ7O+wcPbxsMfE4jUoQg48dt+07p0yfczbwqw==
X-Received: by 2002:a02:c9d0:0:b0:323:6e14:8da3 with SMTP id
	c16-20020a02c9d0000000b003236e148da3mr4977251jap.196.1649272132776;
	Wed, 06 Apr 2022 12:08:52 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	o15-20020a6bcf0f000000b00649c4056879sm10908279ioa.50.2022.04.06.12.08.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 12:08:52 -0700 (PDT)
Message-ID: <9b6492fd-8367-a9f7-b2c4-1d8853cb7a77@kernel.dk>
Date: Wed, 6 Apr 2022 13:08:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 0/3] DRBD fixes for Linux 5.18
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

T24gNC82LzIyIDE6MDQgUE0sIENocmlzdG9waCBCw7ZobXdhbGRlciB3cm90ZToKPiBBc3NvcnRt
ZW50IG9mIG1vcmUgcmVsZXZhbnQgZml4ZXMgZm9yIERSQkQgdG8gZ28gaW50byA1LjE4Lgo+IAo+
IENocmlzdG9waCBCw7ZobXdhbGRlciAoMSk6Cj4gICBkcmJkOiBzZXQgUVVFVUVfRkxBR19TVEFC
TEVfV1JJVEVTCj4gCj4gTHYgWXVubG9uZyAoMSk6Cj4gICBkcmJkOiBGaXggZml2ZSB1c2UgYWZ0
ZXIgZnJlZSBidWdzIGluIGdldF9pbml0aWFsX3N0YXRlCj4gCj4gWGlhb21lbmcgVG9uZyAoMSk6
Cj4gICBkcmJkOiBmaXggYW4gaW52YWxpZCBtZW1vcnkgYWNjZXNzIGNhdXNlZCBieSBpbmNvcnJl
Y3QgdXNlIG9mIGxpc3QKPiAgICAgaXRlcmF0b3IKPiAKPiAgZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfaW50LmggICAgICAgICAgfCAgOCArKy0tLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMgICAgICAgICB8ICA3ICsrLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMg
ICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfc3RhdGUuYyAgICAgICAgfCAxOCArKysrKy0tLS0tLQo+ICBkcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9zdGF0ZV9jaGFuZ2UuaCB8ICA4ICsrLS0tCj4gIDUgZmlsZXMgY2hhbmdl
ZCwgNDUgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgot
LSAKSmVucyBBeGJvZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0
cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
