Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075B38D9EE
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 10:05:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4DA7F420956;
	Sun, 23 May 2021 10:05:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 783AB42095F
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 10:03:37 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621755963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=qgeGl97uX/ASq/b1LiyPvGm5KNHhtUs0K8R0hHcKHNc=;
	b=loXc3McbnIlaTeOmap5xh/BtT1gA18JtYlPnnRT16wqHGfTJ19lzfYOvtfB0oOgoXJJBVk
	/ReVtyQfx/H7rkQyR4p+DdQCpRAZIyorp+zG3qS0QxK3kt3astNHDmaxUpril0ODq2rDNt
	r9Vkt/28bb7h7z+3O1fywe0kQCnoBFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621755963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=qgeGl97uX/ASq/b1LiyPvGm5KNHhtUs0K8R0hHcKHNc=;
	b=ColirDJTDltQ04gjJ+NwT5obDqeCRv1j+ud81TmJU8SNYoFAHUoSAb2/6qAn8/xG4ncH3n
	i/HOh7UwzHlRZeDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AF152AB5F;
	Sun, 23 May 2021 07:46:03 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, 
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210521055116.1053587-1-hch@lst.de>
	<20210521055116.1053587-2-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <d55cba32-b114-513b-09d9-40c289fa95c3@suse.de>
Date: Sun, 23 May 2021 09:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-2-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/26] block: refactor device number setup in
 __device_add_disk
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

T24gNS8yMS8yMSA3OjUwIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBVbnRhbmdsZSB0
aGUgbWVzcyBhcm91bmQgYmxrX2FsbG9jX2RldnQgYnkgbW92aW5nIHRoZSBjaGVjayBmb3IKPiB0
aGUgdXNlZCBhbGxvY2F0aW9uIHNjaGVtZSBpbnRvIHRoZSBjYWxsZXJzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAgYmxvY2svYmxr
LmggICAgICAgICAgICAgfCAgNCArLQo+ICAgYmxvY2svZ2VuaGQuYyAgICAgICAgICAgfCA5NiAr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgYmxvY2svcGFydGl0
aW9ucy9jb3JlLmMgfCAxNSArKysrKy0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlv
bnMoKyksIDY2IGRlbGV0aW9ucygtKQo+IAouLi4gYW5kIGFsc28gZml4ZXMgYW4gaXNzdWUgd2l0
aCBHRU5IRF9GTF9VUCByZW1haW5lZCBzZXQgaW4gYW4gZXJyb3IgCnBhdGggaW4gX19kZXZpY2Vf
YWRkX2Rpc2soKS4KClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4K
CkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBL
ZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwg
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwg
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1k
ZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kcmJkLWRldgo=
