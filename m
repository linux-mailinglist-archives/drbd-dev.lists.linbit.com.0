Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2044FC339
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Apr 2022 19:28:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 540974202F4;
	Mon, 11 Apr 2022 19:28:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 089564201D4
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 19:28:26 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id ABD701F7AD;
	Mon, 11 Apr 2022 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649698106;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=0RiNf7uoJjg1rRFObzVZQSCMAd1nof/h0vLpUgMcwvY=;
	b=tfXHkMaj5kpUcLtvBYnwRGxDxcXmodIyKTVNxARm8whPlAkOVHL3pBXy48YlCR99uput93
	ek64inXcfBYSt9NuV9MWohA/Liu5eXfW+58ujnwevThluScwhFajBAp+/PR+hCYJW8ogrY
	iu/7/TOOXGQ1NMcWDFWaoeOCSwaX7H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649698106;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=0RiNf7uoJjg1rRFObzVZQSCMAd1nof/h0vLpUgMcwvY=;
	b=y/QeT70zXSjm5PP3weiVBlhCkwkEL69tQO+HTTi+7j+oI3RtiZJDs5egZuujl2LcaWZ24F
	apjvnh1HQMyDZeAA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 775CCA3B82;
	Mon, 11 Apr 2022 17:28:26 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 0F66CDA7F7; Mon, 11 Apr 2022 19:24:22 +0200 (CEST)
Date: Mon, 11 Apr 2022 19:24:21 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220411172421.GU15609@twin.jikos.cz>
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
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Coly Li <colyli@suse.de>
References: <20220409045043.23593-1-hch@lst.de>
	<20220409045043.23593-25-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Sat, Apr 09, 2022 at 06:50:40AM +0200, Christoph Hellwig wrote:
> Just use a non-zero max_discard_sectors as an indicator for discard
> support, similar to what is done for write zeroes.
> =

> The only places where needs special attention is the RAID5 driver,
> which must clear discard support for security reasons by default,
> even if the default stacking rules would allow for it.
> =

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: Christoph B=F6hmwalder <christoph.boehmwalder@linbit.com> [btrf=
s]
> Acked-by: Coly Li <colyli@suse.de> [bcache]
> ---
>  arch/um/drivers/ubd_kern.c          |  2 --
>  block/blk-core.c                    |  2 +-
>  block/blk-lib.c                     |  2 +-
>  block/blk-mq-debugfs.c              |  1 -
>  block/ioctl.c                       |  3 +--
>  drivers/block/drbd/drbd_main.c      |  2 +-
>  drivers/block/drbd/drbd_nl.c        | 19 ++-----------------
>  drivers/block/drbd/drbd_receiver.c  |  3 +--
>  drivers/block/loop.c                | 11 +++--------
>  drivers/block/nbd.c                 |  5 +----
>  drivers/block/null_blk/main.c       |  1 -
>  drivers/block/rbd.c                 |  1 -
>  drivers/block/rnbd/rnbd-clt.c       |  2 --
>  drivers/block/rnbd/rnbd-srv-dev.h   |  3 ---
>  drivers/block/virtio_blk.c          |  2 --
>  drivers/block/xen-blkback/xenbus.c  |  2 +-
>  drivers/block/xen-blkfront.c        |  2 --
>  drivers/block/zram/zram_drv.c       |  1 -
>  drivers/md/bcache/request.c         |  4 ++--
>  drivers/md/bcache/super.c           |  3 +--
>  drivers/md/bcache/sysfs.c           |  2 +-
>  drivers/md/dm-cache-target.c        |  9 +--------
>  drivers/md/dm-clone-target.c        |  9 +--------
>  drivers/md/dm-log-writes.c          |  3 +--
>  drivers/md/dm-raid.c                |  9 ++-------
>  drivers/md/dm-table.c               |  9 ++-------
>  drivers/md/dm-thin.c                | 11 +----------
>  drivers/md/dm.c                     |  3 +--
>  drivers/md/md-linear.c              | 11 +----------
>  drivers/md/raid0.c                  |  7 -------
>  drivers/md/raid1.c                  | 16 +---------------
>  drivers/md/raid10.c                 | 18 ++----------------
>  drivers/md/raid5-cache.c            |  2 +-
>  drivers/md/raid5.c                  | 12 ++++--------
>  drivers/mmc/core/queue.c            |  1 -
>  drivers/mtd/mtd_blkdevs.c           |  1 -
>  drivers/nvme/host/core.c            |  6 ++----
>  drivers/s390/block/dasd_fba.c       |  1 -
>  drivers/scsi/sd.c                   |  2 --
>  drivers/target/target_core_device.c |  2 +-

For

>  fs/btrfs/extent-tree.c              |  4 ++--
>  fs/btrfs/ioctl.c                    |  2 +-

Acked-by: David Sterba <dsterba@suse.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
