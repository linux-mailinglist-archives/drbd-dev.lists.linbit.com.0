Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BA432B4A
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Oct 2021 03:04:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2CBD6420FEA;
	Tue, 19 Oct 2021 03:04:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BB414202C4
	for <drbd-dev@lists.linbit.com>; Tue, 19 Oct 2021 03:04:19 +0200 (CEST)
Received: by mail-lf1-f51.google.com with SMTP id y26so3586686lfa.11
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=HZB3VynRj4BSJ+DoffwFLiPJvzPYXkayF1wJVNoXqZo=;
	b=qa7Rg2/+uz+UIDCny84Tw5bep3SlaUI84n/FAaUaxIzAubmeoa1ydJFT64PdI4Dc2i
	AgPnjhE+kBzSH4MdsJeGrFG4f0xqH2HBhd6pbyQr8O8l98NNiVXw+7LLIlFbcV+xxCqf
	RA02zj7IDRlPmKt2XOaxe9T0CtUPo6hRSub6+1M9syuYXVu4HWpZ0mdRM4b+vfFK8OI9
	lTRtKN80UFv+SDfLWbeeA+TcDubhn33n9WeCF3bZ9pFOuoi5rOJVIPb1Sykzu+pmiRnV
	qHPYjU4GPUjtfi/yhGpy4ABO9h9df+GLOdeLNWFNTfyVWJ/R/s+xiv91lAtBOCzSytMJ
	pKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=HZB3VynRj4BSJ+DoffwFLiPJvzPYXkayF1wJVNoXqZo=;
	b=2OJDTRtJ6JwtyOzY6NSd9jk7fvLEAxqUIAVWztptcDZYAwB6qnmuQBs2i0daSlYCUH
	Jjur+OTas7xxMVevTaYOEkVg08VfxbPmspHU4MEWa0wG5/M8Tuiq+/BHJgjFATWHP9YK
	IemsWr4KXUdbb233XWOC++1liEkh4zVkU944sK8SKGV76ZcWurgyYRCAOkq58LrQY2CE
	NUYyEXY5y68vE76YLQ+K2W25uCjaU+muEeh1Aiu5mQ0BZPOte4MRSbD+aEID48pE3Kgw
	VcUk7btS58x17yQIwULuv7SDYdvsvAKwlnI0RzznlP4LOc+WQbLaLBQRYQ7/I90pxgdT
	mz0w==
X-Gm-Message-State: AOAM533L00Trg2ZxxoY9hsHkgCV11l+MdH0ZJWUS1O1xwI5r8PJlMF0b
	e3ic+4jNq1PH7Idk8BFc4/A=
X-Google-Smtp-Source: ABdhPJzDOI1VPK7ec+9Wvn2TGhELLqlWyRvZ5Uhqz00hPtHEbJZTBFS39lW+J2SjR0uuodKRx0F6pg==
X-Received: by 2002:a05:6512:1284:: with SMTP id
	u4mr3097377lfs.614.1634605459500; 
	Mon, 18 Oct 2021 18:04:19 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
	by smtp.gmail.com with ESMTPSA id
	f10sm1533239lfs.56.2021.10.18.18.04.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Oct 2021 18:04:18 -0700 (PDT)
Date: Tue, 19 Oct 2021 04:04:16 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20211019010416.vgecxu6wnvwi7fii@kari-VirtualBox>
References: <20211018101130.1838532-1-hch@lst.de>
	<4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
	<20211018171843.GA3338@lst.de>
	<2f5dcf79-8419-45ff-c27c-68d43242ccfe@kernel.dk>
	<20211018174901.GA3990@lst.de>
	<e0784f3e-46c8-c90c-870b-60cc2ed7a2da@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0784f3e-46c8-c90c-870b-60cc2ed7a2da@kernel.dk>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] don't use ->bd_inode to access the block device size
	v3
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

On Mon, Oct 18, 2021 at 11:53:08AM -0600, Jens Axboe wrote:

snip..

> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 7b0326661a1e..a967b3fb3c71 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -236,14 +236,14 @@ static inline sector_t get_start_sect(struct block_device *bdev)
>  	return bdev->bd_start_sect;
>  }
>  
> -static inline loff_t bdev_nr_bytes(struct block_device *bdev)
> +static inline sector_t bdev_nr_sectors(struct block_device *bdev)
>  {
> -	return i_size_read(bdev->bd_inode);
> +	return bdev->bd_nr_sectors;
>  }
>  
> -static inline sector_t bdev_nr_sectors(struct block_device *bdev)
> +static inline loff_t bdev_nr_bytes(struct block_device *bdev)
>  {
> -	return bdev_nr_bytes(bdev) >> SECTOR_SHIFT;
> +	return bdev_nr_setors(bdev) << SECTOR_SHIFT;

setors -> sectors

>  }
>  
>  static inline sector_t get_capacity(struct gendisk *disk)
> 
> -- 
> Jens Axboe
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
