Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5B4EBB75
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Mar 2022 09:08:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C8C0F4207B8;
	Wed, 30 Mar 2022 09:07:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 373 seconds by postgrey-1.31 at mail19;
	Tue, 29 Mar 2022 22:07:16 CEST
Received: from email.studentenwerk.mhn.de (mailin.studentenwerk.mhn.de
	[141.84.225.229])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B9BD420632
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 22:07:16 +0200 (CEST)
Received: from mailhub.studentenwerk.mhn.de (mailhub.studentenwerk.mhn.de
	[127.0.0.1])
	by email.studentenwerk.mhn.de (Postfix) with ESMTPS id 4KSgRg1YJXzRhSp; 
	Tue, 29 Mar 2022 22:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwm.de;
	s=stwm-20170627; t=1648584063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=pJC4NSVW4gwhBSN+CvduaIYW64z7cizjcVpdotN7+JE=;
	b=THIpnCV+y28ayxUrv+11JJqMnliscPyGxRKyzgpbPVCDBb/utAkyPtxlIo+OUMQzvd4UCn
	C6phrnBP9ytO23TwrdT/COf13trWKEKpBiMCwO4u4qqNPpM1Gv18eyfH6JwvHObcq/KaCL
	TMQx14d9qrn6TqjSCGphbxD7BxRqYZyUlmZmgk8CDL0h71q/inRKzlutsPTs8K3HmPO1XU
	ot902kmJthbbRWXJH4qio2HV831Zpd4480ew/1yhsLP8Bk/kbPluZub6/SxNsI+6zimLX2
	grL/qqLI1bq7cOU8ujGmwZvwUgJCI2cvW85L7FVSdrFX9Jiba8D1QK7DaN35ww==
MIME-Version: 1.0
Date: Tue, 29 Mar 2022 22:01:15 +0200
From: Wolfgang Walter <linux@stwm.de>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20220329073254.GA20691@lst.de>
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
Message-ID: <ff5bc3eb8fa27845cefa2f96e5241972@stwm.de>
X-Sender: linux@stwm.de
Organization: =?UTF-8?Q?Studentenwerk_M=C3=BCnchen?=
X-Mailman-Approved-At: Wed, 30 Mar 2022 09:07:58 +0200
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QW0gMjAyMi0wMy0yOSAwOTozMiwgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBPbiBUdWUs
IE1hciAyOSwgMjAyMiBhdCAwOToyMjoyNkFNICswMjAwLCBQaGlsaXBwIFJlaXNuZXIgd3JvdGU6
Cj4+IEhpIENocmlzdG9waCwKPj4gCj4+IHdoYXQgZG8geW91IGV4cGVjdCBmb3IgdGhlIERSQkQg
Y2hhbmdlcz8gVXN1YWxseSwgdGhleSBmYWxsIGludG8gdGhlCj4+IGNhdGVnb3J5OiB5ZXMsIG9i
dmlvdXNseS4gV2hlbiB5b3UgYXJlIGNoYW5naW5nIHRoZSBibG9jayBsYXllciBpbiAKPj4gdGhp
cwo+PiB3YXksIHRoZW4gdGhhdCBpcyBuZWNlc3NhcnkgZm9yIHRoZSBpbi10cmVlIERSQkQgY29k
ZS4KPj4gCj4+IFJlZ2FyZGluZyB1c2VyczogWWVzLCB0aGVyZSBhcmUgdXNlcnMgb2YgdGhlIGlu
LXRyZWUgRFJCRCBjb2RlLiBWZXJ5IAo+PiBiaWcKPj4gY29ycG9yYXRpb25zLiBBbmQsIHllcywg
d2Ugc2VlIHByZXNzdXJlIGJ1aWxkaW5nIHVwIHRoYXQgd2UgZ2V0IG91ciAKPj4gYWN0Cj4+IHRv
Z2V0aGVyIGFuZCByZS1zeW5jIHRoZSBpbi10cmVlIERSQkQgd2l0aCB0aGUgb3V0LW9mIHRyZWUg
RFJCRC4KPiAKPiBUaGUgY29tcGxldGUgbGFjayBvZiBidWcgcmVwb3J0cyBhbmQgbWFpbnRhaW5l
ciBpbnRlcmFjdGlvbiB1c3VhbGx5Cj4gc3VnZ2VzdHMgbG93IHRvIG5vIHVzZSBhbmQgaGVhdnkg
Yml0cm90LiAgSWYgdGhhdCBpcyBub3QgdGhlIGNhc2UKPiBoZXJlIHRoYXQncyBmaW5lLCBqdXN0
IGFza2luZy4uCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmJkLWRldiBtYWlsaW5nIGxpc3QKPiBkcmJkLWRldkBsaXN0cy5saW5iaXQuY29t
Cj4gaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYKCldl
IHVzZSB0aGUgaW4tdHJlZSBEUkJEIHdpdGggTFRTIChhY3R1YWxseSA1LjE1LjMyIGFuZCA1LjQu
MTg4KSBhbmQgCmRlcGVuZCBvbiBpdC4gSXQganVzdCB3b3Jrcy4gV2UgbmV2ZXIgaGFkIGFueSBp
c3N1ZXMgaW4gdGhlIGxhc3QgNSAKeWVhcnMuCgpSZWdhcmRzCi0tIApXb2xmZ2FuZyBXYWx0ZXIK
U3R1ZGVudGVud2VyayBNw7xuY2hlbgpBbnN0YWx0IGRlcyDDtmZmZW50bGljaGVuIFJlY2h0cwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBt
YWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJp
dC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
