Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA22B4A61
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:13:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2CD0E420836;
	Mon, 16 Nov 2020 17:13:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11811420819
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ub9jpknBNltWl/xM1z440GPAq6lbWyOu/cfyXRrsD14=;
	b=VtALb1vlttJ0buxeem4ez+UVG4
	Hu+Wqzb0QtgrS5QrZw/6aENv47GRNNh/CISIBQASNaoUt+cYAFXDVK4WXECNVL5dVc+xc/uVQOnIg
	HTLM6KHwDsX+QnIalbhYcS8kk7anQ8yPF0pzoGt/ezmRxs/uYaG5KB5LFuw2m65+v4FLJ9BMD4Ovz
	FfsRasFisl+b2XzsGmdUtlricIuZ6vBTkUhVjcJ0lMBS4vQc6DLTXfAo6MDzYuO1bB1gpNPStxfTg
	5oO+avG3iudqBw1sow49CGkIHR2P/HvdJHVOxannWGYHrDjws6h+iO/erNUOkLsTjti8W+DcHNPIc
	3Oq8t4Bg==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyG-0003yI-1n; Mon, 16 Nov 2020 14:59:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:32 +0100
Message-Id: <20201116145809.410558-42-hch@lst.de>
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
	linux-raid@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 41/78] swim: don't call blk_register_region
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

The swim driver (unlike various other floppy drivers) doesn't have
magic device nodes for certain modes, and already registers a gendisk
for each of the floppies supported by a device.  Thus the region
registered is a no-op and can be removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/swim.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 52dd1efa00f9c5..cc6a0bc6c005a7 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -745,18 +745,6 @@ static const struct block_device_operations floppy_fops = {
 	.check_events	 = floppy_check_events,
 };
 
-static struct kobject *floppy_find(dev_t dev, int *part, void *data)
-{
-	struct swim_priv *swd = data;
-	int drive = (*part & 3);
-
-	if (drive >= swd->floppy_count)
-		return NULL;
-
-	*part = 0;
-	return get_disk_and_module(swd->unit[drive].disk);
-}
-
 static int swim_add_floppy(struct swim_priv *swd, enum drive_location location)
 {
 	struct floppy_state *fs = &swd->unit[swd->floppy_count];
@@ -846,9 +834,6 @@ static int swim_floppy_init(struct swim_priv *swd)
 		add_disk(swd->unit[drive].disk);
 	}
 
-	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
-			    floppy_find, NULL, swd);
-
 	return 0;
 
 exit_put_disks:
@@ -932,8 +917,6 @@ static int swim_remove(struct platform_device *dev)
 	int drive;
 	struct resource *res;
 
-	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
-
 	for (drive = 0; drive < swd->floppy_count; drive++) {
 		del_gendisk(swd->unit[drive].disk);
 		blk_cleanup_queue(swd->unit[drive].disk->queue);
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
