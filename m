Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFF2197EE
	for <lists+drbd-dev@lfdr.de>; Thu,  9 Jul 2020 07:32:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A741E4203F6;
	Thu,  9 Jul 2020 07:32:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 183664203B3
	for <drbd-dev@lists.linbit.com>; Thu,  9 Jul 2020 07:32:35 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2292B68B05; Thu,  9 Jul 2020 07:32:34 +0200 (CEST)
Date: Thu, 9 Jul 2020 07:32:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200709053233.GA3243@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
	<b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
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

T24gV2VkLCBKdWwgMDgsIDIwMjAgYXQgMDU6MTQ6MjlQTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiA3LzEvMjAgMzowNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBIaSBK
ZW5zLAo+ID4gCj4gPiB3ZSBoYXZlIGEgbG90IG9mIGJkaSBjb25nZXN0aW9uIHJlbGF0ZWQgY29k
ZSB0aGF0IGlzIGxlZnQgYXJvdW5kIHdpdGhvdXQKPiA+IGFueSB1c2UuICBUaGlzIHNlcmllcyBy
ZW1vdmVzIGl0IGluIHByZXBhcmF0aW9uIG9mIHNvcnRpbmcgb3V0IHRoZSBiZGkKPiA+IGxpZmV0
aW1lIHJ1bGVzIHByb3Blcmx5Lgo+IAo+IFBsZWFzZSBydW4gc2VyaWVzIGxpa2UgdGhpcyB0aHJv
dWdoIGEgZnVsbCBjb21waWxhdGlvbiwgZm9yIGJvdGggdGhpcyBvbmUKPiBhbmQgdGhlIHByZXZp
b3VzIHNlcmllcyBJIGhhZCB0byBmaXggdXAgaXNzdWVzIGxpa2UgdGhpczoKPiAKPiBkcml2ZXJz
L21kL2JjYWNoZS9yZXF1ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGJjaF9jYWNoZWRfZGV2X3JlcXVl
c3RfaW5pdOKAmToKPiBkcml2ZXJzL21kL2JjYWNoZS9yZXF1ZXN0LmM6MTIzMzoxODogd2Fybmlu
ZzogdW51c2VkIHZhcmlhYmxlIOKAmGfigJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+ICAxMjMzIHwg
IHN0cnVjdCBnZW5kaXNrICpnID0gZGMtPmRpc2suZGlzazsKPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgXgo+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzogSW4gZnVuY3Rpb24g4oCYYmNo
X2ZsYXNoX2Rldl9yZXF1ZXN0X2luaXTigJk6Cj4gZHJpdmVycy9tZC9iY2FjaGUvcmVxdWVzdC5j
OjEzMjA6MTg6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhn4oCZIFstV3VudXNlZC12YXJp
YWJsZV0KPiAgMTMyMCB8ICBzdHJ1Y3QgZ2VuZGlzayAqZyA9IGQtPmRpc2s7Cj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgIF4KPiAKPiBEaWQgdGhlIHNhbWUgaGVyZSwgYXBwbGllZCBpdC4KCkFu
ZCBqdXN0IGxpa2UgdGhlIHByZXZpb3VzIG9uZSBJIGRpZCwgYW5kIHRoZSBjb21waWxlciBkaWQg
bm90IGNvbXBsYWluLgpUaGVyZSBtdXN0IGJlIHNvbWV0aGluZyBhYm91dCBjZXJ0YWluIGdjYyB2
ZXJzaW9ucyBub3Qgd2FybmluZyBhYm91dAp2YXJpYWJsZXMgdGhhdCBhcmUgaW5pdGlhbGl6ZWQg
YnV0IG5vdCBvdGhlcndpc2UgdXNlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
