Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F638D9FA
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 10:10:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6306E420BA1;
	Sun, 23 May 2021 10:10:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E99F420964
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 10:10:36 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621757436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=a6ZAhxnlslJAzzx7sKAzPpcSbekXBLAV3/YPtrS6OLY=;
	b=D1NxWkYmjMQpRiSLlKY8Sja0G/IpCIx6G/gcHzmCMSOHVzwjfIe5W+xcM9lcW/dMxuvn6J
	GX9L8uskVnxXEmhBzlzW/erIxAktXG6bzgw2aEH1RbZTk0dusDk3QXHn4Y/CDQ3r1VNe4S
	ZEYuEFIXysdiuYaC/dwFArCRQpU9tfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621757436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=a6ZAhxnlslJAzzx7sKAzPpcSbekXBLAV3/YPtrS6OLY=;
	b=er1d+U01C9aUpwZ6Y7V+oivz26INFThTuDK5a2cmXuzpBgQNZaStW/8o6Izga5eq8QPu/J
	kmLlzNehZilQrADA==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6FA31AB6D;
	Sun, 23 May 2021 08:10:36 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
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
	<20210521055116.1053587-14-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <de3b0976-1299-17d8-240a-2ecd8b9fbc2d@suse.de>
Date: Sun, 23 May 2021 10:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-14-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 13/26] dm: convert to
	blk_alloc_disk/blk_cleanup_disk
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

