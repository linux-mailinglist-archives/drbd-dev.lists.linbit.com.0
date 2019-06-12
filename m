Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id B833142871
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 16:10:25 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B9D9A1028A75;
	Wed, 12 Jun 2019 16:10:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 167FF1011BFC
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 16:10:24 +0200 (CEST)
Received: by mail-wm1-f47.google.com with SMTP id z23so6703686wma.4
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Q6NrFne7QMhrPRf43IuzP0zggfRq/NII8cOUfiNvVCA=;
	b=gAzraCVjRfMYqszZV4ABXhBLfcnkIwXJRsYOddOLVHHzMhTSCs2bp+BpOQg8DkQmE8
	3RFolAf7NqRemtXgOp3iQVOBZzJ7NKp2nlPaJ28V+7TFFkxk2Tt2pzh6sbcInjPbLPU7
	peDpiYiEQbHHVM51GTgNIov48edeCq7CRipiUPOe9fhLXDraO6260O6aeyto21FfjZE4
	V7V0xWiGQcVVWZZGfwfUrBW2NidbUXLo2WZiON9/AgVvIuE9/1SyLyYNV9LbXwJizeYe
	cIB+ocovvvjXzWhDYseeTF+nV/aC9axOt+nycza3q6T+Wuk5wK3SyYWeU9/1z1GwMTtz
	nitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Q6NrFne7QMhrPRf43IuzP0zggfRq/NII8cOUfiNvVCA=;
	b=jJxVr2rlux8kW5Oe2vvGdr0WIW2xcoqvK8eQVgJiON/zzdwqxJAeZvw9ZEHJ90+xiY
	COGYdeeFHF6CVYvbkALOHNSA1tXBt5VNkLl7i+TGWSOW9MxWMdCUjJgwTvaZMgYdbD+q
	1Kfa5VlLPjwF402Ij44I5YJMfbk3J/zby/5JOSgBrcl1SEWWnElwl5r7y2JnX366WcVn
	5wGKl8ebF50LlRjoNWv+VVEi9cnpl903sKaROkBe6dN5wdGGA2dFE4ZiFP/25BilSonz
	EOXU6FRMTKZwKfgWItVtCE6dIVIuhjr0cTH+pW36iaXDnxoeHvg+JwLF0bdkDCCj+T5+
	bx9g==
X-Gm-Message-State: APjAAAV1vTwovVP5PZxudza2RQXEjlDGp/YumUJu4eP8VbEuEvQgi7t1
	W/H4xvOeA3bx21MWrhJlZSneNeFZMMe4lw==
X-Google-Smtp-Source: APXvYqwsTUu6H4ttfF0aGZPjDqsIsLs2YV+zv/3mZvUaX7yf0rL9C4N1Wfgp8xZZmn68aSWJ15+FJw==
X-Received: by 2002:a1c:bbc1:: with SMTP id
	l184mr21911522wmf.111.1560348623444; 
	Wed, 12 Jun 2019 07:10:23 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id r131sm146453wmf.4.2019.06.12.07.10.22
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 07:10:22 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:10:21 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190612141021.GZ5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <456e2172-20fa-7b9d-47db-466f41123571@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <456e2172-20fa-7b9d-47db-466f41123571@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] Avoid compiler warning about non-bool in logical
 expression
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMTA6MDc6NTFBTSAtMDYwMCwgRGF2aWQgQnV0dGVyZmll
bGQgd3JvdGU6Cj4gQXZvaWQgYSBjb21waWxlciB3YXJuaW5nOgo+ICAgICBkcmJkX3JlY2VpdmVy
LmM6MTY5MzoxMjogd2FybmluZzogbG9naWNhbCDigJhhbmTigJkgYXBwbGllZCB0byBub24tYm9v
bGVhbiBjb25zdGFudCBbLVdsb2dpY2FsLW9wXQoKSSBkb24ndCBjYXJlLgoKPiBkaWZmIC0tZ2l0
IGEvZHJiZC9kcmJkX3JlY2VpdmVyLmMgYi9kcmJkL2RyYmRfcmVjZWl2ZXIuYwo+IEBAIC0xNjkw
LDcgKzE2OTAsNyBAQCBuZXh0X2JpbzoKPiAgICAgICAgICAgICAgICAgYmlvLT5iaV9uZXh0ID0g
TlVMTDsKPiAKPiAgICAgICAgICAgICAgICAgLyogc3RyaXAgb2ZmIFJFUV9VTlBMVUcgdW5sZXNz
IGl0IGlzIHRoZSBsYXN0IGJpbyAqLwo+IC0gICAgICAgICAgICAgICBpZiAoYmlvcyAmJiBEUkJE
X1JFUV9VTlBMVUcpCj4gKyAgICAgICAgICAgICAgIGlmIChiaW9zICYmIChEUkJEX1JFUV9VTlBM
VUcgIT0gMCkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgYmlvLT5iaV9vcGYgJj0gfkRSQkRf
UkVRX1VOUExVRzsKPiAgICAgICAgICAgICAgICAgZHJiZF9nZW5lcmljX21ha2VfcmVxdWVzdChk
ZXZpY2UsIGZhdWx0X3R5cGUsIGJpbyk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5i
aXQuY29tCmh0dHA6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
