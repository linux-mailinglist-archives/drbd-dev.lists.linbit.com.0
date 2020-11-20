Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED672BA399
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 08:41:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0862A4207CD;
	Fri, 20 Nov 2020 08:41:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4AB554207B0
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 08:41:19 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0C348AC23;
	Fri, 20 Nov 2020 07:41:19 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-65-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <38ac9782-a563-b7ea-595a-124159fb755d@suse.de>
Date: Fri, 20 Nov 2020 08:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-65-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 64/78] dm: simplify flush_bio initialization
 in __send_empty_flush
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

T24gMTEvMTYvMjAgMzo1NyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2UgZG9uJ3Qg
cmVhbGx5IG5lZWQgdGhlIHN0cnVjdCBibG9ja19kZXZpY2UgdG8gaW5pdGlhbGl6ZSBhIGJpby4g
IFNvCj4gc3dpdGNoIGZyb20gdXNpbmcgYmlvX3NldF9kZXYgdG8gbWFudWFsbHkgc2V0dGluZyB1
cCBiaV9kaXNrIChiaV9wYXJ0bm8KPiB3aWxsIGFsd2F5cyBiZSB6ZXJvIGFuZCBoYXMgYmVlbiBj
bGVhcmVkIGJ5IGJpb19pbml0IGFscmVhZHkpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAgZHJpdmVycy9tZC9kbS5jIHwgMTIgKysr
LS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLmMgYi9kcml2ZXJzL21kL2RtLmMK
PiBpbmRleCA1NDczOWYxYjU3OWJjOC4uNmQ3ZWI3MmQ0MWY5ZWEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tZC9kbS5jCj4gKysrIGIvZHJpdmVycy9tZC9kbS5jCj4gQEAgLTE0MjIsMTggKzE0MjIs
MTIgQEAgc3RhdGljIGludCBfX3NlbmRfZW1wdHlfZmx1c2goc3RydWN0IGNsb25lX2luZm8gKmNp
KQo+ICAgCSAqLwo+ICAgCWJpb19pbml0KCZmbHVzaF9iaW8sIE5VTEwsIDApOwo+ICAgCWZsdXNo
X2Jpby5iaV9vcGYgPSBSRVFfT1BfV1JJVEUgfCBSRVFfUFJFRkxVU0ggfCBSRVFfU1lOQzsKPiAr
CWZsdXNoX2Jpby5iaV9kaXNrID0gY2ktPmlvLT5tZC0+ZGlzazsKPiArCWJpb19hc3NvY2lhdGVf
YmxrZygmZmx1c2hfYmlvKTsKPiArCj4gICAJY2ktPmJpbyA9ICZmbHVzaF9iaW87Cj4gICAJY2kt
PnNlY3Rvcl9jb3VudCA9IDA7Cj4gICAKPiAtCS8qCj4gLQkgKiBFbXB0eSBmbHVzaCB1c2VzIGEg
c3RhdGljYWxseSBpbml0aWFsaXplZCBiaW8sIGFzIHRoZSBiYXNlIGZvcgo+IC0JICogY2xvbmlu
Zy4gIEhvd2V2ZXIsIGJsa2cgYXNzb2NpYXRpb24gcmVxdWlyZXMgdGhhdCBhIGJkZXYgaXMKPiAt
CSAqIGFzc29jaWF0ZWQgd2l0aCBhIGdlbmRpc2ssIHdoaWNoIGRvZXNuJ3QgaGFwcGVuIHVudGls
IHRoZSBiZGV2IGlzCj4gLQkgKiBvcGVuZWQuICBTbywgYmxrZyBhc3NvY2lhdGlvbiBpcyBkb25l
IGF0IGlzc3VlIHRpbWUgb2YgdGhlIGZsdXNoCj4gLQkgKiByYXRoZXIgdGhhbiB3aGVuIHRoZSBk
ZXZpY2UgaXMgY3JlYXRlZCBpbiBhbGxvY19kZXYoKS4KPiAtCSAqLwo+IC0JYmlvX3NldF9kZXYo
Y2ktPmJpbywgY2ktPmlvLT5tZC0+YmRldik7Cj4gLQo+ICAgCUJVR19PTihiaW9faGFzX2RhdGEo
Y2ktPmJpbykpOwo+ICAgCXdoaWxlICgodGkgPSBkbV90YWJsZV9nZXRfdGFyZ2V0KGNpLT5tYXAs
IHRhcmdldF9ucisrKSkpCj4gICAJCV9fc2VuZF9kdXBsaWNhdGVfYmlvcyhjaSwgdGksIHRpLT5u
dW1fZmx1c2hfYmlvcywgTlVMTCk7Cj4gCkFoLCB0aG91Z2h0IGFzIG11Y2guIEkndmUgc3R1bWJs
ZWQgYWNyb3NzIHRoaXMgd2hpbGUgZGVidWdnaW5nIApibGstaW50ZXJwb3Nlci4KClJldmlld2Vk
LWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAK
RHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRl
Y3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1
MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZl
bGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpo
dHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
