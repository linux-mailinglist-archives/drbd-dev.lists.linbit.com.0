Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKLGBlEYz2mTswYAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 03 Apr 2026 03:30:57 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id AC1A43900C8
	for <lists+drbd-dev@lfdr.de>; Fri, 03 Apr 2026 03:30:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3BE8016313A;
	Fri,  3 Apr 2026 03:30:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B3913160871
	for <drbd-dev@lists.linbit.com>; Fri,  3 Apr 2026 03:30:38 +0200 (CEST)
Received: by mail-oi1-f174.google.com with SMTP id
	5614622812f47-4670464029eso890480b6e.2
	for <drbd-dev@lists.linbit.com>; Thu, 02 Apr 2026 18:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775179838;
	x=1775784638; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=h3AxyKUup9YdgXSTPgEMPKVeyVAoKV82S85oayH+6OY=;
	b=K4YZIBi3xRzutKVN+DuQ1L6ytada37HhGnin6kZWB4/9Ll8mtlNIyNyW6eL4a6DDHT
	vLA/g5JqxLEXjiV0++TOZALg/tW6E8cXap++Yhio315eQDy0qUUl/YdtimDSbJUanbaz
	Apuk3aKiNNRke95Z50Q0CP0e9bMdR4FkkbTzKjBTMiC0MEdApnann7PzYDfRHtHoW+bJ
	zR1hvnDhtKOPQDV0GE9ax2OOTgXu1mTl5xuMBnl/FxT0lzKZ5hig3w6KjtAL3GfLK6Tf
	VhbnT+NxvdaLAR9mPiN+UTDHAPMUxLi3ZhSPLfGeKTDiiCHmsoVU85jsZofXGRQ5CaGx
	oOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775179838; x=1775784638;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=h3AxyKUup9YdgXSTPgEMPKVeyVAoKV82S85oayH+6OY=;
	b=V6oOaY4rhOywSyv5jP7St149rw0+PNCSNfJ6ErqJKW9PMPNVJU0iDINam2ftSPBnKQ
	X7Pd1QymPnVE19TdEbVROMV33RuiSxFjIDF1ZqmEwCp9iKdctOxj5G1vyHiUY8i2zeRZ
	kTUEidQxh1VXfSgU+chBBdjR62R++eTfx5N+3ecxJ7ccgkKu8dmCneIuq+eyW9DryAM9
	CC89q93kwkOIKb4DkZ5dVfa7ys5P/cgaOg2TGC6EKpVbPgzJA2weAnlM1imAMDAb4dcj
	+0/1czab5bshYeWf9JtY440gGhyczU5WZmUdqsIU1yO3D7R6iAa0ItiM1WZUS9d9CMwB
	1QUA==
X-Gm-Message-State: AOJu0YzIFxfCUCXQSXRp/XBVOXX71vJhygBzCM4tDlM1Mk6Gp9ySmPBO
	6CJJ631MLoockX04lkS5Q6VycbaJvdz5O4VmVtYb226Kicze/IZuIERkTHk7sU9RBWU=
X-Gm-Gg: ATEYQzxsy6D9yGmZMtmH9pFhxhFY3dFnD9OMCTBkCKuxl1dBgcsWbXzDwPfa375j0t8
	FDQhF0LfNqnYZ+41Xzchm0H2eHk12Gyop8jsAETl6iuXG2k/E4j5zBZuQ1aYDFZx3u2sp84cA81
	JM32oU0asOluSoFlwzGCrLpTaoan8jY2b3vOehXZ2phHPWHh7vqerARH2AS55KtnTgcrd2gcX7G
	W4Dxw4otxw+PMu1ymk97NQJ1wwYCiBB7n4nKCB9TVKg9kOP7uM9vf5phezheHCFOYhfoahTv0do
	fOLkzfyHChbRuU/UkNbGUh1uh1Am6jjQv7oNGzRhb7BOluYlLBL+2QdhBUk9MWZmreXqCo/pysm
	pfU43AtQyMLpEtfK8U13WMMPTg36DXIISn8Lf3CiqRpZD16o8fr53MuEfRaeUcdRzVjICwetwcA
	JjfsMTR7QQQpj0STvajfGnoI7/SV9SaLcJsLibmAH9D3A/pGJaKZeixtzYLY5dB3lJsjsZ6lQXx
	EVJFLmKgrjq9SuE67Fn
X-Received: by 2002:a05:6808:1508:b0:467:2926:1231 with SMTP id
	5614622812f47-46efadbd14dmr792673b6e.33.1775179837699; 
	Thu, 02 Apr 2026 18:30:37 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	5614622812f47-46d92a552f2sm2740316b6e.11.2026.04.02.18.30.36
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 02 Apr 2026 18:30:36 -0700 (PDT)
Message-ID: <ecf00b4b-c3f8-4161-a97d-3d23b423cabf@kernel.dk>
Date: Thu, 2 Apr 2026 19:30:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] DRBD 9 rework
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[kernel.dk];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: AC1A43900C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 4:38 PM, Christoph Böhmwalder wrote:
> As discussed (context: [0]), here is the first version of our DRBD 9
> rework series, intended for for-next via for-7.1/drbd.

Will you fixup the kerneldoc (nits) and the assigned-but-not-read
issues and send out a new version? Also looks this series doesn't
actually apply to for-7.1/block, patch 12 fails.

-- 
Jens Axboe

