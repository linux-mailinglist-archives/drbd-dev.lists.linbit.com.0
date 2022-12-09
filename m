Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809E648440
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:54:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 747CD4210CD;
	Fri,  9 Dec 2022 15:54:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F47B42096B
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:33 +0100 (CET)
Received: by mail-ed1-f41.google.com with SMTP id z92so3425916ede.1
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=HcVlem0HZR7YKz5CwTwpHOGM7j8McIJNietyZfce8tM=;
	b=77ztn6yxYoQdI/YjNQ64stUrZKMYVjJNZx3RqQPwE5Wzgy2iNARTjl57kwyY9Zcf5v
	AoRy0cMdwuO3oXgyaDlqa4AO0FQSK0M/l5ILUynxqoovllneXCqvEsb3dQq/sF1bqG+0
	JDKKUch4nKy4Ckc+IkGNltsHt/14NWOSaDiKrHLI80U0yPjRxtNg1MJo/h8NYBZTKE8C
	0Y3c4Y3/0C7eLUMc15WErXKWHsHUP4MOMLoanzaXBXv991Quu3cx5lLBxhP6nHeJgAsu
	+zjMJS6eDVORei+1mDjWhF2h6MknRksnGeFhC7GR70deNL08vL680eWJaG7nF6IhyTlq
	PYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=HcVlem0HZR7YKz5CwTwpHOGM7j8McIJNietyZfce8tM=;
	b=UwXx2Q0OB8jL+fKw+KhJbvnrFMKpgqrvRdFLIwMH/nKy3H+bt0YMIhAYjG2AQRHXtB
	rKCLUsmE84e5+0hrN708VfhQjri3C3JV28mMtEIGAgNkW4w1xZeSS3yeA9jjMg6Cra5W
	dMk64xAy9SXzJGnF58y2g/5r4fLz4B22z3nMCr5JZX6oq6RrzwimZGZ8eeAigDHKCdGM
	H4+E6/QjCjOF5C4mYyn+18TWO2NPd9HoX0WJrsuGfDaQe82EQRL+KCPeKByHqiGMsUae
	2xSjeUt+6dbe1CxqwDkSwchVDK0XuIq+Ay1DX0VOf/9UcpZw7Dyj9fllYBlRqNe+vATT
	JPlg==
X-Gm-Message-State: ANoB5pmdpvltPRom8D4CzCyqGOR135yPaeyoZ/92zAsaFSPvhE6o8NHs
	q740tHIrrr6JPWfjXZ5XngwkmqnU
X-Google-Smtp-Source: AA0mqf4QBPxAoxCzOvfQ8ZV6Q8UrQRb+58nSkaX+fyojG9uAWnXpr9Q7MI6KTomuZ8maaIi8/DhqUw==
X-Received: by 2002:a05:6402:4501:b0:461:de81:d194 with SMTP id
	ez1-20020a056402450100b00461de81d194mr5113173edb.31.1670597613561;
	Fri, 09 Dec 2022 06:53:33 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:33 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:21 +0100
Message-Id: <20221209145327.2272271-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/8] drbd: fix DRBD_VOLUME_MAX 65535 -> 65534
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

RnJvbTogUm9iZXJ0IEFsdG5vZWRlciA8cm9iZXJ0LmFsdG5vZWRlckBsaW5iaXQuY29tPgoKVGhl
IHByb3RvY29sIHVzZXMgLTEgYXMgYSByZXNlcnZlZCB2YWx1ZSBmb3IKJ25vIHNwZWNpZmljIHZv
bHVtZScsIGFuZCBzaW5jZSB0aGUgcHJvdG9jb2wgZmllbGQKaXMgYSAxNiBiaXQgdW5zaWduZWQg
dmFsdWUsIC0xIGlzIGNvbnZlcnRlZCB0bwo2NTUzNS4gVGhlcmVmb3JlLCBsaW1pdCB0aGUgcmFu
Z2Ugb2YgdmFsaWQgdm9sdW1lCm51bWJlcnMgdG8gWzAsIDY1NTM0XS4KClNpZ25lZC1vZmYtYnk6
IFJvYmVydCBBbHRub2VkZXIgPHJvYmVydC5hbHRub2VkZXJAbGluYml0LmNvbT4KU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0
LmNvbT4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNv
bT4KLS0tCiBpbmNsdWRlL2xpbnV4L2RyYmRfbGltaXRzLmggfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2RyYmRfbGltaXRzLmggYi9pbmNsdWRlL2xpbnV4L2RyYmRfbGltaXRzLmgKaW5kZXggZDY0
MjcxY2NlY2U0Li4wNThmNzYwMGY3OWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZHJiZF9s
aW1pdHMuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RyYmRfbGltaXRzLmgKQEAgLTIxLDcgKzIxLDcg
QEAKICNkZWZpbmUgRFJCRF9NSU5PUl9DT1VOVF9ERUYgMzIKICNkZWZpbmUgRFJCRF9NSU5PUl9D
T1VOVF9TQ0FMRSAnMScKIAotI2RlZmluZSBEUkJEX1ZPTFVNRV9NQVggNjU1MzUKKyNkZWZpbmUg
RFJCRF9WT0xVTUVfTUFYIDY1NTM0CiAKICNkZWZpbmUgRFJCRF9ESUFMT0dfUkVGUkVTSF9NSU4g
MAogI2RlZmluZSBEUkJEX0RJQUxPR19SRUZSRVNIX01BWCA2MDAKLS0gCjIuMzguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGlu
ZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29t
L21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
