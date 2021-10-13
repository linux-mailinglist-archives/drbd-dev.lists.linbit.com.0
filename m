Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B158042B732
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:30:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8BE8C420FD9;
	Wed, 13 Oct 2021 08:30:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 832AC42002F
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:30:45 +0200 (CEST)
Received: by mail-pf1-f180.google.com with SMTP id g14so1582285pfm.1
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=VuQ9K07zKhFVmW27yAURvZgXNg5Kde2VB7A9n6/jcRM=;
	b=UofdAPLwzqN9irjKYpz7rqdpJba6YSanghzltJ7hygDQHnFxjoYnCn4YD0xclCWyyn
	1QGVCjAoCfMyHBxT5bED+JODP9R8TqKO5BZ3Ypckfrxuser3a0TwMhxL4/T0VMAtKJpU
	VKx0vRkqgm8Bnukgx8yTpvFmvLGoFoDP/yYAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=VuQ9K07zKhFVmW27yAURvZgXNg5Kde2VB7A9n6/jcRM=;
	b=4AFlG2XSoLyKmHFW+2DZUFjgJvSsTJGVCeOP8YXL8ijx3n1VMkmyUSxB+6A2CvjMti
	SHOyt0ene5VJ5Iwc9m/gLxjwTMXGSK1kXQMYEte006MGwJXTfthvQFxrVzBB3Dm1Ma7V
	77PKbFqj5nA1fGk+LeVYrVG62qfSD5vIgVDbqcW0BFHF7EU4G5B+a2VZhrmgKcsLd5N3
	idvlh001IbDHoKCC2dKs4I/1h5BBD1NEQjpYt7fWrahuKZamasX409+9m7ilcMNQS+6l
	KBrmG0n3K9fjPoBY4+R2AWfo1u8RQxgb6HQ8co6YRH76Rntnikv2m4zXV95FH95jFcAs
	3Jyg==
X-Gm-Message-State: AOAM533i0BhTpT54RgRofoSGQINZJRSYVKwmIFaRViITzjp/vCvFKKEy
	0bofzbn3je1ABVFVIppcXOwFLw==
X-Google-Smtp-Source: ABdhPJxi3MilTVqoy9Kf7ydXOCYXbOlyCyon1KO3ew5UZssKOax53PkSESvwHqWMi+XXw8wleT4Yrw==
X-Received: by 2002:a05:6a00:ccb:b0:44c:eb4b:f24e with SMTP id
	b11-20020a056a000ccb00b0044ceb4bf24emr25691167pfv.16.1634106644424;
	Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	z10sm12678073pfn.70.2021.10.12.23.30.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:30:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122330.6E549D2@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-26-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-26-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 25/29] ext4: use sb_bdev_nr_blocks
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

On Wed, Oct 13, 2021 at 07:10:38AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 0775950ee84e3..3dde8be5df490 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4468,7 +4468,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto cantfind_ext4;
>  
>  	/* check blocks count against device size */
> -	blocks_count = sb->s_bdev->bd_inode->i_size >> sb->s_blocksize_bits;
> +	blocks_count = sb_bdev_nr_blocks(sb);

Wait, my bad. Yes, this is fine. It's going through two helpers. :)

Reviewed-by: Kees Cook <keescook@chromium.org>


>  	if (blocks_count && ext4_blocks_count(es) > blocks_count) {
>  		ext4_msg(sb, KERN_WARNING, "bad geometry: block count %llu "
>  		       "exceeds size of device (%llu blocks)",
> -- 
> 2.30.2
> 

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
