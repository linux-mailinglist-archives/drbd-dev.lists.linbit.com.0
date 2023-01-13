Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AD573669765
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:36:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87B2B422137;
	Fri, 13 Jan 2023 13:36:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE9C34205A6
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:20 +0100 (CET)
Received: by mail-ej1-f42.google.com with SMTP id tz12so52015910ejc.9
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=rnWGghdREJ6zIaEe7+G9hDEkG3lKlZcJtoyqEzGOui4=;
	b=7MggSvVJcvB+UhgdCA3YbS9r+ZOV3AkBaHplJBS3GHTsZ7kKYp6j6tXdu3rHlUqUXg
	CuAfampyUgvOK/Fjbv+qH5HZtB1stqe6g5zwpCnI2n1nXZ9V5LzZPISGD/8Rks0pJVd8
	3hOsc+AUF1w1Cgt6rac331YMACuqJ5zZDkJHuMd0X0+JgPBKuzSAYJu9TkR3TizU1AJ/
	phVvbDXyDj0AFqcLRk4ActDz2MfJpRpdnlUm2cpG6EFRJfyMePbRmfm7qZv/7xQCYsUL
	VtmfkqA8ATSi4pBSUl7CMjgtFQKfrHylppisWyml8jf0ra9PKm1lR0Akk9lI/b3A5BJK
	grHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=rnWGghdREJ6zIaEe7+G9hDEkG3lKlZcJtoyqEzGOui4=;
	b=syu+bYqOCwhqR0rm0P6qU30J8J2YZdNE00WE8WN+aQJ6qWj9+iHKxrk05TWsN4fuvv
	6rP163niQ18ODJh3oO/kcgc5346uQO0CsP4428b5exGXkej/C73T8AMal+/PI6lAEIPu
	wIoDZsvgB86Dw9WHSJ7voAzFsmveKzLAgbHafXyY8CSq2WtCnHGlWeBOV73mCUpAbPTp
	DD/O3to8YjIYjv4h2OA1MT6MdJagY3fsve1fsFWNbw4gJOY/Ch/WlCYloYKwdPsSdP6S
	E0qKufBgvQfK11twpH+o5IBYO6u0ZMgimMeyxWvjsubh9zuPYQs/j8mBpj0vkhhg0vyl
	8EFA==
X-Gm-Message-State: AFqh2koLJnBJhNs1NQCzQXdhIOBnxdkK/la5G2L+/+/mREQu7kN+zI4B
	D1pvNd9VxaTQnM0PSh6Jlxs6HACY
X-Google-Smtp-Source: AMrXdXs1zcfIgcaXvcxplpumwnRr+KMhCRY/vNTco05knDjB5ZLtnWzyxCP0Udy1N5NsZvzBzh/K/g==
X-Received: by 2002:a17:907:d50d:b0:801:d6f2:754 with SMTP id
	wb13-20020a170907d50d00b00801d6f20754mr70167151ejc.52.1673613320223;
	Fri, 13 Jan 2023 04:35:20 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	18-20020a170906201200b00846734faa9asm8386323ejo.164.2023.01.13.04.35.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:19 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:05 +0100
Message-Id: <20230113123506.144082-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
References: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/3] drbd: drop API_VERSION define
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

