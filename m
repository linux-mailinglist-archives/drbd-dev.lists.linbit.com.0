Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495866A444
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 21:44:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 898EA4217B3;
	Fri, 13 Jan 2023 21:44:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3AAEF4203AB
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 21:44:09 +0100 (CET)
Received: by mail-pj1-f41.google.com with SMTP id
	w4-20020a17090ac98400b002186f5d7a4cso28187343pjt.0
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=wFX1TAztefX49Dlr88yQWueCiK9uug2GKKIgj7SNmgw=;
	b=t3T7bdFcRj0TMIIRv4lrC1ysO6ZajfDnSWPjuxjJd+Z67qU9yBY0ugR12YXRcDDZfb
	yxwtc1P88m6Fg+/6USQKKxCzVsFQoZD/MtbG9DRbDTR5xBKx/xgu7ciOHyNwzZmVZi+s
	ydPfsQJTDM1ncZiqGQ9/l24VlAYJuNoTLRzH9MBWSEYpmXSbp34j2yAS6MFCeLDgeQm8
	ZNo+3pnPUV0pxPVZBiGOY6ZyoSFOUpg/X3U3pPZpILQgREGmZAzaZqGTKFQIJ/LeFaBH
	vdFaoek2Uoosyfl7wDUCuHP/3gfWzAhfm662amVz9GYoWPxYoAaWiJoesYH25hvo6SIx
	b5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=wFX1TAztefX49Dlr88yQWueCiK9uug2GKKIgj7SNmgw=;
	b=dK+5qioy9JivitVS99pSC9yd3ZMbHYPsMJxQdSJyI7T5ed8rc9SRXP1FPpMNtJFulI
	DoZ76L0Gg9VSWN5B2+vLmPotvtW4LQBuC3ocEXiTQgHsHt38MGT5UNkH7s+C9mxhqH1T
	NdxxhXk2TC3NXTY811ajXSgl0HDK2AMvV2c63dBtUOwzjxB9z8MeiBw563irYgUnE4gX
	WqaZ1xWRI1klzu5n7HQGeeN3N4q9y9ZPJ4qiASOgM2lyqFfBZpExdghx5DSoG2CYlRJ8
	Loa4MTbmq5qqvMnWLO3MufP1VI+Ypk4J7WkSVBL/GUr0YE7QI8AOgTr6j41Jz58OZrl2
	clYw==
X-Gm-Message-State: AFqh2kqMaq7FgBDSRS9vonpjnS17DU+/V2iaT8BV2jTXBopQVZ5wQ/LM
	mwXCtS+aVK+fRRFOG5jo6Mf2j6LmxJHdLqUm
X-Google-Smtp-Source: AMrXdXtX0nXp49pBZlB9bSrCFWdMWJXGiP3+ghZrlZ3nXV0E++DXWEHapsnIM08THmpGR7hFMQhz1Q==
X-Received: by 2002:a17:90a:5416:b0:226:6470:af3d with SMTP id
	z22-20020a17090a541600b002266470af3dmr10568808pjh.3.1673642648824;
	Fri, 13 Jan 2023 12:44:08 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	lb3-20020a17090b4a4300b0021900ba8eeesm1447661pjb.2.2023.01.13.12.44.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 12:44:08 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
Message-Id: <167364264790.13167.1164501758187135700.b4-ty@kernel.dk>
Date: Fri, 13 Jan 2023 13:44:07 -0700
MIME-Version: 1.0
X-Mailer: b4 0.12-dev-78c63
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RESEND PATCH 0/8] Miscellaneous DRBD reorganization
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

Ck9uIEZyaSwgMTMgSmFuIDIwMjMgMTM6MzU6MzAgKzAxMDAsIENocmlzdG9waCBCw7ZobXdhbGRl
ciB3cm90ZToKPiBTb21lIG1vcmUgbW9zdGx5IHRyaXZpYWwgImFsaWdubWVudCBwYXRjaGVzIiB0
byAoc2xvd2x5IGJ1dCBzdXJlbHkpCj4gbW92ZSBmdXJ0aGVyIGluIHRoZSBkaXJlY3Rpb24gb2Yg
cmUtdXBzdHJlYW1pbmcgRFJCRC4KPiAKPiBUaGVzZSBzaG91bGQgYmUgZmFpcmx5IHVuY29udHJv
dmVyc2lhbC4KPiAKPiBBbmRyZWFzIEdydWVuYmFjaGVyICgxKToKPiAgIGRyYmQ6IGRyYmRfaW5z
ZXJ0X2ludGVydmFsKCk6IENsYXJpZnkgY29tbWVudAo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFu
a3MhCgpbMS84XSBkcmJkOiBhZGp1c3QgZHJiZF9saW1pdHMgbGljZW5zZSBoZWFkZXIKICAgICAg
Y29tbWl0OiBmNDA5NWU3NjQzYzBmZDAwZjFjMTI1Mzg4ZDZkODNkNjA4NzVkNDg5ClsyLzhdIGRy
YmQ6IGZpeCBEUkJEX1ZPTFVNRV9NQVggNjU1MzUgLT4gNjU1MzQKICAgICAgY29tbWl0OiBmN2Zi
MDIyN2FlOTBmZmY0ZDA5ZDk2OWMzNTNlOGEzMGYyZTBlZGNjClszLzhdIGRyYmQ6IG1ha2UgbGlt
aXRzIHVuc2lnbmVkCiAgICAgIGNvbW1pdDogNGU1ZWJjZTRhNWRkZTM2MzE2YTc4NTUwYzlmN2I5
N2E5ZTAzMzAyYgpbNC84XSBkcmJkOiByZW1vdmUgdW5uZWNlc3NhcnkgYXNzaWdubWVudCBpbiB2
bGlfZW5jb2RlX2JpdHMKICAgICAgY29tbWl0OiA5M2E4MDI2YjBkNzE2MTU5NzQzN2ViMmQ4N2Nl
YWM0ZjE5NDk5MWM0Cls1LzhdIGRyYmQ6IHJlbW92ZSBtYWNyb3MgdXNpbmcgcmVxdWlyZV9jb250
ZXh0CiAgICAgIGNvbW1pdDogMDBmMGM4ZWNjYjM4Mzc4MjYyMWM3NGU1YmQyY2U5YjRiOGRiYWQ1
YQpbNi84XSBNQUlOVEFJTkVSUzogYWRkIGRyYmQgaGVhZGVycwogICAgICBjb21taXQ6IDQ2M2Fm
ZDQxN2IyNjhkMThkM2M4M2VjMDg1MWU5NzhkZDEyZGFhYTIKWzcvOF0gZHJiZDogaW50ZXJ2YWwg
dHJlZTogbWFrZSByZW1vdmluZyBhbiAiZW1wdHkiIGludGVydmFsIGEgbm8tb3AKICAgICAgY29t
bWl0OiA2OTI4ZTJmNzkxOWFhM2NkNGUzMWFiYTViMTZmNmYyMTJkZjJiYjM1Cls4LzhdIGRyYmQ6
IGRyYmRfaW5zZXJ0X2ludGVydmFsKCk6IENsYXJpZnkgY29tbWVudAogICAgICBjb21taXQ6IDJi
MDgwMmQxYWM5MzMzZDA2MDMxMmIyMmU5ZDg5ODYxNDI1M2FkY2YKCkJlc3QgcmVnYXJkcywKLS0g
CkplbnMgQXhib2UKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0
cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
