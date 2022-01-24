Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6D497C87
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jan 2022 10:58:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19D8042A586;
	Mon, 24 Jan 2022 10:58:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9128742A57D
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jan 2022 10:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=H757LVIKTEq+1tqMYPD2FmecyVVQJSjnAtYvboQfhHo=;
	b=GomJocQW08/7qSga4w2CIK+2BK
	FRgJe8mSaZskxJ8huGQ3GCdY9JE51mbqy6LTZP5/YJyxok+aR/+68blZ6+ZP+ajrQVextKMiV73s0
	O3/szJPnf4HWKTQSvlC7KVDKo2hVtkQTucrUuFvorjuCiVuhrj8XVhvIBsZKv8JrOhI9rOjBBBy2q
	JrWeUnQsHk+x6KZcQgs8hS/8CS3knCeuA/DkOkGH2UwWPKz9zz/ha5JUjASlrdD6t3a5IhP8sdLfC
	3lDTVz8uN3dxArIrTUsI2n0McDZIMinlI24UY/n3qYNCJVo4bo09GVt6hvdFf2RQsHbnPKVqo6S+s
	emR21HqQ==;
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvO5-002kIy-Ur; Mon, 24 Jan 2022 09:11:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Jan 2022 10:11:01 +0100
Message-Id: <20220124091107.642561-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
	Mike Snitzer <snitzer@redhat.com>,
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
Subject: [Drbd-dev] [PATCH 13/19] block: move blk_next_bio to bio.c
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

Keep blk_next_bio next to the core bio infrastructure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 block/bio.c     | 13 +++++++++++++
 block/blk-lib.c | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 4312a8085396b..1536579ed490a 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -344,6 +344,19 @@ void bio_chain(struct bio *bio, struct bio *parent)
 }
 EXPORT_SYMBOL(bio_chain);
 
+struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
+{
+	struct bio *new = bio_alloc(gfp, nr_pages);
+
+	if (bio) {
+		bio_chain(bio, new);
+		submit_bio(bio);
+	}
+
+	return new;
+}
+EXPORT_SYMBOL_GPL(blk_next_bio);
+
 static void bio_alloc_rescue(struct work_struct *work)
 {
 	struct bio_set *bs = container_of(work, struct bio_set, rescue_work);
diff --git a/block/blk-lib.c b/block/blk-lib.c
index 9f09beadcbe30..9245b300ef73e 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -10,19 +10,6 @@
 
 #include "blk.h"
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
-{
-	struct bio *new = bio_alloc(gfp, nr_pages);
-
-	if (bio) {
-		bio_chain(bio, new);
-		submit_bio(bio);
-	}
-
-	return new;
-}
-EXPORT_SYMBOL_GPL(blk_next_bio);
-
 int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, int flags,
 		struct bio **biop)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
