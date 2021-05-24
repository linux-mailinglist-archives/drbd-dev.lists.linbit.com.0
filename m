Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A538E241
	for <lists+drbd-dev@lfdr.de>; Mon, 24 May 2021 10:27:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0BA6A420949;
	Mon, 24 May 2021 10:27:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 806A2420637
	for <drbd-dev@lists.linbit.com>; Mon, 24 May 2021 10:27:18 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621844838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Q1F35rBDncf+ODcVO5jTKQ+c6J+Bpaijj4tb+WLiO1U=;
	b=hWbnJCzrn8D8sq7QiamSboM/nv6TN+2iWleusnloao35oVE4OyeDX0eKAMzya8OGGThQFh
	zl1nxRchNuFxstuajSgFtmryku8O1hRGBIRcM0SbrM2Dt3hLAz/KodIIf9vgrdWDs21AJk
	09tFtAADDGOyfSpK1oh2IZudvgHfbuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621844838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Q1F35rBDncf+ODcVO5jTKQ+c6J+Bpaijj4tb+WLiO1U=;
	b=/Ey/RBTrd/apAViE3Xd9DP0Lfre1LBpPPlJZl5IzG70TmMypTfoLUolyItvUQoIO9R6YkJ
	B6psOuCyZCUW50Cw==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CBD6EAB6D;
	Mon, 24 May 2021 08:27:17 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
	<20210521055116.1053587-15-hch@lst.de>
	<e65de9e6-337c-3e41-b5c2-d033ff236582@suse.de>
	<20210524072642.GF23890@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1360c598-44a9-e0c5-dd81-695cb1ec8ccf@suse.de>
Date: Mon, 24 May 2021 10:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210524072642.GF23890@lst.de>
Content-Language: en-US
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matias Bjorling <mb@lightnvm.io>, Nitin Gupta <ngupta@vflare.org>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
	Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	linux-raid@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	Jim Paris <jim@jtan.com>, Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
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

T24gNS8yNC8yMSA5OjI2IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBTdW4sIE1h
eSAyMywgMjAyMSBhdCAxMDoxMjo0OUFNICswMjAwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+
PiArCWJsa19zZXRfc3RhY2tpbmdfbGltaXRzKCZtZGRldi0+cXVldWUtPmxpbWl0cyk7Cj4+PiAg
ICAJYmxrX3F1ZXVlX3dyaXRlX2NhY2hlKG1kZGV2LT5xdWV1ZSwgdHJ1ZSwgdHJ1ZSk7Cj4+PiAg
ICAJLyogQWxsb3cgZXh0ZW5kZWQgcGFydGl0aW9ucy4gIFRoaXMgbWFrZXMgdGhlCj4+PiAgICAJ
ICogJ21kcCcgZGV2aWNlIHJlZHVuZGFudCwgYnV0IHdlIGNhbid0IHJlYWxseQo+Pj4KPj4gV291
bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBpbnRyb2R1Y2UgYSBoZWxwZXIgJ2Jsa19xdWV1ZV9mcm9t
X2Rpc2soKScgb3IKPj4gc29tZXN1Y2ggdG8gYXZvaWQgaGF2aW5nIHRvIGtlZXAgYW4gZXhwbGlj
aXQgJ3F1ZXVlJyBwb2ludGVyPwo+IAo+IE15IHJvdWdodCBwbGFuIGlzIHRoYXQgYSBmZXcgc2Vy
aWVzIGZyb20gbm93IGJpbyBiYXNlZCBkcml2ZXJzIHdpbGwKPiBuZXZlciBkaXJlY3RseSBkZWFs
IHdpdGggdGhlIHJlcXVlc3RfcXVldWUgYXQgYWxsLgo+IApHbyBmb3IgaXQuCgpSZXZpZXdlZC1i
eTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRy
LiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0
CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMg
Njg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0
cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
