Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA507B17B9
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Sep 2023 11:41:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A371426852;
	Thu, 28 Sep 2023 11:41:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6F5BB426837
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 11:39:05 +0200 (CEST)
Received: by mail-wm1-f44.google.com with SMTP id
	5b1f17b1804b1-40572aeb73cso97147505e9.3
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 02:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1695893945;
	x=1696498745; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=RUAvpHbZIlJDAymrC3wO69unj3kyTMzvS96nKCkH42g=;
	b=1BwjZLRqs6mlRSsMlcQYdxL5NenlYck07lCJYadxAjpmLk08/YwZ83caxQ+F2FlzHJ
	n5xL2467IWtJsf0WsCpLjPir2z31Y/LiM0Ln2IgORyweBIOEi1He3wZK/sbWqTl8xcUh
	vONT8zPZxvyzDDAvicZ8cqlJlqnlIas3WJ5ye6HOdZlFfaURLko5Y5AXOqg0mzWkODaf
	eM8wLQdeNN3aTEI6L/hoePP9Gs/vKKVVkbQZr/XivyB4A/GmSgXfYup61WgZ0+I7T534
	ZcTawArp8rJs0EHipVh8xHguHqh2pkqDLD68fRqaxziHJXqgSSnXr6C8LVBNZX8OjIah
	AkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1695893945; x=1696498745;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=RUAvpHbZIlJDAymrC3wO69unj3kyTMzvS96nKCkH42g=;
	b=aDvyV5CHYpYsDTpp8MbSY+iPzPy7TFKRdFO1Eq9zmNO6S0PDGeRc13hXr4GVQfkkDr
	j+28cfrRkLuhwsBTzQu97PS+jplPn4D+fIouunWrTSLZijZOv0+sTafPuiE5tNe3lJeD
	N7mylI1P/0zZrMmkH6DwH5FKlLMkq09LN+2juoP7ouF7fyWuxasdVxYQAELxH3o/o/za
	0arvaR2eyUp6SqU889RWvHRAPjgrqPnBnQGFdmEEClgQTKt18UnMpSN2Pgt4zAQ2SxZE
	21xEsw9uyLGFNy7RPu8x7yo2JNCOjrTRQSB1TvsjsvVPdoHAVNT1NvO4HUSa0DP9z145
	Z9sg==
X-Gm-Message-State: AOJu0YwSRB6H8JWKFctwQ7YdZeitQWpGup0uejM4Bi/yaFEdUcmXlprG
	yZOgNja9trCzx527sW3f6cbknway
X-Google-Smtp-Source: AGHT+IFOh1UVdUIHYK2shBxIs9apOwc+4FRG5zqxR/3bZCY1dSSV3c0K6NkS/zzqRscr/ae10XfuIw==
X-Received: by 2002:a5d:4985:0:b0:320:10c:37a4 with SMTP id
	r5-20020a5d4985000000b00320010c37a4mr712514wrq.21.1695893944947;
	Thu, 28 Sep 2023 02:39:04 -0700 (PDT)
Received: from localhost.localdomain (213-225-13-130.nat.highway.a1.net.
	[213.225.13.130]) by smtp.gmail.com with ESMTPSA id
	f4-20020a5d50c4000000b0031fa870d4b3sm18931449wrt.60.2023.09.28.02.39.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Sep 2023 02:39:04 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 28 Sep 2023 11:38:52 +0200
Message-ID: <20230928093852.676786-6-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
References: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Lars Ellenberg <lars@linbit.com>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 5/5] drbd: Get rid of conn_reconfig_start() and
	conn_reconfig_done()
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

