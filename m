Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C194CCBB0
	for <lists+drbd-dev@lfdr.de>; Fri,  4 Mar 2022 03:23:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 926044203B9;
	Fri,  4 Mar 2022 03:23:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2AA2F4201F3
	for <drbd-dev@lists.linbit.com>; Fri,  4 Mar 2022 03:23:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 977441F382;
	Fri,  4 Mar 2022 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1646360604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=E85sAoXCaTA9rJMXOcKl8Th+xCpRXA0b8EAqZxwZ8A0=;
	b=OHMBIepyGZT5p2vUzh9m6EF2ADllsCUvjfoI6pTTrXo7Yz0B7BDN+ge9IdtF+2ZYydZGCQ
	8WoB5pAABgNBYEPVBbEaEnFFjU93OJpcylm9mmoQGVwXSBRAGZ9mDxUgC5aU5qlMH9Ckr8
	8JdQlmMLB5FGrAN6piwNc9Z7wosEfx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1646360604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=E85sAoXCaTA9rJMXOcKl8Th+xCpRXA0b8EAqZxwZ8A0=;
	b=gt1xKH0idJAvV5toxul/AJtWemJaGkXOxCg34os0vjwsTU/KiA45a4f222DhjpE4Y5De+j
	w3347cZDZ/LwPhDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CAE41340A;
	Fri,  4 Mar 2022 02:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id Wj8UEhV4IWIXewAAMHmgww
	(envelope-from <neilb@suse.de>); Fri, 04 Mar 2022 02:23:17 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Miklos Szeredi" <miklos@szeredi.hu>
In-reply-to: <CAJfpegs=DhCO62EFV0Q_i2fmqJnziJy1t4itP9deS=FuWEA=TQ@mail.gmail.com>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>,
	<164549983736.9187.16755913785880819183.stgit@noble.brown>,
	<CAJfpegs=DhCO62EFV0Q_i2fmqJnziJy1t4itP9deS=FuWEA=TQ@mail.gmail.com>
Date: Fri, 04 Mar 2022 13:23:14 +1100
Message-id: <164636059432.13165.6442580674358743838@noble.neil.brown.name>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
	drbd-dev@lists.linbit.com, Paolo Valente <paolo.valente@linaro.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Ext4 <linux-ext4@vger.kernel.org>, Chao Yu <chao@kernel.org>,
	linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, Linux NFS list <linux-nfs@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Wu Fengguang <fengguang.wu@intel.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 03/11] MM: improve cleanup when ->readpages
 doesn't process all pages.
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

On Wed, 02 Mar 2022, Miklos Szeredi wrote:
> On Tue, 22 Feb 2022 at 04:18, NeilBrown <neilb@suse.de> wrote:
> >
> > If ->readpages doesn't process all the pages, then it is best to act as
> > though they weren't requested so that a subsequent readahead can try
> > again.
> > So:
> >   - remove any 'ahead' pages from the page cache so they can be loaded
> >     with ->readahead() rather then multiple ->read()s
> >   - update the file_ra_state to reflect the reads that were actually
> >     submitted.
> >
> > This allows ->readpages() to abort early due e.g.  to congestion, which
> > will then allow us to remove the inode_read_congested() test from
> > page_Cache_async_ra().
> >
> > Signed-off-by: NeilBrown <neilb@suse.de>
> > ---
> >  mm/readahead.c |   19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/readahead.c b/mm/readahead.c
> > index 73b2bc5302e0..8a97bd408cf6 100644
> > --- a/mm/readahead.c
> > +++ b/mm/readahead.c
> > @@ -104,7 +104,13 @@
> >   * for necessary resources (e.g.  memory or indexing information) to
> >   * become available.  Pages in the final ``async_size`` may be
> >   * considered less urgent and failure to read them is more acceptable.
> > - * They will eventually be read individually using ->readpage().
> > + * In this case it is best to use delete_from_page_cache() to remove the
> > + * pages from the page cache as is automatically done for pages that
> > + * were not fetched with readahead_page().  This will allow a
> > + * subsequent synchronous read ahead request to try them again.  If they
> > + * are left in the page cache, then they will be read individually using
> > + * ->readpage().
> > + *
> >   */
> >
> >  #include <linux/kernel.h>
> > @@ -226,8 +232,17 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
> >
> >         if (aops->readahead) {
> >                 aops->readahead(rac);
> > -               /* Clean up the remaining pages */
> > +               /*
> > +                * Clean up the remaining pages.  The sizes in ->ra
> > +                * maybe be used to size next read-ahead, so make sure
> > +                * they accurately reflect what happened.
> > +                */
> >                 while ((page = readahead_page(rac))) {
> > +                       rac->ra->size -= 1;
> > +                       if (rac->ra->async_size > 0) {
> > +                               rac->ra->async_size -= 1;
> > +                               delete_from_page_cache(page);
> > +                       }
> 
> Does the  above imply that filesystem should submit at least ra->size
> pages, regardless of congestion?

   ra->size - ra_async_size 
pages should be submitted reguardless of congestion.

NeilBrown

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
