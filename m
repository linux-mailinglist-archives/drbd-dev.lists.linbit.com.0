Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D17863EEC2
	for <lists+drbd-dev@lfdr.de>; Thu,  1 Dec 2022 12:05:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 02BA2422110;
	Thu,  1 Dec 2022 12:05:00 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 190244210DE
	for <drbd-dev@lists.linbit.com>; Thu,  1 Dec 2022 12:04:34 +0100 (CET)
Received: by mail-ed1-f42.google.com with SMTP id b8so1824602edf.11
	for <drbd-dev@lists.linbit.com>; Thu, 01 Dec 2022 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=7UKkmLnS7e989OMhpUZSFxG6zsBK4ZNO7k7rEn6zAvQ=;
	b=NdBYpyarUWAT/sr43u9vgxJ9FnZRbHIzAzX6wo9aQr7ckd26XfVdMXHFeOaROWLwaV
	e5by3aT6ed/GdHBMsT45Ttmxtf9OOJTMZuOL5gw/8PneunyPeObA/kBRq82PzzGciCc2
	I1nHVEsf0mJ3XB3zB69NRFC9hZijOfLg0rmXV97k+ZczcmNZZFDEVdX7VIHZFbaDEY+q
	qO8FvA8ptz4ZLSAo1/UTywTjbi4c+poh1Lh+3LLn5F1LJNrLSXO08yZ7eK3+t6jw6nVr
	bYhBXVU2l94j8VjH5ClIDL6T32/09xEDG/Z9kJvvO5wV+YKJv4O2N1Nh5yszszcQaiUC
	5aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=7UKkmLnS7e989OMhpUZSFxG6zsBK4ZNO7k7rEn6zAvQ=;
	b=rl+DnPeGHKlDaja5Rf+4yW4JdqXMcvAx53UeEENzMzqOwenKMFEUoYMGJrkrXcxr1/
	gKO2T81cwqYXMesVYvBQR9YIlq2IjS8YeDKSw7SryWwuWsxH0dehX6Q2tXDS23gyDNm+
	xFwf8qRGEnbUxlBoZ34cdy7HXSR+mLufNf9K9r0tqJiH6ZFib4MgYKKgvJE3dgeYkQDX
	adJDqsh7unGj0pKQEjRAFsAkLT59a2b0EikDsydCD0Aa3kG3BCq1HfzrKbivDuvoha7h
	EIMKNoO9zkZdAeESI2iUapXYicLbwHIFdnLzzmduqS8iVO2xwOqVvQj2TQeAbfqGdjrT
	NaNg==
X-Gm-Message-State: ANoB5pkmbd+upVlA+22hWMdZwR5fh9ey2EILAVJioPUZigOIPRsbHXAa
	9k/aQ6H0RHBJKfl810jYrQOuBz74
X-Google-Smtp-Source: AA0mqf6U7lfqjEfrlvj2q7CWbLMODJ1yxvd8+fFiAk5pR6E9xio/wnMh1kPd8le0z0yZ122tm9nHPQ==
X-Received: by 2002:a05:6402:1802:b0:461:72cb:e5d with SMTP id
	g2-20020a056402180200b0046172cb0e5dmr51001875edy.410.1669892673832;
	Thu, 01 Dec 2022 03:04:33 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	f26-20020a056402161a00b00463a83ce063sm1576424edv.96.2022.12.01.03.04.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 01 Dec 2022 03:04:33 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  1 Dec 2022 12:03:46 +0100
Message-Id: <20221201110349.1282687-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201110349.1282687-1-christoph.boehmwalder@linbit.com>
References: <20221201110349.1282687-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/5] drbd: unify how failed assertions are logged
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

VW5pZnkgaG93IGZhaWxlZCBhc3NlcnRpb25zIGZyb20gRF9BU1NFUlQoKSBhbmQgZXhwZWN0KCkg
YXJlIGxvZ2dlZC4KCk9yaWdpbmFsbHktZnJvbTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVu
QGxpbmJpdC5jb20+ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0
b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+Ci0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
aW50LmggfCA4ICsrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oIGIv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKaW5kZXggZTI5YmQxMGFjNTJmLi5lYTkyZGY3
NzhjNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oCisrKyBiL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oCkBAIC0xMjIsOSArMTIyLDExIEBAIHZvaWQgZHJi
ZF9wcmludGtfd2l0aF93cm9uZ19vYmplY3RfdHlwZSh2b2lkKTsKICNkZWZpbmUgZHluYW1pY19k
cmJkX2RiZyhkZXZpY2UsIGZtdCwgYXJncy4uLikgXAogCWR5bmFtaWNfZGV2X2RiZyhkaXNrX3Rv
X2RldihkZXZpY2UtPnZkaXNrKSwgZm10LCAjIyBhcmdzKQogCi0jZGVmaW5lIERfQVNTRVJUKGRl
dmljZSwgZXhwKQlkbyB7IFwKLQlpZiAoIShleHApKSBcCi0JCWRyYmRfZXJyKGRldmljZSwgIkFT
U0VSVCggIiAjZXhwICIgKSBpbiAlczolZFxuIiwgX19GSUxFX18sIF9fTElORV9fKTsgXAorI2Rl
ZmluZSBEX0FTU0VSVCh4LCBleHApCQkJCQkJCVwKKwlkbyB7CQkJCQkJCQkJXAorCQlpZiAoIShl
eHApKQkJCQkJCQlcCisJCQlkcmJkX2Vycih4LCAiQVNTRVJUSU9OICVzIEZBSUxFRCBpbiAlc1xu
IiwJCVwKKwkJCQkgI2V4cCwgX19mdW5jX18pOwkJCQlcCiAJfSB3aGlsZSAoMCkKIAogLyoqCi0t
IAoyLjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8v
bGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
