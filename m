Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2FF4F698D
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:06:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 84E93420FD8;
	Wed,  6 Apr 2022 21:06:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70380420FD4
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:05:34 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id n6so6159323ejc.13
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WBo84nT6kplZvgHB/vdnS5/ZWvTiH4Rb4kDlRvn9tbE=;
	b=dCGktYBy5F1Zx0GypibmKeIOPcSKF5c1cY/Ymuk0WBP7hPMGCDgjNRpbJMaQmdUOcr
	gYSZr4Xhd5VbpijEI6kF2oECiMU2X6ZhLOtNRD8gJAwspNro6z6CEGPcE2dgt9XRiIkC
	wc/rLKlbEyJFdPr5AQHhwjk5wu39+KKg9427rtjmOLKqwEvjkX7pMAL6+nV2iEtorSWX
	QFP2g5iOxpD+6UCmitRVP30PgKOdhyq37ownMQEIANHhWgmGXh4+02nZFUFFjYzZhkm0
	+qi0Vs00ytlIggtFPN3+Qo5e9UzGuCw2MtSPOYYY3lYKpQwCtfO6cInsqiDo+9v+dmy3
	MWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WBo84nT6kplZvgHB/vdnS5/ZWvTiH4Rb4kDlRvn9tbE=;
	b=h1Axu4E9CT6/7oXFnAjdt1WCe8FSHnZUq/aQmwNytyWPALoHgKnSk9jsbSVjHDrLBl
	6JAN6D7IUmzpdr0l7c+Jlzw0OqIKtgZemzxMywuiJu2S8pjF/uZySUCC3ZcvdnrX4EJQ
	Gxr85WEfDZd71c70zGBwFyrjRSYD4aXmQkCxQ9lr2/B2i50h/kWdTUPBzHg8mqGnY55n
	ccXlUVs/xTfv/tQEX4XJsWFAS4EfQW9rWYLmk0K3jcJ0tF4fKEJQEWejqcLkl2juD8iG
	fyyeq9Qr1ksRh/stexSL6Q+6/l+ZxAYQK0NcQKD8MwzC3mZdaOV3wvVbu32pZKa5txW3
	8p+Q==
X-Gm-Message-State: AOAM532NagAFcFyw3XGDVkPkz/gvHVkgadfB7Xcy+DAhCUc4/tGb8VIx
	ockOSNd4IumROkmdrks6an0TCMOm
X-Google-Smtp-Source: ABdhPJyTsMFP8wBllOYfilYBbOCNHenhYc+BnrBSgdiicw0iXsw0UvHmIIMoOuvBBoLpOu2XvVZrfg==
X-Received: by 2002:a17:907:6ea7:b0:6df:c5a2:89ca with SMTP id
	sh39-20020a1709076ea700b006dfc5a289camr9769965ejc.18.1649271934152;
	Wed, 06 Apr 2022 12:05:34 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	hr38-20020a1709073fa600b006e0280f3bbdsm6914682ejc.110.2022.04.06.12.05.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:05:33 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:04:45 +0200
Message-Id: <20220406190445.1937206-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
References: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph@boehmwalder.at>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/3] drbd: set QUEUE_FLAG_STABLE_WRITES
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

RnJvbTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGhAYm9laG13YWxkZXIuYXQ+CgpX
ZSB3YW50IG91ciBwYWdlcyBub3QgdG8gY2hhbmdlIHdoaWxlIHRoZXkgYXJlIGJlaW5nIHdyaXR0
ZW4uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2Vo
bXdhbGRlckBsaW5iaXQuY29tPgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5j
CmluZGV4IGQ2ZGZhMjg2ZGRiMy4uNGIwYjI1Y2M5MTZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5j
CkBAIC0yNzE5LDYgKzI3MTksNyBAQCBlbnVtIGRyYmRfcmV0X2NvZGUgZHJiZF9jcmVhdGVfZGV2
aWNlKHN0cnVjdCBkcmJkX2NvbmZpZ19jb250ZXh0ICphZG1fY3R4LCB1bnNpZwogCXNwcmludGYo
ZGlzay0+ZGlza19uYW1lLCAiZHJiZCVkIiwgbWlub3IpOwogCWRpc2stPnByaXZhdGVfZGF0YSA9
IGRldmljZTsKIAorCWJsa19xdWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX1NUQUJMRV9XUklURVMs
IGRpc2stPnF1ZXVlKTsKIAlibGtfcXVldWVfd3JpdGVfY2FjaGUoZGlzay0+cXVldWUsIHRydWUs
IHRydWUpOwogCS8qIFNldHRpbmcgdGhlIG1heF9od19zZWN0b3JzIHRvIGFuIG9kZCB2YWx1ZSBv
ZiA4a2lieXRlIGhlcmUKIAkgICBUaGlzIHRyaWdnZXJzIGEgbWF4X2Jpb19zaXplIG1lc3NhZ2Ug
dXBvbiBmaXJzdCBhdHRhY2ggb3IgY29ubmVjdCAqLwotLSAKMi4zNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QK
ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kcmJkLWRldgo=
