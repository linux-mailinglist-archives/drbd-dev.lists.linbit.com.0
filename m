Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70564845E
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:58:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2C2804252E0;
	Fri,  9 Dec 2022 15:58:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1386442096B
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:55:07 +0100 (CET)
Received: by mail-ed1-f52.google.com with SMTP id z92so3431855ede.1
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=w8mQ1DNdko28cUxvjVBwoXrO008ZDGIG0DMI/J1nWT4=;
	b=IUG8ldHfU+Z2W8ssHSjmCqhbct2jByJci7FEf/55pMFshhMS7k+iLD4zTUZM/vN8Vq
	TRnxOna/m/DOf9FkM5W0nfGKVh437qsWJLBuTc1L9bEkkydiEQacgT3gsZcjlU0QvrUW
	ghoZGKHys0XNatcxeqS4WGCrc+i44BYjUktBdRGNt5HDu0QUK2jzN5dxUu9Pae4kYw7h
	BowqGf+a/9DnKfnfzwmGO2yrWIzTzyjRegbyqqcoPtXBIoLHqO/5TnYN+Tq+dbTaDC69
	nCbN+jY+30BuRxWcHwRaAY0XSsCekS76GhnIPJBGTsy2XQy3ak0QU/x27zXWOJnP7sHb
	jgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=w8mQ1DNdko28cUxvjVBwoXrO008ZDGIG0DMI/J1nWT4=;
	b=XELRtolpPGrlhMvENAQ03BJWsfwmiFcd5gUsGVx4XnERgbM1IiG0Gk6A1D3T+BegV0
	k6PCcY7lZKWUyG6Up2Gy1n/6K+LjF/FdZ7d2k2dWhVMp6h/nRpj54Dx8eUsOJ9MBKGbV
	+EuiXCiBLXqcAfLKh8hUQDMhfcFQ1eFMHhSjk5Moar3WUMYXSeH6jyPbkoubWpP77AK7
	B5LiUfP3giB7UKJvCxJp75aIYjuBw7gjca8DfFxlOB3g9XWniLyVTQkwmoZy6CGZEHq7
	IAgASwr2JvCPSb/GR4d13n7vJQhFZhyoiBN5TAlbXEB3lgIJYH45R9Pd+W1P1arxbJU/
	PgQg==
X-Gm-Message-State: ANoB5pk00HzuLp668G4/YRpKvQGJpsnLbLb1AN/I7PxcyAbR5i86ng9t
	NOXY47eKo1OCvVALv7l49bhq5DN8
X-Google-Smtp-Source: AA0mqf61kq4qDITMmU/ANSy6fHJpUxypHKu0yrnlzXRMvNtX2P9Ui4uunU9KRDO1fLXg3COosGHBRQ==
X-Received: by 2002:a05:6402:500f:b0:461:bce0:c783 with SMTP id
	p15-20020a056402500f00b00461bce0c783mr7206023eda.36.1670597707421;
	Fri, 09 Dec 2022 06:55:07 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	l4-20020aa7c304000000b0046b1d63cfc1sm716856edq.88.2022.12.09.06.55.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:55:07 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:55:02 +0100
