Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4BA25BD5B
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Sep 2020 10:34:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2C53423B7A;
	Thu,  3 Sep 2020 10:34:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 440 seconds by postgrey-1.31 at mail19;
	Thu, 03 Sep 2020 10:34:01 CEST
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3899F423B77
	for <drbd-dev@lists.linbit.com>; Thu,  3 Sep 2020 10:34:01 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 727D868BEB; Thu,  3 Sep 2020 10:26:09 +0200 (CEST)
Date: Thu, 3 Sep 2020 10:26:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20200903082609.GA23498@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
	<20200903054104.228829-3-hch@lst.de>
	<CAPDyKFrkcpziGFPmSd8Kx4bzhoN6zxF1E8MagLQSa4sBmnicOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFrkcpziGFPmSd8Kx4bzhoN6zxF1E8MagLQSa4sBmnicOg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	linux-s390@vger.kernel.org,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/9] block: add a bdev_is_partition helper
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

On Thu, Sep 03, 2020 at 10:19:34AM +0200, Ulf Hansson wrote:
> On Thu, 3 Sep 2020 at 07:42, Christoph Hellwig <hch@lst.de> wrote:
> >
> > Add a littler helper to make the somewhat arcane bd_contains checks a
> > little more obvious.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Not sure why we have both "bd_contains" and "bd_partno", nevertheless,
> feel free to add:

Right now both are needed for how blkdev_get/put work.  But I plan to
eventual kill off bd_contains after some major surgery to that code.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
