Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A2E306F63
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:30:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 633D3420628;
	Thu, 28 Jan 2021 08:30:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ECECA420628
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818393; x=1643354393;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=A6gWT2+anXyYq2Hv6qVI+iojoFiSM9Vb51ZpjBpkhPc=;
	b=btEnah8PXWCYznSvO2CCV2tbgNZ0hBOgxK6lUdXViFjYyB5M/Es/6n8v
	JyaVm/c+IHuaU9n8yEVEV260rWelrIa7rT0o+RJ//ZDwa1j8YqytR/v+7
	GGEzchbdbVNN5Hdiup5CV7zopsuIiU9ns7edDl6/DE1FzeUYAjN/9xRmx
	92IZ4pR9U3DAv70plf7vwHvgAahVC3GtLBo4rEm/RjCzdblTOwpgO1TNd
	1BdCQRwLMJUKQ24cHjVdo/1VCMGv2nH2W7A0YRiAft356MdqUit+IRp6/
	n0BxtAF24tNOM8zLNRlqSVxbIWqgVWb1Lv0Z8uE2HjFQw4RgTnmtz5l0w w==;
IronPort-SDR: SXF2/v2yMcoZohKsWARhs1ywTn4NiQCDelHkw9kefsKqXLGIfdJFQtWqJth/hywHFUkwOeTZGW
	i0OBF7o5P37RFl/AcAOIhNkos/XoEy2JtydzSSf6103zKkpzXpIXcNYfPfFH9jJdXx8tzGud0W
	bPGukkqv/bWsiEkcOKX7+zpDx6Ug3VGMQguMqLzq4azbHWeLJAfFPlvUGbnRxKKzUSgNHD3CdF
	FRldlmBvVAhNz6dplMMVBqJmYgjvK/Tuj7c3ig4gQk/FjDWN+piZTz/f6qFUGQqxxuWPW9FDlR
	WJE=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517286"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:45 +0800
IronPort-SDR: yCQFspZUC6oncXTaKwIwQEbJtg7h4Z/Al5RboDMneuHoYdKf47fy0htuoEufejPFxEPIS5HYAJ
	Lx/OYZPyeiJVcCIElHnR7LI/oNKUZVtmQS8b0xNvGSOvZG30fAvI4M59b+5KeYkeWBngMOqEee
	2T9RIJEAd356ynBLWyXaG4gzoyLRoWGu7XuoOVC3sZOyN8NRkWCDvB7vlGqtmDOKFZ4ilmpUF1
	UlWK3bW9Ir7d1QlzF6HoIXFir6aigfYl7HrD45g/0g8TYGh2jkEthZCRzQdZw/KE0i2n6evEqr
	fZg7jWT6VroZkRDLHMaSSgQA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:03 -0800
IronPort-SDR: iX0HhBu+61xFa7EtRWB17G0RFoDdFxtABLHP5yHe733z1qMOeQszsqPYXIq64MFQkReY48/RWk
	FOClHc2dhNxuRM1QyLpF0KtQrhnCpVvcpPgq0B9OecXrJpCL8UYdCuDWFTL9LdxFS6qWHXh51B
	DNrP6xQEwjJPm/GL/W/Mv5XtvThzXYCRCRRzvICfBStun4/LN576oOtiFYHwzWMShhTX3BjqKf
	c8icNJold/1bdh3xf4xqkQcFwP0TJ4M2AqZVo41MRst8Lsv9bfR6qeue7iMnlhLF3vJJuSRBwu
	WXg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:45 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:06 -0800
Message-Id: <20210128071133.60335-8-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 07/34] dm: use bio_new in dm-log-writes
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

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/md/dm-log-writes.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index e3d35c6c9f71..7ca9af407647 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -217,18 +217,15 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
 	void *ptr;
 	size_t ret;
 
