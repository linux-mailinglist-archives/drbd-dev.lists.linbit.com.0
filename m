Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 99507648460
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:59:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7AF084252E5;
	Fri,  9 Dec 2022 15:59:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E0E44210CD
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:55:08 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id v8so3423349edi.3
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=rnWGghdREJ6zIaEe7+G9hDEkG3lKlZcJtoyqEzGOui4=;
	b=etk+O6PxUdlMnrbUHpn6B7DyLtaQUUWYF68CRq/diHpQhMD1Z8IH20wHDuGOJ7Ps2J
	vC2i9BWWlwz5l+GrDZNBxw+W1qTuXLQlNfCd7StHomMxa3+hnOJ4iXULEZ1yXuUtLIi7
	pZeG2tOWgfCC8jIEQTqshRzeWx3C8PCoXdDZqbRIUx/JuNKnTzg8qDamfb4MhonIB03y
	uYbkQ2tX8LWjTCRPZpY+AVF1BobG/QCvsVsuV9T2/ra06cxeIpJSHKw0TfYf/Dlkruo+
	8BZwazFbW6b0ntHMmBhjuTA7FwAsGpCBqGzaDNkL890QWEVq298eQneGC4gS/ev6ADSw
	4Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=rnWGghdREJ6zIaEe7+G9hDEkG3lKlZcJtoyqEzGOui4=;
	b=uWgTzmfhuQiTGkE7pHK30oqWMx7bsaQ7IozHG0725q9XHTZi2q28Df3Cafxk67Nt20
	3zqNb28IFpsaQNg2kShlmp3esd2mPsH2tHo0WiEgjMjEvNysgOyYo0eGD0uDbDyodWpq
	AOPEMWpjnGI9xgTPRAwkdFEDgfa9hbsmDzAftJjEpPl2hRetVSfdCFXMlnfU83+cW6P5
	aN+EgPkk3euNHSj2RSYgi8xrax4Ugs/W+5Im9pL2B6k8qGEUl/hmmX5CRVRU7JgUTtP9
	/5e+ftn6f/AY04Hq/0U8GAFUW7U+/282HXzBbRYKGP8YO3TMf2aCtNLA6USGJJrFhNhx
	flKQ==
X-Gm-Message-State: ANoB5pnGieC8jBm6/iSk7u6GP50Tj/Iwj7CxnZmraLnhRKaWk42VfsKH
	8qUu5dlwJ+YWDHaG0O8afJaTHyIZ
X-Google-Smtp-Source: AA0mqf5rbXukl5UTZkcY7tYtNfsG6ZjU+A51fdmuMQAEXwiG59ugk79RVU8Yl/8afabZ/aFwOYxQZw==
X-Received: by 2002:a05:6402:298d:b0:465:f6a9:cb7b with SMTP id
	eq13-20020a056402298d00b00465f6a9cb7bmr4954559edb.12.1670597708142;
	Fri, 09 Dec 2022 06:55:08 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	l4-20020aa7c304000000b0046b1d63cfc1sm716856edq.88.2022.12.09.06.55.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:55:07 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:55:03 +0100
Message-Id: <20221209145504.2273072-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145504.2273072-1-christoph.boehmwalder@linbit.com>
References: <20221209145504.2273072-1-christoph.boehmwalder@linbit.com>
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
