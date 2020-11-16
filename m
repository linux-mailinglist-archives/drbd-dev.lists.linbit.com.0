Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id CC37D2B46E5
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 15:59:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A437E420662;
	Mon, 16 Nov 2020 15:59:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EA0D420601
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 15:58:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x5/MaiTSLd30pQ/Fqm/l4PitleNTflLc7dCfcSezhUw=;
	b=vsGAL9U8HRExJBfuNBlOJoYTrw
	TjKt1s0QBKjG6I5tKKhtgoYV/e1gMtZau9MsGbzjL6ihP06PQ8IAVbe+JV6qvxfhubM6k3FD5n/Ta
	sfOT7ioQF9fWp3yjxs1txJ+JxTgkSd1h8SuTZhNqV2KfEh3d9sp0wul/KMAtYzv/nWLwcquJtpxyw
	loV+Tkg2tMzw1ciSe//LPbFNEK2gCOGFgsX7ytqRM4Y6skH1rdy0ayx4DfRzhbFzNc8UbnxLsWAfz
	4Oi9dpKoJqVcUe23/rbzHXdvlIR2k09MyeOVJX4AGpVZ5L4Zh8Od777u2dexRDhOPgmWiAMpOnltJ
	cQp3oOwQ==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxP-0003j3-EO; Mon, 16 Nov 2020 14:58:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:56:55 +0100
Message-Id: <20201116145809.410558-5-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 04/78] sd: update the bdev size in
	sd_revalidate_disk
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

This avoids the extra call to revalidate_disk_size in sd_rescan and
is otherwise a no-op because the size did not change, or we are in
the probe path.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/scsi/sd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 656bcf4940d6d1..4a34dd5b153196 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1750,10 +1750,8 @@ static int sd_sync_cache(struct scsi_disk *sdkp, struct scsi_sense_hdr *sshdr)
 static void sd_rescan(struct device *dev)
 {
 	struct scsi_disk *sdkp = dev_get_drvdata(dev);
-	int ret;
 
-	ret = sd_revalidate_disk(sdkp->disk);
-	revalidate_disk_size(sdkp->disk, ret == 0);
+	sd_revalidate_disk(sdkp->disk);
 }
 
 static int sd_ioctl(struct block_device *bdev, fmode_t mode,
@@ -3266,7 +3264,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	sdkp->first_scan = 0;
 
 	set_capacity_revalidate_and_notify(disk,
-		logical_to_sectors(sdp, sdkp->capacity), false);
+		logical_to_sectors(sdp, sdkp->capacity), true);
 	sd_config_write_same(sdkp);
 	kfree(buffer);
 
@@ -3276,7 +3274,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	 * capacity to 0.
 	 */
 	if (sd_zbc_revalidate_zones(sdkp))
-		set_capacity_revalidate_and_notify(disk, 0, false);
+		set_capacity_revalidate_and_notify(disk, 0, true);
 
  out:
 	return 0;
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
