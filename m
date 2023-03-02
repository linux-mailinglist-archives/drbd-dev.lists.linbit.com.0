Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DB6A82EE
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Mar 2023 13:57:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 86031422092;
	Thu,  2 Mar 2023 13:57:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE70E421741
	for <drbd-dev@lists.linbit.com>; Thu,  2 Mar 2023 13:55:29 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id o15so64706476edr.13
	for <drbd-dev@lists.linbit.com>; Thu, 02 Mar 2023 04:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1677761729;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=auAYDTnqMksP1wMx0yJS7PzTopkqCdoZrZ0FhOZKDi0=;
	b=FN4J47y0MmAZSZ/+MyhiIwdUL7qSPuoeC1/JJcWdXtH1H9IAqUUAtGcE5hhU+TZrva
	/bmav/to85jpijxlJxMv3hBqJKQGL8+PtQBq5lIzl90nbp708Bn3ncEYntXYUgVfengG
	/BchF+rqEJ00ft8mr25Q3BNQEIp7ch8FF7S/UFJmyDHwsEpA91Dwonc43dOxuxNQYdPS
	86jYzV0fWtGNo/cJOuCPXhcaGcdlHzZAOg5PdKXWKDI2PS0LgXP21hRvhpnl3ZX9ycFe
	NHndQ611Yp/bvq98zkaHBfMhZoKYEZqA3t60qGoqyqo17Riz/CbdJRXXt0AJ6XJ4QPfa
	iWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1677761729;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=auAYDTnqMksP1wMx0yJS7PzTopkqCdoZrZ0FhOZKDi0=;
	b=hEUAL+49gYfeHDP62g3IYJ1QPNbQuyT/lwndWx+o1jNUmYS19dhsiPmFS0HgSY1VVH
	tYWXvpbiE//3j5jJkjJK2huOnw+D0+z/DearpDkrmtyuTtJg5fuEncXveE+MwBPglnT5
	LCZMkR9YRLS2S/qHiIOvyioRIo5buDeDaDSeNKuQCmd5Ej27x8qTReuqBbN61SHqdc/I
	tSABIBeUIULr50JbiQsShqCEB2K/FFNeZljQc+BEwDqPWCp82hCN+0akE3agXpcWt8D2
	+nn3P0mFNcukHUvotJ3H0SSofTeWMWz5YNuKO3eWXt/HOtAePBwBCsRn7qdoa9BQ0TC1
	mPtQ==
X-Gm-Message-State: AO0yUKXWAzOHUc5L5Y6xXBaInqOrDlpoipJ6X1hMVy1HHR7Kq1FDqBlP
	16zIME6RrhXCrFfpb6tE1szyPsUl
X-Google-Smtp-Source: AK7set/nkU5jrcwMqRiuiL6ckgWBwz0ltSIEvUXgwQxvUMO6kJJSK2AujWKmxYX3PLum2DZFrkL5KA==
X-Received: by 2002:a17:906:6601:b0:88a:724:244c with SMTP id
	b1-20020a170906660100b0088a0724244cmr10538676ejp.71.1677761729415;
	Thu, 02 Mar 2023 04:55:29 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a98-20020a509eeb000000b004ad601533a3sm6955034edf.55.2023.03.02.04.55.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Mar 2023 04:55:28 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  2 Mar 2023 13:54:42 +0100
Message-Id: <20230302125445.2653493-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
References: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 4/7] drbd: INFO_bm_xfer_stats(): Pass a peer
	device argument
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

RnJvbTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuQGxpbmJpdC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5AbGluYml0LmNvbT4KU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCAgICAgIHwgNCArKy0tCiBkcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgIHwgMiArLQogZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfcmVjZWl2ZXIuYyB8IDggKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX2ludC5oIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKaW5kZXggN2JkMTAwODli
ZmM5Li45N2MwOTE5OTBiZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2lu
dC5oCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oCkBAIC0xMjcsOCArMTI3LDgg
QEAgc3RydWN0IGJtX3hmZXJfY3R4IHsKIAl1bnNpZ25lZCBieXRlc1syXTsKIH07CiAKLWV4dGVy
biB2b2lkIElORk9fYm1feGZlcl9zdGF0cyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwKLQkJ
Y29uc3QgY2hhciAqZGlyZWN0aW9uLCBzdHJ1Y3QgYm1feGZlcl9jdHggKmMpOworZXh0ZXJuIHZv
aWQgSU5GT19ibV94ZmVyX3N0YXRzKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2Rldmlj
ZSwKKwkJCSAgICAgICBjb25zdCBjaGFyICpkaXJlY3Rpb24sIHN0cnVjdCBibV94ZmVyX2N0eCAq
Yyk7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBibV94ZmVyX2N0eF9iaXRfdG9fd29yZF9vZmZzZXQo
c3RydWN0IGJtX3hmZXJfY3R4ICpjKQogewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCmluZGV4IDE3OGE3
YWU0MGFmOC4uNjY0N2Y4NGYzODc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCkBAIC0xMjQ3LDcg
KzEyNDcsNyBAQCBzZW5kX2JpdG1hcF9ybGVfb3JfcGxhaW4oc3RydWN0IGRyYmRfcGVlcl9kZXZp
Y2UgKnBlZXJfZGV2aWNlLCBzdHJ1Y3QgYm1feGZlcl9jdAogCX0KIAlpZiAoIWVycikgewogCQlp
ZiAobGVuID09IDApIHsKLQkJCUlORk9fYm1feGZlcl9zdGF0cyhkZXZpY2UsICJzZW5kIiwgYyk7
CisJCQlJTkZPX2JtX3hmZXJfc3RhdHMocGVlcl9kZXZpY2UsICJzZW5kIiwgYyk7CiAJCQlyZXR1
cm4gMDsKIAkJfSBlbHNlCiAJCQlyZXR1cm4gMTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3JlY2VpdmVyLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5j
CmluZGV4IGU3MDA3NmZlMWYyZS4uYzZmOTNhOTA4N2IxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Jl
Y2VpdmVyLmMKQEAgLTQ3NjYsMTEgKzQ3NjYsMTEgQEAgZGVjb2RlX2JpdG1hcF9jKHN0cnVjdCBk
cmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwKIAlyZXR1cm4gLUVJTzsKIH0KIAotdm9pZCBJ
TkZPX2JtX3hmZXJfc3RhdHMoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsCit2b2lkIElORk9f
Ym1feGZlcl9zdGF0cyhzdHJ1Y3QgZHJiZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsCiAJCWNv
bnN0IGNoYXIgKmRpcmVjdGlvbiwgc3RydWN0IGJtX3hmZXJfY3R4ICpjKQogewogCS8qIHdoYXQg
d291bGQgaXQgdGFrZSB0byB0cmFuc2ZlciBpdCAicGxhaW50ZXh0IiAqLwotCXVuc2lnbmVkIGlu
dCBoZWFkZXJfc2l6ZSA9IGRyYmRfaGVhZGVyX3NpemUoZmlyc3RfcGVlcl9kZXZpY2UoZGV2aWNl
KS0+Y29ubmVjdGlvbik7CisJdW5zaWduZWQgaW50IGhlYWRlcl9zaXplID0gZHJiZF9oZWFkZXJf
c2l6ZShwZWVyX2RldmljZS0+Y29ubmVjdGlvbik7CiAJdW5zaWduZWQgaW50IGRhdGFfc2l6ZSA9
IERSQkRfU09DS0VUX0JVRkZFUl9TSVpFIC0gaGVhZGVyX3NpemU7CiAJdW5zaWduZWQgaW50IHBs
YWluID0KIAkJaGVhZGVyX3NpemUgKiAoRElWX1JPVU5EX1VQKGMtPmJtX3dvcmRzLCBkYXRhX3Np
emUpICsgMSkgKwpAQCAtNDc5NCw3ICs0Nzk0LDcgQEAgdm9pZCBJTkZPX2JtX3hmZXJfc3RhdHMo
c3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsCiAJCXIgPSAxMDAwOwogCiAJciA9IDEwMDAgLSBy
OwotCWRyYmRfaW5mbyhkZXZpY2UsICIlcyBiaXRtYXAgc3RhdHMgW0J5dGVzKHBhY2tldHMpXTog
cGxhaW4gJXUoJXUpLCBSTEUgJXUoJXUpLCAiCisJZHJiZF9pbmZvKHBlZXJfZGV2aWNlLCAiJXMg
Yml0bWFwIHN0YXRzIFtCeXRlcyhwYWNrZXRzKV06IHBsYWluICV1KCV1KSwgUkxFICV1KCV1KSwg
IgogCSAgICAgInRvdGFsICV1OyBjb21wcmVzc2lvbjogJXUuJXUlJVxuIiwKIAkJCWRpcmVjdGlv
biwKIAkJCWMtPmJ5dGVzWzFdLCBjLT5wYWNrZXRzWzFdLApAQCAtNDg3Miw3ICs0ODcyLDcgQEAg
c3RhdGljIGludCByZWNlaXZlX2JpdG1hcChzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0
aW9uLCBzdHJ1Y3QgcGFja2V0X2luZm8KIAkJCWdvdG8gb3V0OwogCX0KIAotCUlORk9fYm1feGZl
cl9zdGF0cyhkZXZpY2UsICJyZWNlaXZlIiwgJmMpOworCUlORk9fYm1feGZlcl9zdGF0cyhwZWVy
X2RldmljZSwgInJlY2VpdmUiLCAmYyk7CiAKIAlpZiAoZGV2aWNlLT5zdGF0ZS5jb25uID09IENf
V0ZfQklUTUFQX1QpIHsKIAkJZW51bSBkcmJkX3N0YXRlX3J2IHJ2OwotLSAKMi4zOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
