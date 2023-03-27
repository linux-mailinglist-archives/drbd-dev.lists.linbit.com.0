Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE66CA413
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Mar 2023 14:28:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1FAF420966;
	Mon, 27 Mar 2023 14:28:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7728D420312
	for <drbd-dev@lists.linbit.com>; Mon, 27 Mar 2023 14:28:40 +0200 (CEST)
Received: by mail-wr1-f42.google.com with SMTP id j24so8640730wrd.0
	for <drbd-dev@lists.linbit.com>; Mon, 27 Mar 2023 05:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1679920120;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=7JE7QdvKaZYNiC+EHD6Zp12m/upgFyEAxrLdJhc4mQQ=;
	b=2L0cR5VE2NFhVPykwsr4iw3GlHlZuOz/yTvn7XLSW0BbgbuceoOqdTYO3ba2irsviG
	tqODrs0635EEPHYkxxMW6IP5tFr+qNcFFuZsCaEN5jSFRvtzh4aodQEruC0iH7w8RGPf
	w4v4HSAzC4/lTVdvhrdGUAHvQLybaEoXo0jQSluLK4+n8sBIGulmpBtWxlhiETyPS6+9
	FDxT8anFyaMOG+pEsCtl34lHodYnMqdtqWKoNYT4DA+1PTHED3jOL4KcEavojhBrKQDM
	3RkwnlBekLln7xj7/MPlqU+ZeUa//7ckmCFfRFueD1q8Opy3xng9vUWcSqI/5Jq09eFX
	xBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1679920120;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=7JE7QdvKaZYNiC+EHD6Zp12m/upgFyEAxrLdJhc4mQQ=;
	b=6QLto0mQePl38MtX8EtGjXenikP30ON0BphesOSdgXUUHQV9NjgTRMhWmS7CpC2lBt
	9ed/Ujtqvyn8ueL38Gg/2Hcx3ZEpgcfh1nPY5SjqeegyhBmSPhjrM34Tv8wlgYpcscem
	+Vh1yiEjQHY4I7IeP9QsCDIjmyUAd6oi/m/kQNRgSgVHCea+Y+j9ZXhQBU+U6Em+elZG
	JJ5+2wfGHze40Q2iNDeOJ4mjeW84z9XOFe8qFol5HojQxttWDflL+R1YSiQsQ4GX3WCe
	V/+DoBx+EOcWCkJ0YDOyMJ+kYN+zBdKYaA2dYtaVIccOgAZ4pptNlePv3efp2hd2gPoD
	/inw==
X-Gm-Message-State: AAQBX9d6JxT3zhrb2lBpg+qt8gDnzlhPUfMc6IYV1pZU5S47ig6d14l9
	NE2QAAlcnuIbEy9LqNovnDlu9hdC
X-Google-Smtp-Source: AKy350aYLU0BuXDE6SXKbUGRw51RJogCMJNwzIn8Anvk+Et3prniahCnvNWUrpjPpBnsQ7XeEp0+nQ==
X-Received: by 2002:a5d:6a87:0:b0:2d0:c73d:ef2a with SMTP id
	s7-20020a5d6a87000000b002d0c73def2amr9184389wru.24.1679920119730;
	Mon, 27 Mar 2023 05:28:39 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	t13-20020adfe10d000000b002db1b66ea8fsm11525226wrz.57.2023.03.27.05.28.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Mar 2023 05:28:38 -0700 (PDT)
Message-ID: <a989f01e-79a9-44a4-3603-ba4eeeb86dea@linbit.com>
Date: Mon, 27 Mar 2023 14:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.8.0
To: Markus Elfring <Markus.Elfring@web.de>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
	<8d193937-532f-959f-9b84-d911984508aa@web.de>
	<941709b5-d940-42c9-5f31-7ed56e3e6151@web.de>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <941709b5-d940-42c9-5f31-7ed56e3e6151@web.de>
Cc: Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, cocci@inria.fr,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH resent] drbd: Fix exception handling in
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

