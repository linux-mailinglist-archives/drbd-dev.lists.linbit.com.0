Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D3398645461
	for <lists+drbd-dev@lfdr.de>; Wed,  7 Dec 2022 08:08:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CCFA4252DC;
	Wed,  7 Dec 2022 08:07:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 416 seconds by postgrey-1.31 at mail19;
	Wed, 07 Dec 2022 04:23:07 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B43942177D
	for <drbd-dev@lists.linbit.com>; Wed,  7 Dec 2022 04:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670383386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=faTdYvtAe2NMddrehpXs2XQgPcQu3OATzJcZ1A/nsDA=;
	b=EXLVQqKkJBW2V+VfW0ZMFvhu4l2xDJZoPW/kTkfTh/SB2IXV7ksIVWksymQ34+/oG2jwgj
	IO4W8cmoNlqmaEUl3rm3V7JEd7H70+ldjuPtSJ83ulQdY/m9hNxebTQY6cN/Zxd4532KCs
	IA0aQ/E4stefT1exsHv6nCW8Et5bHMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
	[66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-52-qPbK1vmPPgSMR5tC6UfxoA-1; Tue, 06 Dec 2022 22:16:07 -0500
X-MC-Unique: qPbK1vmPPgSMR5tC6UfxoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3F5C811E67;
	Wed,  7 Dec 2022 03:16:05 +0000 (UTC)
Received: from T590 (ovpn-8-16.pek2.redhat.com [10.72.8.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A29517AE5;
	Wed,  7 Dec 2022 03:15:49 +0000 (UTC)
Date: Wed, 7 Dec 2022 11:15:43 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <Y5AFX4sxLRLV4uSt@T590>
References: <20221206181536.13333-1-gulam.mohamed@oracle.com>
	<936a498b-19fe-36d5-ff32-817f153e57e3@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <936a498b-19fe-36d5-ff32-817f153e57e3@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:07:57 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gV2VkLCBEZWMgMDcsIDIwMjIgYXQgMTA6MTk6MDhBTSArMDgwMCwgWXUgS3VhaSB3cm90ZToK
PiBIaSwKPiAKPiDlnKggMjAyMi8xMi8wNyAyOjE1LCBHdWxhbSBNb2hhbWVkIOWGmemBkzoKPiA+
IFVzZSBrdGltZSB0byBjaGFuZ2UgdGhlIGdyYW51bGFyaXR5IG9mIElPIGFjY291bnRpbmcgaW4g
YmxvY2sgbGF5ZXIgZnJvbQo+ID4gbWlsbGktc2Vjb25kcyB0byBuYW5vLXNlY29uZHMgdG8gZ2V0
IHRoZSBwcm9wZXIgbGF0ZW5jeSB2YWx1ZXMgZm9yIHRoZQo+ID4gZGV2aWNlcyB3aG9zZSBsYXRl
bmN5IGlzIGluIG1pY3JvLXNlY29uZHMuIEFmdGVyIGNoYW5naW5nIHRoZSBncmFudWxhcml0eQo+
ID4gdG8gbmFuby1zZWNvbmRzIHRoZSBpb3N0YXQgY29tbWFuZCwgd2hpY2ggd2FzIHNob3dpbmcg
aW5jb3JyZWN0IHZhbHVlcyBmb3IKPiA+ICV1dGlsLCBpcyBub3cgc2hvd2luZyBjb3JyZWN0IHZh
bHVlcy4KPiAKPiBUaGlzIHBhdGNoIGRpZG4ndCBjb3JyZWN0IHRoZSBjb3VudGluZyBvZiBpb190
aWNrcywganVzdCBtYWtlIHRoZQo+IGVycm9yIGFjY291bnRpbmcgZnJvbSBqaWZmaWVzKG1zKSB0
byBucy4gVGhlIHByb2JsZW0gdGhhdCB1dGlsIGNhbiBiZQo+IHNtYWxsZXIgb3IgbGFyZ2VyIHN0
aWxsIGV4aXN0LgoKQWdyZWUuCgo+IAo+IEhvd2V2ZXIsIEkgdGhpbmsgdGhpcyBjaGFuZ2UgbWFr
ZSBzZW5zZSBjb25zaWRlciB0aGF0IGVycm9yIG1hcmdpbiBpcwo+IG11Y2ggc21hbGxlciwgYW5k
IHBlcmZvcm1hbmNlIG92ZXJoZWFkIHNob3VsZCBiZSBtaW5pbXVtLgo+IAo+IEhpLCBNaW5nLCBo
b3cgZG8geW91IHRoaW5rPwoKSSByZW1lbWJlcmVkIHRoYXQga3RpbWVfZ2V0KCkgaGFzIG5vbi1u
ZWdsaWdpYmxlIG92ZXJoZWFkLCBpcyB0aGVyZSBhbnkKdGVzdCBkYXRhKGlvcHMvY3B1IHV0aWxp
emF0aW9uKSB3aGVuIHJ1bm5pbmcgZmlvIG9yIHQvaW9fdXJpbmcgb24KbnVsbF9ibGsgd2l0aCB0
aGlzIHBhdGNoPwoKClRoYW5rcywgCk1pbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5s
aW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQt
ZGV2Cg==
