Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B86CDB06
	for <lists+drbd-dev@lfdr.de>; Wed, 29 Mar 2023 15:40:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 744E342066F;
	Wed, 29 Mar 2023 15:40:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mout.web.de (mout.web.de [212.227.15.14])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C3C54202D0
	for <drbd-dev@lists.linbit.com>; Wed, 29 Mar 2023 15:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1680097208; i=markus.elfring@web.de;
	bh=xm1Gr+53XVq21wzSzf2W9qt33ydlVjL8cbcG72ewbl8=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=ErowAxompTVcoLvHTk89wgYQyUNYFH8RI1Gr6nJqHbfJrdvoLA3HSgdGL3VnUIrLe
	4/PMuS56fLuYS3nJdpSX6sbLX3N1rkysMChyKN7bYePRrEXpxQ9UZmkCmMfq2PUUIZ
	hWAVMQn2suEDQIlAI8DLQ2M03aMxvXnNQdIS469l6uF9kVUWZAhRlIEAoi7RruDjqL
	rT7JH3+ZQxpG5BTjaZc3Z+lIVJ0LJIeMa2rrhpiQZ2Z/W0TdaEtHr13VmYGI07a/hx
	QlW7jlktEUOfdFwEzekzN6VEk6LkeZlefekO9GwAkuqWDfXJWvWqlwMZhqvKZrwoK2
	b8okXRlJ+0rfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MpU1w-1qDUBg22FY-00ptK7;
	Wed, 29 Mar 2023 15:40:08 +0200
Message-ID: <18b0a6f6-8a18-2073-1e73-78bceac03fad@web.de>
Date: Wed, 29 Mar 2023 15:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	=?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
	<33226beb-4fe2-3da5-5d69-a33e683dec57@web.de>
In-Reply-To: <33226beb-4fe2-3da5-5d69-a33e683dec57@web.de>
X-Provags-ID: V03:K1:tjpUXGBUbazH2ycCGpDC23WGvZjghstW4Fm6jDIuzxXEy/fGP1d
	JheX7zKpU/JNx/dJ/cu6lzamZ7kAvH79NWdD5CztkM9JyxGByjnlSUxi3OEWU0m2FAkr6qD
	Q8mcPAxbPK6My+Gcgx39xVyOS+bUWLiVy3l9mN/ShuO47YXsyG1NQ1DlKIPrN/Av6K1oPVe
	LqbPbARDPlvXHwFo6jEkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xD3x+xOO/HY=;aXqW5qTF9R+a+7+j4G1kIYoyv9T
	NkqjIywnQ4a9TJPeaVaLJdWte0PX86qnC8MNvctjeN3VANn38TxDT/rNMeY5wFSTU4siaYcMZ
	FT9shSOCrZx1ulWB9t5wZzbRRhHAbalkuZzjgo2k/Hc5ToRdHxXMfw2YVLU9oDw4T55vPpZ8u
	uFetDmWPcpph9wfqnkwlG6fWzdkmadWrgMaHwxS/Bk6cRSTx5rrgt1FH8bzbIZpfnSGAAIPzp
	alcUGJVkE7GTOuReqNrrJWTOEeNWeeXygkX66rnFYZmHy5+lV+LyquVJWM2UQtHjUgoubDWe1
	mtgx8GIzg5Pm51inUGDtwbIf62DveW24TnU+OnycWfWKMILxgsN8LKvBR6WVR64o6iRJGm+ow
	NXUuumC0EABQKdOmULuCzz0yXdUnXJXiWeHGUoLkoYv4VSgsqLbw3RXc47KfULW2ea9AAdcEF
	8e8N+CQn/TBAY+JC4jJxNtg0PUSZ25bSxlzyLyJUxO6i27vb9XzNiijFmMS1HC2irKscGZ/Zd
	p19Uy3Nl4psmTXtW8oWkdETPrBgQgMw5gpiRY8hSPEln1oVl0lbZ9SBJVdrB7n3WzwiXDc3Z8
	nsZYAfRyeIA/V0k2gHSH6SnhEpRV43yuKUeE2SUtI0/8WBMOGkf3nIR4afgpynBHM9PFFACsx
	kUhFarN9EcbINLrq8PhrhgWrAyLfE+8vsMtQ2DX9gU9D8UhZ/x6COwFmltJJXPBk0mcA93mBC
	xJWxy2aCgfpjhv7hRP+SCNzZQKpc1WdsJOgvJ0K9iplExttuvxcC56+a3cIjYxUNFa2t8wioa
	hJj+O5Q7GKM6xE8ivB/ljt/V0PsYGGPqSPIlCxt5qrKBmweva23avirHPWtBaYr1nWcF8vu5P
	D9cG4tMovTaIss8xPWIftjTxI+wZgcEv0Is/6U+GIKOpd6bLH6giriXKf
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Drbd-dev] [PATCH 1/3] lru_cache: Return directly after a failed
 kzalloc() in lc_create()
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

