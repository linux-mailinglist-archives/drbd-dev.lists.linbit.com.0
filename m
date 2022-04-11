Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A174FBE6F
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Apr 2022 16:12:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 866844202F4;
	Mon, 11 Apr 2022 16:12:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 641 seconds by postgrey-1.31 at mail19;
	Mon, 11 Apr 2022 16:12:29 CEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43B5F42018F
	for <drbd-dev@lists.linbit.com>;
	Mon, 11 Apr 2022 16:12:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B15B6125C;
	Mon, 11 Apr 2022 14:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E77C385A4;
	Mon, 11 Apr 2022 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649685706;
	bh=aoF5JI4oA+WPgt/y0IgsxtsbxAXaCuGafPntNOloKP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3DJooO+lpgxb0V7M65iVrqmxI0PEssCJPh+vJ1dEw1YBTDUO4k0Ftowa06gEpR83
	S1WtT+TAlqYOA3SV5oPOUKBv5r5Czq1jXlmgnBC2vlAsKUSP12Z7m3WPk2IIXa7ddE
	7+rat37phwTAQkXhdDcOfyIkaP50hX9uWu9MCv3Yv354dhMqhNyhEKK5VIXvkcNSo/
	Yw75O5ZXcRgYxwAIHqrZej/c3adf+HQOwXoAdC34I68eRF5zbda1Ysdnlbmc/q5KXa
	+yAvml8INLRMKi4FRTZn17313igwH9BKq1x7zfZpQGp7kDf9WzbZnpQOZP3oofxBEN
	wCj97MUpv05qA==
Date: Mon, 11 Apr 2022 08:01:41 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YlQ0xbtIcf8gti43@kbusch-mbp.dhcp.thefacebook.com>
References: <20220409045043.23593-1-hch@lst.de>
	<20220409045043.23593-25-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, Coly Li <colyli@suse.de>,
	Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
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

On Sat, Apr 09, 2022 at 06:50:40AM +0200, Christoph Hellwig wrote:
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index efb85c6d8e2d5..7e07dd69262a7 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1607,10 +1607,8 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
>  	struct request_queue *queue = disk->queue;
>  	u32 size = queue_logical_block_size(queue);
>  
> -	if (ctrl->max_discard_sectors == 0) {
> -		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, queue);
> +	if (ctrl->max_discard_sectors == 0)
>  		return;
> -	}

I think we need to update the queue limit in this condition. While unlikley,
the flag was cleared here in case the device changed support for discard from
the previous reset. 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
