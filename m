Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E730A266
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Feb 2021 08:06:06 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61ADF420629;
	Mon,  1 Feb 2021 08:06:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44A18420341
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 18:21:33 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C458764DED;
	Thu, 28 Jan 2021 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611854492;
	bh=wN/vYbjN9dGjcLcGdnyPwaVCaPorwnyIWndgrJa+c0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4Jj9WXKrn+6FaWHbaqLTTirarAYDVXXbmjKm43Pwyv9CvWF/FCcMNgRPgrx3ByMo
	28fxrNXlVVTo5g3juSTT+7sNpMpJgqbGb4DuHZ8KF3an7+1BY6+nbU2z1+n7iGhwih
	wkXCxISTeJgnl/ygSyJKGjvjcoECGRGnzVlWu3E9jKtn6wt5VP3JuKjRalNmzU1hCy
	4OORtBiU8sk9BK43/E82eZ6NyUeC5IBPMIffBmVCBQkowGnqLXw2BEreMWAztT9vas
	UyeabZv1xy0SE+hBOV4TAGEolTup4mRCss8y10V/Fh7qEXQ2ropSARSls0wsWRnCVn
	9DTzlrlwSUtJA==
Date: Thu, 28 Jan 2021 09:21:32 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20210128172132.GM7698@magnolia>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-27-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128071133.60335-27-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:06:02 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	gustavoars@kernel.org, sergey.senozhatsky.work@gmail.com,
	snitzer@redhat.com, tiwai@suse.de,
	linux-nvme@lists.infradead.org, philipp.reisner@linbit.com,
	linux-mm@kvack.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, pavel@ucw.cz,
	alex.shi@linux.alibaba.com, hch@lst.de, agk@redhat.com,
	drbd-dev@lists.linbit.com, naohiro.aota@wdc.com,
	linux-nilfs@vger.kernel.org, sagi@grimberg.me,
	linux-scsi@vger.kernel.org, mark@fasheh.com,
	konrad.wilk@oracle.com, osandov@fb.com, ebiggers@kernel.org,
	xen-devel@lists.xenproject.org, ngupta@vflare.org,
	len.brown@intel.com, linux-pm@vger.kernel.org, hare@suse.de,
	ming.lei@redhat.com, linux-block@vger.kernel.org, tj@kernel.org,
	linux-fscrypt@vger.kernel.org, viro@zeniv.linux.org.uk,
	jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
	jlbec@evilplan.org, konishi.ryusuke@gmail.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, akpm@linux-foundation.org,
	martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
	rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, minchan@kernel.org,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com,
	jth@kernel.org, asml.silence@gmail.com,
	ocfs2-devel@oss.oracle.com, roger.pau@citrix.com
Subject: Re: [Drbd-dev] [RFC PATCH 26/34] xfs: use bio_new in xfs_rw_bdev
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

On Wed, Jan 27, 2021 at 11:11:25PM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

Seems fine to me...
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_bio_io.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/xfs/xfs_bio_io.c b/fs/xfs/xfs_bio_io.c
> index e2148f2d5d6b..e4644f22ebe6 100644
> --- a/fs/xfs/xfs_bio_io.c
> +++ b/fs/xfs/xfs_bio_io.c
> @@ -26,11 +26,8 @@ xfs_rw_bdev(
>  	if (is_vmalloc && op == REQ_OP_WRITE)
>  		flush_kernel_vmap_range(data, count);
>  
> -	bio = bio_alloc(GFP_KERNEL, bio_max_vecs(left));
> -	bio_set_dev(bio, bdev);
> -	bio->bi_iter.bi_sector = sector;
> -	bio->bi_opf = op | REQ_META | REQ_SYNC;
> -
> +	bio = bio_new(bdev, sector, op, REQ_META | REQ_SYNC, bio_max_vecs(left),
> +		      GFP_KERNEL);
>  	do {
>  		struct page	*page = kmem_to_page(data);
>  		unsigned int	off = offset_in_page(data);
> -- 
> 2.22.1
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
