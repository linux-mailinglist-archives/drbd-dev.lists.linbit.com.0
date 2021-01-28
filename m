Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA06306F1E
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:27:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B370B4203D0;
	Thu, 28 Jan 2021 08:27:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C77E44203D0
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818345; x=1643354345;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=1Q7huJyMDOVynURh2o3jolV4xRilOq3cl8xkF29/liU=;
	b=Xokhqx/kI+lH+5tcV94PnUYdpqzHxCnEMrJb7k7yRX1TXX6+YrDrES7k
	gVuozKDg053EDnc9hxj2s7KpINnmhPOGTRi5LybypBkwBoRj3Am++z4jz
	DiOsck+nw3gL8q0d1r0qfT2oJj1H+wUzo65vKMW/4C/9gNsfz9lNUZWMp
	usQVQXeq3jbrJaAEMDG0koLWX41+r0GkCXrdNptYT/0Id9/A9aaPtzBWg
	cRb5JxNDvKLIQFq52rpYh08oCY56oX6bXwam1FQNRmkcHI6+njwwl7PdK
	QkgjdN+tN4QRVO5eOHiITECMcXWMGhyLr/6Y7RfKoOXk3shNuKYrhIJJg w==;
IronPort-SDR: HgLIS8wIFNNUDH/E7NwwZhCWd1m5VtaYUj09RPtAd4xDifw+lkRzYFCxvk4OfuMyLKJQhH9qva
	iACaKTM7cikdCjAUdzmmIzcmbYYyf16toGQQnmuiI9sexXAy3R+mhAfWCO//qt3Yi/Y66DxYVW
	3+AUJzLKKMZq1s4d2REI3dZ7ePPqRGSTvh+szOwLMnyiLt97AOKj2R4AuyUQvT3eEO+xfHXES7
	1BUlLALZplyEmQAzULJfVEAMaCfi/m/NAIsuIObeSVYHbW9Fmoomvo5vbbxjqmarxNHP8cwhjT
	JyI=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517209"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:11:57 +0800
IronPort-SDR: iPUHDsWfN42YijNA6Mik4UV942jbhum49kwhzdK/zV96IyyAeWi8kh4URJJPExLhnDZZc/Hzo+
	hrWALQMsRicEvatKwcgi2o6eMllmFW2TpSYq7X0IbC3xX8le7zB9i4MleQ1KBMWwPtAO5dPnLz
	4NXM8s769ldERVUhbqyFJdsW59ibdKvkfUeBRU9+EHjpqYaLknxtCBBHqUQeG6J8I9NLP0Zr4N
	3kHgxUyAMn6McXa3kJSrWMDjI2RDNbFFT9vSG9Bkg+JCjERiIsZBklauAY1upQ2JQowq4JMTBR
	ntVhihCEl3pP5zrNJE2mSspb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:17 -0800
IronPort-SDR: HYKG8+pmcZ9KZ4KZ0ijEvKFdi7W0dgGDXHFsWIaWNxW3zaOZulAuYVmKBU97gor6eDg6ylP5Ni
	6/ahnxe6yM79ewZwsqKvrfMjvqQiAhLVOYCtlxS8Bh1Gz/vhwXPlVRnl4SwtLQD680yYKL86EL
	o3y724i0cbqHM9ChTIb0swq0MYuYoJx+iwqVjQ/XkVzNSKEtJ8uwRbdybmRUPVMHWHGtPAl98+
	IjNd0sVxBZiY+I2eDgAQpiJ9r1dqmBNoZAqnfBCkqleNy/DSVZGKQaXDO89s0wR1FlZS/ZCSSd
	5w0=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:11:57 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:01 -0800
Message-Id: <20210128071133.60335-3-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Cc: shaggy@kernel.org, sergey.senozhatsky.work@gmail.com, snitzer@redhat.com,
	tiwai@suse.de, djwong@kernel.org, gustavoars@kernel.org,
	joseph.qi@linux.alibaba.com, pavel@ucw.cz,
	alex.shi@linux.alibaba.com, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, mark@fasheh.com,
	osandov@fb.com, ebiggers@kernel.org, ngupta@vflare.org,
	len.brown@intel.com, chaitanya.kulkarni@wdc.com,
	konrad.wilk@oracle.com, hare@suse.de, ming.lei@redhat.com,
	viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
	jaegeuk@kernel.org, konishi.ryusuke@gmail.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, akpm@linux-foundation.org,
	martin.petersen@oracle.com, rjw@rjwysocki.net,
	philipp.reisner@linbit.com, minchan@kernel.org, tj@kernel.org,
	lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com, jlbec@evilplan.org, roger.pau@citrix.com
Subject: [Drbd-dev] [RFC PATCH 02/34] block: introduce and use bio_new
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

Introduce bio_new() helper and use it in blk-lib.c to allocate and
initialize various non-optional or semi-optional members of the bio
along with bio allocation done with bio_alloc(). Here we also calmp the
max_bvecs for bio with BIO_MAX_PAGES before we pass to bio_alloc().

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 block/blk-lib.c     |  6 +-----
 include/linux/bio.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index fb486a0bdb58..ec29415f00dd 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -14,17 +14,13 @@ struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
 			sector_t sect, unsigned op, unsigned opf,
 			unsigned int nr_pages, gfp_t gfp)
 {
-	struct bio *new = bio_alloc(gfp, nr_pages);
+	struct bio *new = bio_new(bdev, sect, op, opf, gfp, nr_pages);
 
 	if (bio) {
 		bio_chain(bio, new);
 		submit_bio(bio);
 	}
 
-	new->bi_iter.bi_sector = sect;
-	bio_set_dev(new, bdev);
-	bio_set_op_attrs(new, op, opf);
-
 	return new;
 }
 
diff --git a/include/linux/bio.h b/include/linux/bio.h
index c74857cf1252..2a09ba100546 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -826,5 +826,30 @@ static inline void bio_set_polled(struct bio *bio, struct kiocb *kiocb)
 	if (!is_sync_kiocb(kiocb))
 		bio->bi_opf |= REQ_NOWAIT;
 }
+/**
+ * bio_new -	allcate and initialize new bio
+ * @bdev:	blockdev to issue discard for
+ * @sector:	start sector
+ * @op:		REQ_OP_XXX from enum req_opf
+ * @op_flags:	REQ_XXX from enum req_flag_bits
+ * @max_bvecs:	maximum bvec to be allocated for this bio
+ * @gfp_mask:	memory allocation flags (for bio_alloc)
+ *
+ * Description:
+ *    Allocates, initializes common members, and returns a new bio.
+ */
+static inline struct bio *bio_new(struct block_device *bdev, sector_t sector,
+				  unsigned int op, unsigned int op_flags,
+				  unsigned int max_bvecs, gfp_t gfp_mask)
+{
+	unsigned nr_bvec = clamp_t(unsigned int, max_bvecs, 0, BIO_MAX_PAGES);
+	struct bio *bio = bio_alloc(gfp_mask, nr_bvec);
+
+	bio_set_dev(bio, bdev);
+	bio->bi_iter.bi_sector = sector;
+	bio_set_op_attrs(bio, op, op_flags);
+
+	return bio;
+}
 
 #endif /* __LINUX_BIO_H */
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
