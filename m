Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480542B750
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:33:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 65A04420FF8;
	Wed, 13 Oct 2021 08:33:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EBEC42002F
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:33:06 +0200 (CEST)
Received: by mail-pj1-f44.google.com with SMTP id
	pf6-20020a17090b1d8600b0019fa884ab85so3630106pjb.5
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=WOss03228JS+U0E2OXL79/LG2Z2ctX8IyohOEDd3STQ=;
	b=SG8eTx4PGHBkPjipBIRHezrGg40X7FKDH3dcqzGEh0ZG/tSW8qND+TAMrNp3f/wqwx
	MhgHQ6qj4VZF73LZ68/IqBwYNjD0oJqF3VY+z4T9q23FV/6ltSnjivxfcuufOGGKlehP
	NgIRnRpzLQoV7Ik4Dnr+7MYlEdDMy98DEnQAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=WOss03228JS+U0E2OXL79/LG2Z2ctX8IyohOEDd3STQ=;
	b=DPaKzwPhJzb7RGfgMiLEmvpXSc2fCIN0CI9TgpBPl0/q3ESnrb63xjIUHOwwUbaQJB
	p3Pri6qC2wcDv0KVLANo7P+35XSoqjrmSeyXtq09wjEW8ZAPMjeK2VSlL5AhdaDvXWk/
	HCk0w50k4N9yc2AzE7TI8e7rE4olL+Qh0YzoqWxpuew+LMwMYP7y5/7boeB5N8Ew3t/C
	hZYvCNkchJAX2oSVuKMwIyNVFeDlVlGRUKkNrD0jE6o9CEOHUPgGf5QegOkQ8LtfqDRD
	3mwk6CyB/SxedRZv7pEWLz5iJDFF1HOk7uZOeBMSbvCjPvKfeRqtHZ4vuFhQGv44jDit
	VHkw==
X-Gm-Message-State: AOAM5311k1+cROhPrFvG7vtGhEHSSBS4UWp2m1oFQh2izE+CiaEGdRdj
	5fc1QeR5pdkVuLGom18FhesRWg==
X-Google-Smtp-Source: ABdhPJznx7wYhVexbMFNDV4dCepvElOzihP1I4t7IwLHfcLc7mdWs+S7z03dgD05iBEaGZ31xHHwig==
X-Received: by 2002:a17:90b:368a:: with SMTP id
	mj10mr2200890pjb.201.1634106786111; 
	Tue, 12 Oct 2021 23:33:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	r31sm4746519pjg.28.2021.10.12.23.33.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:33:05 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:33:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122332.53B5925A@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-28-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-28-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 27/29] ntfs: use sb_bdev_nr_blocks
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

On Wed, Oct 13, 2021 at 07:10:40AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ntfs/super.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 0d7e948cb29c9..5ae8de09b271b 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -2772,13 +2772,12 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
>  	ntfs_debug("Set device block size to %i bytes (block size bits %i).",
>  			blocksize, sb->s_blocksize_bits);
>  	/* Determine the size of the device in units of block_size bytes. */
> -	if (!i_size_read(sb->s_bdev->bd_inode)) {
> +	vol->nr_blocks = sb_bdev_nr_blocks(sb);
> +	if (!vol->nr_blocks) {

I might be worth mentioning in the commit log why this is safe (i.e. the
"side effect" of the assignment doesn't need to be delayed since it will
be thrown away in the failure path).

>  		if (!silent)
>  			ntfs_error(sb, "Unable to determine device size.");
>  		goto err_out_now;
>  	}
> -	vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
> -			sb->s_blocksize_bits;
>  	/* Read the boot sector and return unlocked buffer head to it. */
>  	if (!(bh = read_ntfs_boot_sector(sb, silent))) {
>  		if (!silent)
> @@ -2816,8 +2815,7 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
>  			goto err_out_now;
>  		}
>  		BUG_ON(blocksize != sb->s_blocksize);
> -		vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
> -				sb->s_blocksize_bits;
> +		vol->nr_blocks = sb_bdev_nr_blocks(sb);
>  		ntfs_debug("Changed device block size to %i bytes (block size "
>  				"bits %i) to match volume sector size.",
>  				blocksize, sb->s_blocksize_bits);

Reviewed-by: Kees Cook <keescook@chromium.org>


> -- 
> 2.30.2
> 

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
