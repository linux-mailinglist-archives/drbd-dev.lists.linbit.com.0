Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C394A7526
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:01:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AABD64201CB;
	Wed,  2 Feb 2022 17:01:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 589CC42017F
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=53g90lZBMh/ldzirlFZP4n9i+Wwo32QW2GhtYSf7T5E=;
	b=v56pgGCEOMyc3JXNRaB7TS7FAX
	IauoereXezUReiBaeO1d4C4O4ReBujjrvVSs7ieQZzqLMQWM9HbpLtntMdw4gxo+pLCk7+7dKS5Pn
	2/hOVdHcobJGn0oTmM/80YlS73Fb7QRqOB0266M6tKLHtcRT5oAgcjuSD1z2wlWQpCTrDxVWz0QHQ
	jCQUKDh2BwlImzd+yEAPnwXCtrUGuTruBap8+57GacXtW6cvTG1SQ0CZHvLCxnhcpEPpNuGMZ+EYe
	KMp7XreppkL0bYnqeS53zyRNVRDI3asQ8kxbrWr1UEXHY2/TURV+iCgqgBbNyrRBGwXi1Q8VXHy/3
	kFSlvD/A==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4I-00G7wt-54; Wed, 02 Feb 2022 16:01:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:00:57 +0100
Message-Id: <20220202160109.108149-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202160109.108149-1-hch@lst.de>
References: <20220202160109.108149-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 01/13] drbd: set ->bi_bdev in drbd_req_new
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

Make sure the newly allocated bio has the correct bi_bdev set from the
start.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_req.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 3235532ae0778..8d44e96c4c4ef 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -31,6 +31,7 @@ static struct drbd_request *drbd_req_new(struct drbd_device *device, struct bio
 	memset(req, 0, sizeof(*req));
 
 	req->private_bio = bio_clone_fast(bio_src, GFP_NOIO, &drbd_io_bio_set);
+	bio_set_dev(req->private_bio, device->ldev->backing_bdev);
 	req->private_bio->bi_private = req;
 	req->private_bio->bi_end_io = drbd_request_endio;
 
@@ -1151,8 +1152,6 @@ drbd_submit_req_private_bio(struct drbd_request *req)
 	else
 		type = DRBD_FAULT_DT_RD;
 
-	bio_set_dev(bio, device->ldev->backing_bdev);
-
 	/* State may have changed since we grabbed our reference on the
 	 * ->ldev member. Double check, and short-circuit to endio.
 	 * In case the last activity log transaction failed to get on
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
