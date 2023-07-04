Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 453EF747230
	for <lists+drbd-dev@lfdr.de>; Tue,  4 Jul 2023 15:05:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3060642066F;
	Tue,  4 Jul 2023 15:05:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1230 seconds by postgrey-1.31 at mail19;
	Tue, 04 Jul 2023 15:04:37 CEST
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E058C42036A
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jul 2023 15:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MTt8zrAicdNCIRJKdOYeAgLwlWREbjuubDrB9LDLoHk=;
	b=FQ7AVaBk1GiVkQjqboSqkOGPBq
	D5twh1rJ7Iuli9ASCg3UlAH0AvBtBUwBmFvGFlq65Bob5lYyyxVWcYsI1kpmfheq88Wy3j6xoPYkH
	Yr8SWDhirVenxTbYcufP9aI7qtE9tPtw2HdVYrOWl8KhXSL1///8tHp1coXORoa2/ua7NUKFkm8+i
	dZTW2mGKIGBkD8nw9XAEiECk0hIGw3K+rH1tSbKt2yF6JFa6PpHTgJc3LTGgE/JGwL7FWrIxLj7Op
	grzKnmKKjadKIKnXmQRg0cnlXA7KWmhAcv93Lftb6rhIWGVuVJI8IrHKh1M51oSxQqR7AKzuvj0MI
	qnUduz9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1qGfNn-0099Sz-9Z; Tue, 04 Jul 2023 12:43:51 +0000
Date: Tue, 4 Jul 2023 13:43:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZKQUB4rU8Gebhq6R@casper.infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
	<20230704122224.16257-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704122224.16257-1-jack@suse.cz>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	"Darrick J. Wong" <djwong@kernel.org>, linux-nvme@lists.infradead.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jack Wang <jinpu.wang@ionos.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, Gao Xiang <xiang@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
	Mike Snitzer <snitzer@kernel.org>, Chao Yu <chao@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	Ted Tso <tytso@mit.edu>, linux-mm@kvack.org, Song Liu <song@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, Anna Schumaker <anna@kernel.org>,
	linux-fsdevel@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
	functions
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

On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
> +		void *holder, const struct blk_holder_ops *hops)
> +{
> +	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
> +					     GFP_KERNEL);
> +	struct block_device *bdev;
> +
> +	if (!handle)
> +		return ERR_PTR(-ENOMEM);
> +	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> +	if (IS_ERR(bdev))
> +		return ERR_CAST(bdev);

Would we be better off with a handle->error (and a NULL return from this
function means "we couldn't allocate a handle")?  I have no objection
to what you've done here, just wondering if it might end up nicer for
the users.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
