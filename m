Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E81275B56
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Sep 2020 17:16:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C360420D1F;
	Wed, 23 Sep 2020 17:16:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8EBD0420CEC
	for <drbd-dev@lists.linbit.com>; Wed, 23 Sep 2020 17:16:39 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D31FF6736F; Wed, 23 Sep 2020 17:16:06 +0200 (CEST)
Date: Wed, 23 Sep 2020 17:16:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200923151606.GB16073@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-6-hch@lst.de>
	<20200922084954.GC16464@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922084954.GC16464@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Justin Sanders <justin@coraid.com>, Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Minchan Kim <minchan@kernel.org>, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 05/13] bdi: initialize ->ra_pages and
 ->io_pages in bdi_init
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

On Tue, Sep 22, 2020 at 10:49:54AM +0200, Jan Kara wrote:
> On Mon 21-09-20 10:07:26, Christoph Hellwig wrote:
> > Set up a readahead size by default, as very few users have a good
> > reason to change it.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> > Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
> 
> The patch looks good to me. You can add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> I'd just prefer if the changelog explicitely mentioned that this patch
> results in enabling readahead for coda, ecryptfs, and orangefs... Just in
> case someone bisects some issue down to this patch :).

Ok, I've updated the changelog.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
