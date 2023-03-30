Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3D6D011E
	for <lists+drbd-dev@lfdr.de>; Thu, 30 Mar 2023 12:27:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 044F9421039;
	Thu, 30 Mar 2023 12:27:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3BBB42061C
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 12:27:48 +0200 (CEST)
Received: by mail-wr1-f45.google.com with SMTP id e18so18527865wra.9
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1680172068;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=yWMXJxxwrgkEjVmzs+eNT0Qowo5s/hOKaWMHuz+eeBs=;
	b=LGY8X9jeAZsnZqrd6iiPqgz3EBWUVGVtU/6yYhHJd3x+CarpXn+LOauB+5k1htFFGK
	S1m2MWwBgC6ku18i/0XzrPOHnGP06LqKayvzg9fbleyIgLTYMtHAhb3nfeH5sSUMxM2n
	aZqkg3b0powZjI62T1xZh0Xe9ONtMC5xir6g9eECyzZhkhpgXwg5lC8TW6JeBeT2oCHo
	994bF17n7JmrF48m6lLNg0XdHroyKcQHzKCkWNM0LiZD6L0/F+Ca+PSBUP6HStFtLTVG
	Uu65P1mMFxD0Wou5Fo0UJozsDqn3I2ZliMIBj58j5uADygw64Vv5IzPpLhNt49CMzCKL
	CRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1680172068;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=yWMXJxxwrgkEjVmzs+eNT0Qowo5s/hOKaWMHuz+eeBs=;
	b=nJLkuyzFFDXqNDD/0tldiItwgl+fgbdW1RkhUWXh6zgTFbwMtmEl8O57u4KFVdSWXS
	x+2wTxIjAP+vM2EHEg0s+1VqOcdr8nYef2/VEEqwlWKuoPcWcsFya+NC2lThWzSxuF0F
	+6O+KT1ynPfFthqOfWm+rHTtbfy0rHMt5E62jWMIqt4lJyMbQM1pay13ne3KQQUsqWOA
	JZ00w0uGeE1ijzRUEdy4XcBbluIUG/tTsmPLeFPHsq50Zd/3dDt+w7EyW6hKuZh7qsdX
	6DsSZLrvOSpx9gJ6xjd9mJwHaWdi2I+FApHBSpTBrV5SD/ifLw/iIM21P9HCqepJg1ct
	9Njg==
X-Gm-Message-State: AAQBX9cBz7lKqGZh1tOlUcZ3PVA7ZW/ZQKY1pvdIWMzIbwzi72UEsrpE
	BB+k7C7QAAUBQuDwp3kJrEniCgTZ
X-Google-Smtp-Source: AKy350ZkXk/QHbS/x0wXE8lWicCBIp7JnAIt4hFbdSQi3HExlmgprtZgJeKyinEKRT02pvO0Crje/A==
X-Received: by 2002:adf:fec2:0:b0:2d2:39d3:ce78 with SMTP id
	q2-20020adffec2000000b002d239d3ce78mr14390988wrs.10.1680172067889;
	Thu, 30 Mar 2023 03:27:47 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	s11-20020adff80b000000b002d6f285c0a2sm26352514wrp.42.2023.03.30.03.27.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Mar 2023 03:27:47 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 12:27:37 +0200
Message-Id: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v3 0/7] Assorted DRBD refactoring
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

QW5vdGhlciBzZXQgb2YgImJhY2twb3J0ZWQiIERSQkQgcmVmYWN0b3JpbmcgcGF0Y2hlcyB0byBi
cmluZyB0aGUKaW4tdHJlZSB2ZXJzaW9uIGNsb3NlciB0byBvdXQtb2YtdHJlZS4KClRoZXNlIGFy
ZSAoaG9wZWZ1bGx5KSBuby1vcHMsIHByZXR0eSBtdWNoIGp1c3QgcHJlcGFyYXRpb24gZm9yIGZ1
dHVyZQp1cHN0cmVhbWluZyB3b3JrLgoKQ2hhbmdlcyBzaW5jZSB2MjoKLSBSZWJhc2UgdG8gZm9y
LTYuNC9ibG9jawoKQW5kcmVhcyBHcnVlbmJhY2hlciAoMyk6CiAgZHJiZDogUmlwIG91dCB0aGUg
RVJSX0lGX0NOVF9JU19ORUdBVElWRSBtYWNybwogIGRyYmQ6IEFkZCBwZWVyIGRldmljZSBwYXJh
bWV0ZXIgdG8gd2hvbGUtYml0bWFwIEkvTyBoYW5kbGVycwogIGRyYmQ6IElORk9fYm1feGZlcl9z
dGF0cygpOiBQYXNzIGEgcGVlciBkZXZpY2UgYXJndW1lbnQKCkNocmlzdG9waCBCw7ZobXdhbGRl
ciAoNCk6CiAgZ2VuZXRsaW5rOiBtYWtlIF9nZW5sX2NtZF90b19zdHIgc3RhdGljCiAgZHJiZDog
ZHJiZF91dWlkX2NvbXBhcmU6IHBhc3MgYSBwZWVyX2RldmljZQogIGRyYmQ6IHBhc3MgZHJiZF9w
ZWVyX2RldmljZSB0byBfX3JlcV9tb2QKICBkcmJkOiBQYXNzIGEgcGVlciBkZXZpY2UgdG8gdGhl
IHJlc3luYyBhbmQgb25saW5lIHZlcmlmeSBmdW5jdGlvbnMKCiBkcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9hY3Rsb2cuYyAgIHwgIDEzICsrLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2JpdG1h
cC5jICAgfCAgMTMgKysrLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmggICAgICB8IDEy
MCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bWFpbi5jICAgICB8ICA3MiArKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfbmwuYyAgICAgICB8ICAxOSArKystLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2
ZXIuYyB8IDEwMiArKysrKysrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX3JlcS5jICAgICAgfCAgMzAgKysrKystLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Jl
cS5oICAgICAgfCAgMTEgKystCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jICAgIHwg
IDI5ICsrKystLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3dvcmtlci5jICAgfCAxMTQgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2dlbmxfbWFnaWNfZnVuYy5o
ICAgIHwgICAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAyOTMgaW5zZXJ0aW9ucygrKSwgMjMyIGRl
bGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiAwNjk2NTAzN2NlOTQyNTAwYzFjZTNhYTI5Y2EyMTcw
OTNhOWM1NzIwCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQu
Y29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
