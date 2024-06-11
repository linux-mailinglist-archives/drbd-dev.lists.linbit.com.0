Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68B9032C5
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 08:36:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5AD7642066E;
	Tue, 11 Jun 2024 08:36:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DEFA8420873
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 08:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=eTQ/ypSzK4lWAaVunDc3tjHt1iOpV7nN08jg8TeOXAw=;
	b=sHoQc0fUtpHycjsITV56G6LvHu
	Xm6IZXN1xSVejiDFIWNtspmlJUAy3p7hyoPQDHaK2j8uPpjWRbLpfhR0ew8O9GOJzk9M0kamdKVSK
	h+gO2FlpjqqnZU18qlfXHcI65jms2sw8Gusy9MG0fvAfD2y9LgREXQqEidgiJekt6Ad0BXV8H7wJ7
	laGv8UKsVQsPiuQ/hLbDrBliLkQDBQpg9pL4x4e1mvw/4MdqnWTVfp+cTO0elCEI+YMIJ7UGMAb5i
	o+KErO/5ahImbdE+1ecP+Db6dV/kjpPeVfK/+qvScno/vTvojiYJmwz/wDzBrXkKvWBAHc0v7OlDs
	cGWiEsNA==;
Received: from
	2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
	([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtv6-00000007Qry-3x0S; Tue, 11 Jun 2024 05:19:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/26] loop: regularize upgrading the lock size for direct I/O
Date: Tue, 11 Jun 2024 07:19:05 +0200
Message-ID: <20240611051929.513387-6-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The LOOP_CONFIGURE path automatically upgrades the block size to that
of the underlying file for O_DIRECT file descriptors, but the
LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
pick the block size into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c658282454af1b..4f6d8514d19bd6 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -975,10 +975,24 @@ loop_set_status_from_info(struct loop_device *lo,
 	return 0;
 }
 
+static unsigned short loop_default_blocksize(struct loop_device *lo,
+		struct block_device *backing_bdev)
+{
+	/* In case of direct I/O, match underlying block size */
+	if ((lo->lo_backing_file->f_flags & O_DIRECT) && backing_bdev)
+		return bdev_logical_block_size(backing_bdev);
+	return 512;
+}
+
 static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 {
+	struct file *file = lo->lo_backing_file;
+	struct inode *inode = file->f_mapping->host;
 	struct queue_limits lim;
 
+	if (!bsize)
+		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
+
 	lim = queue_limits_start_update(lo->lo_queue);
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
@@ -997,7 +1011,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	int error;
 	loff_t size;
 	bool partscan;
-	unsigned short bsize;
 	bool is_loop;
 
 	if (!file)
@@ -1076,15 +1089,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
 		blk_queue_write_cache(lo->lo_queue, true, false);
 
-	if (config->block_size)
-		bsize = config->block_size;
-	else if ((lo->lo_backing_file->f_flags & O_DIRECT) && inode->i_sb->s_bdev)
-		/* In case of direct I/O, match underlying block size */
-		bsize = bdev_logical_block_size(inode->i_sb->s_bdev);
-	else
-		bsize = 512;
-
-	error = loop_reconfigure_limits(lo, bsize);
+	error = loop_reconfigure_limits(lo, config->block_size);
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
 
-- 
2.43.0

