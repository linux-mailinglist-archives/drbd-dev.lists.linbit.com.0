Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C04904F12B8
	for <lists+drbd-dev@lfdr.de>; Mon,  4 Apr 2022 12:09:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A60D8420372;
	Mon,  4 Apr 2022 12:09:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61271420332
	for <drbd-dev@lists.linbit.com>; Mon,  4 Apr 2022 12:09:15 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id b15so10423044edn.4
	for <drbd-dev@lists.linbit.com>; Mon, 04 Apr 2022 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=ORm7IEBhnE2whN6dFEeIM9GRceZWora10T4zNnlPwD0=;
	b=dq/Q0yNyookqIqWLL1mbsAP5y+ehqLOz4Xe2poFaTKCEmLA7+boLhXgWXyvaPz+DqW
	3fSwdLC7oEUlvl3oXPSA+jb65XPElLuE7pmBm6XxxjKy+N5RRD5oVnqzqoncxMHqHuI7
	ZZkBpt3MNOfoCJhvjmDXsje2NI9bgS0OcgZS76J3pxdgpITw8J+2j7Xt6DkpFoJWX1QB
	qVtR3k3m/GLi2E454fajVHtGdFC/WFk9SP1wqMpFcWc2USbYyAr49iA5FlBtDAgF+MlQ
	MHnewTR7gDKn1xpLpJS89eSunFslrIynkb/FvsEGCZv3b4xZMMA7ivYj9QzISp8T5Q3M
	suIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=ORm7IEBhnE2whN6dFEeIM9GRceZWora10T4zNnlPwD0=;
	b=P9YeZ7fs2wEokdWU4X5IPofeVF9DW74dgnIYSq8z5GLgqT9DavvBtR2+SLersKLAw9
	PSCSXnxScqRdWdGh0G9qxI2CpbsBkpybpoDovNiceab86/vsvX1YJ3tpyGOsZsUDFeF8
	8dLxZWmho+EYBl/oOEKE5em3p0kGN5KOcLgpwFEomjLWvYZgkSXlHbjGICRDyRhCP0m9
	kc9p2wBBnX+VqhkEnMRhlXpOKlx4wNTFkTnG5S/ICM3B06GQyUed3/geqV9dVehqQcDG
	T4aLJic3BFLEKchwfpiGoQjesCafOBNUgmBwiNRd8etWqWhDz+3fe2SK66mD59DCDQy9
	fA/A==
X-Gm-Message-State: AOAM532q2JaqlR+LskoKk8mem+RkVGGbenC0Xl1bL+Yt2fvlBrd8ff1R
	VrTp48XylYVWWbRZsmWqGkrzu8GY
X-Google-Smtp-Source: ABdhPJwX7lzYCamvN0+upaYm7/Lq6+W8sbYskyV64EstO8xeM/cNpVU9qYYWx98JUFHBVHf7wLyjjA==
X-Received: by 2002:a05:6402:2707:b0:419:5b7d:fd21 with SMTP id
	y7-20020a056402270700b004195b7dfd21mr32453301edd.51.1649066954876;
	Mon, 04 Apr 2022 03:09:14 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	og13-20020a1709071dcd00b006e7fdf0a687sm282708ejc.76.2022.04.04.03.09.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 04 Apr 2022 03:09:14 -0700 (PDT)
Message-ID: <3fcfce19-ccb9-28ae-28de-2e62c12bcd23@linbit.com>
Date: Mon, 4 Apr 2022 12:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
References: <20220331134236.776524-1-christoph.boehmwalder@linbit.com>
	<8dbb5fc7-7170-d190-ba24-2ef13dc73623@kernel.dk>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <8dbb5fc7-7170-d190-ba24-2ef13dc73623@kernel.dk>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QW0gMzEuMDMuMjIgdW0gMTU6NDggc2NocmllYiBKZW5zIEF4Ym9lOgo+IE9uIDMvMzEvMjIgNzo0
MiBBTSwgQ2hyaXN0b3BoIELDtmhtd2FsZGVyIHdyb3RlOgo+PiBJbiBsaWdodCBvZiB0aGUgcmVj
ZW50IGNvbnRyb3ZlcnN5IHN1cnJvdW5kaW5nIHRoZSAobGFjayBvZikKPj4gbWFpbnRlbmFuY2Ug
b2YgdGhlIGluLXRyZWUgRFJCRCBkcml2ZXIsIHdlIGhhdmUgZGVjaWRlZCB0byBhZGQgbXlzZWxm
Cj4+IGFzIGNvLW1haW50YWluZXIuIFRoaXMgYWxsb3dzIHVzIHRvIGJldHRlciBkaXN0cmlidXRl
IHRoZSB3b3JrbG9hZCBhbmQKPj4gcmVkdWNlIHRoZSBjaGFuY2Ugb2YgcGF0Y2hlcyBnZXR0aW5n
IGxvc3QuCj4+Cj4+IEkgd2lsbCBiZSBrZWVwaW5nIGFuIGV5ZSBvbiB0aGUgbWFpbGluZyBsaXN0
IGluIG9yZGVyIHRvIGVuc3VyZSB0aGF0IGFsbAo+PiBwYXRjaGVzIGdldCB0aGUgYXR0ZW50aW9u
IHRoZXkgbmVlZC4KPiAKPiBDYW4geW91IGdvIG92ZXIgdGhlIG9uZXMgSSBhbHJlYWR5IGxpc3Rl
ZD8gVGhhdCdkIGJlIGEgZ29vZCBzdGFydC4KPiAKCldlIGFyZSBnb2luZyB0aHJvdWdoIHRoYXQg
bGlzdCAoYW5kIG90aGVycykgaW50ZXJuYWxseSBub3cgYW5kIHJldmlld2luZyAKdGhlbS4gSSB3
aWxsIHByZXBhcmUgYSBwdWxsIHJlcXVlc3QuCgogICBDaHJpc3RvcGgKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
