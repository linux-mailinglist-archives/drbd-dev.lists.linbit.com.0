Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9418E4F55B6
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 08:07:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 75831420634;
	Wed,  6 Apr 2022 08:07:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B23414205EF
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 08:05:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cTLTfYr7duFMbl13zCRXcRUBgEmH7Snqn+WlWdpEWNo=;
	b=ZV/CVrUb4qbpXBUImFAvqmY7OC
	YR/KmNB2+lAjq+EqA8oBYfyehyx3Nq+YwtV4TxCIA5A8L2WVXtNlev4guWoUuadGmFOwtgMiNwq9i
	yqX5G6E2+zNceTQVJtjM3l08MHhteYnLHXffM4/jtc5yfz/GeuE8HPUJ4reOje5U615tM7p768ryF
	Y/h9+5h+K+8NlHUqGExK7MtGefB5aNgyMmSmLlNaZTgeiyQAt5+xaIpSgQ/+zSSJmDjA+IoRmYh1L
	IwncIh14NoCZ6DbOmIaikx8OL30Ru/YZRUBoYvofpcHUxFXkbbQXdd7v+XeVl55WVE6NwYrNNaEln
	SKW/g4CA==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbynT-003usA-Kd; Wed, 06 Apr 2022 06:05:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:04:54 +0200
Message-Id: <20220406060516.409838-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 05/27] drbd: use bdev based limit helpers in
	drbd_send_sizes
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

Use the bdev based limits helpers where they exist.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 74b1b2424efff..d20d84ee7a88e 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -924,7 +924,9 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 
 	memset(p, 0, packet_size);
 	if (get_ldev_if_state(device, D_NEGOTIATING)) {
-		struct request_queue *q = bdev_get_queue(device->ldev->backing_bdev);
+		struct block_device *bdev = device->ldev->backing_bdev;
+		struct request_queue *q = bdev_get_queue(bdev);
+
 		d_size = drbd_get_max_capacity(device->ldev);
 		rcu_read_lock();
 		u_size = rcu_dereference(device->ldev->disk_conf)->disk_size;
@@ -933,16 +935,15 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 		max_bio_size = queue_max_hw_sectors(q) << 9;
 		max_bio_size = min(max_bio_size, DRBD_MAX_BIO_SIZE);
 		p->qlim->physical_block_size =
-			cpu_to_be32(queue_physical_block_size(q));
+			cpu_to_be32(bdev_physical_block_size(bdev));
 		p->qlim->logical_block_size =
-			cpu_to_be32(queue_logical_block_size(q));
+			cpu_to_be32(bdev_logical_block_size(bdev));
 		p->qlim->alignment_offset =
 			cpu_to_be32(queue_alignment_offset(q));
-		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
-		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
+		p->qlim->io_min = cpu_to_be32(bdev_io_min(bdev));
+		p->qlim->io_opt = cpu_to_be32(bdev_io_opt(bdev));
 		p->qlim->discard_enabled = blk_queue_discard(q);
-		p->qlim->write_same_capable =
-			!!q->limits.max_write_same_sectors;
+		p->qlim->write_same_capable = 0;
 		put_ldev(device);
 	} else {
 		struct request_queue *q = device->rq_queue;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
