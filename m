Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E24F699E
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:11:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 37D2A420FF9;
	Wed,  6 Apr 2022 21:11:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E620420FE2
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:36 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id p23so3775856edi.8
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TnUktBxvt8+vZXxb7vXGqvLd54peL2xRpiiuPoGFnkk=;
	b=RTjQs8filYk4C4QQnW6B2lyt27Gc5MyDO2AWKp3UlCdUISg90K1O9Hav0/7pdY97gl
	b0nlFnS7D8D+7bfLJNpuq25U9xZYXGoh3G+vn96SLCdeBEmXa9/N4EYLpCIrk790sjwh
	Eyicd/11fMeVgIm1IvCKoca+kw4pE34D5v15p5Xsn/pHZTxAvKYFS2jGGgkEqbsGgXK5
	znTMf2671Efgm6HThOvVkCyYDmyJcscyHfEVjFUgZOkLW8Zb5ty0Lw/KcvBaAYpkHP8c
	uY5orEeRzQcUztWB1myK7izLj8q93jCf3Rd5lHScKNZ2TsWUwGeiOVY7oVgFDoXLVVSK
	HCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TnUktBxvt8+vZXxb7vXGqvLd54peL2xRpiiuPoGFnkk=;
	b=y0XApxSkJB7ZnW8zcfQDwq9J2+N8xqWijgSps1nJDIEkUOXuTCDYNn+pDU1JkJY4uF
	qZoB3QIHYy/lmc4pvQT9Bi84eU37hwj47F5h1E/rN4hf37OT9TJ+bVSiYrCTMEIxisDd
	usOUnaQGBN0RlDCuLChITyA+EktlLgi3+eSnKUILAGOqZOARbAKFERkamKZz44aIPWkT
	ED53kDMB2+Q4xF0QCZxYbgb2uo1mTtbVKk28P5OxfQE/CKfSlVmvJOzhRDx9aZqiYk6V
	2uEMFvNGiskHKOt3VLQrGBq/7r8XcFubQWJUBl7PQwLt+QjUVyndtBtx6lYqYPLUaBOf
	0idQ==
X-Gm-Message-State: AOAM532y/rCStGoQGj6wpqpQXhdW8Le/lm5q1SYw74zl81SwvS3DX3tT
	H6y3v6TC5BH35XIkEIl6PnZBYXcw
X-Google-Smtp-Source: ABdhPJxx9ngsTndlvSdykCBzt140ypyzhYFDLBaN1Ud/EcD94rJa1p1GXvY0GkN6S1lJk4ud48Suuw==
X-Received: by 2002:a05:6402:2687:b0:419:1f59:19c4 with SMTP id
	w7-20020a056402268700b004191f5919c4mr10447356edd.255.1649272056533;
	Wed, 06 Apr 2022 12:07:36 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	er22-20020a170907739600b006e7e873ed6csm4323534ejc.53.2022.04.06.12.07.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:36 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:13 +0200
Message-Id: <20220406190715.1938174-6-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Cai Huoqing <caihuoqing@baidu.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 5/7] drbd: Replace "unsigned" with "unsigned int"
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

RnJvbTogQ2FpIEh1b3FpbmcgPGNhaWh1b3FpbmdAYmFpZHUuY29tPgoKd2hlbiBydW4gY2hlY2tw
YXRoLnBsIGZvciB0aGUgZmlyc3QgcGF0Y2gsIGZvdW5kIHRoYXQKV0FSTklORzogUHJlZmVyICd1
bnNpZ25lZCBpbnQnIHRvIGJhcmUgdXNlIG9mICd1bnNpZ25lZCcuCnNvIGZpeCBpdC4gQlRXCgpT
aWduZWQtb2ZmLWJ5OiBDYWkgSHVvcWluZyA8Y2FpaHVvcWluZ0BiYWlkdS5jb20+CkFja2VkLWJ5
OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29t
PgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgYi9kcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9yZWNlaXZlci5jCmluZGV4IGM2YzE4NDM0NTJiYS4uMDgyNTc2NmNlOTEwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jCisrKyBiL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKQEAgLTM2NCw3ICszNjQsNyBAQCBkcmJkX2FsbG9j
X3BlZXJfcmVxKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgdTY0IGlkLCBz
ZWN0b3JfdCBzZWN0bwogCXN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlID0gcGVlcl9kZXZpY2Ut
PmRldmljZTsKIAlzdHJ1Y3QgZHJiZF9wZWVyX3JlcXVlc3QgKnBlZXJfcmVxOwogCXN0cnVjdCBw
YWdlICpwYWdlID0gTlVMTDsKLQl1bnNpZ25lZCBucl9wYWdlcyA9IFBGTl9VUChwYXlsb2FkX3Np
emUpOworCXVuc2lnbmVkIGludCBucl9wYWdlcyA9IFBGTl9VUChwYXlsb2FkX3NpemUpOwogCiAJ
aWYgKGRyYmRfaW5zZXJ0X2ZhdWx0KGRldmljZSwgRFJCRF9GQVVMVF9BTF9FRSkpCiAJCXJldHVy
biBOVUxMOwpAQCAtMTYyOSw5ICsxNjI5LDkgQEAgaW50IGRyYmRfc3VibWl0X3BlZXJfcmVxdWVz
dChzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwKIAlzdHJ1Y3QgYmlvICpiaW87CiAJc3RydWN0
IHBhZ2UgKnBhZ2UgPSBwZWVyX3JlcS0+cGFnZXM7CiAJc2VjdG9yX3Qgc2VjdG9yID0gcGVlcl9y
ZXEtPmkuc2VjdG9yOwotCXVuc2lnbmVkIGRhdGFfc2l6ZSA9IHBlZXJfcmVxLT5pLnNpemU7Ci0J
dW5zaWduZWQgbl9iaW9zID0gMDsKLQl1bnNpZ25lZCBucl9wYWdlcyA9IFBGTl9VUChkYXRhX3Np
emUpOworCXVuc2lnbmVkIGludCBkYXRhX3NpemUgPSBwZWVyX3JlcS0+aS5zaXplOworCXVuc2ln
bmVkIGludCBuX2Jpb3MgPSAwOworCXVuc2lnbmVkIGludCBucl9wYWdlcyA9IFBGTl9VUChkYXRh
X3NpemUpOwogCiAJLyogVFJJTS9ESVNDQVJEOiBmb3Igbm93LCBhbHdheXMgdXNlIHRoZSBoZWxw
ZXIgZnVuY3Rpb24KIAkgKiBibGtkZXZfaXNzdWVfemVyb291dCguLi4sIGRpc2NhcmQ9dHJ1ZSku
Ci0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBz
Oi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
