Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF14ECBD9
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Mar 2022 20:24:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2D13A4205F5;
	Wed, 30 Mar 2022 20:24:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 503F74201B8
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 20:24:49 +0200 (CEST)
Received: by mail-il1-f181.google.com with SMTP id x9so15112596ilc.3
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=JFFSehnkNeo1K8L02V2cW9CThdS75MCRvOKla3KLkAw=;
	b=BFTCzD4aFvt9JrLiEz1bvzh6geIg6IptVTdj6IDiPuICAE203wQz9TEb+4sd+GuDm8
	7hfsvwiWBq0a8G/L8JH1EJb4H5BgYFm066eNM++IJprdbaiP/K/RQcVNoIdok+4Buz0n
	VPAQxsddsYW6lxBAvrCd3pw/AsU0VWg+XQ9+f+uSiaJkninfGHo8tQFy0F2WQL/CkiPX
	978UdPWCEqFU5zNcqpfpYI+hbpzYnlekkvQ4l365jJLsdpHWW1qs4vwF10T/u8GEeEZH
	VfPeDuk7IqzhfjQL+dK96hTc4fToK+0EsQR50pC8XTuJ0494LDj5KpiHUMlEIVaBIuzm
	wOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=JFFSehnkNeo1K8L02V2cW9CThdS75MCRvOKla3KLkAw=;
	b=QX1vaReTS9TGAF9FG5AAPKLaSOlUI93UF4G97QD5EpF98zEnQVYPldl7BR2c9ypNBt
	faRK+1bTHILOzK/xsZHrn+2P403zfaMBlwq7aZ48lHihinODrIDOPiTLExteU9E6Txj4
	KqCEejM67vOzHqBY8sAVyhY5w9q1r5qrcb+Xvr66E7703kZV8BqjDveDZxCSXKfzHWi7
	wXWUtJ938klup9kEuPQIMGQ322mFhEBluHbEwIC2qqoW5+mE3sdPDEX2xvpHU6HY6vvb
	gF12floAOzMVOXsU1xfpIB+gIFiaHHH9x8N6y3jKFawtPHWORG1c85iDLXKUsvpRlK2u
	3hCg==
X-Gm-Message-State: AOAM532ZG7PvYJ9TvTs3K8UL2VKpCdougvb7aEMLmHeOYybKD4D6eelZ
	BWr7B3lykLXb8KlR+vAhYVWD+A==
X-Google-Smtp-Source: ABdhPJwUvZiBYV6AGjovRlQg5dfR2IK8vL/m8lnPjq8KMhvUK1WpCP4kEeYA48hTsQvWDg7IrHos5Q==
X-Received: by 2002:a92:cbc3:0:b0:2c6:78fa:41e9 with SMTP id
	s3-20020a92cbc3000000b002c678fa41e9mr11278289ilq.112.1648664688212;
	Wed, 30 Mar 2022 11:24:48 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	i81-20020a6bb854000000b00649c1b67a6csm11564038iof.28.2022.03.30.11.24.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 30 Mar 2022 11:24:47 -0700 (PDT)
Message-ID: <0dc208a9-22f2-6758-e776-752ff81e2b19@kernel.dk>
Date: Wed, 30 Mar 2022 12:24:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Philipp Reisner <philipp.reisner@linbit.com>
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
	<CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
	<f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
	<CADGDV=WN2TFR6dO7ZdiQ2ijPjs+7HSsvk0ZCHsHj6ZG5t-oEdA@mail.gmail.com>
	<3c42b1ed-7c03-64e6-409e-e92247288cac@kernel.dk>
	<CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
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

On 3/30/22 9:23 AM, Philipp Reisner wrote:
>>> Jens, my intention is to keep it in-tree, and at some point update it.
>>> Regarding your questions:
>>
>> That'd be great, but it's been years since there was any significant
>> updates to the in-kernel drbd... I would strongly suggest that the
>> in-kernel be brought closer to what people are mostly running, as it
>> stands it's basically unmaintained.
> 
> The changes we worked on over many Years in the more recent drbd-9.x
> branches are just too fundamental to do them in small chunks, we could
> upstream bit by bit.  We need to get that reviewed in a big series.  If I

Your development model is fundamentally broken. You've allowed your 9.x
branch to totally drift from mainline, which just helps underline my
earlier point on that in-kernel drbd is effectively abandoned and
unmaintained.

> started to dump them on linux-block right away, nobody would look at it
> seriously, since it would be too much.  I intend to get people from red
> hat/suse assigned to do such a review. Then we will do that on linux-block,
> so that everyone who cares sees what happens.

You're just doing it totally wrong. Upstream kernel should match your
9.x branch, and it should have been developed in sync. What you appear
to have done is to ignore mainline, while it would've been correct and
much easier in the long run to ensure that development is regularly
synced to the mainline kernel. You know, like EVERY other driver that is
maintained does.

Now you've got a giant pile of patches, which probably don't adhere to
how we would've done the mainline commits in the first place, and it'll
cause a huge pain for not just you but upstream reviewers. I don't care
about the former, but I do care a lot about the latter. That's a giant
waste of the time of the folks involved on the block side, and
definitely not what a responsible kernel maintainer would do.

From your reply here and earlier ones, seems to me that you don't grasp
the gravity of the situation, which is also worrying.

>> The main discrepancy here is that there are apparently huge numbers of
>> in-tree users, yet no fixes or patches at all making it to mainline.
>> Either drbd is bug free and doesn't require any fixes at all, which I
>> very much would doubt, or fixes aren't being sent upstream.
> 
> It is the broad consent among the users of the drbd-8.4 branch (that is what
> is in-tree), is that it works for its purpose. It is for sure not bug-free,
> but people are not running into bugs anymore. So, call it free of relevant
> bugs, if you want.  No new features go into that branch, on purpose. To keep
> it that way.
> 
> Have a look at that one real bug-fix that was identified in the last Year.
> https://patchwork.kernel.org/project/linux-block/patch/20210426163032.3454129-1-christoph.boehmwalder@linbit.com/
> 
> When do you want to have that reposted to you?
> right now? Just before the next merge window opens?

That can go in anytime, so please do submit it.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
