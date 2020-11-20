Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5A2BA54C
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 09:58:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 33B7E4207E4;
	Fri, 20 Nov 2020 09:58:44 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BEDC4207DE
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 09:58:42 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5CAD1AC23;
	Fri, 20 Nov 2020 08:58:42 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-75-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f6e6b948-44c8-50f0-beea-921eb3a268dd@suse.de>
Date: Fri, 20 Nov 2020 09:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-75-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 74/78] block: merge struct block_device and
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

T24gMTEvMTYvMjAgMzo1OCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSW5zdGVhZCBv
ZiBoYXZpbmcgdHdvIHN0cnVjdHVyZXMgdGhhdCByZXByZXNlbnQgZWFjaCBibG9jayBkZXZpY2Ug
d2l0aAo+IGRpZmZlcmVudCBsaWZ0IHRpbWUgcnVsZXMgbWVyZ2VkIHRoZW0gaW50byBhIHNpbmds
ZSBvbmUuICBUaGlzIGFsc28KPiBncmVhdGx5IHNpbXBsaWZpZXMgdGhlIHJlZmVyZW5jZSBjb3Vu
dGluZyBydWxlcywgYXMgd2UgY2FuIHVzZSB0aGUgaW5vZGUKPiByZWZlcmVuY2UgY291bnQgYXMg
dGhlIG1haW4gcmVmZXJlbmNlIGNvdW50IGZvciB0aGUgbmV3IHN0cnVjdAo+IGJsb2NrX2Rldmlj
ZSwgd2l0aCB0aGUgZGV2aWNlIG1vZGVsIHJlZmVyZW5jZSBmcm9udCBlbmRpbmcgaXQgZm9yIGRl
dmljZQo+IG1vZGVsIGludGVyYWN0aW9uLiAgVGhlIHBlcmNwdSByZWZjb3VudCBpbiBzdHJ1Y3Qg
aGRfc3RydWN0IGlzIGVudGlyZWx5Cj4gZ29uZSBnaXZlbiB0aGF0IHN0cnVjdCBibG9ja19kZXZp
Y2UgbXVzdCBiZSBvcGVuZWQgYW5kIHRodXMgdmFsaWQgZm9yCj4gdGhlIGR1cmF0aW9uIG9mIHRo
ZSBJL08uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gICBibG9jay9iaW8uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCj4g
ICBibG9jay9ibGstY2dyb3VwLmMgICAgICAgICAgICAgICAgIHwgICA5ICstCj4gICBibG9jay9i
bGstY29yZS5jICAgICAgICAgICAgICAgICAgIHwgIDg1ICsrKysrLS0tLS0KPiAgIGJsb2NrL2Js
ay1mbHVzaC5jICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGJsb2NrL2Jsay1saWIuYyAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGJsb2NrL2Jsay1tZXJnZS5jICAgICAgICAg
ICAgICAgICAgfCAgIDYgKy0KPiAgIGJsb2NrL2Jsay1tcS5jICAgICAgICAgICAgICAgICAgICAg
fCAgMTEgKy0KPiAgIGJsb2NrL2Jsay1tcS5oICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0K
PiAgIGJsb2NrL2Jsay5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzggKystLS0KPiAgIGJs
b2NrL2dlbmhkLmMgICAgICAgICAgICAgICAgICAgICAgfCAyNDIgKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0KPiAgIGJsb2NrL2lvY3RsLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0KPiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAgICAgICAgICAgfCAyMjEgKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMg
fCAgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3dvcmtlci5jICAgfCAgIDIgKy0K
PiAgIGRyaXZlcnMvYmxvY2svenJhbS96cmFtX2Rydi5jICAgICAgfCAgIDIgKy0KPiAgIGRyaXZl
cnMvbWQvYmNhY2hlL3JlcXVlc3QuYyAgICAgICAgfCAgIDQgKy0KPiAgIGRyaXZlcnMvbWQvZG0u
YyAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KPiAgIGRyaXZlcnMvbWQvbWQuYyAgICAgICAg
ICAgICAgICAgICAgfCAgIDQgKy0KPiAgIGRyaXZlcnMvbnZtZS90YXJnZXQvYWRtaW4tY21kLmMg
ICAgfCAgMjAgKy0tCj4gICBkcml2ZXJzL3MzOTAvYmxvY2svZGFzZC5jICAgICAgICAgIHwgICA4
ICstCj4gICBmcy9ibG9ja19kZXYuYyAgICAgICAgICAgICAgICAgICAgIHwgIDY4ICsrKy0tLS0t
Cj4gICBmcy9leHQ0L3N1cGVyLmMgICAgICAgICAgICAgICAgICAgIHwgIDE4ICstLQo+ICAgZnMv
ZXh0NC9zeXNmcy5jICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ICAgZnMvZjJmcy9jaGVj
a3BvaW50LmMgICAgICAgICAgICAgICB8ICAgNSArLQo+ICAgZnMvZjJmcy9mMmZzLmggICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgZnMvZjJmcy9zdXBlci5jICAgICAgICAgICAgICAg
ICAgICB8ICAgNiArLQo+ICAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAgICAgICAgICB8ICAg
OSAtLQo+ICAgaW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaCAgICAgICAgICB8ICAyMyArKy0KPiAg
IGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAgICAgICAgfCAgMTMgKy0KPiAgIGluY2x1ZGUv
bGludXgvZ2VuaGQuaCAgICAgICAgICAgICAgfCAgNjcgKystLS0tLS0KPiAgIGluY2x1ZGUvbGlu
dXgvcGFydF9zdGF0LmggICAgICAgICAgfCAgMTcgKy0KPiAgIGluaXQvZG9fbW91bnRzLmMgICAg
ICAgICAgICAgICAgICAgfCAgMjAgKy0tCj4gICBrZXJuZWwvdHJhY2UvYmxrdHJhY2UuYyAgICAg
ICAgICAgIHwgIDU0ICsrLS0tLS0KPiAgIDMzIGZpbGVzIGNoYW5nZWQsIDM1MSBpbnNlcnRpb25z
KCspLCA2NDIgZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhh
cmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAg
ICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcg
TsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5n
IGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
