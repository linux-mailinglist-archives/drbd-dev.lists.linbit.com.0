Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E035F2AD38D
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4613C4207C9;
	Tue, 10 Nov 2020 11:23:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7A7BC4207A9
	for <drbd-dev@lists.linbit.com>; Mon,  9 Nov 2020 10:25:24 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CA23CABCC;
	Mon,  9 Nov 2020 09:25:23 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-4-hch@lst.de>
	<1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
	<20201109085340.GB27483@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
Date: Mon, 9 Nov 2020 10:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109085340.GB27483@lst.de>
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
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
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

T24gMTEvOS8yMCA5OjUzIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBNb24sIE5v
diAwOSwgMjAyMCBhdCAwODo1Mzo1OEFNICswMTAwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+
PiBpbmRleCAzNzYwOTZiZmM1NGE4My4uNGU4NmM5YWFmZDg4YTcgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL252bWUvaG9zdC9jb3JlLmMKPj4+ICsrKyBiL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUu
Ywo+Pj4gQEAgLTIwNTMsNyArMjA1Myw3IEBAIHN0YXRpYyB2b2lkIG52bWVfdXBkYXRlX2Rpc2tf
aW5mbyhzdHJ1Y3QgZ2VuZGlzayAqZGlzaywKPj4+ICAgIAkJCWNhcGFjaXR5ID0gMDsKWyAuLiBd
Cj4+IE9yaWdpbmFsbHkgbnZtZSBtdWx0aXBhdGggd291bGQgdXBkYXRlL2NoYW5nZSB0aGUgc2l6
ZSBvZiB0aGUgbXVsdGlwYXRoCj4+IGRldmljZSBhY2NvcmRpbmcgdG8gdGhlIHVuZGVybHlpbmcg
cGF0aCBkZXZpY2VzLgo+PiBXaXRoIHRoaXMgcGF0Y2ggdGhlIHNpemUgb2YgdGhlIG11bHRpcGF0
aCBkZXZpY2Ugd2lsbCBfbm90XyBjaGFuZ2UgaWYgdGhlcmUKPj4gaXMgYSBjaGFuZ2Ugb24gdGhl
IHVuZGVybHlpbmcgZGV2aWNlcy4KPiAKPiBZZXMsIGl0IHdpbGwuICBUYWtlIGEgY2xvc2UgbG9v
ayBhdCBudm1lX3VwZGF0ZV9kaXNrX2luZm8gYW5kIGhvdyBpdCBpcwo+IGNhbGxlZC4KPiAKT2th
eSwgdGhlbjogV2hhdCB3b3VsZCBiZSB0aGUgY29ycmVjdCB3YXkgb2YgaGFuZGxpbmcgYSBzaXpl
IHVwZGF0ZSBmb3IgCk5WTWUgbXVsdGlwYXRoPwpBc3N1bWluZyB3ZSdyZSBnZXR0aW5nIGFuIEFF
TiBmb3IgZWFjaCBwYXRoIHNpZ25hbGxpbmcgdGhlIHNpemUgY2hhbmdlCihvciBhIGNvbnRyb2xs
ZXIgcmVzZXQgbGVhZGluZyB0byBhIHNpemUgY2hhbmdlKS4KU28gaWYgd2UncmUgdXBkYXRpbmcg
dGhlIHNpemUgb2YgdGhlIG11bHRpcGF0aCBkZXZpY2UgdG9nZXRoZXIgd2l0aCB0aGUgCnBhdGgg
ZGV2aWNlIGF0IHRoZSBmaXJzdCBBRU4vcmVzZXQgd2UnbGwgZW5kIHVwIHdpdGggdGhlIG90aGVy
IHBhdGhzIApoYXZpbmcgYSBkaWZmZXJlbnQgc2l6ZSB0aGFuIHRoZSBtdWx0aXBhdGggZGV2aWNl
IChhbmQgdGhlIHBhdGggd2UndmUgCmp1c3QgYmVlbiB1cGRhdGluZykuCi0gRG8gd2UgY2FyZSwg
b3IgY3Jvc3MgZmluZ2VycyBhbmQgaG9wZSBmb3IgdGhlIGJlc3Q/Ci0gU2hvdWxkbid0IHdlIGRl
dGVjdCB0aGUgY2FzZSB3aGVyZSB3ZSB3b24ndCBnZXQgYSBzaXplIHVwZGF0ZSBmb3IgdGhlIApv
dGhlciBwYXRocywgb3IsIGluZGVlZCwgd2UgaGF2ZSBhIGdlbnVpbmUgZGV2aWNlIHNpemUgbWlz
bWF0Y2ggZHVlIHRvIGEgCm1pc2NvbmZpZ3VyYXRpb24gb24gdGhlIHRhcmdldD8KCklFIHNob3Vs
ZG4ndCB3ZSBoYXZlIGEgZmxhZyAnc2l6ZSB1cGRhdGUgcGVuZGluZycgZm9yIHRoZSBvdGhlciBw
YXRocywsIAp0byB0YWtlIHRoZW0gb3V0IG91ZiB1c2UgdGVtcG9yYXJpbHkgdW50aWwgdGhlIG90
aGVyIEFFTnMvcmVzZXRzIGhhdmUgCmJlZW4gcHJvY2Vzc2VkPwoKQ2hlZXJzLAoKSGFubmVzCi0t
IApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hp
dGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0
MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29t
Cmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
