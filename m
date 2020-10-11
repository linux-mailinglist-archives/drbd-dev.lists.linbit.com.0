Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2E28BBD4
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:28:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8CF642039E;
	Mon, 12 Oct 2020 17:28:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6337420347
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:27:14 +0200 (CEST)
Received: by mail-ed1-f65.google.com with SMTP id v19so17383122edx.9
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:organization:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:autocrypt;
	bh=s6nKmcbIE4B06/ESvYohb/PQ+kM0eV01arzzpJaaByo=;
	b=NVg+JtuqFCkx7NiOzPiFjRjSY6ujuN9Z7NvWPIeVynKkKdjrO+653whLcUAGqI44Xb
	yj+/CnerSXsbsCcuEB5jAiMV1AM4gOipRRg/ihW2fIL+T5kcingM7v/EY7mThhOHH+9K
	HVNhlLuliedGDlfWT23zmJwZL4oyGIsTzugBhTTgSRgHZ7qz7iUHpi2+Ivnf4PSfu1Sd
	66WjZ7ZS8vxk5JNqMposYvpypc5O+ZH9aN93+ssYpkxh3eJ7fBjMoxKrzeQ1UvBodSv4
	dBoWxbRisEthBncTZtQTNMevPPxgc+gl86RgbsKzCwbe+p8/zqu2PM7F4s78P2jf8bhn
	gIkQ==
X-Gm-Message-State: AOAM530tDVBZ9CrR57wshULFjo2j5XGjNmUR3Vj8IhbsmL4wAOg02kBr
	BX50i1U5jUCr4+4pZ905eFANvxh96UL7JWGy
