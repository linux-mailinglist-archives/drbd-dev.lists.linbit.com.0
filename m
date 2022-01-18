Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 747EB4920CA
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jan 2022 09:00:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 564A8420BA8;
	Tue, 18 Jan 2022 09:00:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 807B8420602
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jan 2022 08:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ScaZLB316TNMvWwlnv9wxx+Nw6Jl5Gr2bEFrm1gsbik=;
	b=BupyQ2oy6Mma4oohnbl5wchvqn
	3INPpJTxm/BBRl/t9RkPSLYcWQ6Tvy9mp7Gzpm+0XfdyXm9hy+6uiWuICZ0q1Htk22k/y8teJsmRy
	nw8Hc+t8NG4FQ9e2WfSH1NeRblFTaCCb+c/YF/d96imGOThenihSDQYboiaLfULXj4JsMClr6UIC2
	s11FIUZL0uM0O8ZekMG/XIa8RcIHxEdXx1AN/Gr2+nctRFbtEvw5nrOcHvfJbu44bXeZ4pqAcEen2
	6t9X9ewQ0wSnc8nb+GPTsZ14BMHsGKj3UtRC/RIttaD3ZIJbgV3w5SGL7zPOcrWkOSQ9ru5hPGHW9
	ILp/Ph/Q==;
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9imY-000ZMt-Pw; Tue, 18 Jan 2022 07:19:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:33 +0100
Message-Id: <20220118071952.1243143-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] improve the bio allocation interface
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

this series is posted early because it has wide-ranging changes and could use some
early ACKs before -rc1.

It changes the interface to the bio allocators to always pass a block_device and
the operation, which is information needed for every bio submitted through
bio_submit.  This means the fields can be directly initialized in bio_init instead
of first being zeroed and thus should help to micro-optimize even better than the
__bio_set_dev that Pavel proposed while also cleaning up code.

I have a follow on series to also deal with the bio cloning interfaces that need
even more love, and additional cleanups for the callers which might be material
for the next merge window.

Diffstat:
 block/bio.c                         |   73 ++++++++++++++++++++++++------------
 block/blk-flush.c                   |    4 -
 block/blk-lib.c                     |   32 ++-------------
 block/blk-zoned.c                   |   14 +-----
 block/blk.h                         |    2 
 block/bounce.c                      |    6 --
 block/fops.c                        |   35 +++++++----------
 drivers/block/drbd/drbd_actlog.c    |    5 --
 drivers/block/drbd/drbd_bitmap.c    |    7 +--
 drivers/block/drbd/drbd_receiver.c  |   31 +++------------
 drivers/block/floppy.c              |    4 -
 drivers/block/pktcdvd.c             |    8 ---
 drivers/block/rnbd/rnbd-srv-dev.c   |   61 ------------------------------
 drivers/block/rnbd/rnbd-srv-dev.h   |   18 --------
 drivers/block/rnbd/rnbd-srv.c       |   45 ++++++++--------------
 drivers/block/rnbd/rnbd-srv.h       |    1 
 drivers/block/xen-blkback/blkback.c |   25 ++----------
 drivers/block/zram/zram_drv.c       |   16 ++-----
 drivers/md/bcache/io.c              |    3 -
 drivers/md/bcache/journal.c         |   16 ++-----
 drivers/md/bcache/movinggc.c        |    4 -
 drivers/md/bcache/request.c         |   18 +++-----
 drivers/md/bcache/super.c           |    8 +--
 drivers/md/bcache/writeback.c       |    4 -
 drivers/md/dm-crypt.c               |   27 ++++---------
 drivers/md/dm-io.c                  |    5 --
 drivers/md/dm-log-writes.c          |   39 +++----------------
 drivers/md/dm-snap.c                |   21 ----------
 drivers/md/dm-thin.c                |   41 +++++---------------
 drivers/md/dm-writecache.c          |    7 +--
 drivers/md/dm-zoned-metadata.c      |   26 ++----------
 drivers/md/dm.c                     |   12 ++---
 drivers/md/md-multipath.c           |    2 
 drivers/md/md.c                     |   24 +++++------
 drivers/md/raid1.c                  |    8 +--
 drivers/md/raid10.c                 |   14 ++----
 drivers/md/raid5-cache.c            |   19 +++------
 drivers/md/raid5-ppl.c              |   13 ++----
 drivers/md/raid5.c                  |   12 ++---
 drivers/nvdimm/nd_virtio.c          |    6 +-
 drivers/nvme/target/io-cmd-bdev.c   |   18 +++-----
 drivers/nvme/target/passthru.c      |    7 +--
 drivers/nvme/target/zns.c           |   14 +++---
 drivers/scsi/ufs/ufshpb.c           |    4 -
 drivers/target/target_core_iblock.c |   11 +----
 fs/btrfs/disk-io.c                  |   10 +---
 fs/btrfs/extent_io.c                |    2 
 fs/buffer.c                         |   14 ++----
 fs/crypto/bio.c                     |   13 ++----
 fs/direct-io.c                      |    5 --
 fs/erofs/zdata.c                    |    5 --
 fs/ext4/page-io.c                   |    3 -
 fs/ext4/readpage.c                  |    8 +--
 fs/f2fs/data.c                      |    7 +--
 fs/gfs2/lops.c                      |    8 +--
 fs/gfs2/meta_io.c                   |    4 -
 fs/gfs2/ops_fstype.c                |    4 -
 fs/hfsplus/wrapper.c                |    4 -
 fs/iomap/buffered-io.c              |   26 +++++-------
 fs/iomap/direct-io.c                |    8 ---
 fs/jfs/jfs_logmgr.c                 |   11 -----
 fs/jfs/jfs_metapage.c               |    9 +---
 fs/mpage.c                          |   34 ++--------------
 fs/nfs/blocklayout/blocklayout.c    |   26 +-----------
 fs/nilfs2/segbuf.c                  |   31 +--------------
 fs/ntfs3/fsntfs.c                   |   27 -------------
 fs/ocfs2/cluster/heartbeat.c        |    4 -
 fs/squashfs/block.c                 |   11 ++---
 fs/xfs/xfs_bio_io.c                 |   14 ++----
 fs/xfs/xfs_buf.c                    |    4 -
 fs/xfs/xfs_log.c                    |   14 +++---
 fs/zonefs/super.c                   |    9 +---
 include/linux/bio.h                 |   30 ++++++--------
 kernel/power/swap.c                 |    5 --
 mm/page_io.c                        |   10 +---
 75 files changed, 372 insertions(+), 758 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
