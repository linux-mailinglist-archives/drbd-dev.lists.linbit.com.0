Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 275612BA307
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:23:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EE9E042066D;
	Fri, 20 Nov 2020 08:23:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F5BE42063C
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:23:17 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EDB7EAC0C;
	Fri, 20 Nov 2020 07:23:16 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-35-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <11ea0b89-d8e6-2d5d-59e4-90e928d54042@suse.de>
Date: Fri, 20 Nov 2020 08:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-35-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 34/78] block: propagate BLKROSET to all
	partitions
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2hlbiBzZXR0
aW5nIHRoZSB3aG9sZSBkZXZpY2UgcmVhZC1vbmx5IChvciBjbGVhcmluZyB0aGUgcmVhZC1vbmx5
Cj4gc3RhdGUpLCBhbHNvIHVwZGF0ZSB0aGUgcG9saWN5IGZvciBhbGwgcGFydGl0aW9ucy4gIFRo
ZSBzMzkwIGRhc2QKPiBkcml2ZXIgaGFzIGF3bHdheXMgYmVlbiBkb2luZyB0aGlzIGFuZCBpdCBt
YWtlcyBhIGxvdCBvZiBzZW5zZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgIGJsb2NrL2lvY3RsLmMgfCA1ICsrKystCj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2Jsb2NrL2lvY3RsLmMgYi9ibG9jay9pb2N0bC5jCj4gaW5kZXggNmI3ODUxODEzNDRmZTEu
LjIyZjM5NGQxMThjMzAyIDEwMDY0NAo+IC0tLSBhL2Jsb2NrL2lvY3RsLmMKPiArKysgYi9ibG9j
ay9pb2N0bC5jCj4gQEAgLTM1NCw3ICszNTQsMTAgQEAgc3RhdGljIGludCBibGtkZXZfcm9zZXQo
c3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2RlLAo+ICAgCQlpZiAocmV0KQo+
ICAgCQkJcmV0dXJuIHJldDsKPiAgIAl9Cj4gLQliZGV2LT5iZF9wYXJ0LT5wb2xpY3kgPSBuOwo+
ICsJaWYgKGJkZXZfaXNfcGFydGl0aW9uKGJkZXYpKQo+ICsJCWJkZXYtPmJkX3BhcnQtPnBvbGlj
eSA9IG47Cj4gKwllbHNlCj4gKwkJc2V0X2Rpc2tfcm8oYmRldi0+YmRfZGlzaywgbik7Cj4gICAJ
cmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFy
ZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAg
ICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBO
w7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcg
bGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
