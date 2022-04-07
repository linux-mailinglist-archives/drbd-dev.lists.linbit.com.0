Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CE34F8399
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 17:35:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6B6242100C;
	Thu,  7 Apr 2022 17:35:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 90B39421022
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 17:34:06 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id B53392129B;
	Thu,  7 Apr 2022 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649345134;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=u5NLYRb0iRWqH+wp45tMsxWQ+2lcKX7UH+x3jrUc4CM=;
	b=gyRKbvUTSeCHD0kZFeha6b8GtwnfMcBVdpUrcZUXAMFpgjyGa2cKvGcE+1LQgsvJsr0yFR
	VJy4sQoNdJcuIc7oMupD7ITgqoAKAsjuZZusxwRbFTjJc52vRJgP/0hGLJXdzVq3P3r19L
	5WyRvzygj8B2JBXB13wX08lyO4vdhmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649345134;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=u5NLYRb0iRWqH+wp45tMsxWQ+2lcKX7UH+x3jrUc4CM=;
	b=h4c6BQrPPD9W33KeeEtgIxkffE6SxGamCvLBsxsw2FlmdG/K+M8MV8ruvANXF9Az9aOJRY
	CNJk3HEoegzTiHDg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id A2CECA3B94;
	Thu,  7 Apr 2022 15:25:34 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 7459CDA80E; Thu,  7 Apr 2022 17:21:32 +0200 (CEST)
Date: Thu, 7 Apr 2022 17:21:32 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220407152132.GI15609@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406060516.409838-11-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Subject: Re: [Drbd-dev] [PATCH 10/27] block: add a bdev_nonrot helper
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: dsterba@suse.cz
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

On Wed, Apr 06, 2022 at 08:04:59AM +0200, Christoph Hellwig wrote:
> Add a helper to check the nonrot flag based on the block_device instead
> of having to poke into the block layer internal request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/ioctl.c                       | 2 +-
>  drivers/block/loop.c                | 2 +-
>  drivers/md/dm-table.c               | 4 +---
>  drivers/md/md.c                     | 3 +--
>  drivers/md/raid1.c                  | 2 +-
>  drivers/md/raid10.c                 | 2 +-
>  drivers/md/raid5.c                  | 2 +-
>  drivers/target/target_core_file.c   | 3 +--
>  drivers/target/target_core_iblock.c | 2 +-

For

>  fs/btrfs/volumes.c                  | 4 ++--

Acked-by: David Sterba <dsterba@suse.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
