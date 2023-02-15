Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FC6980FA
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Feb 2023 17:35:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0CC1420962;
	Wed, 15 Feb 2023 17:35:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 242F84220C2
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 17:32:10 +0100 (CET)
Received: by mail-wr1-f50.google.com with SMTP id k3so12127612wrv.5
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=6BasZu6xuBIzFaNEHpZKAtYYWJSU123Xrp8iZeT0pas=;
	b=jTRMDPe9oIhjVy3qb/6BYOlCgC3/r4/9UuwevbXB9OXIasHNIPHBXJQ4axGQ5lD320
	f+V0Mnd5XgujTQMQwtrc8BIVvu/HY8UtNftH1OvZDuT+PVY8s6lH39iyF5dphFnlaTjc
	Z4W8A3ou8RVosyxmm3SanmnCwtC8IaTJQg4MamNtQQrP2z+qZV3jXfr+iVNetypr1Yz6
	B3qyV+j0FmY2HNLk1d8kJPoYeGasxtDkDxwn7DLh/2ap9129vRHWn2HYNWZR/4cYmre1
	CjyHnfaPbNVXeFVglDLkNXTMH7IRzqYlDkSMWUmEcSfDJ+jhhSHiR0PI3u6k88bTb8p+
	B1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=6BasZu6xuBIzFaNEHpZKAtYYWJSU123Xrp8iZeT0pas=;
	b=EG8InNOAu9Ck1I/HKVTR7Wn0vquMNQmVJ8hlcaWO4qu+X6dtPBYAwH2Rkq2fuAuJgd
	LQyeQ/LECUw+qq+fqx6Dza3qZc7fHyixAQsSIZCQiFR0DM2Sdnd5SGB0OZxaGdffNayK
	vlUjm7TNuTbwQxgZr1LFjfbVOh+pVOGwCJlQHaSbeLgLftYhxSlF00J1+GIMbFJM7T5n
	BRq9tjN4CSoed9osIh9s26SDfccYi/1oKRgs4s1zYn9xTjxLenZ17hXXsc+0vHigUeJY
	Tkep/hx+BEhwhZCveqWVwv6XXH9UJcruXn3cyGz9kgujqiCnG4hMSbJsvmXATHoamVLU
	vRPw==
X-Gm-Message-State: AO0yUKUvgbQJ0TpLW+L52U0oCHId5yzWFnrXiBg9tk14Sf9ztrnTXllQ
	wHWuV9zVX9xLK99Ctr/N5KZJY3Sj
X-Google-Smtp-Source: AK7set+O7knUzFB7PVkwwvoa4040GbIdt1Us84ObAbwwUyxSRX8/Cf8gEcopeVUbO++2/ms1jz3pUg==
X-Received: by 2002:a5d:6142:0:b0:2c3:dbe0:58b8 with SMTP id
	y2-20020a5d6142000000b002c3dbe058b8mr2157277wrt.41.1676478730555;
	Wed, 15 Feb 2023 08:32:10 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	n4-20020a5d67c4000000b002c56287bd2csm4865055wrw.114.2023.02.15.08.32.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Feb 2023 08:32:10 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 15 Feb 2023 17:32:01 +0100
Message-Id: <20230215163204.2856631-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
References: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 4/7] drbd: drbd_uuid_compare: pass a peer_device
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
ZXJAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwg
OSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKaW5kZXggYWE4OTZkYjE3NjdkLi44NjA1
YjUxNTRhN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMK
KysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwpAQCAtMzIyNiwxMCArMzIy
NiwxMSBAQCBzdGF0aWMgdm9pZCBkcmJkX3V1aWRfZHVtcChzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRl
dmljZSwgY2hhciAqdGV4dCwgdTY0ICp1dWlkLAogLTEwOTYgICByZXF1aXJlcyBwcm90byA5Ngog
ICovCiAKLXN0YXRpYyBpbnQgZHJiZF91dWlkX2NvbXBhcmUoc3RydWN0IGRyYmRfZGV2aWNlICpj
b25zdCBkZXZpY2UsIGVudW0gZHJiZF9yb2xlIGNvbnN0IHBlZXJfcm9sZSwgaW50ICpydWxlX25y
KSBfX211c3RfaG9sZChsb2NhbCkKK3N0YXRpYyBpbnQgZHJiZF91dWlkX2NvbXBhcmUoc3RydWN0
IGRyYmRfcGVlcl9kZXZpY2UgKmNvbnN0IHBlZXJfZGV2aWNlLAorCQllbnVtIGRyYmRfcm9sZSBj
b25zdCBwZWVyX3JvbGUsIGludCAqcnVsZV9ucikgX19tdXN0X2hvbGQobG9jYWwpCiB7Ci0Jc3Ry
dWN0IGRyYmRfcGVlcl9kZXZpY2UgKmNvbnN0IHBlZXJfZGV2aWNlID0gZmlyc3RfcGVlcl9kZXZp
Y2UoZGV2aWNlKTsKLQlzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25zdCBjb25uZWN0aW9uID0g
cGVlcl9kZXZpY2UgPyBwZWVyX2RldmljZS0+Y29ubmVjdGlvbiA6IE5VTEw7CisJc3RydWN0IGRy
YmRfY29ubmVjdGlvbiAqY29uc3QgY29ubmVjdGlvbiA9IHBlZXJfZGV2aWNlLT5jb25uZWN0aW9u
OworCXN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlID0gcGVlcl9kZXZpY2UtPmRldmljZTsKIAl1
NjQgc2VsZiwgcGVlcjsKIAlpbnQgaSwgajsKIApAQCAtMzQ2NSw3ICszNDY2LDcgQEAgc3RhdGlj
IGVudW0gZHJiZF9jb25ucyBkcmJkX3N5bmNfaGFuZHNoYWtlKHN0cnVjdCBkcmJkX3BlZXJfZGV2
aWNlICpwZWVyX2RldmljZSwKIAlkcmJkX3V1aWRfZHVtcChkZXZpY2UsICJwZWVyIiwgZGV2aWNl
LT5wX3V1aWQsCiAJCSAgICAgICBkZXZpY2UtPnBfdXVpZFtVSV9TSVpFXSwgZGV2aWNlLT5wX3V1
aWRbVUlfRkxBR1NdKTsKIAotCWhnID0gZHJiZF91dWlkX2NvbXBhcmUoZGV2aWNlLCBwZWVyX3Jv
bGUsICZydWxlX25yKTsKKwloZyA9IGRyYmRfdXVpZF9jb21wYXJlKHBlZXJfZGV2aWNlLCBwZWVy
X3JvbGUsICZydWxlX25yKTsKIAlzcGluX3VubG9ja19pcnEoJmRldmljZS0+bGRldi0+bWQudXVp
ZF9sb2NrKTsKIAogCWRyYmRfaW5mbyhkZXZpY2UsICJ1dWlkX2NvbXBhcmUoKT0lZCBieSBydWxl
ICVkXG4iLCBoZywgcnVsZV9ucik7Ci0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBs
aXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RyYmQtZGV2Cg==
