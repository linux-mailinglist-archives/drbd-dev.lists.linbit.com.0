Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD234FA2EC
	for <lists+drbd-dev@lfdr.de>; Sat,  9 Apr 2022 06:51:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 187DB420FE7;
	Sat,  9 Apr 2022 06:51:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE071420FD8
	for <drbd-dev@lists.linbit.com>; Sat,  9 Apr 2022 06:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xqCE7mrNhx9Kh54A8pTQxucRKOOrbbHmaHFew3/JwbI=;
	b=eautlETAmAcOF4Rx+ajcsxqxAt
	K/gc85CxDlYY+s5RX+TP4qAcopFOJMKyRoUbJGCZqLzThYN44a81gHztvDtTQOXXVmstC/BiZza91
	+tK8A4YQHg+wud7jKaqcpT5eZw97ewGrhmTU8yf0v/D+yZnMWYW/4nRrMz5fe0RjHIwwo6UCcWnmG
	q/WhOest1iceY98x52QbO+Ryd19aUS/0aFt0A0VdCFkKu7+7IrcjV/rCpnun6L4B6SbhX7D4hKxqE
	vkbaC7lWGA+28JjJD9laatsN4l8Gz9BZIOD3BKi8HF53h/Wb9nBnpD0TIdhkMhGAybm9Za6sdmIlK
	tpLM1eWg==;
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd33f-0020RM-19; Sat, 09 Apr 2022 04:50:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:16 +0200
Message-Id: <20220409045043.23593-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] use block_device based APIs in block layer consumers v2
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

Hi Jens,

this series cleanups up the block layer API so that APIs consumed
by file systems are (almost) only struct block_devic based, so that
file systems don't have to poke into block layer internals like the
request_queue.

I also found a bunch of existing bugs related to partition offsets
and discard so these are fixed while going along.


Changes since v1:
 - fix a bisection hazard
 - minor spelling fixes
 - reorder hunks between two patches to make the changes more obvious
 - reorder a patch to be earlier in the series to ease backporting


Diffstat:
 arch/um/drivers/ubd_kern.c           |    2 
 block/blk-core.c                     |    4 -
 block/blk-lib.c                      |  124 ++++++++++++++++++++---------------
 block/blk-mq-debugfs.c               |    2 
 block/blk-settings.c                 |   74 ++++++++++++++++++++
 block/blk.h                          |   14 ---
 block/fops.c                         |    2 
 block/genhd.c                        |    4 -
 block/ioctl.c                        |   48 ++++++++++---
 block/partitions/core.c              |   12 ---
 drivers/block/drbd/drbd_main.c       |   51 ++++++--------
 drivers/block/drbd/drbd_nl.c         |   94 +++++++++++---------------
 drivers/block/drbd/drbd_receiver.c   |   13 +--
 drivers/block/loop.c                 |   15 +---
 drivers/block/nbd.c                  |    5 -
 drivers/block/null_blk/main.c        |    1 
 drivers/block/rbd.c                  |    1 
 drivers/block/rnbd/rnbd-clt.c        |    6 -
 drivers/block/rnbd/rnbd-srv-dev.h    |    8 --
 drivers/block/rnbd/rnbd-srv.c        |    5 -
 drivers/block/virtio_blk.c           |    2 
 drivers/block/xen-blkback/blkback.c  |   15 ++--
 drivers/block/xen-blkback/xenbus.c   |    9 --
 drivers/block/xen-blkfront.c         |    7 -
 drivers/block/zram/zram_drv.c        |    1 
 drivers/md/bcache/alloc.c            |    2 
 drivers/md/bcache/request.c          |    4 -
 drivers/md/bcache/super.c            |    3 
 drivers/md/bcache/sysfs.c            |    2 
 drivers/md/dm-cache-target.c         |    9 --
 drivers/md/dm-clone-target.c         |    9 --
 drivers/md/dm-io.c                   |    2 
 drivers/md/dm-log-writes.c           |    3 
 drivers/md/dm-raid.c                 |    9 --
 drivers/md/dm-table.c                |   25 +------
 drivers/md/dm-thin.c                 |   15 ----
 drivers/md/dm.c                      |    3 
 drivers/md/md-linear.c               |   11 ---
 drivers/md/md.c                      |    5 -
 drivers/md/raid0.c                   |    7 -
 drivers/md/raid1.c                   |   18 -----
 drivers/md/raid10.c                  |   20 -----
 drivers/md/raid5-cache.c             |    8 +-
 drivers/md/raid5.c                   |   14 +--
 drivers/mmc/core/queue.c             |    3 
 drivers/mtd/mtd_blkdevs.c            |    1 
 drivers/nvme/host/core.c             |    6 -
 drivers/nvme/target/io-cmd-bdev.c    |    2 
 drivers/nvme/target/zns.c            |    3 
 drivers/s390/block/dasd_fba.c        |    1 
 drivers/scsi/sd.c                    |    2 
 drivers/target/target_core_device.c  |   20 ++---
 drivers/target/target_core_file.c    |   10 +-
 drivers/target/target_core_iblock.c  |   17 +---
 fs/btrfs/disk-io.c                   |    3 
 fs/btrfs/extent-tree.c               |    8 +-
 fs/btrfs/ioctl.c                     |   12 +--
 fs/btrfs/volumes.c                   |    4 -
 fs/btrfs/zoned.c                     |    3 
 fs/direct-io.c                       |   32 +--------
 fs/exfat/file.c                      |    5 -
 fs/exfat/super.c                     |   10 --
 fs/ext4/ioctl.c                      |   10 --
 fs/ext4/mballoc.c                    |   10 +-
 fs/ext4/super.c                      |   10 --
 fs/f2fs/f2fs.h                       |    3 
 fs/f2fs/file.c                       |   19 ++---
 fs/f2fs/segment.c                    |    8 --
 fs/fat/file.c                        |    5 -
 fs/fat/inode.c                       |   10 --
 fs/gfs2/rgrp.c                       |    7 -
 fs/iomap/direct-io.c                 |    3 
 fs/jbd2/journal.c                    |    9 --
 fs/jfs/ioctl.c                       |    5 -
 fs/jfs/super.c                       |    8 --
 fs/nilfs2/ioctl.c                    |    6 -
 fs/nilfs2/sufile.c                   |    4 -
 fs/nilfs2/the_nilfs.c                |    4 -
 fs/ntfs3/file.c                      |    6 -
 fs/ntfs3/super.c                     |   10 +-
 fs/ocfs2/ioctl.c                     |    5 -
 fs/super.c                           |    2 
 fs/xfs/xfs_discard.c                 |    8 +-
 fs/xfs/xfs_log_cil.c                 |    2 
 fs/xfs/xfs_super.c                   |   12 +--
 fs/zonefs/super.c                    |    3 
 include/linux/blkdev.h               |  112 +++++++++++--------------------
 include/target/target_core_backend.h |    4 -
 mm/swapfile.c                        |   31 ++------
 89 files changed, 493 insertions(+), 653 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
