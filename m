Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D14C6EC7DA
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Apr 2023 10:26:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 828484203CE;
	Mon, 24 Apr 2023 10:26:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BE1E1420358
	for <drbd-dev@lists.linbit.com>; Mon, 24 Apr 2023 10:26:32 +0200 (CEST)
Received: by mail-wm1-f48.google.com with SMTP id
	5b1f17b1804b1-3f195b164c4so15950965e9.1
	for <drbd-dev@lists.linbit.com>; Mon, 24 Apr 2023 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1682324792;
	x=1684916792; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=3pxlWKD7dnb+hgIonOTuPgqaiGVvQd+hXe0K6IdPi2M=;
	b=BCLvweSQah01sJW9SBAyC5wgM9gcCgmoD6eVt1pixm6TIMPKSMsfDJ/G6pQ7WifY+a
	jCWSatlOFJoGBGRyqNjpnC83+YZxWwidqcfJV7qrZVFpoOQQ5qGdcpNUfD/1uI304Bsr
	n5t0aKbFfDOlYu2sfU/KiJsKG+tbC5Q3pej1LUOiQjmwv12srCYdM4fwvJqfC1vIGgHG
	i7xM2mHs1udxBgFRdzJGUIySnuCvM4rCCc4KxRtFlArnjXACALMboZpw/c8XanndS9Ts
	WTUnWIGWHkbm7Rk6Wg/mlO7SJDa+qk0PwimjElI9r8oOeFo6sLYUJveYcdOozE2aiQA6
	piSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1682324792; x=1684916792;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=3pxlWKD7dnb+hgIonOTuPgqaiGVvQd+hXe0K6IdPi2M=;
	b=GFKRvrZJZHbHJbQt1BwUFjnv/kuqc76Pq9tUEbeS/1p6uORXb4wr8+BTho5f0CzE88
	jStlBwLbY93av3JXjaRBx5kNBlOV/G9TSYyICXYF9ciN7HCVuJJw425CwMDRnKS9bfrb
	W5lRjgerp1yngdBcNiFu5/oj4mX1HVNu57wiGVXBKaaxQjRtENNJBUjtQE9/Wz7SqM9R
	5etHn3YTd7z8MGMYOsUp3TfWlBOERgUCVc+/SPPIVqd6015VOnAirxAU16bnYKPyG/EZ
	G6TZxOiKAYmB+MEZip2BuurhyPInD3WE9H/ACZhi4UX0hATX/acqliWDjBDVpKGiwtju
	bTQw==
X-Gm-Message-State: AAQBX9e3PM3m6Fgz4G2HcYeuGFdOM4/0RlaTKRhdd+C1KOnlDyv+L+Lv
	HAGnK5zPzX5fNdTPoY2vXxKvQzkA
X-Google-Smtp-Source: AKy350byXoD5GzDBK8BfQEyK98TvcOHuQxalfYGEuCyUBUv+0C+wGb7Sf32jhfdSzffUY8tfHfxXdw==
X-Received: by 2002:a05:600c:259:b0:3f1:662a:93d0 with SMTP id
	25-20020a05600c025900b003f1662a93d0mr7829493wmj.15.1682324791970;
	Mon, 24 Apr 2023 01:26:31 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	l20-20020a05600c16d400b003f19bca8f03sm4904838wmn.43.2023.04.24.01.26.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Apr 2023 01:26:31 -0700 (PDT)
Message-ID: <42c89d18-b68f-a7d0-921a-6f45b54da356@linbit.com>
Date: Mon, 24 Apr 2023 10:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.1
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk, agk@redhat.com,
	snitzer@kernel.org, philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	hch@infradead.org, djwong@kernel.org, minchan@kernel.org,
	senozhatsky@chromium.org
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-3-mcgrof@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230421195807.2804512-3-mcgrof@kernel.org>
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, da.gomez@samsung.com,
	patches@lists.linux.dev, willy@infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com, hare@suse.de,
	linux-fsdevel@vger.kernel.org, kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/5] drbd: use PAGE_SECTORS_SHIFT and
	PAGE_SECTORS
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

