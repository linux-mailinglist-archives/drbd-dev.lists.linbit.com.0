Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 635342BA2F2
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:20:59 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3630E42066B;
	Fri, 20 Nov 2020 08:20:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D67EE420639
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:20:47 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 95218AC0C;
	Fri, 20 Nov 2020 07:20:47 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-33-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <d1beca65-cd8e-57ff-e7d7-6347cb6344b4@suse.de>
Date: Fri, 20 Nov 2020 08:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-33-hch@lst.de>
Content-Language: en-US
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 32/78] block: remove set_device_ro
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gRm9sZCBzZXRf
ZGV2aWNlX3JvIGludG8gaXRzIG9ubHkgcmVtYWluaW5nIGNhbGxlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgIGJsb2NrL2dlbmhk
LmMgICAgICAgICB8IDcgLS0tLS0tLQo+ICAgYmxvY2svaW9jdGwuYyAgICAgICAgIHwgMiArLQo+
ICAgaW5jbHVkZS9saW51eC9nZW5oZC5oIHwgMSAtCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay9nZW5oZC5j
IGIvYmxvY2svZ2VuaGQuYwo+IGluZGV4IDhjMzUwZmVjZmU4YmZlLi5iMGYwYjBjYWM5YWE3ZiAx
MDA2NDQKPiAtLS0gYS9ibG9jay9nZW5oZC5jCj4gKysrIGIvYmxvY2svZ2VuaGQuYwo+IEBAIC0x
ODQzLDEzICsxODQzLDYgQEAgc3RhdGljIHZvaWQgc2V0X2Rpc2tfcm9fdWV2ZW50KHN0cnVjdCBn
ZW5kaXNrICpnZCwgaW50IHJvKQo+ICAgCWtvYmplY3RfdWV2ZW50X2VudigmZGlza190b19kZXYo
Z2QpLT5rb2JqLCBLT0JKX0NIQU5HRSwgZW52cCk7Cj4gICB9Cj4gICAKPiAtdm9pZCBzZXRfZGV2
aWNlX3JvKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGludCBmbGFnKQo+IC17Cj4gLQliZGV2
LT5iZF9wYXJ0LT5wb2xpY3kgPSBmbGFnOwo+IC19Cj4gLQo+IC1FWFBPUlRfU1lNQk9MKHNldF9k
ZXZpY2Vfcm8pOwo+IC0KPiAgIHZvaWQgc2V0X2Rpc2tfcm8oc3RydWN0IGdlbmRpc2sgKmRpc2ss
IGludCBmbGFnKQo+ICAgewo+ICAgCXN0cnVjdCBkaXNrX3BhcnRfaXRlciBwaXRlcjsKPiBkaWZm
IC0tZ2l0IGEvYmxvY2svaW9jdGwuYyBiL2Jsb2NrL2lvY3RsLmMKPiBpbmRleCA5NmNiNDU0NDcz
NjQ2OC4uMDQyNTVkYzVmM2JmZjMgMTAwNjQ0Cj4gLS0tIGEvYmxvY2svaW9jdGwuYwo+ICsrKyBi
L2Jsb2NrL2lvY3RsLmMKPiBAQCAtMzcxLDcgKzM3MSw3IEBAIHN0YXRpYyBpbnQgYmxrZGV2X3Jv
c2V0KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwKPiAgIAkJaWYgKHJl
dCkKPiAgIAkJCXJldHVybiByZXQ7Cj4gICAJfQo+IC0Jc2V0X2RldmljZV9ybyhiZGV2LCBuKTsK
PiArCWJkZXYtPmJkX3BhcnQtPnBvbGljeSA9IG47Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9nZW5oZC5oIGIvaW5jbHVkZS9saW51eC9nZW5o
ZC5oCj4gaW5kZXggNGIyMmJmZDkzMzZlMWEuLjg0MjdhZDhiZWY1MjBkIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGludXgvZ2VuaGQuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZ2VuaGQuaAo+IEBA
IC0zMDQsNyArMzA0LDYgQEAgZXh0ZXJuIHZvaWQgZGVsX2dlbmRpc2soc3RydWN0IGdlbmRpc2sg
KmdwKTsKPiAgIGV4dGVybiBzdHJ1Y3QgZ2VuZGlzayAqZ2V0X2dlbmRpc2soZGV2X3QgZGV2LCBp
bnQgKnBhcnRubyk7Cj4gICBleHRlcm4gc3RydWN0IGJsb2NrX2RldmljZSAqYmRnZXRfZGlzayhz
dHJ1Y3QgZ2VuZGlzayAqZGlzaywgaW50IHBhcnRubyk7Cj4gICAKPiAtZXh0ZXJuIHZvaWQgc2V0
X2RldmljZV9ybyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBpbnQgZmxhZyk7Cj4gICBleHRl
cm4gdm9pZCBzZXRfZGlza19ybyhzdHJ1Y3QgZ2VuZGlzayAqZGlzaywgaW50IGZsYWcpOwo+ICAg
Cj4gICBzdGF0aWMgaW5saW5lIGludCBnZXRfZGlza19ybyhzdHJ1Y3QgZ2VuZGlzayAqZGlzaykK
PiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoK
SGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9y
YWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAr
NDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5s
aW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQt
ZGV2Cg==
