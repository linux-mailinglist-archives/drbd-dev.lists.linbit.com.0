Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 319416A82D5
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Mar 2023 13:55:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7AD854210C8;
	Thu,  2 Mar 2023 13:55:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B69E34204BE
	for <drbd-dev@lists.linbit.com>; Thu,  2 Mar 2023 13:55:24 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id o15so64705576edr.13
	for <drbd-dev@lists.linbit.com>; Thu, 02 Mar 2023 04:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1677761724;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=jZgw50LCuKrnZIMnz0+4XFexCiqGPxROK8CODTa/Oy4=;
	b=GzfOcygfycPPjUjyHE9sLQv2L8G0lcgA08J/nQN++LQMU+gVOjO1CFZLsDsq0NOULA
	80rKUCwRNjD170l3SOsyh9HMJoWZCLEuSoku9ow5rayFbMrj8Cxz/xHEzJvZsnHixAWB
	dDiCdE83ON4HuC4tudrbuEoP4MS+Hl3st4a2xeaA+pugznYBYCLqgcmrHskhsxrRncS4
	f4Sw6ge7pgF6r2+Hi2TDzQlyRyh3ChiAx+dm+SAwtw/H6W/rd3e4gigXKchsAkNtZKvr
	NcP5XJuoq9q7/TEh9RLepKsGQzSV3wVqyOQ1nBRVOR1+3Ih8HiF4VaziVpAMkTGxFecr
	q/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1677761724;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=jZgw50LCuKrnZIMnz0+4XFexCiqGPxROK8CODTa/Oy4=;
	b=k+Ntbvxp0jBeNA0usz9S36UQ3T39MY2Su5NclkUCJUvNxDHqSkAb9N8eH21SRNPTDl
	kIhC/IQfRvOz0u19pqBgJ21HnXKBW2qq28Jp9PiQw0uk0ci9EBjdWzw+zOgeyV99XU0a
	1y9mBys4QIMmVz6vgR1QOUKjVe5mza2uCjQKMgu7U0VR4bD64OGMjLyABz0mS7BJz1rv
	StnDtaJROa4LSRvnJJADCpdxaSmBrEqU8taq9QC0mjE1HJIk+yMxFtufCD0aMy243Ao8
	yQ7If6ZxhvaeEzGf7hPPgOMqvnzh88b1dGQR9peb2Zi7EfvXBeTCIrultNzgLcMEyRNk
	yAwA==
X-Gm-Message-State: AO0yUKV25Cng4U+bHFHrRPWkK6E9mRtuARQE13vNe76K1q1XxFLDx41I
	iZyjewfSZHLZVawVzwYt25Ic183+
X-Google-Smtp-Source: AK7set8rm/kGgFWfUtgEBHPO0TIzJXFir8UyXV2ZEqsMcKwhBuRbPe0/rYsenCDFz6rWlfFPa7Eyag==
X-Received: by 2002:a05:6402:1016:b0:4ac:d973:bb2c with SMTP id
	c22-20020a056402101600b004acd973bb2cmr11266829edu.28.1677761723988;
	Thu, 02 Mar 2023 04:55:23 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a98-20020a509eeb000000b004ad601533a3sm6955034edf.55.2023.03.02.04.55.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Mar 2023 04:55:23 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  2 Mar 2023 13:54:38 +0100
Message-Id: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 0/7] Assorted DRBD refactoring
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
dHVyZQp1cHN0cmVhbWluZyB3b3JrLgoKQ2hhbmdlcyBzaW5jZSB2MToKLSBBZGRyZXNzIHNvbWUg
Y29tcGlsZXIgd2FybmluZ3MKLSBSZW9yZGVyL21lcmdlIHBhdGNoZXMgdG8gYXZvaWQgYnJlYWtp
bmcgY29tcGlsYXRpb24gYmV0d2VlbiBjb21taXRzCgpBbmRyZWFzIEdydWVuYmFjaGVyICgzKToK
ICBkcmJkOiBSaXAgb3V0IHRoZSBFUlJfSUZfQ05UX0lTX05FR0FUSVZFIG1hY3JvCiAgZHJiZDog
QWRkIHBlZXIgZGV2aWNlIHBhcmFtZXRlciB0byB3aG9sZS1iaXRtYXAgSS9PIGhhbmRsZXJzCiAg
ZHJiZDogSU5GT19ibV94ZmVyX3N0YXRzKCk6IFBhc3MgYSBwZWVyIGRldmljZSBhcmd1bWVudAoK
Q2hyaXN0b3BoIELDtmhtd2FsZGVyICg0KToKICBnZW5ldGxpbms6IG1ha2UgX2dlbmxfY21kX3Rv
X3N0ciBzdGF0aWMKICBkcmJkOiBkcmJkX3V1aWRfY29tcGFyZTogcGFzcyBhIHBlZXJfZGV2aWNl
CiAgZHJiZDogcGFzcyBkcmJkX3BlZXJfZGV2aWNlIHRvIF9fcmVxX21vZAogIGRyYmQ6IFBhc3Mg
YSBwZWVyIGRldmljZSB0byB0aGUgcmVzeW5jIGFuZCBvbmxpbmUgdmVyaWZ5IGZ1bmN0aW9ucwoK
IGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2FjdGxvZy5jICAgfCAgMTMgKystLQogZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfYml0bWFwLmMgICB8ICAxMyArKystCiBkcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9pbnQuaCAgICAgIHwgMTIwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiBkcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgIHwgIDcyICsrKysrKysrKystLS0tLS0tCiBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jICAgICAgIHwgIDE5ICsrKy0tCiBkcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwgMTAyICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMgICAgICB8ICAzMCArKysrKy0tLQogZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfcmVxLmggICAgICB8ICAxMSArKy0KIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX3N0YXRlLmMgICAgfCAgMjkgKysrKy0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
d29ya2VyLmMgICB8IDExNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGlu
dXgvZ2VubF9tYWdpY19mdW5jLmggICAgfCAgIDIgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDI5MyBp
bnNlcnRpb25zKCspLCAyMzIgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDMyNmFjMmM1MTMz
ZTVkYTdjY2RkMDhkNGY5YzU2MmYyMzIzMDIxYWEKLS0gCjIuMzkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
