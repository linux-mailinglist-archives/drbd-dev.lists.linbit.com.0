Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F11BC712106
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 09:33:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56D964252E7;
	Fri, 26 May 2023 09:33:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BCA93420AFD
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 09:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=23YpyXCnG95trpP/pZ5n4GhJ2jHSbd6X9bDByt1pjCI=;
	b=1pmptwQdQfDrJXHTJIIak+p56N
	nZDFIQCxxcIxw0zUKarHhboTE6oY7rvTOgGfiswmsjC5CWW8lOGwJ9B5AeQkCpBGux3R65tB+k27i
	P0vmdsjYL3A3dM9V9slp2BqgHODGy/QH4BFYSeTt8omfsUwrWvOq2scl47MGO3EOySrYqMO7TXK3f
	mcggnMJmh8lWXyude7lxcrYzLdmf6LD5lAWFgWWQ97kY0Fr+9zfUTGxbeAVryzFYAmYle936W9M7+
	lbtmgWmxGlHTbwW0x4N0xCtJcJMISx+JewfMyrmz0ftBPLkT8DvX5h3pcFpy/B1olU2EFewhzzf1c
	At6yXbow==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1q2RxA-001RdO-2w; Fri, 26 May 2023 07:33:36 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 26 May 2023 00:33:31 -0700
Message-Id: <20230526073336.344543-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, rohan.puri@samsung.com,
	da.gomez@samsung.com, mcgrof@kernel.org, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de, linux-fsdevel@vger.kernel.org,
	rpuri.linux@gmail.com, kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 0/5] block: simplify with PAGE_SECTORS_SHIFT
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

A bit of block drivers have their own incantations with
PAGE_SHIFT - SECTOR_SHIFT. Just simplfy and use PAGE_SECTORS_SHIFT
all over.
                                                                                                                                                                                              
Based on linux-next next-20230525.

Changes since v1:

 o keep iomap math visibly simple
 o Add tags for Reviews/acks
 o rebase onto next-20230525

Luis Chamberlain (5):
  block: annotate bdev_disk_changed() deprecation with a symbol
    namespace
  drbd: use PAGE_SECTORS_SHIFT and PAGE_SECTORS
  iomap: simplify iomap_init() with PAGE_SECTORS
  dm bufio: simplify by using PAGE_SECTORS_SHIFT
  zram: use generic PAGE_SECTORS and PAGE_SECTORS_SHIFT

 block/partitions/core.c          |  6 +-----
 drivers/block/drbd/drbd_bitmap.c |  4 ++--
 drivers/block/loop.c             |  2 ++
 drivers/block/zram/zram_drv.c    | 12 ++++++------
 drivers/block/zram/zram_drv.h    |  2 --
 drivers/md/dm-bufio.c            |  4 ++--
 drivers/s390/block/dasd_genhd.c  |  2 ++
 fs/iomap/buffered-io.c           |  2 +-
 8 files changed, 16 insertions(+), 18 deletions(-)

-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
