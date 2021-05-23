Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C438DA00
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 10:12:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F1F41420BA8;
	Sun, 23 May 2021 10:12:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4EF5420BA8
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 10:12:51 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621757571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=+QPb9JWvY5Mv2CQaqhfS/CQ9rp49Qt1b0dGLtKqWAHI=;
	b=bmLKYtBm8+NBy0rlZh5vgGqGnuUZQLXD5BUZHEsC9KLWeRov/Kd6myZf3F/3Hji8xMjQ4e
	XjNGXj+P/iVCSJDfUijcHK/6GnQs8Q24V+00sjOXcvV369Y7JMbEdHVZbnUo2wP5SwFvtR
	NE9Ud+kiuo+RtjyO7YO79/Vtotp8i1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621757571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=+QPb9JWvY5Mv2CQaqhfS/CQ9rp49Qt1b0dGLtKqWAHI=;
	b=TpSTAzMPXkVgQoDLdk+dThL13YkgxTUpmMsPvWCAi0674zr0yAyJez4vAZgVjbOQTqHQTY
	aFmfGWmflFT7I3Ag==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 009B9AC3A;
	Sun, 23 May 2021 08:12:51 +0000 (UTC)
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
	<20210521055116.1053587-15-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e65de9e6-337c-3e41-b5c2-d033ff236582@suse.de>
