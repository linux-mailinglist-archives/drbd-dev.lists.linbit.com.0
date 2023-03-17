Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558F6C0B16
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Mar 2023 08:06:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 95976420624;
	Mon, 20 Mar 2023 08:06:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1298 seconds by postgrey-1.31 at mail19;
	Fri, 17 Mar 2023 19:02:16 CET
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2467420312
	for <drbd-dev@lists.linbit.com>; Fri, 17 Mar 2023 19:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679076135; i=markus.elfring@web.de;
	bh=28cef3KUBVeSt8GOldF5NY8bpU99EPqA7GuwUkiEuyQ=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=kdIAez+yCaT6cELPYUanRQkFM1kTOdUi4GK0mbD30NlKJX1sSjENCwAdggF2mJ2bN
	8mUWFIorVlvW6+iVsnmmuI/nSPuYe8xDSkZ00AgblPFYsP5UE+lzJimyelmE6rLlm3
	xh6HvelXTUMvObDYEaSVNPMzfQNugvtiaVInCm9DvHzvlMI5bN+I6CMFxgOA2ktJQ1
	Of/51dvMm8Z/z96vG49w8+h17cRVxHhPxOnZjOOV0vzz6eWGsEYuA4XQ4B1wA4UeHP
	G8l7yjHvVDNui3FYKwvYqAgDJwJQUTE9+MfB+IT18dcXQB0Cn9X/DQJpmZ048AnfAI
	cS5OZJ5n/j6FQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
	[213.165.67.124]) with ESMTPSA (Nemesis) id 1M8kAN-1pZ7Sc40PZ-004gUJ;
	Fri, 17 Mar 2023 18:40:36 +0100
Message-ID: <8d193937-532f-959f-9b84-d911984508aa@web.de>
Date: Fri, 17 Mar 2023 18:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, =?UTF-8?Q?Christoph_B=c3=b6hmwalder?=
	<christoph.boehmwalder@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
In-Reply-To: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
X-Provags-ID: V03:K1:R9Jf1+WIShRbwhjX9q+XRH9Q/a66VRs26EXQ77QO5U3efFvDNPz
	dog+xrcsLEZtM155l4GezGnJwGxhghnU8mCtcAiNEa9MgHnj9DPmZ52LqOok/EyFl4zg89o
	Rx9llAdOXByU0dn9d1Up/0mNTr+Dp9UaeDED3LWSoTKy/yAZp6yE111mUQ+N1YIfjf8tts+
	Wwu7BlhiwgK3gRCoYjgCQ==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:1MQFjuoupes=;Y8rNuKci/4uyJXSzAskT21WNVt6aw
	oHQD/pmEHVq8uP6Yk2YvjIkYEZkqllZMWi6u2pS7+EVbMnOU16bfMSye4PDh1fmv4cjqLDWBZ
	Uz0lcpK1FFngD8dUHJkYRMSRMMaj+7JinZCTx69XESAaAjV41btBvq3cZcxUzdCZZRFajbuaO
	hyTmjkBm88mNE2PNNhVB07aD3l9UGIpRlfzIdVqe5QxzELS0agZ3nstQKkpfd3tHavnPvPcDA
	ZCuynikL27VU2D1g/KXE2jUcr4IRcvgwo9MZfb0PPvRuJ1aPVVIKMWl4y6aEqZWY+OXhhGaB+
	I/hWRBj2erKz3eWKb8VTBxaEx+ZgafCapolwmN5ihIQsRVgYc+7vrHxwHXdOkGUxIG6laUIGK
	ZXAEbJ8mfs4byxtXQu29Tfq28+qlzAgTQasmMZXLptbyfAdOh3d4nFNd+wzyN4DugvebrMiWe
	w6EclB62M4lMWd9epK6qPvVAlrOwgGOSAdiLbur424ByoBlm1MK1i8xSlXTPf+kaFlX1XVA9F
	IWTaz5Xkk6HLX/SGNIbKpFW4v7GIWCpp10KXUQx+GpWCE2LWEKW7rgHN3DsGckMHw/NaKRCkn
	4cx+NC2j/XkFq1lSWHQqxAuql3wvAalE2na6UDH7van4tFIKx5EStYxgWGfyO0dS1FM0qlAV9
	iF8gV/SuqAlFK86df3hBXpAumGzCwgk9myTHEj8JnCR1xQE5yqXCEr+lv3TUHQAJROjlpEfd9
	nyVpQ+fAQG7beGrhWRMdMPFuUW497oWDL6mARh04UUMKycopEROU0ZxLLPysJD7A1Q/TTqsAG
	wf+16st050KNkItib34p4kxFRmg2mxHNT6tZm0JJkXklVI5IMf4j8HeWUn2LJvc1Ep/g1EoUX
	8C0zpFjrKnZHYzGH+U9uLS/iM84XdTAvmfyg+sYmmvBkWiFNsNVGL1VlIN4vhg398WerPKUiB
	fvZMdZymm15y6H+nJ9Qv2Nz2LuiZbIhq45kj6QI6+RRdUaWsx9jYAjyidVobhEDDdnFzhfvFf
	1uJJ9EwvD3+KrHiU=
