Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D586EC61C
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Apr 2023 08:20:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4BD8B4203CE;
	Mon, 24 Apr 2023 08:20:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CC824252C3
	for <drbd-dev@lists.linbit.com>; Sat, 22 Apr 2023 00:34:24 +0200 (CEST)
Received: by mail-pl1-f176.google.com with SMTP id
	d9443c01a7336-1a66911f5faso23687345ad.0
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 15:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1682116463;
	x=1684708463; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=WOBbV//TmE5/Vt+YNa7VvWoHjH617/cqrLHE/FuEqvo=;
	b=28YtcKiMKTyuPMVw5fu/SoweCi0BqDGeWt7RdFQrVk7PAU917keO+0FEYqTQ9/TsLB
	T1pzM9DhgsBLcc91My2Vu/2jTc0NKv/M54REjAUYDHXH1HKV9Z5I1WFYwId6vQM+JZTT
	E6n5vpXvzeV5sJVZPomczRMqHlEzbnPY63QdhqjDa6gftGLx/sPZUwv2JfprlGFlZtYf
	fkSebmqIvZEolZKw757enRENf4URiSoQqdGQEZOuckafZkYiGfcqGHFj/veTqOAh424T
	Sue6bk+H9d6MxTxRu5J8fCc9HsE6NtJ7Q9mZmdahhGSisRdkO3MgSWcLNMeFOEusAg5H
	JN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1682116463; x=1684708463;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=WOBbV//TmE5/Vt+YNa7VvWoHjH617/cqrLHE/FuEqvo=;
	b=V2vfVLze5OwTVJRQOuGc7AGgc0+5l4UA2ByiE/FPeVU8lixslNjdESBgxfymRHWK4M
	t54t/XZHCdSnuqJ+DhGGFSuxsjA0xWVJe25iTnqdrKfm3y3aERMyLBZvEKXs/P1AZHS7
	EnD4YfjOdiJ6pImEOfRtad7TNqdUC4tltfzs2jMv561stElUeP8M8bMQpXpDwiRa5EuL
	d631y1XNrc8dHUQMSOSYurebcMkPPWAUKOlU7u1ohDP6ilhNZ6F9shrtDvn7K/oNKFVj
	P0JKCta09WePkHXKJVGcVDJhRAtGPPjI1nZZdIJnDDrlBYZD/XRIk6qJql7GQegdV9wF
	a0Mg==
X-Gm-Message-State: AAQBX9dOZT1B6wKA3XveMj8cAJhjFrg8jzJeHCtAhbdzbu5rPUNkw7uZ
	gY+sCHl46hbhjgLjoCOz+DwNlw==
X-Google-Smtp-Source: AKy350Yx4GjX3RRHXL1Mum+601m5ZkYo7MaItZI/8CPJsIZY6IZjMOJMo9Hbi+Mo8ymVreNZtCsXeA==
X-Received: by 2002:a17:902:d4c4:b0:1a6:6fe3:df91 with SMTP id
	o4-20020a170902d4c400b001a66fe3df91mr7801960plg.50.1682116463609;
	Fri, 21 Apr 2023 15:34:23 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-41-174.pa.nsw.optusnet.com.au.
	[49.180.41.174]) by smtp.gmail.com with ESMTPSA id
	v7-20020a1709028d8700b001a6401189a6sm3138777plo.147.2023.04.21.15.34.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Apr 2023 15:34:23 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1ppzKe-006Dta-Ha; Sat, 22 Apr 2023 08:34:20 +1000
Date: Sat, 22 Apr 2023 08:34:20 +1000
From: Dave Chinner <david@fromorbit.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20230421223420.GH3223426@dread.disaster.area>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
	<ZELuiBNNHTk4EdxH@casper.infradead.org>
	<ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
X-Mailman-Approved-At: Mon, 24 Apr 2023 08:20:37 +0200
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	Matthew Wilcox <willy@infradead.org>, hch@infradead.org,
	p.raghav@samsung.com, senozhatsky@chromium.org,
	snitzer@kernel.org, linux-block@vger.kernel.org, hare@suse.de,
	kbusch@kernel.org, axboe@kernel.dk, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Fri, Apr 21, 2023 at 03:02:30PM -0700, Luis Chamberlain wrote:
> On Fri, Apr 21, 2023 at 09:14:00PM +0100, Matthew Wilcox wrote:
> > On Fri, Apr 21, 2023 at 12:58:05PM -0700, Luis Chamberlain wrote:
> > > Just use the PAGE_SECTORS generic define. This produces no functional
> > > changes. While at it use left shift to simplify this even further.
> > 
> > How is FOO << 2 simpler than FOO * 4?
> > 
> > > -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
> > > +	return bioset_init(&iomap_ioend_bioset, PAGE_SECTORS << 2,
> 
> We could just do:
> 
> 
> -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
> +	return bioset_init(&iomap_ioend_bioset, 4 * PAGE_SECTORS,

Yes, please.

> The shift just seemed optimal if we're just going to change it.

Nope, it's just premature optimisation at the expense of
maintainability. The compiler will optimise the multiplication into
shifts if that is the fastest way to do it for the given
architecture the code is being compiled to.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