Date: Sun, 23 May 2021 10:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-15-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 14/26] md: convert to
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
ZSBtZCBkcml2ZXIgdG8gdXNlIHRoZSBibGtfYWxsb2NfZGlzayBhbmQgYmxrX2NsZWFudXBfZGlz
awo+IGhlbHBlcnMgdG8gc2ltcGxpZnkgZ2VuZGlzayBhbmQgcmVxdWVzdF9xdWV1ZSBhbGxvY2F0
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
IC0tLQo+ICAgZHJpdmVycy9tZC9tZC5jIHwgMjUgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvbWQuYyBiL2RyaXZlcnMvbWQvbWQuYwo+IGluZGV4IDQ5
Zjg5N2ZiYjg5Yi4uZDgwNmJlOGNjMjEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWQvbWQuYwo+
ICsrKyBiL2RyaXZlcnMvbWQvbWQuYwo+IEBAIC01NTk4LDEyICs1NTk4LDEwIEBAIHN0YXRpYyB2
b2lkIG1kX2ZyZWUoc3RydWN0IGtvYmplY3QgKmtvKQo+ICAgCWlmIChtZGRldi0+c3lzZnNfbGV2
ZWwpCj4gICAJCXN5c2ZzX3B1dChtZGRldi0+c3lzZnNfbGV2ZWwpOwo+ICAgCj4gLQlpZiAobWRk
ZXYtPmdlbmRpc2spCj4gKwlpZiAobWRkZXYtPmdlbmRpc2spIHsKPiAgIAkJZGVsX2dlbmRpc2so
bWRkZXYtPmdlbmRpc2spOwo+IC0JaWYgKG1kZGV2LT5xdWV1ZSkKPiAtCQlibGtfY2xlYW51cF9x
dWV1ZShtZGRldi0+cXVldWUpOwo+IC0JaWYgKG1kZGV2LT5nZW5kaXNrKQo+IC0JCXB1dF9kaXNr
KG1kZGV2LT5nZW5kaXNrKTsKPiArCQlibGtfY2xlYW51cF9kaXNrKG1kZGV2LT5nZW5kaXNrKTsK
PiArCX0KPiAgIAlwZXJjcHVfcmVmX2V4aXQoJm1kZGV2LT53cml0ZXNfcGVuZGluZyk7Cj4gICAK
PiAgIAliaW9zZXRfZXhpdCgmbWRkZXYtPmJpb19zZXQpOwo+IEBAIC01NzExLDIwICs1NzA5LDEz
IEBAIHN0YXRpYyBpbnQgbWRfYWxsb2MoZGV2X3QgZGV2LCBjaGFyICpuYW1lKQo+ICAgCQlnb3Rv
IGFib3J0Owo+ICAgCj4gICAJZXJyb3IgPSAtRU5PTUVNOwo+IC0JbWRkZXYtPnF1ZXVlID0gYmxr
X2FsbG9jX3F1ZXVlKE5VTUFfTk9fTk9ERSk7Cj4gLQlpZiAoIW1kZGV2LT5xdWV1ZSkKPiArCWRp
c2sgPSBibGtfYWxsb2NfZGlzayhOVU1BX05PX05PREUpOwo+ICsJaWYgKCFkaXNrKQo+ICAgCQln
b3RvIGFib3J0Owo+ICAgCj4gLQlibGtfc2V0X3N0YWNraW5nX2xpbWl0cygmbWRkZXYtPnF1ZXVl
LT5saW1pdHMpOwo+IC0KPiAtCWRpc2sgPSBhbGxvY19kaXNrKDEgPDwgc2hpZnQpOwo+IC0JaWYg
KCFkaXNrKSB7Cj4gLQkJYmxrX2NsZWFudXBfcXVldWUobWRkZXYtPnF1ZXVlKTsKPiAtCQltZGRl
di0+cXVldWUgPSBOVUxMOwo+IC0JCWdvdG8gYWJvcnQ7Cj4gLQl9Cj4gICAJZGlzay0+bWFqb3Ig
PSBNQUpPUihtZGRldi0+dW5pdCk7Cj4gICAJZGlzay0+Zmlyc3RfbWlub3IgPSB1bml0IDw8IHNo
aWZ0Owo+ICsJZGlzay0+bWlub3JzID0gMSA8PCBzaGlmdDsKPiAgIAlpZiAobmFtZSkKPiAgIAkJ
c3RyY3B5KGRpc2stPmRpc2tfbmFtZSwgbmFtZSk7Cj4gICAJZWxzZSBpZiAocGFydGl0aW9uZWQp
Cj4gQEAgLTU3MzMsNyArNTcyNCw5IEBAIHN0YXRpYyBpbnQgbWRfYWxsb2MoZGV2X3QgZGV2LCBj
aGFyICpuYW1lKQo+ICAgCQlzcHJpbnRmKGRpc2stPmRpc2tfbmFtZSwgIm1kJWQiLCB1bml0KTsK
PiAgIAlkaXNrLT5mb3BzID0gJm1kX2ZvcHM7Cj4gICAJZGlzay0+cHJpdmF0ZV9kYXRhID0gbWRk
ZXY7Cj4gLQlkaXNrLT5xdWV1ZSA9IG1kZGV2LT5xdWV1ZTsKPiArCj4gKwltZGRldi0+cXVldWUg
PSBkaXNrLT5xdWV1ZTsKPiArCWJsa19zZXRfc3RhY2tpbmdfbGltaXRzKCZtZGRldi0+cXVldWUt
PmxpbWl0cyk7Cj4gICAJYmxrX3F1ZXVlX3dyaXRlX2NhY2hlKG1kZGV2LT5xdWV1ZSwgdHJ1ZSwg
dHJ1ZSk7Cj4gICAJLyogQWxsb3cgZXh0ZW5kZWQgcGFydGl0aW9ucy4gIFRoaXMgbWFrZXMgdGhl
Cj4gICAJICogJ21kcCcgZGV2aWNlIHJlZHVuZGFudCwgYnV0IHdlIGNhbid0IHJlYWxseQo+IApX
b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGludHJvZHVjZSBhIGhlbHBlciAnYmxrX3F1ZXVlX2Zy
b21fZGlzaygpJyBvciAKc29tZXN1Y2ggdG8gYXZvaWQgaGF2aW5nIHRvIGtlZXAgYW4gZXhwbGlj
aXQgJ3F1ZXVlJyBwb2ludGVyPwoKCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWlu
ZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAz
NjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRl
diBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxp
bmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
