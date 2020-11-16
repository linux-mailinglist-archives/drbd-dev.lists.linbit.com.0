Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB12B4BAC
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:52:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 26B7F4208B7;
	Mon, 16 Nov 2020 17:52:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9965F42083A
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d0zI0xiIcFHFTwTdsA7t1wqk2DnkvBTfmLOxL2TnUek=;
	b=DKAlryWF5aHE8/B3DVx5lhXd8h
	RQsT9hPX38SbguocnZS554oaNmM9+EcgOmPSe3bSy4pQSqGGct2tuNtJ0yCfFmplFU4Jcw4DNR+Gz
	J7Oz/e2SFesb/6AMnzcvu+cf+7L4KALASo9qO1gsK4PDLlxYsYhRBm5wzHXCJ4YuBYsjvABidOfFo
	p48i+zCOuzCBz9Jt3Qs/XvlKgbU+XBWYolicobbwk3FUzb3sQBQPT35cBdmlTfMB9Ru0tm2W7/68r
	NFrH8b8PC5q1fbzQHqZSTq90cUOcrpwyoWr9RhxuehKghoJ6srJuGYzg6d5pU+2MePhUr2LoGYkUr
	biWVcMtQ==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxy-0003tn-LS; Mon, 16 Nov 2020 14:58:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:20 +0100
Message-Id: <20201116145809.410558-30-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 29/78] dasd: implement ->set_read_only to hook
	into BLKROSET processing
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

Implement the ->set_read_only method instead of parsing the actual
ioctl command.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/dasd.c       |  1 +
 drivers/s390/block/dasd_int.h   |  3 ++-
 drivers/s390/block/dasd_ioctl.c | 27 +++++++++------------------
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index eb17fea8075c6f..db24e04ee9781e 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -3394,6 +3394,7 @@ dasd_device_operations = {
 	.ioctl		= dasd_ioctl,
 	.compat_ioctl	= dasd_ioctl,
 	.getgeo		= dasd_getgeo,
+	.set_read_only	= dasd_set_read_only,
 };
 
 /*******************************************************************************
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index fa552f9f166671..c59a0d63b506e6 100644
--- a/drivers/s390/block/dasd_int.h
+++ b/drivers/s390/block/dasd_int.h
@@ -844,7 +844,8 @@ int dasd_scan_partitions(struct dasd_block *);
 void dasd_destroy_partitions(struct dasd_block *);
 
 /* externals in dasd_ioctl.c */
-int  dasd_ioctl(struct block_device *, fmode_t, unsigned int, unsigned long);
+int dasd_ioctl(struct block_device *, fmode_t, unsigned int, unsigned long);
+int dasd_set_read_only(struct block_device *bdev, bool ro);
 
 /* externals in dasd_proc.c */
 int dasd_proc_init(void);
diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
index cb6427fb9f3d16..3359559517bfcf 100644
--- a/drivers/s390/block/dasd_ioctl.c
+++ b/drivers/s390/block/dasd_ioctl.c
@@ -532,28 +532,22 @@ static int dasd_ioctl_information(struct dasd_block *block, void __user *argp,
 /*
  * Set read only
  */
-static int
-dasd_ioctl_set_ro(struct block_device *bdev, void __user *argp)
+int dasd_set_read_only(struct block_device *bdev, bool ro)
 {
 	struct dasd_device *base;
-	int intval, rc;
+	int rc;
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EACCES;
+	/* do not manipulate hardware state for partitions */
 	if (bdev_is_partition(bdev))
-		// ro setting is not allowed for partitions
-		return -EINVAL;
-	if (get_user(intval, (int __user *)argp))
-		return -EFAULT;
+		return 0;
+
 	base = dasd_device_from_gendisk(bdev->bd_disk);
 	if (!base)
 		return -ENODEV;
-	if (!intval && test_bit(DASD_FLAG_DEVICE_RO, &base->flags)) {
-		dasd_put_device(base);
-		return -EROFS;
-	}
-	set_disk_ro(bdev->bd_disk, intval);
-	rc = dasd_set_feature(base->cdev, DASD_FEATURE_READONLY, intval);
+	if (!ro && test_bit(DASD_FLAG_DEVICE_RO, &base->flags))
+		rc = -EROFS;
+	else
+		rc = dasd_set_feature(base->cdev, DASD_FEATURE_READONLY, ro);
 	dasd_put_device(base);
 	return rc;
 }
@@ -633,9 +627,6 @@ int dasd_ioctl(struct block_device *bdev, fmode_t mode,
 	case BIODASDPRRST:
 		rc = dasd_ioctl_reset_profile(block);
 		break;
-	case BLKROSET:
-		rc = dasd_ioctl_set_ro(bdev, argp);
-		break;
 	case DASDAPIVER:
 		rc = dasd_ioctl_api_version(argp);
 		break;
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
