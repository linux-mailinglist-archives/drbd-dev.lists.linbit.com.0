Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E494B4EAD25
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Mar 2022 14:29:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CDAEE420620;
	Tue, 29 Mar 2022 14:29:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8112B420192
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 14:29:43 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id t13so13436704pgn.8
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 05:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=tEYwtozV5kisc/HAoJLg2e6AQnfx5UPKwLpWtsEvskI=;
	b=h6qN1hZ/Wy+W4nMvMo+YgmhULsEGKb9vKrt3zQTuX1qu/icKXYYLqymQaN0+Dd52S7
	mk1huIyhDWoZR+n5dGJ+hNuahS4f8R6rwhTZMpxRU3SbojZiXVnGg40V3T4R47SaYYdL
	YitKJDQxXwmD2ZgyXMq4CAFqmLACx27CJHD4Qt60L/2WO10HDzEYIQA27Mnvtu0mV5/p
	iRnclSv1S14Bo6TcZfJ+g1lMMFphPtmY2fkvVVoxLBf1GR7BG0MI14tA5CvGkJnKPHYh
	m4VbaDa5bB1s+1fFLUeZZzRB/h5a3FEw3U+FSaTRZNgSUxfMiGO3nN6tLmNnwaERbt1Q
	Dfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=tEYwtozV5kisc/HAoJLg2e6AQnfx5UPKwLpWtsEvskI=;
	b=g6QXL+OI+MSsg3Et0NFR67CQcYZ7MXNiq9hb/KPvl/N4NS07VFd2iIC9S72xhyIQJH
	Uib2UHPUcsj5qKGDznqfb78ilUCObhRaMy3Yw3cuNDlnGlyEIAy8Prxu1bQRl0SmKDG8
	8zy6i8YdiOEj4f5nQqfpN8kokgRscKE11ePK8dmh9FsGJOhc86RzZWC9LB8qT+UDJsKD
	Eh7sCN8D9VomwYoJSp7bh8Lk0ArvHpWcvNr7bzUOwJKMP9ShCwC0GgvZL7S9yA4/LQK+
	WnU2u+fa+rqVrZsOut3ZcNzUf9sTpo+oYTu8iSeh9H484WC8Dc/Trr1JUe9+69QhPP69
	X4/A==
X-Gm-Message-State: AOAM532xxHbhTk/pnL64bZ5JU8ehzAH4FnEEk1+36iAU68mkXMwMRIpt
	D270BHdf7ePOjY1Y2F/nBuomvA==
X-Google-Smtp-Source: ABdhPJzoQakIPG9Twcvrn4xf/24ThJCflQdfRtNpgJCGfbFPjnk+udG4I5buLv2jOnATPKAA3PnIPQ==
X-Received: by 2002:a05:6a00:3018:b0:4fa:d533:45e5 with SMTP id
	ay24-20020a056a00301800b004fad53345e5mr27557494pfb.13.1648556982245;
	Tue, 29 Mar 2022 05:29:42 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	135-20020a62198d000000b004fa9a8f73casm19843683pfz.99.2022.03.29.05.29.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 29 Mar 2022 05:29:41 -0700 (PDT)
Message-ID: <f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
Date: Tue, 29 Mar 2022 06:29:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Christoph Hellwig <hch@lst.de>
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
	<CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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

On 3/29/22 1:50 AM, Philipp Reisner wrote:
>> The complete lack of bug reports and maintainer interaction usually
>> suggests low to no use and heavy bitrot.  If that is not the case
>> here that's fine, just asking..
>>
> 
> FYI, feature-wise the in-tree DRBD is frozen. Maintenance only. Users,
> seeking advanced
> features switch to the out-of-tree DRBD and use other means of communication:
> Github issues, linbit's community slack channel, last not least
> linbit's ticketing system.
> 
> That is why you see virtually no activity.

I've been thinking the same thing. Even if most users are out-of-tree, you'd
still expect to see at least some reports on the list. A few followup
questions:

- Why aren't the drbd maintainers responding to posted patches? They seem
  to simply be ignored, and I'm left to pickup the trivial ones that look
  fine to me. In-kernel drbd appears largely unmaintained, and has been for
  years.

- Even if out-of-band communication is used for in-kernel users of drbd,
  that doesn't result in any patches or fixes that should go upstream?

- If there's zero activity for in-kernel drbd, all users are using the
  out-of-tree version?

As far as I can tell, drbd upstream is stone cold dead, and has been for
years. Why shouldn't it just get removed? Is it just bait to get people
to use an out-of-tree version?

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
