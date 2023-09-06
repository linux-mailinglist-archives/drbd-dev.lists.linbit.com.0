Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F7793DAC
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Sep 2023 15:31:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E6BF42063F;
	Wed,  6 Sep 2023 15:31:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 73E2A42018E
	for <drbd-dev@lists.linbit.com>; Wed,  6 Sep 2023 15:31:11 +0200 (CEST)
Received: by mail-ed1-f45.google.com with SMTP id
	4fb4d7f45d1cf-52e828ad46bso2206192a12.1
	for <drbd-dev@lists.linbit.com>; Wed, 06 Sep 2023 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1694007070;
	x=1694611870; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=ZQEKqe3bDH27s4AsrbKUQCFmR3pSzTgTwp308wc1fxo=;
	b=rq35Lq9xCoD8PtIJSwmsCNNBpkfI/0AaxtTCMW9InD94AyzbRpz6bLWFFEzJ5GSNyR
	IMO0PqhhCb5yQ58E/RxM6P7FByYdxG3174W0mhtsSV2xKLGwyIUr4hoT6jp22XMKu1Cw
	tVtAK0bf/l4nVyfRVz/BM6zW0oAega2EGrnuRTW5PKBe/IAOQRIEXqw33PDYa+n8lkCG
	p12WiyLfK0RuUEzaaOnfAzQXKgAfPbDOV0LKfQC3f2IQkAiHdPCLx4MBB2OYX3UGxB5S
	dRd8IuhhSd3HPTJLOpqN8g2bF0YNWh5vKyrfH0XUmdCLaQ4K3srEd7p0aZMf3xlQG9I1
	VVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1694007070; x=1694611870;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=ZQEKqe3bDH27s4AsrbKUQCFmR3pSzTgTwp308wc1fxo=;
	b=QykydSqEiPaed+DsJ/hcW6I74Ybgkat/Y+SYZUPyR1wbw1NwCWj9G9NTFld1T4pLh5
	fZf6pg6sKXfbgkOIzWxpttbYW8i+jL8WlqPgvKHOX6uNGa2T0tRnCULWVhui8oDjr4bh
	f72VAokoCWSLpJD4xDn+Hs1qU9iY5+qgp4ROnc6gvI5xloCeMPfrpK1ul9drqlNV9ZvH
	Wr2tVTfEksMf2hjjhb11WyOPxNbN3bFASNHPH9MWhwfBtN26mgmMpNve6oeOqkUgra7/
	c5Hc0GknZnZyCWkYwbpPEtwmuHX5LEJjyilGwfqSZDnkjsBYdtLffIOKhcwgPdk6C3SO
	k7iQ==
X-Gm-Message-State: AOJu0YyLCLzqr2wLm/y6OGSqtz4KcLCo2RuC0/pkET3rLvytZlysfpMa
	Mm54Zt6UW860WMLfrkXR2ver3AY1
X-Google-Smtp-Source: AGHT+IHxQ1RmQuQHmgQQmnWbUnYbPKmInDa2Y2sq1quXXuZPSayEmNlnZxowArje3NTqDDs5B/wckw==
X-Received: by 2002:a17:906:1044:b0:99b:c86b:1d25 with SMTP id
	j4-20020a170906104400b0099bc86b1d25mr2395858ejj.26.1694007070656;
	Wed, 06 Sep 2023 06:31:10 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	gh4-20020a170906e08400b009875a6d28b0sm8983369ejb.51.2023.09.06.06.31.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Sep 2023 06:31:10 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Sep 2023 15:30:34 +0200
Message-ID: <20230906133034.948817-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: David Howells <dhowells@redhat.com>,
	Serguei Ivantsov <manowar@gsc-game.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	Linux regression tracking <regressions@leemhuis.info>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: swap bvec_set_page len and offset
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

YnZlY19zZXRfcGFnZSBoYXMgdGhlIGZvbGxvd2luZyBzaWduYXR1cmU6CgpzdGF0aWMgaW5saW5l
IHZvaWQgYnZlY19zZXRfcGFnZShzdHJ1Y3QgYmlvX3ZlYyAqYnYsIHN0cnVjdCBwYWdlICpwYWdl
LAoJCXVuc2lnbmVkIGludCBsZW4sIHVuc2lnbmVkIGludCBvZmZzZXQpCgpIb3dldmVyLCB0aGUg
dXNhZ2UgaW4gRFJCRCBzd2FwcyB0aGUgbGVuIGFuZCBvZmZzZXQgcGFyYW1ldGVycy4gVGhpcwps
ZWFkcyB0byBhIGJ2ZWMgd2l0aCBsZW5ndGg9MCBpbnN0ZWFkIG9mIHRoZSBpbnRlbmRlZCBsZW5n
dGg9NDA5Niwgd2hpY2gKY2F1c2VzIHNvY2tfc2VuZG1zZyB0byByZXR1cm4gLUVJTy4KClRoaXMg
bGVhdmVzIERSQkQgdW5hYmxlIHRvIHRyYW5zbWl0IGFueSBwYWdlcyBhbmQgdGh1cyBjb21wbGV0
ZWx5CmJyb2tlbi4KClN3YXBwaW5nIHRoZSBwYXJhbWV0ZXJzIGZpeGVzIHRoZSByZWdyZXNzaW9u
LgoKRml4ZXM6IGVlYWM3NDA1YzczNSAoImRyYmQ6IFVzZSBzZW5kbXNnKE1TR19TUExJQ0VfUEFH
RVMpIHJhdGhlciB0aGFuIHNlbmRwYWdlKCkiKQpSZXBvcnRlZC1ieTogU2VyZ3VlaSBJdmFudHNv
diA8bWFub3dhckBnc2MtZ2FtZS5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Jl
Z3Jlc3Npb25zL0NBS0grVlQzWUxtQW4wWTg9cTM3VVREU2hxeERMc3FQY1E0aEJNelk3SFBuN3pO
eCtSUUBtYWlsLmdtYWlsLmNvbS8KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0
LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWlu
LmMKaW5kZXggNzlhYjUzMmFhYmFmLi42YmM4NjEwNmM3YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX21haW4uYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWlu
LmMKQEAgLTE1NTcsNyArMTU1Nyw3IEBAIHN0YXRpYyBpbnQgX2RyYmRfc2VuZF9wYWdlKHN0cnVj
dCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgc3RydWN0IHBhZ2UgKnBhCiAJZG8gewog
CQlpbnQgc2VudDsKIAotCQlidmVjX3NldF9wYWdlKCZidmVjLCBwYWdlLCBvZmZzZXQsIGxlbik7
CisJCWJ2ZWNfc2V0X3BhZ2UoJmJ2ZWMsIHBhZ2UsIGxlbiwgb2Zmc2V0KTsKIAkJaW92X2l0ZXJf
YnZlYygmbXNnLm1zZ19pdGVyLCBJVEVSX1NPVVJDRSwgJmJ2ZWMsIDEsIGxlbik7CiAKIAkJc2Vu
dCA9IHNvY2tfc2VuZG1zZyhzb2NrZXQsICZtc2cpOwotLSAKMi40MS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QK
ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kcmJkLWRldgo=
