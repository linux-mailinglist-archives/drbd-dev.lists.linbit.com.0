Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D026D792
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Sep 2020 11:26:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2AF67420DE8;
	Thu, 17 Sep 2020 11:26:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ADD7C420DE3
	for <drbd-dev@lists.linbit.com>; Thu, 17 Sep 2020 11:26:25 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CA2C7AC12;
	Thu, 17 Sep 2020 09:25:58 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id BC6F61E12E1; Thu, 17 Sep 2020 11:25:24 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:25:24 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917092524.GC7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-11-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
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

On Thu 10-09-20 16:48:30, Christoph Hellwig wrote:
> The BDI_CAP_STABLE_WRITES is one of the few bits of information in the
> backing_dev_info shared between the block drivers and the writeback code.
> To help untangling the dependency replace it with a queue flag and a
> superblock flag derived from it.  This also helps with the case of e.g.
> a file system requiring stable writes due to its own checksumming, but
> not forcing it on other users of the block device like the swap code.
> 
> One downside is that we can't support the stable_pages_required bdi
> attribute in sysfs anymore.  It is replaced with a queue attribute, that
> can also be made writable for easier testing.
  ^^^^^^^^^^^^^^^^
  is also made

For a while I was confused thinking that the new attribute is not writeable
but when I checked the code I saw that it is.

Not supporting stable_pages_required attribute is not nice but probably it
isn't widely used. Maybe the deprecation message can even mention to use
the queue attribute? Otherwise the patch looks good to me so feel free to
add:

Reviewed-by: Jan Kara <jack@suse.cz>


								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
