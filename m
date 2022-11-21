Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72D6321C5
	for <lists+drbd-dev@lfdr.de>; Mon, 21 Nov 2022 13:19:48 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15B40420FC2;
	Mon, 21 Nov 2022 13:19:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B1F14205C8
	for <drbd-dev@lists.linbit.com>;
	Mon, 21 Nov 2022 12:58:01 +0100 (CET)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NG5QQ5c87zqSYr;
	Mon, 21 Nov 2022 19:54:06 +0800 (CST)
Received: from dggpemm500015.china.huawei.com (7.185.36.181) by
	dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Mon, 21 Nov 2022 19:58:00 +0800
Received: from [10.174.177.133] (10.174.177.133) by
	dggpemm500015.china.huawei.com (7.185.36.181) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Mon, 21 Nov 2022 19:57:59 +0800
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20221121111138.3665586-1-bobo.shaobowang@huawei.com>
	<3603e71c-cd9d-fd27-7c52-1eed263e8717@linbit.com>
From: "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Message-ID: <ff347eb2-d36a-480c-8de7-cb01a2ee35e0@huawei.com>
Date: Mon, 21 Nov 2022 19:57:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <3603e71c-cd9d-fd27-7c52-1eed263e8717@linbit.com>
X-Originating-IP: [10.174.177.133]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
	dggpemm500015.china.huawei.com (7.185.36.181)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 21 Nov 2022 13:19:46 +0100
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, liwei391@huawei.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: destroy workqueue when drbd device was
	freed
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

CuWcqCAyMDIyLzExLzIxIDE5OjUxLCBDaHJpc3RvcGggQsO2aG13YWxkZXIg5YaZ6YGTOgo+IEFt
IDIxLjExLjIyIHVtIDEyOjExIHNjaHJpZWIgV2FuZyBTaGFvQm86Cj4+IEEgc3VibWl0dGVyIHdv
cmtxdWV1ZSBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQgYnkgaW5pdF9zdWJtaXR0ZXIoKQo+PiBj
YWxsZWQgYnkgZHJiZF9jcmVhdGVfZGV2aWNlKCksIHdlIHNob3VsZCBkZXN0cm95IGl0IHdoZW4g
dGhpcwo+PiBkZXZpY2Ugd2FzIG5vdCBuZWVkZWQgb3IgZGVzdHJveWVkLgo+Pgo+PiBGaXhlczog
MTEzZmVmOWUyMGUwICgiZHJiZDogcHJlcGFyZSB0byBxdWV1ZSB3cml0ZSByZXF1ZXN0cyBvbiBh
IHN1Ym1pdCB3b3JrZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFNoYW9CbyA8Ym9iby5zaGFv
Ym93YW5nQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYyB8IDUgKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9tYWluLmMKPj4gaW5kZXggODUzMmI4MzlhMzQzLi40NjdjNDk4ZTNhZGQg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+PiArKysgYi9k
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKPj4gQEAgLTIyMTgsNiArMjIxOCw5IEBAIHZv
aWQgZHJiZF9kZXN0cm95X2RldmljZShzdHJ1Y3Qga3JlZiAqa3JlZikKPj4gICAJCWtmcmVlKHBl
ZXJfZGV2aWNlKTsKPj4gICAJfQo+PiAgIAltZW1zZXQoZGV2aWNlLCAweGZkLCBzaXplb2YoKmRl
dmljZSkpOwo+PiArCj4+ICsJaWYgKGRldmljZS0+c3VibWl0LndxKQo+PiArCQlkZXN0cm95X3dv
cmtxdWV1ZShkZXZpY2UtPnN1Ym1pdC53cSk7Cj4+ICAgCWtmcmVlKGRldmljZSk7Cj4+ICAgCWty
ZWZfcHV0KCZyZXNvdXJjZS0+a3JlZiwgZHJiZF9kZXN0cm95X3Jlc291cmNlKTsKPj4gICB9Cj4+
IEBAIC0yODEwLDYgKzI4MTMsOCBAQCBlbnVtIGRyYmRfcmV0X2NvZGUgZHJiZF9jcmVhdGVfZGV2
aWNlKHN0cnVjdCBkcmJkX2NvbmZpZ19jb250ZXh0ICphZG1fY3R4LCB1bnNpZwo+PiAgIAlwdXRf
ZGlzayhkaXNrKTsKPj4gICBvdXRfbm9fZGlzazoKPj4gICAJa3JlZl9wdXQoJnJlc291cmNlLT5r
cmVmLCBkcmJkX2Rlc3Ryb3lfcmVzb3VyY2UpOwo+PiArCWlmIChkZXZpY2UtPnN1Ym1pdC53cSkK
Pj4gKwkJZGVzdHJveV93b3JrcXVldWUoZGV2aWNlLT5zdWJtaXQud3EpOwo+PiAgIAlrZnJlZShk
ZXZpY2UpOwo+PiAgIAlyZXR1cm4gZXJyOwo+PiAgIH0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4K
Pgo+IFVuZm9ydHVuYXRlbHksIChhdCBsZWFzdCkgdGhlIGZpcnN0IGh1bmsgaXMgYnVnZ3k6IHdl
IG1lbXNldCgpIHRoZQo+IGRldmljZSB0byBhbGwgMHhmZCwgYW5kIHRyeSB0byBhY2Nlc3MgaXQg
aW1tZWRpYXRlbHkgYWZ0ZXJ3YXJkcy4KPgo+IFRoaXMgb2J2aW91c2x5IGxlYWRzIHRvIGludmFs
aWQgbWVtb3J5IGFjY2Vzcy4KCkhpIENocmlzdG9waCwKCkkgZm91bmQgdGhhdCBlcnJvciwgc28g
SSBoYXZlIHNlbnQgYSBSRVNFTkQgdmVyc2lvbiwgaSB3b3VsZCBiZSBhcHByZWNpYXRlZAoKaWYg
eW91IGNvdWxkIGhlbHAgY2hlY2sgbXkgcGF0Y2guXi1eCgotLSBXYW5nIFNoYW9CbwoKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