-	bio = bio_alloc(GFP_KERNEL, 1);
+	bio = bio_new(lc->logdev->bdev, sector, REQ_OP_WRITE, 0, 1, GFP_KERNEL);
 	if (!bio) {
 		DMERR("Couldn't alloc log bio");
 		goto error;
 	}
 	bio->bi_iter.bi_size = 0;
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, lc->logdev->bdev);
 	bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
 			  log_end_super : log_end_io;
 	bio->bi_private = lc;
-	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 	page = alloc_page(GFP_KERNEL);
 	if (!page) {
@@ -264,7 +261,7 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 			     size_t entrylen, void *data, size_t datalen,
 			     sector_t sector)
 {
-	int num_pages, bio_pages, pg_datalen, pg_sectorlen, i;
+	int num_pages, pg_datalen, pg_sectorlen, i;
 	struct page *page;
 	struct bio *bio;
 	size_t ret;
@@ -272,24 +269,21 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 
 	while (datalen) {
 		num_pages = ALIGN(datalen, PAGE_SIZE) >> PAGE_SHIFT;
-		bio_pages = min(num_pages, BIO_MAX_PAGES);
 
 		atomic_inc(&lc->io_blocks);
 
-		bio = bio_alloc(GFP_KERNEL, bio_pages);
+		bio = bio_new(lc->logdev->bdev, sector, REQ_OP_WRITE, 0,
+			      num_pages, GFP_KERNEL);
 		if (!bio) {
 			DMERR("Couldn't alloc inline data bio");
 			goto error;
 		}
 
 		bio->bi_iter.bi_size = 0;
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, lc->logdev->bdev);
 		bio->bi_end_io = log_end_io;
 		bio->bi_private = lc;
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
-		for (i = 0; i < bio_pages; i++) {
+		for (i = 0; i < bio->bi_max_vecs; i++) {
 			pg_datalen = min_t(int, datalen, PAGE_SIZE);
 			pg_sectorlen = ALIGN(pg_datalen, lc->sectorsize);
 
@@ -317,7 +311,7 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 		}
 		submit_bio(bio);
 
-		sector += bio_pages * PAGE_SECTORS;
+		sector += bio->bi_max_vecs * PAGE_SECTORS;
 	}
 	return 0;
 error_bio:
@@ -364,17 +358,15 @@ static int log_one_block(struct log_writes_c *lc,
 		goto out;
 
 	atomic_inc(&lc->io_blocks);
-	bio = bio_alloc(GFP_KERNEL, min(block->vec_cnt, BIO_MAX_PAGES));
+	bio = bio_new(lc->logdev->bdev, sector, REQ_OP_WRITE, 0,
+			block->vec_cnt, GFP_KERNEL);
 	if (!bio) {
 		DMERR("Couldn't alloc log bio");
 		goto error;
 	}
 	bio->bi_iter.bi_size = 0;
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, lc->logdev->bdev);
 	bio->bi_end_io = log_end_io;
 	bio->bi_private = lc;
-	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 	for (i = 0; i < block->vec_cnt; i++) {
 		/*
@@ -386,17 +378,15 @@ static int log_one_block(struct log_writes_c *lc,
 		if (ret != block->vecs[i].bv_len) {
 			atomic_inc(&lc->io_blocks);
 			submit_bio(bio);
-			bio = bio_alloc(GFP_KERNEL, min(block->vec_cnt - i, BIO_MAX_PAGES));
+			bio = bio_new(lc->logdev->bdev, sector, REQ_OP_WRITE,
+					0, block->vec_cnt - i, GFP_KERNEL);
 			if (!bio) {
 				DMERR("Couldn't alloc log bio");
 				goto error;
 			}
 			bio->bi_iter.bi_size = 0;
-			bio->bi_iter.bi_sector = sector;
-			bio_set_dev(bio, lc->logdev->bdev);
 			bio->bi_end_io = log_end_io;
 			bio->bi_private = lc;
-			bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 			ret = bio_add_page(bio, block->vecs[i].bv_page,
 					   block->vecs[i].bv_len, 0);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
