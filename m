Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A68F38D99A
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 09:54:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 011F342062F;
	Sun, 23 May 2021 09:54:09 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 482 seconds by postgrey-1.31 at mail19;
	Sun, 23 May 2021 09:54:06 CEST
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9D595420620
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 09:54:06 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621756446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=R/MSb7WB4yg0xY//iJ4g4o9OrazLUgapaBmCSPU09/w=;
	b=FC/3WRGmbKLV9khHIpTe9yyXvRUN7xxss53zAKWt+qPq7bC39y/+TOpVowgKFbkdqtgN39
	wIZQxHHjp89jEnloHEengHgD8PZOwsgYN9EAyuhMu7q7ZSb7lghFKiZG3iD2USft6npSCy
	eNVry1lTEz7fFddLBqOGiCa8FzH8fGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621756446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=R/MSb7WB4yg0xY//iJ4g4o9OrazLUgapaBmCSPU09/w=;
	b=uBPd4XPXbURZPUEYY7Ti50Vf8xHvPCvMBcQoB+74ddrgR7/RrWEsplxLKlp80m4Ht7bEh7
	40Kbf475wc2SC2DA==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 31E2BAB6D;
	Sun, 23 May 2021 07:54:06 +0000 (UTC)
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
	<20210521055116.1053587-5-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <4526cf9d-1735-9517-c5c6-1d851d15d0ab@suse.de>
Date: Sun, 23 May 2021 09:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-5-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 04/26] block: add a flag to make put_disk on
 partially initalized disks safer
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

T24gNS8yMS8yMSA3OjUwIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBBZGQgYSBmbGFn
IHRvIGluZGljYXRlIHRoYXQgX19kZXZpY2VfYWRkX2Rpc2sgZGlkIGdyYWIgYSBxdWV1ZSByZWZl
cmVuY2UKPiBzbyB0aGF0IGRpc2tfcmVsZWFzZSBvbmx5IGRyb3BzIGl0IGlmIHdlIGFjdHVhbGx5
IGhhZCBpdC4gIFRoaXMgc29ydAo+IG91dCBvbmUgb2YgdGhlIG1ham9yIHBpdGZhbHMgd2l0aCBw
YXJ0aWFsbHkgaW5pdGlhbGl6ZWQgZ2VuZGlzayB0aGF0CiAgICAgICAgICAgICAgICAgICAgICAg
IHBpdGZhbGxzCgo+IGEgbG90IG9mIGRyaXZlcnMgZGlkIGdldCB3cm9uZyBvciBzdGlsbCBkby4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0K
PiAgIGJsb2NrL2dlbmhkLmMgICAgICAgICB8IDcgKysrKystLQo+ICAgaW5jbHVkZS9saW51eC9n
ZW5oZC5oIHwgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoK
Q2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtl
cm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBH
ZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRl
dkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RyYmQtZGV2Cg==
