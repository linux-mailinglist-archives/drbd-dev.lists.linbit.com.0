Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03657364C
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 14:25:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8482D420FBA;
	Wed, 13 Jul 2022 14:25:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B28C420FB1
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 14:25:41 +0200 (CEST)
Received: by mail-ed1-f47.google.com with SMTP id fd6so13865715edb.5
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=qXqGFu8U4gPDVSr/ggPX1zJdQr5HzeAZdYNrxVaBP2U=;
	b=vTibGfqb8AoB8dfwXHh8bxVf5FbFeYJTrOLebeWcAQTsARpBmyHDJEnUnBIrIfttvA
	r3uR8GsvihZGcnixyJ1ybBzhizpsWGC8XNv0eah0RCuuKzDmiAti20pRwJemgLF+BEVc
	ehKpt9RsXGhj8HC0ZOoluR+VGr8i6Ga8NNvsMXbCqi6yI57KT9Rt3agP9JXsB/Han+gK
	zlfO+6gnu5fZbFAJFUVBzLfGv6wM7uLmp/82YfF6L0pZCUM5prM7HSQT6YHfrk27znqQ
	xp645/qTAw+03mufD09Axo2GVH6ifvt1mOsvsUAtOalPKP2vZRehwNJrzk4M4k10rqJY
	g68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=qXqGFu8U4gPDVSr/ggPX1zJdQr5HzeAZdYNrxVaBP2U=;
	b=6/dh0c/MUPrSWOHQSo6TaTv4KZhQ0Ft63n1myEsvhFqLdz1hfehDI3Mdvk955r4g4B
	20JfGvYY/ranZnp/BNLsf2d6zSu32gIzzHyn5YuRlMkTjUxCXc0qyJnuwyQG6xQRKutX
	AYsup7kXsSjwVc3/SaXJG8qGtlE7NbBcDCRfyl7ER0Cmsv5a3sN2GTbTR0T3RvdAKrcu
	9DvPn6hs/IpV5pfpgl7tpffpVWYY53EQkqbzGNkg4WvSpgUp+zsQf4YkrnbSVvkqU/9x
	Hwr8ZAa/mQ33B+nHEc6hjKTLMXPmcHvs0G+6NwxRYduVbyRSvMDzYSClSSrBUswjdsPG
	kY7g==
X-Gm-Message-State: AJIora9rwgyELnFgIzGuSMTZXMlKwiHPpCjOZddssaY589XvHHO39nR7
	3EU8pq/nxsN6vdtQgu/vWI7Zi67R
X-Google-Smtp-Source: AGRyM1t2anjpsABs9moN8/saQwoeQFzlk9BcJwJ81FhrhmrzcGBgnKja0O11XVp6U4a5FFOg06Pmhg==
X-Received: by 2002:a05:6402:354c:b0:43a:dc59:657 with SMTP id
	f12-20020a056402354c00b0043adc590657mr4381358edd.405.1657715140797;
	Wed, 13 Jul 2022 05:25:40 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	k5-20020a17090632c500b0072aa014e852sm4924686ejk.87.2022.07.13.05.25.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 13 Jul 2022 05:25:40 -0700 (PDT)
Message-ID: <1304fd58-1577-3f27-0ee8-64964bd54467@linbit.com>
Date: Wed, 13 Jul 2022 14:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220713055317.1888500-1-hch@lst.de>
	<20220713055317.1888500-4-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220713055317.1888500-4-hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mark Fasheh <mark@fasheh.com>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/9] drbd: stop using bdevname in
	drbd_report_io_error
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

QW0gMTMuMDcuMjIgdW0gMDc6NTMgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBKdXN0IHVz
ZSB0aGUgJXBnIGZvcm1hdCBzcGVjaWZpZXIgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfcmVxLmMgfCA2ICsrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9yZXEuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jCj4gaW5kZXggZTY0YmNmYmEz
MGVmMy4uNmQ4ZGQxNDQ1OGM2OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9yZXEuYwo+ICsrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jCj4gQEAgLTUyMywx
NiArNTIzLDE0IEBAIHN0YXRpYyB2b2lkIG1vZF9ycV9zdGF0ZShzdHJ1Y3QgZHJiZF9yZXF1ZXN0
ICpyZXEsIHN0cnVjdCBiaW9fYW5kX2Vycm9yICptLAo+ICAKPiAgc3RhdGljIHZvaWQgZHJiZF9y
ZXBvcnRfaW9fZXJyb3Ioc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBkcmJkX3Jl
cXVlc3QgKnJlcSkKPiAgewo+IC0gICAgICAgIGNoYXIgYltCREVWTkFNRV9TSVpFXTsKPiAtCj4g
IAlpZiAoIV9fcmF0ZWxpbWl0KCZkcmJkX3JhdGVsaW1pdF9zdGF0ZSkpCj4gIAkJcmV0dXJuOwo+
ICAKPiAtCWRyYmRfd2FybihkZXZpY2UsICJsb2NhbCAlcyBJTyBlcnJvciBzZWN0b3IgJWxsdSsl
dSBvbiAlc1xuIiwKPiArCWRyYmRfd2FybihkZXZpY2UsICJsb2NhbCAlcyBJTyBlcnJvciBzZWN0
b3IgJWxsdSsldSBvbiAlcGdcbiIsCj4gIAkJCShyZXEtPnJxX3N0YXRlICYgUlFfV1JJVEUpID8g
IldSSVRFIiA6ICJSRUFEIiwKPiAgCQkJKHVuc2lnbmVkIGxvbmcgbG9uZylyZXEtPmkuc2VjdG9y
LAo+ICAJCQlyZXEtPmkuc2l6ZSA+PiA5LAo+IC0JCQliZGV2bmFtZShkZXZpY2UtPmxkZXYtPmJh
Y2tpbmdfYmRldiwgYikpOwo+ICsJCQlkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldik7Cj4gIH0K
PiAgCj4gIC8qIEhlbHBlciBmb3IgSEFOREVEX09WRVJfVE9fTkVUV09SSy4KCkZvciB0aGUgZHJi
ZCBwYXJ0OgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJv
ZWhtd2FsZGVyQGxpbmJpdC5jb20+CgpUaGFua3MuCgotLSAKQ2hyaXN0b3BoIELDtmhtd2FsZGVy
CkxJTkJJVCB8IEtlZXBpbmcgdGhlIERpZ2l0YWwgV29ybGQgUnVubmluZwpEUkJEIEhBIOKAlCAg
RGlzYXN0ZXIgUmVjb3Zlcnkg4oCUIFNvZnR3YXJlIGRlZmluZWQgU3RvcmFnZQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxp
c3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kcmJkLWRldgo=
