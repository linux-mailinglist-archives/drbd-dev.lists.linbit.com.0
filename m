Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B274478B2E8
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Aug 2023 16:22:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BD6042683C;
	Mon, 28 Aug 2023 16:22:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1C004203B3
	for <drbd-dev@lists.linbit.com>; Mon, 28 Aug 2023 16:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9E44iiUNdZH1ZPxuMNvAhOTWH2tumtFNFWSYch117Sg=;
	b=nSz5L3dUuVsvh674z9OKAS8bJp
	zYSu+GQXXg9k+ExZpIBbHRWqabXZwd02n9vS97tlwdx5M9rbbC+J+KEnpZl7StHzVI1lt44f9QJWZ
	RhCLKSbzGCi4P76AWaT4yrVyFudAE8f1mHvZ/9LKJK5CDCAoQ07psSi8X80pfTQ2D+AXZbR9MC8+S
	wR1nAR5ReTWrG92vtaPega/Mum3q/1hkkMbL2GzcSxnC+t33sPMa720/D25kUK/+Hg62OBp9KLF6I
	aTXMdhkDY6yJQndP4Hyxm4zXDD+MmNGYu1+zD8ZvsnvzkuVZZ62wZGz7/VRA0T/x0Dhn8TItnvE/O
	R0TRfFaA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1qad8H-009hsP-1H; Mon, 28 Aug 2023 14:22:21 +0000
Date: Mon, 28 Aug 2023 07:22:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZOytnQV0CH+vEIrr@infradead.org>
References: <20230810171429.31759-1-jack@suse.cz>
	<20230825015843.GB95084@ZenIV>
	<20230825134756.o3wpq6bogndukn53@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825134756.o3wpq6bogndukn53@quack3>
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
	Sven Schnelle <svens@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>, linux-pm@vger.kernel.org,
	Mike Snitzer <snitzer@kernel.org>, Chao Yu <chao@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
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
Subject: Re: [Drbd-dev] [PATCH v2 0/29] block: Make blkdev_get_by_*() return
	handle
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

On Fri, Aug 25, 2023 at 03:47:56PM +0200, Jan Kara wrote:
> I can see the appeal of not having to introduce the new bdev_handle type
> and just using struct file which unifies in-kernel and userspace block
> device opens. But I can see downsides too - the last fput() happening from
> task work makes me a bit nervous whether it will not break something
> somewhere with exclusive bdev opens. Getting from struct file to bdev is
> somewhat harder but I guess a helper like F_BDEV() would solve that just
> fine.
> 
> So besides my last fput() worry about I think this could work and would be
> probably a bit nicer than what I have. But before going and redoing the whole
> series let me gather some more feedback so that we don't go back and forth.
> Christoph, Christian, Jens, any opinion?

I did think about the file a bit.  The fact that we'd need something
like an anon_file for the by_dev open was always a huge turn off for
me, but maybe my concern is overblown.  Having a struct file would
actually be really useful for a bunch of users.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
