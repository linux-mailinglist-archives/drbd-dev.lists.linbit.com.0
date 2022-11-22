Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DF763633DFD
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 14:44:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C020C4252D2;
	Tue, 22 Nov 2022 14:44:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F65F4252BB
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 14:43:16 +0100 (CET)
Received: by mail-wm1-f49.google.com with SMTP id
	a11-20020a05600c2d4b00b003cf6f5fd9f1so11317592wmg.2
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 05:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=k1O6z3OtGyvGFc8IxR2waGYqFO7J9VHH5n+UUZvrXHw=;
	b=IPQyJQu/JEjhmS86Qo8TbZjSpbF6g1sTxxROaP2IhpxAC6wpyOsuqMWQtZBHKbo7aT
	6leIymPt9zIit3QkqE4vWoo7RsnJwSKacIdkWRQKALP2y3K6zBF3J4HsK4qdMAodPQq1
	gMrVrxjm9kfP8+yC0rOdokLnGjcGm+RidCuGFAWvvZKKCgDMINHdYsQCRYDjYQgpjYeU
	voYcxN6tpasEA0889QrH/+nxE9YvNDxgJoMEt/VBWZNCXeIcnlOjBVP0/lBz26FEN4qG
	onP5PjrlpUXmkF5kVMNQ8C026DhYZEkthK5rbhwh7lBh78wdxDhcWXFXSJaIdUSlrzcl
	IOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=k1O6z3OtGyvGFc8IxR2waGYqFO7J9VHH5n+UUZvrXHw=;
	b=PTYfrMEGqK/pxeriTCWkehuxs0RT+Pj8AS9D3cNPZv72Xpf20eGVS/H+hcc2A/2q+V
	jCjKa2l68n7hZKUsaOvnzz98MFsxjRfw33/n3Obqr6LEAY3AgXjeMVQQUdxBRKZwlGXG
	8lmm8znG978NUPuJjXD0Nh7k1ehKEOjq+nxcdHhuNy7XaTkK7CkDaoW6e0TBbSM/MQT1
	IK0eFtirNzVcYG54u46t7ZrtWbaAw+Mn4Aq7fanSgZU6SBTPQ8cK4mJMqdUsM1fY8e6y
	Te8cE8ewSm8xIebRc1V9r6sAbQi4OJQgNDG75te08UF0p7k+MUCRBv3YLVbA+JlWdZvR
	GkRg==
X-Gm-Message-State: ANoB5pnLXVDvnL8adABP560Xx/LoVMFm2OvqcoP2g4aNlx/Bx9QdMoJQ
	ji7Jfvk3fXBbs7TpRLBaBqDPuhm3
X-Google-Smtp-Source: AA0mqf613IKVcLXqG2MLW3N/+4vlIQupHr8u3755YC6FGh+KHrNBAi6+v2ZMr79Hl4aiy7jJR5BOKA==
X-Received: by 2002:a05:600c:4fc4:b0:3c6:c109:2d9 with SMTP id
	o4-20020a05600c4fc400b003c6c10902d9mr6451363wmq.149.1669124596402;
	Tue, 22 Nov 2022 05:43:16 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	p6-20020a1c5446000000b003b47e75b401sm21437729wmi.37.2022.11.22.05.43.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Nov 2022 05:43:14 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Nov 2022 14:43:00 +0100
Message-Id: <20221122134301.69258-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
References: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/4] lru_cache: remove unused lc_private, lc_set,
	lc_index_of
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

