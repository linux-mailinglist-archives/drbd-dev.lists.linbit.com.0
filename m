Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF24F6991
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:08:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8436420FE5;
	Wed,  6 Apr 2022 21:08:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BBA58420FD8
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:31 +0200 (CEST)
Received: by mail-ej1-f41.google.com with SMTP id bg10so6278671ejb.4
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OeMtijpkibGaog7F58AuM7SBlMK2GtUfrLCNQpMtHag=;
	b=x+LhGUsW+0qT4WfR+xdfEVx4Wb4G/SZfdzhW8JpwU9lryyw+1poelkt7BcXTx9n2M1
	FkPy9BlGuV5o30zZ1i4WKuN1GtFcdJ41HO8iPDQum6ma/u+qqkle49MrIQDSOXP/Bi3Q
	G7It2UxXLxl1Xel03xFsrb61xso0PqJGuYVDSj5R2JA94iUUQ/wfdQF1qBDkmEWwGa5C
	2qWuxWeHtOSBVaSTZI++qvXlur6gUIDBhEMDnGRenUS/5M8kZ9HnIf1hpEbW4bflMcKM
	+ZhTbpXBtEsUnOKKpwzgzw/gSwJH9mRcoXVRnXmRmsld4l93NDOdEjDicU54wv9AOcM4
	ZJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OeMtijpkibGaog7F58AuM7SBlMK2GtUfrLCNQpMtHag=;
	b=oDjBeWGlSAU5gC3Xy+RlnNCAWwU+ahtIQvVg/VGu0fGimoxDCtG0jCvwvvluuuIdtX
	N66+Q0JcIp+kowjrn7FAdB5eIW4dXtSRJfTHyEsaU1ZYVWUBAX1xBrNuIZy+fA2xTq+f
	+6Q9L7XLxT5za9qTQluu3ZBpcEexkOccwhuqXkW2VZV94aAr+1WmsxlXvpT+UfPu6P48
	KkXa+KJPrUTkdL2HrBOKyJ0gu+u5Z9/JQY7SNirPUrWqHn19/5QzzmPRbM3W5Nq0xRBh
	X08eOY7NdYToOIa1XJgswUnxIMQ/PMhrvJFCVTHUKf40YXx8UVAmA0kVVHXucBBbPZ9/
	IQNQ==
X-Gm-Message-State: AOAM531IPyVqsGqkY4x8x1hGX9eQq6IXmqKcr9M/ciFCAuwkGCacY2Wr
	8fOjqwIB6dVBI9HqFBUhoJaYWixh
X-Google-Smtp-Source: ABdhPJyeoQlMZGBzfnq9pnEc5goeLQqQ6V5UkPlAs8RjqvSnU53g3p7zUbSHqMEGb8+2kQh2EtAllw==
X-Received: by 2002:a17:907:1ca4:b0:6da:86a4:1ec7 with SMTP id
	nb36-20020a1709071ca400b006da86a41ec7mr9942094ejc.556.1649272051333;
	Wed, 06 Apr 2022 12:07:31 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	o3-20020aa7c7c3000000b00410d407da2esm7960722eds.13.2022.04.06.12.07.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:30 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:09 +0200
