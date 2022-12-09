Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027F64845A
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:58:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA8CB4252DB;
	Fri,  9 Dec 2022 15:58:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 583BB420968
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:55:07 +0100 (CET)
Received: by mail-ej1-f46.google.com with SMTP id n21so12045413ejb.9
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=NGS8p58llTH0j/JtmBIf8IcqQNNb3dOfgpZWMO+4qxc=;
	b=ZKM+8vmyIyGnqJGMg1PLrEyjzHURIQ49nrR+4Cjb2tDfhRzSNwsUBEQ3CDMpzbTWlK
	wKbONKbccHcx7tdtrRxI5jqvo+xhjD+v6FvDo2UjxteCxErRQ8jOMzBOaQkbcMIJvv39
	wPgwsSPiQ+Ng/npOz16yJBEtmbjEy8VV+fP6aW9bqBRCwzBpOHK4zWUmd1AeFlqG26W4
	5ZYMibLNHHIudvWomfOP0bxVYcHEieLRIlFflAwXX/V/d5gmZ+Kvk3dyz0dTQo1rpCsd
	KCaqDixfrYloL6JFEoI9btVVm7ggxh3H4TGOiPkp+r4FjxgD+eGf5J6O9HXV1XMPDAj1
	pUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=NGS8p58llTH0j/JtmBIf8IcqQNNb3dOfgpZWMO+4qxc=;
	b=GypenNi+/50jkozgmMZieuj3zqL6m66sD9uot4ONWFFo839xQbL6HhTQ3MqcoXBbw3
	IJ0DPbjhZFTnpiYS3Ysf/UkB7Y2YJ2dPbaGnN7rRDq/moUaxL5pxpgURR+yguI1D5bOX
	R5BZKP8YlQBCpaL5FXoPhtK1Xje8Y1iMwe0KWm3nOyWejCklBG2vcwVSPiFEIk7zGMS6
	YT1bShv7VrHwBGe2BNc8qnPOtFR2o/nY3lUGTSN9L5ohHSNB6SytSyq/2eXIrZaddIDP
	6oZIml9JW3Rh4gySDrOmuWvdcX6HgFSCuX8Qr9oGkYHEuUnSgz3QUuC1lDhUnOP/O2ZG
	V1yw==
X-Gm-Message-State: ANoB5pm8Ak/6TkRoioZupJ+v1O01CyblbXv5wt70F5z9QgXvgcP3F+g8
	eCZ4yl6NDAIvwDE307kt8Gsynrz5
X-Google-Smtp-Source: AA0mqf7K+mE1v7tZQxx275XaT1evbeQtA2Yf7MlJpotalKJ4eJCBxIJUmePOtFfIcVRJx6XFbXGQGA==
X-Received: by 2002:a17:906:30d3:b0:78d:f454:ba10 with SMTP id
	b19-20020a17090630d300b0078df454ba10mr5517836ejb.15.1670597706776;
	Fri, 09 Dec 2022 06:55:06 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	l4-20020aa7c304000000b0046b1d63cfc1sm716856edq.88.2022.12.09.06.55.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:55:06 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:55:01 +0100
Message-Id: <20221209145504.2273072-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/3] DRBD file structure reorganization
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

VG8gbWFrZSBvdXIgbGl2ZXMgZWFzaWVyIHdoZW4gc2VuZGluZyBmdXR1cmUsIG1vcmUgY29tcGxl
eCBwYXRjaGVzLAp3ZSB3YW50IHRvIGFsaWduIHRoZSBmaWxlIHN0cnVjdHVyZSBhcyBiZXN0IGFz
IHBvc3NpYmxlIHdpdGggd2hhdCB3ZQpoYXZlIGluIHRoZSBvdXQtb2YtdHJlZSBtb2R1bGUuCgpD
aHJpc3RvcGggQsO2aG13YWxkZXIgKDMpOgogIGRyYmQ6IHNwbGl0IG9mZiBkcmJkX2J1aWxkdGFn
IGludG8gc2VwYXJhdGUgZmlsZQogIGRyYmQ6IGRyb3AgQVBJX1ZFUlNJT04gZGVmaW5lCiAgZHJi
ZDogc3BsaXQgb2ZmIGRyYmRfY29uZmlnIGludG8gc2VwYXJhdGUgZmlsZQoKIGRyaXZlcnMvYmxv
Y2svZHJiZC9NYWtlZmlsZSAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
YnVpbGR0YWcuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX2RlYnVnZnMuYyAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50Lmgg
ICAgICB8ICAxICsKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyAgICAgfCAyMCArLS0t
LS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcHJvYy5jICAgICB8ICAy
ICstCiBpbmNsdWRlL2xpbnV4L2RyYmQuaCAgICAgICAgICAgICAgIHwgIDcgLS0tLS0tLQogaW5j
bHVkZS9saW51eC9kcmJkX2NvbmZpZy5oICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKIGlu
Y2x1ZGUvbGludXgvZHJiZF9nZW5sX2FwaS5oICAgICAgfCAgMiArLQogOSBmaWxlcyBjaGFuZ2Vk
LCA0NCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9idWlsZHRhZy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9saW51eC9kcmJkX2NvbmZpZy5oCgoKYmFzZS1jb21taXQ6IGY1OTZkYTNlZmFmNDEzMGZm
NjFjZDAyOTU1ODg0NTgwOGRmOWJmOTkKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2
QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZHJiZC1kZXYK
