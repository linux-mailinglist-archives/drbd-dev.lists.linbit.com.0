Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021F3911F8
	for <lists+drbd-dev@lfdr.de>; Wed, 26 May 2021 10:08:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D68C4201FD;
	Wed, 26 May 2021 10:08:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DABEC4201FD
	for <drbd-dev@lists.linbit.com>; Wed, 26 May 2021 10:08:08 +0200 (CEST)
Received: by mail-ua1-f41.google.com with SMTP id n61so305063uan.2
	for <drbd-dev@lists.linbit.com>; Wed, 26 May 2021 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GrfL+UvsoUYJEVH3FOBXMPqeLzeAwHNpUWgDzMspWKw=;
	b=woqt8BnxKZukeBLeJd4w4lKnQ3cKCzoRk7QnVN0RWefRH0Lak2HbQbLhx/frNziCrW
	vzOd63E9Idh6uhMeJbijddzANEGlwhq2a94sp+UT6X33w/HJrP0R4Xxsur3qtd3UJ9V3
	RXhO2WmDqsPWGOOFe4Z1vXtU3Ajlf9H69hO1WGEkh2/q7XWi3knfCY64J+SzmkNKOe36
	kp6uvOs+ndgfRymDdtUOUv9NQPYP8RiXXMABsN8MVSRmmehasPQ8UDsDcWRSt1e77qBG
	1jHw1+BN8mfEhYZIvRTg/wyYkLYEyw3TBricpiOdb+JF5bZQWiaQ0RSSDpINkEteioTM
	z8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GrfL+UvsoUYJEVH3FOBXMPqeLzeAwHNpUWgDzMspWKw=;
	b=dzgbHCJbSnDw9RzQP3qfWS0jHlR0WQWCVCoWPQf30w49So5gj3tBLA8m7AfWr18fbF
	x6cRbKBQfRD83UPIES2Ci+dJJwD9jz5XRFeQFYK2Lor9okxB6mln+aiE8i9KMVMOGtT/
	o72LUXs7/tN8tzmKxoPpjphOzonTjX+m+TVps7pcRIcex6n41mDbyCX2cVEnYTU8zbrr
	EfnqyavPK0YNxRMMvVjut/wr4Kz9nIsOKvmDefb0mWFfhRlOLZqZkv2zVKmXtmCHtXey
	T2N8sBZ8JjZQtnuokughRdS8tdXWwH5mgzkgWc7WevzOBGcs3/ezaJLGloL1oQ1fwE6i
	En+g==
X-Gm-Message-State: AOAM531hUNoR/nul7QJZJ8qdEgVv2c0lMRLLyC7u3VECG3PvNy6PSkpH
	2h+ibYTy24/si9k5RbnWDnS2iB0RSdLItRHsarMysg==
X-Google-Smtp-Source: ABdhPJxEKZ+yyN+wbXXVH9CKQ94TxTUrIX6SVT7ztQ9Bwftr62IUqVIB3GNBh5QlN3mdzVdDkjsC7QK+8McmDny5XO0=
X-Received: by 2002:ab0:3351:: with SMTP id h17mr31776765uap.15.1622016487939; 
	Wed, 26 May 2021 01:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210521055116.1053587-1-hch@lst.de>
	<CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
	<20210526044943.GA28551@lst.de>
In-Reply-To: <20210526044943.GA28551@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 26 May 2021 10:07:31 +0200
Message-ID: <CAPDyKFpR0maO_Dj6bxWSLvh_jcGnrcZ=na42atXfNdkmMkmdig@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matias Bjorling <mb@lightnvm.io>, Nitin Gupta <ngupta@vflare.org>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
	Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
	Coly Li <colyli@suse.de>, linux-block <linux-block@vger.kernel.org>,
	linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	linux-raid@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-mmc <linux-mmc@vger.kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Jim Paris <jim@jtan.com>, Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Drbd-dev] simplify gendisk and request_queue allocation for
	bio based drivers
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

On Wed, 26 May 2021 at 06:49, Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 26, 2021 at 12:41:37AM +0200, Ulf Hansson wrote:
> > On Fri, 21 May 2021 at 07:51, Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Hi all,
> > >
> > > this series is the first part of cleaning up lifetimes and allocation of
> > > the gendisk and request_queue structure.  It adds a new interface to
> > > allocate the disk and queue together for bio based drivers, and a helper
> > > for cleanup/free them when a driver is unloaded or a device is removed.
> >
> > May I ask what else you have in the pipe for the next steps?
> >
> > The reason why I ask is that I am looking into some issues related to
> > lifecycle problems of gendisk/mmc, typically triggered at SD/MMC card
> > removal.
>
> In the short run not much more than superficial cleanups.  Eventually
> I want bio based drivers to not require a separate request_queue, leaving
> that purely as a data structure for blk-mq based drivers.  But it will
> take a while until we get there, so it should not block any fixes.

Alright, thanks for clarifying.

>
> For hot unplug handling it might be worth to take a look at nvme, as it
> is tested a lot for that case.

Okay, thanks for the hint.

Kind regards
Uffe
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
