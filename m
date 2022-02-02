Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC14A764F
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:57:53 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83D4A42021E;
	Wed,  2 Feb 2022 17:57:53 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F046A420218
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9vtcoYF0xFYfZ7BqRP6/9k6ICg1jRsT6X5lPX4vB1/Q=;
	b=zrIOMGLosVsiJK6TV63F0QfKK/
	ls7/UBbvT/X7pvwG9wvV6qozERF8maIeHz0kUgQY4nzBIqpirNE83PvEGlciZTyZQSsLhqlVrCrWi
	fCegjZosJKqQzUrMF/jCF82WDi+HFR7WLBWRMLfP0IekUStsQJq5Qcn2BN+FwexBcR8nZpNInahLB
	1ksVZ+MUIYwO6XqSKYq0vV2n2+ZGvcjyNlI8b9e9IitfTZ31HId33uIt8VaomXKj6tBGKStvhzjEo
	GB6Zu3fhtBgKuocQsT8BGsOnj9RiiCxna6tOteeFc9NVGo4/oP86RD2ijTz7pk2uAnW0kmmK2oR15
	PyCYE58Q==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4j-00G89K-8Z; Wed, 02 Feb 2022 16:01:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:01:07 +0100
Message-Id: <20220202160109.108149-12-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 11/13] dm: use bio_clone_fast in
	alloc_io/alloc_tio
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

Replace open coded bio_clone_fast implementations with the actual helper.
Note that the bio allocated as part of the dm_io structure in alloc_io
will only actually be used later in alloc_tio, making this earlier
cloning of the information safe.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 0f8796159379e..862564a5df74b 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -520,7 +520,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
 	struct dm_target_io *tio;
 	struct bio *clone;
 
-	clone = bio_alloc_bioset(NULL, 0, 0, GFP_NOIO, &md->io_bs);
+	clone = bio_clone_fast(bio, GFP_NOIO, &md->io_bs);
 
 	tio = clone_to_tio(clone);
 	tio->inside_dm_io = true;
@@ -553,8 +553,8 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 		/* the dm_target_io embedded in ci->io is available */
 		tio = &ci->io->tio;
 	} else {
-		struct bio *clone = bio_alloc_bioset(NULL, 0, 0, gfp_mask,
-						     &ci->io->md->bs);
+		struct bio *clone = bio_clone_fast(ci->bio, gfp_mask,
+						   &ci->io->md->bs);
 		if (!clone)
 			return NULL;
 
@@ -562,12 +562,6 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 		tio->inside_dm_io = false;
 	}
 
-	if (__bio_clone_fast(&tio->clone, ci->bio, gfp_mask) < 0) {
-		if (ci->io->tio.io)
-			bio_put(&tio->clone);
-		return NULL;
-	}
-
 	tio->magic = DM_TIO_MAGIC;
 	tio->io = ci->io;
 	tio->ti = ti;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
