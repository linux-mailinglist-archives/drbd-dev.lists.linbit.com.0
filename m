Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B27A2AD4
	for <lists+drbd-dev@lfdr.de>; Sat, 16 Sep 2023 01:02:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6464E4267EF;
	Sat, 16 Sep 2023 01:02:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C74FB425C96
	for <drbd-dev@lists.linbit.com>; Sat, 16 Sep 2023 01:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=7Au7GQlleAmj5M8e5CX+OM2MfEjyMcPNx8bLn2lT0zk=;
	b=i0rFTNFIrhpMybyhkJGOmDs4xP
	oBHzLbvVUXzpm9ZTd/EcCT2Iw9SuWQ79s/UnmZ4WPBsOAOwEYHTSyLdvf6kcvui4XpKnR82hw/5XY
	t67KZYZUm1S0b104aYYCMFlC5dSPvzaBnDgKSKHBb9OmFUFlBRRTFM1OnoT+BjuYEqFWJzEYaGIKF
	XiejQ/wmAcDv5FV8u7wNAlc1idUDBYvGEDs4c+Y8af5dUGeSRk0jMFCkWjGP+dXMaBm4U9gV+y0W9
	UFnqi+X2sRQRqRrJxB6k88JcyoS1qMrCd/M4F8O96+1kXBnPhSWFunceDmRB7FW4H/UWEZi7sFiCF
	XhmBZLQA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1qhHXM-00BUtK-2O; Fri, 15 Sep 2023 22:43:44 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 15 Sep 2023 15:43:39 -0700
Message-Id: <20230915224343.2740317-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, rohan.puri@samsung.com,
	da.gomez@samsung.com, mcgrof@kernel.org, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de, linux-fsdevel@vger.kernel.org,
	rpuri.linux@gmail.com, kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v3 0/4] block: simplify with PAGE_SECTORS_SHIFT
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

Just spinning these low hanging fruit patches I forgot about.

Changes on v3:

 o Add tags for Reviews/acks
 o rebase onto next-20230914
 o Fixes as suggested by Johannes Thumshirn:
   - drop not-needed parens on dm bufio
   - use SECTOR_MASK instead of PAGE_SECTORS - 1 for the zram driver
 o Drop shmem patches as they are already merged / modified

Changes on v2:
                                                                                                                                                                                              
 o keep iomap math visibly simple                                                                                                                                                             
 o Add tags for Reviews/acks                                                                                                                                                                  
 o rebase onto next-20230525 

Luis Chamberlain (4):
  drbd: use PAGE_SECTORS_SHIFT and PAGE_SECTORS
  iomap: simplify iomap_init() with PAGE_SECTORS
  dm bufio: simplify by using PAGE_SECTORS_SHIFT
  zram: use generic PAGE_SECTORS and PAGE_SECTORS_SHIFT

 drivers/block/drbd/drbd_bitmap.c |  4 ++--
 drivers/block/zram/zram_drv.c    | 15 ++++++---------
 drivers/block/zram/zram_drv.h    |  2 --
 drivers/md/dm-bufio.c            |  4 ++--
 fs/iomap/buffered-io.c           |  2 +-
 5 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
