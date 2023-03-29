Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D86CDB12
	for <lists+drbd-dev@lfdr.de>; Wed, 29 Mar 2023 15:44:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22F3E420962;
	Wed, 29 Mar 2023 15:44:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mout.web.de (mout.web.de [212.227.15.4])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 105894202D0
	for <drbd-dev@lists.linbit.com>; Wed, 29 Mar 2023 15:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1680097483; i=markus.elfring@web.de;
	bh=TvIQUNQPstY1OjSfC8Y0Y21nxMV5PI207ftVdNZHAVo=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=gs1neYbzhRkJpJjhVkWToHE59is9t3Oe+9UrBwtjBhPh2AO14WjrVNBGVMPQZckoC
	76naGGC6fI1AYkb3mmz9YDR0HatjLdub41onTEXVWxae3v76Pcnn7tsKVOZkKa9wlZ
	qUNN9VRGXprBWxyh5/t0ivtDn8AGnDKWOrgjgpu0pgnwaTU61o2IV2ezjB7jbBjVNR
	nmeDTMMnmLMlsNeAZDxMDtukIeCXntc+aYjNH4QIeb5tZDrWxN0lVKMHgGXjhYnyFc
	rggvy0u0f/RQsqD82giiPWzwiysIltsp1N4u/jUV4JtCLAmr6VBN9AeOq3EJQGvoWy
	zIs0lNXq31oaQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MLRUV-1pzsIj45Hn-00IVBH;
	Wed, 29 Mar 2023 15:44:43 +0200
Message-ID: <ccdb761c-9ca1-fb59-467b-fb4d34adc65a@web.de>
Date: Wed, 29 Mar 2023 15:44:42 +0200
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
X-Provags-ID: V03:K1:iTl8rae6//Yib+Bq9D0Db7oy+MObKf2yhz5O+cXp1jAFcoV1GPk
	zLVt45gNVV4yh/tqfJtnL5pd9bueLyFqKa/MGTDv/k2VFmUWKts8jPsyP8LORsJG1QFLrVg
	Ig1doPGEYvpVYcAVvgsVxqwwj5ePkwvCdxcs9l8JLDdcqM9TAFXBuSCUQxBK/uH/IFjN1gk
	GIbZtWW+dyZ1qVkFmcJ4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HJwFvu8owrw=;TT9zAuSwIzATzVJg1TLJ2xDp7/a
	UPzzHgdJLpZjdEphyFdk5LRib9CFieVv1MQnGnDG+W7wUp1iHcnYUB7IXbsVYuGXnuo9n+S7I
	LITYoMQ+blQiWWOMz6mnGlkGjoO16kbLiC0P/nxBMMl9qS0JO+RBxSwL1PQAfsAN9XmZZgt8C
	THn/rHMlZBrbkeK//oipwwgLrFYsunzqQBKYvWNWc+BMWzg4/gzsKtqSNFOW+5EAxb3gqQlgX
	1p52EORVRQzr9NS2KqwKKP0kXmVXUlHgKwDErSnDUzq0WoZfulr9HWibSx5kJ6ta3w3/LbIW3
	IQlch4jt2oM7BJ4LXv2THB2jMP4uAxZNPtzu9VrEz+RE51WFucKgXN2xbkQmXPsKudTRGoyUS
	Kspdr55NW+OWaPyNLTELY2ik6QyV54FOo9Uw7bx6AAljVgelu35+sYEsRRaa4lS2J6D4TIRmU
	JzuHyWJqic24poEGvlsENzCfattsl6fxpxB1Ea5nQkWu+sTH1XeTQx+aOLgf9xGJXaiJAn1Bw
	tneSVH/u7HSN22z30CamSk5CFo3wQG3h8TiLccCxagE0kUy9LPoa2e4E0ZTwbtCtovlHS0HHA
	28yTiKIoRuTrfmUw5TZnOk+dYj63RuF3iRyIe+zVH2I5nEwLdw9Th07wjtplORmLdpd0701Nf
	jSM0ilSS0hyZ8ET28lXEQcZ52auNRgpbb6ZSsp/LWQjW5/u0+rOR0Ty4nickrmBpW9KYz4ye8
	DHG8oHvAJjnWvKK593YkPxNrHe+E68rYJ5tud/0/att9W+dDUIDnceeafkxNlo0LdZaX1xBgV
	JvtdJzq551POncXvnJLbfD2DG+NMwKtB9+B4o/R0UZinL3kZj/5dulwYJZYTmf/4OIPLJssqR
	MpQAyoj1XGZmmmn+AlcemRBtdot0bP8NZx3+NfKbNLEWHN31iMKlX/Py1
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Drbd-dev] [PATCH 3/3] lru_cache: Improve exception handling in
	lc_create()
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

