Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DB6F4027
	for <lists+drbd-dev@lfdr.de>; Tue,  2 May 2023 11:29:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B2F1C42066F;
	Tue,  2 May 2023 11:29:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CA8FA420372
	for <drbd-dev@lists.linbit.com>; Tue,  2 May 2023 11:29:37 +0200 (CEST)
Received: by mail-wm1-f43.google.com with SMTP id
	5b1f17b1804b1-3f1cfed93e2so34678455e9.3
	for <drbd-dev@lists.linbit.com>; Tue, 02 May 2023 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1683019777;
	x=1685611777; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=r+KWoq0ZrMb5+AWkT4Fb5UOL/QpDrPZJUKENZjHUHx8=;
	b=C2p+Yz00KsTo+nI4wF0SRGz2RcT7vAedjVPyzEzLIkLHIJRDmYu16UNqY6917P2lNs
	UjlYzDt1CXTFRoKCOsQLHemBW2QPi9eDfWGzUYmMwCnr4SjSYxo4hvCR923/ZNjz8S5d
	QJ7DPNil9kuPtPFpvGvWzSaj/u/69OHljxcXcLc9KP4UZ4kpyQqvAJMtWRPXu0VtYLGn
	nCS+0ygFwTmvszZzt6Ucz1FlKoaHAi6+X1I3azrRjKoYTzUVvtnmMWmNC+CjWoSjAZcJ
	2CofMomdKGhSLdr8iJLylMktriVqY+VM7yyt/A/6MohiBVbO/XBHzLq7RvVw39ec1ta5
	Uozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1683019777; x=1685611777;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=r+KWoq0ZrMb5+AWkT4Fb5UOL/QpDrPZJUKENZjHUHx8=;
	b=Psc6jY6aiFEAKr4G7c/bqQBQ/LDozEM9I7U9Bd98kjWNYHKbWogF2ae87hl/OoG4Bl
	kX/ZiZCZfkuY/v3ypVDJced1BQ1/ZEAL08CNoa81OJ80nSmhqcWKy7zAwwpf85GZFp+M
	a2+VUDplvn97kNE+axI8mGt382PT6OmtZ2KXICAGGvIiOi672E655sM+p4QWWlQIn2BO
	SJH6f1WduYU9/oOc5bMLZeJYdVktUBhZTeEMe+eSIC7tzoUoAZtXjCkzpAarWrkxAZNz
	oeWKVkRWe+Zj4kNeiVGHRGmAb81GDzh/aaJzDg+ej8tqmmrHarcITmFjYRR/SNYnqfqL
	hJxA==
X-Gm-Message-State: AC+VfDxmM8nQKjbOgBaGYox71bJVZE4G6WE0kq06Js09fnOCzVVnDlUV
	6TNWZuJ/Gf936ZI5KHzUX2qusSDp
X-Google-Smtp-Source: ACHHUZ7SuacCVSmCD9PvjtcPmUjV2mI9SUWTFnUsRGGmGxW/Nfhw+xvmfP0amNQIS8V/TJpEGEhyXA==
X-Received: by 2002:adf:f58a:0:b0:2f9:cee4:b7d with SMTP id
	f10-20020adff58a000000b002f9cee40b7dmr10637377wro.70.1683019777365;
	Tue, 02 May 2023 02:29:37 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	d14-20020a5d538e000000b002efac42ff35sm30481138wrv.37.2023.05.02.02.29.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 02 May 2023 02:29:36 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  2 May 2023 11:29:22 +0200
Message-Id: <20230502092922.175857-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Thomas Voegtle <tv@lio96.de>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: do not set REQ_PREFLUSH when submitting
	barrier
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

V2hlbiB3ZSByZWNlaXZlIGEgZmx1c2ggY29tbWFuZCAob3IgImJhcnJpZXIiIGluIERSQkQpLCB3
ZSBjdXJyZW50bHkgdXNlCmEgUkVRX09QX0ZMVVNIIHdpdGggdGhlIFJFUV9QUkVGTFVTSCBmbGFn
IHNldC4KClJFUV9PUF9GTFVTSCBpcyBzdXBwb3NlZCB0byBiZSBhbiBlbXB0eSBiaW8gd2l0aCB0
aGUgc29sZSBwdXJwb3NlIG9mCmZsdXNoaW5nIHRoZSBkaXNrLiBSRVFfUFJFRkxVU0ggaXMgdXNl
ZCBmb3IgUkVRX09QX1dSSVRFIGJpb3MgdG8KYWRkaXRpb25hbGx5IHNpZ25hbCB0aGF0IGEgZmx1
c2ggc2hvdWxkIGJlIGlzc3VlZCwgc28gaXQgaXMgcmVkdW5kYW50CmhlcmUuCgpTaW5jZSBjb21t
aXQgYjRhNmJiM2E2N2FhICgiYmxvY2s6IGFkZCBhIHNhbml0eSBjaGVjayBmb3Igbm9uLXdyaXRl
CmZsdXNoL2Z1YSBiaW9zIiksIHRoaXMgdHJpZ2dlcnMgYSB3YXJuaW5nIGluIHRoZSBibG9jayBs
YXllci4KU28gcmVtb3ZlIHRoZSBSRVFfUFJFRkxVU0ggZmxhZyB3aGVuIGFsbG9jYXRpbmcgdGhl
IGJpby4KCkZpeGVzOiBmOWZmMGRhNTY0MzcgKCJkcmJkOiBhbGxvdyBwYXJhbGxlbCBmbHVzaGVz
IGZvciBtdWx0aS12b2x1bWUgcmVzb3VyY2VzIikKUmVwb3J0ZWQtYnk6IFRob21hcyBWb2VndGxl
IDx0dkBsaW85Ni5kZT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJp
c3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9yZWNlaXZlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIu
YyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKaW5kZXggZTU0NDA0YzYzMmU3
Li5mMjQ3OWMyOTE5N2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2Vp
dmVyLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwpAQCAtMTI4Myw3
ICsxMjgzLDcgQEAgc3RhdGljIHZvaWQgb25lX2ZsdXNoX2VuZGlvKHN0cnVjdCBiaW8gKmJpbykK
IHN0YXRpYyB2b2lkIHN1Ym1pdF9vbmVfZmx1c2goc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2Us
IHN0cnVjdCBpc3N1ZV9mbHVzaF9jb250ZXh0ICpjdHgpCiB7CiAJc3RydWN0IGJpbyAqYmlvID0g
YmlvX2FsbG9jKGRldmljZS0+bGRldi0+YmFja2luZ19iZGV2LCAwLAotCQkJCSAgICBSRVFfT1Bf
RkxVU0ggfCBSRVFfUFJFRkxVU0gsIEdGUF9OT0lPKTsKKwkJCQkgICAgUkVRX09QX0ZMVVNILCBH
RlBfTk9JTyk7CiAJc3RydWN0IG9uZV9mbHVzaF9jb250ZXh0ICpvY3R4ID0ga21hbGxvYyhzaXpl
b2YoKm9jdHgpLCBHRlBfTk9JTyk7CiAKIAlpZiAoIW9jdHgpIHsKLS0gCjIuMzkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGlu
ZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29t
L21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
