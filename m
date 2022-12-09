Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33F648456
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:57:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BE2464252D7;
	Fri,  9 Dec 2022 15:57:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D395D4210CC
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:38 +0100 (CET)
Received: by mail-ed1-f45.google.com with SMTP id c17so3358833edj.13
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=w8l6YI6ll5WTtemsFOxZHnG0tRV3sgRpFSwrNSjhQUI=;
	b=QFl7VoOtaGk5JJJiTD/4KIC5FLgDPhNuBOMrb3WnSAoODL2ltc52rELA5f6yl7Bn7j
	mYbNUsXfDCJ75uQrG1lZrpy8vrWDSlLuNc+DwsQQohwm/k745BMOpiYBdnk8YyDlL9Fq
	7eDn+Dtw+CSLH6wmrmqvtN68OZ461bwi3ogQi4pmiDXFrr15Amw9K+7sAjoYiCPtv/mc
	PMf+aDonj+6iew+Dh+5hsyQ1LSgQ6rvpmF51QrTg0U24d6fmLo6yxPrsR37jHc1CbRMJ
	tBqK9JcG0+r3Xk6QRttN7gv2gLonVRU/cK8VMDIfHh+fZ3qa8enXQbuW2vEfMals9jM0
	IO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=w8l6YI6ll5WTtemsFOxZHnG0tRV3sgRpFSwrNSjhQUI=;
	b=aHcOHz7O8yXW+s9rTrd96w2F1jObOHtT6O5PH4NJw8hWeCOUtzuXfwVfr79VDcd+hR
	S6lKBcvn23OtnA3loEG3red3mhSwX7XlfBa/rvEx/1HwoPhfor4aFdMm+j6XObTjuM8I
	Ba9IWYmZh8VC9d4Elvw/nQ8vx9584gifDlcaMVb69KCOFrrstoqr9m7gcCv7IOXTVEX7
	OAzHfPTdIZYIlmJbZGHF8J8A7dCPBYfqxN58QcjnMFzXAej7XNYJXgErXSMVYNn+2n4H
	qjE7UZ6QQcIddIrM4pp+YqKJ89b7/PNfjTCc2+bc/dnltdyyPg3sdJWaOlY7Kln9QU9i
	4JOg==
X-Gm-Message-State: ANoB5pkLkqJ9DSKXi01ZQxMey3QkuudJeiX3xYcVjzI0vFmVnqjZF5ga
	8aLkqbNbjwZL782DCBnzz6UM1Ojv
X-Google-Smtp-Source: AA0mqf7iTbuKTrRATtfWNUUyFaIEQ2x3dRPnmp/q01kefuttCVcLa6LUxjn6tqOZ2JV/H/DHj4tTxw==
X-Received: by 2002:aa7:cd46:0:b0:46d:e3f8:4ed4 with SMTP id
	v6-20020aa7cd46000000b0046de3f84ed4mr2215720edw.21.1670597618194;
	Fri, 09 Dec 2022 06:53:38 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:37 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:27 +0100
Message-Id: <20221209145327.2272271-9-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 8/8] drbd: drbd_insert_interval(): Clarify comment
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
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnRlcnZhbC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfaW50ZXJ2YWwuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2ludGVydmFsLmMKaW5kZXggYjZhYWYwZDRkODViLi44NzNiZWRhNmRlMjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludGVydmFsLmMKKysrIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfaW50ZXJ2YWwuYwpAQCAtNTgsNyArNTgsNyBAQCBkcmJkX2luc2VydF9pbnRlcnZh
bChzdHJ1Y3QgcmJfcm9vdCAqcm9vdCwgc3RydWN0IGRyYmRfaW50ZXJ2YWwgKnRoaXMpCiAgKiBk
cmJkX2NvbnRhaW5zX2ludGVydmFsICAtICBjaGVjayBpZiBhIHRyZWUgY29udGFpbnMgYSBnaXZl
biBpbnRlcnZhbAogICogQHJvb3Q6CXJlZCBibGFjayB0cmVlIHJvb3QKICAqIEBzZWN0b3I6CXN0
YXJ0IHNlY3RvciBvZiBAaW50ZXJ2YWwKLSAqIEBpbnRlcnZhbDoJbWF5IG5vdCBiZSBhIHZhbGlk
IHBvaW50ZXIKKyAqIEBpbnRlcnZhbDoJbWF5IGJlIGFuIGludmFsaWQgcG9pbnRlcgogICoKICAq
IFJldHVybnMgaWYgdGhlIHRyZWUgY29udGFpbnMgdGhlIG5vZGUgQGludGVydmFsIHdpdGggc3Rh
cnQgc2VjdG9yIEBzdGFydC4KICAqIERvZXMgbm90IGRlcmVmZXJlbmNlIEBpbnRlcnZhbCB1bnRp
bCBAaW50ZXJ2YWwgaXMga25vd24gdG8gYmUgYSB2YWxpZCBvYmplY3QKLS0gCjIuMzguMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFp
bGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