X-Google-Smtp-Source: ABdhPJwMvbmHd2JndmRA0yM+wCc0vrtEkcpNC+Xb0uimiyBlBvGAtFKc7czthu5Funp4AQnxnfN8rg==
X-Received: by 2002:aa7:d689:: with SMTP id d9mr15229666edr.128.1602516374001; 
	Mon, 12 Oct 2020 08:26:14 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214])
	by smtp.gmail.com with ESMTPSA id m2sm10867204ejo.4.2020.10.12.08.26.13
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:13 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:11 +0200
Resent-Message-ID: <20201012152611.GB2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 492 seconds by postgrey-1.31 at mail19;
	Sun, 11 Oct 2020 20:47:43 CEST
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net
	[176.9.242.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8720D42022A
	for <drbd-dev@lists.linbit.com>; Sun, 11 Oct 2020 20:47:43 +0200 (CEST)
Received: from h06.hostsharing.net (h06.hostsharing.net
	[IPv6:2a01:37:1000::53df:5f19:0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 39F7F101E69A6;
	Sun, 11 Oct 2020 20:47:43 +0200 (CEST)
Received: from mail.home.lxtec.de
	(HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de
	[95.208.10.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by h06.hostsharing.net (Postfix) with ESMTPSA id 05D06603E049;
	Sun, 11 Oct 2020 20:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
	s=mailxtec;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:reply-to;
	bh=s6nKmcbIE4B06/ESvYohb/PQ+kM0eV01arzzpJaaByo=;
	b=HZlzgSNxc1isOXOPeBP9knYMJU
	cscotxTFOIhQLorKBm9itcJfFyRPLamYodFwibBeqLtziu6Z4WRKNFG/kylDuoaGGd7MEbbqg9iHQ
	6zdE1Tpc2jukBkLa1xqgcSqj6jRgo/0cXsc8IzBcKCO5tQOOdLot8q+paATOBLCJPuL4l28Va7DQO
	ELif6Ey2YOp5e+fC427jpO9QY9ulWbpaN7zLccen67MSlPq0ONi6/HQqZXZo3EDsHmvuexKinBe5r
	OOq1qX/r1b6e1wWLk12xx4If2KOyyU0z14GzRjMhAYYpkEgEhI3Yak25cWyZNBrvgAUKViBh00KUG
	8WnwfNaQ==;
Received: from [127.0.0.1] (helo=localhost)
	by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
	id 1kRgNi-0002yY-4l; Sun, 11 Oct 2020 20:47:42 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Am6NnrLjmlo; Sun, 11 Oct 2020 20:47:42 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
	id 1kRgNi-0002yT-0P; Sun, 11 Oct 2020 20:47:42 +0200
Date: Sun, 11 Oct 2020 20:47:41 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20201011184741.c766frixh5v7xgyb@toy.home.lxtec.de>
Organization: LXTEC
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
	<20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
Autocrypt: addr=riesebie@lxtec.de; prefer-encrypt=mutual; keydata=
	mDMEX1jtwhYJKwYBBAHaRw8BAQdAs61HjQAz35WpPCY10Cv+Yogn7p9Jj9h6RCCumDwgEXG0JkV
	saW1hciBSaWVzZWJpZXRlciA8cmllc2ViaWVAbHh0ZWMuZGU+iJAEExYIADgWIQRZA1EIeV8CRb
	fDhJMnMQo2HZmVNQUCX1jtwgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAnMQo2HZmVN
	WcPAP9wwap25jg2f1mS3353l3suaXcBsfX0XNGdCSfICVzUOAEA9GBRqB3/rOgLBLhZKnpJ1GFI
	ENN3OQ54tk+fzNVe3ga4OARfWO3CEgorBgEEAZdVAQUBAQdA6qcxjNtSY3LupzR/w0kMPsiljNb
	VvDBVhlb1gWPsoXgDAQgHiHgEGBYIACAWIQRZA1EIeV8CRbfDhJMnMQo2HZmVNQUCX1jtwgIbDA
	AKCRAnMQo2HZmVNSlSAP9Ip88aSckUV3dQrBgYEQdqBQ9No4/4LZLLBVJH2mDPTAEA6stoZOHJk
	ZZOPGu9KvBC1ZzUkKJTBHKR/+M9R1sBhgw=
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument
 was removed in v5.8
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

KiBFbGltYXIgUmllc2ViaWV0ZXIgPHJpZXNlYmllQGx4dGVjLmRlPiBbMjAyMC0xMC0xMSAyMDoz
OSArMDIwMF06Cgo+IEFwcGxpZWQgdGhhdCBwYXRjaCB0byB0YWcgOS4wLjI1LTEuIEJ1aWxkaW5n
IHRoZSBtb2R1bGUgdmlhIGRrbXMKPiBnaXZlczoKPiAKPiAvdmFyL2xpYi9ka21zL2RyYmQvOS4w
LjI1LTFoc2gyL2J1aWxkL3NyYy9kcmJkL2RyYmRfYml0bWFwLmM6IEluIGZ1bmN0aW9uIOKAmGJt
X3JlYWxsb2NfcGFnZXPigJk6Cj4gL3Zhci9saWIvZGttcy9kcmJkLzkuMC4yNS0xaHNoMi9idWls
ZC9zcmMvZHJiZC9kcmJkX2JpdG1hcC5jOjM2ODoxNTogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRz
IHRvIGZ1bmN0aW9uIOKAmF9fdm1hbGxvY+KAmQo+ICAgIG5ld19wYWdlcyA9IF9fdm1hbGxvYyhi
eXRlcywKPiAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
L3Zhci9saWIvZGttcy9kcmJkLzkuMC4yNS0xaHNoMi9idWlsZC9zcmMvZHJiZC9kcmJkX2JpdG1h
cC5jOjE2Ogo+IC91c3Ivc3JjL2xpbnV4LWhlYWRlcnMtNC4xOS4wLTktY29tbW9uL2luY2x1ZGUv
bGludXgvdm1hbGxvYy5oOjgwOjE0OiBub3RlOiBkZWNsYXJlZCBoZXJlCj4gIGV4dGVybiB2b2lk
ICpfX3ZtYWxsb2ModW5zaWduZWQgbG9uZyBzaXplLCBnZnBfdCBnZnBfbWFzaywgcGdwcm90X3Qg
cHJvdCk7Cj4gICAgICAgICAgICAgICBefn5+fn5+fn4KClRoaXMgd2FzIG9uIDQuMTkuIEkgdGhp
bmsgdGhlIGNoYW5nZXMgbXVzdCBkZXBlbmQgb24gS1ZFUlMgYXMgdGhlCm1vZHVsZXMgc2hvdWxk
IGJ1aWxkIGZyb20gNC4xOSB1cHdhcmRzLiBXaWxsIHRyeSB5b3VyIHBhdGNoIGFnYWluc3QKNS44
IHRvbW9ycm93LgoKRWxpbWFyCi0tIAogIEZyb20gVGhlIENvbGxhYm9yYXRpdmUgSW50ZXJuYXRp
b25hbCBEaWN0aW9uYXJ5IG9mIEVuZ2xpc2ggdi4wLjQ4IFtnY2lkZV06CiAgLgogIGFyc2Vob2xl
IFxhcnNlImhvbGVgXCAoW2F1bV1ycyJoWz1vXWxgKSwgbi4KICAgICAgICAgMS4gZXhlY3JldG9y
eSBvcGVuaW5nIGF0IHRoZSBlbmQgb2YgdGhlIGFsaW1lbnRhcnkgY2FuYWwuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxp
c3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kcmJkLWRldgo=
