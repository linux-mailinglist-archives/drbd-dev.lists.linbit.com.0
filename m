Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5AB354F11
	for <lists+drbd-dev@lfdr.de>; Tue,  6 Apr 2021 10:52:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F769420625;
	Tue,  6 Apr 2021 10:52:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C12014205D8
	for <drbd-dev@lists.linbit.com>; Tue,  6 Apr 2021 10:52:26 +0200 (CEST)
Received: by mail-wr1-f47.google.com with SMTP id a6so7291903wrw.8
	for <drbd-dev@lists.linbit.com>; Tue, 06 Apr 2021 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=3BgNDMl40dnCwKRmhOLm+B9cf4ULCtKCWabOrS4ebcw=;
	b=Asdziv4oEb1GmkAaeVVDLWI3Znln2RaErCLNpsXLzuYFdOjFmI+wtm1ABBb8Qzrhny
	TcmAdlweTBezZn6bLWI5bxAO6sixQ1qoRcBGyyLqdiQLPIYhlFyN1h+5meYfiH4JkWto
	p6pFe2LqKb8alZFUYIMjJAMVfORnDXryC0wNScdPtyGiNK6QyfD0bVL+lTSMwej9pLcV
	iQzMPvscomIPMUzjFxPNO4iPBn4L4vhotDqv492YkhoERqcLIfLNP5vCfCnxSMMP6sSJ
	KcvhK8JYrWbX7nPWHQ5J91FkPJXnbjYB6Ap1ZgdEBSg2YwCnF2NloEpC1gpS/cLHXxVn
	QScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=3BgNDMl40dnCwKRmhOLm+B9cf4ULCtKCWabOrS4ebcw=;
	b=LAx70z3AYZMo+d0mziyRUKvZrF78puwNZvLNxgDFAeeH5fMnntS54CrpkyndXx2+Js
	0mHrDSlx7bN+PHpWo1UmBbmG/cVVk1tKNeGJvqXXcWVFBFP/d3POosuh85Iq2It+7qd4
	MuAAzpALWegXqBJG96TfZAHyLQck0GPuZyYO6+5cbeNfGPgNMx8qkR1+1NTS1X26ZOgX
	SkeSar57uh2nZZqbOwSZjRtHHPmR5AgXHdHoUCrrYg6TJFdbmfiIbE/Wk0Za4PXMDMqy
	GdBtNdo1Sm1SX5XouYuCTQTpqqWYMiOWnYzqYF1v6IwTNXJ7fXPrZm/yuAPwKyVBVQBE
	6mSg==
X-Gm-Message-State: AOAM533xSGkRHZw8IsjoO2ROZGV8U0aU/E4w8IZfJDOjey2mJ96bBIZj
	Wz97tD8NpSeiAHoxA0NCFqX6ew==
X-Google-Smtp-Source: ABdhPJyxLFG0M7WFSnkeNEm7vMCed81i1TOhAivLtyeLJw56m312VuEzXAMWCWyLobQLxSOjXKutyg==
X-Received: by 2002:adf:90f0:: with SMTP id
	i103mr32839523wri.318.1617699146143; 
	Tue, 06 Apr 2021 01:52:26 -0700 (PDT)
Received: from dell ([91.110.221.193]) by smtp.gmail.com with ESMTPSA id
	i8sm32058595wrx.43.2021.04.06.01.52.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 06 Apr 2021 01:52:25 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:52:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	drbd-dev@lists.linbit.com, Jens Axboe <axboe@kernel.dk>,
	Joshua Morris <josh.h.morris@us.ibm.com>, Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-block@vger.kernel.org,
	Philip Kelleher <pjk1939@linux.ibm.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <20210406085223.GR2916463@dell>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
	<20210330132130.GK2916463@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330132130.GK2916463@dell>
Subject: Re: [Drbd-dev] [PATCH 00/11] Rid W=1 warnings from Block
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

