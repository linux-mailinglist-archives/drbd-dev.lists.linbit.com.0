Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8F2AD38C
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1BC14207A2;
	Tue, 10 Nov 2020 11:23:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1180 seconds by postgrey-1.31 at mail19;
	Mon, 09 Nov 2020 09:13:40 CET
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F900420209
	for <drbd-dev@lists.linbit.com>; Mon,  9 Nov 2020 09:13:40 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E44CAABAE;
	Mon,  9 Nov 2020 07:53:59 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-4-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
Date: Mon, 9 Nov 2020 08:53:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-4-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:23:02 +0100
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
Subject: Re: [Drbd-dev] [PATCH 03/24] nvme: let
 set_capacity_revalidate_and_notify update the bdev size
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

T24gMTEvNi8yMCA4OjAzIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGVyZSBpcyBu
byBnb29kIHJlYXNvbiB0byBjYWxsIHJldmFsaWRhdGVfZGlza19zaXplIHNlcGFyYXRlbHkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4g
ICBkcml2ZXJzL252bWUvaG9zdC9jb3JlLmMgfCA1ICstLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bnZtZS9ob3N0L2NvcmUuYyBiL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYwo+IGluZGV4IDM3NjA5
NmJmYzU0YTgzLi40ZTg2YzlhYWZkODhhNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL252bWUvaG9z
dC9jb3JlLmMKPiArKysgYi9kcml2ZXJzL252bWUvaG9zdC9jb3JlLmMKPiBAQCAtMjA1Myw3ICsy
MDUzLDcgQEAgc3RhdGljIHZvaWQgbnZtZV91cGRhdGVfZGlza19pbmZvKHN0cnVjdCBnZW5kaXNr
ICpkaXNrLAo+ICAgCQkJY2FwYWNpdHkgPSAwOwo+ICAgCX0KPiAgIAo+IC0Jc2V0X2NhcGFjaXR5
X3JldmFsaWRhdGVfYW5kX25vdGlmeShkaXNrLCBjYXBhY2l0eSwgZmFsc2UpOwo+ICsJc2V0X2Nh
cGFjaXR5X3JldmFsaWRhdGVfYW5kX25vdGlmeShkaXNrLCBjYXBhY2l0eSwgdHJ1ZSk7Cj4gICAK
PiAgIAludm1lX2NvbmZpZ19kaXNjYXJkKGRpc2ssIG5zKTsKPiAgIAludm1lX2NvbmZpZ193cml0
ZV96ZXJvZXMoZGlzaywgbnMpOwo+IEBAIC0yMTM2LDcgKzIxMzYsNiBAQCBzdGF0aWMgaW50IG52
bWVfdXBkYXRlX25zX2luZm8oc3RydWN0IG52bWVfbnMgKm5zLCBzdHJ1Y3QgbnZtZV9pZF9ucyAq
aWQpCj4gICAJCWJsa19zdGFja19saW1pdHMoJm5zLT5oZWFkLT5kaXNrLT5xdWV1ZS0+bGltaXRz
LAo+ICAgCQkJCSAmbnMtPnF1ZXVlLT5saW1pdHMsIDApOwo+ICAgCQlibGtfcXVldWVfdXBkYXRl
X3JlYWRhaGVhZChucy0+aGVhZC0+ZGlzay0+cXVldWUpOwo+IC0JCW52bWVfdXBkYXRlX2JkZXZf
c2l6ZShucy0+aGVhZC0+ZGlzayk7Cj4gICAJCWJsa19tcV91bmZyZWV6ZV9xdWV1ZShucy0+aGVh
ZC0+ZGlzay0+cXVldWUpOwo+ICAgCX0KPiAgICNlbmRpZgoKSG9sZCBvbi4KVGhpcywgYXQgdGhl
IHZlcnkgbGVhc3QsIHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgpXaXRoIHRoaXMgeW91IGFy
ZSBjaGFuZ2luZyB0aGUgYmVoYXZpb3VyIG9mIG52bWUgbXVsdGlwYXRoLgoKT3JpZ2luYWxseSBu
dm1lIG11bHRpcGF0aCB3b3VsZCB1cGRhdGUvY2hhbmdlIHRoZSBzaXplIG9mIHRoZSBtdWx0aXBh
dGggCmRldmljZSBhY2NvcmRpbmcgdG8gdGhlIHVuZGVybHlpbmcgcGF0aCBkZXZpY2VzLgpXaXRo
IHRoaXMgcGF0Y2ggdGhlIHNpemUgb2YgdGhlIG11bHRpcGF0aCBkZXZpY2Ugd2lsbCBfbm90XyBj
aGFuZ2UgaWYgCnRoZXJlIGlzIGEgY2hhbmdlIG9uIHRoZSB1bmRlcmx5aW5nIGRldmljZXMuCgpX
aGlsZSBwZXJzb25hbGx5IEkgd291bGQgX2xvdmVfIHRvIGhhdmUgdGhpcyBwYXRjaCwgd2Ugc2hv
dWxkIGF0IGxlYXN0IApkb2N1bWVudCB0aGlzIGJ5IG1ha2luZyBpdCBhIHNlcGFyYXRlIHBhdGNo
LgpBbmQgd2UgcG9zc2libHkgc2hvdWxkIGNoZWNrIGlmIGJvdGggc2l6ZXMgYXJlIHRoZSBzYW1l
LCBhbmQgdGhpbmsgb2YgCndoYXQgd2Ugc2hvdWxkIGJlIGRvaW5nIGlmIHRoZXkgYXJlIG5vdC4K
CkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBL
ZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwg
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwg
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1k
ZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kcmJkLWRldgo=