Message-Id: <20221209145504.2273072-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145504.2273072-1-christoph.boehmwalder@linbit.com>
References: <20221209145504.2273072-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/3] drbd: split off drbd_buildtag into separate
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
dmVycy9ibG9jay9kcmJkL01ha2VmaWxlICAgICAgICB8ICAyICstCiBkcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9idWlsZHRhZy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfbWFpbi5jICAgICB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9idWlsZHRhZy5jCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibG9jay9kcmJkL01ha2VmaWxlIGIvZHJpdmVycy9ibG9jay9kcmJkL01ha2VmaWxl
CmluZGV4IGM5M2U0NjIxMzBmZi4uNjdhOGIzNTJhMWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Js
b2NrL2RyYmQvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL01ha2VmaWxlCkBAIC0x
LDUgKzEsNSBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Ci1kcmJk
LXkgOj0gZHJiZF9iaXRtYXAubyBkcmJkX3Byb2MubworZHJiZC15IDo9IGRyYmRfYnVpbGR0YWcu
byBkcmJkX2JpdG1hcC5vIGRyYmRfcHJvYy5vCiBkcmJkLXkgKz0gZHJiZF93b3JrZXIubyBkcmJk
X3JlY2VpdmVyLm8gZHJiZF9yZXEubyBkcmJkX2FjdGxvZy5vCiBkcmJkLXkgKz0gZHJiZF9tYWlu
Lm8gZHJiZF9zdHJpbmdzLm8gZHJiZF9ubC5vCiBkcmJkLXkgKz0gZHJiZF9pbnRlcnZhbC5vIGRy
YmRfc3RhdGUubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYnVpbGR0YWcu
YyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2J1aWxkdGFnLmMKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45NTZhNGQ1YzMzOWIKLS0tIC9kZXYvbnVsbAorKysgYi9k
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9idWlsZHRhZy5jCkBAIC0wLDAgKzEsMjIgQEAKKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKyNpbmNsdWRlIDxsaW51eC9kcmJk
Lmg+CisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisKK2NvbnN0IGNoYXIgKmRyYmRfYnVpbGR0
YWcodm9pZCkKK3sKKwkvKiBEUkJEIGJ1aWx0IGZyb20gZXh0ZXJuYWwgc291cmNlcyBoYXMgaGVy
ZSBhIHJlZmVyZW5jZSB0byB0aGUKKwkgKiBnaXQgaGFzaCBvZiB0aGUgc291cmNlIGNvZGUuCisJ
ICovCisKKwlzdGF0aWMgY2hhciBidWlsZHRhZ1szOF0gPSAiXDB1aWx0LWluIjsKKworCWlmIChi
dWlsZHRhZ1swXSA9PSAwKSB7CisjaWZkZWYgTU9EVUxFCisJCXNwcmludGYoYnVpbGR0YWcsICJz
cmN2ZXJzaW9uOiAlLTI0cyIsIFRISVNfTU9EVUxFLT5zcmN2ZXJzaW9uKTsKKyNlbHNlCisJCWJ1
aWxkdGFnWzBdID0gJ2InOworI2VuZGlmCisJfQorCisJcmV0dXJuIGJ1aWxkdGFnOworfQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbWFpbi5jCmluZGV4IDcyMTNmZmQ2OWExNi4uMzQ1YmZhYzQ0MWRhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbWFpbi5jCkBAIC0zNzc2LDI0ICszNzc2LDYgQEAgX2RyYmRfaW5zZXJ0X2ZhdWx0
KHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlLCB1bnNpZ25lZCBpbnQgdHlwZSkKIH0KICNlbmRp
ZgogCi1jb25zdCBjaGFyICpkcmJkX2J1aWxkdGFnKHZvaWQpCi17Ci0JLyogRFJCRCBidWlsdCBm
cm9tIGV4dGVybmFsIHNvdXJjZXMgaGFzIGhlcmUgYSByZWZlcmVuY2UgdG8gdGhlCi0JICAgZ2l0
IGhhc2ggb2YgdGhlIHNvdXJjZSBjb2RlLiAqLwotCi0Jc3RhdGljIGNoYXIgYnVpbGR0YWdbMzhd
ID0gIlwwdWlsdC1pbiI7Ci0KLQlpZiAoYnVpbGR0YWdbMF0gPT0gMCkgewotI2lmZGVmIE1PRFVM
RQotCQlzcHJpbnRmKGJ1aWxkdGFnLCAic3JjdmVyc2lvbjogJS0yNHMiLCBUSElTX01PRFVMRS0+
c3JjdmVyc2lvbik7Ci0jZWxzZQotCQlidWlsZHRhZ1swXSA9ICdiJzsKLSNlbmRpZgotCX0KLQot
CXJldHVybiBidWlsZHRhZzsKLX0KLQogbW9kdWxlX2luaXQoZHJiZF9pbml0KQogbW9kdWxlX2V4
aXQoZHJiZF9jbGVhbnVwKQogCi0tIAoyLjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
