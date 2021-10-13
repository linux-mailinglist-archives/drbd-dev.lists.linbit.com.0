Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FB442B79F
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:39:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7845A420FFE;
	Wed, 13 Oct 2021 08:39:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE024420FC8
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:39:27 +0200 (CEST)
Received: by mail-pj1-f45.google.com with SMTP id
	pf6-20020a17090b1d8600b0019fa884ab85so3639754pjb.5
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=DD/2eDntZRvmYFLabpX6hx1U0eeFdg0nt6CnyRZUcUo=;
	b=BK3/LJ89flw5mVlU3UcEyxJ6LbnnmcNslFQOP5bfSd/QHd96C82eb1OGM/6y9E9tVZ
	+RxJ42PRvcA8OnuNTe7jWQrLB4kIfwLscnkVOAeCEBYDFaLLczsrzmikDhrnLSmHevHI
	DJYQS0KGPHFoIgmlnCi12Zqd0uHHCS6ptE1xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DD/2eDntZRvmYFLabpX6hx1U0eeFdg0nt6CnyRZUcUo=;
	b=tTxp96TYzD9WWaC3dSDn9p24+KBfkKjSIkCX63IlW/65r/lM1ZWiLoZRRg7WjiIchO
	kLb+i1ODwY/RO3pXEh+DWcGZj57nlUCm3PuWe4+jfry6BuU6aP5L8QuF+zGmCBctZT8E
	nj2F/yXQybftsOwcMPASoMyz1tBmkVvX1gVj67pp494z7o6V8TydvqOIZqhDiLQqxOqW
	h+kKSQdpMu/XXMDN/w0gZWKnXzHKdzy73l6YIobKvZyHauyEOrF7iB+2kYNWvt1cW1aa
	GH7FHh+vw+bXdxvVANVOgYQnDJLFc6m/x1iPjDwVLp/Za2RvYWK4+WDFXzrPCsbi2lyp
	dkHw==
X-Gm-Message-State: AOAM530SgEhRREbBz3smbv39eRCwoFPp1uOY9bHLQ+FgQkSgYczcfSaK
	j/Cw/Iw3B+/i1o87F050Tcg5SA==
X-Google-Smtp-Source: ABdhPJz6dN+fakHkI4mmw5FMrWYwE5jr866artFMUIcBHqytxUEdEx+T1ampoWpSo+mgvVckvfVoUQ==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id
	mi15mr808506pjb.97.1634107166729; 
	Tue, 12 Oct 2021 23:39:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	y17sm9562796pfn.96.2021.10.12.23.39.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:39:26 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:39:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122335.19348E8E8@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-1-hch@lst.de>
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
Subject: Re: [Drbd-dev] don't use ->bd_inode to access the block device size
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

On Wed, Oct 13, 2021 at 07:10:13AM +0200, Christoph Hellwig wrote:
> I wondered about adding a helper for looking at the size in byte units
> to avoid the SECTOR_SHIFT shifts in various places.  But given that
> I could not come up with a good name and block devices fundamentally
> work in sector size granularity I decided against that.

Without something like bdev_nr_bytes(), this series has 13 of 29 patches
actually _adding_ an open-coded calculation:

[PATCH 05/29] mtd/block2mtd: use bdev_nr_sectors instead of open coding it
[PATCH 06/29] nvmet: use bdev_nr_sectors instead of open coding it
[PATCH 07/29] target/iblock: use bdev_nr_sectors instead of open coding it
[PATCH 08/29] fs: use bdev_nr_sectors instead of open coding it in blkdev_max_block
[PATCH 11/29] btrfs: use bdev_nr_sectors instead of open coding it
[PATCH 16/29] jfs: use bdev_nr_sectors instead of open coding it
[PATCH 17/29] nfs/blocklayout: use bdev_nr_sectors instead of open coding it
[PATCH 18/29] nilfs2: use bdev_nr_sectors instead of open coding it
[PATCH 19/29] ntfs3: use bdev_nr_sectors instead of open coding it
[PATCH 20/29] pstore/blk: use bdev_nr_sectors instead of open coding it
[PATCH 21/29] reiserfs: use bdev_nr_sectors instead of open coding it
[PATCH 22/29] squashfs: use bdev_nr_sectors instead of open coding it
[PATCH 23/29] block: use bdev_nr_sectors instead of open coding it in blkdev_fallocate

