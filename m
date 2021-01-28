Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F10307BFD
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 18:17:44 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 237294207BD;
	Thu, 28 Jan 2021 18:17:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1798 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jan 2021 18:17:41 CET
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B8AD42002F
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 18:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ok1YlK16MaIquA7ZYUHxK/CMaFxxxwNWazaMAgFieLU=;
	b=vuOaMGbyB7/+Dg91fNUqvgBiBD
	4apxS7jU5nU9b/DveQFuS18fYHTQPOpBZxMrv3tCqxWOuQg228bSNlkmvJ1gQneLnOfM3WL1ObNGi
	MTuz8xXL3LKzE+DH7errCMxepgPQ3Thh2HpLy2Nat9DQOLy35B1FC3UkIZuvmKmdZzwX86t+WV5Mk
	/pCa23DxPP5a3Rlkwfqrn59vty95NQBRWyuZpKNZRkjNLQlQ2KJrMub6IYLsf3IL2tz3nuZRbVWe7
	TKvbqzYB3UBc6MLrjn2HVQGE6rKRMshHOwu50Myfj/erONbRzfW9chvly9np7Q4o+a4JR4iRTNdIG
	5mKhGc+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l5ARp-008hlF-CH; Thu, 28 Jan 2021 16:47:23 +0000
Date: Thu, 28 Jan 2021 16:47:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20210128164709.GZ308988@casper.infradead.org>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-3-chaitanya.kulkarni@wdc.com>
	<BL0PR04MB6514C554B4AC96866BC1B16FE7BA9@BL0PR04MB6514.namprd04.prod.outlook.com>
	<DM6PR04MB4972DA86892CF4531440064F86BA9@DM6PR04MB4972.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR04MB4972DA86892CF4531440064F86BA9@DM6PR04MB4972.namprd04.prod.outlook.com>
Cc: "shaggy@kernel.org" <shaggy@kernel.org>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	"sergey.senozhatsky.work@gmail.com" <sergey.senozhatsky.work@gmail.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>, "tiwai@suse.de" <tiwai@suse.de>,
	"djwong@kernel.org" <djwong@kernel.org>,
	"jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"gustavoars@kernel.org" <gustavoars@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"alex.shi@linux.alibaba.com" <alex.shi@linux.alibaba.com>,
	"osandov@fb.com" <osandov@fb.com>, "agk@redhat.com" <agk@redhat.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"ngupta@vflare.org" <ngupta@vflare.org>,
	"len.brown@intel.com" <len.brown@intel.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"ming.lei@redhat.com" <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"tj@kernel.org" <tj@kernel.org>,
	"linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
	"hare@suse.de" <hare@suse.de>,
	"jefflexu@linux.alibaba.com" <jefflexu@linux.alibaba.com>,
	"jaegeuk@kernel.org" <jaegeuk@kernel.org>,
	"konishi.ryusuke@gmail.com" <konishi.ryusuke@gmail.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>, "tytso@mit.edu" <tytso@mit.edu>,
	"rjw@rjwysocki.net" <rjw@rjwysocki.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"minchan@kernel.org" <minchan@kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>,
	"jth@kernel.org" <jth@kernel.org>,
	"asml.silence@gmail.com" <asml.silence@gmail.com>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Subject: Re: [Drbd-dev] [Ocfs2-devel] [RFC PATCH 02/34] block: introduce and
	use bio_new
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


FYI your email is completely unreadable to those not using html.
I can't tell what you wrote and what Damien wrote.

On Thu, Jan 28, 2021 at 08:33:10AM +0000, Chaitanya Kulkarni wrote:
> On 1/27/21 11:21 PM, Damien Le Moal wrote:
> 
> On 2021/01/28 16:12, Chaitanya Kulkarni wrote:
> 
> 
> Introduce bio_new() helper and use it in blk-lib.c to allocate and
> initialize various non-optional or semi-optional members of the bio
> along with bio allocation done with bio_alloc(). Here we also calmp the
> max_bvecs for bio with BIO_MAX_PAGES before we pass to bio_alloc().
> 
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com><mailto:chaitanya.kulkarni@wdc.com>
> ---
>  block/blk-lib.c     |  6 +-----
>  include/linux/bio.h | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index fb486a0bdb58..ec29415f00dd 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -14,17 +14,13 @@ struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
>                         sector_t sect, unsigned op, unsigned opf,
>                         unsigned int nr_pages, gfp_t gfp)
>  {
> -       struct bio *new = bio_alloc(gfp, nr_pages);
> +       struct bio *new = bio_new(bdev, sect, op, opf, gfp, nr_pages);
> 
>         if (bio) {
>                 bio_chain(bio, new);
>                 submit_bio(bio);
>         }
> 
> -       new->bi_iter.bi_sector = sect;
> -       bio_set_dev(new, bdev);
> -       bio_set_op_attrs(new, op, opf);
> -
>         return new;
>  }
> 
> diff --git a/include/linux/bio.h b/include/linux/bio.h
> index c74857cf1252..2a09ba100546 100644
> --- a/include/linux/bio.h
> +++ b/include/linux/bio.h
> @@ -826,5 +826,30 @@ static inline void bio_set_polled(struct bio *bio, struct kiocb *kiocb)
>         if (!is_sync_kiocb(kiocb))
>                 bio->bi_opf |= REQ_NOWAIT;
>  }
> +/**
> + * bio_new -   allcate and initialize new bio
> + * @bdev:      blockdev to issue discard for
> + * @sector:    start sector
> + * @op:                REQ_OP_XXX from enum req_opf
> + * @op_flags:  REQ_XXX from enum req_flag_bits
> + * @max_bvecs: maximum bvec to be allocated for this bio
> + * @gfp_mask:  memory allocation flags (for bio_alloc)
> + *
> + * Description:
> + *    Allocates, initializes common members, and returns a new bio.
> + */
> +static inline struct bio *bio_new(struct block_device *bdev, sector_t sector,
> +                                 unsigned int op, unsigned int op_flags,
> +                                 unsigned int max_bvecs, gfp_t gfp_mask)
> +{
> +       unsigned nr_bvec = clamp_t(unsigned int, max_bvecs, 0, BIO_MAX_PAGES);
> +       struct bio *bio = bio_alloc(gfp_mask, nr_bvec);
> 
> 
> I think that depending on the gfp_mask passed, bio can be NULL. So this should
> be checked.
> 
> 
> true, I'll add that check.
> 
> 
> 
> 
> +
> +       bio_set_dev(bio, bdev);
> +       bio->bi_iter.bi_sector = sector;
> +       bio_set_op_attrs(bio, op, op_flags);
> 
> 
> This function is obsolete. Open code this.
> 
> 
> true, will do.
> 
> 
> 
> 
> +
> +       return bio;
> +}
> 
>  #endif /* __LINUX_BIO_H */
> 
> 
> 
> Thanks for the comments Damien.

> _______________________________________________
> Ocfs2-devel mailing list
> Ocfs2-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/ocfs2-devel

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
