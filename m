Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1E633DF7
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 14:43:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 750864252CC;
	Tue, 22 Nov 2022 14:43:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F1DC4252B7
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 14:43:11 +0100 (CET)
Received: by mail-wr1-f43.google.com with SMTP id x5so20703415wrt.7
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 05:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=KF3CZXuQwHBE4nlGvTbysgbhQTbuB3zQD8B/JpHaOzg=;
	b=Cbx7zn11EQehMM+81fn1VToCqdvNlnjLXq36xiSGojRY4l/t8KeOuqmgNPSFjh09S4
	f/4yjE67gsK/CFRgOSP0pL/8N+IHCAR0NVN9MCiq1aNMEqps0/lzg9/FIfgMCzHY/azH
	tqMu57sNswPfw1RKchHVhiLaxK1POke5vckhvWHje6LHsMcqhWn7Qd7NxidBNcNOpgOn
	J8DLQ2mg60qgLy351jlgSEPilGpsEhJasu9kc4rJHZW8aaYIWJdM9npuoGPfWj6+SXM2
	KcpGLp/W0SkFnOjbgqahbRrxXAQ+KUu0be+Iklv7EALyEIfLxDQOPJYz0wQCtZbPSqN6
	0nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=KF3CZXuQwHBE4nlGvTbysgbhQTbuB3zQD8B/JpHaOzg=;
	b=PgvQTdxTx7ha4g9LF2PHUGfkNi/EUJEfSb2aTQd1v2dEeWTAH68ikOEWPUU56vIMsy
	haP9CkD/X1P/VigsV4+qJazRP3eWT5Nwc8GPpOn4iHhgMkkp7vmxQEOhKfcK4uq/qtPF
	qoF53no5+rlOnAhYZvlmvtXiFECsnI8kMguNfiX4Cn3C6SwAysy1WLolYJjcqQWjW+ER
	fzrLieEOWam0SRXcD5DjP8YGdCL8jx28irXAvDDotpc3rtOl2Kly7jt3Be+WA2s3Hv9U
	6hUH/h3c12Eh7TNd1WNjJINCuEm/Dxyc8EiYQh8gSN26rtPRaZYb+A/2JD3A4ZOB9549
	Aseg==
X-Gm-Message-State: ANoB5pmH24ZDljZCkNbnYlnFe5OYNkPPgl+s1P1YKobo0D2aPHp43Ah4
	UPvDd5cANbNv3/MD8eimMQWaLpjJ
X-Google-Smtp-Source: AA0mqf6N8cSjyb9zLCCmraBEhwm6rbiQsxbk/2HHlEM4qAz7dNe9e2uU4VCUO8pYvYUKWaMUzn/CSg==
X-Received: by 2002:a05:6000:1192:b0:241:e7a6:9135 with SMTP id
	g18-20020a056000119200b00241e7a69135mr661925wrx.641.1669124591378;
	Tue, 22 Nov 2022 05:43:11 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	p6-20020a1c5446000000b003b47e75b401sm21437729wmi.37.2022.11.22.05.43.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Nov 2022 05:43:10 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Nov 2022 14:42:58 +0100
Message-Id: <20221122134301.69258-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
References: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/4] lru_cache: use atomic operations when
	accessing lc->flags, always
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

RnJvbTogTGFycyBFbGxlbmJlcmcgPGxhcnMuZWxsZW5iZXJnQGxpbmJpdC5jb20+CgpPciwgZGVw
ZW5kaW5nIG9uIHRoZSB3YXkgbG9ja2luZyBpcyBpbXBsZW1lbnRlZCBhdCB0aGUgY2FsbCBzaXRl
cywKc29tZSB1cGRhdGVzIGNvdWxkIGJlIGxvc3QgKGhhcyBub3QgYmVlbiBvYnNlcnZlZCkuCgpT
aWduZWQtb2ZmLWJ5OiBMYXJzIEVsbGVuYmVyZyA8bGFycy5lbGxlbmJlcmdAbGluYml0LmNvbT4K
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KLS0tCiBsaWIvbHJ1X2NhY2hlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2xy
dV9jYWNoZS5jIGIvbGliL2xydV9jYWNoZS5jCmluZGV4IGRjMzU0NjQyMTZkMy4uZmVjODk5Mzg2
MjM4IDEwMDY0NAotLS0gYS9saWIvbHJ1X2NhY2hlLmMKKysrIGIvbGliL2xydV9jYWNoZS5jCkBA
IC0zNjQsNyArMzY0LDcgQEAgc3RhdGljIHN0cnVjdCBsY19lbGVtZW50ICpfX2xjX2dldChzdHJ1
Y3QgbHJ1X2NhY2hlICpsYywgdW5zaWduZWQgaW50IGVuciwgdW5zaWcKIAlzdHJ1Y3QgbGNfZWxl
bWVudCAqZTsKIAogCVBBUkFOT0lBX0VOVFJZKCk7Ci0JaWYgKGxjLT5mbGFncyAmIExDX1NUQVJW
SU5HKSB7CisJaWYgKHRlc3RfYml0KF9fTENfU1RBUlZJTkcsICZsYy0+ZmxhZ3MpKSB7CiAJCSsr
bGMtPnN0YXJ2aW5nOwogCQlSRVRVUk4oTlVMTCk7CiAJfQpAQCAtNDE3LDcgKzQxNyw3IEBAIHN0
YXRpYyBzdHJ1Y3QgbGNfZWxlbWVudCAqX19sY19nZXQoc3RydWN0IGxydV9jYWNoZSAqbGMsIHVu
c2lnbmVkIGludCBlbnIsIHVuc2lnCiAJICogdGhlIExSVSBlbGVtZW50LCB3ZSBoYXZlIHRvIHdh
aXQgLi4uCiAJICovCiAJaWYgKCFsY191bnVzZWRfZWxlbWVudF9hdmFpbGFibGUobGMpKSB7Ci0J
CV9fc2V0X2JpdChfX0xDX1NUQVJWSU5HLCAmbGMtPmZsYWdzKTsKKwkJc2V0X2JpdChfX0xDX1NU
QVJWSU5HLCAmbGMtPmZsYWdzKTsKIAkJUkVUVVJOKE5VTEwpOwogCX0KIAotLSAKMi4zOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBt
YWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJp
dC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
