Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B652B4A5A
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:11:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F925420821;
	Mon, 16 Nov 2020 17:11:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F1B924207E4
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:11:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9xKkbsaYgLwhE10hNLQkbULUUrvPvOI5lAnm4OXLvPs=;
	b=oYdX9nzKoJif6AkXObIozxVfvj
	7cGF/f/pUnJJHDQ6T2624151wrdwaTi3mmORA1Sk4dkNQXTLpvcPq6k6KdWEaLJxRF4lDmEXm8qw9
	oYE1wB5V9C5rcNG0vg2/s/RZq7WpvPXksRbrz6BhFVFbp3fgW6Cu8Ei10wVmFRzzU2lZbNkryPPwp
	UyZEBLPwZzIDOtCGDnQaZ/yC0WN3H+ttyOeryQQMS7541LF9/8zj21iM7fknwF/oyMb92PdRg+U+/
	bjDqshSNF4XCVwta4ehBG8dKT/cx10oylnvhgVmCv3gk5lCpRUkUrEy9iufHfdIZqR7G/SymA4RHz
	LVTtFmtA==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxu-0003sm-C6; Mon, 16 Nov 2020 14:58:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:17 +0100
Message-Id: <20201116145809.410558-27-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 26/78] block: add a new set_read_only method
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

Add a new method to allow for driver-specific processing when setting or
clearing the block device read-only state.  This allows to replace the
cumbersome and error-prone override of the whole ioctl implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c          | 5 +++++
 include/linux/blkdev.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/block/ioctl.c b/block/ioctl.c
index c6d8863f040945..a6fa16b9770593 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -389,6 +389,11 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		return ret;
 	if (get_user(n, (int __user *)arg))
 		return -EFAULT;
+	if (bdev->bd_disk->fops->set_read_only) {
+		ret = bdev->bd_disk->fops->set_read_only(bdev, n);
+		if (ret)
+			return ret;
+	}
 	set_device_ro(bdev, n);
 	return 0;
 }
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 639cae2c158b59..5c1ba8a8d2bc7e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1850,6 +1850,7 @@ struct block_device_operations {
 	void (*unlock_native_capacity) (struct gendisk *);
 	int (*revalidate_disk) (struct gendisk *);
 	int (*getgeo)(struct block_device *, struct hd_geometry *);
+	int (*set_read_only)(struct block_device *bdev, bool ro);
 	/* this callback is with swap_lock and sometimes page table lock held */
 	void (*swap_slot_free_notify) (struct block_device *, unsigned long);
 	int (*report_zones)(struct gendisk *, sector_t sector,
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
