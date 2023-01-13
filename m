Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E0942669766
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:36:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C1B90422148;
	Fri, 13 Jan 2023 13:36:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 803694205B8
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:21 +0100 (CET)
Received: by mail-ej1-f53.google.com with SMTP id fy8so51881229ejc.13
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Nr0DjBH1YEnasxrYesj7cvRVZfRH4rPEDs0TxXAHiSg=;
	b=kE3RfzlxtjPHuvjfFEhPWJMp54HpFpp1Vnho1/xXHfQgsziEBG2QO7MlogQAjNMV6k
	xJ+4oX/N3D5Y8RJztAPXEw+2kW+MOz2hCSCzzaxdYommNiVXrq3II4WsgJ+eoa+sbrWY
	zAv+tdure6XvQ6edN3+fg+QR3xaWJ7OkfBOK2xMCclcTpwFGHgdr+2l1ZyXOC05ZRbHL
	SSruhU9xk84XGBTJ9QrwziONSZ2puhBmY3SeolCq9KrNeDVnmMAaUnsjArptv7QfH05F
	HjUDn1+r5B30e9+xtqAOsU/zJh0hjlpmLgky0g0X2xSxcbIKwaoVTY3rFzf8LDLJXfDV
	qB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Nr0DjBH1YEnasxrYesj7cvRVZfRH4rPEDs0TxXAHiSg=;
	b=pzleD1oK9bAVA/DU7MOtxy3PLQY4WPv9Ec5Af7wPGS3jv+vc+HhDFgvJUkid15wxMU
	3/yP+XThkqL3IYPkLpATx+pQUdfsaemTf9PnGjGz0ZnvBxgcX6iXrQEcQtF0bEixjVc6
	ktHu5Tec4h8lnEGedPdSPOfs/IFj26cYMYTMjYRw35LZVzNtunHYOfYkMOAhHMryG8Bu
	2UKqlFttyVhpNpL/D4kB53PmFY3QcM11Suh/6/bbeQ2TI6svV9UIA4hpuxoDfRiT38E4
	8U98/C0EY6Nxh+cATmnhT7Ow7Rf+CgN7NGi6ox48b3t7y594Fodn12ID0ph0sc/o7si0
	MPwg==
X-Gm-Message-State: AFqh2kqlVvijtDot9uEB+ngA5hexPjKl2yF3JH3b9k+3WQQtDDm1moCZ
	EA91n98injJHNdaIZ4+4hmyTV/qf
X-Google-Smtp-Source: AMrXdXub5p+iGrNvx+NKgAL3VLKRz04ZYGHLuJRXqTeqrTZWvsOy/QeBj08JRCfb/ECCwDK4pMCFkg==
X-Received: by 2002:a17:906:494b:b0:862:e612:effe with SMTP id
	f11-20020a170906494b00b00862e612effemr8182025ejt.14.1673613321216;
	Fri, 13 Jan 2023 04:35:21 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	18-20020a170906201200b00846734faa9asm8386323ejo.164.2023.01.13.04.35.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:20 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:06 +0100
Message-Id: <20230113123506.144082-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
References: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/3] drbd: split off drbd_config into separate
	file
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

