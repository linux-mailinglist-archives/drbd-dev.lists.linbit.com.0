Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A496374A001
	for <lists+drbd-dev@lfdr.de>; Thu,  6 Jul 2023 16:55:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF23742019D;
	Thu,  6 Jul 2023 16:55:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C75FC42019D
	for <drbd-dev@lists.linbit.com>; Thu,  6 Jul 2023 16:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fhykVYOZkzlXT4yh75rGeCVJ3cPkDr5sjhaxZXHjD+c=;
	b=zbagyQChudyQPE2bMPZfTnWPir
	xEx+mIn+jmhXiSkClrK6vyYVxVucLdM5bush+XAhi1L8+RYYMWbrfI/PXNLKjNrWkvX1JuFMBGnvz
	hobfOtgzfc30tNgXDTW5f735BiGierSS2sw4A5BsLsjO+NIDmCJaoqnJvjB6GpO63lTBhPw1Ktdzv
	09/JTSE1nHQ4VXLt2IEwE6yDDWWPLCfOggEtJrOTiDfYzQXVq9m9NhYrAKw8aQvc7GPBw2+8hQS8A
	80c0RawRFeosEEQrvmZs9gRIzWZlEHNQkGLdtR04aftBqsNeChaMLjpw0CwixmzDs5mdRTNLsZohR
	2STEGtcw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1qHQNf-001vuf-2T; Thu, 06 Jul 2023 14:54:51 +0000
Date: Thu, 6 Jul 2023 07:54:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZKbVuyn0jELh8UDM@infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629165206.383-1-jack@suse.cz>
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
Subject: Re: [Drbd-dev] [PATCH RFC 0/32] block: Make blkdev_get_by_*()
	return handle
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

On Tue, Jul 04, 2023 at 02:21:27PM +0200, Jan Kara wrote:
> Hello,
> 
> this patch series implements the idea of blkdev_get_by_*() calls returning
> bdev_handle which is then passed to blkdev_put() [1]. This makes the get
> and put calls for bdevs more obviously matching and allows us to propagate
> context from get to put without having to modify all the users (again!).
> In particular I need to propagate used open flags to blkdev_put() to be able
> count writeable opens and add support for blocking writes to mounted block
> devices. I'll send that series separately.
> 
> The series is based on Linus' tree as of yesterday + two bcache fixes which are
> in the block tree. Patches have passed some basic testing, I plan to test more
> users once we agree this is the right way to go.

Can you post a link to a git branch for this and the follow up series?
Especially with a fairly unstable base it's kinda hard to look at the
result otherwise.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
