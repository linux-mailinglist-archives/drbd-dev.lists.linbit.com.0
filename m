Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB44F6997
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:09:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C114420FEF;
	Wed,  6 Apr 2022 21:09:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B2DAC420FE0
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:35 +0200 (CEST)
Received: by mail-ej1-f50.google.com with SMTP id l7so837897ejn.2
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8LQaWUct48NS9KOzqSJyG6Q8nrCLvO/0d/8JaBy+8UI=;
	b=8TLmi9yBHa5xfLlHJtNCWx/79qp4+wuKkyxTxgSZtFc2EXW66RIEfopio1Yw+IBGtI
	6zrd5FaUZBKsPWNz7OcfX4S8P/YnO6QAQsUVEIP8ecGjtCTCwGvutCrVx7+QzVtjDmo4
	vDA3YxoKJixzsVnvWjfdYRN2iLRa7hBuqURTaxUrLei+2EAA1QYn6SdisYjJFh1oalQT
	WfnTDmBuLl53v1JN5NavC3N5mpE2QkeT9bRWdMFUesnvBV4W9OLhmzE2tQUrooRgOY0p
	iIRanPlPSedLVXDBbtP2wmNAqqk05QBOTOzOTgU/fqykRCZGO+fJcwCyjEQD0Nlp/ijn
	gYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8LQaWUct48NS9KOzqSJyG6Q8nrCLvO/0d/8JaBy+8UI=;
	b=vlWmmlYbd7N/ZxPyyU3Gv6LYwl2+HGaOrJOADDRFENzf9FkmIVUstBSXSsO4gy/3V+
	CGi1LciYwP5rlo0OM5+omZUHJQzOJr3rkQTUCHIosiGcjfrkDwPQsr8ibn3NY5k1eiMw
	11G6TutK/1pMaTI2oXXkjYMICgu91Mgph6fW8VnHtFM2bRvUMK60sOkFRUv1a9Ok7lQz
	CBpGLeIeuD7aghEqya7Gx6kFcxMEAZP+rHg8W8uyld78ed2i8gjlh+hbaVSc+ObloA9T
	/zZPuszEz5E1QJATtd/UKh3DE8bs4qsFiPYj/CpuN4BJYBJ0B0mJmEPMr7pS8nRBNd+a
	Hs1g==
X-Gm-Message-State: AOAM5305OucD/BBWGgYvHZfpxkJuBN1zE381srd4xuyZFPGoP4/GGhWJ
	GPAg7I8jWUuerGkT06JDEkWAGuxR
X-Google-Smtp-Source: ABdhPJwRJutJaI7ufjruNvQEHwLj2pj6On47DxDImFWmez6E6EnVTp6BuR7eMlhnvrAAGLTGDlyZjA==
X-Received: by 2002:a17:907:1c9e:b0:6e0:2fed:869a with SMTP id
	nb30-20020a1709071c9e00b006e02fed869amr9619973ejc.122.1649272055250;
	Wed, 06 Apr 2022 12:07:35 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	q2-20020a170906144200b006ceb8723de9sm6853732ejc.120.2022.04.06.12.07.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:34 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:12 +0200
Message-Id: <20220406190715.1938174-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Cai Huoqing <caihuoqing@baidu.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 4/7] drbd: Make use of PFN_UP helper macro
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

