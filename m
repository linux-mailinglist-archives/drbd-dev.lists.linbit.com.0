Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8238D9F2
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 10:05:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFE8F420935;
	Sun, 23 May 2021 10:05:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B3CCE420935
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 10:04:59 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621757099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=r0CnFan1k07OcfnvGuqY1FMssFuQj0eT2+mYEtmGNso=;
	b=Md1LP0e76M+djeruCjtVt3UuzZhAa3Lnixb+7+UHtJP72BalQHXVAJ5VjykbXfodwHAuVF
	jTr9oEIWges7dv36vwyjT8czWx2QThNilsZlmBTQvF69oHauSSrayfRRbinf6Yt3WYXiPH
	NtcPnw5ZQkHYs1fZq4qVjB2GCUuSCcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621757099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=r0CnFan1k07OcfnvGuqY1FMssFuQj0eT2+mYEtmGNso=;
	b=UxMYevwyVO2hLzjr67gtOpS11dsaz1CMnntZMGC2dux9ybwxUJfsseIEBF31dgYoBgLUJS
	FkRxPC91JsntrVBw==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6389EAB6D;
	Sun, 23 May 2021 08:04:59 +0000 (UTC)
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
	<20210521055116.1053587-13-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <da21fbea-7711-3fa8-9281-76a016cec258@suse.de>
Date: Sun, 23 May 2021 10:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-13-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 12/26] bcache: convert to
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
ZSBiY2FjaGUgZHJpdmVyIHRvIHVzZSB0aGUgYmxrX2FsbG9jX2Rpc2sgYW5kIGJsa19jbGVhbnVw
X2Rpc2sKPiBoZWxwZXJzIHRvIHNpbXBsaWZ5IGdlbmRpc2sgYW5kIHJlcXVlc3RfcXVldWUgYWxs
b2NhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiAgIGRyaXZlcnMvbWQvYmNhY2hlL3N1cGVyLmMgfCAxNSArKysrLS0tLS0tLS0t
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpI
YW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3Jh
Z2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0
OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1k
ZXYK
