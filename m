Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD50645A71
	for <lists+drbd-dev@lfdr.de>; Wed,  7 Dec 2022 14:09:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28E524252BF;
	Wed,  7 Dec 2022 14:09:17 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
	[45.249.212.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52E0842178C
	for <drbd-dev@lists.linbit.com>; Wed,  7 Dec 2022 14:09:14 +0100 (CET)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NRyKc2058z4f3pBt
	for <drbd-dev@lists.linbit.com>; Wed,  7 Dec 2022 21:09:08 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgBni9h0kJBjx41CBw--.7669S3;
	Wed, 07 Dec 2022 21:09:11 +0800 (CST)
To: Ming Lei <ming.lei@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>
References: <20221206181536.13333-1-gulam.mohamed@oracle.com>
	<936a498b-19fe-36d5-ff32-817f153e57e3@huaweicloud.com>
	<Y5AFX4sxLRLV4uSt@T590>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <aadfc6d2-ad04-279c-a1d6-7f634d0b2c99@huaweicloud.com>
Date: Wed, 7 Dec 2022 21:09:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Y5AFX4sxLRLV4uSt@T590>
X-CM-TRANSID: gCh0CgBni9h0kJBjx41CBw--.7669S3
X-Coremail-Antispam: 1UD129KBjvJXoWrKF13ZrWDCw43Cw15CF1DAwb_yoW8Jr4kpr
	y3A3ZIkw48WFyFkwnFya1UJrWYvrn3ArZ8uFW5K3s7trn0kas3Jr4UG3WDCF92gFsIkF12
	gay2gas8ur48C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
	3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org, song@kernel.org,
	dm-devel@redhat.com, ira.weiny@intel.com, agk@redhat.com,
	drbd-dev@lists.linbit.com, dave.jiang@intel.com,
	vishal.l.verma@intel.com, konrad.wilk@oracle.com,
	"yukuai \(C\)" <yukuai3@huawei.com>, kent.overstreet@gmail.com,
	ngupta@vflare.org, kch@nvidia.com, senozhatsky@chromium.org,
	Gulam Mohamed <gulam.mohamed@oracle.com>, snitzer@kernel.org,
	colyli@suse.de, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, dan.j.williams@intel.com,
	axboe@kernel.dk, linux-raid@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	junxiao.bi@oracle.com, minchan@kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [RFC] block: Change the granularity of io ticks from
	ms to ns
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

SGksCgrlnKggMjAyMi8xMi8wNyAxMToxNSwgTWluZyBMZWkg5YaZ6YGTOgo+IE9uIFdlZCwgRGVj
IDA3LCAyMDIyIGF0IDEwOjE5OjA4QU0gKzA4MDAsIFl1IEt1YWkgd3JvdGU6Cj4+IEhpLAo+Pgo+
PiDlnKggMjAyMi8xMi8wNyAyOjE1LCBHdWxhbSBNb2hhbWVkIOWGmemBkzoKPj4+IFVzZSBrdGlt
ZSB0byBjaGFuZ2UgdGhlIGdyYW51bGFyaXR5IG9mIElPIGFjY291bnRpbmcgaW4gYmxvY2sgbGF5
ZXIgZnJvbQo+Pj4gbWlsbGktc2Vjb25kcyB0byBuYW5vLXNlY29uZHMgdG8gZ2V0IHRoZSBwcm9w
ZXIgbGF0ZW5jeSB2YWx1ZXMgZm9yIHRoZQo+Pj4gZGV2aWNlcyB3aG9zZSBsYXRlbmN5IGlzIGlu
IG1pY3JvLXNlY29uZHMuIEFmdGVyIGNoYW5naW5nIHRoZSBncmFudWxhcml0eQo+Pj4gdG8gbmFu
by1zZWNvbmRzIHRoZSBpb3N0YXQgY29tbWFuZCwgd2hpY2ggd2FzIHNob3dpbmcgaW5jb3JyZWN0
IHZhbHVlcyBmb3IKPj4+ICV1dGlsLCBpcyBub3cgc2hvd2luZyBjb3JyZWN0IHZhbHVlcy4KPj4K
Pj4gVGhpcyBwYXRjaCBkaWRuJ3QgY29ycmVjdCB0aGUgY291bnRpbmcgb2YgaW9fdGlja3MsIGp1
c3QgbWFrZSB0aGUKPj4gZXJyb3IgYWNjb3VudGluZyBmcm9tIGppZmZpZXMobXMpIHRvIG5zLiBU
aGUgcHJvYmxlbSB0aGF0IHV0aWwgY2FuIGJlCj4+IHNtYWxsZXIgb3IgbGFyZ2VyIHN0aWxsIGV4
aXN0Lgo+IAo+IEFncmVlLgo+IAo+Pgo+PiBIb3dldmVyLCBJIHRoaW5rIHRoaXMgY2hhbmdlIG1h
a2Ugc2Vuc2UgY29uc2lkZXIgdGhhdCBlcnJvciBtYXJnaW4gaXMKPj4gbXVjaCBzbWFsbGVyLCBh
bmQgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQgc2hvdWxkIGJlIG1pbmltdW0uCj4+Cj4+IEhpLCBNaW5n
LCBob3cgZG8geW91IHRoaW5rPwo+IAo+IEkgcmVtZW1iZXJlZCB0aGF0IGt0aW1lX2dldCgpIGhh
cyBub24tbmVnbGlnaWJsZSBvdmVyaGVhZCwgaXMgdGhlcmUgYW55Cj4gdGVzdCBkYXRhKGlvcHMv
Y3B1IHV0aWxpemF0aW9uKSB3aGVuIHJ1bm5pbmcgZmlvIG9yIHQvaW9fdXJpbmcgb24KPiBudWxs
X2JsayB3aXRoIHRoaXMgcGF0Y2g/CgpZZXMsIHRlc3Rpbmcgd2l0aCBudWxsX2JsayBpcyBuZWNl
c3NhcnksIHdlIGRvbid0IHdhbnQgYW55IHBlcmZvcm1hbmNlCnJlZ3Jlc3Npb24uCgpCVFcsIEkg
dGhvdWdodCBpdCdzIGZpbmUgYmVjYXVzZSBpdCdzIGFscmVhZHkgdXNlZCBmb3IgdHJhY2tpbmcg
aW8KbGF0ZW5jeS4KPiAKPiAKPiBUaGFua3MsCj4gTWluZwo+IAo+IAo+IC4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcg
bGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
