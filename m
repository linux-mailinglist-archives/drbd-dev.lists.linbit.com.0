Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ED857646006
	for <lists+drbd-dev@lfdr.de>; Wed,  7 Dec 2022 18:22:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5EC094252BC;
	Wed,  7 Dec 2022 18:22:15 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B662642177D
	for <drbd-dev@lists.linbit.com>; Wed,  7 Dec 2022 18:22:13 +0100 (CET)
Received: by mail-io1-f43.google.com with SMTP id o189so6519458iof.0
	for <drbd-dev@lists.linbit.com>; Wed, 07 Dec 2022 09:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=EpTDLOhW0V3+1aR8vlaV9Hai3rR7JGPJvFehDEM1z0k=;
	b=WuLBfeGFwu+0r21caxzCY0+TP72iv0Vmz6j4f2nARaTkZ6MmLakC7hya4ycSRvqMDI
	SuzvbugdfQlsXrJGaT4MBJtrovZDXTkclAPuy4ARX/NXLtySpWY43xZIWrBasgcQugq8
	vQhfZ35UxQngr2AbHjR8VvqDdM2S7bawB1nbVd8IAIAtAJ6QIM0groms0cVRZmf/5hJ5
	gYRuWN4pmn37QJI13DuMnWpuKPm3dQxH/KlZ9pWGQ70mwlSqfH7NoBL0xtcoQk0ex4xM
	qbmg7ziYNHJJjBjTSvOZVicehGzE9TQ8n7q/GwtauEdZJAs9Wa7FXxqQQfBLwFZUidsz
	/Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=EpTDLOhW0V3+1aR8vlaV9Hai3rR7JGPJvFehDEM1z0k=;
	b=EkgH6V0rDWQnrHJ1ZqBiFiUAN9Ep/Cv9TqYZwPsUaUiULeqeAoatn8td5sCDF9usCZ
	jfgfz25hVkx8wGe5+RVHWFXgymkLAyeEqFoBZpfHVKinLEyZVAA5x4bytl/jOkk+J+yh
	7Bugm1f9hXej8awZjzxVAr0ns9M0bLArjjNRbEsQu5Gk5bcu+2pY4Dlnyf06encDXWoP
	aCCMR/8OBX7TZ60bE2ZOwFjdx9giI2Jsck+t05Tb7Bm5H29/H0Vr+SLM8CU/ihHZ/6+o
	SQwcj4b6UvkcIrcv4CKoflN7LjGFfXe3ROE2e30TX4XJNIb+EC55AHTFLLfiCyKFY4rc
	MqsA==
X-Gm-Message-State: ANoB5pnmYDB9R2Py1HD79iItUD/fCv+eTNzKVPLEoFyUEvPFtIpPUR1g
	KXRvDEtLj88wgi4SvLPEpPgmwg==
X-Google-Smtp-Source: AA0mqf7/gBf7/XEEClF7Gq7hMc0QmhQHunFYc2f4SCWfcKxA9tFoQkk2RXV+JEDjVFWOG2u7WxQZig==
X-Received: by 2002:a05:6602:4296:b0:6e0:1464:a7d7 with SMTP id
	cd22-20020a056602429600b006e01464a7d7mr5843517iob.60.1670433732410;
	Wed, 07 Dec 2022 09:22:12 -0800 (PST)
Received: from [192.168.1.94] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	q34-20020a056638346200b0038a44dbbd8fsm3597816jav.123.2022.12.07.09.22.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 07 Dec 2022 09:22:11 -0800 (PST)
Message-ID: <b8deb6fa-8a09-c1af-278f-24e66afe367d@kernel.dk>
Date: Wed, 7 Dec 2022 10:22:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.5.1
Content-Language: en-US
To: Yu Kuai <yukuai1@huaweicloud.com>, Ming Lei <ming.lei@redhat.com>
References: <20221206181536.13333-1-gulam.mohamed@oracle.com>
	<936a498b-19fe-36d5-ff32-817f153e57e3@huaweicloud.com>
	<Y5AFX4sxLRLV4uSt@T590>
	<aadfc6d2-ad04-279c-a1d6-7f634d0b2c99@huaweicloud.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aadfc6d2-ad04-279c-a1d6-7f634d0b2c99@huaweicloud.com>
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org, song@kernel.org,
	dm-devel@redhat.com, ira.weiny@intel.com, agk@redhat.com,
	drbd-dev@lists.linbit.com, dave.jiang@intel.com,
	vishal.l.verma@intel.com, konrad.wilk@oracle.com,
	"yukuai \(C\)" <yukuai3@huawei.com>, kent.overstreet@gmail.com,
	ngupta@vflare.org, kch@nvidia.com, senozhatsky@chromium.org,
	Gulam Mohamed <gulam.mohamed@oracle.com>, snitzer@kernel.org,
	colyli@suse.de, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, dan.j.williams@intel.com,
	linux-raid@vger.kernel.org, martin.petersen@oracle.com,
	philipp.reisner@linbit.com, junxiao.bi@oracle.com,
	minchan@kernel.org, lars.ellenberg@linbit.com
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

