Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0CD306F90
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:34:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CE08420831;
	Thu, 28 Jan 2021 08:34:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C72F4207A5
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:21:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818884; x=1643354884;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=eWet3+GOqUNRw+dCyihtl3LTOeV3gTTJDd7Ea4w+clg=;
	b=K6rgwyThubcFcKRiCvmaKZqAEVb18sffKcll/l3efjVKGe8doPSyNl4F
	YcX7vBOMBju1U5kcDiKX4iO/nkseKZbv9zdwFWa7Ga6y6p57KVIiPTgHy
	ur3K5OtGXzIEyeDT5H5ZJit0aWVP2Y8wheplhvattqSfpwPft1YofgQhx
	0JnXSMDfcB5eM/C5rcVjREBaYpo1gCePKF7st2xFhnQzIS5l0ihQBR8Z7
	bNZB72NXb6VWf5GN9X4a5P2HC/0IlCf36GFjDLDGhtNSMUiv0p+epeAWA
	RoFThnxYkbCqqdIcVww5U4nQGMckckZtKimlFgwgFb3tRU43G3/qEhajc Q==;
IronPort-SDR: CZhBDnIZNfAx8a8QYLhRvSZ1uU/fkZLNoEXK0lBDfC6Pm85g+bIdn3bsdCsB3falclCm/hwzgw
	tVuyLygOi2Q21GOfamdqHkPkStW24bKdMLfFk9m6Zj5N8g2TGOElemVu/EDGD2hBOLelmRI7uy
	ysTf0+0uBa3qVTv8E6W2hAUHBhss5pBrtNs98J73htfRUJIQciudfevDiUucn/NMdKrX7hOYT5
	9vvQ1Jl5NBf6k9LOTOxBgl9JphZzZV+f0yQa4RTVN+W4A//GTZnEJaTvbIIBEO9u/t6/XdCSbs
	w90=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="262548851"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:53 +0800
IronPort-SDR: Dw/5u8gSnWuL56eCD4ZekCop0MCBSFULuMvIK8I437ritrlIlnl71q3kn4zZ/AzLf6xl++ZToL
	nf0xLnFHQfxDacbH6CWFG/E4eUrmVr1DibZDtJjsxJcrr/EVmlkoUhWrUzF1QKLMEMXWVSPdQC
	VoHwFhf0xcdGmz1l32uV16iZQGjYNthFdJ+kuC+86RfzkRyucFIAbs6bpfHVcb5+aRQLlNA5/V
	gd5m3MhkwlgS1p4/D2fopCS6/f4WiQIT7e1B6WtpakNWAR4RLlSkSyCQSuWqF7ZIP9PabvP8ep
	L72AeGz8QTg8At8iaco7Zbrw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:07 -0800
IronPort-SDR: UO027L+w2LmrSv+r4jHc7V6MfhclxochZ4q/gKoOnHb/alTZT7F9/4KjZrNCZAKJPJHjEl8zjQ
	btfDHq8ntGB6arYkxikoGObA79gqCi3nJZAFBbpTjKtHzOWqNheZit1SHeKrnOkOlZqda10wHA
	lKzVa+peWlZiSXNoZnitf2s3YH424/Lf6Od0Q5TvGZLxtIxoLSsxIGie29rcLN/atLab1ULG9S
	UmjXPLLRWItiporouoLkwAzUh8fELyClcBeyT3S1PWdOuFAmZ6ShYxhRystXSbBeBsPW0LixEL
	geY=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:11:46 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:00 -0800
Message-Id: <20210128071133.60335-2-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 01/34] block: move common code into
	blk_next_bio()
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

blk_next_bio() is the central function which allocates the bios for
discard, write-same, write-zeroes and zone-mgmt. The initialization of
various bio members is duplicated in disacrd, write-same, write-zeores.
In this preparation patch we add bdev, sector, op, and opf arguments to
the blk_next_bio() to reduce the duplication. 

In the next patch we introduce bio_new(), this prepration patch allows
us to call it inside blk_next_bio().

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 block/blk-lib.c   | 36 +++++++++++++++---------------------
 block/blk-zoned.c |  4 +---
 block/blk.h       |  5 +++--
 3 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 752f9c722062..fb486a0bdb58 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -10,7 +10,9 @@
 
 #include "blk.h"
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+			sector_t sect, unsigned op, unsigned opf,
+			unsigned int nr_pages, gfp_t gfp)
 {
 	struct bio *new = bio_alloc(gfp, nr_pages);
 
@@ -19,6 +21,10 @@ struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
 		submit_bio(bio);
 	}
 
