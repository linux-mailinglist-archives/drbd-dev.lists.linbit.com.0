Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C44903213
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 08:01:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8816B420621;
	Tue, 11 Jun 2024 08:01:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EDE5D42039E
	for <drbd-dev@lists.linbit.com>;
	Tue, 11 Jun 2024 07:53:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5366D60C88;
	Tue, 11 Jun 2024 05:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFA5C2BD10;
	Tue, 11 Jun 2024 05:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085206;
	bh=RvinM2CEhnrYy7/V+Hc/2gNsHgLPMfOqlJof5s6pLpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=acWTCLh69lElyFzhBDitf/FJSPcZHoSKSYkPin9SpKmAkY2E8tt2RX9YMgvNW08VJ
	pXyQOUrKXLHipujeCeYwwOOV1ng3liGMUrh79LCxXQAnCnsegn/0fa+OxA8G7Re61L
	fmOHhV3QGFVIYl1a9Zvr8YBZq5o5MC+kVjqKkUi4kq/pw8SNm9WHEEcZBI2M9gnJTB
	rNM+9TLvbzpYIaLgbWYUi2Bsf66NXsvZZfHsd+k+aOkAbuju2GyIYlvuYfiZ5s0zaB
	Ghir0etXCncHmfvSSJDhrNjKYgtJ1ghf+Dq41ngHLndOPehGRZnzQ4OTjdqTetZ0XF
	qcw8t2IN/8aPA==
Message-ID: <ca5a3441-768a-4331-a1c2-a4bdadf2f150@kernel.org>
Date: Tue, 11 Jun 2024 14:53:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/26] loop: stop using loop_reconfigure_limits in
	__loop_clr_fd
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-4-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 11 Jun 2024 08:01:28 +0200
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
> __loop_clr_fd wants to clear all settings on the device.  Prepare for
> moving more settings into the block limits by open coding
> loop_reconfigure_limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 93780f41646b75..93a49c40a31a71 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1133,6 +1133,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  
>  static void __loop_clr_fd(struct loop_device *lo, bool release)
>  {
> +	struct queue_limits lim;
>  	struct file *filp;
>  	gfp_t gfp = lo->old_gfp_mask;
>  
> @@ -1156,7 +1157,14 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
>  	lo->lo_offset = 0;
>  	lo->lo_sizelimit = 0;
>  	memset(lo->lo_file_name, 0, LO_NAME_SIZE);
> -	loop_reconfigure_limits(lo, 512, false);
> +
> +	/* reset the block size to the default */
> +	lim = queue_limits_start_update(lo->lo_queue);
> +	lim.logical_block_size = 512;

Nit: SECTOR_SIZE ? maybe ?

> +	lim.physical_block_size = 512;
> +	lim.io_min = 512;
> +	queue_limits_commit_update(lo->lo_queue, &lim);
> +
>  	invalidate_disk(lo->lo_disk);
>  	loop_sysfs_exit(lo);
>  	/* let user-space know about this change */

Otherwise, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

