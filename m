Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54820D63C
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jun 2020 22:05:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CEEC84203F1;
	Mon, 29 Jun 2020 22:05:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1427B42032F
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jun 2020 22:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nyRpegl2g2GPLIzpDQmlwzdY5HJ2Dd3E7fu8tgbKXsw=;
	b=Z5WuTv+Do9WG6OUJCMBSyCZ2b5
	O1p4C2SSN/f3xWFbYtIwxeNfomJ8ZEq0SyrbzjwwaJ7XajjWQqbg6ne0HqOCf09DYkGBZuLJ26GaA
	G4PKscydGqFZq4vsVbnE1rTpc8Bo2tVVSK4F1kmA58blASqI3DWTdKKd47m0N+FAS6pL0AtHMv1O6
	IpIMByc9LvubnMGH0kyT3l4+R6otGS/DYqbaIdQnK858+Ds+y29BSNTq2oK2idVCG0GRGtireJqdx
	k6us9hxnXU0NJXpEDVxEYAA+aWE9bCfkF1cFo2a5rw/CqXimrtjmiB9oiY72NmNc0pENv/evP4NX4
	7YEoQNww==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzdD-0004F6-7d; Mon, 29 Jun 2020 19:39:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:30 +0200
Message-Id: <20200629193947.2705954-4-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 03/20] drbd: stop using ->queuedata
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

Instead of setting up the queuedata as well just use one private data
field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 1 -
 drivers/block/drbd/drbd_req.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 45fbd526c453bc..26f4e0aa7393b4 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2805,7 +2805,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	if (!q)
 		goto out_no_q;
 	device->rq_queue = q;
-	q->queuedata   = device;
 
 	disk = alloc_disk(1);
 	if (!disk)
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index c80a2f1c3c2a73..3f09b2ab977822 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1595,7 +1595,7 @@ void do_submit(struct work_struct *ws)
 
 blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio)
 {
-	struct drbd_device *device = (struct drbd_device *) q->queuedata;
+	struct drbd_device *device = bio->bi_disk->private_data;
 	unsigned long start_jif;
 
 	blk_queue_split(q, &bio);
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
