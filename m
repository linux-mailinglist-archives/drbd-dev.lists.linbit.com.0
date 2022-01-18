Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 161304920C6
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jan 2022 08:59:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5518420BA1;
	Tue, 18 Jan 2022 08:59:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B8314205D8
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jan 2022 08:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Hmdul2b824Aw+W7hsxfLRPm+W2xGls7ShW1BUgArE2A=;
	b=FlSg7Ip4B3XJbqRLUazSGBl6sY
	aCwhXTmbowZx9b2j7qi2Hd8DnfbGH4eiPxuAaA2nRPne046/wmkaYlrnWHmDzVrmLfbwtcNrB2Y5G
	L2k1rbD83lcM9y55YgCjdm3x34WIVHPPGGKbMAMBTkOlHX1/RYAWfOSXMvKfFfvu+z6XGHMVcEUOc
	GTFWU4kS/QuprLIJtVIfCwCheJZFCG7BPLBRkxMUGQVd05jFWnJg0a/6rUFRuwjohPcbkpzQsrxtv
	nMW27Vau8u3rAodC7STr3O6ThI27hF4j362D5p61hPICn2G3bNrEpQc2H7FsOMM9QEe/wLR7EuIoO
	m2N3R2JA==;
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9in6-000Zaz-6Z; Tue, 18 Jan 2022 07:20:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:45 +0100
Message-Id: <20220118071952.1243143-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 12/19] xen-blkback: bio_alloc can't fail if it is
	allow to sleep
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

Remove handling of NULL returns from sleeping bio_alloc calls given that
those can't fail.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkback/blkback.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 14e452896d04c..6bb2ad7692065 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1327,9 +1327,6 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 				     seg[i].nsec << 9,
 				     seg[i].offset) == 0)) {
 			bio = bio_alloc(GFP_KERNEL, bio_max_segs(nseg - i));
-			if (unlikely(bio == NULL))
-				goto fail_put_bio;
-
 			biolist[nbio++] = bio;
 			bio_set_dev(bio, preq.bdev);
 			bio->bi_private = pending_req;
@@ -1346,9 +1343,6 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 		BUG_ON(operation_flags != REQ_PREFLUSH);
 
 		bio = bio_alloc(GFP_KERNEL, 0);
-		if (unlikely(bio == NULL))
-			goto fail_put_bio;
-
 		biolist[nbio++] = bio;
 		bio_set_dev(bio, preq.bdev);
 		bio->bi_private = pending_req;
@@ -1381,14 +1375,6 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	free_req(ring, pending_req);
 	msleep(1); /* back off a bit */
 	return -EIO;
-
- fail_put_bio:
-	for (i = 0; i < nbio; i++)
-		bio_put(biolist[i]);
-	atomic_set(&pending_req->pendcnt, 1);
-	__end_block_io_op(pending_req, BLK_STS_RESOURCE);
-	msleep(1); /* back off a bit */
-	return -EIO;
 }
 
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
