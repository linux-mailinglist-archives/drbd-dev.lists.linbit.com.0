Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF302BA2EC
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:20:28 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE91B42066D;
	Fri, 20 Nov 2020 08:20:27 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B138420639
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:20:23 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7376AAC23;
	Fri, 20 Nov 2020 07:20:23 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-32-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <62c828df-02be-1848-0a95-9b937f9998da@suse.de>
Date: Fri, 20 Nov 2020 08:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-32-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 31/78] loop: use set_disk_ro
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVXNlIHNldF9k
aXNrX3JvIGluc3RlYWQgb2Ygc2V0X2RldmljZV9ybyB0byBtYXRjaCBhbGwgb3RoZXIgYmxvY2sK
PiBkcml2ZXJzIGFuZCB0byBlbnN1cmUgYWxsIHBhcnRpdGlvbnMgbWlycm9yIHRoZSByZWFkLW9u
bHkgZmxhZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiAgIGRyaXZlcnMvYmxvY2svbG9vcC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmxvY2svbG9vcC5jIGIvZHJpdmVycy9ibG9jay9sb29wLmMKPiBpbmRleCA4NGEzNmMyNDJl
NTU1MC4uNDFjYWY3OTlkZjcyMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay9sb29wLmMK
PiArKysgYi9kcml2ZXJzL2Jsb2NrL2xvb3AuYwo+IEBAIC0xMTM0LDcgKzExMzQsNyBAQCBzdGF0
aWMgaW50IGxvb3BfY29uZmlndXJlKHN0cnVjdCBsb29wX2RldmljZSAqbG8sIGZtb2RlX3QgbW9k
ZSwKPiAgIAlpZiAoZXJyb3IpCj4gICAJCWdvdG8gb3V0X3VubG9jazsKPiAgIAo+IC0Jc2V0X2Rl
dmljZV9ybyhiZGV2LCAobG8tPmxvX2ZsYWdzICYgTE9fRkxBR1NfUkVBRF9PTkxZKSAhPSAwKTsK
PiArCXNldF9kaXNrX3JvKGxvLT5sb19kaXNrLCAobG8tPmxvX2ZsYWdzICYgTE9fRkxBR1NfUkVB
RF9PTkxZKSAhPSAwKTsKPiAgIAo+ICAgCWxvLT51c2VfZGlvID0gbG8tPmxvX2ZsYWdzICYgTE9f
RkxBR1NfRElSRUNUX0lPOwo+ICAgCWxvLT5sb19kZXZpY2UgPSBiZGV2Owo+IApSZXZpZXdlZC1i
eTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRy
LiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0
CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMg
Njg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0
cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
