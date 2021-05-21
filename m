Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CD38C055
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 09:06:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA4F5420624;
	Fri, 21 May 2021 09:06:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B2544205CC
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 09:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=g3lrORorOGdlA+chhXFoiRZ083wZZP/c6LDvo2P6/hA=;
	b=Hx8+vU+9P2K36yQ0fT1qbYbTtq
	yirGfRIknOCtiXRt/vnn4dIFJns8tfyH6dBItpgN6uR7pEYfx6LlbhKMLF0kdz7ZhBIylIKKM7yH9
	hGyRo+/4ktzM1LfhQvqtepRp8CkrTFBnWY56Md0SbPS/JDONzNUP7liIckX3mfrRTfbbULVpSg4S+
	VYdVdJ1t9Oz+ia/vjUXJTCMWZnBD0/hpkLzXXajvdMWrxEpyZIpUygPwv/KeKlY86FVoDS5wFCllh
	M6oJj8Wk0MOkR6vK7ZODkzykR5XMrTLgJJM82nK9TloNiCbG+kw4aqQ6F8PGn723aFIqoGvcChblj
	zEkBOQTw==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1ljy5W-00GqHh-Vr; Fri, 21 May 2021 05:52:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 21 May 2021 07:51:16 +0200
Message-Id: <20210521055116.1053587-27-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 26/26] block: unexport blk_alloc_queue
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

blk_alloc_queue is just an internal helper now, unexport it and remove
it from the public header.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c       | 1 -
 block/blk.h            | 2 ++
 include/linux/blkdev.h | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 689aac2625d2..3515a66022d7 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -599,7 +599,6 @@ struct request_queue *blk_alloc_queue(int node_id)
 	kmem_cache_free(blk_requestq_cachep, q);
 	return NULL;
 }
-EXPORT_SYMBOL(blk_alloc_queue);
 
 /**
  * blk_get_queue - increment the request_queue refcount
diff --git a/block/blk.h b/block/blk.h
index cba3a94aabfa..3440142f029b 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -359,4 +359,6 @@ int bio_add_hw_page(struct request_queue *q, struct bio *bio,
 		struct page *page, unsigned int len, unsigned int offset,
 		unsigned int max_sectors, bool *same_page);
 
+struct request_queue *blk_alloc_queue(int node_id);
+
 #endif /* BLK_INTERNAL_H */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 2c28577b50f4..d66d0da72529 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1213,7 +1213,6 @@ static inline int blk_rq_map_sg(struct request_queue *q, struct request *rq,
 extern void blk_dump_rq_flags(struct request *, char *);
 
 bool __must_check blk_get_queue(struct request_queue *);
-struct request_queue *blk_alloc_queue(int node_id);
 extern void blk_put_queue(struct request_queue *);
 extern void blk_set_queue_dying(struct request_queue *);
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
