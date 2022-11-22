Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D11633DFA
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 14:44:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9C7054252CF;
	Tue, 22 Nov 2022 14:44:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D03C34252C7
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 14:43:13 +0100 (CET)
Received: by mail-wr1-f52.google.com with SMTP id g12so24735680wrs.10
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 05:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Oz/x0hYzIKEhbV26HZwpXUkevVwyn0i3SBVcDpOX/FE=;
	b=PKJAOS7uyhQ4o6WULep7fOMCwPNev5tDMobcqb9XpkwRRaJ7PGELHvJLP+rH5JjuW5
	Y0dUKeO48GiX7GSJrO0t61xtMV7JoebKt2ibAOeZvfqoy8Y6f+8QSzbanceeMO6t5JQ7
	flG9zUAMWUCpUJDrsORvC1GFErL04yHK9KLbYcdkaaxa2h+iEGLZqxbT6ZuVAqtaC7DS
	ZdmSBH4NJP7JOa5Y0jOD6YfTeayHMYFY0pVR/mBUofyPNmV1QHbYcg/Xb96m041D3VDx
	QtmENcDGrWtvvCqIn3EWzXLoSO328nrTEGpsMSnFQTHUA3UoskAOMp3ANYaR0nCTuRxn
	KFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Oz/x0hYzIKEhbV26HZwpXUkevVwyn0i3SBVcDpOX/FE=;
	b=AmGqc43OIBeJ0QXvdIsTKFmeNuJhHJB+xD/DX5g4uW+YmabNIRHgmHRpUGDqcAVbQ0
	wj5oXZfME/IslB6x1g5fu2y5ZLdRIvjG+7kz8W4TJEgpmMJEinIoi0Du/BZRa19KuhQv
	ZB5C0t0UfA3NE6wKPvoE246wk36UD8vFSsPYWgUl6pCjtWCGWCNAQK/oVddUtafc5NCk
	ySQmPgGNht4Chy95KDxvFsBV9kpbijFzQAapH09vhhZg9vLFMpgbvAxtZp7ci/+FNKuL
	ejDYq3w8UwDJ6F4CjgMDKcXupWTNWd/BW2nohChO235tJ1jXMaPY8tcX6BkKhsa+loNO
	fhRQ==
X-Gm-Message-State: ANoB5plNRoHYinXkGP8ENxs4plAE2poHu/aIOn0qPbNg8OW1YGSkJPkU
	xWiqZDQZ+2jBJZHHSdjP37QjKP0/
X-Google-Smtp-Source: AA0mqf52OT5aMHWy12Kp09rQzNaWHG6VQv7zvokqwmjcWjtp7942E/1T21C+ydQ8dKtB57WirCl49w==
X-Received: by 2002:a5d:56d2:0:b0:236:cdf8:1e3f with SMTP id
	m18-20020a5d56d2000000b00236cdf81e3fmr7149354wrw.80.1669124593252;
	Tue, 22 Nov 2022 05:43:13 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	p6-20020a1c5446000000b003b47e75b401sm21437729wmi.37.2022.11.22.05.43.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Nov 2022 05:43:12 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Nov 2022 14:42:59 +0100
Message-Id: <20221122134301.69258-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
References: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/4] lru_cache: remove compiled out code
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KLS0tCiBsaWIvbHJ1X2NhY2hlLmMgfCAxMSAtLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9scnVfY2FjaGUu
YyBiL2xpYi9scnVfY2FjaGUuYwppbmRleCBmZWM4OTkzODYyMzguLjVkZDVlNGMwMGEyMyAxMDA2
NDQKLS0tIGEvbGliL2xydV9jYWNoZS5jCisrKyBiL2xpYi9scnVfY2FjaGUuYwpAQCAtNjAsMTcg
KzYwLDYgQEAgaW50IGxjX3RyeV9sb2NrKHN0cnVjdCBscnVfY2FjaGUgKmxjKQogCX0gd2hpbGUg
KHVubGlrZWx5ICh2YWwgPT0gTENfUEFSQU5PSUEpKTsKIAkvKiBTcGluIHVudGlsIG5vLW9uZSBp
cyBpbnNpZGUgYSBQQVJBTk9JQV9FTlRSWSgpL1JFVFVSTigpIHNlY3Rpb24uICovCiAJcmV0dXJu
IDAgPT0gdmFsOwotI2lmIDAKLQkvKiBBbHRlcm5hdGl2ZSBhcHByb2FjaCwgc3BpbiBpbiBjYXNl
IHNvbWVvbmUgZW50ZXJzIG9yIGxlYXZlcyBhCi0JICogUEFSQU5PSUFfRU5UUlkoKS9SRVRVUk4o
KSBzZWN0aW9uLiAqLwotCXVuc2lnbmVkIGxvbmcgb2xkLCBuZXcsIHZhbDsKLQlkbyB7Ci0JCW9s
ZCA9IGxjLT5mbGFncyAmIExDX1BBUkFOT0lBOwotCQluZXcgPSBvbGQgfCBMQ19MT0NLRUQ7Ci0J
CXZhbCA9IGNtcHhjaGcoJmxjLT5mbGFncywgb2xkLCBuZXcpOwotCX0gd2hpbGUgKHVubGlrZWx5
ICh2YWwgPT0gKG9sZCBeIExDX1BBUkFOT0lBKSkpOwotCXJldHVybiBvbGQgPT0gdmFsOwotI2Vu
ZGlmCiB9CiAKIC8qKgotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRl
dgo=
