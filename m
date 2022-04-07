Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E75124F7531
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 07:18:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F36BB421006;
	Thu,  7 Apr 2022 07:18:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EE809421003
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 07:18:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3E5F210E1;
	Thu,  7 Apr 2022 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1649308737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=A+yNUODWma7WknR/jI5cBa/CbnRiNAE8PcMaVQDIzR4=;
	b=mnCB1gF89XJ5ZS0vn/sLXjbjQHE0OVf5/BCbnACnemfg918qFrAMS1uu96deBrWbKaTk0y
	986H3NVh/IurAPnL2y9HkNS4LPMQclLG/RGT1PVgOxZNeKUsvsv1qbmzIT0Ddpaw+xC6qE
	NWA7dPYsE9i1SiYQLl3VkO1mNMjLBac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1649308737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=A+yNUODWma7WknR/jI5cBa/CbnRiNAE8PcMaVQDIzR4=;
	b=kD2ssGZ1opFQemhwtjj59lbGNVo/3qb1+9BNGH243uIB4Twx+Dpu/NW4coV8ja6JRSUAIx
	INPQyHL1JAX+fNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F2F413A66;
	Thu,  7 Apr 2022 05:18:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id 9Lo/Nzp0TmKaQQAAMHmgww
	(envelope-from <colyli@suse.de>); Thu, 07 Apr 2022 05:18:50 +0000
Message-ID: <f326944f-46b1-e888-18f6-97dcf69d945d@suse.de>
Date: Thu, 7 Apr 2022 13:18:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-26-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220406060516.409838-26-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 25/27] block: remove QUEUE_FLAG_DISCARD
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

On 4/6/22 2:05 PM, Christoph Hellwig wrote:
> Just use a non-zero max_discard_sectors as an indicator for discard
> support, similar to what is done for write zeroes.
>
> The only places where needs special attention is the RAID5 driver,
> which must clear discard support for security reasons by default,
> even if the default stacking rules would allow for it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For the bcache part,

Acked-by: Coly Li <colyli@suse.de>


Thanks.

Coly Li


> ---
>   arch/um/drivers/ubd_kern.c    |  2 --
>   block/blk-mq-debugfs.c        |  1 -
>   drivers/block/drbd/drbd_nl.c  | 15 ---------------
>   drivers/block/loop.c          |  2 --
>   drivers/block/nbd.c           |  3 ---
>   drivers/block/null_blk/main.c |  1 -
>   drivers/block/rbd.c           |  1 -
>   drivers/block/rnbd/rnbd-clt.c |  2 --
>   drivers/block/virtio_blk.c    |  2 --
>   drivers/block/xen-blkfront.c  |  2 --
>   drivers/block/zram/zram_drv.c |  1 -
>   drivers/md/bcache/super.c     |  1 -
>   drivers/md/dm-table.c         |  5 +----
>   drivers/md/dm-thin.c          |  2 --
>   drivers/md/dm.c               |  1 -
>   drivers/md/md-linear.c        |  9 ---------
>   drivers/md/raid0.c            |  7 -------
>   drivers/md/raid1.c            | 14 --------------
>   drivers/md/raid10.c           | 14 --------------
>   drivers/md/raid5.c            | 12 ++++--------
>   drivers/mmc/core/queue.c      |  1 -
>   drivers/mtd/mtd_blkdevs.c     |  1 -
>   drivers/nvme/host/core.c      |  6 ++----
>   drivers/s390/block/dasd_fba.c |  1 -
>   drivers/scsi/sd.c             |  2 --
>   include/linux/blkdev.h        |  2 --
>   26 files changed, 7 insertions(+), 103 deletions(-)
[snipped]
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 296f200b2e208..2f49e31142f62 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -973,7 +973,6 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
>   
>   	blk_queue_flag_set(QUEUE_FLAG_NONROT, d->disk->queue);
>   	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, d->disk->queue);
> -	blk_queue_flag_set(QUEUE_FLAG_DISCARD, d->disk->queue);
>   
>   	blk_queue_write_cache(q, true, true);
>   


[snipped]

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
