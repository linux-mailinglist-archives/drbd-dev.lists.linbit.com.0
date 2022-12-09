Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B1648450
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:57:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8CE8E4252D2;
	Fri,  9 Dec 2022 15:57:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF3CC42066E
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:37 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id vv4so12088635ejc.2
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=T5KT6Auu94HJGq65sn5VmhXW8yJRnWzEtldTHa29AT0=;
	b=qH3VWd11DupxgvhV7pRjAnxBZRPHRVTf98egvIoxinGVQRaCd3ZF6czmLJrKGMYXsB
	RPHSkdAu9kOeJaTYhohXQXSGeMniGLXhcla20EEwDNTC1pwXdIdgGpwsv7c5MUKiVfJ4
	R1VvZPx8vqt/LI+/3wwHRHtRFyTNoI0svx/XUBUrBuvjF/bzvA/Y6OWRrm0xZtMvR/F+
	GYGXyzCyfra0P4oZkNg1YSYhQYcyfjze8MWS1K+ayD2T8KOWYRpy/oTWm5ghL2KGPbFm
	OyE/IwQEY7caV74dSK229wiG3ZJJvY53vrA2EAt4e0G0x3uKy7Z06SVhwwjmN7Rh4MdS
	DY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=T5KT6Auu94HJGq65sn5VmhXW8yJRnWzEtldTHa29AT0=;
	b=x59P3vc8VX9PYtW4SI/rGHlCmzKtArK1L8NtkVz213lhBO4m9zYTnc1GoaTaM2TMyI
	ZmfoKpexsCSxR2nalq11mObuLpQb9tAQ3uRB0M24Gg69hhVHthhGDSuKv9Bp4QF0OoaR
	zckeG6Ygj+97bnll8Iu6An9Xp/DsFIh3W440mpZ25v9JqvnbPd71OCd1ep7gQ6Aq6i/D
	FmTf/OgaBouhV6StzMl3oVIP6UsBpvF0NwxC54ZvX4s56329vKWvXOCv/m2hOC5E0lDe
	oGApRNXjFzjWSANoARhfxafWB6uIARDnN+RWONRo9T0c7xpYTQMoMs7Ej/eFhx7fbPXk
	gxUA==
X-Gm-Message-State: ANoB5pl9/TUFAybBiQkGDIRdFxGCMvU1+CGoefO5SRTQtBnPfdlZd74x
	nETO/rZcCOuoWNElJX7Po9TFQzk4
X-Google-Smtp-Source: AA0mqf7RrKWHYaxtFEHbgrJNq8V3fsNHj2nP6OKdVzjocdU4FuZSfkiFMUFoeWmVa3n6s4SCj1sykw==
X-Received: by 2002:a17:906:3a96:b0:78d:f454:ba4a with SMTP id
	y22-20020a1709063a9600b0078df454ba4amr6226366ejd.73.1670597617418;
	Fri, 09 Dec 2022 06:53:37 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:36 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:26 +0100
Message-Id: <20221209145327.2272271-8-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
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
