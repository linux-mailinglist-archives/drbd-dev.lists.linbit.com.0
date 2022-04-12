Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F214FC9B5
	for <lists+drbd-dev@lfdr.de>; Tue, 12 Apr 2022 02:46:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D66E04202F6;
	Tue, 12 Apr 2022 02:46:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3325042018F
	for <drbd-dev@lists.linbit.com>;
	Tue, 12 Apr 2022 02:46:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36E5061805;
	Tue, 12 Apr 2022 00:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04D2C385AA;
	Tue, 12 Apr 2022 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649724386;
	bh=2e0jq/evzzp72OOQns/pI1E227qzHF0St3k76GBwMvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=diBWR08gLRo3tpu5vlz4bv/ks6khcjYmBZPtJLoWiM8siZQdJYCcpTKoTQtU16/XP
	tGMlhs+J3nIG4bW1VeNn4jKefav5mLQInOZJ2DH7qp/zJsm6aOszmfpU5hyCr9ecqk
	zgVwoBTlfKDGKarZfqemPf2xOknaxy/mBCVcTF21097c3NHL5CKtJP7oE/hHvZ3LNB
	8LxO43OIcJAy1S2mH4Ua4ZfvJJyWIB8gQXduy/1oxN4kRrgUBGOukwTW9P4deuclAF
	MxW9TsH8QSpi4UoSVpLNdjDLRpBusFwHXjIzKD1zFqWjUTPWk6I/YbFoljbI1w3yNW
	hyiK/qI4u0WGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 11 Apr 2022 20:43:57 -0400
Message-Id: <20220412004411.349427-39-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004411.349427-1-sashal@kernel.org>
References: <20220412004411.349427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	philipp.reisner@linbit.com, linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph@boehmwalder.at>,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH AUTOSEL 5.17 39/49] drbd: set
	QUEUE_FLAG_STABLE_WRITES
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

RnJvbTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGhAYm9laG13YWxkZXIuYXQ+Cgpb
IFVwc3RyZWFtIGNvbW1pdCAyODY5MDE5NDFmZDE4YTUyYjIxMzhmZGRiYmY1ODlhZDM2MzllYjAw
IF0KCldlIHdhbnQgb3VyIHBhZ2VzIG5vdCB0byBjaGFuZ2Ugd2hpbGUgdGhleSBhcmUgYmVpbmcg
d3JpdHRlbi4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3Bo
LmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+ClNpZ25lZC1vZmYtYnk6IEplbnMgQXhib2UgPGF4Ym9l
QGtlcm5lbC5kaz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCmluZGV4IDZmNDUwODE2YzRm
YS4uYjk3MWUxMjY2MjRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWlu
LmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCkBAIC0yNzM5LDYgKzI3Mzks
NyBAQCBlbnVtIGRyYmRfcmV0X2NvZGUgZHJiZF9jcmVhdGVfZGV2aWNlKHN0cnVjdCBkcmJkX2Nv
bmZpZ19jb250ZXh0ICphZG1fY3R4LCB1bnNpZwogCXNwcmludGYoZGlzay0+ZGlza19uYW1lLCAi
ZHJiZCVkIiwgbWlub3IpOwogCWRpc2stPnByaXZhdGVfZGF0YSA9IGRldmljZTsKIAorCWJsa19x
dWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX1NUQUJMRV9XUklURVMsIGRpc2stPnF1ZXVlKTsKIAli
bGtfcXVldWVfd3JpdGVfY2FjaGUoZGlzay0+cXVldWUsIHRydWUsIHRydWUpOwogCS8qIFNldHRp
bmcgdGhlIG1heF9od19zZWN0b3JzIHRvIGFuIG9kZCB2YWx1ZSBvZiA4a2lieXRlIGhlcmUKIAkg
ICBUaGlzIHRyaWdnZXJzIGEgbWF4X2Jpb19zaXplIG1lc3NhZ2UgdXBvbiBmaXJzdCBhdHRhY2gg
b3IgY29ubmVjdCAqLwotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRl
dgo=