+	new->bi_iter.bi_sector = sect;
+	bio_set_dev(new, bdev);
+	bio_set_op_attrs(new, op, opf);
+
 	return new;
 }
 
@@ -94,11 +100,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
 
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, op, 0);
-
+		bio = blk_next_bio(bio, bdev, sector, op, 0, 0, gfp_mask);
 		bio->bi_iter.bi_size = req_sects << 9;
 		sector += req_sects;
 		nr_sects -= req_sects;
@@ -168,6 +170,7 @@ static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 	unsigned int max_write_same_sectors;
+	unsigned int op = REQ_OP_WRITE_SAME;
 	struct bio *bio = *biop;
 	sector_t bs_mask;
 
@@ -188,14 +191,11 @@ static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
 	max_write_same_sectors = bio_allowed_max_sectors(q);
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 1, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
+		bio = blk_next_bio(bio, bdev, sector, op, 0, 1, gfp_mask);
 		bio->bi_vcnt = 1;
 		bio->bi_io_vec->bv_page = page;
 		bio->bi_io_vec->bv_offset = 0;
 		bio->bi_io_vec->bv_len = bdev_logical_block_size(bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE_SAME, 0);
 
 		if (nr_sects > max_write_same_sectors) {
 			bio->bi_iter.bi_size = max_write_same_sectors << 9;
@@ -249,7 +249,9 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 {
 	struct bio *bio = *biop;
 	unsigned int max_write_zeroes_sectors;
+	unsigned int op = REQ_OP_WRITE_ZEROES;
 	struct request_queue *q = bdev_get_queue(bdev);
+	unsigned int opf = flags & BLKDEV_ZERO_NOUNMAP ? REQ_NOUNMAP : 0;
 
 	if (!q)
 		return -ENXIO;
@@ -264,13 +266,7 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		return -EOPNOTSUPP;
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_WRITE_ZEROES;
-		if (flags & BLKDEV_ZERO_NOUNMAP)
-			bio->bi_opf |= REQ_NOUNMAP;
-
+		bio = blk_next_bio(bio, bdev, sector, op, opf, 0, gfp_mask);
 		if (nr_sects > max_write_zeroes_sectors) {
 			bio->bi_iter.bi_size = max_write_zeroes_sectors << 9;
 			nr_sects -= max_write_zeroes_sectors;
@@ -303,6 +299,7 @@ static int __blkdev_issue_zero_pages(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop)
 {
+	unsigned int nr_pages = __blkdev_sectors_to_bio_pages(nr_sects);
 	struct request_queue *q = bdev_get_queue(bdev);
 	struct bio *bio = *biop;
 	int bi_size = 0;
@@ -315,11 +312,8 @@ static int __blkdev_issue_zero_pages(struct block_device *bdev,
 		return -EPERM;
 
 	while (nr_sects != 0) {
-		bio = blk_next_bio(bio, __blkdev_sectors_to_bio_pages(nr_sects),
+		bio = blk_next_bio(bio, bdev, sector, REQ_OP_WRITE, 0, nr_pages,
 				   gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		while (nr_sects != 0) {
 			sz = min((sector_t) PAGE_SIZE, nr_sects << 9);
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 7a68b6e4300c..68e77628348d 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -231,8 +231,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 		return -EINVAL;
 
 	while (sector < end_sector) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio_set_dev(bio, bdev);
+		bio = blk_next_bio(bio, bdev, 0 , op, REQ_SYNC, 0, gfp_mask);
 
 		/*
 		 * Special case for the zone reset operation that reset all
@@ -244,7 +243,6 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 			break;
 		}
 
-		bio->bi_opf = op | REQ_SYNC;
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
diff --git a/block/blk.h b/block/blk.h
index 0198335c5838..0a278bae5478 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -329,8 +329,9 @@ extern int blk_iolatency_init(struct request_queue *q);
 static inline int blk_iolatency_init(struct request_queue *q) { return 0; }
 #endif
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp);
-
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+			sector_t sect, unsigned op, unsigned opf,
+			unsigned int nr_pages, gfp_t gfp);
 #ifdef CONFIG_BLK_DEV_ZONED
 void blk_queue_free_zone_bitmaps(struct request_queue *q);
 #else
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
