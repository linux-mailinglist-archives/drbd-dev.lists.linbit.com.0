Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3EC4EC826
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Mar 2022 17:23:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8087A4205F5;
	Wed, 30 Mar 2022 17:23:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
	[209.85.221.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58B004201B8
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 17:23:55 +0200 (CEST)
Received: by mail-vk1-f172.google.com with SMTP id d129so11721693vkh.13
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BLYncbAZMOiJKAipKssMlulVwN4gsXJDU6wQcnVJrcI=;
	b=ZXWqagMRJZx5ZagPoe2qFheb0tGHoohxT6qiA5JHf1K4MEDSLioqew2vwYPmpw0qT0
	dVl7r56RXDAQ1nV9jyghhad4bMzLfEV2w4qkrZhDAit+ZzuL/l6O9YgkNgBe7JqlwIls
	bINQGGfGnUL1z98DHedbHxloKuIamQP6iwtbY9vPpqIOQ1q3qv6W7OWzwImtmxMzjR1Q
	uTQL/JyGXmkUbs0GzRlP6HspkQA2ozIlGB5U7fbtvxicCQLGIX1wBDWFtSjGPKNb+3nZ
	aocqP2D3ncBkxRXq4v2V2jztFUg0K76AD4vRJSMn3JFp+5O9ZA6PNgfnRwoKs+ZFSyx3
	4bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BLYncbAZMOiJKAipKssMlulVwN4gsXJDU6wQcnVJrcI=;
	b=EfA6NGSgeZDReWlndk9MZFQOHAicFPcIRLpJt/GPIIHmLcjYqSt+nRdOHNHOARufmS
	P+A5iW/LTT8+vznWVlVqNp8zBGheEll4q+YWNp+twnCT2rhVdhxT/EOsCez6mXGZJWFB
	4w6DumAVUcmyPsF5Q2mz0TTaClZhisjq8SkZohkk44LrDKK7nyLHI/6Qd8lOr3E0mALJ
	aGSRqsIrTTq28TDgbPA/7x459SovoeV9grKHS1VjRvk+egXm2guU31Spg+LluWxZE5+a
	0YjrMABEpqB4ly6D3qa0FLRx+ja8t7g3liZfSruDjpuWWOtohLCeO4g5o9Ybw+5sKUXU
	DPRw==
X-Gm-Message-State: AOAM5306m4bG7xrr0CHjFvf0YmBm7vK4o/6Fc6aQVT72APIsdWMXz3OK
	D3/Ntn6TcOIZiZqVxDpPk89c5HEZhSKA06OIzF9GYHXg
X-Google-Smtp-Source: ABdhPJyazN6J/DokQyWBzXDLtEfX/3PUb7ZFV2DTUEmghAQI5hs1C+qZwYX9ZfGlyQTOGDTxKDsFVc2cTbaIwVC7gl8=
X-Received: by 2002:a1f:6a82:0:b0:33f:7eeb:5989 with SMTP id
	f124-20020a1f6a82000000b0033f7eeb5989mr21102144vkc.29.1648653835147;
	Wed, 30 Mar 2022 08:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
	<CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
	<f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
	<CADGDV=WN2TFR6dO7ZdiQ2ijPjs+7HSsvk0ZCHsHj6ZG5t-oEdA@mail.gmail.com>
	<3c42b1ed-7c03-64e6-409e-e92247288cac@kernel.dk>
In-Reply-To: <3c42b1ed-7c03-64e6-409e-e92247288cac@kernel.dk>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 30 Mar 2022 17:23:44 +0200
Message-ID: <CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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

> > Jens, my intention is to keep it in-tree, and at some point update it.
> > Regarding your questions:
>
> That'd be great, but it's been years since there was any significant
> updates to the in-kernel drbd... I would strongly suggest that the
> in-kernel be brought closer to what people are mostly running, as it
> stands it's basically unmaintained.

The changes we worked on over many Years in the more recent drbd-9.x
branches are just too fundamental to do them in small chunks, we could
upstream bit by bit.  We need to get that reviewed in a big series.  If I
started to dump them on linux-block right away, nobody would look at it
seriously, since it would be too much.  I intend to get people from red
hat/suse assigned to do such a review. Then we will do that on linux-block,
so that everyone who cares sees what happens.

[...]
> The main discrepancy here is that there are apparently huge numbers of
> in-tree users, yet no fixes or patches at all making it to mainline.
> Either drbd is bug free and doesn't require any fixes at all, which I
> very much would doubt, or fixes aren't being sent upstream.

It is the broad consent among the users of the drbd-8.4 branch (that is what
is in-tree), is that it works for its purpose. It is for sure not bug-free,
but people are not running into bugs anymore. So, call it free of relevant
bugs, if you want.  No new features go into that branch, on purpose. To keep
it that way.

Have a look at that one real bug-fix that was identified in the last Year.
https://patchwork.kernel.org/project/linux-block/patch/20210426163032.3454129-1-christoph.boehmwalder@linbit.com/

When do you want to have that reposted to you?
right now? Just before the next merge window opens?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
