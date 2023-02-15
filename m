Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB06980E8
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Feb 2023 17:32:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EE221422111;
	Wed, 15 Feb 2023 17:32:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0962C420962
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 17:32:08 +0100 (CET)
Received: by mail-wr1-f51.google.com with SMTP id o15so16448024wrc.9
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=4P+RPLywpWRpuXMP+b0VdhJHn8q4YXA5NPmEVVhViGs=;
	b=jqC05K0Ho1hrsMzWog/Vj2NDt/KsetoaPaLVtCxz5LWRqwpaJbDkCgR0g8sF0sGjKo
	uCbuTdUW/4rsEMTs7OIjJm7ohBX0hk31tg+XbF+cqPgfhxWZNJ69hqExsS8nIwOQXDWt
	eFQ+lFTiLo0zxr6utMc6wnU+1zEScQS57tqzr6BGtlYXiti66EA8yh+DW1PUZHOQOuxO
	rDY2jmOJlQ+TsSNPslo/bIZgOBC06YXqI+0LOQiz2gMcIh/ZAoOGA+a6IbPzNHFvZqvD
	hMLW3GEEm4LuKBcMKfC+4qABiFVsWF0/OSvv6Bfr7IrwiDDVU69rP1WE34J21UAJha4g
	9zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=4P+RPLywpWRpuXMP+b0VdhJHn8q4YXA5NPmEVVhViGs=;
	b=k5mE9gG8Snx8gOR5//Ojl8bvaMPBWMvafbPGJ8Z2c1ZIgLBNP9Jz5ZmC9n3F2JWgMa
	IiEpq5Z0Ns7y1urBQIYNGH5lDOuiTSkweme2UENoBO9M+DfoxHBfZ9Zx6TTSq7/kj8/8
	ibRfwNyY0FnuBlpqcIDucEpTA7JUmxdoIMJhRhDDs+zLbFsPKcU5fdBB7XjKB+AFBBE2
	QjdKsIpFK7oOZ6M455Q1Zth1rxSH5SoiniKVRcRSq7ESbkZucDP55IHdCMPX7E5ugvRm
	6jdiNZR80rZ+jfYzAPE+/f00offi02Jnbf4WFXO+COe6eAVYmMhm+JmM9nEQACNgP725
	km8Q==
X-Gm-Message-State: AO0yUKWELE3zfJtw86PDPSzPw46itaEAgl9ADgfAw+jt9JgPaXEIUaK/
	du1VBeGmBfJcLpym9ska19Dcw/1B
X-Google-Smtp-Source: AK7set8yo+nR05XUU5SfBkkgGGbdufdJY7xKV1xT+c09XYB0KRfUeRc0qhk+yTsPaKlRCYJ5bIN7Vg==
X-Received: by 2002:adf:ed07:0:b0:2c5:55c3:d18d with SMTP id
	a7-20020adfed07000000b002c555c3d18dmr1893102wro.9.1676478728423;
	Wed, 15 Feb 2023 08:32:08 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	n4-20020a5d67c4000000b002c56287bd2csm4865055wrw.114.2023.02.15.08.32.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Feb 2023 08:32:08 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 15 Feb 2023 17:31:58 +0100
Message-Id: <20230215163204.2856631-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
References: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/7] drbd: Rip out the ERR_IF_CNT_IS_NEGATIVE
	macro
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

RnJvbTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuQGxpbmJpdC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5AbGluYml0LmNvbT4KU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCB8IDM3ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50
LmggYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAppbmRleCBkODliN2QwM2Q0YzguLjc3
MjAyM2FjZTc0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKKysr
IGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKQEAgLTE5MTgsMTggKzE5MTgsMTQgQEAg
c3RhdGljIGlubGluZSB2b2lkIGluY19hcF9wZW5kaW5nKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2
aWNlKQogCWF0b21pY19pbmMoJmRldmljZS0+YXBfcGVuZGluZ19jbnQpOwogfQogCi0jZGVmaW5l
IEVSUl9JRl9DTlRfSVNfTkVHQVRJVkUod2hpY2gsIGZ1bmMsIGxpbmUpCQkJXAotCWlmIChhdG9t
aWNfcmVhZCgmZGV2aWNlLT53aGljaCkgPCAwKQkJCQlcCi0JCWRyYmRfZXJyKGRldmljZSwgImlu
ICVzOiVkOiAiICN3aGljaCAiID0gJWQgPCAwICFcbiIsCVwKLQkJCWZ1bmMsIGxpbmUsCQkJCQlc
Ci0JCQlhdG9taWNfcmVhZCgmZGV2aWNlLT53aGljaCkpCi0KLSNkZWZpbmUgZGVjX2FwX3BlbmRp
bmcoZGV2aWNlKSBfZGVjX2FwX3BlbmRpbmcoZGV2aWNlLCBfX2Z1bmNfXywgX19MSU5FX18pCi1z
dGF0aWMgaW5saW5lIHZvaWQgX2RlY19hcF9wZW5kaW5nKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2
aWNlLCBjb25zdCBjaGFyICpmdW5jLCBpbnQgbGluZSkKKyNkZWZpbmUgZGVjX2FwX3BlbmRpbmco
ZGV2aWNlKSAoKHZvaWQpZXhwZWN0KChkZXZpY2UpLCBfX2RlY19hcF9wZW5kaW5nKGRldmljZSkg
Pj0gMCkpCitzdGF0aWMgaW5saW5lIGludCBfX2RlY19hcF9wZW5kaW5nKHN0cnVjdCBkcmJkX2Rl
dmljZSAqZGV2aWNlKQogewotCWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCZkZXZpY2UtPmFwX3Bl
bmRpbmdfY250KSkKKwlpbnQgYXBfcGVuZGluZ19jbnQgPSBhdG9taWNfZGVjX3JldHVybigmZGV2
aWNlLT5hcF9wZW5kaW5nX2NudCk7CisKKwlpZiAoYXBfcGVuZGluZ19jbnQgPT0gMCkKIAkJd2Fr
ZV91cCgmZGV2aWNlLT5taXNjX3dhaXQpOwotCUVSUl9JRl9DTlRfSVNfTkVHQVRJVkUoYXBfcGVu
ZGluZ19jbnQsIGZ1bmMsIGxpbmUpOworCXJldHVybiBhcF9wZW5kaW5nX2NudDsKIH0KIAogLyog
Y291bnRzIGhvdyBtYW55IHJlc3luYy1yZWxhdGVkIGFuc3dlcnMgd2Ugc3RpbGwgZXhwZWN0IGZy
b20gdGhlIHBlZXIKQEAgLTE5NDMsMTEgKzE5MzksMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIGlu
Y19yc19wZW5kaW5nKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlKQogCWF0b21pY19pbmMoJmRl
dmljZS0+cnNfcGVuZGluZ19jbnQpOwogfQogCi0jZGVmaW5lIGRlY19yc19wZW5kaW5nKGRldmlj
ZSkgX2RlY19yc19wZW5kaW5nKGRldmljZSwgX19mdW5jX18sIF9fTElORV9fKQotc3RhdGljIGlu
bGluZSB2b2lkIF9kZWNfcnNfcGVuZGluZyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgY29u
c3QgY2hhciAqZnVuYywgaW50IGxpbmUpCisjZGVmaW5lIGRlY19yc19wZW5kaW5nKGRldmljZSkg
KCh2b2lkKWV4cGVjdCgoZGV2aWNlKSwgX19kZWNfcnNfcGVuZGluZyhkZXZpY2UpID49IDApKQor
c3RhdGljIGlubGluZSBpbnQgX19kZWNfcnNfcGVuZGluZyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRl
dmljZSkKIHsKLQlhdG9taWNfZGVjKCZkZXZpY2UtPnJzX3BlbmRpbmdfY250KTsKLQlFUlJfSUZf
Q05UX0lTX05FR0FUSVZFKHJzX3BlbmRpbmdfY250LCBmdW5jLCBsaW5lKTsKKwlyZXR1cm4gYXRv
bWljX2RlY19yZXR1cm4oJmRldmljZS0+cnNfcGVuZGluZ19jbnQpOwogfQogCiAvKiBjb3VudHMg
aG93IG1hbnkgYW5zd2VycyB3ZSBzdGlsbCBuZWVkIHRvIHNlbmQgdG8gdGhlIHBlZXIuCkBAIC0x
OTY0LDE4ICsxOTU5LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbmNfdW5hY2tlZChzdHJ1Y3Qg
ZHJiZF9kZXZpY2UgKmRldmljZSkKIAlhdG9taWNfaW5jKCZkZXZpY2UtPnVuYWNrZWRfY250KTsK
IH0KIAotI2RlZmluZSBkZWNfdW5hY2tlZChkZXZpY2UpIF9kZWNfdW5hY2tlZChkZXZpY2UsIF9f
ZnVuY19fLCBfX0xJTkVfXykKLXN0YXRpYyBpbmxpbmUgdm9pZCBfZGVjX3VuYWNrZWQoc3RydWN0
IGRyYmRfZGV2aWNlICpkZXZpY2UsIGNvbnN0IGNoYXIgKmZ1bmMsIGludCBsaW5lKQorI2RlZmlu
ZSBkZWNfdW5hY2tlZChkZXZpY2UpICgodm9pZClleHBlY3QoZGV2aWNlLCBfX2RlY191bmFja2Vk
KGRldmljZSkgPj0gMCkpCitzdGF0aWMgaW5saW5lIGludCBfX2RlY191bmFja2VkKHN0cnVjdCBk
cmJkX2RldmljZSAqZGV2aWNlKQogewotCWF0b21pY19kZWMoJmRldmljZS0+dW5hY2tlZF9jbnQp
OwotCUVSUl9JRl9DTlRfSVNfTkVHQVRJVkUodW5hY2tlZF9jbnQsIGZ1bmMsIGxpbmUpOworCXJl
dHVybiBhdG9taWNfZGVjX3JldHVybigmZGV2aWNlLT51bmFja2VkX2NudCk7CiB9CiAKLSNkZWZp
bmUgc3ViX3VuYWNrZWQoZGV2aWNlLCBuKSBfc3ViX3VuYWNrZWQoZGV2aWNlLCBuLCBfX2Z1bmNf
XywgX19MSU5FX18pCi1zdGF0aWMgaW5saW5lIHZvaWQgX3N1Yl91bmFja2VkKHN0cnVjdCBkcmJk
X2RldmljZSAqZGV2aWNlLCBpbnQgbiwgY29uc3QgY2hhciAqZnVuYywgaW50IGxpbmUpCisjZGVm
aW5lIHN1Yl91bmFja2VkKGRldmljZSwgbikgKCh2b2lkKWV4cGVjdChkZXZpY2UsIF9fc3ViX3Vu
YWNrZWQoZGV2aWNlKSA+PSAwKSkKK3N0YXRpYyBpbmxpbmUgaW50IF9fc3ViX3VuYWNrZWQoc3Ry
dWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIGludCBuKQogewotCWF0b21pY19zdWIobiwgJmRldmlj
ZS0+dW5hY2tlZF9jbnQpOwotCUVSUl9JRl9DTlRfSVNfTkVHQVRJVkUodW5hY2tlZF9jbnQsIGZ1
bmMsIGxpbmUpOworCXJldHVybiBhdG9taWNfc3ViX3JldHVybihuLCAmZGV2aWNlLT51bmFja2Vk
X2NudCk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19zeW5jX3RhcmdldF9zdGF0ZShlbnVt
IGRyYmRfY29ubnMgY29ubmVjdGlvbl9zdGF0ZSkKLS0gCjIuMzkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
