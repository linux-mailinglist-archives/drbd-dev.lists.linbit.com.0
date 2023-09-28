Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D97ED7B1794
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Sep 2023 11:39:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 574B5426842;
	Thu, 28 Sep 2023 11:39:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CDD7426837
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 11:38:58 +0200 (CEST)
Received: by mail-wr1-f42.google.com with SMTP id
	ffacd0b85a97d-3248e90f032so172329f8f.1
	for <drbd-dev@lists.linbit.com>; Thu, 28 Sep 2023 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1695893938;
	x=1696498738; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=9DgaQdL1mkt6AjgMQAIJbcwnwZB2QgHQP1PAcp2gZrY=;
	b=X63x274anRo635ZsrFZRMXtaVy6IOrj2gXV6bGS6yNTLmbt78Br0mJlTZFWjLb+x9F
	tekvLm+3Acz50cjqX1tvaaEfU31r7XmaWt/2y3yEogM2NDlny9NzpDoEj5F77A2r5ASC
	VrAeqntywAiGxtUDJm2IDuITUQfsnMrU51a4Ov213PZJANCDimzKEaZNETWeIMYIKU7F
	gNDemDZOSSSm6qhJj02Z8l8cSM/f0J4bVq0U/bPKl6Pef9HqP/dF8PMw7zsl9KxZ6LCR
	fSlalGqI83TgtprNadf4btRF6EbpmvKbvy05jjkUmfSoNm2JP+7ozhf4X76Mv5OLS6a3
	BU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1695893938; x=1696498738;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=9DgaQdL1mkt6AjgMQAIJbcwnwZB2QgHQP1PAcp2gZrY=;
	b=k40jpe4qZkSnCdRYPPfa+3WVqAmQufrF/6WxsNWU5GykJ0lEd7CjEBhfx6RMCSQmUL
	mAj9dCtExGzL5oxZdyhqHcBKuCDMgbbY4XLa98K+oWo5GLMXQqChwhP0Q9MNgg+4XCoN
	LW5/62MOm4z7P5lhv2X43t0pctStQm+/X+wlF472vlfPTy5RRek+09vBXB0qB4dxMdYk
	FxydPECsxl4OHwnevvE/j8wylav1Hy7yPZnwPb52EpViKkt0x3Kks5Vlnhf4RqZqwc+j
	x+HebePnXbrFwtGMNW+SocaSV8z3LXL6NrXtjrBL599J+3Klv7usS+E63AbwGTBuOhLs
	u0wA==
X-Gm-Message-State: AOJu0YwhA+r5EwI905obK6L6PwhQPFY+hUL1iEIlM+sg2j8R4PD45Cgm
	nVVUtDCmIQxWq7/z90oCAchp3yb7
X-Google-Smtp-Source: AGHT+IFoFu//qWf+2YKVQsH9YQI2JLonYDwjIcCmCaPKPhTJZjW9JQmcHydqb1bvOIeqR+dHCuqbtQ==
X-Received: by 2002:adf:e78d:0:b0:317:ef76:b778 with SMTP id
	n13-20020adfe78d000000b00317ef76b778mr801971wrm.63.1695893938243;
	Thu, 28 Sep 2023 02:38:58 -0700 (PDT)
Received: from localhost.localdomain (213-225-13-130.nat.highway.a1.net.
	[213.225.13.130]) by smtp.gmail.com with ESMTPSA id
	f4-20020a5d50c4000000b0031fa870d4b3sm18931449wrt.60.2023.09.28.02.38.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Sep 2023 02:38:57 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 28 Sep 2023 11:38:47 +0200
Message-ID: <20230928093852.676786-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: Lars Ellenberg <lars@linbit.com>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/5] drbd: rename worker to sender
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

U29tZSBtb3JlIHJlZmFjdG9yaW5nIGNvbW1pdHMgZnJvbSBvdXQtb2YtdHJlZSBkcmJkLgpJbnRl
bmRlZCBmb3IgNi43LgoKQ2hyaXN0b3BoIELDtmhtd2FsZGVyICg1KToKICBkcmJkOiBSZW5hbWUg
cGVyLWNvbm5lY3Rpb24gIndvcmtlciIgdGhyZWFkIHRvICJzZW5kZXIiCiAgZHJiZDogQWRkIG5l
dyBwZXItcmVzb3VyY2UgIndvcmtlciIgdGhyZWFkCiAgZHJiZDogTW92ZSBjb25uZWN0aW9uIGlu
ZGVwZW5kZW50IHdvcmsgZnJvbSAic2VuZGVyIiB0byAid29ya2VyIgogIGRyYmQ6IEtlZXAgY29u
bmVjdGlvbiB0aHJlYWRzIHJ1bm5pbmcgd2hpbGUgY29ubmVjdGlvbiBpcyB1cCBvbmx5CiAgZHJi
ZDogR2V0IHJpZCBvZiBjb25uX3JlY29uZmlnX3N0YXJ0KCkgYW5kIGNvbm5fcmVjb25maWdfZG9u
ZSgpCgogZHJpdmVycy9ibG9jay9kcmJkL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oICAgICAgICAgICAgICAgICB8IDEyICsr
LS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyAgICAgICAgICAgICAgICB8IDIxICsr
Ky0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyAgICAgICAgICAgICAgICAgIHwgNDgg
KysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZXEuYyAgICAgICAgICAgICAg
ICAgfCAgNyArLQogLi4uL2RyYmQve2RyYmRfd29ya2VyLmMgPT4gZHJiZF9zZW5kZXIuY30gICAg
IHwgNjQgKysrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGUu
YyAgICAgICAgICAgICAgIHwgMzEgKystLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9z
dGF0ZS5oICAgICAgICAgICAgICAgfCAgMSAtCiA5IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlv
bnMoKyksIDkzIGRlbGV0aW9ucygtKQogcmVuYW1lIGRyaXZlcnMvYmxvY2svZHJiZC97ZHJiZF93
b3JrZXIuYyA9PiBkcmJkX3NlbmRlci5jfSAoOTclKQoKCmJhc2UtY29tbWl0OiBhYTUxMWZmODIx
OGIzZmIzMjgxODFmYmFhYzQ4YWE1ZTljNWM2ZDkzCi0tIAoyLjQxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApk
cmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RyYmQtZGV2Cg==
