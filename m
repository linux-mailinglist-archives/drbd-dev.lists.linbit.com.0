Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B5564843C
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:54:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B7A74210DE;
	Fri,  9 Dec 2022 15:54:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 108A2420372
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:33 +0100 (CET)
Received: by mail-ed1-f49.google.com with SMTP id e13so3394440edj.7
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=sQNKuz5965naByKUS4y1VIo8yUx5dsUc2Lu+3dW2kE8=;
	b=DULViScp0ZVXctPxlfv4qNn3cbilafSOKGMk8dRJw6i79Vudl6DOMfT79rpjRXPf0h
	Cby/vdu1mbCSR5Pn1rz+wJ/UCZYjXWxxXHWINZiipWv4QJoPQadESG07ukq3PX2z1e2y
	QaX76pV4y0QLJ8BAT8gHsy28rsADUqeOHOembmFs70/VOMQVVf6Ubt31LYagnvEc0GJa
	p8KQ4d9Iw3OGQI2KTwoVqlFWfGfaJcfFe/egS5Kmqj2CN19y216WgrcyU94kOCDH7OOt
	P+yF159+WVZEXSM6ECXkVUZ4IbilDRTHiXQ2/MLbb3HqoB3wSY2oZTo8gVb4MzO7CMJC
	G1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=sQNKuz5965naByKUS4y1VIo8yUx5dsUc2Lu+3dW2kE8=;
	b=fT2Ddp3KbjQaVoJ762Z8b53XqxjT/6X32IA/S0oerr0z5BWMQc8FhTnCoq8KGK5biP
	orWzVivdhNyPhAVXqrzBoxYmNMAkr/AG9hcT0e5eguJXgRDwXLlQNDoJnnY4JBUz4VGl
	penV78H1l3i3/RO4MOXEJ+WaiuTBjlDGLBVcY4eV5lwReAQcS86znO4wv7oPtiPdkPHC
	VLV9pJfeKXBN+hZ02JpuK+Pc4siqmQLs/wY6kGgyDc+6Al4Con4hXUoJqDgQQSEibVwn
	aAVtHFwIuQmZh9/z2PRP8wO6NH9/sPXUx5vS4WD9i4s4tlIlKPSUq17zwgOdY3DD1p1m
	WqfA==
X-Gm-Message-State: ANoB5pl8xNPOlIhqcTe+06XGwSUyie6ftd2kemI9U+zh3S2J+5/vBQuk
	ee11Z6yZQnsj+EutZuahWbYhpQ8h/GRiGVCAAQOuTg==
X-Google-Smtp-Source: AA0mqf5/exKOQ2UtDww2W1sqkCHfaWxm6TJeIW8pBJLUQGIbDQbARma3JEOCV+NUeA1Xc09JANibUw==
X-Received: by 2002:a05:6402:25c7:b0:461:c5b4:a7d0 with SMTP id
	x7-20020a05640225c700b00461c5b4a7d0mr5638007edb.24.1670597612854;
	Fri, 09 Dec 2022 06:53:32 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:32 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:20 +0100
Message-Id: <20221209145327.2272271-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/8] drbd: adjust drbd_limits license header
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

U2VlIGFsc28gY29tbWl0IDkzYzY4Y2M0NmEwNyAoImRyYmQ6IHVzZSBjb25zaXN0ZW50IGxpY2Vu
c2UiKS4gV2Ugb25seQp3YW50IHRvIGxpY2Vuc2UgZHJiZCB1bmRlciBHUEwtMi4wLCBzbyB1c2Ug
dGhlIGNvcnJlc3BvbmRpbmcgU1BEWCBoZWFkZXIKY29uc2lzdGVudGx5LgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4K
LS0tCiBpbmNsdWRlL2xpbnV4L2RyYmRfbGltaXRzLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2RyYmRfbGltaXRzLmggYi9pbmNsdWRlL2xpbnV4L2RyYmRfbGltaXRzLmgKaW5kZXggOWUzM2Y3
MDM4YmVhLi5kNjQyNzFjY2VjZTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZHJiZF9saW1p
dHMuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RyYmRfbGltaXRzLmgKQEAgLTEsNCArMSw0IEBACi0v
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwogLyoKICAgZHJiZF9saW1pdHMuaAogICBUaGlzIGZp
bGUgaXMgcGFydCBvZiBEUkJEIGJ5IFBoaWxpcHAgUmVpc25lciBhbmQgTGFycyBFbGxlbmJlcmcu
Ci0tIAoyLjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBz
Oi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
