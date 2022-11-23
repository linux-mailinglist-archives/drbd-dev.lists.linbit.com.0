Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6F1634DF6
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Nov 2022 03:39:06 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 018384252EE;
	Wed, 23 Nov 2022 03:39:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 704BD4252E1
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 03:39:03 +0100 (CET)
Received: by mail-pj1-f49.google.com with SMTP id
	l22-20020a17090a3f1600b00212fbbcfb78so657990pjc.3
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 18:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=MyR/ex2CRF9xXoB389+5A7ATKvW1bpC54a+w6nI8a7w=;
	b=eHazfvt+UIAp8G9x/Tyc5bXcycqYxmpax0vLgbIqlWw2AHJIrZUXuLlaKfm2VKPriG
	RApkUYr2fTPva4mijHvSG/JkUqRILyLqrdc/PxK8lhu1AV+r6orRFI8TrLp5knMKBhOC
	du1YxuTCdUtvyqB4FM3Lngx7mEIB54MU+KvTNGO1cB1w+Yme0C6orPG3HVpChajJHzpv
	KadqLFNjUxKPoFNMYjgGBeCL5AijKbvBLHAcswqnPWeJvoD/2xRd+NQXd6+GZYS3l5ot
	l0JPqyr2U0P5Ga+hJPOi/9LoNHzWWWy8MJYVydh0zL7pHyUmXZaaswCR9lO4mthDCYCW
	4oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=MyR/ex2CRF9xXoB389+5A7ATKvW1bpC54a+w6nI8a7w=;
	b=W3jReKAqATQDQ/kYrFEFE1v6/Gz+fHVhQZ0dg2MamIjwQkVuTMHFv6Eb7cS+3FlcSK
	JJZ4K1X1E8WMCweZoUt9JuveCDF9Px88R79vmbsvDwbnAk8do9g7/5kVIgDR7M88/Zal
	0BeCBmajMz2pnurGYDAnLugb3yYqh2VRllJ0wvoK/9Q5Ii9ZSQIw9NDlWZ3RAicD0P0j
	pWYxNgUMUd36CIvKfuSzGHYgBMRPYcX8MnC+dmGTYIaT8cV81sJFBtAmD2hLBEQvP8rC
	CfjUKu3K9knXW8q9UlLzWjCyCoZAl43iff9ax67KWtu5ioBk/15R6VNtHJ8oyyO7pCuc
	TMIw==
X-Gm-Message-State: ANoB5pmfk5dCi/GRDi2+XxIwITPct4GDx4L0sIjSqkfWApDsmJ5kW+EN
	WTQfmc86ZxmjRt+MztMKwZRn4A==
X-Google-Smtp-Source: AA0mqf6DfAxkmaFc6mM0MqDXmovcDbvWVnm8bTwaqanIlgGh9GVhAf4BK0cAypTFDe38Ijzp27x6Mg==
X-Received: by 2002:a17:90a:14c5:b0:20d:bbe5:f35e with SMTP id
	k63-20020a17090a14c500b0020dbbe5f35emr28131661pja.120.1669171142251;
	Tue, 22 Nov 2022 18:39:02 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	g4-20020a17090a67c400b00212735c8898sm242927pjm.30.2022.11.22.18.39.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Nov 2022 18:39:01 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
References: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
Message-Id: <166917114097.16835.13922325518442177029.b4-ty@kernel.dk>
Date: Tue, 22 Nov 2022 19:39:00 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-28747
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 0/4] lru_cache improvements,
	DRBD license identifiers
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

T24gVHVlLCAyMiBOb3YgMjAyMiAxNDo0Mjo1NyArMDEwMCwgQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IHdyb3RlOgo+IEhlcmUgYXJlIHNvbWUgaW1wcm92ZW1lbnRzIHRvIHRoZSBscnVfY2FjaGU7IG1v
c3RseSBqdXN0IGNsZWFudXBzIHRoYXQKPiB3ZSBtaXNzZWQgdG8gc2VuZCB1cHN0cmVhbSBvdmVy
IHRoZSB5ZWFycy4KPiAKPiBUaGUgbGFzdCBwYXRjaCBtYWtlcyB0aGUgU1BEWCBsaWNlbnNlIGhl
YWRlcnMgaW4gRFJCRCBjb25zaXN0ZW50IHNvCj4gdGhhdCB0aGV5IGFsbCByZXByZXNlbnQgR1BM
IDIuMC4KPiAKPiBDaHJpc3RvcGggQsO2aG13YWxkZXIgKDIpOgo+ICAgbHJ1X2NhY2hlOiByZW1v
dmUgY29tcGlsZWQgb3V0IGNvZGUKPiAgIGRyYmQ6IHVzZSBjb25zaXN0ZW50IGxpY2Vuc2UKPiAK
PiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvNF0gbHJ1X2NhY2hlOiB1c2UgYXRvbWljIG9w
ZXJhdGlvbnMgd2hlbiBhY2Nlc3NpbmcgbGMtPmZsYWdzLCBhbHdheXMKICAgICAgY29tbWl0OiBm
MmQwM2Q4OTYxNWVmNjViNWRmZjNhYWU2NTgxZGYwYjVmY2JhYTNiClsyLzRdIGxydV9jYWNoZTog
cmVtb3ZlIGNvbXBpbGVkIG91dCBjb2RlCiAgICAgIGNvbW1pdDogOTkzMzQzODQzMGIzYjc4N2Y5
NmJiNDM0YjQ0OTBiMGRkYTU5YzliMwpbMy80XSBscnVfY2FjaGU6IHJlbW92ZSB1bnVzZWQgbGNf
cHJpdmF0ZSwgbGNfc2V0LCBsY19pbmRleF9vZgogICAgICBjb21taXQ6IDJjZDEwYTQ5NmE4Njc4
NzM2NzcxNmI2ODRkYWRmZWNiYjU5NDA5NWIKWzQvNF0gZHJiZDogdXNlIGNvbnNpc3RlbnQgbGlj
ZW5zZQogICAgICBjb21taXQ6IDkzYzY4Y2M0NmEwNzA3NzVjYzY2NzVlMzU0M2RkOTA5ZWI5ZjZj
OWUKCkJlc3QgcmVnYXJkcywKLS0gCkplbnMgQXhib2UKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZA
bGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kcmJkLWRldgo=
