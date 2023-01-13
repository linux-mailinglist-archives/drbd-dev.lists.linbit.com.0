Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DC669782
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:39:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1670B42237E;
	Fri, 13 Jan 2023 13:39:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD0A4422113
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:47 +0100 (CET)
Received: by mail-ej1-f47.google.com with SMTP id u19so51949304ejm.8
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=N1ZPBPraqcCSXLcbBqEiTH4593Z8hkjnTNKrVJO6nsc=;
	b=H1cWTLNMFyabZxRRgStGWeUzanvjp0Bj18ZcRAus/5m28S6QpN3yI1JV+uWc+YzPfU
	IyhyKcRkDRynH5pTc8H99VKS4vSpQywBAL8oVCIkkl6miPByqCFRIWYcxiCArTI5FwM+
	zVEZ40O4VzfAFqpdDexxjWxp6DOvibzhkqNhNqnamU3SWC/y7bIh2q0RWNBzeDEeyYPl
	S9N91Mv8T9e5MO9p88rokudwIsO/OJrHscaNspDv743X4ILM+GEEOAuf25tVuu0pMqL3
	eddMnTZdYDp42Lp4tYh3lLDK9SUdWuoN6Nfc4rRnAhnAeD8bux39C7jc8O+618+2W0Uw
	YTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=N1ZPBPraqcCSXLcbBqEiTH4593Z8hkjnTNKrVJO6nsc=;
	b=GYod7+rDCaeE0CMYb1Up/KYzq8CgpbyuHpU2xPtJWipOfDVFsLP1hjxelU+GhWlwaL
	y1uRrqKnr9PObKvKT4K7mfMZ9VYZzfPEGFEy47KD0IzZ1+6gkukQ+gHHq4pIW+4LoHMe
	IoH240V+wbjNn41q55/pc5H5wocPHh4MqSHtL31jFT6GadWJ3xwTWZakkzQlzoCjrzrr
	NvmGFfP+WPRnzHTB6uJrmkHigdX/36KNS1OW0K9bmlbg6xoF3VrJHWSnwpVfs2JEqnwI
	YSc0hwt+nHfWYK4g++CTm3i1a8L6sNLufcM05rGg4ySxoDeIigLgxIxnbWWkjRtRu2Rt
	VbTg==
X-Gm-Message-State: AFqh2kopqgPtbmJVOmdYkrthD1Ld56B4C6LnmrWwxxqG8wxBo45Js/AQ
	APDv62epuPeP+Nu3BZMeO9pNcXjB
X-Google-Smtp-Source: AMrXdXtMtHzH0ab2fylDfJ3FwmJBMxwWgMb80CrapVMEh3PCsXJ3VEY9ljT7Bfa44WICBObQntdf+w==
X-Received: by 2002:a17:906:838b:b0:851:97ca:7fc9 with SMTP id
	p11-20020a170906838b00b0085197ca7fc9mr14761111ejx.40.1673613347524;
	Fri, 13 Jan 2023 04:35:47 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:47 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:36 +0100
Message-Id: <20230113123538.144276-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 6/8] MAINTAINERS: add drbd headers
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VA
bGluYml0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA1
OTVkNTllZWM3ZWEuLjgzYjZmM2E5N2NmNiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIv
TUFJTlRBSU5FUlMKQEAgLTYzNDksNiArNjM0OSw3IEBAIFQ6CWdpdCBnaXQ6Ly9naXQubGluYml0
LmNvbS9saW51eC1kcmJkLmdpdAogVDoJZ2l0IGdpdDovL2dpdC5saW5iaXQuY29tL2RyYmQtOC40
LmdpdAogRjoJRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9ibG9ja2Rldi8KIEY6CWRyaXZlcnMv
YmxvY2svZHJiZC8KK0Y6CWluY2x1ZGUvbGludXgvZHJiZCoKIEY6CWxpYi9scnVfY2FjaGUuYwog
CiBEUklWRVIgQ09NUE9ORU5UIEZSQU1FV09SSwotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJi
ZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kcmJkLWRldgo=
