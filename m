Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7291CC24B
	for <lists+drbd-dev@lfdr.de>; Sat,  9 May 2020 17:07:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9594B4203E3;
	Sat,  9 May 2020 17:07:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7AC1B4203D2
	for <drbd-dev@lists.linbit.com>; Sat,  9 May 2020 17:07:25 +0200 (CEST)
Received: by mail-ej1-f41.google.com with SMTP id re23so3887551ejb.4
	for <drbd-dev@lists.linbit.com>; Sat, 09 May 2020 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yLn1AXHn00bZ+po9Vb7k6qNSHYdWGkkZ6wxI2pwtGRE=;
	b=bCOSwnBBjfPXdvYGJ+yVECFvPTePDH1ANyISrMhvJ1qWqJvVThnHr98KsSwJqA14nC
	yCPOxIRhJYUKs+I0Z7zlDnbc2VJgVwWpDdEA4tIPWEVVkzgs6TyhzHr/LnVPIJc5YbZe
	/Ga31Bb5nRqdr5sF01D+4kD7nuppvALvlvKumT0LdbEKLra5xfeiNf57Wv0ExKnHb7Rg
	DbJPWuDEL/VR1p8vve4AZ1c4iNgOcgeDoJddMOToTohvJc+NMCp5pllqs5xHvWVFoT1b
	hZ2eMoVCvm/W3nphozJEpzuE720t10XyAVjkj8Y23QAnpJ3YgiSQvtyoRGLEW8+4DwBB
	HlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yLn1AXHn00bZ+po9Vb7k6qNSHYdWGkkZ6wxI2pwtGRE=;
	b=oqb1+gLjnftV0+g5CwDpQk6rUi4JgEp57ivPVKsU7w9AolJn5iscYleRXnPQQfVyB2
	ild0cRQLiekN6snZAS9vYD2IA1yojbW2MIqBjlixC9NuI7PF7B2HtWIcFmnHznvhgF5h
	oZXxkOMwluNSrc/SDEElNXCvzgrOg65qyz6OwNyLGid74dTo1oO9qp55k+b28ZmUtAJV
	UujjiRw6E1eVBfWSeHWPv1dHaHpCBDtPIZgVGJ3hj6zJH37PCiBGcpeaqke5H5ZfR6j+
	sz15bFoMt5L9eRjJsYjvbtgiu2X+N6FxT92Ji/iNSbs6wNdMl5C5Oypyfd82lWgtqHWe
	VlYA==
X-Gm-Message-State: AGi0Pua91AxxeP6eNjhl+7CBjJd+uUOvMHn8qOpOYLixEyavfJ8rJ8uq
	k/5S+AYSehkL11Yr3IJv9dUJYw9efEao1dYUOa+3Kg==
X-Google-Smtp-Source: APiQypKilW3QgeYL9j+z8BH4y4sSKlWKWi60GEoJhZT78wFbACZI36hD4PovUMVH8UfEyvLbc+3je7NxPGD32jSs39Q=
X-Received: by 2002:a17:906:855a:: with SMTP id
	h26mr6685025ejy.56.1589036845508; 
	Sat, 09 May 2020 08:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
	<CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
	<20200509082352.GB21834@lst.de>
In-Reply-To: <20200509082352.GB21834@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 9 May 2020 08:07:14 -0700
Message-ID: <CAPcyv4ggb7_rwzGbhHNXSHd+jjSpZC=+DMEztY6Cu8Bc=ZNzag@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Geoff Levand <geoff@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, linux-m68k@lists.linux-m68k.org,
	Philip Kelleher <pjk1939@linux.ibm.com>, linux-bcache@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove a few uses of ->queuedata
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

On Sat, May 9, 2020 at 1:24 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, May 08, 2020 at 11:04:45AM -0700, Dan Williams wrote:
> > On Fri, May 8, 2020 at 9:16 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Hi all,
> > >
> > > various bio based drivers use queue->queuedata despite already having
> > > set up disk->private_data, which can be used just as easily.  This
> > > series cleans them up to only use a single private data pointer.
> >
> > ...but isn't the queue pretty much guaranteed to be cache hot and the
> > gendisk cache cold? I'm not immediately seeing what else needs the
> > gendisk in the I/O path. Is there another motivation I'm missing?
>
> ->private_data is right next to the ->queue pointer, pat0 and part_tbl
> which are all used in the I/O submission path (generic_make_request /
> generic_make_request_checks).  This is mostly a prep cleanup patch to
> also remove the pointless queue argument from ->make_request - then
> ->queue is an extra dereference and extra churn.

Ah ok. If the changelogs had been filled in with something like "In
preparation for removing @q from make_request_fn, stop using
->queuedata", I probably wouldn't have looked twice.

For the nvdimm/ driver updates you can add:

    Reviewed-by: Dan Williams <dan.j.williams@intel.com>

...or just let me know if you want me to pick those up through the nvdimm tree.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
