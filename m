Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6092277D5
	for <lists+drbd-dev@lfdr.de>; Tue, 21 Jul 2020 07:00:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5E68B42041A;
	Tue, 21 Jul 2020 07:00:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 73B96420111
	for <drbd-dev@lists.linbit.com>; Tue, 21 Jul 2020 07:00:50 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 42A716736F; Tue, 21 Jul 2020 07:00:48 +0200 (CEST)
Date: Tue, 21 Jul 2020 07:00:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <20200721050047.GA9707@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
	<CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
	<20200720120734.GA29061@lst.de>
	<2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
	<CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
	LKML <linux-kernel@vger.kernel.org>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
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

On Mon, Jul 20, 2020 at 11:27:57PM +0200, Richard Weinberger wrote:
> On Mon, Jul 20, 2020 at 2:37 PM Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> > > What about jffs2 and blk2mtd raw block devices?
> 
> I don't worry much about blk2mtd.
> 
> > If my memory serves me correctly JFFS2 did not mind readahead.
> 
> This covers my knowledge too.
> I fear enabling readahead on JFFS2 will cause performance issues, this
> filesystem
> is mostly used on small and slow NOR devices.

I'm going to wait for Hans for feedback on vboxsf, but in doubt I'll
ust add a prep patch or fold for this one to explicit set ra_pages to 0
with a comment then.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