RnJvbTogSm9lbCBDb2xsZWRnZSA8am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tPgoKU2lnbmVkLW9m
Zi1ieTogSm9lbCBDb2xsZWRnZSA8am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQu
Y29tPgotLS0KIGluY2x1ZGUvbGludXgvbHJ1X2NhY2hlLmggfCAgMyAtLS0KIGxpYi9scnVfY2Fj
aGUuYyAgICAgICAgICAgfCA0NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgNDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9scnVfY2FjaGUuaCBiL2luY2x1ZGUvbGludXgvbHJ1X2NhY2hlLmgKaW5kZXggMDdh
ZGQ3ODgyYTVkLi5jOWFmY2RkOTMyNGMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbHJ1X2Nh
Y2hlLmgKKysrIGIvaW5jbHVkZS9saW51eC9scnVfY2FjaGUuaApAQCAtMTk5LDcgKzE5OSw2IEBA
IHN0cnVjdCBscnVfY2FjaGUgewogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAotCXZvaWQgICps
Y19wcml2YXRlOwogCWNvbnN0IGNoYXIgKm5hbWU7CiAKIAkvKiBucl9lbGVtZW50cyB0aGVyZSAq
LwpAQCAtMjQxLDcgKzI0MCw2IEBAIGV4dGVybiBzdHJ1Y3QgbHJ1X2NhY2hlICpsY19jcmVhdGUo
Y29uc3QgY2hhciAqbmFtZSwgc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLAogCQl1bnNpZ25lZCBl
X2NvdW50LCBzaXplX3QgZV9zaXplLCBzaXplX3QgZV9vZmYpOwogZXh0ZXJuIHZvaWQgbGNfcmVz
ZXQoc3RydWN0IGxydV9jYWNoZSAqbGMpOwogZXh0ZXJuIHZvaWQgbGNfZGVzdHJveShzdHJ1Y3Qg
bHJ1X2NhY2hlICpsYyk7Ci1leHRlcm4gdm9pZCBsY19zZXQoc3RydWN0IGxydV9jYWNoZSAqbGMs
IHVuc2lnbmVkIGludCBlbnIsIGludCBpbmRleCk7CiBleHRlcm4gdm9pZCBsY19kZWwoc3RydWN0
IGxydV9jYWNoZSAqbGMsIHN0cnVjdCBsY19lbGVtZW50ICplbGVtZW50KTsKIAogZXh0ZXJuIHN0
cnVjdCBsY19lbGVtZW50ICpsY19nZXRfY3VtdWxhdGl2ZShzdHJ1Y3QgbHJ1X2NhY2hlICpsYywg
dW5zaWduZWQgaW50IGVucik7CkBAIC0yOTcsNiArMjk1LDUgQEAgZXh0ZXJuIGJvb2wgbGNfaXNf
dXNlZChzdHJ1Y3QgbHJ1X2NhY2hlICpsYywgdW5zaWduZWQgaW50IGVucik7CiAJY29udGFpbmVy
X29mKHB0ciwgdHlwZSwgbWVtYmVyKQogCiBleHRlcm4gc3RydWN0IGxjX2VsZW1lbnQgKmxjX2Vs
ZW1lbnRfYnlfaW5kZXgoc3RydWN0IGxydV9jYWNoZSAqbGMsIHVuc2lnbmVkIGkpOwotZXh0ZXJu
IHVuc2lnbmVkIGludCBsY19pbmRleF9vZihzdHJ1Y3QgbHJ1X2NhY2hlICpsYywgc3RydWN0IGxj
X2VsZW1lbnQgKmUpOwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2xpYi9scnVfY2FjaGUuYyBiL2xp
Yi9scnVfY2FjaGUuYwppbmRleCA1ZGQ1ZTRjMDBhMjMuLmIzZDkxODc2MTFkZSAxMDA2NDQKLS0t
IGEvbGliL2xydV9jYWNoZS5jCisrKyBiL2xpYi9scnVfY2FjaGUuYwpAQCAtNTc0LDQ4ICs1NzQs
NiBAQCBzdHJ1Y3QgbGNfZWxlbWVudCAqbGNfZWxlbWVudF9ieV9pbmRleChzdHJ1Y3QgbHJ1X2Nh
Y2hlICpsYywgdW5zaWduZWQgaSkKIAlyZXR1cm4gbGMtPmxjX2VsZW1lbnRbaV07CiB9CiAKLS8q
KgotICogbGNfaW5kZXhfb2YKLSAqIEBsYzogdGhlIGxydSBjYWNoZSB0byBvcGVyYXRlIG9uCi0g
KiBAZTogdGhlIGVsZW1lbnQgdG8gcXVlcnkgZm9yIGl0cyBpbmRleCBwb3NpdGlvbiBpbiBsYy0+
ZWxlbWVudAotICovCi11bnNpZ25lZCBpbnQgbGNfaW5kZXhfb2Yoc3RydWN0IGxydV9jYWNoZSAq
bGMsIHN0cnVjdCBsY19lbGVtZW50ICplKQotewotCVBBUkFOT0lBX0xDX0VMRU1FTlQobGMsIGUp
OwotCXJldHVybiBlLT5sY19pbmRleDsKLX0KLQotLyoqCi0gKiBsY19zZXQgLSBhc3NvY2lhdGUg
aW5kZXggd2l0aCBsYWJlbAotICogQGxjOiB0aGUgbHJ1IGNhY2hlIHRvIG9wZXJhdGUgb24KLSAq
IEBlbnI6IHRoZSBsYWJlbCB0byBzZXQKLSAqIEBpbmRleDogdGhlIGVsZW1lbnQgaW5kZXggdG8g
YXNzb2NpYXRlIGxhYmVsIHdpdGguCi0gKgotICogVXNlZCB0byBpbml0aWFsaXplIHRoZSBhY3Rp
dmUgc2V0IHRvIHNvbWUgcHJldmlvdXNseSByZWNvcmRlZCBzdGF0ZS4KLSAqLwotdm9pZCBsY19z
ZXQoc3RydWN0IGxydV9jYWNoZSAqbGMsIHVuc2lnbmVkIGludCBlbnIsIGludCBpbmRleCkKLXsK
LQlzdHJ1Y3QgbGNfZWxlbWVudCAqZTsKLQlzdHJ1Y3QgbGlzdF9oZWFkICpsaDsKLQotCWlmIChp
bmRleCA8IDAgfHwgaW5kZXggPj0gbGMtPm5yX2VsZW1lbnRzKQotCQlyZXR1cm47Ci0KLQllID0g
bGNfZWxlbWVudF9ieV9pbmRleChsYywgaW5kZXgpOwotCUJVR19PTihlLT5sY19udW1iZXIgIT0g
ZS0+bGNfbmV3X251bWJlcik7Ci0JQlVHX09OKGUtPnJlZmNudCAhPSAwKTsKLQotCWUtPmxjX251
bWJlciA9IGUtPmxjX25ld19udW1iZXIgPSBlbnI7Ci0JaGxpc3RfZGVsX2luaXQoJmUtPmNvbGlz
aW9uKTsKLQlpZiAoZW5yID09IExDX0ZSRUUpCi0JCWxoID0gJmxjLT5mcmVlOwotCWVsc2Ugewot
CQlobGlzdF9hZGRfaGVhZCgmZS0+Y29saXNpb24sIGxjX2hhc2hfc2xvdChsYywgZW5yKSk7Ci0J
CWxoID0gJmxjLT5scnU7Ci0JfQotCWxpc3RfbW92ZSgmZS0+bGlzdCwgbGgpOwotfQotCiAvKioK
ICAqIGxjX3NlcV9kdW1wX2RldGFpbHMgLSBEdW1wIGEgY29tcGxldGUgTFJVIGNhY2hlIHRvIHNl
cSBpbiB0ZXh0dWFsIGZvcm0uCiAgKiBAbGM6IHRoZSBscnUgY2FjaGUgdG8gb3BlcmF0ZSBvbgpA
QCAtNjUwLDcgKzYwOCw2IEBAIHZvaWQgbGNfc2VxX2R1bXBfZGV0YWlscyhzdHJ1Y3Qgc2VxX2Zp
bGUgKnNlcSwgc3RydWN0IGxydV9jYWNoZSAqbGMsIGNoYXIgKnV0ZXh0CiBFWFBPUlRfU1lNQk9M
KGxjX2NyZWF0ZSk7CiBFWFBPUlRfU1lNQk9MKGxjX3Jlc2V0KTsKIEVYUE9SVF9TWU1CT0wobGNf
ZGVzdHJveSk7Ci1FWFBPUlRfU1lNQk9MKGxjX3NldCk7CiBFWFBPUlRfU1lNQk9MKGxjX2RlbCk7
CiBFWFBPUlRfU1lNQk9MKGxjX3RyeV9nZXQpOwogRVhQT1JUX1NZTUJPTChsY19maW5kKTsKQEAg
LTY1OCw3ICs2MTUsNiBAQCBFWFBPUlRfU1lNQk9MKGxjX2dldCk7CiBFWFBPUlRfU1lNQk9MKGxj
X3B1dCk7CiBFWFBPUlRfU1lNQk9MKGxjX2NvbW1pdHRlZCk7CiBFWFBPUlRfU1lNQk9MKGxjX2Vs
ZW1lbnRfYnlfaW5kZXgpOwotRVhQT1JUX1NZTUJPTChsY19pbmRleF9vZik7CiBFWFBPUlRfU1lN
Qk9MKGxjX3NlcV9wcmludGZfc3RhdHMpOwogRVhQT1JUX1NZTUJPTChsY19zZXFfZHVtcF9kZXRh
aWxzKTsKIEVYUE9SVF9TWU1CT0wobGNfdHJ5X2xvY2spOwotLSAKMi4zOC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxp
c3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kcmJkLWRldgo=
