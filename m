Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1638D9E9
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 10:04:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E98CE420A73;
	Sun, 23 May 2021 10:04:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61BDD420935
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 10:03:37 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621756222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=rtcf9ZiJF1IicCei97k4vd7l0YRihd30WBKbwux84M4=;
	b=sDbup0LhTBVHGpz4adi/u9XdLzA13ekDEdXgxK9JTz65LsDQGYPd4xWjRqYkioRnOW/TOG
	y0y4tfuPJpajRbISMilITQkj9VMNY6CsP+Zp+46w/KM4N8qcPDSfKAfcwYgu3mpQLZYAFs
	0/Bgldk/F4i87UepxqbODGRCcEF4CaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621756222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=rtcf9ZiJF1IicCei97k4vd7l0YRihd30WBKbwux84M4=;
	b=kOlysilQUJZsrmpkQr7FjCNiP2AQ2cbGvZ04UUaccOBxYXhvwxwj2ZazA3svipGin3vDRL
	r6fw5krBLS5sGYDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D9C31AC86;
	Sun, 23 May 2021 07:50:21 +0000 (UTC)
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
	<20210521055116.1053587-4-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e437ca9e-b4e7-b50d-8cbc-e5304c1cab50@suse.de>
Date: Sun, 23 May 2021 09:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-4-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 03/26] block: automatically enable
	GENHD_FL_EXT_DEVT
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

T24gNS8yMS8yMSA3OjUwIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBBdXRvbWF0aWNh
bGx5IHNldCB0aGUgR0VOSERfRkxfRVhUX0RFVlQgZmxhZyBmb3IgYWxsIGRpc2tzIGFsbG9jYXRl
ZAo+IHdpdGhvdXQgYW4gZXhwbGljaXQgbnVtYmVyIG9mIG1pbm9ycy4gIFRoaXMgaXMgd2hhdCBh
bGwgbmV3IGJsb2NrCj4gZHJpdmVycyBzaG91bGQgZG8sIHNvIG1ha2Ugc3VyZSBpdCBpcyB0aGUg
ZGVmYXVsdCB3aXRob3V0IGJvaWxlcnBsYXRlCj4gY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgIGJsb2NrL2dlbmhkLmMgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQo+ICAgYmxvY2svcGFydGl0aW9ucy9jb3JlLmMgICAgICAg
ICAgfCA0IC0tLS0KPiAgIGRyaXZlcnMvYmxvY2svbjY0Y2FydC5jICAgICAgICAgIHwgMiArLQo+
ICAgZHJpdmVycy9saWdodG52bS9jb3JlLmMgICAgICAgICAgfCAxIC0KPiAgIGRyaXZlcnMvbWVt
c3RpY2svY29yZS9tc19ibG9jay5jIHwgMSAtCj4gICBkcml2ZXJzL252ZGltbS9ibGsuYyAgICAg
ICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9udmRpbW0vYnR0LmMgICAgICAgICAgICAgfCAxIC0K
PiAgIGRyaXZlcnMvbnZkaW1tL3BtZW0uYyAgICAgICAgICAgIHwgMSAtCj4gICBkcml2ZXJzL252
bWUvaG9zdC9jb3JlLmMgICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9udm1lL2hvc3QvbXVsdGlw
YXRoLmMgICAgfCAxIC0KPiAgIDEwIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5k
ZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAg
ICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21i
SCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJn
KSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJi
ZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kcmJkLWRldgo=
