Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C75F6347
	for <lists+drbd-dev@lfdr.de>; Thu,  6 Oct 2022 11:07:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15BEC4203D5;
	Thu,  6 Oct 2022 11:07:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 831BF4201A5
	for <drbd-dev@lists.linbit.com>; Thu,  6 Oct 2022 11:07:56 +0200 (CEST)
Received: by mail-wr1-f46.google.com with SMTP id n12so1656027wrp.10
	for <drbd-dev@lists.linbit.com>; Thu, 06 Oct 2022 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date;
	bh=1aJ5REXRMTq1sh1mUk4G4sr0eg6/nM0EyPCJJ1eSDvw=;
	b=oj64Vi+eOZpuQI+htjvWY8sZHF5q7NbF+S/U6svj8thZ8X+Vg61vlsVc/qwgGMjZPa
	VXvzaKeVOCf0sB0AzJGjZIAqfcpn0ScowzTj6E2p3tNJjjJFXlcuAxAxwbmYjy2X4PxD
	p5817amn3pGou9aDw3/3LN7zIHRtbNzeztLeODaCwncXV9oP4atBx6VB6dzF8F3BKapK
	8eq4LlFlCBqQ4Cc07YqQahf8C0LJxg4oWEy3v3wrV+QakfsJ2mtsguJXew72RomAcHro
	r2hI6ZgNVmzk3lDJEllh7IW2xAz8etTQX5Bo6N2ds44bV2iJpDX7XuEyc+8VFIfw5J7M
	vpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date;
	bh=1aJ5REXRMTq1sh1mUk4G4sr0eg6/nM0EyPCJJ1eSDvw=;
	b=S8w294QQfb1gwZgmYTuSgzCvh5w0mk/cfjMDMXKBeAmxCZNIYia9ymuVOugzR6HAcc
	D8jb9/TC0yFBVeaq1SCF3c80d6BotDEeJZ0mNr2tRzgzWj0goARa/Lwx1UxW9tac9KaC
	cqeZQGUbp78YNcf9BY44aeRB7IOwK2ATkF6ESKqh7TWtk43FPhqbaSB+t3RpHJczqJaz
	LAijsfEz+dvAPlBnJC3t7aD7XQyCBZtMMWdBh6jCCyXskIdR3OGt1b4twGE/1yBL5oHp
	Zl8jDfjKbFIPZit3tNQ597z7I12pNJZBhjEIHdYYPyqRkc7LK/kVLO/kWiPJSyIH3gTx
	8BQQ==
X-Gm-Message-State: ACrzQf2zsfgSzRF1Xwy25+k/2nUXcLsvUqqmgO1QlScEdNQLJdQYztZI
	8dkUnAIDWwEPi4BVbZmy3Une5qj0
X-Google-Smtp-Source: AMsMyM4T3aR66ySnGUYOn1F8FVH43uhaw24LlS828ZglEOXX6NaXvHYdoyqonBfmR2ibWCuDf+ldjg==
X-Received: by 2002:a5d:4889:0:b0:22b:214:38dd with SMTP id
	g9-20020a5d4889000000b0022b021438ddmr2603126wrq.32.1665047276144;
	Thu, 06 Oct 2022 02:07:56 -0700 (PDT)
Received: from [10.43.66.1] (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	l20-20020a1c7914000000b003b47ff307e1sm873687wme.31.2022.10.06.02.07.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Oct 2022 02:07:55 -0700 (PDT)
Message-ID: <892bcf4d-70d9-8833-9449-c55fa719158e@linbit.com>
Date: Thu, 6 Oct 2022 11:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.11.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
References: <20221005214844.2699-1-Jason@zx2c4.com>
	<20221005214844.2699-2-Jason@zx2c4.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221005214844.2699-2-Jason@zx2c4.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v1 1/5] treewide: use prandom_u32_max() when
	possible
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

