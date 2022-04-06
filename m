Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF94F5827
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 10:59:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12478420FBF;
	Wed,  6 Apr 2022 10:59:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 428 seconds by postgrey-1.31 at mail19;
	Wed, 06 Apr 2022 10:59:51 CEST
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D8EC742011D
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 10:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1649235591; x=1680771591;
	h=message-id:date:mime-version:subject:to:cc:references:
	from:in-reply-to:content-transfer-encoding;
	bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt9/3x5IFU=;
	b=kjL0h1G9oPIZf040k4JvI7lLgSHas26LPh+tc+blB0SDm65v7WLAkFAY
	pq5uFEiUnd/muLXZ0v9YDAMUA5blqd+s6ZTdehMZ9cjlwBud7MTefIXhq
	WHiCvjnb4CdJFLjzbOIro2cYqFGC5Ayivzl5SXD8KCvOJ0xUJyaE7ozzu
	pLPYL5bJdwZthX1Bfnbp+zFrydMEiPCDXu4hmrhaBSoTQhSbUEs7q+hNm
	NrCPK+BTMTRZOuX0ZtaaIyHV/6yk5e8nssbP8wR1Fn5zasW8y9HzrYvRu
	jzHzKkTAADnajawoxRQYGA42p4hP5KqTAc7NT2sHBOzKbQHs1My8eDgey w==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; d="scan'208";a="202066080"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 16:52:40 +0800
IronPort-SDR: Aa1HWbWO7Vr4bO3+UDgtD0wCkxCPWOoDWfNKxlpQq3Yfb9DHzRiZ9GU7NpmqIBrcal6ywfuTfo
	ZudlW0Zh6hZoViPlaBHwSjbT6Fpgcn/1VOMEOplT9K8D7CNh2V65fT5Ze9QU3r561QbkV19Evx
	SxJMSrglu8pl3TAr0/orBsHpj8L2Yo442v2tRc4WyuaV1/h6DaAYHdYG6RJt4VGB1nrGF7lo0r
	vAjBMhK1xBDMueGs9iADMGtPQBCro5j24e4+hcdoV7dWD9w+JiDKgq+jggVC0n7f6tk7XreYw/
	xV/Mr9t9O9H+r5fP5sKSxyRG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	06 Apr 2022 01:24:14 -0700
IronPort-SDR: X0plsfF5db3S292undHAbbLGKlOCOc7B/11sTNYlAqNfCh9CdLbPx0/4O0Poh4KeJHgtXjhEjU
	3o5KJDryG9WjY0+Zj+h5jLwIyeDI4xjHIW/n0mOOXnK6boVidfS9IS7P3XOla5LzipuwOfaDVM
	4UZY1pXdmfm9+mf6iaVC0oveq1w/bsCuuYasJQAQXoM+NWGN/vpkL3KwIkK3+ME3dIwUUq4fIn
	ravKik7bEe75JNvzHtLeqgCsImngwAWCJ21KEV+nMMkH36jiKwCkWcP4ElZ9y27EkedNLku4bb
	5Vc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
	by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	06 Apr 2022 01:52:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYJDm5pfvz1SVny
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 01:52:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649235159; x=1651827160; bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt
	9/3x5IFU=; b=ikqDdTG9ODAQQF/gXGSxdqGX933yPoUen760dZAYRlO1pjUicgY
	QNTmeVuFXL3991m5ocJlTZlAM/kL9Y+0/7Vqh369/+y1rd8dHIZCsirzcij49SEY
	lzAIBh2wf5Sf3ey+zlsq0uODq7OVssECPvEDwFf8vv6EXSj1/hUZOIgCb1YrW8o1
	2M9SVtb0B4XKp93g7XBI0ujENrB5hIjr3CO5qzrkEqkMATglY4o3RYlHRiXsW1Sz
	sYLuDt6RTZ47ylFhS4lgN/BBnpVQ7fdiQZnyYCU5qRit9Am3tawi9wutpwWz+FNF
	LQkskhLFb7giNbGTHrp0y0pi3f33Krg86Fg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	(amavisd-new, port 10026)
	with ESMTP id lFTexs7ry3dS for <drbd-dev@lists.linbit.com>;
	Wed,  6 Apr 2022 01:52:39 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYJDg4WyPz1Rvlx;
	Wed,  6 Apr 2022 01:52:35 -0700 (PDT)
Message-ID: <ea3d14cb-00ea-8d7b-4615-9347fdd7aa27@opensource.wdc.com>
Date: Wed, 6 Apr 2022 17:52:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-15-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220406060516.409838-15-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 14/27] block: add a
	bdev_max_zone_append_sectors helper
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

On 4/6/22 15:05, Christoph Hellwig wrote:
> Add a helper to check the max supported sectors for zone append based on
> the block_device instead of having to poke into the block layer internal
> request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/target/zns.c | 3 +--
>   fs/zonefs/super.c         | 3 +--
>   include/linux/blkdev.h    | 6 ++++++
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index e34718b095504..82b61acf7a72b 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -34,8 +34,7 @@ static int validate_conv_zones_cb(struct blk_zone *z,
>   
>   bool nvmet_bdev_zns_enable(struct nvmet_ns *ns)
>   {
> -	struct request_queue *q = ns->bdev->bd_disk->queue;
> -	u8 zasl = nvmet_zasl(queue_max_zone_append_sectors(q));
> +	u8 zasl = nvmet_zasl(bdev_max_zone_append_sectors(ns->bdev));
>   	struct gendisk *bd_disk = ns->bdev->bd_disk;
>   	int ret;
>   
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 3614c7834007d..7a63807b736c4 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -678,13 +678,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	struct zonefs_inode_info *zi = ZONEFS_I(inode);
>   	struct block_device *bdev = inode->i_sb->s_bdev;
> -	unsigned int max;
> +	unsigned int max = bdev_max_zone_append_sectors(bdev);
>   	struct bio *bio;
>   	ssize_t size;
>   	int nr_pages;
>   	ssize_t ret;
>   
> -	max = queue_max_zone_append_sectors(bdev_get_queue(bdev));
>   	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
>   	iov_iter_truncate(from, max);
>   
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index a433798c3343e..f8c50b77543eb 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1188,6 +1188,12 @@ static inline unsigned int queue_max_zone_append_sectors(const struct request_qu
>   	return min(l->max_zone_append_sectors, l->max_sectors);
>   }
>   
> +static inline unsigned int
> +bdev_max_zone_append_sectors(struct block_device *bdev)
> +{
> +	return queue_max_zone_append_sectors(bdev_get_queue(bdev));
> +}
> +
>   static inline unsigned queue_logical_block_size(const struct request_queue *q)
>   {
>   	int retval = 512;

Looks good.

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
