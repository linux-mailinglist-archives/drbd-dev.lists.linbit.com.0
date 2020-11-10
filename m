Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 545912AD395
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1116C4207F7;
	Tue, 10 Nov 2020 11:23:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 000A2420372
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 08:00:29 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4ADE6ABCC;
	Tue, 10 Nov 2020 07:00:29 +0000 (UTC)
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-4-hch@lst.de>
	<1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
	<20201109085340.GB27483@lst.de>
	<e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
	<d28042e3-3123-5dfc-d0a2-aab0012150c8@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <c883475d-c154-a123-521e-4723b87534cd@suse.de>
Date: Tue, 10 Nov 2020 08:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d28042e3-3123-5dfc-d0a2-aab0012150c8@grimberg.me>
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

T24gMTEvMTAvMjAgMTI6MjggQU0sIFNhZ2kgR3JpbWJlcmcgd3JvdGU6Cj4gCj4+IFsgLi4gXQo+
Pj4+IE9yaWdpbmFsbHkgbnZtZSBtdWx0aXBhdGggd291bGQgdXBkYXRlL2NoYW5nZSB0aGUgc2l6
ZSBvZiB0aGUgbXVsdGlwYXRoCj4+Pj4gZGV2aWNlIGFjY29yZGluZyB0byB0aGUgdW5kZXJseWlu
ZyBwYXRoIGRldmljZXMuCj4+Pj4gV2l0aCB0aGlzIHBhdGNoIHRoZSBzaXplIG9mIHRoZSBtdWx0
aXBhdGggZGV2aWNlIHdpbGwgX25vdF8gY2hhbmdlIAo+Pj4+IGlmIHRoZXJlCj4+Pj4gaXMgYSBj
aGFuZ2Ugb24gdGhlIHVuZGVybHlpbmcgZGV2aWNlcy4KPj4+Cj4+PiBZZXMsIGl0IHdpbGwuwqAg
VGFrZSBhIGNsb3NlIGxvb2sgYXQgbnZtZV91cGRhdGVfZGlza19pbmZvIGFuZCBob3cgaXQgaXMK
Pj4+IGNhbGxlZC4KPj4+Cj4+IE9rYXksIHRoZW46IFdoYXQgd291bGQgYmUgdGhlIGNvcnJlY3Qg
d2F5IG9mIGhhbmRsaW5nIGEgc2l6ZSB1cGRhdGUgCj4+IGZvciBOVk1lIG11bHRpcGF0aD8KPj4g
QXNzdW1pbmcgd2UncmUgZ2V0dGluZyBhbiBBRU4gZm9yIGVhY2ggcGF0aCBzaWduYWxsaW5nIHRo
ZSBzaXplIGNoYW5nZQo+PiAob3IgYSBjb250cm9sbGVyIHJlc2V0IGxlYWRpbmcgdG8gYSBzaXpl
IGNoYW5nZSkuCj4+IFNvIGlmIHdlJ3JlIHVwZGF0aW5nIHRoZSBzaXplIG9mIHRoZSBtdWx0aXBh
dGggZGV2aWNlIHRvZ2V0aGVyIHdpdGggCj4+IHRoZSBwYXRoIGRldmljZSBhdCB0aGUgZmlyc3Qg
QUVOL3Jlc2V0IHdlJ2xsIGVuZCB1cCB3aXRoIHRoZSBvdGhlciAKPj4gcGF0aHMgaGF2aW5nIGEg
ZGlmZmVyZW50IHNpemUgdGhhbiB0aGUgbXVsdGlwYXRoIGRldmljZSAoYW5kIHRoZSBwYXRoIAo+
PiB3ZSd2ZSBqdXN0IGJlZW4gdXBkYXRpbmcpLgo+PiAtIERvIHdlIGNhcmUsIG9yIGNyb3NzIGZp
bmdlcnMgYW5kIGhvcGUgZm9yIHRoZSBiZXN0Pwo+PiAtIFNob3VsZG4ndCB3ZSBkZXRlY3QgdGhl
IGNhc2Ugd2hlcmUgd2Ugd29uJ3QgZ2V0IGEgc2l6ZSB1cGRhdGUgZm9yIAo+PiB0aGUgb3RoZXIg
cGF0aHMsIG9yLCBpbmRlZWQsIHdlIGhhdmUgYSBnZW51aW5lIGRldmljZSBzaXplIG1pc21hdGNo
IAo+PiBkdWUgdG8gYSBtaXNjb25maWd1cmF0aW9uIG9uIHRoZSB0YXJnZXQ/Cj4+Cj4+IElFIHNo
b3VsZG4ndCB3ZSBoYXZlIGEgZmxhZyAnc2l6ZSB1cGRhdGUgcGVuZGluZycgZm9yIHRoZSBvdGhl
ciAKPj4gcGF0aHMsLCB0byB0YWtlIHRoZW0gb3V0IG91ZiB1c2UgdGVtcG9yYXJpbHkgdW50aWwg
dGhlIG90aGVyIAo+PiBBRU5zL3Jlc2V0cyBoYXZlIGJlZW4gcHJvY2Vzc2VkPwo+IAo+IHRoZSBt
cGF0aCBkZXZpY2Ugd2lsbCB0YWtlIHRoZSBtaW5pbXVtIHNpemUgZnJvbSBhbGwgdGhlIHBhdGhz
LCB0aGF0IGlzCj4gd2hhdCBibGtfc3RhY2tfbGltaXRzIGRvZXMuIFdoZW4gdGhlIEFFTiBmb3Ig
YWxsIHRoZSBwYXRocyB3aWxsIGFycml2ZQo+IHRoZSBtcGF0aCBzaXplIHdpbGwgdXBkYXRlLgo+
IApCdXQgdGhhdCdzIHByZWNpc2VseSBteSBwb2ludDsgdGhlcmUgd29uJ3QgYmUgYW4gQUVOIGZv
ciBfYWxsXyBwYXRocywgCmJ1dCByYXRoZXIgb25lIEFFTiBwZXIgcGF0aC4gV2hpY2ggd2lsbCBi
ZSBwcm9jZXNzZWQgc2VwYXJhdGVseSwgbGVhZGluZyAKdG8gdGhlIGlzc3VlIGRlc2NyaWJlZCBh
Ym92ZS4KCj4gTm90IHN1cmUgaG93IHRoaXMgaXMgZGlmZmVyZW50IHRoYW4gd2hhdCB3ZSBoYXZl
IHRvZGF5Li4uCgpPaCwgdGhhdCBpcyBhIHByb2JsZW0gZXZlbiB0b2RheS4KU28gd2Ugc2hvdWxk
IHByb2JhYmx5IG1vdmUgaXQgdG8gYSBkaWZmZXJlbnQgdGhyZWFkLi4uCgpDaGVlcnMsCgpIYW5u
ZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2Ug
QXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5
MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xo
cmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