VG8gYmUgbW9yZSBzaW1pbGFyIHRvIHdoYXQgd2UgZG8gaW4gdGhlIG91dC1vZi10cmVlIG1vZHVs
ZSBhbmQgZWFzZSB0aGUKdXBzdHJlYW1pbmcgcHJvY2Vzcy4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+ClJldmll
d2VkLWJ5OiBKb2VsIENvbGxlZGdlIDxqb2VsLmNvbGxlZGdlQGxpbmJpdC5jb20+Ci0tLQogZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfYnVpbGR0YWcuYyB8ICAyICstCiBkcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9pbnQuaCAgICAgIHwgIDEgKwogaW5jbHVkZS9saW51eC9kcmJkLmggICAgICAgICAg
ICAgICB8ICA2IC0tLS0tLQogaW5jbHVkZS9saW51eC9kcmJkX2NvbmZpZy5oICAgICAgICB8IDE2
ICsrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2RyYmRfY29uZmln
LmgKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9idWlsZHRhZy5jIGIvZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfYnVpbGR0YWcuYwppbmRleCA5NTZhNGQ1YzMzOWIuLmNiMWFh
NjZkN2Q1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYnVpbGR0YWcuYwor
KysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9idWlsZHRhZy5jCkBAIC0xLDUgKzEsNSBAQAog
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQotI2luY2x1ZGUgPGxpbnV4
L2RyYmQuaD4KKyNpbmNsdWRlIDxsaW51eC9kcmJkX2NvbmZpZy5oPgogI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgogCiBjb25zdCBjaGFyICpkcmJkX2J1aWxkdGFnKHZvaWQpCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2ludC5oCmluZGV4IGVkY2UxZjdhYzJkYS4uZDg5YjdkMDNkNGM4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAorKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9p
bnQuaApAQCAtMzQsNiArMzQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3ByZWZldGNoLmg+CiAjaW5j
bHVkZSA8bGludXgvZHJiZF9nZW5sX2FwaS5oPgogI2luY2x1ZGUgPGxpbnV4L2RyYmQuaD4KKyNp
bmNsdWRlIDxsaW51eC9kcmJkX2NvbmZpZy5oPgogI2luY2x1ZGUgImRyYmRfc3RyaW5ncy5oIgog
I2luY2x1ZGUgImRyYmRfc3RhdGUuaCIKICNpbmNsdWRlICJkcmJkX3Byb3RvY29sLmgiCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2RyYmQuaCBiL2luY2x1ZGUvbGludXgvZHJiZC5oCmluZGV4
IGRmNjVhOGY1MjI4YS4uNTQ2OGEyMzk5ZDQ4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Ry
YmQuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RyYmQuaApAQCAtMzgsMTIgKzM4LDYgQEAKIAogI2Vu
ZGlmCiAKLWV4dGVybiBjb25zdCBjaGFyICpkcmJkX2J1aWxkdGFnKHZvaWQpOwotI2RlZmluZSBS
RUxfVkVSU0lPTiAiOC40LjExIgotI2RlZmluZSBQUk9fVkVSU0lPTl9NSU4gODYKLSNkZWZpbmUg
UFJPX1ZFUlNJT05fTUFYIDEwMQotCi0KIGVudW0gZHJiZF9pb19lcnJvcl9wIHsKIAlFUF9QQVNT
X09OLCAvKiBGSVhNRSBzaG91bGQgdGhlIGJldHRlciBiZSBuYW1lZCAiSWdub3JlIj8gKi8KIAlF
UF9DQUxMX0hFTFBFUiwKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZHJiZF9jb25maWcuaCBi
L2luY2x1ZGUvbGludXgvZHJiZF9jb25maWcuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLmQyMTUzNjVjNmJiMQotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvbGlu
dXgvZHJiZF9jb25maWcuaApAQCAtMCwwICsxLDE2IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5ICovCisvKgorICogZHJiZF9jb25maWcuaAorICogRFJCRCdzIGNv
bXBpbGUgdGltZSBjb25maWd1cmF0aW9uLgorICovCisKKyNpZm5kZWYgRFJCRF9DT05GSUdfSAor
I2RlZmluZSBEUkJEX0NPTkZJR19ICisKK2V4dGVybiBjb25zdCBjaGFyICpkcmJkX2J1aWxkdGFn
KHZvaWQpOworCisjZGVmaW5lIFJFTF9WRVJTSU9OICI4LjQuMTEiCisjZGVmaW5lIFBST19WRVJT
SU9OX01JTiA4NgorI2RlZmluZSBQUk9fVkVSU0lPTl9NQVggMTAxCisKKyNlbmRpZgotLSAKMi4z
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJk
LWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3Rz
LmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
