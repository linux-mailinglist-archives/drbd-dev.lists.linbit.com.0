Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE54F78C4
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 10:03:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8CA442101D;
	Thu,  7 Apr 2022 10:03:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2336C421016
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 10:03:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA7481F859;
	Thu,  7 Apr 2022 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1649318596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=7k0z5t+RkWgzil40AtKwhJmpL0iBjAFtHXia6nIwjc8=;
	b=BFj1weRWNO0gJwf1a0jytpVaNV2SIOQyml/DNHaVaAYv+GWtC9RRp3Nkr1QhUY/V7QdLG9
	baoJsXmF2FufEolsvsTPwbwZ3Or5/MyPwA8jPnqPoYDtXH5U9TjRT7F8cNWLR3Nqx6fvJv
	Ws2fOIHqbo98FqfWwnQjig+YJFloGxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1649318596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=7k0z5t+RkWgzil40AtKwhJmpL0iBjAFtHXia6nIwjc8=;
	b=DjSOFiN41nmAx2XAVq/tnPaDKbkIhCw6FaIeWu9KyiZMi8ecy7DPyjacZPoBAIl6E7Jspy
	2pyi9oy0n8T7WCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CF8613485;
	Thu,  7 Apr 2022 08:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id F2mtCL+aTmKlAgAAMHmgww
	(envelope-from <colyli@suse.de>); Thu, 07 Apr 2022 08:03:11 +0000
Message-ID: <9f91936a-7dd7-2ee6-3293-f199ada85210@suse.de>
Date: Thu, 7 Apr 2022 16:03:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-23-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220406060516.409838-23-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 22/27] block: refactor discard bio size
	limiting
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 4/6/22 2:05 PM, Christoph Hellwig wrote:
> Move all the logic to limit the discard bio size into a common helper
> so that it is better documented.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Coly Li <colyli@suse.de>


Thanks for the change.

Coly Li


> ---
>   block/blk-lib.c | 59 ++++++++++++++++++++++++-------------------------
>   block/blk.h     | 14 ------------
>   2 files changed, 29 insertions(+), 44 deletions(-)
>
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index 237d60d8b5857..2ae32a722851c 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -10,6 +10,32 @@
>   
>   #include "blk.h"
>   
> +static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
> +{
> +	unsigned int discard_granularity =
> +		bdev_get_queue(bdev)->limits.discard_granularity;
> +	sector_t granularity_aligned_sector;
> +
> +	if (bdev_is_partition(bdev))
> +		sector += bdev->bd_start_sect;
> +
> +	granularity_aligned_sector =
> +		round_up(sector, discard_granularity >> SECTOR_SHIFT);
> +
> +	/*
> +	 * Make sure subsequent bios start aligned to the discard granularity if
> +	 * it needs to be split.
> +	 */
> +	if (granularity_aligned_sector != sector)
> +		return granularity_aligned_sector - sector;
> +
> +	/*
> +	 * Align the bio size to the discard granularity to make splitting the bio
> +	 * at discard granularity boundaries easier in the driver if needed.
> +	 */
> +	return round_down(UINT_MAX, discard_granularity) >> SECTOR_SHIFT;
> +}
> +
>   int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>   		sector_t nr_sects, gfp_t gfp_mask, int flags,
>   		struct bio **biop)
> @@ -17,7 +43,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>   	struct request_queue *q = bdev_get_queue(bdev);
>   	struct bio *bio = *biop;
>   	unsigned int op;
> -	sector_t bs_mask, part_offset = 0;
> +	sector_t bs_mask;
>   
>   	if (bdev_read_only(bdev))
>   		return -EPERM;
> @@ -48,36 +74,9 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>   	if (!nr_sects)
>   		return -EINVAL;
>   
> -	/* In case the discard request is in a partition */
> -	if (bdev_is_partition(bdev))
> -		part_offset = bdev->bd_start_sect;
> -
>   	while (nr_sects) {
> -		sector_t granularity_aligned_lba, req_sects;
> -		sector_t sector_mapped = sector + part_offset;
> -
> -		granularity_aligned_lba = round_up(sector_mapped,
> -				q->limits.discard_granularity >> SECTOR_SHIFT);
> -
> -		/*
> -		 * Check whether the discard bio starts at a discard_granularity
> -		 * aligned LBA,
> -		 * - If no: set (granularity_aligned_lba - sector_mapped) to
> -		 *   bi_size of the first split bio, then the second bio will
> -		 *   start at a discard_granularity aligned LBA on the device.
> -		 * - If yes: use bio_aligned_discard_max_sectors() as the max
> -		 *   possible bi_size of the first split bio. Then when this bio
> -		 *   is split in device drive, the split ones are very probably
> -		 *   to be aligned to discard_granularity of the device's queue.
> -		 */
> -		if (granularity_aligned_lba == sector_mapped)
> -			req_sects = min_t(sector_t, nr_sects,
> -					  bio_aligned_discard_max_sectors(q));
> -		else
> -			req_sects = min_t(sector_t, nr_sects,
> -					  granularity_aligned_lba - sector_mapped);
> -
> -		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
> +		sector_t req_sects =
> +			min(nr_sects, bio_discard_limit(bdev, sector));
>   
>   		bio = blk_next_bio(bio, bdev, 0, op, gfp_mask);
>   		bio->bi_iter.bi_sector = sector;
> diff --git a/block/blk.h b/block/blk.h
> index 8ccbc6e076369..1fdc1d28e6d60 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -346,20 +346,6 @@ static inline unsigned int bio_allowed_max_sectors(struct request_queue *q)
>   	return round_down(UINT_MAX, queue_logical_block_size(q)) >> 9;
>   }
>   
> -/*
> - * The max bio size which is aligned to q->limits.discard_granularity. This
> - * is a hint to split large discard bio in generic block layer, then if device
> - * driver needs to split the discard bio into smaller ones, their bi_size can
> - * be very probably and easily aligned to discard_granularity of the device's
> - * queue.
> - */
> -static inline unsigned int bio_aligned_discard_max_sectors(
> -					struct request_queue *q)
> -{
> -	return round_down(UINT_MAX, q->limits.discard_granularity) >>
> -			SECTOR_SHIFT;
> -}
> -
>   /*
>    * Internal io_context interface
>    */


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
