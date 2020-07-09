Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE321A1A3
	for <lists+drbd-dev@lfdr.de>; Thu,  9 Jul 2020 16:01:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 71B664203F9;
	Thu,  9 Jul 2020 16:01:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4C6E14203F5
	for <drbd-dev@lists.linbit.com>; Thu,  9 Jul 2020 16:01:47 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 03E3D68AEF; Thu,  9 Jul 2020 16:01:46 +0200 (CEST)
Date: Thu, 9 Jul 2020 16:01:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200709140145.GA3068@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
	<b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
	<20200709053233.GA3243@lst.de>
	<82e2785d-2091-1986-0014-3b7cea7cd0d8@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82e2785d-2091-1986-0014-3b7cea7cd0d8@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove dead bdi congestion leftovers
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

T24gVGh1LCBKdWwgMDksIDIwMjAgYXQgMDc6NTg6NThBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiA3LzgvMjAgMTE6MzIgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gT24g
V2VkLCBKdWwgMDgsIDIwMjAgYXQgMDU6MTQ6MjlQTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToK
PiA+PiBPbiA3LzEvMjAgMzowNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPj4+IEhp
IEplbnMsCj4gPj4+Cj4gPj4+IHdlIGhhdmUgYSBsb3Qgb2YgYmRpIGNvbmdlc3Rpb24gcmVsYXRl
ZCBjb2RlIHRoYXQgaXMgbGVmdCBhcm91bmQgd2l0aG91dAo+ID4+PiBhbnkgdXNlLiAgVGhpcyBz
ZXJpZXMgcmVtb3ZlcyBpdCBpbiBwcmVwYXJhdGlvbiBvZiBzb3J0aW5nIG91dCB0aGUgYmRpCj4g
Pj4+IGxpZmV0aW1lIHJ1bGVzIHByb3Blcmx5Lgo+ID4+Cj4gPj4gUGxlYXNlIHJ1biBzZXJpZXMg
bGlrZSB0aGlzIHRocm91Z2ggYSBmdWxsIGNvbXBpbGF0aW9uLCBmb3IgYm90aCB0aGlzIG9uZQo+
ID4+IGFuZCB0aGUgcHJldmlvdXMgc2VyaWVzIEkgaGFkIHRvIGZpeCB1cCBpc3N1ZXMgbGlrZSB0
aGlzOgo+ID4+Cj4gPj4gZHJpdmVycy9tZC9iY2FjaGUvcmVxdWVzdC5jOiBJbiBmdW5jdGlvbiDi
gJhiY2hfY2FjaGVkX2Rldl9yZXF1ZXN0X2luaXTigJk6Cj4gPj4gZHJpdmVycy9tZC9iY2FjaGUv
cmVxdWVzdC5jOjEyMzM6MTg6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhn4oCZIFstV3Vu
dXNlZC12YXJpYWJsZV0KPiA+PiAgMTIzMyB8ICBzdHJ1Y3QgZ2VuZGlzayAqZyA9IGRjLT5kaXNr
LmRpc2s7Cj4gPj4gICAgICAgfCAgICAgICAgICAgICAgICAgIF4KPiA+PiBkcml2ZXJzL21kL2Jj
YWNoZS9yZXF1ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGJjaF9mbGFzaF9kZXZfcmVxdWVzdF9pbml0
4oCZOgo+ID4+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzoxMzIwOjE4OiB3YXJuaW5nOiB1
bnVzZWQgdmFyaWFibGUg4oCYZ+KAmSBbLVd1bnVzZWQtdmFyaWFibGVdCj4gPj4gIDEzMjAgfCAg
c3RydWN0IGdlbmRpc2sgKmcgPSBkLT5kaXNrOwo+ID4+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICBeCj4gPj4KPiA+PiBEaWQgdGhlIHNhbWUgaGVyZSwgYXBwbGllZCBpdC4KPiA+IAo+ID4gQW5k
IGp1c3QgbGlrZSB0aGUgcHJldmlvdXMgb25lIEkgZGlkLCBhbmQgdGhlIGNvbXBpbGVyIGRpZCBu
b3QgY29tcGxhaW4uCj4gPiBUaGVyZSBtdXN0IGJlIHNvbWV0aGluZyBhYm91dCBjZXJ0YWluIGdj
YyB2ZXJzaW9ucyBub3Qgd2FybmluZyBhYm91dAo+ID4gdmFyaWFibGVzIHRoYXQgYXJlIGluaXRp
YWxpemVkIGJ1dCBub3Qgb3RoZXJ3aXNlIHVzZWQuCj4gCj4gQXJlIHlvdSB1c2luZyBnY2MtMTA/
IEl0IHN1Y2tzIGZvciB0aGF0LiBnY2MtOSBzZWVtcyB0byByZWxpYWJseSBoaXQKPiB0aGVzZSBj
YXNlcyBmb3IgbWUsIG5vdCBzdXJlIHdoeSBnY2MtMTAgZG9lc24ndC4gQW5kIHRoZSBvbmVzIHF1
b3RlZAo+IGFib3ZlIGFyZSBhYm91dCBhcyB0cml2aWFsIGFzIHRoZXkgY2FuIGdldC4KCmdjYy05
LjMgZnJvbSBEZWJpYW4gLXRlc3RpbmcuICBBbmQgeWVzLCBJJ20gcmVhbGx5IHN1cnByaXNlZCBp
dCBkaWRuJ3QKZmluZCB0aG9zZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5j
b20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
