Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3A2BA3D6
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:50:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 736874207D2;
	Fri, 20 Nov 2020 08:50:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E52D54207CD
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:50:31 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 55C9CAC23;
	Fri, 20 Nov 2020 07:50:31 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-67-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <23914ef5-5245-b468-4168-bc1584e979d2@suse.de>
Date: Fri, 20 Nov 2020 08:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-67-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 66/78] block: keep a block_device reference
 for each hd_struct
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVG8gc2ltcGxp
ZnkgYmxvY2sgZGV2aWNlIGxvb2t1cCBhbmQgYSBmZXcgb3RoZXIgdXBjb21kaW4gYXJlYXMsIG1h
a2Ugc3VyZQo+IHRoYXQgd2UgYWx3YXlzIGhhdmUgYSBzdHJ1Y3QgYmxvY2tfZGV2aWNlIGF2YWls
YWJsZSBmb3IgZWFjaCBkaXNrIGFuZAo+IGVhY2ggcGFydGl0aW9uLiAgVGhlIG9ubHkgZG93bnNp
ZGUgb2YgdGhpcyBpcyB0aGF0IGVhY2ggZGV2aWNlIGFuZAo+IHBhcnRpdGlvbiB1c2VzIGEgbGl0
dGxlIG1vcmUgbWVtb3JpZXMuICBUaGUgdXBzaWRlIHdpbGwgYmUgdGhhdCBhIGxvdCBvZgo+IGNv
ZGUgY2FuIGJlIHNpbXBsaWZpZWQuCj4gCj4gV2l0aCB0aGF0IGFsbCB3ZSBuZWVkIHRvIGxvb2sg
dXAgdGhlIGJsb2NrIGRldmljZSBpcyB0byBsb29rdXAgdGhlIGlub2RlCj4gYW5kIGRvIGEgZmV3
IHNhbml0eSBjaGVja3Mgb24gdGhlIGdlbmRpc2ssIGluc3RlYWQgb2YgdGhlIHNlcGFyYXRlIGxv
b2t1cAo+IGZvciB0aGUgZ2VuZGlzay4KPiAKPiBBcyBwYXJ0IG9mIHRoZSBjaGFuZ2Ugc3dpdGNo
IGJkZ2V0KCkgdG8gb25seSBmaW5kIGV4aXN0aW5nIGJsb2NrIGRldmljZXMsCj4gZ2l2ZW4gdGhh
dCB3ZSBrbm93IHRoYXQgdGhlIGJsb2NrX2RldmljZSBzdHJ1Y3R1cmUgbXVzdCBiZSBhbGxvY2F0
ZWQgYXQKPiBwcm9iZSAvIHBhcnRpdGlvbiBzY2FuIHRpbWUuCj4gCj4gYmxrLWNncm91cCBuZWVk
ZWQgYSBiaXQgb2YgYSBzcGVjaWFsIHRyZWF0bWVudCBhcyB0aGUgb25seSBwbGFjZSB0aGF0Cj4g
d2FudGVkIHRvIGxvb2t1cCBhIGdlbmRpc2sgb3V0c2lkZSBvZiB0aGUgbm9ybWFsIGJsa2Rldl9n
ZXQgcGF0aC4gIEl0IGlzCj4gc3dpdGNoZWQgdG8gbG9va3VwIHVzaW5nIHRoZSBibG9jayBkZXZp
Y2UgaGFzaCBub3cgdGhhdCB0aGlzIGlzIHRoZQo+IHByaW1hcnkgbG9va3VwIHBhdGguCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBi
bG9jay9ibGstY2dyb3VwLmMgICAgICAgICB8ICA0MiArKysrLS0tLS0KPiAgIGJsb2NrL2Jsay1p
b2Nvc3QuYyAgICAgICAgIHwgIDM2ICsrKy0tLS0KPiAgIGJsb2NrL2Jsay5oICAgICAgICAgICAg
ICAgIHwgICAxIC0KPiAgIGJsb2NrL2dlbmhkLmMgICAgICAgICAgICAgIHwgMTg4ICsrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5j
ICAgIHwgIDI4ICsrKy0tLQo+ICAgZnMvYmxvY2tfZGV2LmMgICAgICAgICAgICAgfCAxMzMgKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvbGludXgvYmxrLWNncm91cC5oIHwg
ICA0ICstCj4gICBpbmNsdWRlL2xpbnV4L2Jsa2Rldi5oICAgICB8ICAgMyArCj4gICBpbmNsdWRl
L2xpbnV4L2dlbmhkLmggICAgICB8ICAgNCArLQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCAxNTMgaW5z
ZXJ0aW9ucygrKSwgMjg2IGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5l
Y2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVj
a2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4
MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYg
bWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5i
aXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
