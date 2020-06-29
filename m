Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7420DCC2
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jun 2020 22:26:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 23BA04203E1;
	Mon, 29 Jun 2020 22:26:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4324D4203E1
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jun 2020 22:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L49detOHIFMZBv2u/yvsEnOxSRyecAx0WO9o6Vj19Gg=;
	b=q7gNkxTFXcVg1yAszGSmCkxQn7
	lXicqScm59nuMxQ/ket+RyBDVPYFZwPUBL8QbJkzYRiKnTqCC6BuV1tUIU5COa5jmZiGdCUCWXpMp
	qsOeAUK20gnONWIkR6FbtECLvtbiacCGqWKlW84S5AP+AwyjFIMCGWsymdUi0+5ChWpPvdQiwJjIZ
	3oh0r0bodWKyzTs51cS64yOUl9zpt0qof+j90crbOMYxdemomtLNgY1GUbSTiVxcX/42cdOE83NWn
	qav4MIBz4IJSXFI5QrsdFWfKh+4UTQlX3RxOZNnXKcq0hLgWeKZauyWbFPRzhIZm8VTafcbr2+SfT
	wcM8i5Wg==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzdM-0004Ji-Pl; Mon, 29 Jun 2020 19:40:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:36 +0200
Message-Id: <20200629193947.2705954-10-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 09/20] bcache: stop setting ->queuedata
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

Nothing in bcache actually uses the ->queuedata field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/bcache/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 2014016f9a60d3..21aa168113d30b 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -876,7 +876,6 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 		return -ENOMEM;
 
 	d->disk->queue			= q;
-	q->queuedata			= d;
 	q->backing_dev_info->congested_data = d;
 	q->limits.max_hw_sectors	= UINT_MAX;
 	q->limits.max_sectors		= UINT_MAX;
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
