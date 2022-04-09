Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDD4FA4FF
	for <lists+drbd-dev@lfdr.de>; Sat,  9 Apr 2022 07:20:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EE1D42100E;
	Sat,  9 Apr 2022 07:20:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D96B420FF6
	for <drbd-dev@lists.linbit.com>; Sat,  9 Apr 2022 07:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=eypoqjBCbHteIGJMjEE77faduCfiNIsAQ0ydQeu7OQ0=;
	b=nqH1nBV8lOr2r5wyOjol3g7s8X
	NGopilIp147x4XNnQqzR5o2YWkY6IO58VVUojmV/ASvSDXVzRQHv+BqUNN8ISkIuVH5Huq+5W/+g6
	Fx9NKN7nsNjG6IaaR01B6x8gfqb84JVGaMt2Mch/XsNqmw38mh/kWIOczl1+aSfojYjwvPWnkVT0z
	zeBYxWSj02o09fDuqh1c1ftABUKI9QxyXU2GCBR2V2aNbgjbyvKcSUL75+QEIgn+hIxNaN3b6eMN+
	HQ75AhIB7YFYQ9KIFGF2dUiaHQ4ZLNQzEzLlTd1WzYc4Lz5oFphMfcUxRdKyObtKnqHpozib+pvzE
	Et/uKlCg==;
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd35G-0021rI-Lh; Sat, 09 Apr 2022 04:52:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:43 +0200
Message-Id: <20220409045043.23593-28-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 27/27] direct-io: remove random prefetches
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

Randomly poking into block device internals for manual prefetches isn't
exactly a very maintainable thing to do.  And none of the performance
criticil direct I/O implementations still use this library function
anyway, so just drop it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/direct-io.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index aef06e607b405..840752006f601 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -1115,11 +1115,10 @@ static inline int drop_refcount(struct dio *dio)
  * individual fields and will generate much worse code. This is important
  * for the whole file.
  */
-static inline ssize_t
-do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
-		      struct block_device *bdev, struct iov_iter *iter,
-		      get_block_t get_block, dio_iodone_t end_io,
-		      dio_submit_t submit_io, int flags)
+ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
+		struct block_device *bdev, struct iov_iter *iter,
+		get_block_t get_block, dio_iodone_t end_io,
+		dio_submit_t submit_io, int flags)
 {
 	unsigned i_blkbits = READ_ONCE(inode->i_blkbits);
 	unsigned blkbits = i_blkbits;
@@ -1334,29 +1333,6 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
 	kmem_cache_free(dio_cache, dio);
 	return retval;
 }
-
-ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
-			     struct block_device *bdev, struct iov_iter *iter,
-			     get_block_t get_block,
-			     dio_iodone_t end_io, dio_submit_t submit_io,
-			     int flags)
-{
-	/*
-	 * The block device state is needed in the end to finally
-	 * submit everything.  Since it's likely to be cache cold
-	 * prefetch it here as first thing to hide some of the
-	 * latency.
-	 *
-	 * Attempt to prefetch the pieces we likely need later.
-	 */
-	prefetch(&bdev->bd_disk->part_tbl);
-	prefetch(bdev->bd_disk->queue);
-	prefetch((char *)bdev->bd_disk->queue + SMP_CACHE_BYTES);
-
-	return do_blockdev_direct_IO(iocb, inode, bdev, iter, get_block,
-				     end_io, submit_io, flags);
-}
-
 EXPORT_SYMBOL(__blockdev_direct_IO);
 
 static __init int dio_init(void)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
