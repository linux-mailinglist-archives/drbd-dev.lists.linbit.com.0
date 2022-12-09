Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F0266648442
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:55:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D15684252C8;
	Fri,  9 Dec 2022 15:55:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DAD0E42096D
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:35 +0100 (CET)
Received: by mail-ed1-f47.google.com with SMTP id v8so3417308edi.3
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8SGWONfVHjklNBkXRu6sFYgnXokffLko1IC/BWEcSP8=;
	b=CFMhSCPpgXLUtR6ZiK2YFnEjmqjxsmtam0ueM6OrVLZCwoq1Oilpg6M5PZJ5VDSeRY
	2nE9gDgF744dYJmapJAukrxcvxghsFbizFHO8pW5DKE2bzJ3FsilMaxka5dKBEWkrFR4
	bxIYOOHLxBKLfut+dvsdXvJml72ts9e+HPqwQ4iEBjXFew8vsZmblks6fGeIbkP2nGs8
	tyYw5HkvY8I//dTSV7SXupiPcIQdsZUp8TVf4DuVTEdPoxPhV+9siPeVNOT9GGlyGMBc
	mIchahEZyIMQQwH165aDUoaTh7N0GnYCdaLRx0RV38O0s9CtpE6NIeVbckZg5bXk6bN6
	gveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=8SGWONfVHjklNBkXRu6sFYgnXokffLko1IC/BWEcSP8=;
	b=Z9YIjZoYD3HuSvaCvdf2FdAKBnIhG/V7q3rCiW6CV5gIByfDyAHfLwJrpJJzFq3uV2
	15fhwG1Hs5q7CLad+RSUfghYuZ5F2j4brgafN5QXUfno8Jtik2FyXGwJSENNSuR5zrkw
	nCmomgK9fM3zqLs7ixFaiTJB7ncJGXVw+2IF+4KnWyDXXZypom14Udyc3J7y58uo1pWu
	0SVeFk0pNrER6tQBs+szObmeRPY/otFJONzaDQhlapVrd5pA6uzZMDPya/n8D+s7I5oY
	LdAyqeEC90b36wO6ckjLVJVVLOUUeqNzPGpCKePA/TrbRnI7EC7uyzpJ1hSfiTmb6YAI
	1SxA==
X-Gm-Message-State: ANoB5pmBVq0xK+OpXjDEd0zX6HRwTDolPboAfEg4c9sEme0Aug3pOXbF
	4c7GD6WkI2Aw3Cl1FGu6Ale4YC5M
X-Google-Smtp-Source: AA0mqf5B8665LOfSRiKHkdYlF7U7pudYJLGfAmYc2LJBFOdrl94ZlNt0ilq4X+thHNKv4jvSoQf7Ew==
X-Received: by 2002:a05:6402:1f06:b0:461:7da0:f85a with SMTP id
	b6-20020a0564021f0600b004617da0f85amr5871865edb.5.1670597615018;
	Fri, 09 Dec 2022 06:53:35 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:34 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:23 +0100
Message-Id: <20221209145327.2272271-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 4/8] drbd: remove unnecessary assignment in
	vli_encode_bits
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
ZXJAbGluYml0LmNvbT4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VA
bGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF92bGkuaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3ZsaS5oIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
dmxpLmgKaW5kZXggMWVlODFlM2MyMTUyLi45NDFjNTExY2M0ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX3ZsaS5oCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Zs
aS5oCkBAIC0zMjcsNyArMzI3LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYml0c3RyZWFtX2dldF9i
aXRzKHN0cnVjdCBiaXRzdHJlYW0gKmJzLCB1NjQgKm91dCwgaW50IGJpdHMpCiAgKi8KIHN0YXRp
YyBpbmxpbmUgaW50IHZsaV9lbmNvZGVfYml0cyhzdHJ1Y3QgYml0c3RyZWFtICpicywgdTY0IGlu
KQogewotCXU2NCBjb2RlID0gY29kZTsKKwl1NjQgY29kZTsKIAlpbnQgYml0cyA9IF9fdmxpX2Vu
Y29kZV9iaXRzKCZjb2RlLCBpbik7CiAKIAlpZiAoYml0cyA8PSAwKQotLSAKMi4zOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
