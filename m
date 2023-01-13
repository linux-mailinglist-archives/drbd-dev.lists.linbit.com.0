Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937066978A
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:41:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D626C422464;
	Fri, 13 Jan 2023 13:41:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC8F8422117
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:48 +0100 (CET)
Received: by mail-ej1-f41.google.com with SMTP id qk9so52025534ejc.3
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=T5KT6Auu94HJGq65sn5VmhXW8yJRnWzEtldTHa29AT0=;
	b=iEvtkhCXslE72xJ4rRq1o4dPaZjuX9JLsa7ypmZFDHZvO1spA7qgOqdlMIgNqmOd4Q
	BmnYm1AreZ0f08H6qA5zzq1vhit1vtTePd21UHj1cHFD1HjWkkgvd6vUd0NYq3Flo4tW
	PU4z44ieH6GRE99WOpB7LDRHJPfdP/JK0iDdurBhlgpJdztFtfu1wNuJqycRTt4DfmwJ
	DKQGPJsW0QdNBPlwzpGCReJQBTQGz5fJbIzvrcijgWMbeBy62bZDqSBq0eYILOugbfBK
	POQt3cU00BEvXOTS6Px7H7/seYT2YAjrwmY0BkAOAChZsa+VBCMGVy2V6DjUXPacBhb7
	5YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=T5KT6Auu94HJGq65sn5VmhXW8yJRnWzEtldTHa29AT0=;
	b=5ZJxIXZko0jZ+BZtzQQ7WfX7gnJGdEaHl6hOzQxVwBPhnN/xDasYUOSYBFcRwdcjTj
	CV1I45Yj3BUFXfTuWAAzFfm7o16wrw0YZqmZ7HqEnMOXovkPvnFjLN8p3ghH8K3Jy5vc
	4sLKg81jfb7cyvVWb4sr9udDCzzQ5FtDcz+2rEz1j0PIHq0n4Mm3jdNVjwukIrxV8NhW
	7LSwd84BGcr71MHow9e7QHen/wwbJg6BG0zHSuWlDzA3IkNbbM6KYE1wrHcRHz0dTDAh
	jlKq83warpRDGBC6x46Oa2rYsRfj+A5s2oEWiXEEcpKyYLHxN9Mt9h2HbYDAfNq6i7LF
	gJfw==
X-Gm-Message-State: AFqh2koLE+2dQQIhouN0CE/UtgkyZOokKcTDbmJcqO774gp7yq20Z1DG
	I5T2MYOL1iYwKiMUdmgyHbEbAzAtDnZOS2s4vTAyYw==
X-Google-Smtp-Source: AMrXdXv2f3WJ7TxaCpga5NoHE+9yIqEbHRcFtx8jGKJkLWIR0zf6tV2L+T7DlJE4PxvQYKOiiXMw5A==
X-Received: by 2002:a17:907:7f12:b0:7c1:9eb:845b with SMTP id
	qf18-20020a1709077f1200b007c109eb845bmr3841305ejc.16.1673613348224;
	Fri, 13 Jan 2023 04:35:48 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:47 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:37 +0100
Message-Id: <20230113123538.144276-8-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 7/8] drbd: interval tree: make removing an
	"empty" interval a no-op
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

RnJvbTogTGFycyBFbGxlbmJlcmcgPGxhcnMuZWxsZW5iZXJnQGxpbmJpdC5jb20+CgpUcnlpbmcg
dG8gcmVtb3ZlIGFuICJlbXB0eSIgKGp1c3QgaW5pdGlhbGl6ZWQsIG9yICJjbGVhcmVkIikgaW50
ZXJ2YWwKZnJvbSB0aGUgdHJlZSwgdGhpcyByZXN1bHRzIGluIGFuIGVuZGxlc3MgbG9vcC4KCkFz
IHdlIHR5cGljYWxseSBwcm90ZWN0IHRoZSB0cmVlIHdpdGggYSBzcGlubG9ja19pcnEsCnRoZSBy
ZXN1bHQgaXMgYSBodW5nIHN5c3RlbS4KCkJlIG5pY2UgdG8gZXJyb3IgY2xlYW51cCBjb2RlIHBh
dGhzLCBpZ25vcmUgcmVtb3ZhbCBvZiBlbXB0eSBpbnRlcnZhbHMuCgpTaWduZWQtb2ZmLWJ5OiBM
YXJzIEVsbGVuYmVyZyA8bGFycy5lbGxlbmJlcmdAbGluYml0LmNvbT4KU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4K
LS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnRlcnZhbC5jIHwgNCArKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfaW50ZXJ2YWwuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludGVydmFsLmMKaW5k
ZXggNTAyNGZmZDYxNDNkLi5iNmFhZjBkNGQ4NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX2ludGVydmFsLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50ZXJ2
YWwuYwpAQCAtOTUsNiArOTUsMTAgQEAgZHJiZF9jb250YWluc19pbnRlcnZhbChzdHJ1Y3QgcmJf
cm9vdCAqcm9vdCwgc2VjdG9yX3Qgc2VjdG9yLAogdm9pZAogZHJiZF9yZW1vdmVfaW50ZXJ2YWwo
c3RydWN0IHJiX3Jvb3QgKnJvb3QsIHN0cnVjdCBkcmJkX2ludGVydmFsICp0aGlzKQogeworCS8q
IGF2b2lkIGVuZGxlc3MgbG9vcCAqLworCWlmIChkcmJkX2ludGVydmFsX2VtcHR5KHRoaXMpKQor
CQlyZXR1cm47CisKIAlyYl9lcmFzZV9hdWdtZW50ZWQoJnRoaXMtPnJiLCByb290LCAmYXVnbWVu
dF9jYWxsYmFja3MpOwogfQogCi0tIAoyLjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
