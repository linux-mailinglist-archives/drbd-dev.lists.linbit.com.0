Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D83775061
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Aug 2023 03:32:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0831942097B;
	Wed,  9 Aug 2023 03:32:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CB8A42019F
	for <drbd-dev@lists.linbit.com>;
	Wed,  9 Aug 2023 03:32:11 +0200 (CEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RLCC36Xbfz1hwLF;
	Wed,  9 Aug 2023 09:29:19 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
	kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2507.27; Wed, 9 Aug 2023 09:32:09 +0800
Message-ID: <ee32b802-91a8-f7a8-cf2a-e17de1aef9a9@huawei.com>
Date: Wed, 9 Aug 2023 09:32:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
	Thunderbird/102.2.0
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20230808090111.2420717-1-ruanjinjie@huawei.com>
	<5e560155-b2a4-e5bd-d22e-0e44a5a85f43@kernel.dk>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <5e560155-b2a4-e5bd-d22e-0e44a5a85f43@kernel.dk>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
	kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Subject: Re: [Drbd-dev] [PATCH -next] drbd: Use helper put_drbd_dev() and
	get_drbd_dev()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

CgpPbiAyMDIzLzgvOSAxOjM2LCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9uIDgvOC8yMyAzOjAx4oCv
QU0sIFJ1YW4gSmluamllIHdyb3RlOgo+PiBUaGUgZHJiZF9kZXN0cm95X2RldmljZSgpIGFyZyBv
ZiB0aGlzIGNvZGUgaXMgYWxyZWFkeSBkdXBsaWNhdGVkCj4+IDE4IHRpbWVzLCB1c2UgaGVscGVy
IGZ1bmN0aW9uIHB1dF9kcmJkX2RldigpIHRvIHJlbGVhc2UgZHJiZF9kZXZpY2UKPj4gYW5kIHJl
bGF0ZWQgcmVzb3VyY2VzIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgaXQgdG8gaGVscCBpbXByb3Zl
Cj4+IGNvZGUgcmVhZGFiaWxpdHkgYSBiaXQuCj4+Cj4+IEFuZCBhZGQgZ2V0X2RyYmRfZGV2KCkg
aGVscGVyIGZ1bmN0aW9uIHRvIGJlIHN5bW1ldHJpY2FsIHdpdGggaXQuCj4+Cj4+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludm9sdmVkLgo+IAo+IElNSE8gdGhpcyBqdXN0IG1ha2VzIHRoZSBjb2Rl
IGhhcmRlciB0byByZWFkLiBZb3UncmUgbm90IGFkZGluZyBhCj4gaGVscGVyLCBhbGwgaXQgZG9l
cyBpcyBjYWxsIHRoZSBzYW1lIGdldC9wdXQgcGFydHMuIFdoeSBub3QganVzdCBrZWVwCj4gaXQg
YXMtaXMgdGhlbj8KClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QgdGhlIG1lYW5pbmcgb2YgYSBoZWxw
ZXIuSSdsbCBsZWFybiBtb3JlIGFib3V0CndoYXQgb3RoZXIgaGVscGVyIHBhdGNoZXMgYXJlIGRv
aW5nLiBJdCdzIG9rYXkgdG8ga2VlcCBpdCBhcyBpdCBpcy4KCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJk
LWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RyYmQtZGV2Cg==