VXNlIHRoZSBnZW5ldGxpbmsgYXBpIHZlcnNpb24gYXMgZGVmaW5lZCBpbiBkcmJkX2dlbmxfYXBp
LmguCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2Vo
bXdhbGRlckBsaW5iaXQuY29tPgpSZXZpZXdlZC1ieTogSm9lbCBDb2xsZWRnZSA8am9lbC5jb2xs
ZWRnZUBsaW5iaXQuY29tPgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2RlYnVnZnMuYyB8
IDIgKy0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyAgICB8IDIgKy0KIGRyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX3Byb2MuYyAgICB8IDIgKy0KIGluY2x1ZGUvbGludXgvZHJiZC5oICAg
ICAgICAgICAgICB8IDEgLQogaW5jbHVkZS9saW51eC9kcmJkX2dlbmxfYXBpLmggICAgIHwgMiAr
LQogNSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfZGVidWdmcy5jIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfZGVidWdmcy5jCmluZGV4IGE3MmMwOTZhYTViMS4uMTI0NjBiNTg0YmNiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfZGVidWdmcy5jCkBAIC04NDQsNyArODQ0LDcgQEAgc3RhdGljIGlu
dCBkcmJkX3ZlcnNpb25fc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmlnbm9yZWQpCiB7
CiAJc2VxX3ByaW50ZihtLCAiIyAlc1xuIiwgZHJiZF9idWlsZHRhZygpKTsKIAlzZXFfcHJpbnRm
KG0sICJWRVJTSU9OPSVzXG4iLCBSRUxfVkVSU0lPTik7Ci0Jc2VxX3ByaW50ZihtLCAiQVBJX1ZF
UlNJT049JXVcbiIsIEFQSV9WRVJTSU9OKTsKKwlzZXFfcHJpbnRmKG0sICJBUElfVkVSU0lPTj0l
dVxuIiwgR0VOTF9NQUdJQ19WRVJTSU9OKTsKIAlzZXFfcHJpbnRmKG0sICJQUk9fVkVSU0lPTl9N
SU49JXVcbiIsIFBST19WRVJTSU9OX01JTik7CiAJc2VxX3ByaW50ZihtLCAiUFJPX1ZFUlNJT05f
TUFYPSV1XG4iLCBQUk9fVkVSU0lPTl9NQVgpOwogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFp
bi5jCmluZGV4IDM0NWJmYWM0NDFkYS4uNTE1NmQyZmIyZDc2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFp
bi5jCkBAIC0yODk5LDcgKzI4OTksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBkcmJkX2luaXQodm9p
ZCkKIAogCXByX2luZm8oImluaXRpYWxpemVkLiAiCiAJICAgICAgICJWZXJzaW9uOiAiIFJFTF9W
RVJTSU9OICIgKGFwaTolZC9wcm90bzolZC0lZClcbiIsCi0JICAgICAgIEFQSV9WRVJTSU9OLCBQ
Uk9fVkVSU0lPTl9NSU4sIFBST19WRVJTSU9OX01BWCk7CisJICAgICAgIEdFTkxfTUFHSUNfVkVS
U0lPTiwgUFJPX1ZFUlNJT05fTUlOLCBQUk9fVkVSU0lPTl9NQVgpOwogCXByX2luZm8oIiVzXG4i
LCBkcmJkX2J1aWxkdGFnKCkpOwogCXByX2luZm8oInJlZ2lzdGVyZWQgYXMgYmxvY2sgZGV2aWNl
IG1ham9yICVkXG4iLCBEUkJEX01BSk9SKTsKIAlyZXR1cm4gMDsgLyogU3VjY2VzcyEgKi8KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Byb2MuYyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3Byb2MuYwppbmRleCAyMjI3ZmIwZGIxY2UuLjFkMGZlYWZjZWFkYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcHJvYy5jCisrKyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3Byb2MuYwpAQCAtMjI4LDcgKzIyOCw3IEBAIGludCBkcmJkX3NlcV9zaG93KHN0
cnVjdCBzZXFfZmlsZSAqc2VxLCB2b2lkICp2KQogCX07CiAKIAlzZXFfcHJpbnRmKHNlcSwgInZl
cnNpb246ICIgUkVMX1ZFUlNJT04gIiAoYXBpOiVkL3Byb3RvOiVkLSVkKVxuJXNcbiIsCi0JCSAg
IEFQSV9WRVJTSU9OLCBQUk9fVkVSU0lPTl9NSU4sIFBST19WRVJTSU9OX01BWCwgZHJiZF9idWls
ZHRhZygpKTsKKwkJICAgR0VOTF9NQUdJQ19WRVJTSU9OLCBQUk9fVkVSU0lPTl9NSU4sIFBST19W
RVJTSU9OX01BWCwgZHJiZF9idWlsZHRhZygpKTsKIAogCS8qCiAJICBjcyAuLiBjb25uZWN0aW9u
IHN0YXRlCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RyYmQuaCBiL2luY2x1ZGUvbGludXgv
ZHJiZC5oCmluZGV4IDU3NTU1MzdiNTFiMS4uZGY2NWE4ZjUyMjhhIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L2RyYmQuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RyYmQuaApAQCAtNDAsNyArNDAs
NiBAQAogCiBleHRlcm4gY29uc3QgY2hhciAqZHJiZF9idWlsZHRhZyh2b2lkKTsKICNkZWZpbmUg
UkVMX1ZFUlNJT04gIjguNC4xMSIKLSNkZWZpbmUgQVBJX1ZFUlNJT04gMQogI2RlZmluZSBQUk9f
VkVSU0lPTl9NSU4gODYKICNkZWZpbmUgUFJPX1ZFUlNJT05fTUFYIDEwMQogCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2RyYmRfZ2VubF9hcGkuaCBiL2luY2x1ZGUvbGludXgvZHJiZF9nZW5s
X2FwaS5oCmluZGV4IGJkNjJlZmMyOTAwMi4uNzA2ODJjMDU4MDI3IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L2RyYmRfZ2VubF9hcGkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RyYmRfZ2VubF9h
cGkuaApAQCAtNDcsNyArNDcsNyBAQCBlbnVtIGRyYmRfc3RhdGVfaW5mb19iY2FzdF9yZWFzb24g
ewogI3VuZGVmIGxpbnV4CiAKICNpbmNsdWRlIDxsaW51eC9kcmJkLmg+Ci0jZGVmaW5lIEdFTkxf
TUFHSUNfVkVSU0lPTglBUElfVkVSU0lPTgorI2RlZmluZSBHRU5MX01BR0lDX1ZFUlNJT04JMQog
I2RlZmluZSBHRU5MX01BR0lDX0ZBTUlMWQlkcmJkCiAjZGVmaW5lIEdFTkxfTUFHSUNfRkFNSUxZ
X0hEUlNaCXNpemVvZihzdHJ1Y3QgZHJiZF9nZW5sbXNnaGRyKQogI2RlZmluZSBHRU5MX01BR0lD
X0lOQ0xVREVfRklMRSA8bGludXgvZHJiZF9nZW5sLmg+Ci0tIAoyLjM4LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlz
dApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
