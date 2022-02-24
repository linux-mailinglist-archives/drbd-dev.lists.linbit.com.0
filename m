Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A838D4C34BC
	for <lists+drbd-dev@lfdr.de>; Thu, 24 Feb 2022 19:26:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 78000420162;
	Thu, 24 Feb 2022 19:26:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63907420162
	for <drbd-dev@lists.linbit.com>; Thu, 24 Feb 2022 19:26:54 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id CC4F41F44A;
	Thu, 24 Feb 2022 18:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1645727183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=fvd1oinbrzDNEtVw09f73DrWCGrH8uj1AxQnI+XDYsA=;
	b=bkp1oVJXbWkpid09cmm13sNPWmUCuhaHiS++4pZepB3FkldFh7aCskaPIOft1q+ADmBIFJ
	A6PnUX6wxF1vyHGVXr2dfZNx+WiatfwzHBBqe3itmGYWUZQ1Y4aRsDtgvSTQpipqYrsNeQ
	9rbGMo5ALz4T0wNVzbygll+R7NJsp3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1645727183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=fvd1oinbrzDNEtVw09f73DrWCGrH8uj1AxQnI+XDYsA=;
	b=jWApK2AmDJVMG8GSfFG05r6OWPvoyyhtsY2beZhfc9a6eTJ5NVMmGZXLdtlQOfh01M1VpN
	9gOSsdIcUkyQimDA==
Received: from quack3.suse.cz (unknown [10.163.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 04F60A3B81;
	Thu, 24 Feb 2022 18:26:23 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A8999A0605; Thu, 24 Feb 2022 19:26:22 +0100 (CET)
Date: Thu, 24 Feb 2022 19:26:22 +0100
From: Jan Kara <jack@suse.cz>
To: NeilBrown <neilb@suse.de>
Message-ID: <20220224182622.n7abfey3asszyq3x@quack3.lan>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
	<164447147257.23354.2801426518649016278.stgit@noble.brown>
	<20220210122440.vqth5mwsqtv6vjpq@quack3.lan>
	<164453611721.27779.1299851963795418722@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164453611721.27779.1299851963795418722@noble.neil.brown.name>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	drbd-dev@lists.linbit.com, Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Wu Fengguang <fengguang.wu@intel.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 02/11] MM: document and polish read-ahead
	code.
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

On Fri 11-02-22 10:35:17, NeilBrown wrote:
> On Thu, 10 Feb 2022, Jan Kara wrote:
> > Hi Neil!
> > 
> > On Thu 10-02-22 16:37:52, NeilBrown wrote:
> > > Add some "big-picture" documentation for read-ahead and polish the code
> > > to make it fit this documentation.
> > > 
> > > The meaning of ->async_size is clarified to match its name.
> > > i.e. Any request to ->readahead() has a sync part and an async part.
> > > The caller will wait for the sync pages to complete, but will not wait
> > > for the async pages.  The first async page is still marked PG_readahead
> 
> Thanks for the review!
> 
> > 
> > So I don't think this is how the code was meant. My understanding of
> > readahead comes from a comment:
> 
> I can't be sure what was "meant" but what I described is very close to
> what the code actually does.
> 
> > 
> > /*
> >  * On-demand readahead design.
> >  *
> > ....
> > 
> > in mm/readahead.c. The ra->size is how many pages should be read.
> > ra->async_size is the "lookahead size" meaning that we should place a
> > marker (PageReadahead) at "ra->size - ra->async_size" to trigger next
> > readahead.
> 
> This description of PageReadahead and ->async_size focuses on *what*
> happens, not *why*.  Importantly it doesn't help answer the question "What
> should I set ->async_size to?"

Sorry for delayed reply. I was on vacation and then catching up with stuff.
I know you have submitted another version of the patches but not much has
changed in this regard so I figured it might be better to continue
discussion here.

So my answer to "What should I set ->async_size to?" is: Ideally so that it
takes application to process data between ->async_size and ->size as long
as it takes the disk to load the next chunk of data into the page cache.
This is explained in the comment:

 * To overlap application thinking time and disk I/O time, we do
 * `readahead pipelining': Do not wait until the application consumed all
 * readahead pages and stalled on the missing page at readahead_index;
 * Instead, submit an asynchronous readahead I/O as soon as there are
 * only async_size pages left in the readahead window. Normally async_size
 * will be equal to size, for maximum pipelining.

Now because things such as think time or time to read pages is difficult to
estimate, we just end up triggering next readahead as soon as we are at least
a bit confident application is going to use the pages. But I don't think
there was ever any intent to have "sync" and "async" parts of the request
or that ->size - ->async_size is what must be read. Any function in the
readahead code is free to return without doing anything regardless of
passed parameters and the caller needs to deal with that, ->size is just a
hint to the filesystem how much we expect to be useful to read...

> The implication in the code is that when we sequentially access a page
> that was read-ahead (read before it was explicitly requested), we trigger
> more read ahead.  So ->async_size should refer to that part of the
> readahead request which was not explicitly requested.  With that
> understanding, it becomes possible to audit all the places that
> ->async_size are set and to see if they make sense.

I don't think this "implication" was ever intended :) But it may have
happened that some guesses how big ->async_size should be have ended like
that because of the impracticality of the original definition of how large
->async_size should be.

In fact I kind of like what you suggest ->async_size should be - it is
possible to actually implement that unlike the original definition - but it
is more of "let's redesign how readahead size is chosen" than "let's
document how readahead size is chosen" :).

> > > Note that the current function names page_cache_sync_ra() and
> > > page_cache_async_ra() are misleading.  All ra request are partly sync
> > > and partly async, so either part can be empty.
> > 
> > The meaning of these names IMO is:
> > page_cache_sync_ra() - tell readahead that we currently need a page
> > ractl->_index and would prefer req_count pages fetched ahead.
> 
> I don't think that is what req_count means.  req_count is the number of
> pages that are needed *now* to satisfy the current read request.
> page_cache_sync_ra() has the job of determining how many more pages (if
> any) to read-ahead to satisfy future requests.  Sometimes it reads
> another req_count - sometimes not.

So this is certainly true for page_cache_sync_readahead() call in
filemap_get_pages() but the call of page_cache_sync_ra() from
do_sync_mmap_readahead() does not quite follow what you say - we need only
one page there but request more.

> > page_cache_async_ra() - called when we hit the lookahead marker to give
> > opportunity to readahead code to prefetch more pages.
> 
> Yes, but page_cache_async_ra() is given a req_count which, as above, is
> the number of pages needed to satisfy *this* request.  That wouldn't
> make sense if it was a pure future-readahead request.

Again, usage of req_count in page_cache_async_ra() is not always the number
of pages immediately needed.

> In practice, the word "sync" is used to mean "page was missing" and
> "async" here means "PG_readahead was found".  But that isn't what those
> words usually mean.
>
> They both call ondemand_readahead() passing False or True respectively
> to hit_readahead_marker - which makes that meaning clear in the code...
> but it still isn't clear in the name.

I agree the naming is somewhat confusing :)

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