RGF0ZTogV2VkLCAyOSBNYXIgMjAyMyAxNDo0NTozNCArMDIwMAoKMS4gUmV0dXJuIGRpcmVjdGx5
IGFmdGVyIGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCca3phbGxvY+KAnSBmYWlsZWQKICAgYXQg
dGhlIGJlZ2lubmluZyBpbiB0aGVzZSBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbnMuCgoyLiBPbWl0
IGV4dHJhIGluaXRpYWxpc2F0aW9ucyAoZm9yIHRoZSB2YXJpYWJsZXMg4oCcc2xvdOKAnSBhbmQg
4oCcZWxlbWVudOKAnSkKICAgd2hpY2ggYmVjYW1lIHVubmVjZXNzYXJ5IHdpdGggdGhpcyByZWZh
Y3RvcmluZy4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBsaWIvbHJ1X2NhY2hlLmMgfCA3ICsrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2xydV9jYWNoZS5jIGIvbGliL2xydV9jYWNoZS5jCmluZGV4IGIzZDkxODc2MTFkZS4uZTBkYjI3
YjNhMmQ3IDEwMDY0NAotLS0gYS9saWIvbHJ1X2NhY2hlLmMKKysrIGIvbGliL2xydV9jYWNoZS5j
CkBAIC03OCw4ICs3OCw4IEBAIHN0cnVjdCBscnVfY2FjaGUgKmxjX2NyZWF0ZShjb25zdCBjaGFy
ICpuYW1lLCBzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsCiAJCXVuc2lnbmVkIG1heF9wZW5kaW5n
X2NoYW5nZXMsCiAJCXVuc2lnbmVkIGVfY291bnQsIHNpemVfdCBlX3NpemUsIHNpemVfdCBlX29m
ZikKIHsKLQlzdHJ1Y3QgaGxpc3RfaGVhZCAqc2xvdCA9IE5VTEw7Ci0Jc3RydWN0IGxjX2VsZW1l
bnQgKiplbGVtZW50ID0gTlVMTDsKKwlzdHJ1Y3QgaGxpc3RfaGVhZCAqc2xvdDsKKwlzdHJ1Y3Qg
bGNfZWxlbWVudCAqKmVsZW1lbnQ7CiAJc3RydWN0IGxydV9jYWNoZSAqbGM7CiAJc3RydWN0IGxj
X2VsZW1lbnQgKmU7CiAJdW5zaWduZWQgY2FjaGVfb2JqX3NpemUgPSBrbWVtX2NhY2hlX3NpemUo
Y2FjaGUpOwpAQCAtOTYsNyArOTYsOCBAQCBzdHJ1Y3QgbHJ1X2NhY2hlICpsY19jcmVhdGUoY29u
c3QgY2hhciAqbmFtZSwgc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLAoKIAlzbG90ID0ga2NhbGxv
YyhlX2NvdW50LCBzaXplb2Yoc3RydWN0IGhsaXN0X2hlYWQpLCBHRlBfS0VSTkVMKTsKIAlpZiAo
IXNsb3QpCi0JCWdvdG8gb3V0X2ZhaWw7CisJCXJldHVybiBOVUxMOworCiAJZWxlbWVudCA9IGtj
YWxsb2MoZV9jb3VudCwgc2l6ZW9mKHN0cnVjdCBsY19lbGVtZW50ICopLCBHRlBfS0VSTkVMKTsK
IAlpZiAoIWVsZW1lbnQpCiAJCWdvdG8gb3V0X2ZhaWw7Ci0tCjIuNDAuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0
CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxt
YW4vbGlzdGluZm8vZHJiZC1kZXYK
