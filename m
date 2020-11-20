Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id B635E2BA3FA
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:55:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B7C084207DF;
	Fri, 20 Nov 2020 08:55:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ED73E4207D0
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:55:29 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9D32FAC23;
	Fri, 20 Nov 2020 07:55:29 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-70-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f776dc43-0917-5d09-52a6-0d5e57914dd5@suse.de>
Date: Fri, 20 Nov 2020 08:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-70-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 69/78] block: remove the nr_sects field in
 struct hd_struct
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

T24gMTEvMTYvMjAgMzo1OCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTm93IHRoYXQg
dGhlIGhkX3N0cnVjdCBhbHdheXMgaGFzIGEgYmxvY2sgZGV2aWNlIGF0dGFjaGVkIHRvIGl0LCB0
aGVyZSBpcwo+IG5vIG5lZWQgZm9yIGhhdmluZyB0d28gc2l6ZSBmaWVsZCB0aGF0IGp1c3QgZ2V0
IG91dCBvZiBzeW5jLgo+IAo+IEFkZGl0aW9uYWwgdGhlIGZpZWxkIGluIGhkX3N0cnVjdCBkaWQg
bm90IHVzZSBwcm9wZXIgc2VyaWFsaXppYXRpb24sCj4gcG9zc2libHkgYWxsb3dpbmcgZm9yIHRv
cm4gd3JpdGVzLiAgQnkgb25seSB1c2luZyB0aGUgYmxvY2tfZGV2aWNlIGZpZWxkCj4gdGhpcyBw
cm9ibGVtIGFsc28gZ2V0cyBmaXhlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgIGJsb2NrL2Jpby5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gICBibG9jay9ibGsuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgNTMgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAgYmxvY2svZ2VuaGQuYyAgICAgICAgICAgICAgICAgICAgICB8IDM0
ICsrKysrKystLS0tLS0tCj4gICBibG9jay9wYXJ0aXRpb25zL2NvcmUuYyAgICAgICAgICAgIHwg
MTcgKysrKy0tLQo+ICAgZHJpdmVycy9ibG9jay9sb29wLmMgICAgICAgICAgICAgICB8ICAxIC0K
PiAgIGRyaXZlcnMvYmxvY2svbmJkLmMgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCB8ICA0ICstCj4gICBkcml2ZXJzL21kL2JjYWNo
ZS9zdXBlci5jICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvczM5MC9ibG9jay9kYXNkX2lv
Y3RsLmMgICAgfCAgNCArLQo+ICAgZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfcHNjc2kuYyB8
ICA3ICstLQo+ICAgZnMvYmxvY2tfZGV2LmMgICAgICAgICAgICAgICAgICAgICB8IDczICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgZnMvZjJmcy9zdXBlci5jICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gICBmcy9wc3RvcmUvYmxrLmMgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCAgICAgICAgICAgICAgfCAyOSArKystLS0t
LS0tLS0KPiAgIGtlcm5lbC90cmFjZS9ibGt0cmFjZS5jICAgICAgICAgICAgfCAgMiArLQo+ICAg
MTYgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTg5IGRlbGV0aW9ucygtKQo+IApS
ZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5u
ZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2Ug
QXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5
MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xo
cmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
