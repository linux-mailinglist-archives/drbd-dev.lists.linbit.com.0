Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E505B55A3
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Sep 2022 09:59:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9F5A4252B9;
	Mon, 12 Sep 2022 09:59:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 81CE44210D9
	for <drbd-dev@lists.linbit.com>;
	Mon, 12 Sep 2022 09:59:10 +0200 (CEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MQzR51p1jz14QS3;
	Mon, 12 Sep 2022 15:55:13 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
	kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.24; Mon, 12 Sep 2022 15:59:07 +0800
To: Jens Axboe <axboe@kernel.dk>, <philipp.reisner@linbit.com>,
	<lars.ellenberg@linbit.com>, <christoph.boehmwalder@linbit.com>
References: <20220911092645.3218009-1-cuigaosheng1@huawei.com>
	<1b305cd1-90a2-e881-5b15-bb05b470c7c4@kernel.dk>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <299c2cf9-f46f-3d53-e4b1-1064e55ebcf9@huawei.com>
Date: Mon, 12 Sep 2022 15:59:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1b305cd1-90a2-e881-5b15-bb05b470c7c4@kernel.dk>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
	kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block/drbd: remove unused w_start_resync
	declaration
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

Cj4gQXBwbGllZCwgYnV0IHBsZWFzZSBhbHNvIGNjIGxpbnV4LWJsb2NrIG9yIG90aGVyIGxpc3Rz
IHRoYXQgbWFuYWdlCj4ga2VybmVsIHBhdGNoZXMgaW4gdGhlIGZ1dHVyZS4gWW91IGNhbid0IHVz
ZSBsb3JlL2I0L2xlaSB3aXRoIHBhdGNoZXMKPiB0aGF0IGFyZSBvbmx5IG9uIHNvbWUgZHJpdmVy
IHByaXZhdGUgbGlzdC4KClRoYW5rcyxJIHdpbGwgY2Mgb3RoZXIgbGlzdCB0aGF0IG1hbmFnZSBr
ZXJuZWwgcGF0Y2hlcyBpbiB0aGUgZnV0dXJlLgoK5ZyoIDIwMjIvOS8xMiAxNTo0OCwgSmVucyBB
eGJvZSDlhpnpgZM6Cj4gT24gOS8xMS8yMiAzOjI2IEFNLCBHYW9zaGVuZyBDdWkgd3JvdGU6Cj4+
IHdfc3RhcnRfcmVzeW5jIGhhcyBiZWVuIHJlbW92ZWQgc2luY2UKPj4gY29tbWl0IGFjMGFjYjll
MzlhYyAoImRyYmQ6IHVzZSBkcmJkX2RldmljZV9wb3N0X3dvcmsoKQo+PiBpbiBtb3JlIHBsYWNl
cyIpLCBzbyByZW1vdmUgaXQuCj4gQXBwbGllZCwgYnV0IHBsZWFzZSBhbHNvIGNjIGxpbnV4LWJs
b2NrIG9yIG90aGVyIGxpc3RzIHRoYXQgbWFuYWdlCj4ga2VybmVsIHBhdGNoZXMgaW4gdGhlIGZ1
dHVyZS4gWW91IGNhbid0IHVzZSBsb3JlL2I0L2xlaSB3aXRoIHBhdGNoZXMKPiB0aGF0IGFyZSBv
bmx5IG9uIHNvbWUgZHJpdmVyIHByaXZhdGUgbGlzdC4KPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZA
bGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kcmJkLWRldgo=
