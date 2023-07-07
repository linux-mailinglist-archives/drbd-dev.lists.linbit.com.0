Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634074AFBA
	for <lists+drbd-dev@lfdr.de>; Fri,  7 Jul 2023 13:29:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 47CDD4205D5;
	Fri,  7 Jul 2023 13:28:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5934F420171
	for <drbd-dev@lists.linbit.com>; Fri,  7 Jul 2023 13:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RUfYUy8/J6JDn9FoGNDP036sYhvQ7qr7NPrif4Grdk0=;
	b=W8BupQP6fTnw1maVtPw7n0FTsE
	YYE/luqofOMT0IhbP2TwnItjey780Gaej+IMiW55ud+2XaULxiO0l44TVjXxHDze0xRAuH+mluyhr
	7ui49FHiGFXBu/ov7yuPVdyKZ6eJKL+3QsdTV3Gb1KlNN/rv7nlB69UacHrPvm/XuXzbJNEgBM50m
	lj+5xIDBkcqtRkKNokX0ONlo/QTCRQkdYA2xSwzuGzgo4ax7OTAfgkKR0gXaMSjd0fblhIFZkcy3O
	uLWO9DupcrKt+pDlGpSx+Miz6qpzw/HtoMbVHr58WOYYIaYLstJnc/oPaBlHCJkaDsT5H35KaxEXD
	vOIi6ADg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1qHjdh-004Vpz-0w; Fri, 07 Jul 2023 11:28:41 +0000
Date: Fri, 7 Jul 2023 04:28:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZKf26fYMDHnTCb29@infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
	<20230704122224.16257-1-jack@suse.cz>
	<ZKbgAG5OoHVyUKOG@infradead.org>
	<20230706161433.lj4apushiwguzvdd@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706161433.lj4apushiwguzvdd@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jul 06, 2023 at 06:14:33PM +0200, Jan Kara wrote:
> > struct bdev_handle *bdev_open_by_path(dev_t dev, blk_mode_t mode,
> > 		void *holder, const struct blk_holder_ops *hops);
> > void bdev_release(struct bdev_handle *handle);
> 
> I'd maybe use bdev_close() instead of bdev_release() but otherwise I like
> the new naming.

We're using release everywhese else, but if Jens is fine with that I
can live with close.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
