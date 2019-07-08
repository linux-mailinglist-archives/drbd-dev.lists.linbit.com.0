Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD162CB9
	for <lists+drbd-dev@lfdr.de>; Tue,  9 Jul 2019 01:39:18 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E7AC103B4B8;
	Tue,  9 Jul 2019 01:39:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 389 seconds by postgrey-1.31 at mail09;
	Tue, 09 Jul 2019 01:39:14 CEST
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id ADF2C1011BF7
	for <drbd-dev@lists.linbit.com>; Tue,  9 Jul 2019 01:39:14 +0200 (CEST)
Received: by mail-wr1-f48.google.com with SMTP id n4so18963751wrs.3
	for <drbd-dev@lists.linbit.com>; Mon, 08 Jul 2019 16:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=1WsNVXyvKNCRaYYK0f9IanUSbowr99fm7hwQdC9LW/I=;
	b=NbxiNg9INOgtjKtIrAHggdZswlROAq9B7xoM0dFIg3FGbNkvYue6M8cXktrCrq7YKT
	kn1/BofOT8xVXm974agDgBZhJy24vYd42BKRdnPJ0OoyjQKyJqOcoNyliAn6n/r1gG0L
	uSymANm7tty6HkaiIQh7dEn7DgykhtSNnMxzEjxTP5xmfchOYlHB6DiWDDpoUOtRYIGx
	AtWPNiFoGKrqTwNEOOcukyZ4KKCmAb3vImpXY5N0XrhKiFbdN/xVzK1H0u9ULSCG4dzZ
	NKx7a0l+9PAgaTFTk4MM7/3IlnCcVkKECwKJ92a90viQeZDX1j5hgnaP/l8YMJJjyaqO
	1wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=1WsNVXyvKNCRaYYK0f9IanUSbowr99fm7hwQdC9LW/I=;
	b=mt5uE0m9K7h8WdXKkapQXbNmmm4AanPuTz+BuijvGfFBFweSGr+wURH102DqQ0EXPK
	rAPrtN5Ct1SC4w7K+xAT7ZeYIbWOXc5K23iLzJ5ZIGO5kDbgIyyCIemsipun6QgS8zCP
	7yk+JZ/sfR9CV018ZANkEqdy9z8FDHvgnUsPviqTa6CWFi/wAhFjdxtxHn6bO7Fnhn/N
	92dVCSUKtfafRSstiIwqICw3hIc9eNVBxaQ6tNjy4WEbgBSwEaH1qMtXFsnRiwmannxL
	2QkQg0Sbdw7edumx3wvu8v8jKxFvQswylSTDZ/fKQfPqrcIckoQVaWwZr79vvi9IJ5Hv
	93gA==
X-Gm-Message-State: APjAAAV3uUNCZXF5ffenZLI1ZMFi/isZQPWwg7pqtRBpMZzzG6zYfa3q
	NdsR0U54VmeDHx/ZQMz36g6ZaWnlJ7rFKeIC
X-Google-Smtp-Source: APXvYqzQyyItn+BzBvrTUAb68gEGMyqngX9RoWGPD0N0r3eB3T6cs/BjxgQ1Y/4vlFNCHZePvhzIdw==
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr19754889wrw.8.1562628764955;
	Mon, 08 Jul 2019 16:32:44 -0700 (PDT)
Received: from
	2a02-8388-1601-4c80-d02f-9b4a-64d5-2e65.cable.dynamic.v6.surfer.at
	(2a02-8388-1601-4c80-d02f-9b4a-64d5-2e65.cable.dynamic.v6.surfer.at.
	[2a02:8388:1601:4c80:d02f:9b4a:64d5:2e65])
	by smtp.gmail.com with ESMTPSA id
	g19sm23356732wrb.52.2019.07.08.16.32.44
	for <drbd-dev@lists.linbit.com>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jul 2019 16:32:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Robert Altnoeder <robert.altnoeder@linbit.com>
In-Reply-To: <bd96aeb1-ac7c-1da4-bebf-e4f28d0e0313@gmail.com>
Date: Tue, 9 Jul 2019 01:32:41 +0200
Message-Id: <83233537-3C35-46FF-8E0A-1268F0B33278@linbit.com>
References: <bd96aeb1-ac7c-1da4-bebf-e4f28d0e0313@gmail.com>
To: drbd-dev@lists.linbit.com
X-Mailer: Apple Mail (2.3124)
Subject: Re: [Drbd-dev] rcu_dereference() called when not under
	rcu_read_lock().
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

T24gMDggSnVsIDIwMTksIGF0IDE5OjUwLCBEYXZpZCBCdXR0ZXJmaWVsZCA8ZGFiMjE3NzRAZ21h
aWwuY29tPiB3cm90ZToKPiAKPiBJdCBzZWVtcyB0aGF0IGluIGdlbmVyYWwgcmN1X2RlcmVmZXJl
bmNlKCkgaXMgZXhwZWN0ZWQgdG8gYmUgY2FsbGVkIHVuZGVyIHJjdV9yZWFkX2xvY2soKS4KClvi
gKZdCgo+IFswNF0gICAweDU2ODRiNyAgYWRtX25ld19jb25uZWN0aW9uIGRyYmRfbmwuYzozNzc0
Cj4gWzA1XSAgIDB4NTY5NjQzICBkcmJkX2FkbV9uZXdfcGVlciBkcmJkX25sLmM6NDA3MAo+IAoK
W+KApl0KCj4gCj4gWzA1XSAgIDB4NTQ2NjI1ICBkcmJkX2NyZWF0ZV9kZXZpY2UgZHJiZF9tYWlu
LmM6MzcwOQo+IFswNl0gICAweDU3MGI4NSAgZHJiZF9hZG1fbmV3X21pbm9yIGRyYmRfbmwuYzo1
ODU4CgpXZeKAmWxsIGNoZWNrLCBidXQgSSBiZWxpZXZlIEkgcmVtZW1iZXIgdGhvc2UgdG8gYmUg
ZWl0aGVyIGluaXRpYWxpemVycyAobm8gcmVhZGVycyBhbmQgd3JpdGVycyB5ZXQpIG9yIHVwZGF0
ZXJzLiBUaGUgY29kZSBwcm9iYWJseSBkb2VzIGFuIHJjdV9hc3NpZ25fcG9pbnRlcigpIGFuZCB0
aGVuIHBvc3NpYmx5IGEgZGVhbGxvY2F0aW9uIGFmdGVyIHN5bmNocm9uaXplX3JjdSgpLiBUaGUg
dXBkYXRlcnMgYXJlIG5vcm1hbGx5IHNlcmlhbGl6ZWQgd2l0aCBtdXRleCBsb2NrcyAoZS5nLiB0
aGUgcmVzb3VyY2XigJlzIGNvbmZfdXBkYXRlKSwgc28gdGhleSBkb27igJl0IHJhY2Ugd2l0aCBl
YWNoIG90aGVyLgoKYnIsClJvYmVydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cDovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