RnJvbTogQ2FpIEh1b3FpbmcgPGNhaWh1b3FpbmdAYmFpZHUuY29tPgoKaXQncyBhIHJlZmFjdG9y
IHRvIG1ha2UgdXNlIG9mIFBGTl9VUCBoZWxwZXIgbWFjcm8KClNpZ25lZC1vZmYtYnk6IENhaSBI
dW9xaW5nIDxjYWlodW9xaW5nQGJhaWR1LmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdG9waCBCw7Zo
bXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+Ci0tLQogZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfYml0bWFwLmMgICB8IDIgKy0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X3JlY2VpdmVyLmMgfCA0ICsrLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3dvcmtlci5jICAg
fCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYyBiL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX2JpdG1hcC5jCmluZGV4IGRmMjVlZWNmODBhZi4uOWUwNjBlNDliM2Y4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYworKysgYi9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYwpAQCAtNjgzLDcgKzY4Myw3IEBAIGludCBkcmJk
X2JtX3Jlc2l6ZShzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgc2VjdG9yX3QgY2FwYWNpdHks
IGludCBzZXRfbmV3X2JpCiAJCX0KIAl9CiAKLQl3YW50ID0gQUxJR04od29yZHMqc2l6ZW9mKGxv
bmcpLCBQQUdFX1NJWkUpID4+IFBBR0VfU0hJRlQ7CisJd2FudCA9IFBGTl9VUCh3b3JkcypzaXpl
b2YobG9uZykpOwogCWhhdmUgPSBiLT5ibV9udW1iZXJfb2ZfcGFnZXM7CiAJaWYgKHdhbnQgPT0g
aGF2ZSkgewogCQlEX0FTU0VSVChkZXZpY2UsIGItPmJtX3BhZ2VzICE9IE5VTEwpOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3JlY2VpdmVyLmMKaW5kZXggOTExYzI2NzUzNTU2Li5jNmMxODQzNDUyYmEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKKysrIGIvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwpAQCAtMzY0LDcgKzM2NCw3IEBAIGRyYmRfYWxs
b2NfcGVlcl9yZXEoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCB1NjQgaWQs
IHNlY3Rvcl90IHNlY3RvCiAJc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UgPSBwZWVyX2Rldmlj
ZS0+ZGV2aWNlOwogCXN0cnVjdCBkcmJkX3BlZXJfcmVxdWVzdCAqcGVlcl9yZXE7CiAJc3RydWN0
IHBhZ2UgKnBhZ2UgPSBOVUxMOwotCXVuc2lnbmVkIG5yX3BhZ2VzID0gKHBheWxvYWRfc2l6ZSAr
IFBBR0VfU0laRSAtMSkgPj4gUEFHRV9TSElGVDsKKwl1bnNpZ25lZCBucl9wYWdlcyA9IFBGTl9V
UChwYXlsb2FkX3NpemUpOwogCiAJaWYgKGRyYmRfaW5zZXJ0X2ZhdWx0KGRldmljZSwgRFJCRF9G
QVVMVF9BTF9FRSkpCiAJCXJldHVybiBOVUxMOwpAQCAtMTYzMSw3ICsxNjMxLDcgQEAgaW50IGRy
YmRfc3VibWl0X3BlZXJfcmVxdWVzdChzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwKIAlzZWN0
b3JfdCBzZWN0b3IgPSBwZWVyX3JlcS0+aS5zZWN0b3I7CiAJdW5zaWduZWQgZGF0YV9zaXplID0g
cGVlcl9yZXEtPmkuc2l6ZTsKIAl1bnNpZ25lZCBuX2Jpb3MgPSAwOwotCXVuc2lnbmVkIG5yX3Bh
Z2VzID0gKGRhdGFfc2l6ZSArIFBBR0VfU0laRSAtMSkgPj4gUEFHRV9TSElGVDsKKwl1bnNpZ25l
ZCBucl9wYWdlcyA9IFBGTl9VUChkYXRhX3NpemUpOwogCiAJLyogVFJJTS9ESVNDQVJEOiBmb3Ig
bm93LCBhbHdheXMgdXNlIHRoZSBoZWxwZXIgZnVuY3Rpb24KIAkgKiBibGtkZXZfaXNzdWVfemVy
b291dCguLi4sIGRpc2NhcmQ9dHJ1ZSkuCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF93b3JrZXIuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3dvcmtlci5jCmluZGV4IDBm
OTk1NmY0ZTljNC4uYWYzMDUxZGQ4OTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF93b3JrZXIuYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYwpAQCAt
MTAzMCw3ICsxMDMwLDcgQEAgc3RhdGljIHZvaWQgbW92ZV90b19uZXRfZWVfb3JfZnJlZShzdHJ1
Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgc3RydWN0IGRyYmRfcGVlcl8KIHsKIAlpZiAoZHJiZF9w
ZWVyX3JlcV9oYXNfYWN0aXZlX3BhZ2UocGVlcl9yZXEpKSB7CiAJCS8qIFRoaXMgbWlnaHQgaGFw
cGVuIGlmIHNlbmRwYWdlKCkgaGFzIG5vdCBmaW5pc2hlZCAqLwotCQlpbnQgaSA9IChwZWVyX3Jl
cS0+aS5zaXplICsgUEFHRV9TSVpFIC0xKSA+PiBQQUdFX1NISUZUOworCQlpbnQgaSA9IFBGTl9V
UChwZWVyX3JlcS0+aS5zaXplKTsKIAkJYXRvbWljX2FkZChpLCAmZGV2aWNlLT5wcF9pbl91c2Vf
YnlfbmV0KTsKIAkJYXRvbWljX3N1YihpLCAmZGV2aWNlLT5wcF9pbl91c2UpOwogCQlzcGluX2xv
Y2tfaXJxKCZkZXZpY2UtPnJlc291cmNlLT5yZXFfbG9jayk7Ci0tIAoyLjM1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcg
bGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
