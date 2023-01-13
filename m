Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA466972D
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:35:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 193F04220C2;
	Fri, 13 Jan 2023 13:35:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 159B94203AB
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:19 +0100 (CET)
Received: by mail-ej1-f45.google.com with SMTP id v6so8989187ejg.6
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=w8mQ1DNdko28cUxvjVBwoXrO008ZDGIG0DMI/J1nWT4=;
	b=spZ9bBE74IdXZvFGyhmamqe/1SDBwGLUSQcAXBhiwbLOeW5LdETOuSw5m+TSnCduvh
	i1dq8pBx80HiBAQcGyxEY7bGUwTu7HGxSxh5IVd2vJJzbwTudnAkAOm1FZMZACIgnAUG
	LJFOsRpwpphyUe8m9LlCxV+VWqB3hnbrDjtKvi8zr4L8jJ7bq1yM+6S8hSkauyzAELBb
	h8cwpFX/WD9jR0CJed2lXICxX6+pQu+9OhUREJogH4PvwJZEDLXjcm1ihM0rQwzO7Ya5
	859r3Uyiovs6+qkiWv/7Wy163pJ4VOkBZlrkbGWRu9MdVP8K0Q7Rt7so9rV00GVCbZko
	T0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=w8mQ1DNdko28cUxvjVBwoXrO008ZDGIG0DMI/J1nWT4=;
	b=2BZiPmdLmcqpI2WphcNoQgcLtjX3u8WBV5CGC+/MCBOuoQhsAE40PDA4ha78+FgZKl
	BzWjLuGzCA6x22WLK6ck5VfDxSkaFzhCgZWN93+7VcxIdnrCKuBPEdiA0n3BodZrfAes
	YVLte6fRk3A1O035VJdN1KdpOyREVhzdpiRwHutcv/rrUCV2g+Ct2G9JaybHR0Q8Zr0O
	yqyzEGAHp4+h9aMWzbFX0qXPHIxewkDKUfKgmyn75FmM6DzazlmJzO7+U5U/eZ63aeG6
	QYPf4ho0G63RabXm67tDA3MC4nZOyr0llnQTW6/dd20au8ysAVOukQ4mx9U8P1BLnflk
	UkRg==
X-Gm-Message-State: AFqh2kpDlHnm8t+sO9iOzOQqYz/o3OE0RD3kxXpBs3H/85dWnTnG3TT9
	iSvBND2tvjlpKMffevvU6Fa5jMg3
X-Google-Smtp-Source: AMrXdXsjRgGq/XdmuiDTy/O+NIzOeI0x1b11hX7Z1ViInZBjrvxvNGqtTAecfa6o7Iznz1GQ/tHnaQ==
X-Received: by 2002:a17:907:7f22:b0:869:c5a4:e1a7 with SMTP id
	qf34-20020a1709077f2200b00869c5a4e1a7mr4493526ejc.62.1673613319454;
	Fri, 13 Jan 2023 04:35:19 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	18-20020a170906201200b00846734faa9asm8386323ejo.164.2023.01.13.04.35.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:19 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:04 +0100
Message-Id: <20230113123506.144082-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
References: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
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
