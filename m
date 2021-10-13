Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31142D4BF
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Oct 2021 10:25:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CC5E420FF2;
	Thu, 14 Oct 2021 10:25:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5024A420FF1
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 11:31:14 +0200 (CEST)
Received: by mail-ed1-f47.google.com with SMTP id g10so7620975edj.1
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jSDv3nCwYvRWF60PFzYmVFtCqi6n+8kG/qLGRQcEwXY=;
	b=XDrKXspyEQaSQYdqJnWhS/O0wblIXJrWl9pE6svv7KjgrDGVXul7dxFR95SMikNbI8
	dPBwNGXnMZrq9ECfkN9qd8qudIplcKbKQ02+dvBybldEqKgGTDn4o+Q+1yZvLDbQTpxH
	j0F3JAFmKpiVLRpHTHEBPzaDyzHphlM3B0d+/j7Ro7xiITFiea8XjX1E/h70+j8E07xJ
	iueofrb4NiJyC6FBpvAD+REiiIZXBpKUegBHgRICkLNGzc50RGa+mMfC0qBppipcUZ0O
	0MOGnuc/w5sEpIO1qpW0KnLTEIw6dv//T71InSxwu/1xkmLMW6ESgvB/ttIEAHR+9lRU
	du6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jSDv3nCwYvRWF60PFzYmVFtCqi6n+8kG/qLGRQcEwXY=;
	b=tEFrDdzMs7QqOetK7IwQOwlOZyf/GOnXcs+nVchgPsL7NJdZEyL457kmRuNvcoAwAh
	OkMf/w+8HdujvjPoEQnIxsjoFCdxeN83Y42As4/K23oVH92h0Zm9b+aBNSMNgkz80/IP
	3x7bSkHxZD4noXevXXZnQu/bipYzHF8PG5BxHamxzgZrUCnVOjGOtYT/+GMhix2VCuBv
	R/0F587wVv2FV3VlJG33izdgLdAtUMh/Tjb786iehCbaqwPuj9Xm1Rkm6wBeX6HT7JEY
	9aE05f/SvLkPPMphgwfNZUvp69AojNVZe3Lir9VwbQJo9HwG2ZlhRTe7FTSvkywAZ9Ft
	Eq2A==
X-Gm-Message-State: AOAM533LGiHCt+F2PbRvXdzvvBJIg1Bn/5asIkbgE0RnaF2fozsnzSMC
	XSyHmVPok74Zeg930GBv68I=
X-Google-Smtp-Source: ABdhPJzWnNPujm70ssX25zhSqx1K1lXHECTOGOjBrmNCExix4poiHSM5QToDrvQz8D7ttpAXJOx3mg==
X-Received: by 2002:a05:6402:51d0:: with SMTP id
	r16mr7954872edd.353.1634117473882; 
	Wed, 13 Oct 2021 02:31:13 -0700 (PDT)
Received: from [192.168.178.40] (ipbcc061e7.dynamic.kabel-deutschland.de.
	[188.192.97.231])
	by smtp.gmail.com with ESMTPSA id p7sm7639013edr.6.2021.10.13.02.31.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 13 Oct 2021 02:31:13 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-8-hch@lst.de>
From: Bodo Stroesser <bostroesser@gmail.com>
Message-ID: <3babe7ca-cf08-fd19-6793-39f6d78bca12@gmail.com>
Date: Wed, 13 Oct 2021 11:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-8-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:25:15 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
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
Subject: Re: [Drbd-dev] [PATCH 07/29] target/iblock: use bdev_nr_sectors
 instead of open coding it
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

On 13.10.21 07:10, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/target/target_core_iblock.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
> index 31df20abe141f..ab7f5678ebc44 100644
> --- a/drivers/target/target_core_iblock.c
> +++ b/drivers/target/target_core_iblock.c
> @@ -232,8 +232,9 @@ static unsigned long long iblock_emulate_read_cap_with_block_size(
>   	struct block_device *bd,
>   	struct request_queue *q)
>   {
> -	unsigned long long blocks_long = (div_u64(i_size_read(bd->bd_inode),
> -					bdev_logical_block_size(bd)) - 1);
> +	loff_t size = bdev_nr_sectors(bd) << SECTOR_SHIFT;
> +	unsigned long long blocks_long =
> +		div_u64(size, bdev_logical_block_size(bd)) - 1;
>   	u32 block_size = bdev_logical_block_size(bd);

To enhance readability, would it make sense to shift the new lines
behind "u32 block_size = ...", so block_size can be used in div_u64
instead of using bdev_logical_block_size twice?

>   
>   	if (block_size == dev->dev_attrib.block_size)
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
