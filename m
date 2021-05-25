Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48F391092
	for <lists+drbd-dev@lfdr.de>; Wed, 26 May 2021 08:25:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B1FB42032D;
	Wed, 26 May 2021 08:25:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5945420327
	for <drbd-dev@lists.linbit.com>; Wed, 26 May 2021 00:42:14 +0200 (CEST)
Received: by mail-vs1-f41.google.com with SMTP id m9so7239962vsq.5
	for <drbd-dev@lists.linbit.com>; Tue, 25 May 2021 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q2ntYm6uDO3tojaF9gfgprihNvjCO5hVlU6EmFGOmTo=;
	b=K9wqVdOPxXHut6A0EevQX/nqmrPWosCHVPu4555rYr8tuCz8O0lI/p4Rb77PfQ8Yfq
	fRmWkgPHBfsqXzE6lREE/b8PxdKg0U8EuVSS9rL2xjxve3ATaYRjERwWLkhwXRfzDPTA
	KMH0Jn7mx/0V+2ZMCJ2ntLBKrEex0sj58ibU9GJdf25N1KPIZf6ysG7S8bBIp5GxRiyl
	oW1gRaEs+jb593kt9via8xPWNweotp+DwCl/Vc0y0ZfLnCUPzk4X9FC3QvSvLxInEfdN
	EReMXPyNQilw4NAPZf5vV5feE5jyQ8EEPE5nGtQ/Fqd8VnVaNh6v5d36RKW9J9jTG3bc
	rUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q2ntYm6uDO3tojaF9gfgprihNvjCO5hVlU6EmFGOmTo=;
	b=DM02FaLCscDFJaUUaEtgSbv6YzGYS7UGL3Gq0VqCIOkUHuBnKMV75wYH6/pQh3PsfA
	V2vdurAdZ2xxgVpyKhmVnj1agpgWJukEAg55YEARPEUnl0Ks4kT2pJXZebtwaw8nZxms
	O0MFDLUXZ0EmEeTzpVJhy0QmNCQv++wIslAx0FFz4+C7NtLO7l0KjQLHxCpQDdQV+cGr
	4bGBja6jfhU/P/RQIVw7sd84tr4qmvFWcrrB/pa2+G52zITJQkUrnqxthvmdPsI72HcF
	vOyzfd6V9cNZaX06s7FRDi6drcLTBElN8edxdyjCeJHOsIDftPVmlY4x36r/B7QCz+PQ
	4xzA==
X-Gm-Message-State: AOAM530kdYU+6BH8kMNktiJlZyjbXdXNLZ8JMSAFUhaUE+hWRumWeRe5
	SjyEv6miwliDXhPvZuaQRRih56iviFMaKjkHwvo4zQ==
X-Google-Smtp-Source: ABdhPJwx/fwYmfo8P5+A7EuWXJoD8LuumWi86gXq03cq2Wld1BR6mX3B8HbBTdDiayCS1IrjwzR0gvQYH9nbZXbeRCI=
X-Received: by 2002:a05:6102:7c1:: with SMTP id
	y1mr29600317vsg.34.1621982533995; 
	Tue, 25 May 2021 15:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521055116.1053587-1-hch@lst.de>
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 26 May 2021 00:41:37 +0200
Message-ID: <CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 26 May 2021 08:25:15 +0200
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

On Fri, 21 May 2021 at 07:51, Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this series is the first part of cleaning up lifetimes and allocation of
> the gendisk and request_queue structure.  It adds a new interface to
> allocate the disk and queue together for bio based drivers, and a helper
> for cleanup/free them when a driver is unloaded or a device is removed.

May I ask what else you have in the pipe for the next steps?

The reason why I ask is that I am looking into some issues related to
lifecycle problems of gendisk/mmc, typically triggered at SD/MMC card
removal.

>
> Together this removes the need to treat the gendisk and request_queue
> as separate entities for bio based drivers.
>
> Diffstat:
>  arch/m68k/emu/nfblock.c             |   20 +---
>  arch/xtensa/platforms/iss/simdisk.c |   29 +------
>  block/blk-core.c                    |    1
>  block/blk.h                         |    6 -
>  block/genhd.c                       |  149 +++++++++++++++++++-----------------
>  block/partitions/core.c             |   19 ++--
>  drivers/block/brd.c                 |   94 +++++++---------------
>  drivers/block/drbd/drbd_main.c      |   23 +----
>  drivers/block/n64cart.c             |    8 -
>  drivers/block/null_blk/main.c       |   38 ++++-----
>  drivers/block/pktcdvd.c             |   11 --
>  drivers/block/ps3vram.c             |   31 +------
>  drivers/block/rsxx/dev.c            |   39 +++------
>  drivers/block/rsxx/rsxx_priv.h      |    1
>  drivers/block/zram/zram_drv.c       |   19 ----
>  drivers/lightnvm/core.c             |   24 +----
>  drivers/md/bcache/super.c           |   15 ---
>  drivers/md/dm.c                     |   16 +--
>  drivers/md/md.c                     |   25 ++----
>  drivers/memstick/core/ms_block.c    |    1
>  drivers/nvdimm/blk.c                |   27 +-----
>  drivers/nvdimm/btt.c                |   25 +-----
>  drivers/nvdimm/btt.h                |    2
>  drivers/nvdimm/pmem.c               |   17 +---
>  drivers/nvme/host/core.c            |    1
>  drivers/nvme/host/multipath.c       |   46 +++--------
>  drivers/s390/block/dcssblk.c        |   26 +-----
>  drivers/s390/block/xpram.c          |   26 ++----
>  include/linux/blkdev.h              |    1
>  include/linux/genhd.h               |   23 +++++
>  30 files changed, 297 insertions(+), 466 deletions(-)

This looks like a nice cleanup to me.  Feel free to add, for the series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
