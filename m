Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F125BAD2
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Sep 2020 08:05:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D7B59425483;
	Thu,  3 Sep 2020 08:05:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CAF5142511B
	for <drbd-dev@lists.linbit.com>; Thu,  3 Sep 2020 08:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xjOqc+Vfodq43UipqqbtBRKcpxkkULzdvtdrdqfm2Bg=;
	b=WNcNy8nqYOnva0Pe9CYAqbuz0u
	fZksAXJdUo/XKD5zc/Ei+HS3lCUioMsv4CapxLfk3/U2H/3ijZdpScwG6v2iGvwCeVRFo0jML67at
	J8W9xHgDm+AOzhKCYdFHlZefJSaWO34tgo4U3gPRppUjaoabuvs55Ylm2fyAtGXztFA8Ao7iRbznw
	w3OHy0XuJTeco8ABry6a0qtYIeuB5sEdh6oEwNlNVqeVHrWYue1feIOAHtr/hqlf74QugzuMymdmF
	+XVGVVD9p7cOEf39F2EhgxoT/ZWi6WrYyz9ekHwUXNlgls1hw/L63eiL2IccgB2pHAEi08hTlb7m8
	TqWVjPPg==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzm-0007P4-AB; Thu, 03 Sep 2020 05:41:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:41:03 +0200
Message-Id: <20200903054104.228829-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 8/9] block: use bd_partno in bdevname
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

No need to go through the hd_struct to find the partition number.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index 081f1039d9367f..771aa56b1a8c3d 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -85,7 +85,7 @@ char *disk_name(struct gendisk *hd, int partno, char *buf)
 
 const char *bdevname(struct block_device *bdev, char *buf)
 {
-	return disk_name(bdev->bd_disk, bdev->bd_part->partno, buf);
+	return disk_name(bdev->bd_disk, bdev->bd_partno, buf);
 }
 EXPORT_SYMBOL(bdevname);
 
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
