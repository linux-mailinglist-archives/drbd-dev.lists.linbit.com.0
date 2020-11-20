Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9572BA40D
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:58:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 59B764207E0;
	Fri, 20 Nov 2020 08:58:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BA3A74207D7
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:58:17 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 75B07AC0C;
	Fri, 20 Nov 2020 07:58:17 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-71-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <c854459e-d124-d0fd-2159-d40ef4d6ca75@suse.de>
Date: Fri, 20 Nov 2020 08:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-71-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 70/78] block: replace bd_mutex with a
	per-gendisk mutex
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

T24gMTEvMTYvMjAgMzo1OCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gYmRfbXV0ZXgg
aXMgcHJpbWFyaWx5IHVzZWQgZm9yIHN5bmNocm9uaXppbmcgdGhlIGJsb2NrIGRldmljZSBvcGVu
IGFuZAo+IHJlbGVhc2UgcGF0aCwgd2hpY2ggcmVjdXJzZXMgZnJvbSBwYXJ0aXRpb25zIHRvIHRo
ZSB3aG9sZSBkaXNrIGRldmljZS4KPiBUaGUgZmFjdCB0aGF0IHdlIGhhdmUgdHdvIGxvY2tzIG1h
a2VzIGxpZmUgdW5uZWNlc3NhcmlseSBjb21wbGV4IGR1ZQo+IHRvIGxvY2sgb3JkZXIgY29uc3Ry
YWlucy4gIFJlcGxhY2UgdGhlIHR3byBsZXZlbHMgb2YgbG9ja2luZyB3aXRoIGEKPiBzaW5nbGUg
bXV0ZXggaW4gdGhlIGdlbmRpc2sgc3RydWN0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAgYmxvY2svZ2VuaGQuYyAgICAgICAg
ICAgICAgICAgICB8ICA3ICsrLS0KPiAgIGJsb2NrL2lvY3RsLmMgICAgICAgICAgICAgICAgICAg
fCAgNCArLQo+ICAgYmxvY2svcGFydGl0aW9ucy9jb3JlLmMgICAgICAgICB8IDIyICsrKysrLS0t
LS0KPiAgIGRyaXZlcnMvYmxvY2svbG9vcC5jICAgICAgICAgICAgfCAxNCArKystLS0tCj4gICBk
cml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jICAgIHwgIDggKystLQo+ICAgZHJpdmVycy9ibG9j
ay96cmFtL3pyYW1fZHJ2LmMgICB8ICA0ICstCj4gICBkcml2ZXJzL2Jsb2NrL3pyYW0venJhbV9k
cnYuaCAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvbWQvbWQuaCAgICAgICAgICAgICAgICAgfCAgNyAr
LS0tCj4gICBkcml2ZXJzL3MzOTAvYmxvY2svZGFzZF9nZW5oZC5jIHwgIDggKystLQo+ICAgZHJp
dmVycy9zY3NpL3NkLmMgICAgICAgICAgICAgICB8ICA0ICstCj4gICBmcy9ibG9ja19kZXYuYyAg
ICAgICAgICAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4g
ICBmcy9idHJmcy92b2x1bWVzLmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGZzL3N1cGVyLmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgOCArKy0tCj4gICBpbmNsdWRlL2xpbnV4L2Jsa190eXBl
cy5oICAgICAgIHwgIDEgLQo+ICAgaW5jbHVkZS9saW51eC9nZW5oZC5oICAgICAgICAgICB8ICAx
ICsKPiAgIDE1IGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDgzIGRlbGV0aW9ucygt
KQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMs
CgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0
b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6Rm
dHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3Rz
LmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJi
ZC1kZXYK
