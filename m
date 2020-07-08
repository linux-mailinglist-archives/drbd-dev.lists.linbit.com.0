Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4821941D
	for <lists+drbd-dev@lfdr.de>; Thu,  9 Jul 2020 01:14:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2495C4203F1;
	Thu,  9 Jul 2020 01:14:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4CA714203BA
	for <drbd-dev@lists.linbit.com>; Thu,  9 Jul 2020 01:14:31 +0200 (CEST)
Received: by mail-pf1-f175.google.com with SMTP id a14so154529pfi.2
	for <drbd-dev@lists.linbit.com>; Wed, 08 Jul 2020 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qXlCDNHI0ZK15y0LOuAYzGPtynusnw7LtwDb5Yj2OtE=;
	b=cMbzoT4XhkOdRuftJN/OiPsYT9RozDw+GuQh01xrUOP3mEW5tEUjydfcb4W+DKVzne
	TFfUTMUinXgvBqCBfHGgOVgQJzkXgqOGy28APv540LEKujTVtjrvU97kbdrHqETQKtaw
	RxfU1Mj6GTpbQeKCFE4jR13nkdUzsgeldvzxXoT9HJ1fzXpuM/Ep2USaPDxgdcyvZAzd
	/jZjEoDC//LUR2Vf0Zhf0IGE23c90oPClyOfNFgWvDrq1zo1M5Bgvo6f9IqIwZwMBEpc
	Bs9RuI54YBgJOxg3wIrkIpXX8DSkg4acxak06jwvZXv2M3RmK5zy1eWHCosB7prsXkuL
	YrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qXlCDNHI0ZK15y0LOuAYzGPtynusnw7LtwDb5Yj2OtE=;
	b=Roxmtyx8Q7x7fIKFu8MDQ8Z1o77NTa7R9Q0WrPDMrgDXnLjV1rZab++QdzhFfq+wJK
	QB44iaZEteC4W5h1QsUCPj4Ij0hTuwXdy6mWsHCfCBGDbZrwxj283JFIQg+Wr1lSNKPJ
	z1Tk0UjzLUuJTK+Zmdu9IoWQIdMlGFZ9jlJfd0r9yus9+gV8GaSQxYQgAdmJ6Jg9nPFQ
	piFNhTRxRtRNfs41gD83io8cGP81WgvyEh2wk0mPioiteqGxRrLxTuNUzET8Fr4Q5kuh
	VSqp4kzvBGf2hiCVgveVzFe59AggZEr1W3cUo5mv2IB7TARX4CEaMeyEUoG7HarR3d6g
	RJ2w==
X-Gm-Message-State: AOAM531D5FZlwB6+tproY3xhW3sOVq4KJa2r6OtFY4YhSdksNAToBSGB
	39My7Y45offXr4e7RvUNVMNjWg==
X-Google-Smtp-Source: ABdhPJwxXRU58dnJ8SaVTE59SieM0UMi6WQspGfeG513juta/gCc2a5inFjMHD1HHOikaeJsZTW/MA==
X-Received: by 2002:a63:7741:: with SMTP id s62mr50514486pgc.332.1594250070946;
	Wed, 08 Jul 2020 16:14:30 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id
	n137sm721427pfd.194.2020.07.08.16.14.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Jul 2020 16:14:30 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
Date: Wed, 8 Jul 2020 17:14:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
Content-Language: en-US
Cc: linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	linux-btrfs@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove dead bdi congestion leftovers
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

T24gNy8xLzIwIDM6MDYgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IEhpIEplbnMsCj4g
Cj4gd2UgaGF2ZSBhIGxvdCBvZiBiZGkgY29uZ2VzdGlvbiByZWxhdGVkIGNvZGUgdGhhdCBpcyBs
ZWZ0IGFyb3VuZCB3aXRob3V0Cj4gYW55IHVzZS4gIFRoaXMgc2VyaWVzIHJlbW92ZXMgaXQgaW4g
cHJlcGFyYXRpb24gb2Ygc29ydGluZyBvdXQgdGhlIGJkaQo+IGxpZmV0aW1lIHJ1bGVzIHByb3Bl
cmx5LgoKUGxlYXNlIHJ1biBzZXJpZXMgbGlrZSB0aGlzIHRocm91Z2ggYSBmdWxsIGNvbXBpbGF0
aW9uLCBmb3IgYm90aCB0aGlzIG9uZQphbmQgdGhlIHByZXZpb3VzIHNlcmllcyBJIGhhZCB0byBm
aXggdXAgaXNzdWVzIGxpa2UgdGhpczoKCmRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzogSW4g
ZnVuY3Rpb24g4oCYYmNoX2NhY2hlZF9kZXZfcmVxdWVzdF9pbml04oCZOgpkcml2ZXJzL21kL2Jj
YWNoZS9yZXF1ZXN0LmM6MTIzMzoxODogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGfigJkg
Wy1XdW51c2VkLXZhcmlhYmxlXQogMTIzMyB8ICBzdHJ1Y3QgZ2VuZGlzayAqZyA9IGRjLT5kaXNr
LmRpc2s7CiAgICAgIHwgICAgICAgICAgICAgICAgICBeCmRyaXZlcnMvbWQvYmNhY2hlL3JlcXVl
c3QuYzogSW4gZnVuY3Rpb24g4oCYYmNoX2ZsYXNoX2Rldl9yZXF1ZXN0X2luaXTigJk6CmRyaXZl
cnMvbWQvYmNhY2hlL3JlcXVlc3QuYzoxMzIwOjE4OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg
4oCYZ+KAmSBbLVd1bnVzZWQtdmFyaWFibGVdCiAxMzIwIHwgIHN0cnVjdCBnZW5kaXNrICpnID0g
ZC0+ZGlzazsKICAgICAgfCAgICAgICAgICAgICAgICAgIF4KCkRpZCB0aGUgc2FtZSBoZXJlLCBh
cHBsaWVkIGl0LgoKLS0gCkplbnMgQXhib2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5s
aW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQt
ZGV2Cg==
