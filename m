Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398A42800
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:17 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DC241045C30;
	Wed, 12 Jun 2019 15:50:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E50711028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:07:55 +0200 (CEST)
Received: by mail-it1-f171.google.com with SMTP id i21so4301321ita.5
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=wd6TbaxSgxtqvYp5B8KKPY+N+YcroNBQ5sOyyLqo17o=;
	b=ID05vH8W6mKaBATVKxFm5sPrMCIfL0trjo3xQmD0C9BmTK97Df0MlSFTZB0PZt7Kuu
	rUwONsaMPXnL44igNY6z7HcWFZEmrPsPBLa1tEtqx2nPdcdRZtQF6NyguWpG+ionGUVF
	GFC7eSNYFRZ9a0ZfqZyowXxNBYAIC73hliWeCMmXMcGYQ5Ms/uHZnCr4zEaJKlasTQNq
	IA4htcgjo+MoUT1lXuJBELBlqL8vB65qzP2G6hgddg/BqAQURs4KQ/zKwTe17Ej33qA3
	bEXJ0b8SGVEvBlTU5o2WyODk0pev84Vyvw7skb/5pjLp7EB6/qKzj8FgJjVSvyAelcaS
	m5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=wd6TbaxSgxtqvYp5B8KKPY+N+YcroNBQ5sOyyLqo17o=;
	b=jzG7nIVBLzDRK8Bsi/Z9CxINySkbYhv36Z8bWf44ALOuBJ1VjOicMGHgVIiMFvrT0s
	2Zy0GkOZfNEsF9jySyHB7xK3Uqv9CI3ud8LZrqekluwvB2YIhjhln0S7WhuSF5R+/+d/
	g/AnY7GkclKK53xIKaacLOHaJyO4bKbDRJpEh7gLnZSJ8Qxk/J9DWEZllwNqtaMf8r8g
	hNpzjENcoaI2iWL40RGJI+CkcwIjfR9kVtmlk7jjTUA43gyrNcHrCk2A+aPE3XV63+IR
	l8nMf0a2PQkVa+Y41Ry61WK/k3rStO49NlhP/O3BL7c+mBcF+qjViORV0isX3wFAtl9I
	Yglw==
X-Gm-Message-State: APjAAAV5ZLRqx8XQvgj6GmnT/LO7o7Dy5a8rux1GC7n+/tmRWtxuRwDn
	ZGUkSvbefMZxdSRP4LkT9UDaRzuJ
X-Google-Smtp-Source: APXvYqwWefAgEIsrnJgMxX7BZYGXFR0QKnm/+KzWFGmSmr+ACSZ+iBowVw+B8JclawI1wl6wiujIRw==
X-Received: by 2002:a24:688a:: with SMTP id v132mr25153670itb.31.1559750874522;
	Wed, 05 Jun 2019 09:07:54 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	x78sm1349607ita.44.2019.06.05.09.07.52
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:07:54 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <456e2172-20fa-7b9d-47db-466f41123571@gmail.com>
Date: Wed, 5 Jun 2019 10:07:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] Avoid compiler warning about non-bool in logical
	expression
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QXZvaWQgYSBjb21waWxlciB3YXJuaW5nOgogICAgZHJiZF9yZWNlaXZlci5jOjE2OTM6MTI6IHdh
cm5pbmc6IGxvZ2ljYWwg4oCYYW5k4oCZIGFwcGxpZWQgdG8gbm9uLWJvb2xlYW4gY29uc3RhbnQg
Wy1XbG9naWNhbC1vcF0KCmRpZmYgLS1naXQgYS9kcmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2RyYmQv
ZHJiZF9yZWNlaXZlci5jCkBAIC0xNjkwLDcgKzE2OTAsNyBAQCBuZXh0X2JpbzoKICAgICAgICAg
ICAgICAgIGJpby0+YmlfbmV4dCA9IE5VTEw7CgogICAgICAgICAgICAgICAgLyogc3RyaXAgb2Zm
IFJFUV9VTlBMVUcgdW5sZXNzIGl0IGlzIHRoZSBsYXN0IGJpbyAqLwotICAgICAgICAgICAgICAg
aWYgKGJpb3MgJiYgRFJCRF9SRVFfVU5QTFVHKQorICAgICAgICAgICAgICAgaWYgKGJpb3MgJiYg
KERSQkRfUkVRX1VOUExVRyAhPSAwKSkKICAgICAgICAgICAgICAgICAgICAgICAgYmlvLT5iaV9v
cGYgJj0gfkRSQkRfUkVRX1VOUExVRzsKICAgICAgICAgICAgICAgIGRyYmRfZ2VuZXJpY19tYWtl
X3JlcXVlc3QoZGV2aWNlLCBmYXVsdF90eXBlLCBiaW8pOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2
QGxpc3RzLmxpbmJpdC5jb20KaHR0cDovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kcmJkLWRldgo=