T24gMTIvNy8yMiA2OjA54oCvQU0sIFl1IEt1YWkgd3JvdGU6Cj4gSGksCj4gCj4g5ZyoIDIwMjIv
MTIvMDcgMTE6MTUsIE1pbmcgTGVpIOWGmemBkzoKPj4gT24gV2VkLCBEZWMgMDcsIDIwMjIgYXQg
MTA6MTk6MDhBTSArMDgwMCwgWXUgS3VhaSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IOWcqCAyMDIy
LzEyLzA3IDI6MTUsIEd1bGFtIE1vaGFtZWQg5YaZ6YGTOgo+Pj4+IFVzZSBrdGltZSB0byBjaGFu
Z2UgdGhlIGdyYW51bGFyaXR5IG9mIElPIGFjY291bnRpbmcgaW4gYmxvY2sgbGF5ZXIgZnJvbQo+
Pj4+IG1pbGxpLXNlY29uZHMgdG8gbmFuby1zZWNvbmRzIHRvIGdldCB0aGUgcHJvcGVyIGxhdGVu
Y3kgdmFsdWVzIGZvciB0aGUKPj4+PiBkZXZpY2VzIHdob3NlIGxhdGVuY3kgaXMgaW4gbWljcm8t
c2Vjb25kcy4gQWZ0ZXIgY2hhbmdpbmcgdGhlIGdyYW51bGFyaXR5Cj4+Pj4gdG8gbmFuby1zZWNv
bmRzIHRoZSBpb3N0YXQgY29tbWFuZCwgd2hpY2ggd2FzIHNob3dpbmcgaW5jb3JyZWN0IHZhbHVl
cyBmb3IKPj4+PiAldXRpbCwgaXMgbm93IHNob3dpbmcgY29ycmVjdCB2YWx1ZXMuCj4+Pgo+Pj4g
VGhpcyBwYXRjaCBkaWRuJ3QgY29ycmVjdCB0aGUgY291bnRpbmcgb2YgaW9fdGlja3MsIGp1c3Qg
bWFrZSB0aGUKPj4+IGVycm9yIGFjY291bnRpbmcgZnJvbSBqaWZmaWVzKG1zKSB0byBucy4gVGhl
IHByb2JsZW0gdGhhdCB1dGlsIGNhbiBiZQo+Pj4gc21hbGxlciBvciBsYXJnZXIgc3RpbGwgZXhp
c3QuCj4+Cj4+IEFncmVlLgo+Pgo+Pj4KPj4+IEhvd2V2ZXIsIEkgdGhpbmsgdGhpcyBjaGFuZ2Ug
bWFrZSBzZW5zZSBjb25zaWRlciB0aGF0IGVycm9yIG1hcmdpbiBpcwo+Pj4gbXVjaCBzbWFsbGVy
LCBhbmQgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQgc2hvdWxkIGJlIG1pbmltdW0uCj4+Pgo+Pj4gSGks
IE1pbmcsIGhvdyBkbyB5b3UgdGhpbms/Cj4+Cj4+IEkgcmVtZW1iZXJlZCB0aGF0IGt0aW1lX2dl
dCgpIGhhcyBub24tbmVnbGlnaWJsZSBvdmVyaGVhZCwgaXMgdGhlcmUgYW55Cj4+IHRlc3QgZGF0
YShpb3BzL2NwdSB1dGlsaXphdGlvbikgd2hlbiBydW5uaW5nIGZpbyBvciB0L2lvX3VyaW5nIG9u
Cj4+IG51bGxfYmxrIHdpdGggdGhpcyBwYXRjaD8KPiAKPiBZZXMsIHRlc3Rpbmcgd2l0aCBudWxs
X2JsayBpcyBuZWNlc3NhcnksIHdlIGRvbid0IHdhbnQgYW55IHBlcmZvcm1hbmNlCj4gcmVncmVz
c2lvbi4KCm51bGxfYmxrIGlzIGZpbmUgYXMgYSBzdWJzdGl0dXRlLCBidXQgSSdkIG11Y2ggcmF0
aGVyIHJ1biB0aGlzIG9uIG15CnRlc3QgYmVuY2ggd2l0aCBhY3R1YWwgSU8gYW5kIGRldmljZXMu
Cgo+IEJUVywgSSB0aG91Z2h0IGl0J3MgZmluZSBiZWNhdXNlIGl0J3MgYWxyZWFkeSB1c2VkIGZv
ciB0cmFja2luZyBpbwo+IGxhdGVuY3kuCgpSZWFkaW5nIGEgbnNlYyB0aW1lc3RhbXAgaXMgYSBM
T1QgbW9yZSBleHBlbnNpdmUgdGhhbiByZWFkaW5nIGppZmZpZXMsCndoaWNoIGlzIGVzc2VudGlh
bGx5IGZyZWUuIElmIHlvdSBsb29rIGF0IHRoZSBhbW91bnQgb2Ygd29yayB0aGF0J3MKZ29uZSBp
bnRvIG1pbmltaXppbmcga3RpbWVfZ2V0KCkgZm9yIHRoZSBmYXN0IHBhdGggaW4gdGhlIElPIHN0
YWNrLAp0aGVuIHRoYXQncyBhIHRlc3RhbWVudCB0byB0aGF0LgoKU28gdGhhdCdzIGEgdmVyeSBi
YWQgYXNzdW1wdGlvbiwgYW5kIGRlZmluaXRlbHkgd3JvbmcuCgotLSAKSmVucyBBeGJvZQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1h
aWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
