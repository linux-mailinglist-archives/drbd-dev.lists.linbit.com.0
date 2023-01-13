Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A849669756
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:35:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 55ABF42212F;
	Fri, 13 Jan 2023 13:35:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6F5014203AB
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:19 +0100 (CET)
Received: by mail-ej1-f53.google.com with SMTP id hw16so40155696ejc.10
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=NGS8p58llTH0j/JtmBIf8IcqQNNb3dOfgpZWMO+4qxc=;
	b=G5XERQe1fAt3Kb9rlbCJGlE/89ixGm3qrHLrpxM52o9W/0TyCmxSK8KQYB+DUYZTCl
	AY4qBORSFTisRda10PDMY+5R4iuPQsg9ejNoGN0oAsC0KmmDTingntoX093fWxIcrj+l
	UCE5EExAVjAxNtM0FNgYMtoLw/XQgmXjT6fiMaAgJz92EOyw+9QhW40mYzZl3TtoVTnG
	xTq+RBQHqeDUbXoAayRw0mInjrPtl8dXWHZBcCLRPNTqRIel4A3i1BVADEN1KuHalqpG
	rDbDh9YTvY3a008v1wbhhbnxzKGt+Z/U9hhC072Jib9MCA5BUVcpEzd1sOxgmJ3eCboL
	/rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=NGS8p58llTH0j/JtmBIf8IcqQNNb3dOfgpZWMO+4qxc=;
	b=4gDnRSolC73LP/W3e+xY1px2A4LrYRjvUxnYVnbgSzGQWr1HXKv/fHKgf7W/O1lKFi
	j66SgSs7LLT7DjPbRqm2ioNbiSkgH0yXxYupsJPnebUlhnRM8/HQzBhmeCBbmvRYIrbm
	Fn+DxMyAmD8Awt8xEJshN7FBHuDa94VG/WhIGuwX+QqNslIkcdFaI8YKahiRkYxJM7s/
	FXHm85wDR5YizCnloak0ZPQsHs8xo1cYYwe4X041YLwszLFlUZVYZe44oDcHWDEEKz0y
	AElq2QEGw5OEg77sChs8Gkj2wVvqpgCJp1ESH1JclPhxdLvKisNCC2cUeI+2+NepYFgq
	Yz0A==
X-Gm-Message-State: AFqh2kogvHfvGq3IS0yuO+WVNhhpBIQ6FKhNT78s1Zt706vF1xjq74uX
	MApxnX3p5ACZpYXTTiT8dDweNeHD
X-Google-Smtp-Source: AMrXdXt9Y/gN9hPS5KrmX/hHe2LMLmsSTU6vMBSp1QqWDvsKO+j0a8BW8SZ67KSgwDQIo/CICV+jqA==
X-Received: by 2002:a17:906:a18c:b0:7c1:5467:39b1 with SMTP id
	s12-20020a170906a18c00b007c1546739b1mr70848155ejy.72.1673613318750;
	Fri, 13 Jan 2023 04:35:18 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	18-20020a170906201200b00846734faa9asm8386323ejo.164.2023.01.13.04.35.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:18 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:03 +0100
Message-Id: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [RESEND PATCH 0/3] DRBD file structure reorganization
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

VG8gbWFrZSBvdXIgbGl2ZXMgZWFzaWVyIHdoZW4gc2VuZGluZyBmdXR1cmUsIG1vcmUgY29tcGxl
eCBwYXRjaGVzLAp3ZSB3YW50IHRvIGFsaWduIHRoZSBmaWxlIHN0cnVjdHVyZSBhcyBiZXN0IGFz
IHBvc3NpYmxlIHdpdGggd2hhdCB3ZQpoYXZlIGluIHRoZSBvdXQtb2YtdHJlZSBtb2R1bGUuCgpD
aHJpc3RvcGggQsO2aG13YWxkZXIgKDMpOgogIGRyYmQ6IHNwbGl0IG9mZiBkcmJkX2J1aWxkdGFn
IGludG8gc2VwYXJhdGUgZmlsZQogIGRyYmQ6IGRyb3AgQVBJX1ZFUlNJT04gZGVmaW5lCiAgZHJi
ZDogc3BsaXQgb2ZmIGRyYmRfY29uZmlnIGludG8gc2VwYXJhdGUgZmlsZQoKIGRyaXZlcnMvYmxv
Y2svZHJiZC9NYWtlZmlsZSAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
YnVpbGR0YWcuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX2RlYnVnZnMuYyAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50Lmgg
ICAgICB8ICAxICsKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyAgICAgfCAyMCArLS0t
LS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcHJvYy5jICAgICB8ICAy
ICstCiBpbmNsdWRlL2xpbnV4L2RyYmQuaCAgICAgICAgICAgICAgIHwgIDcgLS0tLS0tLQogaW5j
bHVkZS9saW51eC9kcmJkX2NvbmZpZy5oICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKIGlu
Y2x1ZGUvbGludXgvZHJiZF9nZW5sX2FwaS5oICAgICAgfCAgMiArLQogOSBmaWxlcyBjaGFuZ2Vk
LCA0NCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9idWlsZHRhZy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9saW51eC9kcmJkX2NvbmZpZy5oCgoKYmFzZS1jb21taXQ6IGY1OTZkYTNlZmFmNDEzMGZm
NjFjZDAyOTU1ODg0NTgwOGRmOWJmOTkKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2
QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZHJiZC1kZXYK
