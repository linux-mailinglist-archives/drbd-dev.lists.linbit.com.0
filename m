Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB36233E2
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Nov 2022 20:47:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 71765422117;
	Wed,  9 Nov 2022 20:47:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8FF45422112
	for <drbd-dev@lists.linbit.com>; Wed,  9 Nov 2022 20:47:02 +0100 (CET)
Received: by mail-pj1-f52.google.com with SMTP id l6so17712420pjj.0
	for <drbd-dev@lists.linbit.com>; Wed, 09 Nov 2022 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=qm7kmFhZv1UOx3oJHvlxwbbzX8OCnpd4C8sFTotqeeY=;
	b=cSe9G8uW/t9NfctizbHFDrRwWnl/AyvspWwmyg9Ye+dlg//Mv51SNOtO0FJVbQVdT7
	m66MOycsZjNgVkN1EvhpT9NR3lY3zXOxO7FT0Qsp0WifnIDrOHPth2g9Bp1hPZtD2kV/
	GuAxZhNPGYKv7J39IuAHWhm8O5DuwMmcLQL8ev2vb2kii1zYZtdKoNfGbvERP2y7Y1FO
	xCl912qSvJnfrxKWWOgv5+PUre7GS3MTeCA3P4Hf6zwC9B3F0H3EuWgLkeqi/YcxZkiU
	K+jOHRbWu1W9hnDy8VtIXcchFeMxyB2Fkfh7S2xeG22RMuohzoPO7QlZSmhR5Kt0MZqb
	Omww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=qm7kmFhZv1UOx3oJHvlxwbbzX8OCnpd4C8sFTotqeeY=;
	b=4dYMzDWwt6vaJYfGchv5NQO7CcrHaCtxlsUiIzGGNlqu9fLIptqSDZDE6V4fRqp/6Q
	KvmhTdM3przXt4Ojedx1kAEIBVtYew9DuhH8iGfGqnMv/d0aimD6HDIYrlcWHc5eZSUw
	HuEabuBL/8nT9OXt1ttl2pfVlxq9TTRKVX0+gJh9kJHp+yh8JQRi2onphiqRr6GgxLMY
	Tx97caQpCmfhrQrx2cRxbe3w3ARJMLZmtKF6Uh/rILvCO/2i7qdx62MxfeNbpcgsyZKV
	BxSFoZHriO1prO4NMCFBrT3x0IY3ErB3EXcNXOcnvG5jG0p1/cLhuED4NlZHtXLQlpEL
	bzUw==
X-Gm-Message-State: ACrzQf3rqD0Z9ZyccK4qs8QoLP+Mg2CzTtHh6/u8LeecJY7b6s39si6C
	O01GkV64o7a7wDC1zoLAmdwMmQ==
X-Google-Smtp-Source: AMsMyM5uhHU3gWtzlnABbxJtAmC14zxGPF+qBHIK+VEtUbCef9bGkKhBItsr03dg7PJfRm0itQTGCw==
X-Received: by 2002:a17:90b:4c8c:b0:214:9a:1fd0 with SMTP id
	my12-20020a17090b4c8c00b00214009a1fd0mr48646010pjb.219.1668023221280;
	Wed, 09 Nov 2022 11:47:01 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	l5-20020a170903244500b0017f48a9e2d6sm9514355pls.292.2022.11.09.11.47.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Nov 2022 11:47:00 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
References: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
Message-Id: <166802322035.66062.9382027641082128277.b4-ty@kernel.dk>
Date: Wed, 09 Nov 2022 12:47:00 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-d9ed3
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: [Drbd-dev] [PATCH 0/3] Miscellaneous DRBD updates for 6.2
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

T24gV2VkLCA5IE5vdiAyMDIyIDE0OjM0OjUwICswMTAwLCBDaHJpc3RvcGggQsO2aG13YWxkZXIg
d3JvdGU6Cj4gSGVyZSBhcmUgc29tZSB2YXJpb3VzIHVwZGF0ZXMgZm9yIERSQkQuCj4gVGhlIGZp
cnN0IHR3byBhcmUgcmVsYXRlZCB0byB0aGUgaGFuZGxpbmcgb2YgZGlzY2FyZHMgaW4gRFJCRCwg
YW5kIHRoZQo+IHRoaXJkIGlzIGEgcmVzZW5kIG9mIFswXS4KPiAKPiBbMF0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjIxMDI0MTQyNDI0LjI1ODc3LTEtY2hyaXN0b3BoLmJvZWhtd2Fs
ZGVyQGxpbmJpdC5jb20vCj4gCj4gQ2hyaXN0b3BoIELDtmhtd2FsZGVyICgyKToKPiAgIGRyYmQ6
IHVzZSBibGtfcXVldWVfbWF4X2Rpc2NhcmRfc2VjdG9ycyBoZWxwZXIKPiAgIGRyYmQ6IFN0b3Jl
IG9wIGluIGRyYmRfcGVlcl9yZXF1ZXN0Cj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsx
LzNdIGRyYmQ6IHVzZSBibGtfcXVldWVfbWF4X2Rpc2NhcmRfc2VjdG9ycyBoZWxwZXIKICAgICAg
Y29tbWl0OiAyNThiZWE2Mzg4YWM5M2YzNDU2MWZkOTEwNjQyMzJkMTRlMTc0YmZmClsyLzNdIGRy
YmQ6IGRpc2FibGUgZGlzY2FyZCBzdXBwb3J0IGlmIGdyYW51bGFyaXR5ID4gbWF4CiAgICAgIGNv
bW1pdDogMjFiODdhN2Q3NTY0NzUxNTkwZTNhMzhkZmIyNDNmOWEwYmJlZGJkMgpbMy8zXSBkcmJk
OiBTdG9yZSBvcCBpbiBkcmJkX3BlZXJfcmVxdWVzdAogICAgICBjb21taXQ6IGNlNjY4YjZkNjhm
OWRkZjc2MDIyYjFjNDAzYjQ0NGY1YTIxY2JjMGYKCkJlc3QgcmVnYXJkcywKLS0gCkplbnMgQXhi
b2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJk
LWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3Rz
LmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
