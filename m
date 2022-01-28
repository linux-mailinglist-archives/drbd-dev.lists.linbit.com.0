Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E934A02EA
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jan 2022 22:36:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3136C42087D;
	Fri, 28 Jan 2022 22:36:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8FD39420635
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jan 2022 22:36:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E19E31F385;
	Fri, 28 Jan 2022 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1643405774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=NLILDfYIewMcTAbJZc9mPjKMlBqDlqhTsKM2N1uM+Vw=;
	b=taayjmIQ/dw3pRt7LXMXgV+h3N2iGR9k6iWV1POVgUTfQy7v0b53WKl6W7epBEuQeWPNId
	2nS5W8Zz+JDvOI2H2O325FIcHt7vLtCdfAuhacvrf751M2nGilH84Y1DtEW6P5pWfmkFXk
	3R+tAum3D39BD7myqsYNPl0uf7Iudaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1643405774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=NLILDfYIewMcTAbJZc9mPjKMlBqDlqhTsKM2N1uM+Vw=;
	b=24PK3VAQmVA51Rx99IGbDGj51tJod8UX27xeq8Emd3IiwsHonr+XB9p01yVh4lqGGFRKKK
	qudbZz9CfGjnNuAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BAB613AA1;
	Fri, 28 Jan 2022 21:36:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id fu7bMcdh9GHRawAAMHmgww
	(envelope-from <neilb@suse.de>); Fri, 28 Jan 2022 21:36:07 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Miklos Szeredi" <miklos@szeredi.hu>
In-reply-to: <CAJfpegt-igF8HqsDUcMzfU0jYv8WpofLy0Uv0YnXLzsfx=tkGg@mail.gmail.com>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>,
	<164325158954.29787.7856652136298668100.stgit@noble.brown>,
	<CAJfpegt-igF8HqsDUcMzfU0jYv8WpofLy0Uv0YnXLzsfx=tkGg@mail.gmail.com>
Date: Sat, 29 Jan 2022 08:36:02 +1100
Message-id: <164340576289.5493.5784848964540459557@noble.neil.brown.name>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
	Paolo Valente <paolo.valente@linaro.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Ext4 <linux-ext4@vger.kernel.org>, Chao Yu <chao@kernel.org>,
	linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Linux NFS list <linux-nfs@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 1/9] Remove inode_congested()
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

On Fri, 28 Jan 2022, Miklos Szeredi wrote:
> On Thu, 27 Jan 2022 at 03:47, NeilBrown <neilb@suse.de> wrote:
> >
> > inode_congested() reports if the backing-device for the inode is
> > congested.  Few bdi report congestion any more, only ceph, fuse, and
> > nfs.  Having support just for those is unlikely to be useful.
> >
> > The places which test inode_congested() or it variants like
> > inode_write_congested(), avoid initiating IO if congestion is present.
> > We now have to rely on other places in the stack to back off, or abort
> > requests - we already do for everything except these 3 filesystems.
> >
> > So remove inode_congested() and related functions, and remove the call
> > sites, assuming that inode_congested() always returns 'false'.
> 
> Looks to me this is going to "break" fuse; e.g. readahead path will go
> ahead and try to submit more requests, even if the queue is getting
> congested.   In this case the readahead submission will eventually
> block, which is counterproductive.
> 
> I think we should *first* make sure all call sites are substituted
> with appropriate mechanisms in the affected filesystems and as a last
> step remove the superfluous bdi congestion mechanism.
> 
> You are saying that all fs except these three already have such
> mechanisms in place, right?  Can you elaborate on that?

Not much.  I haven't looked into how other filesystems cope, I just know
that they must because no other filesystem ever has a congested bdi
(with one or two minor exceptions, like filesystems over drbd).

Surely read-ahead should never block.  If it hits congestion, the
read-ahead request should simply fail.  block-based filesystems seem to
set REQ_RAHEAD which might get mapped to REQ_FAILFAST_MASK, though I
don't know how that is ultimately used.

Maybe fuse and others should continue to track 'congestion' and reject
read-ahead requests when congested.
Maybe also skip WB_SYNC_NONE writes..

Or maybe this doesn't really matter in practice...  I wonder if we can
measure the usefulness of congestion.

Thanks,
NeilBrown
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
