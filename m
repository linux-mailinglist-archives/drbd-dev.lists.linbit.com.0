Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7363EEB9
	for <lists+drbd-dev@lfdr.de>; Thu,  1 Dec 2022 12:04:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C17E542177C;
	Thu,  1 Dec 2022 12:04:29 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F5074210DE
	for <drbd-dev@lists.linbit.com>; Thu,  1 Dec 2022 12:04:27 +0100 (CET)
Received: by mail-ej1-f41.google.com with SMTP id gu23so3282319ejb.10
	for <drbd-dev@lists.linbit.com>; Thu, 01 Dec 2022 03:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=bCSFONotMGlT5jcNSWA3wEw//+37lRPpQvu379eQdb4=;
	b=mky/H4kqev/SBa6soq1k+oMgOaV2tJ6fff0Qn4zByh6t4++4mdmoeRtyyf3dT0AGXh
	8qcdBXx/eU+yX2ubXovz++PON5OelriwP9No7rBn8afMyyq4glmQiIX/S4k8FEotVKNa
	tm5Ta4VNNWwL2Di8riPg+0yKi3AJntfpfgWvpOprnbKahJ/NZpIqhIm20ggN6r0EuxmC
	c0uM8xGx2bd7ZsNkzMYTihZTjhxs6FHLbzuzIFza+54tb64iXc/1ks7O2IfHtQ6zedtz
	bjZcNpxzIuMAiGBZ/+cNhUThlzgMlYueD6SJic/P2fmG9VN7zurkQCVwTEoN4AZ87+gY
	SvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=bCSFONotMGlT5jcNSWA3wEw//+37lRPpQvu379eQdb4=;
	b=Z2RIz0VMKjp8eTtbIcSsOaMFhVvxBP4xZXWOYc9mKw9qnq5akZyYaboQqeN9WL6sni
	nlT7y+9xMdMRBkg4iCYnOC48Ukdf8JzSNmRtsYNerMuHeUP9xbtkILaCF6cx0GccuK9F
	AGJAGRIwPlHQP+y60gAIKEfDsya0Ga8adVqHDEWEqso6kk2lBIi61vRHIbV9Y04WCqBM
	1Q5oNsbh5LBeyKpMlHqMGsFtRfZjqU6IOrtl16wVgnPOwdc+89Rlrr3k4J5wMMKCjEU9
	mVYvIcOKP8rjfzPJEsWi1zPkAOePYdoOeFfZMNpmc/ODy/6OVIodoFVVYhoP5q2yL1CK
	lZHw==
X-Gm-Message-State: ANoB5pm8EkahcxJQH658N5fAwvP4CMByhfFzNhq0u18iy8nzqRK0A3yS
	EPM/vYvyo8h5S7YIwclHSsrq3Neh
X-Google-Smtp-Source: AA0mqf5D3lvSWXlbNVxaPnrYe5tMWRFbul2ScpxDzKf3ljJWGch6rkuPwy1XuKM1ffPLdoJA/bIXmA==
X-Received: by 2002:a17:906:a198:b0:7b4:bc42:3b44 with SMTP id
	s24-20020a170906a19800b007b4bc423b44mr48503029ejy.101.1669892666946;
	Thu, 01 Dec 2022 03:04:26 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	f26-20020a056402161a00b00463a83ce063sm1576424edv.96.2022.12.01.03.04.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 01 Dec 2022 03:04:26 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  1 Dec 2022 12:03:45 +0100
Message-Id: <20221201110349.1282687-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/5] Backported DRBD printk/debug improvements
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

U29tZSBjaGFuZ2VzIHRvIERSQkQncyBsb2dnaW5nIGluZnJhc3RydWN0dXJlLCBiYWNrcG9ydGVk
IGZyb20gdGhlCm91dC1vZi10cmVlIG1vZHVsZS4KClNpbmNlIHRoZSB0d28gY29kZSBiYXNlcyBo
YXZlIGRpdmVyZ2VkIHNvIG11Y2gsIGl0IGlzIHRvdWdoIHRvIHByZXNlcnZlCmF1dGhvcnNoaXAg
aW5mb3JtYXRpb24gd2l0aG91dCAicHV0dGluZyB3b3JkcyBpbnRvIHNvbWVvbmUncyBtb3V0aCIu
IFNvCkkgZW5kZWQgdXAgdXNpbmcgT3JpZ2luYWxseS1mcm9tIHRhZ3MgdG8gdHJ5IGFuZCBlbmNv
ZGUgdGhlIG9yaWdpbmFsCmF1dGhvcnMgb2YgdGhlc2UgcGF0Y2hlcy4KCkNocmlzdG9waCBCw7Zo
bXdhbGRlciAoNSk6CiAgZHJiZDogdW5pZnkgaG93IGZhaWxlZCBhc3NlcnRpb25zIGFyZSBsb2dn
ZWQKICBkcmJkOiBzcGxpdCBwb2x5bW9ycGggcHJpbnRrIHRvIGl0cyBvd24gZmlsZQogIGRyYmQ6
IGludHJvZHVjZSBkeW5hbWljIGRlYnVnCiAgZHJiZDogaW50cm9kdWNlIGRyYmRfcmF0ZWxpbWl0
KCkKICBkcmJkOiBhZGQgY29udGV4dCBwYXJhbWV0ZXIgdG8gZXhwZWN0KCkgbWFjcm8KCiBkcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9hY3Rsb2cuYyAgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX2JpdG1hcC5jICAgICAgICAgICB8ICA2MCArKysrLS0tLS0KIGRyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX2ludC5oICAgICAgICAgICAgICB8ICA2OCArLS0tLS0tLS0tCiBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgICAgICAgICAgfCAgMTAgKy0KIGRyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX25sLmMgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfcG9seW1vcnBoX3ByaW50ay5oIHwgMTQxICsrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyAgICAgICAgIHwgIDE2ICst
LQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMgICAgICAgICAgICAgIHwgICA2ICstCiBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYyAgICAgICAgICAgfCAgMTIgKy0KIDkgZmls
ZXMgY2hhbmdlZCwgMTk5IGluc2VydGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9wb2x5bW9ycGhfcHJpbnRrLmgKCgpi
YXNlLWNvbW1pdDogYjRjMDQ4MmJmZTg5Y2Q2YzRmMDMwMzE0Yzg2YWFlMzU2NDJjNDRhNQotLSAK
Mi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xp
c3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