T24gNS8yMS8yMSA3OjUxIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBDb252ZXJ0IHRo
ZSBkbSBkcml2ZXIgdG8gdXNlIHRoZSBibGtfYWxsb2NfZGlzayBhbmQgYmxrX2NsZWFudXBfZGlz
awo+IGhlbHBlcnMgdG8gc2ltcGxpZnkgZ2VuZGlzayBhbmQgcmVxdWVzdF9xdWV1ZSBhbGxvY2F0
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
IC0tLQo+ICAgZHJpdmVycy9tZC9kbS5jIHwgMTYgKysrKysrKy0tLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZC9kbS5jIGIvZHJpdmVycy9tZC9kbS5jCj4gaW5kZXggY2EyYWVkZDhlZTdk
Li4zYzdjMmQyNTcwMTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZC9kbS5jCj4gKysrIGIvZHJp
dmVycy9tZC9kbS5jCj4gQEAgLTE4MDEsMTMgKzE4MDEsMTMgQEAgc3RhdGljIHZvaWQgY2xlYW51
cF9tYXBwZWRfZGV2aWNlKHN0cnVjdCBtYXBwZWRfZGV2aWNlICptZCkKPiAgIAkJbWQtPmRpc2st
PnByaXZhdGVfZGF0YSA9IE5VTEw7Cj4gICAJCXNwaW5fdW5sb2NrKCZfbWlub3JfbG9jayk7Cj4g
ICAJCWRlbF9nZW5kaXNrKG1kLT5kaXNrKTsKPiAtCQlwdXRfZGlzayhtZC0+ZGlzayk7Cj4gICAJ
fQo+ICAgCj4gLQlpZiAobWQtPnF1ZXVlKSB7Cj4gKwlpZiAobWQtPnF1ZXVlKQo+ICAgCQlkbV9x
dWV1ZV9kZXN0cm95X2tleXNsb3RfbWFuYWdlcihtZC0+cXVldWUpOwo+IC0JCWJsa19jbGVhbnVw
X3F1ZXVlKG1kLT5xdWV1ZSk7Cj4gLQl9Cj4gKwo+ICsJaWYgKG1kLT5kaXNrKQo+ICsJCWJsa19j
bGVhbnVwX2Rpc2sobWQtPmRpc2spOwo+ICAgCj4gICAJY2xlYW51cF9zcmN1X3N0cnVjdCgmbWQt
PmlvX2JhcnJpZXIpOwo+ICAgCgpDYW4ndCB0aGVzZSBjb25kaXRpb25hbHMgYmUgbWVyZ2VkIGlu
dG8gYSBzaW5nbGUgJ2lmIChtZC0+ZGlzayknPwpFZyBsaWtlOgoKCWlmIChtZC0+ZGlzaykgewoJ
CXNwaW5fbG9jaygmX21pbm9yX2xvY2spOwoJCW1kLT5kaXNrLT5wcml2YXRlX2RhdGEgPSBOVUxM
OwoJCXNwaW5fdW5sb2NrKCZfbWlub3JfbG9jayk7CgkJZGVsX2dlbmRpc2sobWQtPmRpc2spOwoJ
CWRtX3F1ZXVlX2Rlc3Ryb3lfa2V5c2xvdF9tYW5hZ2VyKG1kLT5xdWV1ZSk7CgkJYmxrX2NsZWFu
dXBfZGlzayhtZC0+cXVldWUpOwoJfQoKV2UncmUgbm93IGFsd2F5cyBhbGxvY2F0aW5nICdtZC0+
ZGlzaycgYW5kICdtZC0+cXVldWUnIHRvZ2V0aGVyLApzbyBob3cgY2FuIHdlIGVuZCB1cCBpbiBh
IHNpdHVhdGlvbiB3aGVyZSBvbmUgaXMgc2V0IHdpdGhvdXQgdGhlIG90aGVyPwoKPiBAQCAtMTg2
OSwxMyArMTg2OSwxMCBAQCBzdGF0aWMgc3RydWN0IG1hcHBlZF9kZXZpY2UgKmFsbG9jX2Rldihp
bnQgbWlub3IpCj4gICAJICogZXN0YWJsaXNoZWQuIElmIHJlcXVlc3QtYmFzZWQgdGFibGUgaXMg
bG9hZGVkOiBibGstbXEgd2lsbAo+ICAgCSAqIG92ZXJyaWRlIGFjY29yZGluZ2x5Lgo+ICAgCSAq
Lwo+IC0JbWQtPnF1ZXVlID0gYmxrX2FsbG9jX3F1ZXVlKG51bWFfbm9kZV9pZCk7Cj4gLQlpZiAo
IW1kLT5xdWV1ZSkKPiAtCQlnb3RvIGJhZDsKPiAtCj4gLQltZC0+ZGlzayA9IGFsbG9jX2Rpc2tf
bm9kZSgxLCBtZC0+bnVtYV9ub2RlX2lkKTsKPiArCW1kLT5kaXNrID0gYmxrX2FsbG9jX2Rpc2so
bWQtPm51bWFfbm9kZV9pZCk7Cj4gICAJaWYgKCFtZC0+ZGlzaykKPiAgIAkJZ290byBiYWQ7Cj4g
KwltZC0+cXVldWUgPSBtZC0+ZGlzay0+cXVldWU7Cj4gICAKPiAgIAlpbml0X3dhaXRxdWV1ZV9o
ZWFkKCZtZC0+d2FpdCk7Cj4gICAJSU5JVF9XT1JLKCZtZC0+d29yaywgZG1fd3Ffd29yayk7Cj4g
QEAgLTE4ODgsNiArMTg4NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbWFwcGVkX2RldmljZSAqYWxsb2Nf
ZGV2KGludCBtaW5vcikKPiAgIAo+ICAgCW1kLT5kaXNrLT5tYWpvciA9IF9tYWpvcjsKPiAgIAlt
ZC0+ZGlzay0+Zmlyc3RfbWlub3IgPSBtaW5vcjsKPiArCW1kLT5kaXNrLT5taW5vcnMgPSAxOwo+
ICAgCW1kLT5kaXNrLT5mb3BzID0gJmRtX2Jsa19kb3BzOwo+ICAgCW1kLT5kaXNrLT5xdWV1ZSA9
IG1kLT5xdWV1ZTsKPiAgIAltZC0+ZGlzay0+cHJpdmF0ZV9kYXRhID0gbWQ7Cj4gCkNoZWVycywK
Ckhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3Rv
cmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0
c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMu
bGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJk
LWRldgo=
