Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAC6333BB
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 04:08:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 96319422110;
	Tue, 22 Nov 2022 04:08:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11D0D4210CC
	for <drbd-dev@lists.linbit.com>;
	Tue, 22 Nov 2022 04:08:02 +0100 (CET)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NGThM1QzHzmWJn;
	Tue, 22 Nov 2022 11:07:31 +0800 (CST)
Received: from dggpemm500015.china.huawei.com (7.185.36.181) by
	dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Tue, 22 Nov 2022 11:08:00 +0800
Received: from [10.174.177.133] (10.174.177.133) by
	dggpemm500015.china.huawei.com (7.185.36.181) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Tue, 22 Nov 2022 11:08:00 +0800
To: Jens Axboe <axboe@kernel.dk>
References: <20221121115047.3828385-1-bobo.shaobowang@huawei.com>
	<c0e639ea-caa0-f76c-c369-0d22a49047ca@kernel.dk>
From: "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Message-ID: <5b3ff507-7cc7-cb9d-1c9c-f497cb19cafb@huawei.com>
Date: Tue, 22 Nov 2022 11:08:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <c0e639ea-caa0-f76c-c369-0d22a49047ca@kernel.dk>
X-Originating-IP: [10.174.177.133]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
	dggpemm500015.china.huawei.com (7.185.36.181)
X-CFilter-Loop: Reflected
Cc: linux-block@vger.kernel.org, liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RESEND PATCH] drbd: destroy workqueue when drbd
	device was freed
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

CuWcqCAyMDIyLzExLzIxIDIyOjMwLCBKZW5zIEF4Ym9lIOWGmemBkzoKPiBPbiAxMS8yMS8yMiA0
OjUwIEFNLCBXYW5nIFNoYW9CbyB3cm90ZToKPj4gQSBzdWJtaXR0ZXIgd29ya3F1ZXVlIGlzIGR5
bmFtaWNhbGx5IGFsbG9jYXRlZCBieSBpbml0X3N1Ym1pdHRlcigpCj4+IGNhbGxlZCBieSBkcmJk
X2NyZWF0ZV9kZXZpY2UoKSwgd2Ugc2hvdWxkIGRlc3Ryb3kgaXQgd2hlbiB0aGlzCj4+IGRldmlj
ZSBpcyBub3QgbmVlZGVkIG9yIGRlc3Ryb3llZC4KPj4KPj4gRml4ZXM6IDExM2ZlZjllMjBlMCAo
ImRyYmQ6IHByZXBhcmUgdG8gcXVldWUgd3JpdGUgcmVxdWVzdHMgb24gYSBzdWJtaXQgd29ya2Vy
IikKPj4gU2lnbmVkLW9mZi1ieTogV2FuZyBTaGFvQm8gPGJvYm8uc2hhb2Jvd2FuZ0BodWF3ZWku
Y29tPgo+PiAtLS0KPj4KPj4gQ2hhbmdlcyBpbiBSRVNFTkQ6Cj4+ICAgIHB1dCBkZXN0cm95X3dv
cmtxdWV1ZSgpIGJlZm9yZSBtZW1zZXQoZGV2aWNlLCAuLi4pCj4+Cj4+ICAgZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfbWFpbi5jIHwgNyArKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFp
bi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4+IGluZGV4IDg1MzJiODM5YTM0
My4uMDgyYmMzNGNkMzE3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMKPj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4+IEBAIC0yMjE3
LDcgKzIyMTcsMTIgQEAgdm9pZCBkcmJkX2Rlc3Ryb3lfZGV2aWNlKHN0cnVjdCBrcmVmICprcmVm
KQo+PiAgIAkJa3JlZl9wdXQoJnBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLT5rcmVmLCBkcmJkX2Rl
c3Ryb3lfY29ubmVjdGlvbik7Cj4+ICAgCQlrZnJlZShwZWVyX2RldmljZSk7Cj4+ICAgCX0KPj4g
Kwo+PiArCWlmIChkZXZpY2UtPnN1Ym1pdC53cSkKPj4gKwkJZGVzdHJveV93b3JrcXVldWUoZGV2
aWNlLT5zdWJtaXQud3EpOwo+PiArCj4+ICAgCW1lbXNldChkZXZpY2UsIDB4ZmQsIHNpemVvZigq
ZGV2aWNlKSk7Cj4+ICsKPj4gICAJa2ZyZWUoZGV2aWNlKTsKPiBNYXliZSB5b3UgY2FuIHNlbmQg
YSBzZXBhcmF0ZSBwYXRjaCBraWxsaW5nIHRoYXQgdmVyeSBvZGQgKGFuZCB1c2VsZXNzKQo+IG1l
bXNldCBhcyB3ZWxsPwoKSSBoYXZlIHNlbnQgdjIgdmVyc2lvbiBhZGRpbmcgYSBuZXcgcGF0Y2gg
Zm9yIGtpbGxpbmcgdGhhdCBtZW1zZXQuXi1eCgotLSBXYW5nIFNoYW9CbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0
CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxt
YW4vbGlzdGluZm8vZHJiZC1kZXYK