I think it's well worth having that helper (or at least leaving these
alone). Otherwise, this is a lot of churn without a clear net benefit,
IMO.

The others look good to me, though!

-Kees

>
> Diffstat:
>  block/fops.c                        |    2 +-
>  drivers/block/drbd/drbd_int.h       |    3 +--
>  drivers/md/bcache/super.c           |    2 +-
>  drivers/md/bcache/util.h            |    4 ----
>  drivers/md/bcache/writeback.c       |    2 +-
>  drivers/md/dm-bufio.c               |    2 +-
>  drivers/md/dm-cache-metadata.c      |    2 +-
>  drivers/md/dm-cache-target.c        |    2 +-
>  drivers/md/dm-clone-target.c        |    2 +-
>  drivers/md/dm-dust.c                |    5 ++---
>  drivers/md/dm-ebs-target.c          |    2 +-
>  drivers/md/dm-era-target.c          |    2 +-
>  drivers/md/dm-exception-store.h     |    2 +-
>  drivers/md/dm-flakey.c              |    3 +--
>  drivers/md/dm-integrity.c           |    6 +++---
>  drivers/md/dm-linear.c              |    3 +--
>  drivers/md/dm-log-writes.c          |    4 ++--
>  drivers/md/dm-log.c                 |    2 +-
>  drivers/md/dm-mpath.c               |    2 +-
>  drivers/md/dm-raid.c                |    6 +++---
>  drivers/md/dm-switch.c              |    2 +-
>  drivers/md/dm-table.c               |    3 +--
>  drivers/md/dm-thin-metadata.c       |    2 +-
>  drivers/md/dm-thin.c                |    2 +-
>  drivers/md/dm-verity-target.c       |    3 +--
>  drivers/md/dm-writecache.c          |    2 +-
>  drivers/md/dm-zoned-target.c        |    2 +-
>  drivers/md/md.c                     |   26 +++++++++++---------------
>  drivers/mtd/devices/block2mtd.c     |    5 +++--
>  drivers/nvme/target/io-cmd-bdev.c   |    4 ++--
>  drivers/target/target_core_iblock.c |    5 +++--
>  fs/affs/super.c                     |    2 +-
>  fs/btrfs/dev-replace.c              |    2 +-
>  fs/btrfs/disk-io.c                  |    3 ++-
>  fs/btrfs/ioctl.c                    |    4 ++--
>  fs/btrfs/volumes.c                  |    7 ++++---
>  fs/buffer.c                         |    4 ++--
>  fs/cramfs/inode.c                   |    2 +-
>  fs/ext4/super.c                     |    2 +-
>  fs/fat/inode.c                      |    5 +----
>  fs/hfs/mdb.c                        |    2 +-
>  fs/hfsplus/wrapper.c                |    2 +-
>  fs/jfs/resize.c                     |    5 ++---
>  fs/jfs/super.c                      |    5 ++---
>  fs/nfs/blocklayout/dev.c            |    4 ++--
>  fs/nilfs2/ioctl.c                   |    2 +-
>  fs/nilfs2/super.c                   |    2 +-
>  fs/nilfs2/the_nilfs.c               |    3 ++-
>  fs/ntfs/super.c                     |    8 +++-----
>  fs/ntfs3/super.c                    |    3 +--
>  fs/pstore/blk.c                     |    4 ++--
>  fs/reiserfs/super.c                 |    7 ++-----
>  fs/squashfs/super.c                 |    5 +++--
>  fs/udf/lowlevel.c                   |    5 ++---
>  fs/udf/super.c                      |    9 +++------
>  include/linux/genhd.h               |    6 ++++++
>  56 files changed, 100 insertions(+), 117 deletions(-)

--
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
