Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C76EB4BD
	for <lists+drbd-dev@lfdr.de>; Sat, 22 Apr 2023 00:30:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 91B5F4252C3;
	Sat, 22 Apr 2023 00:30:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F0E24252C3
	for <drbd-dev@lists.linbit.com>; Sat, 22 Apr 2023 00:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=HB77AFqGG2aBz+Earrmv/XakHzRKihV+YVKN5AMto9w=;
	b=4FAhsMmpd9R2NNkxWh/EOySpZr
	3xMTf/cJ0+PNnJ2jbCGrZ6Gm69S6q3oAJkQ5yxUgkzhcpqqnYZvVCHMRG8Q44ftomMGgGmtsv/8/X
	hLnbhCDJuUrYaDwBuiiHWOQXrGjbspvupGp/eN9bsdk3b24WwsY/XkPvVT5hwOMnBBpGjaVdxENjr
	JoSB/n2YtzxQjl7qJQXY3ceKtXXJY4bChFW37Up6awJh/gBfz/LWtS/CSRHQfrPbEyn5NMMZ8oBKk
	1goaCU9P4Fulz/XxFCHiY4WPfQQd0fy3A/4pu1F6QjPYE6VPjaXVeuxuTCdmZo1zkvy/1rmg6rqcb
	/nt47FEw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1ppzGj-00BxAj-0p; Fri, 21 Apr 2023 22:30:17 +0000
Date: Fri, 21 Apr 2023 15:30:17 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <ZEMOeb9Bt60jxV+d@bombadil.infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
	<ZELuiBNNHTk4EdxH@casper.infradead.org>
	<ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
	<47688c1d-9cf1-3e08-1f1d-a051b25d010e@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47688c1d-9cf1-3e08-1f1d-a051b25d010e@kernel.dk>
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	Matthew Wilcox <willy@infradead.org>, hch@infradead.org,
	p.raghav@samsung.com, senozhatsky@chromium.org,
	snitzer@kernel.org, linux-block@vger.kernel.org, hare@suse.de,
	kbusch@kernel.org, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/5] iomap: simplify iomap_init() with
	PAGE_SECTORS
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMDQ6MjQ6NTdQTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiA0LzIxLzIzIDQ6MDLigK9QTSwgTHVpcyBDaGFtYmVybGFpbiB3cm90ZToKPiA+IE9u
IEZyaSwgQXByIDIxLCAyMDIzIGF0IDA5OjE0OjAwUE0gKzAxMDAsIE1hdHRoZXcgV2lsY294IHdy
b3RlOgo+ID4+IE9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDEyOjU4OjA1UE0gLTA3MDAsIEx1aXMg
Q2hhbWJlcmxhaW4gd3JvdGU6Cj4gPj4+IEp1c3QgdXNlIHRoZSBQQUdFX1NFQ1RPUlMgZ2VuZXJp
YyBkZWZpbmUuIFRoaXMgcHJvZHVjZXMgbm8gZnVuY3Rpb25hbAo+ID4+PiBjaGFuZ2VzLiBXaGls
ZSBhdCBpdCB1c2UgbGVmdCBzaGlmdCB0byBzaW1wbGlmeSB0aGlzIGV2ZW4gZnVydGhlci4KPiA+
Pgo+ID4+IEhvdyBpcyBGT08gPDwgMiBzaW1wbGVyIHRoYW4gRk9PICogND8KPiA+Pgo+ID4+PiAt
CXJldHVybiBiaW9zZXRfaW5pdCgmaW9tYXBfaW9lbmRfYmlvc2V0LCA0ICogKFBBR0VfU0laRSAv
IFNFQ1RPUl9TSVpFKSwKPiA+Pj4gKwlyZXR1cm4gYmlvc2V0X2luaXQoJmlvbWFwX2lvZW5kX2Jp
b3NldCwgUEFHRV9TRUNUT1JTIDw8IDIsCj4gPiAKPiA+IFdlIGNvdWxkIGp1c3QgZG86Cj4gPiAK
PiA+IAo+ID4gLQlyZXR1cm4gYmlvc2V0X2luaXQoJmlvbWFwX2lvZW5kX2Jpb3NldCwgNCAqIChQ
QUdFX1NJWkUgLyBTRUNUT1JfU0laRSksCj4gPiArCXJldHVybiBiaW9zZXRfaW5pdCgmaW9tYXBf
aW9lbmRfYmlvc2V0LCA0ICogUEFHRV9TRUNUT1JTLAo+ID4gCj4gPiBUaGUgc2hpZnQganVzdCBz
ZWVtZWQgb3B0aW1hbCBpZiB3ZSdyZSBqdXN0IGdvaW5nIHRvIGNoYW5nZSBpdC4KPiAKPiBJdCdz
IGdvaW5nIHRvIGdlbmVyYXRlIHRoZSBzYW1lIGNvZGUsIGJ1dCB0aGUgbXVsdGlwbGljYXRpb24g
aXMgYXJndWFibHkKPiBlYXNpZXIgdG8gcmVhZCAob3IgaGFyZGVyIHRvIG1pc3JlYWQpLgoKVGhl
biBsZXQncyBzdGljayB3aXRoIHRoZSA0ICogUEFHRV9TRUNUT1JTLiBMZXQgbWUga25vdyBpZiB5
b3UgbmVlZCBhbm90aGVyCnBhdGNoLgoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
