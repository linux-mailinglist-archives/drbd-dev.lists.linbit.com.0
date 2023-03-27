Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE76CAE89
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Mar 2023 21:26:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6AABB420966;
	Mon, 27 Mar 2023 21:26:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C3C14202E9
	for <drbd-dev@lists.linbit.com>; Mon, 27 Mar 2023 21:26:41 +0200 (CEST)
Received: by mail-il1-f179.google.com with SMTP id e6so5167512ilu.9
	for <drbd-dev@lists.linbit.com>; Mon, 27 Mar 2023 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679945200;
	x=1682537200; 
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=m22IOmYO648upgKA8FIcZBXwHFb4PsyxR8+W0WlIGww=;
	b=RiknIdyiWcZWnkIIkiOglicslJMzjPhVeGaVim1BrZZ9d94WZXBVfsGXQz9TdsbEuq
	CxZ9Cy1ubRrPrJ9L/7y1gRC745EoV/0T9SFNum1USDjTb60fcq1bEV+4RGHHXPRImVYO
	qt5aElyt2L35i0rsTOKSDWMsKLH9jmTyrp6xMr03bzCTXIHfayggLIzCsphA06j3Qe47
	EteAjoDfpaiJUvCUV1WXOb04nsv4Rsmdmx9T77DQaxXJ71WBjqjejCkFlrYQwCG3xpcM
	6VKIBuO6HMstop/bVFTJw6q/qWTYgx1H6BD6m9DKHibR3nph0YJE0vijbGP1rvHNVIpr
	E+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1679945200; x=1682537200;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=m22IOmYO648upgKA8FIcZBXwHFb4PsyxR8+W0WlIGww=;
	b=uv6ZQin9D5Q+gPLVntQ0p5yieks+APO0Ay5toVWqb+o50C5Ma1r3ZOe/dSleRgLdA2
	TxogbRauivWJ0/36E+BrPtkWABPfMR+eh+ds75f/ztXzKnsGJpsYYpfFQKvI0hHxSwAe
	T3Uw76vhlEhhn9syBK9uaYPLSP5CswMg1jotScYeZZLeascoqTnOEe9A2S/gxDy73Yhh
	jvQkYWee4wKFyofAT3NaQ9cOYI8pUkGK+HuRBuRpiyYeUCMU1twzUs889TiLKcGRzKvk
	qqJ88e3phDTeWbb1QkG+4QOLfdXMdKTg5/Xgu4US4JwnrsLDRPf7CD9/QKw98DwMRkCx
	6VRw==
X-Gm-Message-State: AAQBX9cV3KvZhEOkQ4MRP74M75Y546jOnW8/rDVGqcrXlismLwYBzFZq
	URE/JDH9v5woQ3Iamn9F9jfiJA==
X-Google-Smtp-Source: AKy350bKFm46lxLr131DpMPhTEYIe8HyBOaDLSJqY/PpHTB+bEeW1OC5kYpFgf6NM+wBY+QyLHyKsQ==
X-Received: by 2002:a05:6e02:b43:b0:317:94ad:a724 with SMTP id
	f3-20020a056e020b4300b0031794ada724mr7897223ilu.2.1679945200604;
	Mon, 27 Mar 2023 12:26:40 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	w4-20020a056e021c8400b003230864f757sm7846593ill.68.2023.03.27.12.26.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Mar 2023 12:26:40 -0700 (PDT)
Message-ID: <e5b78f91-122a-0b0d-8d3f-922d462ba44d@kernel.dk>
Date: Mon, 27 Mar 2023 13:26:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
Content-Language: en-US
To: Joel Fernandes <joel@joelfernandes.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20230315181902.4177819-1-joel@joelfernandes.org>
	<CAEXW_YQehT7Zj0G4nBj-0b+Ndq_FTxFzxQ-WYnBGJ=87wPBHYw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAEXW_YQehT7Zj0G4nBj-0b+Ndq_FTxFzxQ-WYnBGJ=87wPBHYw@mail.gmail.com>
Cc: linux-block@vger.kernel.org, "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 01/14] drbd: Rename kvfree_rcu() to
 kvfree_rcu_mightsleep()
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

T24gMy8yNi8yMyA2OjI34oCvQU0sIEpvZWwgRmVybmFuZGVzIHdyb3RlOgo+IE9uIFdlZCwgTWFy
IDE1LCAyMDIzIGF0IDI6MTnigK9QTSBKb2VsIEZlcm5hbmRlcyAoR29vZ2xlKQo+IDxqb2VsQGpv
ZWxmZXJuYW5kZXMub3JnPiB3cm90ZToKPj4KPj4gRnJvbTogIlVsYWR6aXNsYXUgUmV6a2kgKFNv
bnkpIiA8dXJlemtpQGdtYWlsLmNvbT4KPj4KPj4gVGhlIGt2ZnJlZV9yY3UoKSBtYWNybydzIHNp
bmdsZS1hcmd1bWVudCBmb3JtIGlzIGRlcHJlY2F0ZWQuICBUaGVyZWZvcmUKPj4gc3dpdGNoIHRv
IHRoZSBuZXcga3ZmcmVlX3JjdV9taWdodHNsZWVwKCkgdmFyaWFudC4gVGhlIGdvYWwgaXMgdG8K
Pj4gYXZvaWQgYWNjaWRlbnRhbCB1c2Ugb2YgdGhlIHNpbmdsZS1hcmd1bWVudCBmb3Jtcywgd2hp
Y2ggY2FuIGludHJvZHVjZQo+PiBmdW5jdGlvbmFsaXR5IGJ1Z3MgaW4gYXRvbWljIGNvbnRleHRz
IGFuZCBsYXRlbmN5IGJ1Z3MgaW4gbm9uLWF0b21pYwo+PiBjb250ZXh0cy4KPj4KPj4gQ2M6IEpl
bnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KPj4gQ2M6IFBoaWxpcHAgUmVpc25lciA8cGhpbGlw
cC5yZWlzbmVyQGxpbmJpdC5jb20+Cj4+IENjOiBMYXJzIEVsbGVuYmVyZyA8bGFycy5lbGxlbmJl
cmdAbGluYml0LmNvbT4KPiAKPiBKZW5zL090aGVycywgYW55IGNoYW5jZSBmb3IgYW4gQWNrIGhl
cmU/CgpCZWdydWRnaW5nbHktYWNrZWQtYnk6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4K
Ci0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20K
aHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