T24gVHVlLCAzMCBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBGcmksIDEyIE1hciAy
MDIxLCBMZWUgSm9uZXMgd3JvdGU6Cj4gCj4gPiBUaGlzIHNldCBpcyBwYXJ0IG9mIGEgbGFyZ2Vy
IGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+ID4ga2VybmVsIGJ1aWxkcywgd2hp
Y2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSByaWRkbGVkIHdpdGgKPiA+IG5pZ2dseSBs
aXR0bGUgd2FybmluZ3MuCj4gPiAKPiA+IExlZSBKb25lcyAoMTEpOgo+ID4gICBibG9jazogcnN4
eDogY29yZTogUmVtb3ZlIHN1cGVyZmx1b3VzIGNvbnN0IHF1YWxpZmllcgo+ID4gICBibG9jazog
ZHJiZDogZHJiZF9pbnRlcnZhbDogRGVtb3RlIHNvbWUga2VybmVsLWRvYyBhYnVzZXMgYW5kIGZp
eAo+ID4gICAgIGFub3RoZXIgaGVhZGVyCj4gPiAgIGJsb2NrOiBtdGlwMzJ4eDogbXRpcDMyeHg6
IE1hcmsgZGVidWdnaW5nIHZhcmlhYmxlICdzdGFydCcgYXMKPiA+ICAgICBfX21heWJlX3VudXNl
ZAo+ID4gICBibG9jazogZHJiZDogZHJiZF9zdGF0ZTogRml4IHNvbWUgZnVuY3Rpb24gZG9jdW1l
bnRhdGlvbiBpc3N1ZXMKPiA+ICAgYmxvY2s6IGRyYmQ6IGRyYmRfcmVjZWl2ZXI6IERlbW90ZSBu
b24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcnMKPiA+ICAgYmxvY2s6IGRyYmQ6IGRyYmRf
bWFpbjogUmVtb3ZlIGR1cGxpY2F0ZSBmaWVsZCBpbml0aWFsaXNhdGlvbgo+ID4gICBibG9jazog
ZHJiZDogZHJiZF9ubDogTWFrZSBjb252ZXJzaW9uIHRvICdlbnVtIGRyYmRfcmV0X2NvZGUnIGV4
cGxpY2l0Cj4gPiAgIGJsb2NrOiBkcmJkOiBkcmJkX21haW46IEZpeCBhIGJ1bmNoIG9mIGZ1bmN0
aW9uIGRvY3VtZW50YXRpb24KPiA+ICAgICBkaXNjcmVwYW5jaWVzCj4gPiAgIGJsb2NrOiBkcmJk
OiBkcmJkX3JlY2VpdmVyOiBEZW1vdGUgbGVzcyB0aGFuIGhhbGYgY29tcGxldGUga2VybmVsLWRv
Ywo+ID4gICAgIGhlYWRlcgo+ID4gICBibG9jazogeGVuLWJsa2Zyb250OiBEZW1vdGUga2VybmVs
LWRvYyBhYnVzZXMKPiA+ICAgYmxvY2s6IGRyYmQ6IGRyYmRfbmw6IERlbW90ZSBoYWxmLWNvbXBs
ZXRlIGtlcm5lbC1kb2MgaGVhZGVycwo+IAo+IFdvdWxkIHlvdSBsaWtlIG1lIHRvIHJlc3VibWl0
IHRoZXNlPwoKSXQncyBiZWVuIDMuNSB3ZWVrcyBzaW5jZSB0aGVzZSB3ZXJlIHN1Ym1pdHRlZC4K
CldlIGFyZSBub3cgYXQgLXJjNiwgc28gdGhlc2Ugc2hvdWxkIGJlIG1lcmdlZCBzb29uLgoKSXMg
dGhlcmUgYW55dGhpbmcgeW91J2QgbGlrZSBtZSB0byBkbyB0byBoZWxwPwoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxp
c3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZHJiZC1kZXYK
