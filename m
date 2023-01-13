Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 57518669768
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:37:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E191422195;
	Fri, 13 Jan 2023 13:37:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E14E42210A
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:43 +0100 (CET)
Received: by mail-ej1-f42.google.com with SMTP id tz12so52018206ejc.9
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=sQNKuz5965naByKUS4y1VIo8yUx5dsUc2Lu+3dW2kE8=;
	b=Te252XxFJERmj6gsHMX2Ubll+K8vuDQpcz/sz6kK4szts0nTB0oktTg5ouLmIRjLKF
	Zi4O4udWR6to0zU4y5FjIy+WfgYAdAPl/2WYiHxedaBhxqSCXFiCDixV/CsaA31qm7tJ
	ynai0z9jDaha4KBuIJosdtZwVtdFA6yn4MgEsFOm13UnwoMG0wOCFyS+xo2g9Pv0Teh6
	WsGFI9coLfTp7oEzWszSuZfc5ZARh1nXay20UzR7Bb9SWH4hfzkPfXpmbuyAEHS59PNz
	RA6E4YaegtTU5Gcec8wZ9mxcOV4lpje8yFY4O9dpV0y5TGYlrWuVKTrkZ8jCRbdEyE3U
	woPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=sQNKuz5965naByKUS4y1VIo8yUx5dsUc2Lu+3dW2kE8=;
	b=CedLzS2bVg8ddJonFz+hjc/6eabGuFBF1b9UUUhViR42gzTACchTMcMtlkUiFu2y3H
	YI8aFcwsG9Jg8PShEkJTtHjvgDmfRrGqJxvd91KsvCsDHFpag8pdid0qZ4rodFC3hkTV
	xsA3Smf6ZwXojvHY74I0n4Rqau60sGCduadHD0SJiz/snHhMzGU90WyIv79Jx0YETVUF
	R2nuHfvtG0IQYWqwsUBTAPGnuGE7X+a9PdgTZLAlIQSGTCguUffrZjmT9ZhL2EjdC1iA
	AT6O1SN7zLKQwVm6PCFN0+DvqfBMKeAE2IHqW31CNexeHEUoU4dQOv89cmJB+tydUOeb
	BSpQ==
X-Gm-Message-State: AFqh2krGZMHzejwti3ug5s/PMrpf1oKor6uL64NPpZ1m3UygQ0w/6ZnT
	1/iapS8tqr47vQ22vCdeQmZnFWTMeTaBS//dBhPNrw==
X-Google-Smtp-Source: AMrXdXsHyV5uZaN+B0+k4sLOMGxS6gsjp2oFHq2cCYXc3gkoDk1zoyE97qfqOiUlKxtclhZSmKgEPg==
X-Received: by 2002:a17:907:1710:b0:7c0:c36d:f5df with SMTP id
	le16-20020a170907171000b007c0c36df5dfmr83242439ejc.70.1673613343347;
	Fri, 13 Jan 2023 04:35:43 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:42 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:31 +0100
Message-Id: <20230113123538.144276-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
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