X-Mailman-Approved-At: Mon, 20 Mar 2023 08:06:04 +0100
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Drbd-dev] [PATCH] drbd: Fix exception handling in
	nla_put_drbd_cfg_context()
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

RGF0ZTogRnJpLCAxNyBNYXIgMjAyMyAxODozMjowNSArMDEwMAoKVGhlIGxhYmVsIOKAnG5sYV9w
dXRfZmFpbHVyZeKAnSB3YXMgdXNlZCB0byBqdW1wIHRvIGFub3RoZXIgcG9pbnRlciBjaGVjawpk
ZXNwaXRlIG9mIHRoZSBkZXRhaWwgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlv
bgrigJxubGFfcHV0X2RyYmRfY2ZnX2NvbnRleHTigJ0gdGhhdCBpdCB3YXMgZGV0ZXJtaW5lZCBh
bHJlYWR5IHRoYXQKdGhlIGNvcnJlc3BvbmRpbmcgdmFyaWFibGUgY29udGFpbmVkIGEgbnVsbCBw
b2ludGVyLgoKKiBUaHVzIHJldHVybiBkaXJlY3RseSBhZnRlciBhIGNhbGwgb2YgdGhlIGZ1bmN0
aW9uCsKgIOKAnG5sYV9uZXN0X3N0YXJ0X25vZmxhZ+KAnSBmYWlsZWQuCgoqIERlbGV0ZSBhbiBl
eHRyYSBwb2ludGVyIGNoZWNrIHdoaWNoIGJlY2FtZSB1bm5lY2Vzc2FyeQrCoCB3aXRoIHRoaXMg
cmVmYWN0b3JpbmcuCgoKVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2Np
bmVsbGUgc29mdHdhcmUuCgpGaXhlczogNTQzY2MxMGI0Y2M1YzYwYWE5ZmNjNjI3MDVjY2ZiOTk5
OGJmNDY5NyAoImRyYmQ6IGRyYmRfYWRtX2dldF9zdGF0dXMgbmVlZHMgdG8gc2hvdyBzb21lIG1v
cmUgZGV0YWlsIikKU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMu
c291cmNlZm9yZ2UubmV0PgotLS0KwqBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIHwgNSAr
Ky0tLQrCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX25sLmMKaW5kZXggZjQ5ZjJhNTI4MmUxLi45Y2I5NDcxMjc0NzIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbmwuYwpAQCAtMzE4Nyw3ICszMTg3LDcgQEAgc3RhdGljIGludCBubGFfcHV0X2RyYmRf
Y2ZnX2NvbnRleHQoc3RydWN0IHNrX2J1ZmYgKnNrYiwKwqDCoMKgIMKgc3RydWN0IG5sYXR0ciAq
bmxhOwrCoMKgwqAgwqBubGEgPSBubGFfbmVzdF9zdGFydF9ub2ZsYWcoc2tiLCBEUkJEX05MQV9D
RkdfQ09OVEVYVCk7CsKgwqDCoCDCoGlmICghbmxhKQotwqDCoCDCoMKgwqAgwqBnb3RvIG5sYV9w
dXRfZmFpbHVyZTsKK8KgwqAgwqDCoMKgIMKgcmV0dXJuIC1FTVNHU0laRTsKwqDCoMKgIMKgaWYg
KGRldmljZSAmJgrCoMKgwqAgwqDCoMKgwqAgbmxhX3B1dF91MzIoc2tiLCBUX2N0eF92b2x1bWUs
IGRldmljZS0+dm5yKSkKwqDCoMKgIMKgwqDCoCDCoGdvdG8gbmxhX3B1dF9mYWlsdXJlOwpAQCAt
MzIwNSw4ICszMjA1LDcgQEAgc3RhdGljIGludCBubGFfcHV0X2RyYmRfY2ZnX2NvbnRleHQoc3Ry
dWN0IHNrX2J1ZmYgKnNrYiwKwqDCoMKgIMKgcmV0dXJuIDA7CsKgCsKgbmxhX3B1dF9mYWlsdXJl
OgotwqDCoCDCoGlmIChubGEpCi3CoMKgIMKgwqDCoCDCoG5sYV9uZXN0X2NhbmNlbChza2IsIG5s
YSk7CivCoMKgIMKgbmxhX25lc3RfY2FuY2VsKHNrYiwgbmxhKTsKwqDCoMKgIMKgcmV0dXJuIC1F
TVNHU0laRTsKwqB9CsKgCi0tCjIuNDAuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5s
aW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQt
ZGV2Cg==
