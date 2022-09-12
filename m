Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B56995B556B
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Sep 2022 09:36:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8BAB42177E;
	Mon, 12 Sep 2022 09:36:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 64A07421741
	for <drbd-dev@lists.linbit.com>; Mon, 12 Sep 2022 09:36:54 +0200 (CEST)
Received: by mail-ej1-f41.google.com with SMTP id r18so18085085eja.11
	for <drbd-dev@lists.linbit.com>; Mon, 12 Sep 2022 00:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date;
	bh=STwRKhcie1TYX/UWl9oKyUQWGhI2tB2KmS4N6lYy1yw=;
	b=kElQrz5ncnTEP1T2BX5aB5JGQzZ4VJoWq5qMUZfEkGq+YYtpF4qnRwXjH+s+zc1w6H
	ss+DUhyE7I5+vd+17rzYQUCx59qIo59LsIKbNUNil0yWAjBNqMUGE1OSeCp/Tb+XI71A
	icEDgbeusgnAlchesp4PaBfrnGybnz0yb4vllrGYl+WlbWMmFcfckLMW/dNGmJTxPZoI
	03e1uvfps8KqXpWo+tnqhmGLNcxFmMJUOHYtiDy5z93IT/rw6TGt9F+4sIb2EJc72JTJ
	6wEDlSTsNk/tVPkdqHIACvRV9b+oAaII46XbJA5oEc1lOLvaBfNw/Tt2oXYsHCC0pcXO
	FWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date;
	bh=STwRKhcie1TYX/UWl9oKyUQWGhI2tB2KmS4N6lYy1yw=;
	b=cTXloV4rToXwdRmr8VoXf8XZK4s6CWUErWx0I5w71B1Q/HIbH4AJA60cgV4tUGKHN/
	j+KCg8M0EO8TIGlXe/YgqA6p+fRQUoLgpaRyw+j53DAwYlFMvUZYug6uen1Vz+nnpHxz
	7NKAipG+68dQUnZ8g8KpMsn8iapKusncm5fOxXx4KiWsfhuMb4XYtD+3UYEpB9VCUNcM
	Czge1/lrhpNXhnSnWxpEQIvKAcKGRngf9vnA8AUJJm40k8gzxOiC79hZBOGXmM6JVGFI
	IgIi/feaUPVDVrEDcGmpwKFxzuaUAx8Rsum2FtYnQBOE6gK7KxHKvMgPr50U50hvWxy9
	Zu1w==
X-Gm-Message-State: ACgBeo0bGnzNxnZvg1Z4q8oyLHsUiEdXzG8GeOu9+iT85kVvo147TbcL
	IQ0OqyIh1zmjgpYN+J1HpOo8ngyi
X-Google-Smtp-Source: AA6agR47Qp1NM0E0iOWqb/2DKOjkPSsxGj2ocpchJACHJ/mrzpk0ziDH0c24v8NDZMChTT14gfv3cg==
X-Received: by 2002:a17:907:dab:b0:742:5e2e:6e4 with SMTP id
	go43-20020a1709070dab00b007425e2e06e4mr17456884ejc.338.1662968213756;
	Mon, 12 Sep 2022 00:36:53 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	l1-20020a1709063d2100b00771cb506149sm4030135ejf.59.2022.09.12.00.36.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 12 Sep 2022 00:36:53 -0700 (PDT)
Message-ID: <eabdb4f6-c58e-dcb9-b886-7e244754c461@linbit.com>
Date: Mon, 12 Sep 2022 09:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.12.0
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>
References: <20220911092645.3218009-1-cuigaosheng1@huawei.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220911092645.3218009-1-cuigaosheng1@huawei.com>
Cc: axboe@kernel.dk, lars.ellenberg@linbit.com, philipp.reisner@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block/drbd: remove unused w_start_resync
	declaration
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

QW0gMTEuMDkuMjIgdW0gMTE6MjYgc2NocmllYiBHYW9zaGVuZyBDdWk6Cj4gd19zdGFydF9yZXN5
bmMgaGFzIGJlZW4gcmVtb3ZlZCBzaW5jZQo+IGNvbW1pdCBhYzBhY2I5ZTM5YWMgKCJkcmJkOiB1
c2UgZHJiZF9kZXZpY2VfcG9zdF93b3JrKCkKPiBpbiBtb3JlIHBsYWNlcyIpLCBzbyByZW1vdmUg
aXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2Fvc2hlbmcgQ3VpIDxjdWlnYW9zaGVuZzFAaHVhd2Vp
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmggfCAxIC0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfaW50LmggYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAo+IGluZGV4
IGYxNWYyZjA0MTU5Ni4uNGQ2NjEyODJmZjQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX2ludC5oCj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKPiBA
QCAtMTUyOSw3ICsxNTI5LDYgQEAgZXh0ZXJuIGludCB3X3NlbmRfcmVhZF9yZXEoc3RydWN0IGRy
YmRfd29yayAqLCBpbnQpOwo+ICBleHRlcm4gaW50IHdfZV9yZWlzc3VlKHN0cnVjdCBkcmJkX3dv
cmsgKiwgaW50KTsKPiAgZXh0ZXJuIGludCB3X3Jlc3RhcnRfZGlza19pbyhzdHJ1Y3QgZHJiZF93
b3JrICosIGludCk7Cj4gIGV4dGVybiBpbnQgd19zZW5kX291dF9vZl9zeW5jKHN0cnVjdCBkcmJk
X3dvcmsgKiwgaW50KTsKPiAtZXh0ZXJuIGludCB3X3N0YXJ0X3Jlc3luYyhzdHJ1Y3QgZHJiZF93
b3JrICosIGludCk7Cj4gIAo+ICBleHRlcm4gdm9pZCByZXN5bmNfdGltZXJfZm4oc3RydWN0IHRp
bWVyX2xpc3QgKnQpOwo+ICBleHRlcm4gdm9pZCBzdGFydF9yZXN5bmNfdGltZXJfZm4oc3RydWN0
IHRpbWVyX2xpc3QgKnQpOwoKVGhhbmtzIGZvciB0aGUgcGF0Y2gsIGxvb2tzIGdvb2QgdG8gbWUu
CgpBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJA
bGluYml0LmNvbT4KCi0tIApDaHJpc3RvcGggQsO2aG13YWxkZXIKTElOQklUIHwgS2VlcGluZyB0
aGUgRGlnaXRhbCBXb3JsZCBSdW5uaW5nCkRSQkQgSEEg4oCUICBEaXNhc3RlciBSZWNvdmVyeSDi
gJQgU29mdHdhcmUgZGVmaW5lZCBTdG9yYWdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5s
aW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQt
ZGV2Cg==
