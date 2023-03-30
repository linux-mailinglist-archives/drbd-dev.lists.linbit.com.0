Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E86D0133
	for <lists+drbd-dev@lfdr.de>; Thu, 30 Mar 2023 12:28:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 657E24210CC;
	Thu, 30 Mar 2023 12:28:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 53FC84210CC
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 12:27:48 +0200 (CEST)
Received: by mail-wr1-f49.google.com with SMTP id r29so18503581wra.13
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1680172068;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=MxuugpcQ76BXjko3+ER6Q6ni4tgUxDBWpukRzkNP/mE=;
	b=7oMlBfhkg3pXtjNkNKYK6xQ5A2jpHJggTmkgMODtT7kSBNGVCxmeCyo3f8bPkJOPn4
	0PXmt7Nn2UD3UwmgD8kZExkVBgJmLw9oTCueb6virrw+Uo6A4SmCbAP9tZRdahLOn87m
	egOdqioJ5oC3ulBwib1UMyYTtdGcbR31ydt3Ck+hVsuvTwdajoJH02gNY34f6NLHVNNC
	c6T/5JrRMykYICRQLEHdj+Q2fxG1k8lxg9K+KHeh4uxgrpJgdnwzwh8oCBRUdhtO/Qca
	TCZxFaEaqvNeFDwrcs48ZxSGos0pKgSFF791YP5ZBgnkfkiVMyUoU62gpy9hpg25dbN2
	GFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1680172068;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=MxuugpcQ76BXjko3+ER6Q6ni4tgUxDBWpukRzkNP/mE=;
	b=Tx4z103eX3t8vz8ImMgsx4PHqZf8r2QqCBLuQCF3NN6C8S5/VKblvCy+Hq4AW9ae7j
	CxwLyQMuPTF4BMOKlUa2d150L6EikcIzZ8QVf0AG7en7s4Qbt3bdVrrdt/ALjGsnWQmc
	vhpEI/wSqXEFjked1Fhb88VlVpIbJcS9/rMmnJ+n1rZdnU/FU6SohhisNFXITZXCM7Xk
	74LmLAn3FyCLNcj3+I4nU9YFkD2HlREIz/BZzcBHJhG0HYBYWGACKr69oH7EkRo0Pmv+
	0mA1L25Ro/Rgn1+ZxOpAXec2pGwmVWHcx2pBdCLRr+UoqNDBSjDr8LBUVxtsFzD9MjBD
	Gj2Q==
X-Gm-Message-State: AAQBX9cd8SiEXkrn4wHskpiLNy+GLJXZALif2f+xKD5q44+wRqwwLaMa
	UZHAAy46pHZT9hATqcZwmNBC1vhS
X-Google-Smtp-Source: AKy350bXSIQSFZjlrygoaqORkCmoTaW/pnX4rfr6TDOOG/AZ6erorXitgDUp/xfzRz63wfamI/Gf0g==
X-Received: by 2002:a5d:4688:0:b0:2c8:b9cb:885e with SMTP id
	u8-20020a5d4688000000b002c8b9cb885emr16950780wrq.24.1680172068590;
	Thu, 30 Mar 2023 03:27:48 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	s11-20020adff80b000000b002d6f285c0a2sm26352514wrp.42.2023.03.30.03.27.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Mar 2023 03:27:48 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 12:27:38 +0200
Message-Id: <20230330102744.2128122-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
References: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v3 1/7] genetlink: make _genl_cmd_to_str static
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

UHJpbWFyaWx5IHRvIHNpbGVuY2Ugd2FybmluZ3MgbGlrZToKd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciAneHh4X2dlbmxfY21kX3RvX3N0cicgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13
YWxkZXJAbGluYml0LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2dlbmxfbWFnaWNfZnVuYy5oIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9nZW5sX21hZ2ljX2Z1bmMuaCBiL2luY2x1ZGUvbGludXgv
Z2VubF9tYWdpY19mdW5jLmgKaW5kZXggNGE0YjM4NzE4MWFkLi4yOTg0YjBjYjI0YjEgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvZ2VubF9tYWdpY19mdW5jLmgKKysrIGIvaW5jbHVkZS9saW51
eC9nZW5sX21hZ2ljX2Z1bmMuaApAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyBpbnQgc19uYW1l
ICMjIF9mcm9tX2F0dHJzX2Zvcl9jaGFuZ2Uoc3RydWN0IHNfbmFtZSAqcywJCVwKICAqIE1hZ2lj
OiBkZWZpbmUgb3AgbnVtYmVyIHRvIG9wIG5hbWUgbWFwcGluZwkJCQl7e3sxCiAgKgkJCQkJCQkJ
CXt7ezIKICAqLwotY29uc3QgY2hhciAqQ09OQ0FUXyhHRU5MX01BR0lDX0ZBTUlMWSwgX2dlbmxf
Y21kX3RvX3N0cikoX191OCBjbWQpCitzdGF0aWMgY29uc3QgY2hhciAqQ09OQ0FUXyhHRU5MX01B
R0lDX0ZBTUlMWSwgX2dlbmxfY21kX3RvX3N0cikoX191OCBjbWQpCiB7CiAJc3dpdGNoIChjbWQp
IHsKICN1bmRlZiBHRU5MX29wCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
