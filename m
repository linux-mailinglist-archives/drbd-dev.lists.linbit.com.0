Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF96B4AC14
	for <lists+drbd-dev@lfdr.de>; Tue,  9 Sep 2025 13:32:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DF03A162752;
	Tue,  9 Sep 2025 13:32:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1115 seconds by postgrey-1.31 at mail19;
	Mon, 25 Aug 2025 11:10:54 CEST
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
	[45.249.212.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8A95516230D
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 11:10:54 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4c9PgR26zSzYQvWp
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 16:52:19 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D02DC1A0359
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 16:52:17 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP4 (Coremail) with SMTP id gCh0CgAncIw+JKxoslHtAA--.43715S3;
	Mon, 25 Aug 2025 16:52:15 +0800 (CST)
Message-ID: <7f401205-725e-9a83-f683-21a67500cdcd@huaweicloud.com>
Date: Mon, 25 Aug 2025 16:52:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
	Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] md: init queue_limits->max_hw_wzeroes_unmap_sectors
	parameter
To: Zhang Yi <yi.zhang@huaweicloud.com>, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
References: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
	<20250825083320.797165-2-yi.zhang@huaweicloud.com>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <20250825083320.797165-2-yi.zhang@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAncIw+JKxoslHtAA--.43715S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWUXw1fWrykZFyDur4DJwb_yoWrXw1fp3
	y7XFySvryUJay5Aa98J34UuF4Fqa45KrWqkFy3Xwn5uFy3Wr9xWF43Xa98XFsrZw15Gw17
	t3WIka9ru3WjgrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aV
	AFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E
	8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUo0eHDUUUU
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-Mailman-Approved-At: Tue, 09 Sep 2025 13:31:43 +0200
Cc: axboe@kernel.dk, martin.petersen@oracle.com, john.g.garry@oracle.com,
	yangerkun@huawei.com, yi.zhang@huawei.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	yukuai3@huawei.com, hch@lst.de
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



在 2025/8/25 16:33, Zhang Yi 写道:
> From: Zhang Yi <yi.zhang@huawei.com>
> 
> The parameter max_hw_wzeroes_unmap_sectors in queue_limits should be
> equal to max_write_zeroes_sectors if it is set to a non-zero value.
> However, the stacked md drivers call md_init_stacking_limits() to
> initialize this parameter to UINT_MAX but only adjust
> max_write_zeroes_sectors when setting limits. Therefore, this
> discrepancy triggers a value check failure in blk_validate_limits().
> 
> Fix this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
> zero.
> 
> Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
> Reported-by: John Garry <john.g.garry@oracle.com>
> Closes: https://lore.kernel.org/linux-block/803a2183-a0bb-4b7a-92f1-afc5097630d2@oracle.com/
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



LGTM, feel free to add

Reviewed-by: Li Nan <linan122@huawei.com>

-- 
Thanks,
Nan

