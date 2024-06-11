Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEB90322F
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 08:07:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8B9242066E;
	Tue, 11 Jun 2024 08:07:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3FF242035E
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 08:07:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA4B3CE0B9B;
	Tue, 11 Jun 2024 05:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4CBC2BD10;
	Tue, 11 Jun 2024 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085426;
	bh=xFN1h7CLNOVeSD1DVq7Y6t3Bb5KlL582IrHJpAfOI+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fv21i4LDKBohOjAMc7pIwhaiiTsAlafv5K+jqxJasBRtlliGgCtTrXsT0H8yV5+9T
	njwksi1EuST41csRG3Vqsp2L+QlP+t8YOn8e3W08JXRiXRq8hhVj8Dagc3+6nbt30R
	F+mIQhqmSwNPdFOouK0TdZvzzsTWzz1Lqs4jPTNbQ0Jw2LrEoRIpZD54zKPNaLm1HA
	t4c032+2B98Y3f+oLMEONdKDXJVupqzzbghc2EZK18tDOe6HzPnnhx/GWgADRWFlM4
	oxYC9o2lrFo6wnGlsgbujf5T6gsAVdypUTxeMWDRMSrvLMxkDZnNQFg5hAvDm4J/fA
	kYvXmValPXY/Q==
Message-ID: <dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org>
Date: Tue, 11 Jun 2024 14:56:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/26] loop: regularize upgrading the lock size for direct
	I/O
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-6-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> The LOOP_CONFIGURE path automatically upgrades the block size to that
> of the underlying file for O_DIRECT file descriptors, but the
> LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
> pick the block size into common code.

s/lock/block in the commit title.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index c658282454af1b..4f6d8514d19bd6 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -975,10 +975,24 @@ loop_set_status_from_info(struct loop_device *lo,
>  	return 0;
>  }
>  
> +static unsigned short loop_default_blocksize(struct loop_device *lo,
> +		struct block_device *backing_bdev)
> +{
> +	/* In case of direct I/O, match underlying block size */
> +	if ((lo->lo_backing_file->f_flags & O_DIRECT) && backing_bdev)
> +		return bdev_logical_block_size(backing_bdev);
> +	return 512;

Nit: SECTOR_SIZE ?

> +}
> +
>  static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
>  {
> +	struct file *file = lo->lo_backing_file;
> +	struct inode *inode = file->f_mapping->host;
>  	struct queue_limits lim;
>  
> +	if (!bsize)
> +		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);

If bsize is specified and there is a backing dev used with direct IO, should it
be checked that bsize is a multiple of bdev_logical_block_size(backing_bdev) ?

> +
>  	lim = queue_limits_start_update(lo->lo_queue);
>  	lim.logical_block_size = bsize;
>  	lim.physical_block_size = bsize;
> @@ -997,7 +1011,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  	int error;
>  	loff_t size;
>  	bool partscan;
> -	unsigned short bsize;
>  	bool is_loop;
>  
>  	if (!file)
> @@ -1076,15 +1089,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
>  		blk_queue_write_cache(lo->lo_queue, true, false);
>  
> -	if (config->block_size)
> -		bsize = config->block_size;
> -	else if ((lo->lo_backing_file->f_flags & O_DIRECT) && inode->i_sb->s_bdev)
> -		/* In case of direct I/O, match underlying block size */
> -		bsize = bdev_logical_block_size(inode->i_sb->s_bdev);
> -	else
> -		bsize = 512;
> -
> -	error = loop_reconfigure_limits(lo, bsize);
> +	error = loop_reconfigure_limits(lo, config->block_size);
>  	if (WARN_ON_ONCE(error))
>  		goto out_unlock;
>  

-- 
Damien Le Moal
Western Digital Research

