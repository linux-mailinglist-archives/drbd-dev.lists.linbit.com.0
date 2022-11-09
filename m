Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BF622C75
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Nov 2022 14:35:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 714CC4220C1;
	Wed,  9 Nov 2022 14:35:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5AAA842178D
	for <drbd-dev@lists.linbit.com>; Wed,  9 Nov 2022 14:35:05 +0100 (CET)
Received: by mail-ej1-f52.google.com with SMTP id kt23so46630968ejc.7
	for <drbd-dev@lists.linbit.com>; Wed, 09 Nov 2022 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=gtOl1+w9+H/kDpYw0VENqPv5aJ8skI+vP8Y3fHG6JhY=;
	b=m3xksJLf0b3ZNRrGKim/LnCvOPAM7mztwM9sBrnvlkQ/JNHs0iof1K+DXpqiv6kQqv
	Cbn/baGxs0r/3h72mEOEwPOmeWnMJHbrynlqVSdkLBwig0vEJLJb9RPjua8pSFhZRAAi
	ZKQdjhMu4nSSMUcMqZ27zjkSLMBLm2YMM4VyE1E03RDglqtSNluJKUNnWUzwIJ+hBiDr
	0F3Q7wVaF7GM+ut94pMWKwHGsHjdq7wXls1n+094e9y+E5JGfbIObB90o6FNg1o9t7gm
	AtqSlSwKrUy6zQAQ4whkQb9nRylPlPMZry5qDr/HGVHwhF9dhMYuTQKLpyCUkWcvqj0u
	J+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=gtOl1+w9+H/kDpYw0VENqPv5aJ8skI+vP8Y3fHG6JhY=;
	b=0kx5M+1OtqPceLO3wrzR2dVHOJaRuVV6vF+bJ1aJkcYD9p6MR/6vapy3Cbjpb6B4FV
	bQtXjRB0fzd4BsMFKuQObc2sdHJb0VmjwoGtfN6RrgKKIwcJpuaJIk+IBJilFnmc0TS4
	uVxTrwO1TiTsGN0Y+hrfT7/itd81dLxVPq4sA6Dqa6pkj6gXfo733NhkFQGCb2wdygC2
	U+T52gqIBSB7aXcRTMuNis1jBcCvcJ9qci08PKD69+Tf7fmRwn5Uj0ih4YL3NDSvbEoG
	tFNh5/bGbSi00iL6gUh8ZdIzRgxYkstw7l6e7B+cVOZ9mYq/njtof0Ffw135ZEsRU1m4
	lIeg==
X-Gm-Message-State: ACrzQf1iI7ITdP8GzL/SESlFahBAPCB4cZdlI2mCC3RTQvUzdzAlidis
	9EdSXNN+Yx2n1U9Ia4GYsfJbiXC9
X-Google-Smtp-Source: AMsMyM6wyvAwUO1KLGRtkWxtnHORrvQJPnlfEaGAXuBUObnH2kCMbIz/Dl2mKD6wQHt3o4of/6mkdg==
X-Received: by 2002:a17:906:474b:b0:78d:cea0:e87a with SMTP id
	j11-20020a170906474b00b0078dcea0e87amr1144404ejs.178.1668000904938;
	Wed, 09 Nov 2022 05:35:04 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	lx8-20020a170906af0800b00782fbb7f5f7sm5867463ejb.113.2022.11.09.05.35.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Nov 2022 05:35:04 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  9 Nov 2022 14:34:50 +0100
Message-Id: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/3] Miscellaneous DRBD updates for 6.2
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

SGVyZSBhcmUgc29tZSB2YXJpb3VzIHVwZGF0ZXMgZm9yIERSQkQuClRoZSBmaXJzdCB0d28gYXJl
IHJlbGF0ZWQgdG8gdGhlIGhhbmRsaW5nIG9mIGRpc2NhcmRzIGluIERSQkQsIGFuZCB0aGUKdGhp
cmQgaXMgYSByZXNlbmQgb2YgWzBdLgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIyMTAyNDE0MjQyNC4yNTg3Ny0xLWNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tLwoK
Q2hyaXN0b3BoIELDtmhtd2FsZGVyICgyKToKICBkcmJkOiB1c2UgYmxrX3F1ZXVlX21heF9kaXNj
YXJkX3NlY3RvcnMgaGVscGVyCiAgZHJiZDogU3RvcmUgb3AgaW4gZHJiZF9wZWVyX3JlcXVlc3QK
ClBoaWxpcHAgUmVpc25lciAoMSk6CiAgZHJiZDogZGlzYWJsZSBkaXNjYXJkIHN1cHBvcnQgaWYg
Z3JhbnVsYXJpdHkgPiBtYXgKCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCAgICAgIHwg
IDggKystCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jICAgICAgIHwgMjMgKysrKysrKy0t
CiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwgODEgKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYyAgIHwgIDQg
Ky0KIDQgZmlsZXMgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCgot
LSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczov
L2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
