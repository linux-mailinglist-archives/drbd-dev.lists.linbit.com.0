Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A544BFDDB
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:56:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 258C5421786;
	Tue, 22 Feb 2022 16:56:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94D6B4201FE
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uybeJmrsOhYNyYw6JuTBsmhNCkwuMOHtglR2JjFNKIQ=;
	b=h/VY5ZyBUj2q/fYwi4v3BW0Bm3
	ejGl3SxqCsQ/PlggoKd1s6AkYUm5njHRilhhFnkjozFUd4SHU28Mu21fHScvDxICH1plE6xVqew9Y
	3l1j6G7pWAhFwacuDy9dTnr5k9moMtPtfPuIpxoHKKCbhMQCSE2h50m8ZRctcvv75AxI0ME4yljRu
	F7Hj11mV8OkXiabX3KTHbujeGELLnp7bmLX4mfYV9YVIw6tvxqAPsbCn0gkDTZR4xL63sM/nr0AZc
	+wKSytIZRrIvvR7W5J78ih9qcdIkECsFSDD0TzwCUbJmr3X+KybeGwd5L3siel7RF8BBlwhjrpuNd
	iApc2ETw==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSU-00APtE-4o; Tue, 22 Feb 2022 15:52:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:50 +0100
Message-Id: <20220222155156.597597-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222155156.597597-1-hch@lst.de>
References: <20220222155156.597597-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Chris Zankel <chris@zankel.net>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
	linux-xtensa@linux-xtensa.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 04/10] zram: use memcpy_from_bvec in
	zram_bvec_write
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

Use memcpy_from_bvec instead of open coding the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 14becdf2815df..e9474b02012de 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1465,7 +1465,6 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec,
 {
 	int ret;
 	struct page *page = NULL;
-	void *src;
 	struct bio_vec vec;
 
 	vec = *bvec;
@@ -1483,11 +1482,9 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec,
 		if (ret)
 			goto out;
 
-		src = kmap_atomic(bvec->bv_page);
 		dst = kmap_atomic(page);
-		memcpy(dst + offset, src + bvec->bv_offset, bvec->bv_len);
+		memcpy_from_bvec(dst + offset, bvec);
 		kunmap_atomic(dst);
-		kunmap_atomic(src);
 
 		vec.bv_page = page;
 		vec.bv_len = PAGE_SIZE;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
