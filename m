Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D2669772
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:38:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 78ED7422200;
	Fri, 13 Jan 2023 13:38:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE70742210F
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:44 +0100 (CET)
Received: by mail-ej1-f44.google.com with SMTP id u9so52054859ejo.0
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=HcVlem0HZR7YKz5CwTwpHOGM7j8McIJNietyZfce8tM=;
	b=lG6G/hEiefVVw2KVntwXpYtJaFeZcpH/bmr8zyHNCudsGl5VmkDU4N+8sUHUREXchX
	9t4DexO2EUVb8fflnf450J/HAESsipmjohr0+8leLKzThOAy98UQ2LNsyLzog2q6Kzi+
	QVc7cJtKfrFOMAyGHpbwA7+OSX5P+PCXYau7IJ/hQGeeG8IpWzilFfaTpUp/ICcu55XU
	EWCiyQyNs3M3/+PLd/ykAbv6s4xWjuiggSTvES0cZ505UVSpnzqJxFikHe08w8as1LD7
	eZUOw5vgYoOmRVieRXXUIyiZkfFZ95VHB7frMXY1SD9V03Qlh0ffq17r7g+1O8AfcAJ8
	iNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=HcVlem0HZR7YKz5CwTwpHOGM7j8McIJNietyZfce8tM=;
	b=VjjTkVgs9WSgaA+NvUeRSFuns4HfHD3Yl32pLHiTg1pKDFEi82sN/BkAFkF3inaFFe
	gW6uUD4aK3lRP0LLSaOVcemrkWY2NtCuGGKxvuu8OSXktCzwBFKymBijNnEMYgA6iWN7
	4CpcZLFG6IttvSFD00XQgczuUH10ekwsQzk2AJv84NGQstezWD0U+wdCN5P4wKNwP+4F
	mtDBWbYa2yjZ2bPYPwXAIg5xZ/U6JEqVvShIQ+LPonY5/HsPc63kTaCHKPXksolP/uMm
	JUbFLfumPtQII7f4AS1HsaJYDKaLXi6DHzXvt+D7aQtwx9eOep4E8IofxBkgf9MHqNfd
	jXgw==
X-Gm-Message-State: AFqh2kpbX0tqMgofmef9En522z44AasAl7Cj4DxvcKbdE8OP1lwpOYqv
	VPkfWdVkzlKg+YVVhSR5QCWK247o
X-Google-Smtp-Source: AMrXdXvmEfVGE0E0aDpzmsg2EuQkWLIHv64IwT9jaTlSW7PkvawhNzp4GxxGZWti7I9S0phQqs5NJA==
X-Received: by 2002:a17:907:8b89:b0:7c1:6f86:eeb with SMTP id
	tb9-20020a1709078b8900b007c16f860eebmr66679431ejc.7.1673613344302;
	Fri, 13 Jan 2023 04:35:44 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:43 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:32 +0100
Message-Id: <20230113123538.144276-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
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
