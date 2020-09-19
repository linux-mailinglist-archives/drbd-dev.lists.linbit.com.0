Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DF270B46
	for <lists+drbd-dev@lfdr.de>; Sat, 19 Sep 2020 08:52:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B1DFF420E20;
	Sat, 19 Sep 2020 08:52:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AE0C420375
	for <drbd-dev@lists.linbit.com>; Sat, 19 Sep 2020 08:51:59 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2740768BFE; Sat, 19 Sep 2020 08:51:27 +0200 (CEST)
Date: Sat, 19 Sep 2020 08:51:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200919065126.GA8048@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-11-hch@lst.de>
	<20200917092524.GC7347@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917092524.GC7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 10/12] bdi: replace BDI_CAP_STABLE_WRITES
 with a queue and a sb flag
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

On Thu, Sep 17, 2020 at 11:25:24AM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:30, Christoph Hellwig wrote:
> > The BDI_CAP_STABLE_WRITES is one of the few bits of information in the
> > backing_dev_info shared between the block drivers and the writeback code.
> > To help untangling the dependency replace it with a queue flag and a
> > superblock flag derived from it.  This also helps with the case of e.g.
> > a file system requiring stable writes due to its own checksumming, but
> > not forcing it on other users of the block device like the swap code.
> > 
> > One downside is that we can't support the stable_pages_required bdi
> > attribute in sysfs anymore.  It is replaced with a queue attribute, that
> > can also be made writable for easier testing.
>   ^^^^^^^^^^^^^^^^
>   is also made
> 
> For a while I was confused thinking that the new attribute is not writeable
> but when I checked the code I saw that it is.
> 
> Not supporting stable_pages_required attribute is not nice but probably it
> isn't widely used. Maybe the deprecation message can even mention to use
> the queue attribute? Otherwise the patch looks good to me so feel free to
> add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Thanks.  I've fixed the commit log and changed the warning to:

	dev_warn_once(dev, 
                 "the stable_pages_required attribute has been removed. Use the
		 stable_writes queue attribute instead.\n");
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
