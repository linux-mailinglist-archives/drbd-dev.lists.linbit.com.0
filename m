Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344B2BA325
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:26:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 080674207A8;
	Fri, 20 Nov 2020 08:26:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CAEF420666
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:26:23 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2A51FAB3D;
	Fri, 20 Nov 2020 07:26:23 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-56-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <75f4c397-ac03-2c5f-d620-0e619ad78fe8@suse.de>
Date: Fri, 20 Nov 2020 08:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-56-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 55/78] block: change the hash used for
 looking up block devices
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQWRkaW5nIHRo
ZSBtaW5vciB0byB0aGUgbWFqb3IgY3JlYXRlcyB0b25zIG9mIHBvaW50bGVzcyBjb25mbGljdHMu
IEp1c3QKPiB1c2UgdGhlIGRldl90IGl0c2VsZiwgd2hpY2ggaXMgMzItYml0cyBhbmQgdGh1cyBp
cyBndWFyYW50ZWVkIHRvIGZpdAo+IGludG8gaW5vX3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBmcy9ibG9ja19kZXYuYyB8IDI2
ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvYmxvY2tfZGV2LmMg
Yi9mcy9ibG9ja19kZXYuYwo+IGluZGV4IGQ4NjY0ZjVjMWZmNjY5Li4yOWRiMTJjM2JiNTAxYyAx
MDA2NDQKPiAtLS0gYS9mcy9ibG9ja19kZXYuYwo+ICsrKyBiL2ZzL2Jsb2NrX2Rldi5jCj4gQEAg
LTg3MCwzNSArODcwLDEyIEBAIHZvaWQgX19pbml0IGJkZXZfY2FjaGVfaW5pdCh2b2lkKQo+ICAg
CWJsb2NrZGV2X3N1cGVyYmxvY2sgPSBiZF9tbnQtPm1udF9zYjsgICAvKiBGb3Igd3JpdGViYWNr
ICovCj4gICB9Cj4gICAKPiAtLyoKPiAtICogTW9zdCBsaWtlbHkgX3ZlcnlfIGJhZCBvbmUgLSBi
dXQgdGhlbiBpdCdzIGhhcmRseSBjcml0aWNhbCBmb3Igc21hbGwKPiAtICogL2RldiBhbmQgY2Fu
IGJlIGZpeGVkIHdoZW4gc29tZWJvZHkgd2lsbCBuZWVkIHJlYWxseSBsYXJnZSBvbmUuCj4gLSAq
IEtlZXAgaW4gbWluZCB0aGF0IGl0IHdpbGwgYmUgZmVkIHRocm91Z2ggaWNhY2hlIGhhc2ggZnVu
Y3Rpb24gdG9vLgo+IC0gKi8KPiAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhhc2goZGV2
X3QgZGV2KQo+IC17Cj4gLQlyZXR1cm4gTUFKT1IoZGV2KStNSU5PUihkZXYpOwo+IC19Cj4gLQo+
IC1zdGF0aWMgaW50IGJkZXZfdGVzdChzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICpkYXRhKQo+
IC17Cj4gLQlyZXR1cm4gQkRFVl9JKGlub2RlKS0+YmRldi5iZF9kZXYgPT0gKihkZXZfdCAqKWRh
dGE7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQgYmRldl9zZXQoc3RydWN0IGlub2RlICppbm9kZSwg
dm9pZCAqZGF0YSkKPiAtewo+IC0JQkRFVl9JKGlub2RlKS0+YmRldi5iZF9kZXYgPSAqKGRldl90
ICopZGF0YTsKPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICAgc3RhdGljIHN0cnVjdCBibG9ja19k
ZXZpY2UgKmJkZ2V0KGRldl90IGRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgYmxvY2tfZGV2aWNlICpi
ZGV2Owo+ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGU7Cj4gICAKPiAtCWlub2RlID0gaWdldDVfbG9j
a2VkKGJsb2NrZGV2X3N1cGVyYmxvY2ssIGhhc2goZGV2KSwKPiAtCQkJYmRldl90ZXN0LCBiZGV2
X3NldCwgJmRldik7Cj4gLQo+ICsJaW5vZGUgPSBpZ2V0X2xvY2tlZChibG9ja2Rldl9zdXBlcmJs
b2NrLCBkZXYpOwo+ICAgCWlmICghaW5vZGUpCj4gICAJCXJldHVybiBOVUxMOwo+ICAgCj4gQEAg
LTkxMCw2ICs4ODcsNyBAQCBzdGF0aWMgc3RydWN0IGJsb2NrX2RldmljZSAqYmRnZXQoZGV2X3Qg
ZGV2KQo+ICAgCQliZGV2LT5iZF9zdXBlciA9IE5VTEw7Cj4gICAJCWJkZXYtPmJkX2lub2RlID0g
aW5vZGU7Cj4gICAJCWJkZXYtPmJkX3BhcnRfY291bnQgPSAwOwo+ICsJCWJkZXYtPmJkX2RldiA9
IGRldjsKPiAgIAkJaW5vZGUtPmlfbW9kZSA9IFNfSUZCTEs7Cj4gICAJCWlub2RlLT5pX3JkZXYg
PSBkZXY7Cj4gICAJCWlub2RlLT5pX2JkZXYgPSBiZGV2Owo+IApSZXZpZXdlZC1ieTogSGFubmVz
IFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMg
UmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3Vz
ZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpI
UkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2
cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJi
ZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0
cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
