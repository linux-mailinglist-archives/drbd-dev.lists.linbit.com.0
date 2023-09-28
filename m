Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 185117B17AD
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Sep 2023 11:40:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07C71426845;
	Thu, 28 Sep 2023 11:40:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3A09426845
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 11:39:02 +0200 (CEST)
Received: by mail-wr1-f51.google.com with SMTP id
	ffacd0b85a97d-323168869daso9890771f8f.2
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 02:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1695893942;
	x=1696498742; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=FxdqCPbXhmzZcYHHWzAs1Pz189GcHmpMYCt/LIrBVmA=;
	b=IwCkp6xocbk36IyZT1SZXHvUt5FWi+TO9rwicEQKWm5sVTq9WQZbUioTm7X+dvAP5K
	HxcWUWtJvHkDtAWuHDxJhY0jXbMMnIrwksYCUdeUqfhSMsulNxl2/N+2oEoRV1tGd6v/
	L/77ECGOq5hHGMBAuCHevXRtRFz/Wi0aeetT8FhSKI+NWyYGWIfaMWLKtfyPpQhntxHZ
	8S2fQ44OHxbuic+EULx8KTGxypMwpISrhyFDthHmpiKEz5F3M8mjXX3JsLUcNXMHO6q4
	xJhaBcE0hC7FAmYMfbnwiurdUuHzXRjR9nNeF8QPM1J6VgpnNN6pCW+Wnp64Ewzu4u3W
	oaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1695893942; x=1696498742;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=FxdqCPbXhmzZcYHHWzAs1Pz189GcHmpMYCt/LIrBVmA=;
	b=qwSk1VtFO+7HhDdX3v2mj5/TcaZjw77C5hHXNgls1ss6scxuDNOhWXBeyHx2UnlHUZ
	woKtHN8FErQ3zCIoMH/aw6hMOhHNYi08uTJEKCE2/zaT6PvJZjhBClt3xLDnNW2Yhhkr
	cbtIOgbs4x+dXavKUTvLHynCAgFDNAvoRyGTNEACsKQ5Ryht3YmRVpwnpQVTvv9ZOYzC
	9bElTqUHb23bPGhu7KMqyiByapmUOEw0JtrUwqqro7HG+flg4EFAJhFcmiW9YNzG6vQA
	/AIc5WoN87/l1ujCSS7Aa8uC0DnXNQSd/euZuACp1FNHhhUT787aB1MjLkdudv4LcbkV
	rcGw==
X-Gm-Message-State: AOJu0YyZMfWNFrmGVcuXmd/ghAHjjJVh0Qj2J7Lx9DbBG/PWW0IL1y8H
	LLYB3cb3vkBt/OfkNnt4WX8RCMv/
X-Google-Smtp-Source: AGHT+IFXErMwVQh26NX4Lo+CN3tqVv9eERZaRoI/iWHEjF+72aA0bMsuVLkXufdDKwDB+VZd3qOeDQ==
X-Received: by 2002:a05:6000:10c4:b0:319:77dd:61f9 with SMTP id
	b4-20020a05600010c400b0031977dd61f9mr668384wrx.35.1695893942239;
	Thu, 28 Sep 2023 02:39:02 -0700 (PDT)
Received: from localhost.localdomain (213-225-13-130.nat.highway.a1.net.
	[213.225.13.130]) by smtp.gmail.com with ESMTPSA id
	f4-20020a5d50c4000000b0031fa870d4b3sm18931449wrt.60.2023.09.28.02.39.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Sep 2023 02:39:01 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 28 Sep 2023 11:38:50 +0200
Message-ID: <20230928093852.676786-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
References: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Lars Ellenberg <lars@linbit.com>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/5] drbd: Move connection independent work from
	"sender" to "worker"
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

T3JpZ2luYWxseS1mcm9tOiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5AbGluYml0LmNvbT4K
UmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJA
bGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwgMiAr
LQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMgICAgICB8IDMgKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
cmVjZWl2ZXIuYwppbmRleCAwYzlmNTQxOTc3NjguLjZlMjFkZjQ0YjVhYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYworKysgYi9kcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9yZWNlaXZlci5jCkBAIC01ODkwLDcgKzU4OTAsNyBAQCBzdGF0aWMgaW50IGdvdF9P
VlJlc3VsdChzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uLCBzdHJ1Y3QgcGFja2V0
X2luZm8gKgogCQlpZiAoZHcpIHsKIAkJCWR3LT53LmNiID0gd19vdl9maW5pc2hlZDsKIAkJCWR3
LT5kZXZpY2UgPSBkZXZpY2U7Ci0JCQlkcmJkX3F1ZXVlX3dvcmsoJnBlZXJfZGV2aWNlLT5jb25u
ZWN0aW9uLT5zZW5kZXJfd29yaywgJmR3LT53KTsKKwkJCWRyYmRfcXVldWVfd29yaygmZGV2aWNl
LT5yZXNvdXJjZS0+d29yaywgJmR3LT53KTsKIAkJfSBlbHNlIHsKIAkJCWRyYmRfZXJyKGRldmlj
ZSwgImttYWxsb2MoZHcpIGZhaWxlZC4iKTsKIAkJCW92X291dF9vZl9zeW5jX3ByaW50KHBlZXJf
ZGV2aWNlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jIGIvZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMKaW5kZXggY2Q1NmZkMGYzYjA2Li5mYmI0NzEzOGE1
MmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jCisrKyBiL2RyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jCkBAIC04MjMsOCArODIzLDcgQEAgaW50IF9fcmVxX21v
ZChzdHJ1Y3QgZHJiZF9yZXF1ZXN0ICpyZXEsIGVudW0gZHJiZF9yZXFfZXZlbnQgd2hhdCwKIAog
CQlnZXRfbGRldihkZXZpY2UpOyAvKiBhbHdheXMgc3VjY2VlZHMgaW4gdGhpcyBjYWxsIHBhdGgg
Ki8KIAkJcmVxLT53LmNiID0gd19yZXN0YXJ0X2Rpc2tfaW87Ci0JCWRyYmRfcXVldWVfd29yaygm
Y29ubmVjdGlvbi0+c2VuZGVyX3dvcmssCi0JCQkJJnJlcS0+dyk7CisJCWRyYmRfcXVldWVfd29y
aygmZGV2aWNlLT5yZXNvdXJjZS0+d29yaywgJnJlcS0+dyk7CiAJCWJyZWFrOwogCiAJY2FzZSBS
RVNFTkQ6Ci0tIAoyLjQxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29t
Cmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
