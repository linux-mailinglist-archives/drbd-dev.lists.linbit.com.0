Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E9390FC3
	for <lists+drbd-dev@lfdr.de>; Wed, 26 May 2021 06:49:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EB2BD420333;
	Wed, 26 May 2021 06:49:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6829F4202B2
	for <drbd-dev@lists.linbit.com>; Wed, 26 May 2021 06:49:47 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3ADA76736F; Wed, 26 May 2021 06:49:44 +0200 (CEST)
Date: Wed, 26 May 2021 06:49:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20210526044943.GA28551@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
	<CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Christoph Hellwig <hch@lst.de>,
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

On Wed, May 26, 2021 at 12:41:37AM +0200, Ulf Hansson wrote:
> On Fri, 21 May 2021 at 07:51, Christoph Hellwig <hch@lst.de> wrote:
> >
> > Hi all,
> >
> > this series is the first part of cleaning up lifetimes and allocation of
> > the gendisk and request_queue structure.  It adds a new interface to
> > allocate the disk and queue together for bio based drivers, and a helper
> > for cleanup/free them when a driver is unloaded or a device is removed.
> 
> May I ask what else you have in the pipe for the next steps?
> 
> The reason why I ask is that I am looking into some issues related to
> lifecycle problems of gendisk/mmc, typically triggered at SD/MMC card
> removal.

In the short run not much more than superficial cleanups.  Eventually
I want bio based drivers to not require a separate request_queue, leaving
that purely as a data structure for blk-mq based drivers.  But it will
take a while until we get there, so it should not block any fixes.

For hot unplug handling it might be worth to take a look at nvme, as it
is tested a lot for that case.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