T24gMDUuMTAuMjIgMjM6NDgsIEphc29uIEEuIERvbmVuZmVsZCB3cm90ZToKPiBSYXRoZXIgdGhh
biBpbmN1cnJpbmcgYSBkaXZpc2lvbiBvciByZXF1ZXN0aW5nIHRvbyBtYW55IHJhbmRvbSBieXRl
cyBmb3IKPiB0aGUgZ2l2ZW4gcmFuZ2UsIHVzZSB0aGUgcHJhbmRvbV91MzJfbWF4KCkgZnVuY3Rp
b24sIHdoaWNoIG9ubHkgdGFrZXMKPiB0aGUgbWluaW11bSByZXF1aXJlZCBieXRlcyBmcm9tIHRo
ZSBSTkcgYW5kIGF2b2lkcyBkaXZpc2lvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQS4g
RG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L21tL3BhdC9jcGEt
dGVzdC5jICAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIGNyeXB0by90ZXN0bWdyLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDg2ICsrKysrKysrKy0tLS0tLS0tLS0KPiAgZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyAgICAgICAgICAgIHwgIDQgKy0KCkZvciB0
aGUgZHJiZCBwYXJ0OgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0
b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+Cgo+ICBkcml2ZXJzL2luZmluaWJhbmQvY29yZS9j
bWEuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2luZmluaWJhbmQvaHcvY3hn
YjQvaWRfdGFibGUuYyAgICAgICAgfCAgNCArLQo+ICBkcml2ZXJzL2luZmluaWJhbmQvaHcvaG5z
L2huc19yb2NlX2FoLmMgICAgICAgfCAgNSArLQo+ICBkcml2ZXJzL2luZmluaWJhbmQvdWxwL3J0
cnMvcnRycy1jbHQuYyAgICAgICAgfCAgMyArLQo+ICBkcml2ZXJzL21tYy9jb3JlL2NvcmUuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBkcml2ZXJzL21tYy9ob3N0L2R3X21tYy5j
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
c2ltLmMgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBkcml2ZXJzL210ZC90ZXN0cy9tdGRfbmFu
ZGVjY3Rlc3QuYyAgICAgICAgICAgfCAxMCArLS0KPiAgZHJpdmVycy9tdGQvdGVzdHMvc3RyZXNz
dGVzdC5jICAgICAgICAgICAgICAgIHwgMTcgKy0tLQo+ICBkcml2ZXJzL210ZC91YmkvZGVidWcu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL210ZC91YmkvZGVidWcu
aCAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9i
cm9hZGNvbS9jbmljLmMgICAgICAgICAgfCAgMyArLQo+ICAuLi4vY2hlbHNpby9pbmxpbmVfY3J5
cHRvL2NodGxzL2NodGxzX2lvLmMgICAgfCAgNCArLQo+ICBkcml2ZXJzL25ldC9oYW1yYWRpby9i
YXljb21fZXBwLmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9oYW1yYWRpby9o
ZGxjZHJ2LmMgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9oYW1yYWRpby95
YW0uYyAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9waHkvYXQ4MDN4
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAuLi4vYnJvYWRjb20vYnJjbTgwMjEx
L2JyY21mbWFjL3AycC5jICAgICAgICAgfCAgMiArLQo+ICAuLi4vbmV0L3dpcmVsZXNzL2ludGVs
L2l3bHdpZmkvbXZtL21hYy1jdHh0LmMgfCAgMiArLQo+ICBkcml2ZXJzL3Njc2kvZmNvZS9mY29l
X2N0bHIuYyAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBkcml2ZXJzL3Njc2kvcWVkaS9xZWRp
X21haW4uYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBmcy9jZXBoL2lub2RlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBmcy9jZXBoL21kc21hcC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBmcy9leHQ0L3N1cGVyLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArLQo+ICBmcy9mMmZzL2djLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBmcy9mMmZzL3NlZ21lbnQuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArLQo+ICBmcy91Ymlmcy9kZWJ1Zy5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArLQo+ICBmcy91Ymlmcy9scHRfY29tbWl0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArLS0KPiAgZnMvdWJpZnMvdG5jX2NvbW1pdC5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZnMveGZzL2xpYnhmcy94ZnNfYWxs
b2MuYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZnMveGZzL2xpYnhmcy94ZnNfaWFs
bG9jLmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZnMveGZzL3hmc19lcnJvci5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAga2VybmVsL3RpbWUvY2xvY2tzb3Vy
Y2UuYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgbGliL2ZhdWx0LWluamVjdC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgbGliL2ZpbmRfYml0X2JlbmNobWFy
ay5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgbGliL3JlZWRfc29sb21vbi90ZXN0
X3JzbGliLmMgICAgICAgICAgICAgICAgIHwgIDYgKy0KPiAgbGliL3NiaXRtYXAuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgbGliL3Rlc3RfbGlzdF9zb3J0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgbGliL3Rlc3Rfdm1hbGxvYy5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTcgKy0tLQo+ICBuZXQvY2VwaC9tb25fY2xpZW50
LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvY2VwaC9vc2RfY2xpZW50
LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvY29yZS9uZWlnaGJvdXIu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvY29yZS9wa3RnZW4uYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0MyArKysrKy0tLS0tCj4gIG5ldC9jb3JlL3N0
cmVhbS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIG5ldC9pcHY0L2ln
bXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCj4gIG5ldC9pcHY0L2lu
ZXRfY29ubmVjdGlvbl9zb2NrLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIG5ldC9pcHY0L2lu
ZXRfaGFzaHRhYmxlcy5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIG5ldC9pcHY2L2Fk
ZHJjb25mLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICstCj4gIG5ldC9pcHY2L21j
YXN0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICstLQo+ICBuZXQvbmV0Zmls
dGVyL2lwdnMvaXBfdnNfdHdvcy5jICAgICAgICAgICAgICAgfCAgNCArLQo+ICBuZXQvcGFja2V0
L2FmX3BhY2tldC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvc2NoZWQv
YWN0X2dhY3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvc2NoZWQv
YWN0X3NhbXBsZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvc2NoZWQv
c2NoX25ldGVtLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBuZXQvc2N0cC9z
b2NrZXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvc3VucnBj
L2NhY2hlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvc3VucnBj
L3hwcnRzb2NrLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQvdGlwYy9z
b2NrZXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQveGZybS94
ZnJtX3N0YXRlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICA2MiBmaWxlcyBj
aGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKSwgMTk2IGRlbGV0aW9ucygtKQo+IApbLi4uXQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIGIvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwo+IGluZGV4IGFmNGM3ZDY1NDkwYi4uZDhiMTQxN2Rj
NTAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKPiAr
KysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jCj4gQEAgLTc4MSw3ICs3ODEs
NyBAQCBzdGF0aWMgc3RydWN0IHNvY2tldCAqZHJiZF93YWl0X2Zvcl9jb25uZWN0KHN0cnVjdCBk
cmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sCj4gIAo+ICAJdGltZW8gPSBjb25uZWN0X2ludCAq
IEhaOwo+ICAJLyogMjguNSUgcmFuZG9tIGppdHRlciAqLwo+IC0JdGltZW8gKz0gKHByYW5kb21f
dTMyKCkgJiAxKSA/IHRpbWVvIC8gNyA6IC10aW1lbyAvIDc7Cj4gKwl0aW1lbyArPSBwcmFuZG9t
X3UzMl9tYXgoMikgPyB0aW1lbyAvIDcgOiAtdGltZW8gLyA3Owo+ICAKPiAgCWVyciA9IHdhaXRf
Zm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0KCZhZC0+ZG9vcl9iZWxsLCB0aW1l
byk7Cj4gIAlpZiAoZXJyIDw9IDApCj4gQEAgLTEwMDQsNyArMTAwNCw3IEBAIHN0YXRpYyBpbnQg
Y29ubl9jb25uZWN0KHN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24pCj4gIAkJCQlk
cmJkX3dhcm4oY29ubmVjdGlvbiwgIkVycm9yIHJlY2VpdmluZyBpbml0aWFsIHBhY2tldFxuIik7
Cj4gIAkJCQlzb2NrX3JlbGVhc2Uocyk7Cj4gIHJhbmRvbWl6ZToKPiAtCQkJCWlmIChwcmFuZG9t
X3UzMigpICYgMSkKPiArCQkJCWlmIChwcmFuZG9tX3UzMl9tYXgoMikpCj4gIAkJCQkJZ290byBy
ZXRyeTsKPiAgCQkJfQo+ICAJCX1bLi4uXQoKKEhhZCB0byBjdXQgb3V0IG1vc3Qgb2YgdGhlIEND
IGxpc3QgYmVjYXVzZSBHb29nbGUgY29tcGxhaW5zIGFib3V0ICJ0b28gbWFueQpyZWNpcGllbnRz
IikuCgotLQpDaHJpc3RvcGggQsO2aG13YWxkZXIKTElOQklUIHwgS2VlcGluZyB0aGUgRGlnaXRh
bCBXb3JsZCBSdW5uaW5nCkRSQkQgSEEg4oCUICBEaXNhc3RlciBSZWNvdmVyeSDigJQgU29mdHdh
cmUgZGVmaW5lZCBTdG9yYWdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29t
Cmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