T3JpZ2luYWxseS1mcm9tOiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5Aa2VybmVsLm9yZz4K
UmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJA
bGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIHwgMzQgKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMzEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfbmwuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKaW5kZXggODVhYjZmMGY5ZDg3
Li41ZGU4YTY2NDEyNTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMK
KysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwpAQCAtMTM0OSwyOCArMTM0OSw2IEBA
IHZvaWQgZHJiZF9yZWNvbnNpZGVyX3F1ZXVlX3BhcmFtZXRlcnMoc3RydWN0IGRyYmRfZGV2aWNl
ICpkZXZpY2UsIHN0cnVjdCBkcmJkX2JhCiAJZHJiZF9zZXR1cF9xdWV1ZV9wYXJhbShkZXZpY2Us
IGJkZXYsIG5ldywgbyk7CiB9CiAKLS8qIFN0YXJ0cyB0aGUgc2VuZGVyIHRocmVhZCAqLwotc3Rh
dGljIHZvaWQgY29ubl9yZWNvbmZpZ19zdGFydChzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25u
ZWN0aW9uKQotewotCWRyYmRfdGhyZWFkX3N0YXJ0KCZjb25uZWN0aW9uLT5zZW5kZXIpOwotCWRy
YmRfZmx1c2hfd29ya3F1ZXVlKCZjb25uZWN0aW9uLT5zZW5kZXJfd29yayk7Ci19Ci0KLS8qIGlm
IHN0aWxsIHVuY29uZmlndXJlZCwgc3RvcHMgc2VuZGVyIGFnYWluLiAqLwotc3RhdGljIHZvaWQg
Y29ubl9yZWNvbmZpZ19kb25lKHN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24pCi17
Ci0JYm9vbCBzdG9wX3RocmVhZHM7Ci0Jc3Bpbl9sb2NrX2lycSgmY29ubmVjdGlvbi0+cmVzb3Vy
Y2UtPnJlcV9sb2NrKTsKLQlzdG9wX3RocmVhZHMgPSBjb25uZWN0aW9uLT5jc3RhdGUgPT0gQ19T
VEFOREFMT05FOwotCXNwaW5fdW5sb2NrX2lycSgmY29ubmVjdGlvbi0+cmVzb3VyY2UtPnJlcV9s
b2NrKTsKLQlpZiAoc3RvcF90aHJlYWRzKSB7Ci0JCS8qIGFja19yZWNlaXZlciB0aHJlYWQgYW5k
IGFja19zZW5kZXIgd29ya3F1ZXVlIGFyZSBpbXBsaWNpdGx5Ci0JCSAqIHN0b3BwZWQgYnkgcmVj
ZWl2ZXIgaW4gY29ubl9kaXNjb25uZWN0KCkgKi8KLQkJZHJiZF90aHJlYWRfc3RvcCgmY29ubmVj
dGlvbi0+cmVjZWl2ZXIpOwotCQlkcmJkX3RocmVhZF9zdG9wKCZjb25uZWN0aW9uLT5zZW5kZXIp
OwotCX0KLX0KLQogLyogTWFrZSBzdXJlIElPIGlzIHN1c3BlbmRlZCBiZWZvcmUgY2FsbGluZyB0
aGlzIGZ1bmN0aW9uKCkuICovCiBzdGF0aWMgdm9pZCBkcmJkX3N1c3BlbmRfYWwoc3RydWN0IGRy
YmRfZGV2aWNlICpkZXZpY2UpCiB7CkBAIC0yMzgyLDcgKzIzNjAsNyBAQCBpbnQgZHJiZF9hZG1f
bmV0X29wdHMoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5mbykKIAkJ
Z290byBvdXQ7CiAJfQogCi0JY29ubl9yZWNvbmZpZ19zdGFydChjb25uZWN0aW9uKTsKKwlkcmJk
X2ZsdXNoX3dvcmtxdWV1ZSgmY29ubmVjdGlvbi0+c2VuZGVyX3dvcmspOwogCiAJbXV0ZXhfbG9j
aygmY29ubmVjdGlvbi0+ZGF0YS5tdXRleCk7CiAJbXV0ZXhfbG9jaygmY29ubmVjdGlvbi0+cmVz
b3VyY2UtPmNvbmZfdXBkYXRlKTsKQEAgLTI0NjEsMTUgKzI0MzksMTMgQEAgaW50IGRyYmRfYWRt
X25ldF9vcHRzKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBnZW5sX2luZm8gKmluZm8pCiAJ
CQlkcmJkX3NlbmRfc3luY19wYXJhbShwZWVyX2RldmljZSk7CiAJfQogCi0JZ290byBkb25lOwor
CWdvdG8gb3V0OwogCiAgZmFpbDoKIAltdXRleF91bmxvY2soJmNvbm5lY3Rpb24tPnJlc291cmNl
LT5jb25mX3VwZGF0ZSk7CiAJbXV0ZXhfdW5sb2NrKCZjb25uZWN0aW9uLT5kYXRhLm11dGV4KTsK
IAlmcmVlX2NyeXB0bygmY3J5cHRvKTsKIAlrZnJlZShuZXdfbmV0X2NvbmYpOwotIGRvbmU6Ci0J
Y29ubl9yZWNvbmZpZ19kb25lKGNvbm5lY3Rpb24pOwogIG91dDoKIAltdXRleF91bmxvY2soJmFk
bV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7CiAgZmluaXNoOgpAQCAtMjU0OCw3ICsyNTI0LDYg
QEAgaW50IGRyYmRfYWRtX2Nvbm5lY3Qoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxf
aW5mbyAqaW5mbykKIAogCW11dGV4X2xvY2soJmFkbV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7
CiAJY29ubmVjdGlvbiA9IGZpcnN0X2Nvbm5lY3Rpb24oYWRtX2N0eC5yZXNvdXJjZSk7Ci0JY29u
bl9yZWNvbmZpZ19zdGFydChjb25uZWN0aW9uKTsKIAogCWlmIChjb25uZWN0aW9uLT5jc3RhdGUg
PiBDX1NUQU5EQUxPTkUpIHsKIAkJcmV0Y29kZSA9IEVSUl9ORVRfQ09ORklHVVJFRDsKQEAgLTI1
ODEsOCArMjU1Niw2IEBAIGludCBkcmJkX2FkbV9jb25uZWN0KHN0cnVjdCBza19idWZmICpza2Is
IHN0cnVjdCBnZW5sX2luZm8gKmluZm8pCiAKIAkoKGNoYXIgKiluZXdfbmV0X2NvbmYtPnNoYXJl
ZF9zZWNyZXQpW1NIQVJFRF9TRUNSRVRfTUFYLTFdID0gMDsKIAotCWRyYmRfZmx1c2hfd29ya3F1
ZXVlKCZjb25uZWN0aW9uLT5zZW5kZXJfd29yayk7Ci0KIAltdXRleF9sb2NrKCZhZG1fY3R4LnJl
c291cmNlLT5jb25mX3VwZGF0ZSk7CiAJb2xkX25ldF9jb25mID0gY29ubmVjdGlvbi0+bmV0X2Nv
bmY7CiAJaWYgKG9sZF9uZXRfY29uZikgewpAQCAtMjYzMSw3ICsyNjA0LDcgQEAgaW50IGRyYmRf
YWRtX2Nvbm5lY3Qoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5mbykK
IAogCXJ2ID0gY29ubl9yZXF1ZXN0X3N0YXRlKGNvbm5lY3Rpb24sIE5TKGNvbm4sIENfVU5DT05O
RUNURUQpLCBDU19WRVJCT1NFKTsKIAotCWNvbm5fcmVjb25maWdfZG9uZShjb25uZWN0aW9uKTsK
KwlkcmJkX3RocmVhZF9zdGFydCgmY29ubmVjdGlvbi0+c2VuZGVyKTsKIAltdXRleF91bmxvY2so
JmFkbV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7CiAJZHJiZF9hZG1fZmluaXNoKCZhZG1fY3R4
LCBpbmZvLCBydik7CiAJcmV0dXJuIDA7CkBAIC0yNjQwLDcgKzI2MTMsNiBAQCBpbnQgZHJiZF9h
ZG1fY29ubmVjdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZ2VubF9pbmZvICppbmZvKQog
CWZyZWVfY3J5cHRvKCZjcnlwdG8pOwogCWtmcmVlKG5ld19uZXRfY29uZik7CiAKLQljb25uX3Jl
Y29uZmlnX2RvbmUoY29ubmVjdGlvbik7CiAJbXV0ZXhfdW5sb2NrKCZhZG1fY3R4LnJlc291cmNl
LT5hZG1fbXV0ZXgpOwogb3V0OgogCWRyYmRfYWRtX2ZpbmlzaCgmYWRtX2N0eCwgaW5mbywgcmV0
Y29kZSk7Ci0tIAoyLjQxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29t
Cmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
