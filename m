Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FFF2FCB57
	for <lists+drbd-dev@lfdr.de>; Wed, 20 Jan 2021 08:15:16 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D6A04207B1;
	Wed, 20 Jan 2021 08:15:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1201 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jan 2021 15:13:33 CET
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 34BA042053E
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 15:13:33 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611064351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iHKhjDkg2elRSLCRxcs3JrLM+Cwcg+VKeqaH+Rb+H6c=;
	b=rDTgZ7xM0AN8Ucse2v7mBg8l0Jc0DJBU5I16P+0kPu6Ll3d1MYjww4/OSPhb827NAQfP3a
	AICZcyHBf6nEypATvwx9kRZbFb+EuDroiPciU7vbGZXpZWf5BQXuaB+OroVtJXg0PBeUIO
	NBdb1UgiuuGaVIXgCdiitPnNeC32Gk4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5E644B247;
	Tue, 19 Jan 2021 13:52:31 +0000 (UTC)
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
	<20210119050631.57073-5-chaitanya.kulkarni@wdc.com>
From: Nikolay Borisov <nborisov@suse.com>
Autocrypt: addr=nborisov@suse.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <89feb998-8c60-dbae-92a6-15a9ad4fd594@suse.com>
Date: Tue, 19 Jan 2021 15:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119050631.57073-5-chaitanya.kulkarni@wdc.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 20 Jan 2021 08:15:15 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, darrick.wong@oracle.com,
	osandov@fb.com, kent.overstreet@gmail.com, josef@toxicpanda.com,
	efremov@linux.com, colyli@suse.de, tj@kernel.org,
	viro@zeniv.linux.org.uk, dsterba@suse.com, bvanassche@acm.org,
	agruenba@redhat.com, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com, song@kernel.org,
	philipp.reisner@linbit.com, jefflexu@linux.alibaba.com,
	rpeterso@redhat.com, lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com
Subject: Re: [Drbd-dev] [RFC PATCH 04/37] btrfs: use bio_init_fields in
	volumes
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

CgpPbiAxOS4wMS4yMSDQsy4gNzowNSDRhy4sIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBT
aWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGNoYWl0YW55YS5rdWxrYXJuaUB3ZGMu
Y29tPgo+IC0tLQo+ICBmcy9idHJmcy92b2x1bWVzLmMgfCA0ICstLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9i
dHJmcy92b2x1bWVzLmMgYi9mcy9idHJmcy92b2x1bWVzLmMKPiBpbmRleCBlZTA4NmZjNTZjMzAu
LjgzNjE2NzIxMjI1MiAxMDA2NDQKPiAtLS0gYS9mcy9idHJmcy92b2x1bWVzLmMKPiArKysgYi9m
cy9idHJmcy92b2x1bWVzLmMKPiBAQCAtNjM3MSwxNCArNjM3MSwxMiBAQCBzdGF0aWMgdm9pZCBz
dWJtaXRfc3RyaXBlX2JpbyhzdHJ1Y3QgYnRyZnNfYmlvICpiYmlvLCBzdHJ1Y3QgYmlvICpiaW8s
Cj4gIAo+ICAJYmlvLT5iaV9wcml2YXRlID0gYmJpbzsKVGhpcyBsaW5lIGNhbiBiZSByZW1vdmVk
IGFzIC0+cHJpdmF0ZSBpcyBpbml0aWFsaXplZCBieSBiaW9faW5pdF9maWVsZHMuCgo+ICAJYnRy
ZnNfaW9fYmlvKGJpbyktPmRldmljZSA9IGRldjsKPiAtCWJpby0+YmlfZW5kX2lvID0gYnRyZnNf
ZW5kX2JpbzsKPiAtCWJpby0+YmlfaXRlci5iaV9zZWN0b3IgPSBwaHlzaWNhbCA+PiA5Owo+ICsJ
YmlvX2luaXRfZmllbGRzKGJpbywgZGV2LT5iZGV2LCBwaHlzaWNhbCA+PiA5LCBiYmlvLCBidHJm
c19lbmRfYmlvLCAwLCAwKTsKPiAgCWJ0cmZzX2RlYnVnX2luX3JjdShmc19pbmZvLAo+ICAJImJ0
cmZzX21hcF9iaW86IHJ3ICVkIDB4JXgsIHNlY3Rvcj0lbGx1LCBkZXY9JWx1ICglcyBpZCAlbGx1
KSwgc2l6ZT0ldSIsCj4gIAkJYmlvX29wKGJpbyksIGJpby0+Ymlfb3BmLCBiaW8tPmJpX2l0ZXIu
Ymlfc2VjdG9yLAo+ICAJCSh1bnNpZ25lZCBsb25nKWRldi0+YmRldi0+YmRfZGV2LCByY3Vfc3Ry
X2RlcmVmKGRldi0+bmFtZSksCj4gIAkJZGV2LT5kZXZpZCwgYmlvLT5iaV9pdGVyLmJpX3NpemUp
Owo+IC0JYmlvX3NldF9kZXYoYmlvLCBkZXYtPmJkZXYpOwo+ICAKPiAgCWJ0cmZzX2Jpb19jb3Vu
dGVyX2luY19ub2Jsb2NrZWQoZnNfaW5mbyk7Cj4gIAo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZA
bGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kcmJkLWRldgo=
