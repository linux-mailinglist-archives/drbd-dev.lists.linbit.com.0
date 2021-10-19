Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96E432B58
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Oct 2021 03:05:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A40B420FED;
	Tue, 19 Oct 2021 03:05:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 755D44202C4
	for <drbd-dev@lists.linbit.com>; Tue, 19 Oct 2021 03:05:00 +0200 (CEST)
Received: by mail-io1-f50.google.com with SMTP id e144so18491792iof.3
	for <drbd-dev@lists.linbit.com>; Mon, 18 Oct 2021 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=W5z0exFABNpBPX1hRqcH8nqG0V53/7e/1qraB3crDBc=;
	b=vB+wFpSQtfAUhwdXcfynbmYwp0hdBEQZvbX6X9F6PNzCrR7jlF3UU0FKlXz+m74FXo
	fYCfnp+UOHId9lQV8O9fyEh4YEI0b538At136V3n0vh4OZ/YzMev/Q7gmlb/eOGGE5cU
	0c1i9lZ2acvXLmYa878iz+lCi3R78xqn0ZDpYtIVtZNxoFJsKdSEsj9/YVhugl90Ar3H
	SoUxghi0wJ6VSD6JvL3P+s/JM6f3Wm0mmMYFgaEag1ojhi+wlEeYXumrYWwARkL2eroz
	Ue9QqS/6wvsrqGxlajrxCGxhjXwobZTI+icumh8oCIQgK1Jfr75Nwh+NZuFxcTfoqOvP
	WcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W5z0exFABNpBPX1hRqcH8nqG0V53/7e/1qraB3crDBc=;
	b=4e8YZzbEbxMFb9s51xxehcuUd1+XDrIuFll7/V3aOUpzdb54IiTm9NLeg6tfanNXkv
	3gq69ZYnmLsROiOen80L+dk96jSZZyFpnZWpCx8J2u0CGKnv1mVHy650nE+3kZxwxhhv
	USeLBC+PNtUCgrzVsTygeEpbkFsXW9cby6gnczr21xzdT1byHEIFVbDRdTFqDSfzQaqC
	OMyvTTxZv2BeBamTR8IfUp+RA/aP4CDdR6knZhkEbalC1jOXw/Ceyd5V/ApW6w0DNIVL
	RJO1Yr66qnKAukafzz11RwG9p2eiPatfD/mWBHmVLtqp87lsT0MacnKzCalLzBiRMLmX
	8D7Q==
X-Gm-Message-State: AOAM5309XyeJV0Mmn5OIb9TBwYWJ9tVw8pD6FUMVYdbclBB3vMMt/xSR
	5kwSc0LrR8DJNrSjOo6Ab8ALrg==
X-Google-Smtp-Source: ABdhPJxThXMAcCMjPpDBYOBzNUVp6z4TAqcvNSoJJDW60phmikuRtzHD4NR4koFPUymcotmxVpLHsA==
X-Received: by 2002:a6b:102:: with SMTP id 2mr16592131iob.185.1634605499259;
	Mon, 18 Oct 2021 18:04:59 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
	by smtp.gmail.com with ESMTPSA id g13sm116963ilf.60.2021.10.18.18.04.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 18 Oct 2021 18:04:58 -0700 (PDT)
To: Kari Argillander <kari.argillander@gmail.com>
References: <20211018101130.1838532-1-hch@lst.de>
	<4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
	<20211018171843.GA3338@lst.de>
	<2f5dcf79-8419-45ff-c27c-68d43242ccfe@kernel.dk>
	<20211018174901.GA3990@lst.de>
	<e0784f3e-46c8-c90c-870b-60cc2ed7a2da@kernel.dk>
	<20211019010416.vgecxu6wnvwi7fii@kari-VirtualBox>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <81f9ad59-4c15-b265-1274-62c987ad879b@kernel.dk>
Date: Mon, 18 Oct 2021 19:04:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211019010416.vgecxu6wnvwi7fii@kari-VirtualBox>
Content-Language: en-US
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

On 10/18/21 7:04 PM, Kari Argillander wrote:
> On Mon, Oct 18, 2021 at 11:53:08AM -0600, Jens Axboe wrote:
> 
> snip..
> 
>> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
>> index 7b0326661a1e..a967b3fb3c71 100644
>> --- a/include/linux/genhd.h
>> +++ b/include/linux/genhd.h
>> @@ -236,14 +236,14 @@ static inline sector_t get_start_sect(struct block_device *bdev)
>>  	return bdev->bd_start_sect;
>>  }
>>  
>> -static inline loff_t bdev_nr_bytes(struct block_device *bdev)
>> +static inline sector_t bdev_nr_sectors(struct block_device *bdev)
>>  {
>> -	return i_size_read(bdev->bd_inode);
>> +	return bdev->bd_nr_sectors;
>>  }
>>  
>> -static inline sector_t bdev_nr_sectors(struct block_device *bdev)
>> +static inline loff_t bdev_nr_bytes(struct block_device *bdev)
>>  {
>> -	return bdev_nr_bytes(bdev) >> SECTOR_SHIFT;
>> +	return bdev_nr_setors(bdev) << SECTOR_SHIFT;
> 
> setors -> sectors

Yep, did catch that prior.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
