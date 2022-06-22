Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8A556E84
	for <lists+drbd-dev@lfdr.de>; Thu, 23 Jun 2022 00:33:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 722CA420621;
	Thu, 23 Jun 2022 00:33:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 10CE9420471
	for <drbd-dev@lists.linbit.com>; Thu, 23 Jun 2022 00:33:12 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id
	h34-20020a17090a29a500b001eb01527d9eso792405pjd.3
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 15:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=QAYDnhWBUumQJXLfjLM/HrotAv8NVofKnBHrbwoQ4uI=;
	b=T4SQKvmVgykOMJflWwdcXiHwHaW6ppUL6HpcoyV5P5YmLv05PZ6ywgtWJGQ81+ry4m
	KszItlKZ3EpSACiBoKNrLwpXRyen8O2vs6mNbpNljaC5f++yyLxx9MZMY2XBeRgdaKGS
	A09Kxam4vbOBqas6DMCnXxbiHv2vgOyUg+nis+ZaifLjO2p3D62Uamrmaacp3j6HzKLd
	gCaxNXS5PcwEZ9PvFm7wmN9+rrIK3WKQrtYGPvw3alATQw6CJ/odCJ1ugivLjM2GCFEs
	cQDUIfAud4wtRq7y5/IGcX6YRcyll6JC9SwX3zx14ytWSwCqmz1r1cPZ2rC2SAw1Tj2n
	6x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=QAYDnhWBUumQJXLfjLM/HrotAv8NVofKnBHrbwoQ4uI=;
	b=U9msNNEFwC7559yOGmPAy9dYnf5/wOsFEIrmbWfe6mwWMQ7s2Ob99+MmOZJrfhVN4/
	/liTYiZ85xOGOOqQZjIDzApYGpuHVPsxgvO3H+k5cc8THe9duEqxVRPxatzILS9ZXb7t
	24KtH3H+s+IQHKmYQauQEbPRYtmE7EfB5oHSHFHuSW65/027c1TWuTyON3hFXYTi6aWV
	HgSZuANkgPHOF7+NUgVYSFSHOR66CyPF3T1OGrxk9rRLykykdF3QQHD38HyjqIYKwFRk
	s4eAYZrIseSiEk4pbFmw5QEfwMmrmjYBTPWKqdbgGhmVL7uHhq6I90NHztjt5WN1r6qW
	8/Yg==
X-Gm-Message-State: AJIora/Kw4kN3Ms3tO2qzTpK09a1yBMbkmv2OOZBV2rST4TRLsVL7qRu
	xuPmtVfonbxqSUvXQW6sIdO75w==
X-Google-Smtp-Source: AGRyM1sVc1ogbU/b7rlbzF68iEfptv2tG9a4AJSUp9uVgyMRQ81sfKMlvvYWh45MR18JSdkr1pN45Q==
X-Received: by 2002:a17:902:e810:b0:16a:2934:c8f7 with SMTP id
	u16-20020a170902e81000b0016a2934c8f7mr16468040plg.171.1655937191761;
	Wed, 22 Jun 2022 15:33:11 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	m14-20020a63ed4e000000b0040d2717473fsm2191066pgk.38.2022.06.22.15.33.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jun 2022 15:33:11 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: christoph.boehmwalder@linbit.com
In-Reply-To: <20220622204932.196830-1-christoph.boehmwalder@linbit.com>
References: <20220622204932.196830-1-christoph.boehmwalder@linbit.com>
Message-Id: <165593719059.163762.1120892404181433441.b4-ty@kernel.dk>
Date: Wed, 22 Jun 2022 16:33:10 -0600
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: bm_page_async_io: fix spurious bitmap
	"IO error" on large volumes
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

T24gV2VkLCAyMiBKdW4gMjAyMiAyMjo0OTozMiArMDIwMCwgQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IHdyb3RlOgo+IEZyb206IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29t
Pgo+IAo+IFdlIHVzdWFsbHkgZG8gYWxsIG91ciBiaXRtYXAgSU8gaW4gdW5pdHMgb2YgUEFHRV9T
SVpFLgo+IAo+IFdpdGggdmVyeSBzbWFsbCBvciBvZGRseSBzaXplZCBleHRlcm5hbCBtZXRhIGRh
dGEsIG9yIHdpdGgKPiBQQUdFX1NJWkUgIT0gNGssIGl0IGNhbiBoYXBwZW4gdGhhdCBvdXIgbGFz
dCBvbi1kaXNrIGJpdG1hcCBwYWdlCj4gaXMgbm90IGZ1bGx5IFBBR0VfU0laRSBhbGlnbmVkLCBz
byB3ZSBtYXkgbmVlZCB0byBhZGp1c3QgdGhlIHNpemUKPiBvZiB0aGUgSU8uCj4gCj4gWy4uLl0K
CkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGRyYmQ6IGJtX3BhZ2VfYXN5bmNfaW86IGZpeCBzcHVy
aW91cyBiaXRtYXAgIklPIGVycm9yIiBvbiBsYXJnZSB2b2x1bWVzCiAgICAgIGNvbW1pdDogNjY5
MjMzMjZiNTE5YmJjNGViY2I1Mjc1NjQ1YjU4NDI3ZjgwMTgyNAoKQmVzdCByZWdhcmRzLAotLSAK
SmVucyBBeGJvZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBz
Oi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
