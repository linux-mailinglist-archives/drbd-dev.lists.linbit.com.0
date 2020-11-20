Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA72BA315
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:25:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A04794207A7;
	Fri, 20 Nov 2020 08:25:35 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF3B7420666
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:25:29 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ACBFAAB3D;
	Fri, 20 Nov 2020 07:25:29 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-55-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <92e3c0c1-aa72-aff9-8916-aa443f85a9e4@suse.de>
Date: Fri, 20 Nov 2020 08:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-55-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 54/78] block: remove a duplicate
	__disk_get_part prototype
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBpbmNsdWRlL2xp
bnV4L2dlbmhkLmggfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZ2VuaGQuaCBiL2luY2x1ZGUvbGludXgvZ2VuaGQu
aAo+IGluZGV4IDQ2NTUzZDZkNjAyNTYzLi4yMmY1YjlmZDk2ZjhiZiAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2dlbmhkLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2dlbmhkLmgKPiBAQCAt
MjUwLDcgKzI1MCw2IEBAIHN0YXRpYyBpbmxpbmUgZGV2X3QgcGFydF9kZXZ0KHN0cnVjdCBoZF9z
dHJ1Y3QgKnBhcnQpCj4gICAJcmV0dXJuIHBhcnRfdG9fZGV2KHBhcnQpLT5kZXZ0Owo+ICAgfQo+
ICAgCj4gLWV4dGVybiBzdHJ1Y3QgaGRfc3RydWN0ICpfX2Rpc2tfZ2V0X3BhcnQoc3RydWN0IGdl
bmRpc2sgKmRpc2ssIGludCBwYXJ0bm8pOwo+ICAgZXh0ZXJuIHN0cnVjdCBoZF9zdHJ1Y3QgKmRp
c2tfZ2V0X3BhcnQoc3RydWN0IGdlbmRpc2sgKmRpc2ssIGludCBwYXJ0bm8pOwo+ICAgCj4gICBz
dGF0aWMgaW5saW5lIHZvaWQgZGlza19wdXRfcGFydChzdHJ1Y3QgaGRfc3RydWN0ICpwYXJ0KQo+
IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpI
YW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3Jh
Z2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0
OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1k
ZXYK
