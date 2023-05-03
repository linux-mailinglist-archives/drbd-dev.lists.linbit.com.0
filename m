Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37A6F57D0
	for <lists+drbd-dev@lfdr.de>; Wed,  3 May 2023 14:20:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 493CF420FB8;
	Wed,  3 May 2023 14:20:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87AAD420668
	for <drbd-dev@lists.linbit.com>; Wed,  3 May 2023 14:20:25 +0200 (CEST)
Received: by mail-wm1-f43.google.com with SMTP id
	5b1f17b1804b1-3f19afc4fbfso50879175e9.2
	for <drbd-dev@lists.linbit.com>; Wed, 03 May 2023 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1683116424;
	x=1685708424; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=HbIHW3WFJjCSlSmcogKsdyCdUd7ycb8fmjWMREeXjCw=;
	b=zm+0MHgI8YyjZvCVYCL/QFDiqrw357GfINXK71fw/0AwoNi4xZmbOshugboG9853+R
	LMpLqMeF77seN4g464PWWTnF+Pe21tgYZATz/nt/9KKkzpyl2rlZmipc6OgV9ASGhvDJ
	9UIJksnpNv3xYoqBz7bRAX7b2nRZksmJJLNtcrJhDiYCAhkPHPizhl357QAQZHzj/Roh
	/MPx0MMrofRRHdaSC4SdgM/8KduspCsmE6ssnfei5qeida9JCHvt/V0zPwnpilvmDRFG
	yuK3ySJ9GX6+nL4tTbFSYkLcIeC9prqfDrkX43lQ/LVvxusEpEKRbEbGAZunCYsGJQzt
	2eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1683116424; x=1685708424;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=HbIHW3WFJjCSlSmcogKsdyCdUd7ycb8fmjWMREeXjCw=;
	b=BsXHge9hZ8X1EA9JJQfkaCyuRgKkwY93zU8Z4FRiSKr5d6bZTMtPJw1xLxKZi28r/C
	yvFSNa23X0TCPdFIBPhUXykR5FlEXK8Q/Ao2z+z/bMiZi+K6xSikGsE2UTvx3uikRcYz
	FltePLAqaqNft7bal0Se+hyaRhgMCD62qwgWvw/bKmVQ4YTHswRPN6EP8tVP2+PW876B
	gmLzDSgaDQ8kQBzrC8UEyS1feW9TJAJWDkNQTLqinASvQbeluWI0DCSS/P23veixC89z
	0vDhUM7yILUfXTCTgFlbgYtssf3BZ89doWfEv4yvAqD5cgis6AoBST+ZlE0F4uXur7wQ
	Lgnw==
X-Gm-Message-State: AC+VfDyDtVN9O5CdrGYGUySQb2s7eZAyNJqzqSpZ4aU3S7KBpBzq3VAP
	eMWA7HX0e44rlXY21OAWOU1duyZD
X-Google-Smtp-Source: ACHHUZ4vVAbqI84nqD7SfKcPc/YM/bQUCMMrNM47k+DsevZb0DiO+zbCK2U2kzTlyFRPoxZOz/BdbA==
X-Received: by 2002:a7b:c047:0:b0:3f1:979f:a734 with SMTP id
	u7-20020a7bc047000000b003f1979fa734mr14560520wmc.11.1683116424668;
	Wed, 03 May 2023 05:20:24 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	q7-20020a1ce907000000b003f180d5b145sm1748027wmc.40.2023.05.03.05.20.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 May 2023 05:20:24 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  3 May 2023 14:19:37 +0200
Message-Id: <20230503121937.17232-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Christoph Hellwig <hch@infradead.org>, Thomas Voegtle <tv@lio96.de>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: correctly submit flush bio on barrier
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

V2hlbiB3ZSByZWNlaXZlIGEgZmx1c2ggY29tbWFuZCAob3IgImJhcnJpZXIiIGluIERSQkQpLCB3
ZSBjdXJyZW50bHkgdXNlCmEgUkVRX09QX0ZMVVNIIHdpdGggdGhlIFJFUV9QUkVGTFVTSCBmbGFn
IHNldC4KClRoZSBjb3JyZWN0IHdheSB0byBzdWJtaXQgYSBmbHVzaCBiaW8gaXMgYnkgdXNpbmcg
YSBSRVFfT1BfV1JJVEUgd2l0aG91dAphbnkgZGF0YSwgYW5kIHNldCB0aGUgUkVRX1BSRUZMVVNI
IGZsYWcuCgpTaW5jZSBjb21taXQgYjRhNmJiM2E2N2FhICgiYmxvY2s6IGFkZCBhIHNhbml0eSBj
aGVjayBmb3Igbm9uLXdyaXRlCmZsdXNoL2Z1YSBiaW9zIiksIHRoaXMgdHJpZ2dlcnMgYSB3YXJu
aW5nIGluIHRoZSBibG9jayBsYXllciwgYnV0IHRoaXMKaGFzIGJlZW4gYnJva2VuIGZvciBxdWl0
ZSBzb21lIHRpbWUgYmVmb3JlIHRoYXQuCgpTbyB1c2UgdGhlIGNvcnJlY3Qgc2V0IG9mIGZsYWdz
IHRvIGFjdHVhbGx5IG1ha2UgdGhlIGZsdXNoIGhhcHBlbi4KCkNjOiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGluZnJhZGVhZC5vcmc+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCkZpeGVzOiBm
OWZmMGRhNTY0MzcgKCJkcmJkOiBhbGxvdyBwYXJhbGxlbCBmbHVzaGVzIGZvciBtdWx0aS12b2x1
bWUgcmVzb3VyY2VzIikKUmVwb3J0ZWQtYnk6IFRob21hcyBWb2VndGxlIDx0dkBsaW85Ni5kZT4K
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KLS0tClByZXZpb3VzLCBpbmNvcnJlY3QgdmVyc2lvbiBvZiB0aGlzIHBh
dGNoOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA1MDIwOTI5MjIuMTc1ODU3LTEt
Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20vCgogZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfcmVjZWl2ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVy
LmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jCmluZGV4IGU1NDQwNGM2MzJl
Ny4uMzRiMTEyNzUyYWIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNl
aXZlci5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKQEAgLTEyODMs
NyArMTI4Myw3IEBAIHN0YXRpYyB2b2lkIG9uZV9mbHVzaF9lbmRpbyhzdHJ1Y3QgYmlvICpiaW8p
CiBzdGF0aWMgdm9pZCBzdWJtaXRfb25lX2ZsdXNoKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNl
LCBzdHJ1Y3QgaXNzdWVfZmx1c2hfY29udGV4dCAqY3R4KQogewogCXN0cnVjdCBiaW8gKmJpbyA9
IGJpb19hbGxvYyhkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldiwgMCwKLQkJCQkgICAgUkVRX09Q
X0ZMVVNIIHwgUkVRX1BSRUZMVVNILCBHRlBfTk9JTyk7CisJCQkJICAgIFJFUV9PUF9XUklURSB8
IFJFUV9QUkVGTFVTSCwgR0ZQX05PSU8pOwogCXN0cnVjdCBvbmVfZmx1c2hfY29udGV4dCAqb2N0
eCA9IGttYWxsb2Moc2l6ZW9mKCpvY3R4KSwgR0ZQX05PSU8pOwogCiAJaWYgKCFvY3R4KSB7Ci0t
IAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8v
bGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
