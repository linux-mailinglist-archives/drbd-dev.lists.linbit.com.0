Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CC887270B56
	for <lists+drbd-dev@lfdr.de>; Sat, 19 Sep 2020 09:01:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3D70420D64;
	Sat, 19 Sep 2020 09:01:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F0F6420375
	for <drbd-dev@lists.linbit.com>; Sat, 19 Sep 2020 09:01:49 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6D18468BEB; Sat, 19 Sep 2020 09:01:17 +0200 (CEST)
Date: Sat, 19 Sep 2020 09:01:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200919070117.GB8237@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-5-hch@lst.de>
	<20200917100459.GK7347@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917100459.GK7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 04/12] bdi: initialize ->ra_pages and
 ->io_pages in bdi_init
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

On Thu, Sep 17, 2020 at 12:04:59PM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:24, Christoph Hellwig wrote:
> > Set up a readahead size by default, as very few users have a good
> > reason to change it.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> > Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
> 
> Looks good but what about coda, ecryptfs, and orangefs? Currenly they have
> readahead disabled and this patch would seem to enable it?

When going through this I pinged all maintainers and asked if anyone
had a reason to actually disable the readahead, and only vbox and
the mtd/ubifs maintainers came up with a reason.

> 
> > diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> > index 8e8b00627bb2d8..2dac3be6127127 100644
> > --- a/mm/backing-dev.c
> > +++ b/mm/backing-dev.c
> > @@ -746,6 +746,8 @@ struct backing_dev_info *bdi_alloc(int node_id)
> >  		kfree(bdi);
> >  		return NULL;
> >  	}
> > +	bdi->ra_pages = VM_READAHEAD_PAGES;
> > +	bdi->io_pages = VM_READAHEAD_PAGES;
> 
> Won't this be more logical in bdi_init() than in bdi_alloc()?

bdi_init is also used for noop_backing_dev_info, which should not
have readahead enabled.  In fact the only caller except for
bdi_alloc is the initialization of noop_backing_dev_info.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
