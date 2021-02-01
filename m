Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93430A7A5
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Feb 2021 13:31:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 38103420636;
	Mon,  1 Feb 2021 13:31:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 535 seconds by postgrey-1.31 at mail19;
	Mon, 01 Feb 2021 13:31:02 CET
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09F7F420631
	for <drbd-dev@lists.linbit.com>; Mon,  1 Feb 2021 13:31:01 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CCB7C6736F; Mon,  1 Feb 2021 13:22:04 +0100 (CET)
Date: Mon, 1 Feb 2021 13:22:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210201122204.GA22727@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
	<20210126145247.1964410-5-hch@lst.de>
	<20210130035646.GH308988@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130035646.GH308988@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
	linux-nilfs@vger.kernel.org, Chao Yu <chao@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>, linux-mm@kvack.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 04/17] block: split bio_kmalloc from
	bio_alloc_bioset
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

On Sat, Jan 30, 2021 at 03:56:46AM +0000, Matthew Wilcox wrote:
> On Tue, Jan 26, 2021 at 03:52:34PM +0100, Christoph Hellwig wrote:
> > bio_kmalloc shares almost no logic with the bio_set based fast path
> > in bio_alloc_bioset.  Split it into an entirely separate implementation.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  block/bio.c         | 167 ++++++++++++++++++++++----------------------
> >  include/linux/bio.h |   6 +-
> >  2 files changed, 86 insertions(+), 87 deletions(-)
> 
> This patch causes current linux-next to OOM for me when running xfstests
> after about ten minutes.  Haven't looked into why yet, this is just the
> results of a git bisect.

I've run tests on linux-next all weekend and could not reproduce
the issue.  Can you share your .config?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
