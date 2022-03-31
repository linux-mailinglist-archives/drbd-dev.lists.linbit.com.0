Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3B4EDACC
	for <lists+drbd-dev@lfdr.de>; Thu, 31 Mar 2022 15:46:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4DE1420835;
	Thu, 31 Mar 2022 15:45:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
	[209.85.218.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB0EE4205A5
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 15:45:58 +0200 (CEST)
Received: by mail-ej1-f48.google.com with SMTP id bg10so48226236ejb.4
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s/YUi6mCcjJfNHzYelacuYuRxwq2OVmqFdDTkQF6fA4=;
	b=HEVrrCaJT5HkNqz8wOQ5XL4tmcwa8NXw3F16ZsW0kiaE+kG+kya5uzynWCzIq15QBb
	zEjWjFg5wPus55PGqmm9QzZK6PWbnZZEOirBcQJUPsOEG8wRKR+DGkQsLKAofG3RWnf0
	LfNGwaM7ZTYQMqF4mME3FWXzy9ZPP09/uMT0wlPxZzXf9OUCj1BX9MAMar5WH5kSqQP9
	GyKF7OvUt4uiilKbmFh1vpS+xTvYzCBCcUJyAQ3NSTwywZ8kzM1dn2G3UrOeLoNPintX
	gB7x8piKyudEoEX9A+zetdGHlRM0tttjFrsmagbaTIruwVZyHZwTRYOYhtBJ5HoKUhIv
	78oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s/YUi6mCcjJfNHzYelacuYuRxwq2OVmqFdDTkQF6fA4=;
	b=c9O+GqEbEMLSzlZLN7Va6wer5TUoaGqK/u00Q9UfLNlZwQBrBCagEiGNI/WNOg2Us5
	uf1pHqz/f0Rf2B7VrU2ruzoQ43hhR8EWASun8zSuu45dCzf3Fu64NOMVaS133z5iHpGS
	izLjVei143s3uY2BBvfN6Pi9gJHczzVl7KDCaGZA4GKA0oOdblShKYRB0c6K2lB9QBrc
	aslB1omaWSFm7SqbsoYdcVSfnTItYObXm+ZKn5/3vNDOx+FH4b1YVklUz0lSQICd3fZa
	bJtXKgoLiUvmj6R/GsQvCewJqhfA2D2Q5+WURYq/2LjBNVDSifU0zP79gvLwxu34OWRy
	/V6A==
X-Gm-Message-State: AOAM531oH4pWjkg4QmKKRjcU/yphvv8yZh0WCacDK5yHixYHlQn3U2M5
	yqYcKA+dYZsU4jYF8/LDbljqUcTj
X-Google-Smtp-Source: ABdhPJzhQUSYxSwTyt2L3VUiLv2LZj/el5j6vlxbV2KYX/vtKDQC6JfK47m4Z8URiJIlslpkHEDH7Q==
X-Received: by 2002:a17:906:9f25:b0:6e1:205a:c47 with SMTP id
	fy37-20020a1709069f2500b006e1205a0c47mr4985936ejc.281.1648734358430;
	Thu, 31 Mar 2022 06:45:58 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	d1-20020a17090694c100b006da91d57e93sm9360168ejy.207.2022.03.31.06.45.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Mar 2022 06:45:57 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 31 Mar 2022 15:42:36 +0200
Message-Id: <20220331134236.776524-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] MAINTAINERS: add drbd co-maintainer
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

SW4gbGlnaHQgb2YgdGhlIHJlY2VudCBjb250cm92ZXJzeSBzdXJyb3VuZGluZyB0aGUgKGxhY2sg
b2YpCm1haW50ZW5hbmNlIG9mIHRoZSBpbi10cmVlIERSQkQgZHJpdmVyLCB3ZSBoYXZlIGRlY2lk
ZWQgdG8gYWRkIG15c2VsZgphcyBjby1tYWludGFpbmVyLiBUaGlzIGFsbG93cyB1cyB0byBiZXR0
ZXIgZGlzdHJpYnV0ZSB0aGUgd29ya2xvYWQgYW5kCnJlZHVjZSB0aGUgY2hhbmNlIG9mIHBhdGNo
ZXMgZ2V0dGluZyBsb3N0LgoKSSB3aWxsIGJlIGtlZXBpbmcgYW4gZXllIG9uIHRoZSBtYWlsaW5n
IGxpc3QgaW4gb3JkZXIgdG8gZW5zdXJlIHRoYXQgYWxsCnBhdGNoZXMgZ2V0IHRoZSBhdHRlbnRp
b24gdGhleSBuZWVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJp
c3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCA1M2RmNzU2NjBmMTYuLmIxZjVmMDM0YjJjZSAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTYwMzgsNiArNjAzOCw3IEBAIEY6CWRy
aXZlcnMvc2NzaS9kcHQvCiBEUkJEIERSSVZFUgogTToJUGhpbGlwcCBSZWlzbmVyIDxwaGlsaXBw
LnJlaXNuZXJAbGluYml0LmNvbT4KIE06CUxhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0Bs
aW5iaXQuY29tPgorTToJQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KIEw6CWRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KIFM6CVN1cHBvcnRl
ZAogVzoJaHR0cDovL3d3dy5kcmJkLm9yZwotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1k
ZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kcmJkLWRldgo=
