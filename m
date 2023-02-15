Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CC6980E0
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Feb 2023 17:32:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C47DB42177E;
	Wed, 15 Feb 2023 17:32:09 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C826421740
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 17:32:08 +0100 (CET)
Received: by mail-wr1-f51.google.com with SMTP id h16so19738694wrz.12
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=kVN86nOOyYYar4Mdb1dt7pims1f6cgmu15fTfzFSsDY=;
	b=vAkMmTWBai0DK5yuVBZWooHSqXvGdCA6ytAm/9kEV5E3Js1I+xJYb4iBYu5V8MS2HL
	0N8rE9RhOXMygf604uy0SC3/eVRIkARlrj6lT8LZWOqsUsHcizRQdc1FoBiU4Xf2JB7j
	s0jvvU77qqb6+3JAbVjgRn0nNg01J5xX+L06umCgkJWtv3yauSX3LI8Orx2/df3jRdKq
	yxi2ntvd8tVB9+Lc/2zikP7ZPFMYhxrHAoTEqT7MnGQaJhSHDx3j+MICvbXQQJfuDteJ
	V/wVabwBSayyi+OCZlsGlfw6m3HFKwHKqUEXcpnrCjUXp1CDw62sSLv6xXtI+YwUIwpd
	zEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=kVN86nOOyYYar4Mdb1dt7pims1f6cgmu15fTfzFSsDY=;
	b=gVo2KGXHwz2RqIWODU1pMH+3BXeRtSefIFDuZr6DMbZxaxX8CDNZ6DQ6ygEkBNsQlN
	Q0Y//12ckUiN5LKCifBt5xxxpHwuCNyROUYtXPdjZwZTdgmUlz8aDWdmQktZQ8g0lA+r
	GV9zgYvBpByT1Yl5U+xmJzcIGeqCTVTScrHpjQQPCNDGIlCbiObtiV6/2vHRsPOYYjdD
	E2fp1D67vEZ3fg5My0ZI5eJKEatzWUjwk8dRZNJrxrdF/Wmo0O/m3nWeD59d0g/0XU6n
	XiMSHOry4JOeWDenFRJ7CybNe+CYOXGQkfOQlZ3QMakBaG6eGlqY8ncvkc1SRsbdlDkM
	+sPw==
X-Gm-Message-State: AO0yUKUxlwUGiMGSrFpJUj7kGsj3riWZtB9nG4qR7NJOpneKzqbkmw3y
	mvM7MqX47jPFH6ieMLC7rUmfrjZA
X-Google-Smtp-Source: AK7set8VMnRhrcgZzx+HKlf2UsCXmy5ooqQn+wMK6A6bWDl241bW1oacnKZE6ggvSa+57ZayqV3jTQ==
X-Received: by 2002:a5d:5502:0:b0:2c5:5847:390e with SMTP id
	b2-20020a5d5502000000b002c55847390emr2002643wrv.68.1676478727666;
	Wed, 15 Feb 2023 08:32:07 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	n4-20020a5d67c4000000b002c56287bd2csm4865055wrw.114.2023.02.15.08.32.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Feb 2023 08:32:07 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 15 Feb 2023 17:31:57 +0100
Message-Id: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/7] Assorted DRBD refactoring
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
dHVyZQp1cHN0cmVhbWluZyB3b3JrLgoKQW5kcmVhcyBHcnVlbmJhY2hlciAoMyk6CiAgZHJiZDog
UmlwIG91dCB0aGUgRVJSX0lGX0NOVF9JU19ORUdBVElWRSBtYWNybwogIGRyYmQ6IEFkZCBwZWVy
IGRldmljZSBwYXJhbWV0ZXIgdG8gd2hvbGUtYml0bWFwIEkvTyBoYW5kbGVycwogIGRyYmQ6IElO
Rk9fYm1feGZlcl9zdGF0cygpOiBQYXNzIGEgcGVlciBkZXZpY2UgYXJndW1lbnQKCkNocmlzdG9w
aCBCw7ZobXdhbGRlciAoNCk6CiAgZHJiZDogZHJiZF91dWlkX2NvbXBhcmU6IHBhc3MgYSBwZWVy
X2RldmljZQogIGRyYmQ6IHBhc3MgYSBwZWVyX2RldmljZSB0byBtb3JlIGJpdG1hcCBmdW5jdGlv
bnMKICBkcmJkOiBwYXNzIGRyYmRfcGVlcl9kZXZpY2UgdG8gX19yZXFfbW9kCiAgZHJiZDogUGFz
cyBhIHBlZXIgZGV2aWNlIHRvIHRoZSByZXN5bmMgYW5kIG9ubGluZSB2ZXJpZnkgZnVuY3Rpb25z
CgogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYWN0bG9nLmMgICB8ICAxMyArKy0tCiBkcml2ZXJz
L2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYyAgIHwgIDEzICsrKy0KIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX2ludC5oICAgICAgfCAxMTkgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyAgICAgfCAgNzIgKysrKysrKysrKy0tLS0tLS0K
IGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMgICAgICAgfCAgMTkgKysrLS0KIGRyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgfCAxMDIgKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMgICAgICB8ICAzMCArKysrKy0tLQogZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmggICAgICB8ICAxMSArKy0KIGRyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3N0YXRlLmMgICAgfCAgMjkgKysrKy0tLQogZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfd29ya2VyLmMgICB8IDExNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEwIGZpbGVz
IGNoYW5nZWQsIDI5MSBpbnNlcnRpb25zKCspLCAyMzEgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21t
aXQ6IGEwNjM3N2M1ZDAxZWVlYWE1MmFkOTc5YjYyYzNjNzJlZmNjM2VmZjAKLS0gCjIuMzkuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYg
bWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5i
aXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
