Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516D6D3541
	for <lists+drbd-dev@lfdr.de>; Sun,  2 Apr 2023 04:28:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6DC52421039;
	Sun,  2 Apr 2023 04:28:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7149E420369
	for <drbd-dev@lists.linbit.com>; Sun,  2 Apr 2023 04:28:45 +0200 (CEST)
Received: by mail-pj1-f51.google.com with SMTP id d13so24267582pjh.0
	for <drbd-dev@lists.linbit.com>; Sat, 01 Apr 2023 19:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1680402524;
	x=1682994524; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ybLUlu3Ru7Wc/LW+Yha3uRgx/7krEyN346oSPVy26Ww=;
	b=PSvA+fAlNjvV/y70khe3o4h+mkSRV/zmKh+J9w+9xF5v/S7P74OTpLwfHAvPMePiUA
	OZ+7jLMm6ZMfpBn8RDMs4XMpxHf8lXOecmdJZjTYfup4YCwjGFPEv7omy7Q8voDQ750B
	R296XoK3w2I4gBTmj9jIPN4Jsf8I4oJSqjmQKA9sHPauEmQTPcUEPkLP+IXtT09nk5AQ
	v4xVgYVX6/Ahf2+Kx+S7w6fTg8DdG/1mJ8dEB+Ujx+Ov3rEkhi7BxyziYCXYdiVHzpY1
	Iy6NbZb8CgPNbY7zhJKR9YnLDOysxSEXhTvAGPCmcJtWSmaEMYqh3kCUSiLubR8ged3z
	zKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1680402524; x=1682994524;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ybLUlu3Ru7Wc/LW+Yha3uRgx/7krEyN346oSPVy26Ww=;
	b=cvnlTlRwfxN9Vr8CaY+4Re4MWdHqeac9wiRaSBi7x0bAHnroRpzqu90TLmxOBA54xY
	pTOVeDOZS9p2qZrGHJkWenbky5BqnpD/GgHvCQ56Az5I02qF+WfdcXwrWPugl/kSC10w
	7EIfw75pjKv5pXgICOgj+Ycf22JYbapHCNi9H9gc7qHBlao26wSo0265kvbTS4SnL/AO
	DJrbXmbveyFW9lTZ1WZhpDwvgFZOLcYFrBflx3/sivtz31OHzEQiuo01N0eQpspiqIIE
	eBEkDVjMQjlFUXIa91zz5xoUN/Acwj3i4WShO1w+vNRdRUbkPb3CbxpWDUVljv87AvQq
	XQmA==
X-Gm-Message-State: AAQBX9f+ti87oBRpVPhtPUB1Wyq87D2HOvI4iVFD1/kB+yVpWtLUuDOs
	GgPKjFdQZu3tEmLwY1gd+Ot03Q==
X-Google-Smtp-Source: AKy350a0dWPFX1JDDSzcLkLWS9H4pD56Fisx4aIvFW3iHYlHnT2NxVShDJ/e1An2xCQpdr2QOtN+Gg==
X-Received: by 2002:a05:6a20:72a3:b0:e4:173c:cdec with SMTP id
	o35-20020a056a2072a300b000e4173ccdecmr10449694pzk.0.1680402524033;
	Sat, 01 Apr 2023 19:28:44 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	n23-20020a62e517000000b0061ddff8c53dsm4184006pff.151.2023.04.01.19.28.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Apr 2023 19:28:43 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
References: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
Message-Id: <168040252316.200172.16639804916232097700.b4-ty@kernel.dk>
Date: Sat, 01 Apr 2023 20:28:43 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-20972
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3 0/7] Assorted DRBD refactoring
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

Ck9uIFRodSwgMzAgTWFyIDIwMjMgMTI6Mjc6MzcgKzAyMDAsIENocmlzdG9waCBCw7ZobXdhbGRl
ciB3cm90ZToKPiBBbm90aGVyIHNldCBvZiAiYmFja3BvcnRlZCIgRFJCRCByZWZhY3RvcmluZyBw
YXRjaGVzIHRvIGJyaW5nIHRoZQo+IGluLXRyZWUgdmVyc2lvbiBjbG9zZXIgdG8gb3V0LW9mLXRy
ZWUuCj4gCj4gVGhlc2UgYXJlIChob3BlZnVsbHkpIG5vLW9wcywgcHJldHR5IG11Y2gganVzdCBw
cmVwYXJhdGlvbiBmb3IgZnV0dXJlCj4gdXBzdHJlYW1pbmcgd29yay4KPiAKPiBDaGFuZ2VzIHNp
bmNlIHYyOgo+IC0gUmViYXNlIHRvIGZvci02LjQvYmxvY2sKPiAKPiBbLi4uXQoKQXBwbGllZCwg
dGhhbmtzIQoKWzEvN10gZ2VuZXRsaW5rOiBtYWtlIF9nZW5sX2NtZF90b19zdHIgc3RhdGljCiAg
ICAgIGNvbW1pdDogMGQxMWYzY2YyNzljNWFkMjBhNDFmMjkyNDJmMTcwYmEzYzAyZjJkYQpbMi83
XSBkcmJkOiBSaXAgb3V0IHRoZSBFUlJfSUZfQ05UX0lTX05FR0FUSVZFIG1hY3JvCiAgICAgIGNv
bW1pdDogMzNmN2QzMTY3M2ViNDMyOThiMjViMGNjYTMwYWNjNDg3ZThhMzMyYQpbMy83XSBkcmJk
OiBBZGQgcGVlciBkZXZpY2UgcGFyYW1ldGVyIHRvIHdob2xlLWJpdG1hcCBJL08gaGFuZGxlcnMK
ICAgICAgY29tbWl0OiA4MTY0ZGQ2YzhhZTE1OGVjMDc0MGJmMzdmMGYxNDY0NWExZmI1MzU1Cls0
LzddIGRyYmQ6IElORk9fYm1feGZlcl9zdGF0cygpOiBQYXNzIGEgcGVlciBkZXZpY2UgYXJndW1l
bnQKICAgICAgY29tbWl0OiA1ZTU0YzJhNjAxMGJjODhlMzNhNWE2NmFhMTZjOTVmYTVkMDE3MDY1
Cls1LzddIGRyYmQ6IGRyYmRfdXVpZF9jb21wYXJlOiBwYXNzIGEgcGVlcl9kZXZpY2UKICAgICAg
Y29tbWl0OiBkYjQ0NWRiMWNkZTU0MGY4MTkyNjVkY2FlMmQ5MTZhMzU2MTZiZGEwCls2LzddIGRy
YmQ6IHBhc3MgZHJiZF9wZWVyX2RldmljZSB0byBfX3JlcV9tb2QKICAgICAgY29tbWl0OiBhZDg3
OGEwZDg4MTVhMjkxYTFjYmIyZGM4Mjc5ZGMyOTEwYzk5OWNjCls3LzddIGRyYmQ6IFBhc3MgYSBw
ZWVyIGRldmljZSB0byB0aGUgcmVzeW5jIGFuZCBvbmxpbmUgdmVyaWZ5IGZ1bmN0aW9ucwogICAg
ICBjb21taXQ6IDBkMTFmM2NmMjc5YzVhZDIwYTQxZjI5MjQyZjE3MGJhM2MwMmYyZGEKCkJlc3Qg
cmVnYXJkcywKLS0gCkplbnMgQXhib2UKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1k
ZXYK
