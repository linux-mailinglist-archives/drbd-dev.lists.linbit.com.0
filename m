Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F321A191
	for <lists+drbd-dev@lfdr.de>; Thu,  9 Jul 2020 15:59:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 030094203F7;
	Thu,  9 Jul 2020 15:59:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E3614203E7
	for <drbd-dev@lists.linbit.com>; Thu,  9 Jul 2020 15:59:00 +0200 (CEST)
Received: by mail-io1-f65.google.com with SMTP id y2so2411787ioy.3
	for <drbd-dev@lists.linbit.com>; Thu, 09 Jul 2020 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ttUciq1R4DLXwSrCKOG8sMg2/ZhVL4qipuIgKqQy2hE=;
	b=coM9AtJu0ST+XR8OMgywQuHtTrKC9/b3RSDkB5xLiy4QzbX3T0Aw61rbH1CahgBBuR
	uHGxD5IVaENFxujEI50kNZMa4M546fERlVcPXVLx0073TNTIByYun/g+RHhX1WEDPk90
	nLVTJFCuIlptJdGLVxMiS/3WV+WEeYk/uPnJy7GYNSE5TcqY5Sk+XRfP9o7wxQhjTuBd
	OfxdrSK1xj7iSzi0tqotyg0P0tyJIhgxoopV77fateMyHS2NoNRk3u2YMgfEUz9jt+Mx
	I7oNOyQ+dlAawprLARe5BTTjR91BKrEJGHW7LfKtefXB0VFKSsrdcDKI81gtPbkU0jfv
	Jz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ttUciq1R4DLXwSrCKOG8sMg2/ZhVL4qipuIgKqQy2hE=;
	b=bWlDVP06jrB2NGHuCf+7C51y+z/bnGM/+iPU0LS44ZCgva0JVEPjiuLNVPnl/fxybL
	ij28ZChnYXeVFViuQ3Uz335rWr4vIJ5vel0mOpwS5jnx3ImyezJlF1brwe/4a8Rk/IeG
	NTaRm6Mj2JNzxTp1VA6RlbFzQbcjHddVcIBxuXIu10feWYuARqdGPOYDTdxW/hqC08mP
	MuemKaCWpllXy5mCZYja8Mreo9L5l5h2Zjhwc8hl3W+aUpR00uR01HQAihbtlMEl5704
	g36+fLYCPDxnyWPBWkJAN6aKTYwgthJUeGu7+Gs69qOAJT7/t8HIgQOZqmO8iGE892Yg
	2RLQ==
X-Gm-Message-State: AOAM530ikdpswapo4R2Bpe2iNHKoM5aD0hM/Eg1xGJXEtyIGRAKfaH7O
	bPwiTw5K6DHehxZNH/JBeA49gQ==
X-Google-Smtp-Source: ABdhPJwILxLSUCxDdCac/fZUN7tHM3l14dJ0zrZ6D/Tc1v+OsXoh2HYNZYg6WBqjtOr30hdwGoEJQw==
X-Received: by 2002:a05:6638:168e:: with SMTP id
	f14mr67991477jat.64.1594303139999; 
	Thu, 09 Jul 2020 06:58:59 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id a1sm1884363ilq.50.2020.07.09.06.58.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Jul 2020 06:58:59 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
	<b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
	<20200709053233.GA3243@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <82e2785d-2091-1986-0014-3b7cea7cd0d8@kernel.dk>
Date: Thu, 9 Jul 2020 07:58:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709053233.GA3243@lst.de>
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

T24gNy84LzIwIDExOjMyIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBXZWQsIEp1
bCAwOCwgMjAyMCBhdCAwNToxNDoyOVBNIC0wNjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+PiBPbiA3
LzEvMjAgMzowNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+PiBIaSBKZW5zLAo+Pj4K
Pj4+IHdlIGhhdmUgYSBsb3Qgb2YgYmRpIGNvbmdlc3Rpb24gcmVsYXRlZCBjb2RlIHRoYXQgaXMg
bGVmdCBhcm91bmQgd2l0aG91dAo+Pj4gYW55IHVzZS4gIFRoaXMgc2VyaWVzIHJlbW92ZXMgaXQg
aW4gcHJlcGFyYXRpb24gb2Ygc29ydGluZyBvdXQgdGhlIGJkaQo+Pj4gbGlmZXRpbWUgcnVsZXMg
cHJvcGVybHkuCj4+Cj4+IFBsZWFzZSBydW4gc2VyaWVzIGxpa2UgdGhpcyB0aHJvdWdoIGEgZnVs
bCBjb21waWxhdGlvbiwgZm9yIGJvdGggdGhpcyBvbmUKPj4gYW5kIHRoZSBwcmV2aW91cyBzZXJp
ZXMgSSBoYWQgdG8gZml4IHVwIGlzc3VlcyBsaWtlIHRoaXM6Cj4+Cj4+IGRyaXZlcnMvbWQvYmNh
Y2hlL3JlcXVlc3QuYzogSW4gZnVuY3Rpb24g4oCYYmNoX2NhY2hlZF9kZXZfcmVxdWVzdF9pbml0
4oCZOgo+PiBkcml2ZXJzL21kL2JjYWNoZS9yZXF1ZXN0LmM6MTIzMzoxODogd2FybmluZzogdW51
c2VkIHZhcmlhYmxlIOKAmGfigJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+PiAgMTIzMyB8ICBzdHJ1
Y3QgZ2VuZGlzayAqZyA9IGRjLT5kaXNrLmRpc2s7Cj4+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICBeCj4+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzogSW4gZnVuY3Rpb24g4oCYYmNoX2Zs
YXNoX2Rldl9yZXF1ZXN0X2luaXTigJk6Cj4+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzox
MzIwOjE4OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZ+KAmSBbLVd1bnVzZWQtdmFyaWFi
bGVdCj4+ICAxMzIwIHwgIHN0cnVjdCBnZW5kaXNrICpnID0gZC0+ZGlzazsKPj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgIF4KPj4KPj4gRGlkIHRoZSBzYW1lIGhlcmUsIGFwcGxpZWQgaXQuCj4g
Cj4gQW5kIGp1c3QgbGlrZSB0aGUgcHJldmlvdXMgb25lIEkgZGlkLCBhbmQgdGhlIGNvbXBpbGVy
IGRpZCBub3QgY29tcGxhaW4uCj4gVGhlcmUgbXVzdCBiZSBzb21ldGhpbmcgYWJvdXQgY2VydGFp
biBnY2MgdmVyc2lvbnMgbm90IHdhcm5pbmcgYWJvdXQKPiB2YXJpYWJsZXMgdGhhdCBhcmUgaW5p
dGlhbGl6ZWQgYnV0IG5vdCBvdGhlcndpc2UgdXNlZC4KCkFyZSB5b3UgdXNpbmcgZ2NjLTEwPyBJ
dCBzdWNrcyBmb3IgdGhhdC4gZ2NjLTkgc2VlbXMgdG8gcmVsaWFibHkgaGl0CnRoZXNlIGNhc2Vz
IGZvciBtZSwgbm90IHN1cmUgd2h5IGdjYy0xMCBkb2Vzbid0LiBBbmQgdGhlIG9uZXMgcXVvdGVk
CmFib3ZlIGFyZSBhYm91dCBhcyB0cml2aWFsIGFzIHRoZXkgY2FuIGdldC4KCi0tIApKZW5zIEF4
Ym9lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJk
LWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3Rz
LmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
