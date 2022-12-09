Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48764844F
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:56:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A9044252CB;
	Fri,  9 Dec 2022 15:56:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F7604210C8
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:36 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id r26so3378838edc.10
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=N1ZPBPraqcCSXLcbBqEiTH4593Z8hkjnTNKrVJO6nsc=;
	b=cA94dZQenZJSd/HPwubzdsAVWL9KdO9O1Qo/Eakd4+PcL0EYhUnFp6LZ4Z5Yiq44Ts
	kIk20jFQg1VRnEblzwpnQ/d32eC6W3vdeer4rSpJfq4M8GRXwKq4ssx4ghVd8jx1YD+p
	C2x0fausQ5gxBdut+a+0XS5oiYYSgwNQilm+V2mMDhAxtTVEpGII1j3yeVyZWE2S/hfd
	9d1sYMc0pkCNaXhyjxT3SUsMh3h6dSyi/LLn0XlkNvj+AimVyhLXmFud1jJf1IiPG5Iz
	JjBCanRTRC+nb7XDkV4V07MrkTMCVY8OCJHJ9Iwhaaw4/MGx4OQwAE8eci9EwJC9SN9D
	7raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=N1ZPBPraqcCSXLcbBqEiTH4593Z8hkjnTNKrVJO6nsc=;
	b=Lg/lurXgxASCSTxL/+8SbHSzFIBorEK+cEI9WXbrzKhQUpJFTjaTrPUsW5XyicY00c
	OvZAKhC/fw3FVZ5IGDr11UX8rE2lJbTkuKGlh5JXiUCoqYcwFHdlKkIs3RvpQY0FfEzP
	/FL02rB2VI5a6RzINnHtj/C/WTW0fL7Rny0GjJi8NnNhW9xaWRZZ5uDKwoOujU+B44kS
	0aVErdF3OqAY2xna81DRiIpnjnQCTntchgaLpCKHENcF/ziks9q1cwmYBG6XTtwxrPn5
	bwJaa+ZuEHv16Hz5zfeIOjb8XjyL/MdsPuEQUD9AW7nb6wkAA2+9433FEvxhLax2abcp
	qp9g==
X-Gm-Message-State: ANoB5pmYcEuC5YLAUnnT4NX5NEA8i0seDDzr5FaEkY/nG9ufG3TdbIBD
	8aOXxEUch3RN/tjMn+AN16H9ql8+
X-Google-Smtp-Source: AA0mqf4grDFciVpw7S/dEZoa128AlSgEFPzlvhzLMA1gxp2edL4O/WpNrnUJ3+plM+y7TPO8OeT56g==
X-Received: by 2002:aa7:c9d0:0:b0:467:559e:5301 with SMTP id
	i16-20020aa7c9d0000000b00467559e5301mr5158338edt.7.1670597616464;
	Fri, 09 Dec 2022 06:53:36 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:36 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:25 +0100
Message-Id: <20221209145327.2272271-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
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