QW0gMjEuMDQuMjMgdW0gMjE6NTggc2NocmllYiBMdWlzIENoYW1iZXJsYWluOgo+IFJlcGxhY2Ug
Y29tbW9uIGNvbnN0YW50cyB3aXRoIGdlbmVyaWMgdmVyc2lvbnMuCj4gVGhpcyBwcm9kdWNlcyBu
byBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVpcyBDaGFtYmVybGFp
biA8bWNncm9mQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2Jp
dG1hcC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2JpdG1h
cC5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0bWFwLmMKPiBpbmRleCA2YWM4YzU0YjQ0
YzcuLmI1NTZlNjYzNGYxMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9i
aXRtYXAuYwo+ICsrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2JpdG1hcC5jCj4gQEAgLTEw
MDAsNyArMTAwMCw3IEBAIHN0YXRpYyB2b2lkIGJtX3BhZ2VfaW9fYXN5bmMoc3RydWN0IGRyYmRf
Ym1fYWlvX2N0eCAqY3R4LCBpbnQgcGFnZV9ucikgX19tdXN0X2hvCj4gIAl1bnNpZ25lZCBpbnQg
bGVuOwo+ICAKPiAgCWZpcnN0X2JtX3NlY3QgPSBkZXZpY2UtPmxkZXYtPm1kLm1kX29mZnNldCAr
IGRldmljZS0+bGRldi0+bWQuYm1fb2Zmc2V0Owo+IC0Jb25fZGlza19zZWN0b3IgPSBmaXJzdF9i
bV9zZWN0ICsgKCgoc2VjdG9yX3QpcGFnZV9ucikgPDwgKFBBR0VfU0hJRlQtU0VDVE9SX1NISUZU
KSk7Cj4gKwlvbl9kaXNrX3NlY3RvciA9IGZpcnN0X2JtX3NlY3QgKyAoKChzZWN0b3JfdClwYWdl
X25yKSA8PCBQQUdFX1NFQ1RPUlNfU0hJRlQpOwo+ICAKPiAgCS8qIHRoaXMgbWlnaHQgaGFwcGVu
IHdpdGggdmVyeSBzbWFsbAo+ICAJICogZmxleGlibGUgZXh0ZXJuYWwgbWV0YSBkYXRhIGRldmlj
ZSwKPiBAQCAtMTAwOCw3ICsxMDA4LDcgQEAgc3RhdGljIHZvaWQgYm1fcGFnZV9pb19hc3luYyhz
dHJ1Y3QgZHJiZF9ibV9haW9fY3R4ICpjdHgsIGludCBwYWdlX25yKSBfX211c3RfaG8KPiAgCWxh
c3RfYm1fc2VjdCA9IGRyYmRfbWRfbGFzdF9iaXRtYXBfc2VjdG9yKGRldmljZS0+bGRldik7Cj4g
IAlpZiAoZmlyc3RfYm1fc2VjdCA8PSBvbl9kaXNrX3NlY3RvciAmJiBsYXN0X2JtX3NlY3QgPj0g
b25fZGlza19zZWN0b3IpIHsKPiAgCQlzZWN0b3JfdCBsZW5fc2VjdCA9IGxhc3RfYm1fc2VjdCAt
IG9uX2Rpc2tfc2VjdG9yICsgMTsKPiAtCQlpZiAobGVuX3NlY3QgPCBQQUdFX1NJWkUvU0VDVE9S
X1NJWkUpCj4gKwkJaWYgKGxlbl9zZWN0IDwgUEFHRV9TRUNUT1JTKQo+ICAJCQlsZW4gPSAodW5z
aWduZWQgaW50KWxlbl9zZWN0KlNFQ1RPUl9TSVpFOwo+ICAJCWVsc2UKPiAgCQkJbGVuID0gUEFH
RV9TSVpFOwoKQWNrZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWht
d2FsZGVyQGxpbmJpdC5jb20+CgotLSAKQ2hyaXN0b3BoIELDtmhtd2FsZGVyCkxJTkJJVCB8IEtl
ZXBpbmcgdGhlIERpZ2l0YWwgV29ybGQgUnVubmluZwpEUkJEIEhBIOKAlCAgRGlzYXN0ZXIgUmVj
b3Zlcnkg4oCUIFNvZnR3YXJlIGRlZmluZWQgU3RvcmFnZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZA
bGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kcmJkLWRldgo=
