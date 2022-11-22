Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C478E633DEE
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 14:43:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4EC314252C4;
	Tue, 22 Nov 2022 14:43:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C61184252B7
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 14:43:09 +0100 (CET)
Received: by mail-wr1-f43.google.com with SMTP id cl5so24783481wrb.9
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=aKWA+AP/j4No4bfih7dsLGLYEDSONTbhMU2EZnn42zY=;
	b=yXqcBlksNnAzv0JPWlfp4srNfOhY8LdfdyUH6IMUrCMEgBmllXo1rkX45wgp8bEyPn
	o8ZDOeQQWwfFcchSgMN2v/yoREFBb5mk5cZKlSvgr9G2bHzEJPK2C2Shly8AlYNQzPIZ
	tGFZxm+Hr6bZzvic10oX82/fbGRTgUiLr8j2zz9tOxRkl+n/T2TVumlxlbXW9IcDT9+y
	m/Q7WWyJlkk6fpEHUeJUH6ixlNsCx8eCN2LaSbFmUnW455OcLSLiBSLit2flL0IzhgUr
	jZfeYc2AmokRQ6JFxZWYiu46OczuCtDIIQ9DWeS7ZZET2H8ZVybDb4vdLbQjiHa9jNKY
	Pciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=aKWA+AP/j4No4bfih7dsLGLYEDSONTbhMU2EZnn42zY=;
	b=p9yQEBLHoljZqXJeSlSf6kEPMyJ6LmyW7kfCOXQeYe4KSZxmK+gc9cc7Faf53zXaPD
	EXk4ic0tS3L5Too2YimxQ+e9sfM+qRQcop53DlmzWPhxZNH/8y7ZG898p0CrtghuD8Ee
	ntNYjX3Es82egv3yVPWzm43acZ33KFMYezaH1oB8RKz0ZpPj9G4vUuzW7DQNy8eHPlff
	2gqxtUDWLdJGMzQgS+O+DUng5EJz31GUcumt1I1NJ5vwyDTb/PSwSTw4KULFAnpTA0VK
	Uiyy01uSePgWrg5nn8CT9Tgjcc1OAW2z2mYkIUPNRwGyE+5vWbURtXh9AN7gxBhz0bUm
	CJPA==
X-Gm-Message-State: ANoB5pkTxRVktDeVslnHa+qHwFvdLpckcs2+XQ0VBUiQeYOfsnN+O5LW
	2OsIOtPkAkf6aiGTlMO2mCU4KWbf
X-Google-Smtp-Source: AA0mqf4wL76N4ZHZjvU2VZRB4kqJFOiavA4tPlcNIaqg/Z8JbxDOHK1GZZE8Q6cTqcXM4fihVgKIeQ==
X-Received: by 2002:a05:6000:1148:b0:236:71cd:1a71 with SMTP id
	d8-20020a056000114800b0023671cd1a71mr14335072wrx.712.1669124589239;
	Tue, 22 Nov 2022 05:43:09 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	p6-20020a1c5446000000b003b47e75b401sm21437729wmi.37.2022.11.22.05.43.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Nov 2022 05:43:08 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Nov 2022 14:42:57 +0100
Message-Id: <20221122134301.69258-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/4] lru_cache improvements,
	DRBD license identifiers
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

SGVyZSBhcmUgc29tZSBpbXByb3ZlbWVudHMgdG8gdGhlIGxydV9jYWNoZTsgbW9zdGx5IGp1c3Qg
Y2xlYW51cHMgdGhhdAp3ZSBtaXNzZWQgdG8gc2VuZCB1cHN0cmVhbSBvdmVyIHRoZSB5ZWFycy4K
ClRoZSBsYXN0IHBhdGNoIG1ha2VzIHRoZSBTUERYIGxpY2Vuc2UgaGVhZGVycyBpbiBEUkJEIGNv
bnNpc3RlbnQgc28KdGhhdCB0aGV5IGFsbCByZXByZXNlbnQgR1BMIDIuMC4KCkNocmlzdG9waCBC
w7ZobXdhbGRlciAoMik6CiAgbHJ1X2NhY2hlOiByZW1vdmUgY29tcGlsZWQgb3V0IGNvZGUKICBk
cmJkOiB1c2UgY29uc2lzdGVudCBsaWNlbnNlCgpKb2VsIENvbGxlZGdlICgxKToKICBscnVfY2Fj
aGU6IHJlbW92ZSB1bnVzZWQgbGNfcHJpdmF0ZSwgbGNfc2V0LCBsY19pbmRleF9vZgoKTGFycyBF
bGxlbmJlcmcgKDEpOgogIGxydV9jYWNoZTogdXNlIGF0b21pYyBvcGVyYXRpb25zIHdoZW4gYWNj
ZXNzaW5nIGxjLT5mbGFncywgYWx3YXlzCgogZHJpdmVycy9ibG9jay9kcmJkL0tjb25maWcgICAg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL01ha2VmaWxlICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYWN0bG9nLmMgICAgICAgfCAgMiArLQog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0bWFwLmMgICAgICAgfCAgMiArLQogZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfZGVidWdmcy5jICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfZGVidWdmcy5oICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50
LmggICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50ZXJ2YWwuYyAg
ICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50ZXJ2YWwuaCAgICAgfCAgMiAr
LQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbmwuYyAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbmxhLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bmxhLmggICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcHJvYy5jICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcHJvdG9jb2wuaCAgICAgfCAg
MiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyAgICAgfCAgMiArLQogZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfcmVxLmggICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfc3RhdGUuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGUu
aCAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGVfY2hhbmdlLmgg
fCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RyaW5ncy5jICAgICAgfCAgMiArLQog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RyaW5ncy5oICAgICAgfCAgMiArLQogZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfdmxpLmggICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfd29ya2VyLmMgICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC9scnVfY2FjaGUuaCAg
ICAgICAgICAgICAgfCAgMyAtLQogbGliL2xydV9jYWNoZS5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCA1OSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMjcgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKSwgODUgZGVsZXRpb25zKC0pCgotLSAKMi4zOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QK
ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kcmJkLWRldgo=
