Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C29653494
	for <lists+drbd-dev@lfdr.de>; Wed, 21 Dec 2022 18:09:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7DE97422111;
	Wed, 21 Dec 2022 18:09:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 316664220C2
	for <drbd-dev@lists.linbit.com>; Wed, 21 Dec 2022 18:09:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95704B81BA7;
	Wed, 21 Dec 2022 17:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BB4C433EF;
	Wed, 21 Dec 2022 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671642545;
	bh=HexWrl21jQsZiZHSJmWAZU7Ngb+sLT1anzFCUeX4EtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eb1rcmPIHP+2ixTURffKrMR/B0JPZHtcCp3fI8SsDi38mfPsBeBn0wkQMfGl+WqEc
	EReXnaFgZ6dxXAFvqCA5sYZNrexaFNulst4/5VC+IhK9+dfLk0UscsoR2tDUYSthbK
	M4awtawpM9cIjyVwb0fPcZxSuIVWiCKFWpscUxYYw2MSmsOB4vNbHTgLNgsVg+ooik
	IcZ0YCbfl7H/IYiAM1B0U1uRfO4Z6VB3TpHQliDUvIPcxYjy+60I9d91p27S1yfLIO
	tRRPvOOuFj9CY1ZxFso107+OjTh+UkYETvwPmtbFTmvdvXK3YHpMmeqkNjJnsQImXu
	4WTH7RLaXi4MA==
Date: Wed, 21 Dec 2022 10:09:00 -0700
From: Keith Busch <kbusch@kernel.org>
To: Gulam Mohamed <gulam.mohamed@oracle.com>
Message-ID: <Y6M9rJbw3ZMvOeDr@kbusch-mbp.dhcp.thefacebook.com>
References: <20221221040506.1174644-1-gulam.mohamed@oracle.com>
	<20221221040506.1174644-2-gulam.mohamed@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221221040506.1174644-2-gulam.mohamed@oracle.com>
Cc: nvdimm@lists.linux.dev, shminderjit.singh@oracle.com,
	linux-kernel@vger.kernel.org, song@kernel.org,
	dm-devel@redhat.com, ira.weiny@intel.com, agk@redhat.com,
	drbd-dev@lists.linbit.com, dave.jiang@intel.com,
	minchan@kernel.org, vishal.l.verma@intel.com,
	konrad.wilk@oracle.com, joe.jin@oracle.com,
	kent.overstreet@gmail.com, ngupta@vflare.org, kch@nvidia.com,
	senozhatsky@chromium.org, snitzer@kernel.org, colyli@suse.de,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	dan.j.williams@intel.com, axboe@kernel.dk,
	linux-raid@vger.kernel.org, martin.petersen@oracle.com,
	rajesh.sivaramasubramaniom@oracle.com,
	philipp.reisner@linbit.com, junxiao.bi@oracle.com,
	lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH for-6.2/block V3 2/2] block: Change the
 granularity of io ticks from ms to ns
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

On Wed, Dec 21, 2022 at 04:05:06AM +0000, Gulam Mohamed wrote:
> +u64  blk_get_iostat_ticks(struct request_queue *q)
> +{
> +       return (blk_queue_precise_io_stat(q) ? ktime_get_ns() : jiffies);
> +}
> +EXPORT_SYMBOL_GPL(blk_get_iostat_ticks);
> +
>  void update_io_ticks(struct block_device *part, u64 now, bool end)
>  {
>  	u64 stamp;
> @@ -968,20 +980,26 @@ EXPORT_SYMBOL(bdev_start_io_acct);
>  u64 bio_start_io_acct(struct bio *bio)
>  {
>  	return bdev_start_io_acct(bio->bi_bdev, bio_sectors(bio),
> -				  bio_op(bio), jiffies);
> +				  bio_op(bio),
> +				  blk_get_iostat_ticks(bio->bi_bdev->bd_queue));
>  }
>  EXPORT_SYMBOL_GPL(bio_start_io_acct);
>  
>  void bdev_end_io_acct(struct block_device *bdev, enum req_op op,
>  		      u64 start_time)
>  {
> +	u64 now;
> +	u64 duration;
> +	struct request_queue *q = bdev_get_queue(bdev);
>  	const int sgrp = op_stat_group(op);
> -	u64 now = READ_ONCE(jiffies);
> -	u64 duration = (unsigned long)now -(unsigned long) start_time;
> +	now = blk_get_iostat_ticks(q);;

I don't think you can rely on the blk_queue_precise_io_stat() flag in
the completion side. The user can toggle this with data in flight, which
means the completion may use different tick units than the start. I
think you'll need to add a flag to the request in the start accounting
side to know which method to use for the completion.

> @@ -951,6 +951,7 @@ ssize_t part_stat_show(struct device *dev,
>  	struct request_queue *q = bdev_get_queue(bdev);
>  	struct disk_stats stat;
>  	unsigned int inflight;
> +	u64 stat_ioticks;
>  
>  	if (queue_is_mq(q))
>  		inflight = blk_mq_in_flight(q, bdev);
> @@ -959,10 +960,13 @@ ssize_t part_stat_show(struct device *dev,
>  
>  	if (inflight) {
>  		part_stat_lock();
> -		update_io_ticks(bdev, jiffies, true);
> +		update_io_ticks(bdev, blk_get_iostat_ticks(q), true);
>  		part_stat_unlock();
>  	}
>  	part_stat_read_all(bdev, &stat);
> +	stat_ioticks = (blk_queue_precise_io_stat(q) ?
> +				div_u64(stat.io_ticks, NSEC_PER_MSEC) :
> +				jiffies_to_msecs(stat.io_ticks));


With the user able to change the precision at will, I think these
io_ticks need to have a consistent unit size. Mixing jiffies and nsecs
is going to create garbage stats output. Could existing io_ticks using
jiffies be converted to jiffies_to_nsecs() so that you only have one
unit to consider?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