Message-Id: <20220406190715.1938174-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/7] drbd: fix duplicate array initializer
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClRoZXJlIGFyZSB0d28gaW5pdGlh
bGl6ZXJzIGZvciBQX1JFVFJZX1dSSVRFOgoKZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5j
OjM2NzY6MjI6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJy
aWRlLWluaXRdCgpSZW1vdmUgdGhlIGZpcnN0IG9uZSBzaW5jZSBpdCB3YXMgYWxyZWFkeSBpZ25v
cmVkIGJ5IHRoZSBjb21waWxlcgphbmQgcmVvcmRlciB0aGUgbGlzdCB0byBtYXRjaCB0aGUgZW51
bSBkZWZpbml0aW9uLiBBcyBQX1pFUk9FUyBoYWQKbm8gZW50cnksIGFkZCB0aGF0IG9uZSBpbnN0
ZWFkLgoKRml4ZXM6IDAzNmIxN2VhYWI5MyAoImRyYmQ6IFJlY2VpdmluZyBwYXJ0IGZvciB0aGUg
UFJPVE9DT0xfVVBEQVRFIHBhY2tldCIpCkZpeGVzOiBmMzFlNTgzYWEyYzIgKCJkcmJkOiBpbnRy
b2R1Y2UgUF9aRVJPRVMgKFJFUV9PUF9XUklURV9aRVJPRVMgb24gdGhlICJ3aXJlIikiKQpTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpSZXZpZXdlZC1ieTogQ2hy
aXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KLS0t
CiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgfCAxMSArKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMKaW5kZXggOTY3NmExZDIxNGJjLi45MGEwODE0MzQzZGYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX21haW4uYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMKQEAgLTM1ODcsOSArMzU4Nyw4IEBAIGNvbnN0IGNoYXIgKmNtZG5hbWUoZW51bSBkcmJk
X3BhY2tldCBjbWQpCiAJICogd2hlbiB3ZSB3YW50IHRvIHN1cHBvcnQgbW9yZSB0aGFuCiAJICog
b25lIFBST19WRVJTSU9OICovCiAJc3RhdGljIGNvbnN0IGNoYXIgKmNtZG5hbWVzW10gPSB7CisK
IAkJW1BfREFUQV0JICAgICAgICA9ICJEYXRhIiwKLQkJW1BfV1NBTUVdCSAgICAgICAgPSAiV3Jp
dGVTYW1lIiwKLQkJW1BfVFJJTV0JICAgICAgICA9ICJUcmltIiwKIAkJW1BfREFUQV9SRVBMWV0J
ICAgICAgICA9ICJEYXRhUmVwbHkiLAogCQlbUF9SU19EQVRBX1JFUExZXQk9ICJSU0RhdGFSZXBs
eSIsCiAJCVtQX0JBUlJJRVJdCSAgICAgICAgPSAiQmFycmllciIsCkBAIC0zNjAwLDcgKzM1OTks
NiBAQCBjb25zdCBjaGFyICpjbWRuYW1lKGVudW0gZHJiZF9wYWNrZXQgY21kKQogCQlbUF9EQVRB
X1JFUVVFU1RdCT0gIkRhdGFSZXF1ZXN0IiwKIAkJW1BfUlNfREFUQV9SRVFVRVNUXSAgICAgPSAi
UlNEYXRhUmVxdWVzdCIsCiAJCVtQX1NZTkNfUEFSQU1dCSAgICAgICAgPSAiU3luY1BhcmFtIiwK
LQkJW1BfU1lOQ19QQVJBTTg5XQk9ICJTeW5jUGFyYW04OSIsCiAJCVtQX1BST1RPQ09MXSAgICAg
ICAgICAgID0gIlJlcG9ydFByb3RvY29sIiwKIAkJW1BfVVVJRFNdCSAgICAgICAgPSAiUmVwb3J0
VVVJRHMiLAogCQlbUF9TSVpFU10JICAgICAgICA9ICJSZXBvcnRTaXplcyIsCkBAIC0zNjA4LDYg
KzM2MDYsNyBAQCBjb25zdCBjaGFyICpjbWRuYW1lKGVudW0gZHJiZF9wYWNrZXQgY21kKQogCQlb
UF9TWU5DX1VVSURdICAgICAgICAgICA9ICJSZXBvcnRTeW5jVVVJRCIsCiAJCVtQX0FVVEhfQ0hB
TExFTkdFXSAgICAgID0gIkF1dGhDaGFsbGVuZ2UiLAogCQlbUF9BVVRIX1JFU1BPTlNFXQk9ICJB
dXRoUmVzcG9uc2UiLAorCQlbUF9TVEFURV9DSEdfUkVRXSAgICAgICA9ICJTdGF0ZUNoZ1JlcXVl
c3QiLAogCQlbUF9QSU5HXQkJPSAiUGluZyIsCiAJCVtQX1BJTkdfQUNLXQkgICAgICAgID0gIlBp
bmdBY2siLAogCQlbUF9SRUNWX0FDS10JICAgICAgICA9ICJSZWN2QWNrIiwKQEAgLTM2MTgsMjMg
KzM2MTcsMjUgQEAgY29uc3QgY2hhciAqY21kbmFtZShlbnVtIGRyYmRfcGFja2V0IGNtZCkKIAkJ
W1BfTkVHX0RSRVBMWV0JICAgICAgICA9ICJOZWdEUmVwbHkiLAogCQlbUF9ORUdfUlNfRFJFUExZ
XQk9ICJOZWdSU0RSZXBseSIsCiAJCVtQX0JBUlJJRVJfQUNLXQkgICAgICAgID0gIkJhcnJpZXJB
Y2siLAotCQlbUF9TVEFURV9DSEdfUkVRXSAgICAgICA9ICJTdGF0ZUNoZ1JlcXVlc3QiLAogCQlb
UF9TVEFURV9DSEdfUkVQTFldICAgICA9ICJTdGF0ZUNoZ1JlcGx5IiwKIAkJW1BfT1ZfUkVRVUVT
VF0gICAgICAgICAgPSAiT1ZSZXF1ZXN0IiwKIAkJW1BfT1ZfUkVQTFldICAgICAgICAgICAgPSAi
T1ZSZXBseSIsCiAJCVtQX09WX1JFU1VMVF0gICAgICAgICAgID0gIk9WUmVzdWx0IiwKIAkJW1Bf
Q1NVTV9SU19SRVFVRVNUXSAgICAgPSAiQ3N1bVJTUmVxdWVzdCIsCiAJCVtQX1JTX0lTX0lOX1NZ
TkNdCT0gIkNzdW1SU0lzSW5TeW5jIiwKKwkJW1BfU1lOQ19QQVJBTTg5XQk9ICJTeW5jUGFyYW04
OSIsCiAJCVtQX0NPTVBSRVNTRURfQklUTUFQXSAgID0gIkNCaXRtYXAiLAogCQlbUF9ERUxBWV9Q
Uk9CRV0gICAgICAgICA9ICJEZWxheVByb2JlIiwKIAkJW1BfT1VUX09GX1NZTkNdCQk9ICJPdXRP
ZlN5bmMiLAotCQlbUF9SRVRSWV9XUklURV0JCT0gIlJldHJ5V3JpdGUiLAogCQlbUF9SU19DQU5D
RUxdCQk9ICJSU0NhbmNlbCIsCiAJCVtQX0NPTk5fU1RfQ0hHX1JFUV0JPSAiY29ubl9zdF9jaGdf
cmVxIiwKIAkJW1BfQ09OTl9TVF9DSEdfUkVQTFldCT0gImNvbm5fc3RfY2hnX3JlcGx5IiwKIAkJ
W1BfUFJPVE9DT0xfVVBEQVRFXQk9ICJwcm90b2NvbF91cGRhdGUiLAorCQlbUF9UUklNXQkgICAg
ICAgID0gIlRyaW0iLAogCQlbUF9SU19USElOX1JFUV0gICAgICAgICA9ICJyc190aGluX3JlcSIs
CiAJCVtQX1JTX0RFQUxMT0NBVEVEXSAgICAgID0gInJzX2RlYWxsb2NhdGVkIiwKKwkJW1BfV1NB
TUVdCSAgICAgICAgPSAiV3JpdGVTYW1lIiwKKwkJW1BfWkVST0VTXQkJPSAiWmVyb2VzIiwKIAog
CQkvKiBlbnVtIGRyYmRfcGFja2V0LCBidXQgbm90IGNvbW1hbmRzIC0gb2Jzb2xldGVkIGZsYWdz
OgogCQkgKglQX01BWV9JR05PUkUKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxp
c3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZHJiZC1kZXYK
