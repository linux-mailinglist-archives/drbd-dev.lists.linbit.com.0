Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9106CDB0A
	for <lists+drbd-dev@lfdr.de>; Wed, 29 Mar 2023 15:42:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BDBE6420962;
	Wed, 29 Mar 2023 15:42:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7CA6A4202D0
	for <drbd-dev@lists.linbit.com>; Wed, 29 Mar 2023 15:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1680097328; i=markus.elfring@web.de;
	bh=m00OaWTBWWXyFNelyApPwUNe86kZs+8A+dU6Z+tZiRQ=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=i4hVYBsWEs68EWAYy9+nLW5Yj/xndluuxGfudrPae2Jsg8rY8v1vLsBhsYR/N8GvE
	ZpwygAQXQIaII5FeYtpfHcanXMi7aHyOqySYeZxhg2MezSdloxgtQFOWbO5IBKBBYM
	ZjcDqPIjPRn6k0mJfEhkg3Ji/T8RogLrbzxVsogUFqfDaUrdc3HYGRHR2abssK1iWk
	R6K3SweaSLON1IA9t3CrQA9qIq3XSdwVU2Q6z/7qmi3ZSJa4HhoNhDjaPhoEKB9ajS
	gWDx4zezyYphijTb7R74DRPdt7pCVj9t2Hhk3i7mA32iyydH2beOVUwwpa0yOeqVvL
	VDPu+sEWRYhJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MsaS7-1qbQ2V27yt-00u1mt;
	Wed, 29 Mar 2023 15:42:08 +0200
Message-ID: <f03b9407-0336-e949-e98d-9e0ddf3bfa57@web.de>
Date: Wed, 29 Mar 2023 15:42:07 +0200
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
X-Provags-ID: V03:K1:xccVgmSl8Ha0ghYApF/nCSMpGmsbgj2/qvRn4ePluMGJgjseRbX
	Fk559z9Xyv+xFgsDmtcWdmC520ERk6/YsGvMvbz/URQHXIY87+PTLGYbKHvXJYLfWCgFQjJ
	EKWIaJuBEI0TMqerq8mArhH763ShL8ChFJFmEt9ns/gXwgITt0uNnD3NN0ex1Pgzu1BZFom
	9i4qsBdT30SUKyEWGZX3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9L+04TnmdBg=;/foYZBKFaueN/GYunkiH6spo0hj
	KPmE36zrUnzXtiFtOFRnVpazqJx/GYKhjYS64xXisco3EC5imx5j6em1ItwpdPKWhJV74BU96
	OPZ88OQlVqTiaoFE4vnVuL5stV+96qHk8WksjZJJO9JBJSGeEFobrRpaS4lkdzbXUPsXw5hyG
	UHMae5ryaHt8bgBzMF4l8DxnvnlxJon6cHRMUq7lcUf4NbR88lRHf/acJtYFwIAJn//xZ5r7n
	BGmdmRyktQ9AkPbD1sDuXK0dK74wpb7EhTpyh4mbbJuNx/x+9wrE07AsTnAOFgRx2jg78BXDG
	S2J+XAsSpHjkZYfYjW/S3bJoQXSWq9HoIJeorVMTtd0HjZXq3xIeELSTPKDC7vQyO58V4p8kw
	2uihjDa4Nx1u3tyOwy1FTDhSYiLgRDu878dKAAU76az876rpAwbJ3mgcFeRpE5H2aefABn4Lf
	nVj8mA5dzjF/PO3eJcf3tLTLF3ltZLKlrMZtIEZa5ZKinallBUdktNzmhLBTLXVjyPxAgN37l
	htm3NEsHBNsnOf29FQbIF5cg6PLrk7zSO53saZ1QAf67YYsoGYq4almg3SgJvCjmKlXjIEsed
	kcvHsMmzfsA0Z7z8VAmWPmPvh7CsVULU3cs6kWmsQqqd15M+Aoc1V5NDTgrUGDYqs8433zmIh
	JDw6NnwHkgsFFvrtcPX+8ifOwRQ58DNRPRclTqgd5wNChRKC5MjnqgVlPjhuegmIleREXdsv8
	XufJKBJaMiFBj54OV/S25hnsFjhNAHQzJMlSfwxDvwdwewXTwVoMB1Dw1xQB6anpyVxqAw48C
	rYvYlY/PBH9DO3J2WGNs2Cn3kwbkGZO4tREk82pN5sCAY4GainPmqnXxIPe0KkhVcofpP0aco
	Fd3ZkZHGcPthbqUiRdlWunUwkkVm8yWNDthA27LFpz2NNKrq21XHGfWVP
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Drbd-dev] [PATCH 2/3] lru_cache: Improve two size determinations
	in lc_create()
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

RGF0ZTogV2VkLCAyOSBNYXIgMjAyMyAxNTowMDoxMyArMDIwMAoKUmVwbGFjZSB0aGUgc3BlY2lm
aWNhdGlvbiBvZiBkYXRhIHN0cnVjdHVyZXMgYnkgcG9pbnRlciBkZXJlZmVyZW5jZXMKYXMgdGhl
IHBhcmFtZXRlciBmb3IgdGhlIG9wZXJhdG9yIOKAnHNpemVvZuKAnSB0byBtYWtlIHRoZSBjb3Jy
ZXNwb25kaW5nIHNpemUKZGV0ZXJtaW5hdGlvbiBhIGJpdCBzYWZlciBhY2NvcmRpbmcgdG8gdGhl
IExpbnV4IGNvZGluZyBzdHlsZSBjb252ZW50aW9uLgoKU2lnbmVkLW9mZi1ieTogTWFya3VzIEVs
ZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgotLS0KIGxpYi9scnVfY2FjaGUu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9saWIvbHJ1X2NhY2hlLmMgYi9saWIvbHJ1X2NhY2hlLmMKaW5kZXgg
ZTBkYjI3YjNhMmQ3Li4zMTgyMGYwM2IxNDYgMTAwNjQ0Ci0tLSBhL2xpYi9scnVfY2FjaGUuYwor
KysgYi9saWIvbHJ1X2NhY2hlLmMKQEAgLTk0LDExICs5NCwxMSBAQCBzdHJ1Y3QgbHJ1X2NhY2hl
ICpsY19jcmVhdGUoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLAog
CWlmIChlX2NvdW50ID4gTENfTUFYX0FDVElWRSkKIAkJcmV0dXJuIE5VTEw7CgotCXNsb3QgPSBr
Y2FsbG9jKGVfY291bnQsIHNpemVvZihzdHJ1Y3QgaGxpc3RfaGVhZCksIEdGUF9LRVJORUwpOwor
CXNsb3QgPSBrY2FsbG9jKGVfY291bnQsIHNpemVvZigqc2xvdCksIEdGUF9LRVJORUwpOwogCWlm
ICghc2xvdCkKIAkJcmV0dXJuIE5VTEw7CgotCWVsZW1lbnQgPSBrY2FsbG9jKGVfY291bnQsIHNp
emVvZihzdHJ1Y3QgbGNfZWxlbWVudCAqKSwgR0ZQX0tFUk5FTCk7CisJZWxlbWVudCA9IGtjYWxs
b2MoZV9jb3VudCwgc2l6ZW9mKCplbGVtZW50KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFlbGVtZW50
KQogCQlnb3RvIG91dF9mYWlsOwoKLS0KMi40MC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlz
dHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
cmJkLWRldgo=
