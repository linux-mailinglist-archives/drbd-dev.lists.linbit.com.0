Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DED4A7559
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:04:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2D034201CB;
	Wed,  2 Feb 2022 17:04:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E64324201B6
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZdpH0Dvvs/Dm4a6IaYQGVHJPIYUa7UOvgcazFhG1ngc=;
	b=lhzpTxB744VOcjS8rHWtgoFU4Q
	/kQp+0VLvl+qM0+5RbwAwzyYznIsg6+aiJbarjmAoEsLLIkCZZ6nxKCTj2Dun4JL5NRd+PdMaQ6oJ
	He0hVLmC7Q6a7mh4zSxN+YLgJiKPZeiegAdtoztE9tH6TXwuHa6ldl/V0c7BQl86JzXotaQrGygbw
	4MzzMJkekmAk9oJdes4Tw2JGCLOIKG3zhJzXFrHL4EY/qTMYiRmx1p/NqGLBVuJQ727SDqMeZLxtz
	WiYWHibNG76P7Zpkvltyo1b3r0x0gpHVSC1+W5/1aIpllXmiS5hkmGas3E6EDrb8jsqv9g5p/O9Gd
	LXXCTi+w==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4V-00G82n-L5; Wed, 02 Feb 2022 16:01:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:01:02 +0100
Message-Id: <20220202160109.108149-7-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 06/13] dm: pass the bio instead of tio to
	__map_bio
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

This simplifies the callers a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 90341b7fa5809..a43d280e9bc54 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1117,11 +1117,11 @@ static noinline void __set_swap_bios_limit(struct mapped_device *md, int latch)
 	mutex_unlock(&md->swap_bios_lock);
 }
 
-static void __map_bio(struct dm_target_io *tio)
+static void __map_bio(struct bio *clone)
 {
+	struct dm_target_io *tio = clone_to_tio(clone);
 	int r;
 	sector_t sector;
-	struct bio *clone = &tio->clone;
 	struct dm_io *io = tio->io;
 	struct dm_target *ti = tio->ti;
 
@@ -1227,7 +1227,7 @@ static int __clone_and_map_data_bio(struct clone_info *ci, struct dm_target *ti,
 	if (bio_integrity(bio))
 		bio_integrity_trim(clone);
 
-	__map_bio(tio);
+	__map_bio(clone);
 	return 0;
 free_tio:
 	free_tio(tio);
@@ -1283,11 +1283,9 @@ static void __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
 	alloc_multiple_bios(&blist, ci, ti, num_bios, len);
 
 	while ((clone = bio_list_pop(&blist))) {
-		struct dm_target_io *tio = clone_to_tio(clone);
-
 		if (len)
 			bio_setup_sector(clone, ci->sector, *len);
-		__map_bio(tio);
+		__map_bio(clone);
 	}
 }
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
