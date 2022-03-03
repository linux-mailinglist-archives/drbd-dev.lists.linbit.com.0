Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 797224CC056
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 15:49:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 686764217A8;
	Thu,  3 Mar 2022 15:49:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CCA0442179D
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 15:49:46 +0100 (CET)
Received: by mail-ed1-f49.google.com with SMTP id w4so4403199edc.7
	for <drbd-dev@lists.linbit.com>; Thu, 03 Mar 2022 06:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IQjVRiRy4c9jIh4S1Ufiz+FcO3tGme0RXIPV+Ov5R88=;
	b=EQdJDzX7NFx14kL8xqT702212BvVbZJpWWokIRXjVnhTyHeCrnBE7B7lEoL18+gEYD
	M3mKOO09/tmQqUxX1EMtZnHer479xBWbYHxTaVQZ3YR9mbWzrww9FU4hSuR075gGA6s0
	v4xlntKVirqILvLUr8XdVcN9YdebJlUHHXHvEbqhEL3USNWbjom6Z4PXfkTriUB4CIgi
	FTijWrdp7q4Ljkk1KYnRzy9RnUhzMS95JuKsTvmDZx20R+Pil74ShK02YTKeEzEoBiY7
	i0DMRV5pNvJYJszjmeh1of5k7oLEElNbxeqldYS8jjZcFR8zHpWaAfLTlSr+yKfxUF4E
	EIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IQjVRiRy4c9jIh4S1Ufiz+FcO3tGme0RXIPV+Ov5R88=;
	b=FNKoyqX5ZEaZDjf7WxLHb8PY90zgUgED2pGYTwU/2GSq4CZ+ZQ0i7buVipOTiq2xUR
	WqB5p6Mqz1DAfuV/ouHLy8Wwm70L9gOTeWzcz1zkm/A2KtpZoYx/hiUOB3WHO6fUHDJ7
	rA8bWOQfFjD0bSarSJ0NPvRR84TzMwj2+3WQi2eDYFDEdHffITfr4PAfYcM7dSJznxVs
	ZgkuSphpoO0ZPH0Rigcapvtb6tMmlVh1qsffmQqMActK55+QYOYn8YEetr2xoClapLw0
	s2fr3emPvYHDd59s8SoKrvJGx1b6CdFLl6Di7ZozQ7X5U+c6yHip04Kx/bS/TpaT56nh
	hTiw==
X-Gm-Message-State: AOAM532QznCBnoUKflFPgZVuPCKnH+ntiDSUkax7EIByd7sT/hUP2vpp
	18mMQUxMZAeGQovAC3kmZyOqqePWCm/oisH6sIc=
X-Google-Smtp-Source: ABdhPJxC3/F/nITnZ/dqhO7GQgKGUK3h0VPxhHt7adLIhtss+vOHVIU3L0u1AGN7d9ozXDr2PI4BaDWp2YreGH6K+2o=
X-Received: by 2002:a05:6402:492:b0:404:c4bf:8b7e with SMTP id
	k18-20020a056402049200b00404c4bf8b7emr34256179edv.318.1646318926214;
	Thu, 03 Mar 2022 06:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20220303111905.321089-1-hch@lst.de>
	<20220303111905.321089-2-hch@lst.de>
In-Reply-To: <20220303111905.321089-2-hch@lst.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 3 Mar 2022 06:48:34 -0800
Message-ID: <CAMo8BfKgtEVU2qpu3BQqQB7cxtPzF-Hmuifr4xEhe0TRiyJ=WQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	Justin Sanders <justin@coraid.com>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>, Vishal Verma <vishal.l.verma@intel.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/10] iss-simdisk: use bvec_kmap_local in
	simdisk_submit_bio
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

On Thu, Mar 3, 2022 at 3:19 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  arch/xtensa/platforms/iss/simdisk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
