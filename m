Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C8F2C4EF7
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Nov 2020 07:47:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C1124207C2;
	Thu, 26 Nov 2020 07:47:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C27A8420377
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 02:16:22 +0100 (CET)
Received: by mail-pf1-f195.google.com with SMTP id 131so111193pfb.9
	for <drbd-dev@lists.linbit.com>; Wed, 25 Nov 2020 17:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=ffbgfORDd1J1xm3xxXp8xWzEs5sXbivtuhWMZ6CRpX8=;
	b=QvBDhQabcPJJmll9n1XSftf1/oCdc4AbjJKr3e1lsYr3oC6BYqnsjBtTeyYy83i7U3
	CiBd9FBSulwPjxAjN7h2emgRFMFS1h+Lw6DqhxGTuZzg7+z7LjtCeMG+R8Iu7GvPbymk
	ToF3QU0Kl5XY8lJh/Qkx9aL7d+kCec25ZtdGP0mSVt69+sY7dMUe9kHgs59VUC7F5d4d
	nBojS3btHNUmyJAhv9TgzqtLgQeQkeeQKwwl8KyW2EiBpga6aEsYA+VodfFczjdFHus+
	VDSakrHxOOPEEYbfR18sM6jijaOJSIrXZ6isVycVVCHpctMR7iHPW0kXlgmPrbk46btj
	mYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=ffbgfORDd1J1xm3xxXp8xWzEs5sXbivtuhWMZ6CRpX8=;
	b=XWCN8CIPF/3wLTiVo8dPTWWFMszymY+CHE+LnIM4xUDBludGXK5C8X1u4cqI77yj9V
	kmb1HzurLmOZWytTn4lHLSCclSLlGgvg7U9EV8uvKcL/4FhoEdI+tc1rxnQ4LrtjduR9
	791lMHf3jHWVFcdQwW1dwVNv97MUfxOrcp+GIA8NVQYNYMeJWXuIRXK5XAFhXE6Jjw3x
	rEZPxzfMNg1/rf8R9NBppfGTfPJJtPpl7KJ07i1CQ8Mi6v6Li/ZtZa0sH4K9JaJM5PNH
	mci+fs9aeqnMDrwxsz3cB7kcdACxmqPwBQMna5KfyyygXQqPJaMJjsKYypCYAyizZGw5
	jntQ==
X-Gm-Message-State: AOAM533OoI5Qi05tMG/dwyPmrupJLqExcgYpkY6qUvrXru+oVKTmiB5L
	bwbpbPlmn4ZQk4UOw5x14Po=
X-Google-Smtp-Source: ABdhPJxuwzDVcKoe4o/wMgwyIQrHY+YPGkp4YxJA+sp/vPwpgqgEvxXOvnlOmZ0BtRJFwRde4WH8Zg==
X-Received: by 2002:a62:8cc6:0:b029:19a:87b1:99bb with SMTP id
	m189-20020a628cc60000b029019a87b199bbmr637857pfd.6.1606353381534;
	Wed, 25 Nov 2020 17:16:21 -0800 (PST)
Received: from google.com (c-67-188-94-199.hsd1.ca.comcast.net.
	[67.188.94.199]) by smtp.gmail.com with ESMTPSA id
	e128sm2978987pfe.154.2020.11.25.17.16.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Nov 2020 17:16:20 -0800 (PST)
Date: Wed, 25 Nov 2020 17:16:16 -0800
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201126011616.GB57352@google.com>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-62-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116145809.410558-62-hch@lst.de>
X-Mailman-Approved-At: Thu, 26 Nov 2020 07:47:04 +0100
Cc: Justin Sanders <justin@coraid.com>, sergey.senozhatsky.work@gmail.com,
	Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 61/78] zram:  do not call set_blocksize
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

On Mon, Nov 16, 2020 at 03:57:52PM +0100, Christoph Hellwig wrote:
> set_blocksize is used by file systems to use their preferred buffer cache
> block size.  Block drivers should not set it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>

Thanks.

> ---
>  drivers/block/zram/zram_drv.c | 11 +----------
>  drivers/block/zram/zram_drv.h |  1 -
>  2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 3641434a9b154d..d00b5761ec0b21 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -403,13 +403,10 @@ static void reset_bdev(struct zram *zram)
>  		return;
>  
>  	bdev = zram->bdev;
> -	if (zram->old_block_size)
> -		set_blocksize(bdev, zram->old_block_size);
>  	blkdev_put(bdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
>  	/* hope filp_close flush all of IO */
>  	filp_close(zram->backing_dev, NULL);
>  	zram->backing_dev = NULL;
> -	zram->old_block_size = 0;
>  	zram->bdev = NULL;
>  	zram->disk->fops = &zram_devops;
>  	kvfree(zram->bitmap);
> @@ -454,7 +451,7 @@ static ssize_t backing_dev_store(struct device *dev,
>  	struct file *backing_dev = NULL;
>  	struct inode *inode;
>  	struct address_space *mapping;
> -	unsigned int bitmap_sz, old_block_size = 0;
> +	unsigned int bitmap_sz;
>  	unsigned long nr_pages, *bitmap = NULL;
>  	struct block_device *bdev = NULL;
>  	int err;
> @@ -509,14 +506,8 @@ static ssize_t backing_dev_store(struct device *dev,
>  		goto out;
>  	}
>  
> -	old_block_size = block_size(bdev);
> -	err = set_blocksize(bdev, PAGE_SIZE);
> -	if (err)
> -		goto out;
> -
>  	reset_bdev(zram);
>  
> -	zram->old_block_size = old_block_size;
>  	zram->bdev = bdev;
>  	zram->backing_dev = backing_dev;
>  	zram->bitmap = bitmap;
> diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
> index f2fd46daa76045..712354a4207c77 100644
> --- a/drivers/block/zram/zram_drv.h
> +++ b/drivers/block/zram/zram_drv.h
> @@ -118,7 +118,6 @@ struct zram {
>  	bool wb_limit_enable;
>  	u64 bd_wb_limit;
>  	struct block_device *bdev;
> -	unsigned int old_block_size;
>  	unsigned long *bitmap;
>  	unsigned long nr_pages;
>  #endif
> -- 
> 2.29.2
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
