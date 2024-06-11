Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6909032E0
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 08:38:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CB404208D4;
	Tue, 11 Jun 2024 08:38:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE16E420898
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 08:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=kL0f+BmFpJHwuUReMJjo5PGBiELHza4z/Zsrvg8Z7ys=;
	b=gdW9T5rz4N+rEJBWq0kAF2g3Vp
	o77U9+9fDZ5/f3DhEVBIVnsx+JISiCMAKbcTag0Zkah1FJ+d7ef7a0XWw5GyKTOuAjHDH2z6PQLXI
	qqm8eVD9+X/AUEDR4su0Fv0ORO890Gug6klvG+fz9LLmonMsZ/nWiuFaMeJEtd1ZpWZnp/6SQiBuw
	sJhpQDUOouNBi1OIMt6miJfjkGSe6SkbiTNcGWDKAw5t83d+9BGwUvy+rhPKTllj7eZvWDRIHkv9C
	XGWPCU2DEv4+tkiZUyd+xNvRq9iNhaNZSATRihjuGMZhyNxWmkMH18Ug0QkgF+uOM87yi68/tGWq+
	D62iDLEw==;
Received: from
	2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
	([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvI-00000007Qyl-3It7; Tue, 11 Jun 2024 05:19:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
Date: Tue, 11 Jun 2024 07:19:08 +0200
Message-ID: <20240611051929.513387-9-hch@lst.de>
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

virtblk_update_cache_mode boils down to a single call to
blk_queue_write_cache.  Remove it in preparation for moving the cache
control flags into the queue_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2351f411fa4680..378b241911ca87 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1089,14 +1089,6 @@ static int virtblk_get_cache_mode(struct virtio_device *vdev)
 	return writeback;
 }
 
-static void virtblk_update_cache_mode(struct virtio_device *vdev)
-{
-	u8 writeback = virtblk_get_cache_mode(vdev);
-	struct virtio_blk *vblk = vdev->priv;
-
-	blk_queue_write_cache(vblk->disk->queue, writeback, false);
-}
-
 static const char *const virtblk_cache_types[] = {
 	"write through", "write back"
 };
@@ -1116,7 +1108,7 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
 		return i;
 
 	virtio_cwrite8(vdev, offsetof(struct virtio_blk_config, wce), i);
-	virtblk_update_cache_mode(vdev);
+	blk_queue_write_cache(disk->queue, virtblk_get_cache_mode(vdev), false);
 	return count;
 }
 
@@ -1528,7 +1520,8 @@ static int virtblk_probe(struct virtio_device *vdev)
 	vblk->index = index;
 
 	/* configure queue flush support */
-	virtblk_update_cache_mode(vdev);
+	blk_queue_write_cache(vblk->disk->queue, virtblk_get_cache_mode(vdev),
+			false);
 
 	/* If disk is read-only in the host, the guest should obey */
 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_RO))
-- 
2.43.0

