Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 650354CBC78
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 12:23:06 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 46690421798;
	Thu,  3 Mar 2022 12:23:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0EBAF421787
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 12:20:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jwQ8EMek85Vv3Kxcg6RZE3A0yhPrWq7YuU+GB1UR/fc=;
	b=a0w5wMhnV2cAkl4jBAoeIc/lvE
	RM2lW8parEdSKE3bhF38pyGY1TAesz3WERdXg+/tbwDWKI24aMa3z4mLe7db7FQFF2V5HnN3ZKh4E
	VpezJuV3vAQC20v5kv17fpLTeYYWA2+Rt/AlcwGZsQ8MsW9MMsJUjIKPcks0BCC3gAIjZtj+sNKyL
	pRhllO7VZoDCVHscPgjWm2gyaIxVCxrby/j/UVqvhC5HMpmFRFAll9t7ejJJt/nlv+X6BCGw2Musx
	BAiaU1DI/JnZXbYu8cgvbAAo/zsJG2qihgIRU/Hnecjga3hynK2ki+1XN/sHc8FPIBviY4hN4Z5vX
	dqWuGtzA==;
Received: from [91.93.38.115] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPjVB-006C8B-MV; Thu, 03 Mar 2022 11:20:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Mar 2022 14:19:03 +0300
Message-Id: <20220303111905.321089-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303111905.321089-1-hch@lst.de>
References: <20220303111905.321089-1-hch@lst.de>
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
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 08/10] drbd: use bvec_kmap_local in drbd_csum_bio
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

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/block/drbd/drbd_worker.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index a5e04b38006b6..1b48c8172a077 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -326,9 +326,9 @@ void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
 	bio_for_each_segment(bvec, bio, iter) {
 		u8 *src;
 
-		src = kmap_atomic(bvec.bv_page);
-		crypto_shash_update(desc, src + bvec.bv_offset, bvec.bv_len);
-		kunmap_atomic(src);
+		src = bvec_kmap_local(&bvec);
+		crypto_shash_update(desc, src, bvec.bv_len);
+		kunmap_local(src);
 
 		/* REQ_OP_WRITE_SAME has only one segment,
 		 * checksum the payload only once. */
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