QW0gMjUuMDMuMjMgdW0gMTU6MDcgc2NocmllYiBNYXJrdXMgRWxmcmluZzoKPiBEYXRlOiBGcmks
IDE3IE1hciAyMDIzIDE4OjMyOjA1ICswMTAwCj4gCj4gVGhlIGxhYmVsIOKAnG5sYV9wdXRfZmFp
bHVyZeKAnSB3YXMgdXNlZCB0byBqdW1wIHRvIGFub3RoZXIgcG9pbnRlciBjaGVjawo+IGRlc3Bp
dGUgb2YgdGhlIGRldGFpbCBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIGZ1bmN0aW9uCj4g
4oCcbmxhX3B1dF9kcmJkX2NmZ19jb250ZXh04oCdIHRoYXQgaXQgd2FzIGRldGVybWluZWQgYWxy
ZWFkeSB0aGF0Cj4gdGhlIGNvcnJlc3BvbmRpbmcgdmFyaWFibGUgY29udGFpbmVkIGEgbnVsbCBw
b2ludGVyLgo+IAo+ICogVGh1cyByZXR1cm4gZGlyZWN0bHkgYWZ0ZXIgYSBjYWxsIG9mIHRoZSBm
dW5jdGlvbgo+ICAg4oCcbmxhX25lc3Rfc3RhcnRfbm9mbGFn4oCdIGZhaWxlZC4KPiAKPiAqIERl
bGV0ZSBhbiBleHRyYSBwb2ludGVyIGNoZWNrIHdoaWNoIGJlY2FtZSB1bm5lY2Vzc2FyeQo+ICAg
d2l0aCB0aGlzIHJlZmFjdG9yaW5nLgo+IAo+IAo+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5
IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgo+IAo+IEZpeGVzOiA1NDNjYzEwYjRjYzVj
NjBhYTlmY2M2MjcwNWNjZmI5OTk4YmY0Njk3ICgiZHJiZDogZHJiZF9hZG1fZ2V0X3N0YXR1cyBu
ZWVkcyB0byBzaG93IHNvbWUgbW9yZSBkZXRhaWwiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBF
bGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiAtLS0KPiAgZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfbmwuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbmwuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKPiBpbmRleCBmNDlm
MmE1MjgyZTEuLjljYjk0NzEyNzQ3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9ubC5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwo+IEBAIC0zMTg3
LDcgKzMxODcsNyBAQCBzdGF0aWMgaW50IG5sYV9wdXRfZHJiZF9jZmdfY29udGV4dChzdHJ1Y3Qg
c2tfYnVmZiAqc2tiLAo+ICAJc3RydWN0IG5sYXR0ciAqbmxhOwo+ICAJbmxhID0gbmxhX25lc3Rf
c3RhcnRfbm9mbGFnKHNrYiwgRFJCRF9OTEFfQ0ZHX0NPTlRFWFQpOwo+ICAJaWYgKCFubGEpCj4g
LQkJZ290byBubGFfcHV0X2ZhaWx1cmU7Cj4gKwkJcmV0dXJuIC1FTVNHU0laRTsKPiAgCWlmIChk
ZXZpY2UgJiYKPiAgCSAgICBubGFfcHV0X3UzMihza2IsIFRfY3R4X3ZvbHVtZSwgZGV2aWNlLT52
bnIpKQo+ICAJCWdvdG8gbmxhX3B1dF9mYWlsdXJlOwo+IEBAIC0zMjA1LDggKzMyMDUsNyBAQCBz
dGF0aWMgaW50IG5sYV9wdXRfZHJiZF9jZmdfY29udGV4dChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+
ICAJcmV0dXJuIDA7Cj4gCj4gIG5sYV9wdXRfZmFpbHVyZToKPiAtCWlmIChubGEpCj4gLQkJbmxh
X25lc3RfY2FuY2VsKHNrYiwgbmxhKTsKPiArCW5sYV9uZXN0X2NhbmNlbChza2IsIG5sYSk7Cj4g
IAlyZXR1cm4gLUVNU0dTSVpFOwo+ICB9Cj4gCj4gLS0KPiAyLjQwLjAKPiAKClNvcnJ5LCBJIGZh
aWwgdG8gc2VlIGhvdyB0aGlzIGlzIGFuIGltcHJvdmVtZW50IG92ZXIgdGhlIHN0YXR1cyBxdW8s
Cm11Y2ggbGVzcyBhICJmaXgiLgoKQ2FuIHlvdSBpZGVudGlmeSB0aGUgaXNzdWUgd2l0aCB0aGUg
Y3VycmVudCBjb2RlIGFuZCBjYW4geW91IGV4cGxhaW4gaG93CnlvdXIgcGF0Y2ggbWFrZXMgaXQg
YmV0dGVyPwoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBE
aWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBT
b2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
