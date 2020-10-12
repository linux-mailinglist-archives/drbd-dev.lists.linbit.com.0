Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C656828BBDF
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:29:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A21D84203D9;
	Mon, 12 Oct 2020 17:29:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 174F0420383
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:27:33 +0200 (CEST)
Received: by mail-ej1-f66.google.com with SMTP id h24so23742443ejg.9
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Tp6nVgbPv/1Ycp31iuGFGdAHDRrVzi/gboKamZ+EFgY=;
	b=A0AJ/WgLGj5TcDY3/y04jjOXfTYHwM/cA5peSZuQ4Z7AKtAuzEunqh6kwdyk6AHYM3
	vUmuv2z6ly7G5wMXeD7MKc5iUu85Pfl8mUxlYY/ZwJ6nuGgBEie7yRfxHQuMWO/hS8Jl
	zh61kolt/mSR729yYHwydlAVhGVer7XP/kV7NkhR4mmqi5+bkm5fuuI9ozmgLkXjAmQN
	aFdEgi4sLolx9UIYzVuecyp7CDoBunXSljT4m4StA9Pdqf7juTkWWG3q2QF7sWM+z2/U
	qEgSI2lo6fcFvHcUV629HUKziGd2Xi8kIy+j5ZkDqFWk6tVJC/1NiUEh/Da0qv1MTJ4r
	/G9Q==
X-Gm-Message-State: AOAM532BicQw7Rn+ATWRh8cRsd3q4XB5sdKVzkXTjCA6o7EibIGT1dJ5
	YG33xjRlpmlhxMsINTrLe5Ya1aavuXlNhbn8
X-Google-Smtp-Source: ABdhPJyiDzTNjDuEJNRU8sRVEg8PeqIkSzlR8mFG4WmvtJpLh3pRLWQNrfSbwi4c+XCvaZeI3D1RjA==
X-Received: by 2002:a17:906:494:: with SMTP id
	f20mr28189953eja.285.1602516392672; 
	Mon, 12 Oct 2020 08:26:32 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	j24sm10354185edq.29.2020.10.12.08.26.32
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:32 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:30 +0200
Resent-Message-ID: <20201012152630.GH2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
	[83.223.95.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1354F4202AD
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 02:54:10 +0200 (CEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 66ABA30000F41;
	Mon, 12 Oct 2020 02:54:10 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4FCCFA0706; Mon, 12 Oct 2020 02:54:10 +0200 (CEST)
Date: Mon, 12 Oct 2020 02:54:10 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Elimar Riesebieter <riesebie@lxtec.de>
Message-ID: <20201012005410.GA28362@wunner.de>
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
	<20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
	<20201011185117.GA18543@wunner.de>
	<20201011193048.rfe5qvuba2ovrwed@toy.home.lxtec.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201011193048.rfe5qvuba2ovrwed@toy.home.lxtec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument
 was removed in v5.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Sun, Oct 11, 2020 at 09:30:48PM +0200, Elimar Riesebieter wrote:
> * Lukas Wunner <lukas@wunner.de> [2020-10-11 20:51 +0200]:
> > The patch worked for me with v5.3.
> 
> Did you build with brdb master? I used tag 9.0.25-1.

The patch is meant to be applied to the drbd-9.0 branch where all
development seems to happen.  It also applies cleanly to the
drbd-9.0.25-1 tag.

I'm afraid I cannot reproduce the issue you're seeing with your
DKMS package on v4.19.  Using tag drbd-9.0.25-1 and v4.19.95,
the call to __vmalloc() is correctly patched in drbd_bitmap.c
but the build fails for a different reason (conflicting types
for blkdev_issue_zeroout()).  Doesn't look like 4.19 is well
supported.

If you're unsuccessful debugging the build failure on your own,
maybe you can upload your drbd build directory somewhere so I
can take a look.

Thanks,

Lukas
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
