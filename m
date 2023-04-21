Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFC6EB4A6
	for <lists+drbd-dev@lfdr.de>; Sat, 22 Apr 2023 00:25:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F3F054252BF;
	Sat, 22 Apr 2023 00:25:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3FE054252B9
	for <drbd-dev@lists.linbit.com>; Sat, 22 Apr 2023 00:25:01 +0200 (CEST)
Received: by mail-pl1-f174.google.com with SMTP id
	d9443c01a7336-1a7111e0696so5461755ad.1
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 15:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682115900;
	x=1684707900; 
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=wtOk22wHsRTIJLakW5pQsLDvU50er+NeXN7SxTWy9qk=;
	b=oerIEMuVGMo3tf7ainFnGShOU4ymhQn2JIZkQ5ZB4LQezPNmDezHZ74CsaeAZJQpD6
	fBOri4QsdRMaGb2stkX1WSwEZwfrNh9aQZWqyNJoXurA5LawSG0y1G2Xv1oUcyhDfcMp
	9sbYCkZuE9eli+qnK9IsSiSsdVJHCJSw/W3sMGWPje4NFX463I+v+t7Es1rrOVfCvCrD
	U9gO5mnakr3a3I+Qu1a4NVVPqGjSfvWoKTJthz4c4dgYea4zYEHowFeYEbZOiF95SR+K
	Jq4c5WzqI8i0UVXC3OJDP1Rl9oKvaB8DuqRz1pK4f1u8wkRZdFtR2Oi36akQy0CVWjt4
	77tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1682115900; x=1684707900;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=wtOk22wHsRTIJLakW5pQsLDvU50er+NeXN7SxTWy9qk=;
	b=hZE5/A6H8YkQeN65yK4isyiM2BWLYCthxdeEwdiZZtuDlaca4UXKpsrxloujicEN6x
	4HyeYvo4+pAvkVFOUteLUpGNPlvVG5Tit/8ggidRYyzNJcyhweHdK4kGR2U/JpVYKKWE
	Mf5UFzU0GUROBkrqyjNrxo/UjhnE2Cboa4MvH183c6hp/ROtZA0anm+Q69QzdwGUVauB
	2ccIFxWs1GPwfSjDkGxoUqvmKiuSdBU3KlltX+Rtrsa9F7VSWREniPZ1y4L4MhQRc1/C
	r1BMnbFjw8d+vqvNZpMtmPINbeKpEDWgT2VAXHoNMtzypqXTPn3/X4n0J95wHPbAOP4o
	qOgQ==
X-Gm-Message-State: AAQBX9eoqxOnygzY61E1L3BCd4EC/XPgwjzpJgGXsMr99fko7NcAQrN0
	bn+guIBz6epOiSYeQB6ONLEKEw==
X-Google-Smtp-Source: AKy350ab5zsgqMFX9gmLPlFbJI6JNwFXd5UcuHSryHmhAdUudcIDmmGg6bERrDL3LQkvBwimuDuVEg==
X-Received: by 2002:a17:902:c94f:b0:1a2:1a52:14b3 with SMTP id
	i15-20020a170902c94f00b001a21a5214b3mr7699856pla.4.1682115900155;
	Fri, 21 Apr 2023 15:25:00 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	jn15-20020a170903050f00b001a945e7147asm1657335plb.231.2023.04.21.15.24.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 21 Apr 2023 15:24:59 -0700 (PDT)
Message-ID: <47688c1d-9cf1-3e08-1f1d-a051b25d010e@kernel.dk>
Date: Fri, 21 Apr 2023 16:24:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, Matthew Wilcox <willy@infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
	<ZELuiBNNHTk4EdxH@casper.infradead.org>
	<ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
Cc: p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	da.gomez@samsung.com, djwong@kernel.org, snitzer@kernel.org,
	philipp.reisner@linbit.com, kbusch@kernel.org,
	patches@lists.linux.dev, hch@infradead.org, dm-devel@redhat.com,
	hare@suse.de, linux-fsdevel@vger.kernel.org,
	lars.ellenberg@linbit.com, linux-xfs@vger.kernel.org,
	senozhatsky@chromium.org, linux-mm@kvack.org, agk@redhat.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/5] iomap: simplify iomap_init() with
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

T24gNC8yMS8yMyA0OjAy4oCvUE0sIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6Cj4gT24gRnJpLCBB
cHIgMjEsIDIwMjMgYXQgMDk6MTQ6MDBQTSArMDEwMCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4+
IE9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDEyOjU4OjA1UE0gLTA3MDAsIEx1aXMgQ2hhbWJlcmxh
aW4gd3JvdGU6Cj4+PiBKdXN0IHVzZSB0aGUgUEFHRV9TRUNUT1JTIGdlbmVyaWMgZGVmaW5lLiBU
aGlzIHByb2R1Y2VzIG5vIGZ1bmN0aW9uYWwKPj4+IGNoYW5nZXMuIFdoaWxlIGF0IGl0IHVzZSBs
ZWZ0IHNoaWZ0IHRvIHNpbXBsaWZ5IHRoaXMgZXZlbiBmdXJ0aGVyLgo+Pgo+PiBIb3cgaXMgRk9P
IDw8IDIgc2ltcGxlciB0aGFuIEZPTyAqIDQ/Cj4+Cj4+PiAtCXJldHVybiBiaW9zZXRfaW5pdCgm
aW9tYXBfaW9lbmRfYmlvc2V0LCA0ICogKFBBR0VfU0laRSAvIFNFQ1RPUl9TSVpFKSwKPj4+ICsJ
cmV0dXJuIGJpb3NldF9pbml0KCZpb21hcF9pb2VuZF9iaW9zZXQsIFBBR0VfU0VDVE9SUyA8PCAy
LAo+IAo+IFdlIGNvdWxkIGp1c3QgZG86Cj4gCj4gCj4gLQlyZXR1cm4gYmlvc2V0X2luaXQoJmlv
bWFwX2lvZW5kX2Jpb3NldCwgNCAqIChQQUdFX1NJWkUgLyBTRUNUT1JfU0laRSksCj4gKwlyZXR1
cm4gYmlvc2V0X2luaXQoJmlvbWFwX2lvZW5kX2Jpb3NldCwgNCAqIFBBR0VfU0VDVE9SUywKPiAK
PiBUaGUgc2hpZnQganVzdCBzZWVtZWQgb3B0aW1hbCBpZiB3ZSdyZSBqdXN0IGdvaW5nIHRvIGNo
YW5nZSBpdC4KCkl0J3MgZ29pbmcgdG8gZ2VuZXJhdGUgdGhlIHNhbWUgY29kZSwgYnV0IHRoZSBt
dWx0aXBsaWNhdGlvbiBpcyBhcmd1YWJseQplYXNpZXIgdG8gcmVhZCAob3IgaGFyZGVyIHRvIG1p
c3JlYWQpLgoKLS0gCkplbnMgQXhib2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRl
dgo=