RGF0ZTogV2VkLCAyOSBNYXIgMjAyMyAxNToyMDozOSArMDIwMAoKVGhlIGxhYmVsIOKAnG91dF9m
YWls4oCdIHdhcyB1c2VkIHRvIGp1bXAgdG8gYSBrZnJlZSgpIGNhbGwgZGVzcGl0ZSBvZgp0aGUg
ZGV0YWlsIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24g4oCcbGNfY3JlYXRl
4oCdCnRoYXQgaXQgd2FzIGRldGVybWluZWQgYWxyZWFkeSB0aGF0IGEgY29ycmVzcG9uZGluZyB2
YXJpYWJsZSBjb250YWluZWQKYSBudWxsIHBvaW50ZXIgYmVjYXVzZSBvZiBhIGZhaWxlZCBtZW1v
cnkgYWxsb2NhdGlvbi4KClRodXMgdXNlIG1vcmUgYXBwcm9wcmlhdGUgbGFiZWxzIGluc3RlYWQu
CgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2Fy
ZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZv
cmdlLm5ldD4KLS0tCiBsaWIvbHJ1X2NhY2hlLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2xydV9j
YWNoZS5jIGIvbGliL2xydV9jYWNoZS5jCmluZGV4IDMxODIwZjAzYjE0Ni4uZmRjOGJkNmZjODg4
IDEwMDY0NAotLS0gYS9saWIvbHJ1X2NhY2hlLmMKKysrIGIvbGliL2xydV9jYWNoZS5jCkBAIC0x
MDAsMTEgKzEwMCwxMSBAQCBzdHJ1Y3QgbHJ1X2NhY2hlICpsY19jcmVhdGUoY29uc3QgY2hhciAq
bmFtZSwgc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLAoKIAllbGVtZW50ID0ga2NhbGxvYyhlX2Nv
dW50LCBzaXplb2YoKmVsZW1lbnQpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWVsZW1lbnQpCi0JCWdv
dG8gb3V0X2ZhaWw7CisJCWdvdG8gZnJlZV9zbG90OwoKIAlsYyA9IGt6YWxsb2Moc2l6ZW9mKCps
YyksIEdGUF9LRVJORUwpOwogCWlmICghbGMpCi0JCWdvdG8gb3V0X2ZhaWw7CisJCWdvdG8gZnJl
ZV9lbGVtZW50OwoKIAlJTklUX0xJU1RfSEVBRCgmbGMtPmluX3VzZSk7CiAJSU5JVF9MSVNUX0hF
QUQoJmxjLT5scnUpOwpAQCAtMTQyLDggKzE0Miw5IEBAIHN0cnVjdCBscnVfY2FjaGUgKmxjX2Ny
ZWF0ZShjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsCiAJCWttZW1f
Y2FjaGVfZnJlZShjYWNoZSwgcCAtIGVfb2ZmKTsKIAl9CiAJa2ZyZWUobGMpOwotb3V0X2ZhaWw6
CitmcmVlX2VsZW1lbnQ6CiAJa2ZyZWUoZWxlbWVudCk7CitmcmVlX3Nsb3Q6CiAJa2ZyZWUoc2xv
dCk7CiAJcmV0dXJuIE5VTEw7CiB9Ci0tCjIuNDAuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxp
c3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZHJiZC1kZXYK
