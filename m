Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E33654EB10B
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Mar 2022 17:52:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 032B4420620;
	Tue, 29 Mar 2022 17:52:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E76AF4201B8
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 17:52:12 +0200 (CEST)
Received: by mail-io1-f42.google.com with SMTP id z7so21492991iom.1
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=9NtXRZP0DYrWCoTLKXqVYrEtOzP8J+6Ei1YBGnCYRsE=;
	b=wCSJ2RWIKFAo7QsFAVi6ZWOvSkSRf5ZKLSOUpBb9nQkzdcrMK8gOq9wpt8YxhDqXDF
	DDkkq+RCP19Sm1wge4VwYyJ7Jx60NeJpfsMHoxpjUDTTQLqiUGD/KxjennUi2i92fiS6
	Fxtgzrj661RrvkbhfG7k6NuaE7l7LICC21hZKUaSLD+Za7l9WUvZpaOXAwtkF18HOlKQ
	GDmv32qyNMzsOc9yYAh8sqaPyx5XWJio+BcVuJat4MR0UeIoolyK0ELfaTv/54ffE29u
	8HPpSs6egTIFH+cEqdBNZPR6X5Z2k5dO4D/1R6sLdG3bhFDGWuIlffI7WrBPGb1x1KlV
	/uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=9NtXRZP0DYrWCoTLKXqVYrEtOzP8J+6Ei1YBGnCYRsE=;
	b=wG8MdNmCkD+4WkxPMqYUIjxJfrbVEnk47kpS++cGwOalDSqN97m/7T3ZA77vfEVltG
	R1XjS0/p1OOzoawSJ+HweQeU8EzLjbzbEZ7oKu4tq9lPM/yUdUwecw1/xA8WE8LSFPVC
	XVbYtRWk3frsgS5r/ixSIfFn4Gpa/GrZn6G4G3GXqTtM7qBy71r+PKjuo2ws6AQZbcKP
	CD3P4hFxsa9URlvXVcA8FhXXKvh7SYZXLxXoM/AC/fQeqTyRkHYd6QL82CQD+Ur39TYE
	Ovp44Y4TuCX8rbZozkSPPqQyJNjOi6MVyeiZu4mR1XN9WMmWali804zV3tSAyE/z1Dd5
	v22g==
X-Gm-Message-State: AOAM5317jidmad/6p6kaODXbRgGUV+1/GjtbmjvdroliL7yUZzSAsejZ
	qOpa6Q5opxc/7qyiGYOZGL4QdA==
X-Google-Smtp-Source: ABdhPJxK5IS/HuiP8JcWwj9DK/HbLT5Wlcg0zY7+VPt8mzJDCkPMc9snfKatO2/yJkfl0axTG6Pdmw==
X-Received: by 2002:a05:6638:13c4:b0:31a:886a:625d with SMTP id
	i4-20020a05663813c400b0031a886a625dmr15382057jaj.211.1648569131699;
	Tue, 29 Mar 2022 08:52:11 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	c2-20020a92cf02000000b002c9ae102048sm4267972ilo.77.2022.03.29.08.52.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 29 Mar 2022 08:52:11 -0700 (PDT)
Message-ID: <3c42b1ed-7c03-64e6-409e-e92247288cac@kernel.dk>
Date: Tue, 29 Mar 2022 09:52:07 -0600
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
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADGDV=WN2TFR6dO7ZdiQ2ijPjs+7HSsvk0ZCHsHj6ZG5t-oEdA@mail.gmail.com>
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

On 3/29/22 9:44 AM, Philipp Reisner wrote:
> Jens, my intention is to keep it in-tree, and at some point update it.
> Regarding your questions:

That'd be great, but it's been years since there was any significant
updates to the in-kernel drbd... I would strongly suggest that the
in-kernel be brought closer to what people are mostly running, as it
stands it's basically unmaintained.

>> - Why aren't the drbd maintainers responding to posted patches? They seem
>>   to simply be ignored, and I'm left to pickup the trivial ones that look
>>   fine to me. In-kernel drbd appears largely unmaintained, and has been for
>>   years.
> 
> The team here has grown, we are busy. Since you started to pick up the
> trivial patches yourself, I thought it is not necessary that I collect
> them and send a pull request in merge-window time.

That's just one part of it, the fact that the out-of-tree drbd has been
drifting further and further away from the in-kernel one is a big
problem. For trivial patches, I have no issue picking them up. But
silence on your side is not very helpful. Please review and ack patches.
If I see it acked, then I can easily pick it up.

>> - Even if out-of-band communication is used for in-kernel users of drbd,
>>   that doesn't result in any patches or fixes that should go upstream?
> 
> This one:
> https://patchwork.kernel.org/project/linux-block/patch/20210426163032.3454129-1-christoph.boehmwalder@linbit.com/
> (relevant to users that have DRBD on top of md raid)

That's a single patch, from a year ago. Not a strong counter point,
looks more like it's proving my case...

>> - If there's zero activity for in-kernel drbd, all users are using the
>>   out-of-tree version?
> 
> There are users of the in-tree version, some with huge fleets.
> Some do not need the newer out-of-tree DRBD, and the in-tree version is a
> lot easier to compile. You need coccinelle for the out-of-tree version,
> and that can already be a hindering barrier for some.

The main discrepancy here is that there are apparently huge numbers of
in-tree users, yet no fixes or patches at all making it to mainline.
Either drbd is bug free and doesn't require any fixes at all, which I
very much would doubt, or fixes aren't being sent upstream.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
