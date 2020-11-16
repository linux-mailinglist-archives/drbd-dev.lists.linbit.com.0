Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8D2B4B4C
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:35:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C776342089B;
	Mon, 16 Nov 2020 17:35:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01BAE42085E
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hmW8AusT819Hpp1U0vQRnp8T84EK6KuhlshbO+/HZ1o=;
	b=s3PyuNumv2XJNuimh+ngj+d/f6
	scNE+kFuc6xkgKNnr1zZ7z2rWNuEJjtRjoF8etdpy5umK3setslsL6lUQiK5cAVCegzHKOP2tNVRN
	1Sa9ShGf1/F5HMkg28qrnE9RKWnptAc1NOgcS5xzLqKhJFI4gE0I6jkqsNfuoY0Yg/d/tfTnu2g27
	+3jL897Lg+GjB+qFNGwVEtM3B26pX5XnYLr43N09shWkl6V+i4C3a3gB1Gh7uFE1MmG1EyGX2j2HD
	PQjkAdNsC8nET4kWMgCjPetxyfW4P8cNls2hPSf7oPeT4Bi2Ng0klNLw8Pn/NUGmnPBoTRVCulBmk
	W/SI5tEw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefy4-0003vL-Dh; Mon, 16 Nov 2020 14:58:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:24 +0100
Message-Id: <20201116145809.410558-34-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 33/78] block: remove __blkdev_driver_ioctl
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

Just open code it in the few callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c               | 25 +++++--------------------
 drivers/block/pktcdvd.c     |  6 ++++--
 drivers/md/bcache/request.c |  5 +++--
 drivers/md/dm.c             |  5 ++++-
 include/linux/blkdev.h      |  2 --
 5 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 04255dc5f3bff3..6b785181344fe1 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -219,23 +219,6 @@ static int compat_put_ulong(compat_ulong_t __user *argp, compat_ulong_t val)
 }
 #endif
 
-int __blkdev_driver_ioctl(struct block_device *bdev, fmode_t mode,
-			unsigned cmd, unsigned long arg)
-{
-	struct gendisk *disk = bdev->bd_disk;
-
-	if (disk->fops->ioctl)
-		return disk->fops->ioctl(bdev, mode, cmd, arg);
-
-	return -ENOTTY;
-}
-/*
- * For the record: _GPL here is only because somebody decided to slap it
- * on the previous export.  Sheer idiocy, since it wasn't copyrightable
- * at all and could be open-coded without any exports by anybody who cares.
- */
-EXPORT_SYMBOL_GPL(__blkdev_driver_ioctl);
-
 #ifdef CONFIG_COMPAT
 /*
  * This is the equivalent of compat_ptr_ioctl(), to be used by block
@@ -594,10 +577,12 @@ int blkdev_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 	}
 
 	ret = blkdev_common_ioctl(bdev, mode, cmd, arg, argp);
-	if (ret == -ENOIOCTLCMD)
-		return __blkdev_driver_ioctl(bdev, mode, cmd, arg);
+	if (ret != -ENOIOCTLCMD)
+		return ret;
 
-	return ret;
+	if (!bdev->bd_disk->fops->ioctl)
+		return -ENOTTY;
+	return bdev->bd_disk->fops->ioctl(bdev, mode, cmd, arg);
 }
 EXPORT_SYMBOL_GPL(blkdev_ioctl); /* for /dev/raw */
 
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 4326401cede445..b8bb8ec7538d9b 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2583,9 +2583,11 @@ static int pkt_ioctl(struct block_device *bdev, fmode_t mode, unsigned int cmd,
 	case CDROM_LAST_WRITTEN:
 	case CDROM_SEND_PACKET:
 	case SCSI_IOCTL_SEND_COMMAND:
-		ret = __blkdev_driver_ioctl(pd->bdev, mode, cmd, arg);
+		if (!bdev->bd_disk->fops->ioctl)
+			ret = -ENOTTY;
+		else
+			ret = bdev->bd_disk->fops->ioctl(bdev, mode, cmd, arg);
 		break;
-
 	default:
 		pkt_dbg(2, pd, "Unknown ioctl (%x)\n", cmd);
 		ret = -ENOTTY;
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 21432638314562..afac8d07c1bd00 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -1230,8 +1230,9 @@ static int cached_dev_ioctl(struct bcache_device *d, fmode_t mode,
 
 	if (dc->io_disable)
 		return -EIO;
-
-	return __blkdev_driver_ioctl(dc->bdev, mode, cmd, arg);
+	if (!dc->bdev->bd_disk->fops->ioctl)
+		return -ENOTTY;
+	return dc->bdev->bd_disk->fops->ioctl(dc->bdev, mode, cmd, arg);
 }
 
 void bch_cached_dev_request_init(struct cached_dev *dc)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 62ad44925e73ec..54739f1b579bc8 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -570,7 +570,10 @@ static int dm_blk_ioctl(struct block_device *bdev, fmode_t mode,
 		}
 	}
 
-	r =  __blkdev_driver_ioctl(bdev, mode, cmd, arg);
+	if (!bdev->bd_disk->fops->ioctl)
+		r = -ENOTTY;
+	else
+		r = bdev->bd_disk->fops->ioctl(bdev, mode, cmd, arg);
 out:
 	dm_unprepare_ioctl(md, srcu_idx);
 	return r;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5c1ba8a8d2bc7e..05b346a68c2eee 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1867,8 +1867,6 @@ extern int blkdev_compat_ptr_ioctl(struct block_device *, fmode_t,
 #define blkdev_compat_ptr_ioctl NULL
 #endif
 
-extern int __blkdev_driver_ioctl(struct block_device *, fmode_t, unsigned int,
-				 unsigned long);
 extern int bdev_read_page(struct block_device *, sector_t, struct page *);
 extern int bdev_write_page(struct block_device *, sector_t, struct page *,
 						struct writeback_control *);
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
