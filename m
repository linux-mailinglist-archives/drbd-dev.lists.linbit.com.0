Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A54C23A9
	for <lists+drbd-dev@lfdr.de>; Thu, 24 Feb 2022 06:42:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD92F42177C;
	Thu, 24 Feb 2022 06:42:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B65A42034B
	for <drbd-dev@lists.linbit.com>; Thu, 24 Feb 2022 06:42:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBB951F3A1;
	Thu, 24 Feb 2022 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1645681327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=LKmtUS8Iww56ZG9AedqwAoOu6e9VunJUN5pEfmlFqFg=;
	b=oacCq8DpEx+HDVYUG2DsF2wuspiuS5qhOaHg1qyYd+T9C2DteAD78mmee61D0FUkZI1YLt
	89gaqCC57biyg1VI4eWpjZIyZz5bUCc+qIzPagHkvNRbHUbMXkbpK1X9DZdFRD07Aas5HD
	lAXZBPvJQXlq+oS7kaTZ3tDK1PH657o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1645681327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=LKmtUS8Iww56ZG9AedqwAoOu6e9VunJUN5pEfmlFqFg=;
	b=MEMewd7NbYPArVPBoXiNu4N+Gd4+gUbLnYQ+eJp9sW2uduqkIYyCem3t9SIAJPZbOtxf7E
	cjDOc2g76XCgQcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFB7B13322;
	Thu, 24 Feb 2022 05:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id spy1IqgaF2JJDwAAMHmgww
	(envelope-from <neilb@suse.de>); Thu, 24 Feb 2022 05:42:00 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <ccc81eb5c23f933137c5da8d5050540cc54e58f0.camel@kernel.org>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>,
	<164549983739.9187.14895675781408171186.stgit@noble.brown>,
	<ccc81eb5c23f933137c5da8d5050540cc54e58f0.camel@kernel.org>
Date: Thu, 24 Feb 2022 16:41:56 +1100
Message-id: <164568131640.25116.884631856219777713@noble.neil.brown.name>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	drbd-dev@lists.linbit.com, Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-nilfs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Wu Fengguang <fengguang.wu@intel.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 06/11] ceph: remove reliance on bdi congestion
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

On Thu, 24 Feb 2022, Jeff Layton wrote:
> On Tue, 2022-02-22 at 14:17 +1100, NeilBrown wrote:
> > The bdi congestion tracking in not widely used and will be removed.
> > 
> > CEPHfs is one of a small number of filesystems that uses it, setting
> > just the async (write) congestion flags at what it determines are
> > appropriate times.
> > 
> > The only remaining effect of the async flag is to cause (some)
> > WB_SYNC_NONE writes to be skipped.
> > 
> > So instead of setting the flag, set an internal flag and change:
> >  - .writepages to do nothing if WB_SYNC_NONE and the flag is set
> >  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
> >     and the flag is set.
> > 
> > The writepages change causes a behavioural change in that pageout() can
> > now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> > be called on the page which (I think) wil further delay the next attempt
> > at writeout.  This might be a good thing.
> > 
> > Signed-off-by: NeilBrown <neilb@suse.de>
> 
> Maybe. I have to wonder whether all of this is really useful.
> 
> When things are congested we'll avoid trying to issue new writeback
> requests. Note that we don't prevent new pages from being dirtied here -
> - only their being written back.
> 
> This also doesn't do anything in the DIO or sync_write cases, so if we
> lose caps or are doing DIO, we'll just keep churning out "unlimited"
> writes in those cases anyway.

I think the point of congestion tracking is to differentiate between
sync and async IO.  Or maybe "required" and "optional".
Eventually the "optional" IO will become required, but if we can delay
it until a time when there is less "required" io, then maybe we can
improve perceived latency.

"optional" IO here is write-back and read-ahead.  If the load of
"required" IO is bursty, and if we can shuffle that optional stuff into
the quiet periods, we might win.

Whether this is a real need is an important question that I don't have an
answer for.  And whether it is better to leave delayed requests in the
page cache, or in the low-level queue with sync requests able to
over-take them - I don't know.  If you have multiple low-level queue as
you say you can with ceph, then lower might be better.

The block layer has REQ_RAHEAD ..  maybe those request get should get a
lower priority ... though I don't think they do.
NFS has a 3 level priority queue, with write-back going at a lower
priority ... I think... for NFSv3 at least.

Sometimes I suspect that as all our transports have become faster, we
have been able to ignore the extra latency caused by poor scheduling of
optional requests.  But at other times when my recently upgraded desktop
is struggling to view a web page while compiling a kernel ...  I wonder
if maybe we don't have the balance right any more.

So maybe you are right - maybe we can rip all this stuff out.

Or maybe not.

Thanks,
NeilBrown
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
