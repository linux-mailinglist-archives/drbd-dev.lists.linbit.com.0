Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CD64842C
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:53:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 20E9242095F;
	Fri,  9 Dec 2022 15:53:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE6AC420372
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:32 +0100 (CET)
Received: by mail-ed1-f49.google.com with SMTP id e13so3394385edj.7
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=CtCs8GxpjiNUlKe9jLRTDXiumifJAjD1jl0L4CeLiMA=;
	b=MHoLj/reYCEaCu2BZl791sUFMu9EsJFTpuGoSGhqpzPg1G2i0+rLOnXbsB74P9BAN9
	nIpY0Gnji9Fvtm+3k4SGTzoM0pjpKrp58glH6ITl3OGiRQ4wKlxsE9B9MO3Ta6kSCCT2
	FRjDRDKxtEPLDb/k49mnKJLE4k/GiOCWaPQdx5p1AmTeufBD40E2oASTNMZES01XTvDU
	ob7QGOqAnUyVU485JtXEMbvjpSShmh7tyXcQ/pABd4lut+BrUnbtpdiECjQQjcELOV9s
	ZKCVJhpPA+iSjzC1lop/aOkPvTKR9c3ijh4XvJeNOj9EW0nnSFcsgUUAmmnPFcmuOJa5
	hZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=CtCs8GxpjiNUlKe9jLRTDXiumifJAjD1jl0L4CeLiMA=;
	b=LQlMjKS23xYx9lljxQc9i7rjS7xuhsG96ggeLNZKaKypbau04YR9xJyvnJeDG6SbPz
	FUmQ+yYaOsApd/mxdfklDwXeTu1szqZFEx3DHkEpPZRErONc6dXVkj8c0hnVkZycYpbM
	hjDRgf5s5S1dpaSbzco8f0lhpAvWe9OX+1ecCR53JuW7ETvZxP5rvJyEj3XQkwnaHy9q
	FCly7Sk1d03YxZ5ogpQDPii/CHJKlceDG6mqSQ2jP1dDtSCFmHSg3Cwf+ZfdyWpHjtXQ
	sNdXP3HFsfcB0j3pXNE8Vv/fvS5yId8HaUGfi7swlboq4L6CIZMtJTvjKfvlOykUqRg3
	e7Pw==
X-Gm-Message-State: ANoB5plvd8hi7aBewypfSNooAMTmrr4X65lAZaTr3eG5rInKmnEMIlR0
	l5nrxMgYT9yrnyt4ytpUI/sQ1r5x
X-Google-Smtp-Source: AA0mqf48psVfOczEhg6GzyTLj3NBiKg2BMDsqH01qlhK1pulUi4SHigJ39yDwhJazBez6TTHcD8srg==
X-Received: by 2002:aa7:cac2:0:b0:461:608f:f3e0 with SMTP id
	l2-20020aa7cac2000000b00461608ff3e0mr5102001edt.28.1670597612099;
	Fri, 09 Dec 2022 06:53:32 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:31 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:19 +0100
Message-Id: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/8] Miscellaneous DRBD reorganization
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

U29tZSBtb3JlIG1vc3RseSB0cml2aWFsICJhbGlnbm1lbnQgcGF0Y2hlcyIgdG8gKHNsb3dseSBi
dXQgc3VyZWx5KQptb3ZlIGZ1cnRoZXIgaW4gdGhlIGRpcmVjdGlvbiBvZiByZS11cHN0cmVhbWlu
ZyBEUkJELgoKVGhlc2Ugc2hvdWxkIGJlIGZhaXJseSB1bmNvbnRyb3ZlcnNpYWwuCgpBbmRyZWFz
IEdydWVuYmFjaGVyICgxKToKICBkcmJkOiBkcmJkX2luc2VydF9pbnRlcnZhbCgpOiBDbGFyaWZ5
IGNvbW1lbnQKCkNocmlzdG9waCBCw7ZobXdhbGRlciAoNSk6CiAgZHJiZDogYWRqdXN0IGRyYmRf
bGltaXRzIGxpY2Vuc2UgaGVhZGVyCiAgZHJiZDogbWFrZSBsaW1pdHMgdW5zaWduZWQKICBkcmJk
OiByZW1vdmUgdW5uZWNlc3NhcnkgYXNzaWdubWVudCBpbiB2bGlfZW5jb2RlX2JpdHMKICBkcmJk
OiByZW1vdmUgbWFjcm9zIHVzaW5nIHJlcXVpcmVfY29udGV4dAogIE1BSU5UQUlORVJTOiBhZGQg
ZHJiZCBoZWFkZXJzCgpMYXJzIEVsbGVuYmVyZyAoMSk6CiAgZHJiZDogaW50ZXJ2YWwgdHJlZTog
bWFrZSByZW1vdmluZyBhbiAiZW1wdHkiIGludGVydmFsIGEgbm8tb3AKClJvYmVydCBBbHRub2Vk
ZXIgKDEpOgogIGRyYmQ6IGZpeCBEUkJEX1ZPTFVNRV9NQVggNjU1MzUgLT4gNjU1MzQKCiBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX2ludC5oICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludGVy
dmFsLmMgfCAgIDYgKy0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3ZsaS5oICAgICAgfCAgIDIg
Ky0KIGluY2x1ZGUvbGludXgvZHJiZF9saW1pdHMuaCAgICAgICAgfCAyMDQgKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKyksIDEx
NSBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogZjU5NmRhM2VmYWY0MTMwZmY2MWNkMDI5NTU4
ODQ1ODA4ZGY5YmY5OQotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRl
dgo=
