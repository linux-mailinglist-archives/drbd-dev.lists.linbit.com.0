Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F963669767
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:37:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 010FF42215B;
	Fri, 13 Jan 2023 13:37:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 314EF4217B3
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:42 +0100 (CET)
Received: by mail-ej1-f47.google.com with SMTP id u19so51948765ejm.8
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=CtCs8GxpjiNUlKe9jLRTDXiumifJAjD1jl0L4CeLiMA=;
	b=iVjJ3nWfodyyNsQdbwae7vcZ9yAMAWRUHvPDFFsqJ+ZbRLWA7X3Od2Dcrc1o5ASha/
	ijoKbtCtcrhtq3o7HgrmHZIKXgnavTg78URe7orHzD3doZEH0cWgnHM1va4F+kT1vPdv
	QEiei1roTDFPApr4rbDokzLo0mbijR0PndJUPtQR/hBXy0Gc941NCaH7uNlwPLH/M304
	zqE/jQ+ve8/3I1qHy7dmQT098fctIvjnarLt2h7S1sFUPdo0ak8YGHwWz7YC57yrrxX2
	HW5ZmbPMyGQiOq3GGIimgOYzoeUnFrxQrRs7RpFEsh9hNXTjq4QtKHaRxp8fhgEL7zKa
	ViaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=CtCs8GxpjiNUlKe9jLRTDXiumifJAjD1jl0L4CeLiMA=;
	b=6XWOekZcokjsudRxdm0TCFaK4MF5k+5iBpOM/+Xwbkl27BqrHAHy/Ehg1OlgA9051t
	5Ih9tZNv4r04wDSzhA+/UHX+XqJDG5dKKtz2bJunzj9i3tbeOiuqr3v9fzDjrSUa64YG
	Ri83us7vFyzhcf85eqaZOI0zlnpC4++6uiCIVJYSY6PLve4BSkVlkxeF28ZKOCcFSjKo
	RfeClrRVzkxF1ViXTHhQ3hfljc8v9+fJVO3+DhJxDV4Gg+jEEbpjcU06av7y4kzkqIrU
	xZ38eVzZBOJqce+3GYx3mR+fJIq6BmS/tkjzsFfC1effmvLQf47RNJRe8t3izXDGLFEr
	smQQ==
X-Gm-Message-State: AFqh2kpu1wyOm/73HHRhuT1HZyme6hNpYn8Ydmi0ePKx1DIGsYqRUDK8
	AyIkZ38aVGKwUW/t+YRmvn47JZYx
X-Google-Smtp-Source: AMrXdXscUQGyihFd72/UBQHujIY3PI028gGBGoZyl+Ii+Ozg85WvOyE0kQeJO4cYA4H80HINGbZLnw==
X-Received: by 2002:a17:906:2d4a:b0:84c:cf42:e16 with SMTP id
	e10-20020a1709062d4a00b0084ccf420e16mr33260592eji.1.1673613342548;
	Fri, 13 Jan 2023 04:35:42 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:42 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:30 +0100
Message-Id: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [RESEND PATCH 0/8] Miscellaneous DRBD reorganization
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
