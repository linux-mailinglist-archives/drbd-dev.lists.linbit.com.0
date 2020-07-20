Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E4441225E2C
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jul 2020 14:08:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 74D1E4203E7;
	Mon, 20 Jul 2020 14:08:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4711342010C
	for <drbd-dev@lists.linbit.com>; Mon, 20 Jul 2020 14:08:06 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 18CA168BFE; Mon, 20 Jul 2020 14:07:35 +0200 (CEST)
Date: Mon, 20 Jul 2020 14:07:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <20200720120734.GA29061@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
	<CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
	LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cgroups mailinglist <cgroups@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
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

On Mon, Jul 20, 2020 at 01:58:22PM +0200, Richard Weinberger wrote:
> Hello Chrstoph,
> 
> On Mon, Jul 20, 2020 at 9:53 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Set up a readahead size by default.  This changes behavior for mtd,
> > ubifs, and vboxsf to actually enabled readahead, the lack of which
> > very much looks like an oversight.
> 
> UBIFS doesn't enable readahead on purpose, please see:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_readahead

What about jffs2 and blk2mtd raw block devices?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
