Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B374EDAED
	for <lists+drbd-dev@lfdr.de>; Thu, 31 Mar 2022 15:53:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C19E242097E;
	Thu, 31 Mar 2022 15:53:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 31B37420835
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 15:53:17 +0200 (CEST)
Received: by mail-pg1-f171.google.com with SMTP id o8so20024219pgf.9
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=DDFSnXttaRcP6sMyIlbDXzSgeGiuA5GnNV3I+yXmx0I=;
	b=QBXgDspkDKiEqTuTUJx5FwJ6IIMlYB82PsMFBbPkuVvaSrmwBaibhN4IyqiqX3QAtI
	OCAP5hSBxM/f9g11SS8K2b2V6HNKxvUnrJQMKFy371O+l4IDHzppFdKZJD4L/cy26Bzs
	23eR95/m4OlMyvrN4W7bEhrNhPB/y/0MptMAS5BL3AvgmeY/JsJmUEdV8GzoVT9vRYlA
	Rk5pXtyWgQDQVwy1j8pGPyqBFDEKY65QlJP5XgTFqHPhm4w/FjP9MCgDpga4g1G6uzm0
	KsRMP6W04py527Ct/Qe9GRcdTBEIbVG9XTZwpM0CchOAXlptrkpfIZAGrKrQuehL5c3u
	8a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=DDFSnXttaRcP6sMyIlbDXzSgeGiuA5GnNV3I+yXmx0I=;
	b=vONEYOWj8mjR7wX4S8XpZzchNLIjSvbAVIO7acTF3pMewgtFJL4sBBGN7FK5GHAle3
	HlSUo5/4iG3ocjcaWkgRvPJn6KFdQ1q/8Wba6ZRNOBSZm74rHJU86sixscR/jXFII+id
	ZohFh+Mgn5App4OtALYRlT4v6QsnOpFZxRrbXwxh96I0P852UofGkNnnP7JilLRFUiul
	9uqd+mjVfxvEAvnUbRCBttlB0vd2K6d6gvP1vbc0dEZ3+L/BE1FikGX8mXOPkg/Lr4QZ
	BTY+cMZUY/yZJk53a+xkzTLYTfWrybpQCsj+r+kvrpKVPtmlGYN2AG9sVjA6t+JJytBW
	imcg==
X-Gm-Message-State: AOAM532kUyCL/RYBMuXgOj2ry1ob9BJHgNGcng18VSEzW0XOjYT4RWlB
	0IOnLlxFgUPiLS6VyMt77+E4QQ==
X-Google-Smtp-Source: ABdhPJx4iEqRVx0UYHNWmCsD+TyENa6eI371zCRXDpzmOeUxqwxElMjClu5sD5U5KsnYAkRAOFD2jQ==
X-Received: by 2002:a05:6a00:1341:b0:4fa:a3af:6ba3 with SMTP id
	k1-20020a056a00134100b004faa3af6ba3mr5477176pfu.51.1648734796931;
	Thu, 31 Mar 2022 06:53:16 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	g12-20020a056a001a0c00b004e1307b249csm28124173pfv.69.2022.03.31.06.53.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Mar 2022 06:53:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220331134236.776524-1-christoph.boehmwalder@linbit.com>
References: <20220331134236.776524-1-christoph.boehmwalder@linbit.com>
Message-Id: <164873479584.41813.11247014171124549054.b4-ty@kernel.dk>
Date: Thu, 31 Mar 2022 07:53:15 -0600
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] MAINTAINERS: add drbd co-maintainer
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

T24gVGh1LCAzMSBNYXIgMjAyMiAxNTo0MjozNiArMDIwMCwgQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IHdyb3RlOgo+IEluIGxpZ2h0IG9mIHRoZSByZWNlbnQgY29udHJvdmVyc3kgc3Vycm91bmRpbmcg
dGhlIChsYWNrIG9mKQo+IG1haW50ZW5hbmNlIG9mIHRoZSBpbi10cmVlIERSQkQgZHJpdmVyLCB3
ZSBoYXZlIGRlY2lkZWQgdG8gYWRkIG15c2VsZgo+IGFzIGNvLW1haW50YWluZXIuIFRoaXMgYWxs
b3dzIHVzIHRvIGJldHRlciBkaXN0cmlidXRlIHRoZSB3b3JrbG9hZCBhbmQKPiByZWR1Y2UgdGhl
IGNoYW5jZSBvZiBwYXRjaGVzIGdldHRpbmcgbG9zdC4KPiAKPiBJIHdpbGwgYmUga2VlcGluZyBh
biBleWUgb24gdGhlIG1haWxpbmcgbGlzdCBpbiBvcmRlciB0byBlbnN1cmUgdGhhdCBhbGwKPiBw
YXRjaGVzIGdldCB0aGUgYXR0ZW50aW9uIHRoZXkgbmVlZC4KPiAKPiBbLi4uXQoKQXBwbGllZCwg
dGhhbmtzIQoKWzEvMV0gTUFJTlRBSU5FUlM6IGFkZCBkcmJkIGNvLW1haW50YWluZXIKICAgICAg
Y29tbWl0OiBkYjBhMTU1MDQwN2U5YmIyMjdhMzFjZTdlMmY3NzQ4OTk4NmY0N2UwCgpCZXN0IHJl
Z2FyZHMsCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
