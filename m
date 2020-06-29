Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B0820D5F8
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jun 2020 22:04:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9C1E94203EE;
	Mon, 29 Jun 2020 22:04:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 84DA2420325
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jun 2020 22:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jMtXd3+IgH5FKAFW7B3krAloHxKDCKtZ6481a42mweE=;
	b=izI9va37od/l74eLDK6Qd4n5+c
	DRE5tLWFd6z0dh7FN+++zwj3vqA9hBSqXjItC+dGo1jQTiNXlNCOwNeuynBDUj4O0vv4wEvXD9xkA
	1Lqve212q1u8S5/IjqOxXPzxIxXWaadH1PkDW/wrhUOY/mACP+lHeZT85YM/CigG5JmG82gX4yswL
	RfDgh8pbd/ZyjWgGdAg7148oGPLMXP5IlWqnDTyMyVw/N0D30hWunCXzjPMCUTonoLYB3XTq2F8xe
	dBLSroWnj5XPAyKyIbXf1d7S5LahAvykKyuFF6hWFRR+hZoSGHVSAwslOJwhs0F/6uveQ9FNxwMDD
	ErEDmz7A==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzd6-0004EQ-9J; Mon, 29 Jun 2020 19:39:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:27 +0200
Message-Id: <20200629193947.2705954-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] rename ->make_request_fn and move it to the
	block_device_operations
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

this series moves the make_request_fn method into block_device_operations
with the much more descriptive ->submit_bio name.  It then also gives
generic_make_request a more descriptive name, and further optimize the
path to issue to blk-mq, removing the need for the direct_make_request
bypass.

Diffstat:
 Documentation/block/biodoc.rst                    |    2 
 Documentation/block/writeback_cache_control.rst   |    2 
 Documentation/fault-injection/fault-injection.rst |    2 
 Documentation/trace/ftrace.rst                    |    4 
 arch/m68k/emu/nfblock.c                           |    8 
 arch/xtensa/platforms/iss/simdisk.c               |    9 
 block/bio.c                                       |   14 -
 block/blk-cgroup.c                                |    2 
 block/blk-core.c                                  |  255 +++++++++-------------
 block/blk-crypto-fallback.c                       |    2 
 block/blk-crypto.c                                |    2 
 block/blk-merge.c                                 |   23 -
 block/blk-mq.c                                    |   12 -
 block/blk-throttle.c                              |    4 
 block/blk.h                                       |    5 
 block/bounce.c                                    |    2 
 drivers/block/brd.c                               |    5 
 drivers/block/drbd/drbd_int.h                     |    8 
 drivers/block/drbd/drbd_main.c                    |   12 -
 drivers/block/drbd/drbd_receiver.c                |    2 
 drivers/block/drbd/drbd_req.c                     |    8 
 drivers/block/drbd/drbd_worker.c                  |    2 
 drivers/block/null_blk_main.c                     |   19 +
 drivers/block/pktcdvd.c                           |   15 -
 drivers/block/ps3vram.c                           |   20 -
 drivers/block/rsxx/dev.c                          |   14 -
 drivers/block/umem.c                              |   11 
 drivers/block/zram/zram_drv.c                     |   14 -
 drivers/lightnvm/core.c                           |    8 
 drivers/lightnvm/pblk-init.c                      |   16 -
 drivers/lightnvm/pblk-read.c                      |    2 
 drivers/md/bcache/bcache.h                        |    2 
 drivers/md/bcache/btree.c                         |    2 
 drivers/md/bcache/request.c                       |   11 
 drivers/md/bcache/request.h                       |    4 
 drivers/md/bcache/super.c                         |   24 +-
 drivers/md/dm-cache-target.c                      |    6 
 drivers/md/dm-clone-target.c                      |   10 
 drivers/md/dm-crypt.c                             |    6 
 drivers/md/dm-delay.c                             |    2 
 drivers/md/dm-era-target.c                        |    2 
 drivers/md/dm-integrity.c                         |    4 
 drivers/md/dm-mpath.c                             |    2 
 drivers/md/dm-raid1.c                             |    2 
 drivers/md/dm-snap-persistent.c                   |    2 
 drivers/md/dm-snap.c                              |    6 
 drivers/md/dm-thin.c                              |    4 
 drivers/md/dm-verity-target.c                     |    2 
 drivers/md/dm-writecache.c                        |    2 
 drivers/md/dm-zoned-target.c                      |    2 
 drivers/md/dm.c                                   |   41 +--
 drivers/md/md-faulty.c                            |    4 
 drivers/md/md-linear.c                            |    4 
 drivers/md/md-multipath.c                         |    4 
 drivers/md/md.c                                   |    7 
 drivers/md/raid0.c                                |    8 
 drivers/md/raid1.c                                |   14 -
 drivers/md/raid10.c                               |   28 +-
 drivers/md/raid5.c                                |   10 
 drivers/nvdimm/blk.c                              |    5 
 drivers/nvdimm/btt.c                              |    5 
 drivers/nvdimm/pmem.c                             |    5 
 drivers/nvme/host/core.c                          |    1 
 drivers/nvme/host/multipath.c                     |   18 -
 drivers/nvme/host/nvme.h                          |    1 
 drivers/s390/block/dcssblk.c                      |   11 
 drivers/s390/block/xpram.c                        |    8 
 fs/buffer.c                                       |    5 
 include/linux/blk-mq.h                            |    2 
 include/linux/blkdev.h                            |   12 -
 include/linux/lightnvm.h                          |    3 
 71 files changed, 387 insertions(+), 408 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
