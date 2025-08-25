Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 67968B33A1C
	for <lists+drbd-dev@lfdr.de>; Mon, 25 Aug 2025 11:06:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 38C461626FA;
	Mon, 25 Aug 2025 11:05:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 377 seconds by postgrey-1.31 at mail19;
	Mon, 25 Aug 2025 11:05:47 CEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB051160644
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 11:05:47 +0200 (CEST)
Received: from [192.168.0.5] (ip5f5af7f1.dynamic.kabel-deutschland.de
	[95.90.247.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 952C461E64852;
	Mon, 25 Aug 2025 10:59:07 +0200 (CEST)
Message-ID: <8c843d2c-56c1-44af-aa1f-59675885747e@molgen.mpg.de>
Date: Mon, 25 Aug 2025 10:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] md: init queue_limits->max_hw_wzeroes_unmap_sectors
	parameter
To: Zhang Yi <yi.zhang@huaweicloud.com>
References: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
	<20250825083320.797165-2-yi.zhang@huaweicloud.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250825083320.797165-2-yi.zhang@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org, martin.petersen@oracle.com,
	john.g.garry@oracle.com, yangerkun@huawei.com,
	yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	yukuai3@huawei.com, hch@lst.de, drbd-dev@lists.linbit.com
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

Dear Yi,


Thank you for your patch.

Am 25.08.25 um 10:33 schrieb Zhang Yi:
> From: Zhang Yi <yi.zhang@huawei.com>
> 
> The parameter max_hw_wzeroes_unmap_sectors in queue_limits should be
> equal to max_write_zeroes_sectors if it is set to a non-zero value.

Excuse my ignorance, but why?

> However, the stacked md drivers call md_init_stacking_limits() to
> initialize this parameter to UINT_MAX but only adjust
> max_write_zeroes_sectors when setting limits. Therefore, this
> discrepancy triggers a value check failure in blk_validate_limits().
> 
> Fix this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
> zero.

In `linear_set_limits()` and `raid0_set_limits()` you set it to 
`mddev->chunk_sectors`. Is that intentional?

> Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
> Reported-by: John Garry <john.g.garry@oracle.com>
> Closes: https://lore.kernel.org/linux-block/803a2183-a0bb-4b7a-92f1-afc5097630d2@oracle.com/

It’d be great if you added the test case to the commit message.

> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>   drivers/md/md-linear.c | 1 +
>   drivers/md/raid0.c     | 1 +
>   drivers/md/raid1.c     | 1 +
>   drivers/md/raid10.c    | 1 +
>   drivers/md/raid5.c     | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
> index 5d9b08115375..3e1f165c2d20 100644
> --- a/drivers/md/md-linear.c
> +++ b/drivers/md/md-linear.c
> @@ -73,6 +73,7 @@ static int linear_set_limits(struct mddev *mddev)
>   	md_init_stacking_limits(&lim);
>   	lim.max_hw_sectors = mddev->chunk_sectors;
>   	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
> +	lim.max_hw_wzeroes_unmap_sectors = mddev->chunk_sectors;
>   	lim.io_min = mddev->chunk_sectors << 9;
>   	err = mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
>   	if (err)
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index f1d8811a542a..419139ad7663 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -382,6 +382,7 @@ static int raid0_set_limits(struct mddev *mddev)
>   	md_init_stacking_limits(&lim);
>   	lim.max_hw_sectors = mddev->chunk_sectors;
>   	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
> +	lim.max_hw_wzeroes_unmap_sectors = mddev->chunk_sectors;
>   	lim.io_min = mddev->chunk_sectors << 9;
>   	lim.io_opt = lim.io_min * mddev->raid_disks;
>   	lim.chunk_sectors = mddev->chunk_sectors;
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index 408c26398321..35c6498b4917 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -3211,6 +3211,7 @@ static int raid1_set_limits(struct mddev *mddev)
>   
>   	md_init_stacking_limits(&lim);
>   	lim.max_write_zeroes_sectors = 0;
> +	lim.max_hw_wzeroes_unmap_sectors = 0;
>   	lim.features |= BLK_FEAT_ATOMIC_WRITES;
>   	err = mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
>   	if (err)
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index b60c30bfb6c7..9832eefb2f15 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -4008,6 +4008,7 @@ static int raid10_set_queue_limits(struct mddev *mddev)
>   
>   	md_init_stacking_limits(&lim);
>   	lim.max_write_zeroes_sectors = 0;
> +	lim.max_hw_wzeroes_unmap_sectors = 0;
>   	lim.io_min = mddev->chunk_sectors << 9;
>   	lim.chunk_sectors = mddev->chunk_sectors;
>   	lim.io_opt = lim.io_min * raid10_nr_stripes(conf);
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 023649fe2476..e385ef1355e8 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -7732,6 +7732,7 @@ static int raid5_set_limits(struct mddev *mddev)
>   	lim.features |= BLK_FEAT_RAID_PARTIAL_STRIPES_EXPENSIVE;
>   	lim.discard_granularity = stripe;
>   	lim.max_write_zeroes_sectors = 0;
> +	lim.max_hw_wzeroes_unmap_sectors = 0;
>   	mddev_stack_rdev_limits(mddev, &lim, 0);
>   	rdev_for_each(rdev, mddev)
>   		queue_limits_stack_bdev(&lim, rdev->bdev, rdev->new_data_offset,

