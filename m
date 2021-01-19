Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B62FB341
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22A5C420825;
	Tue, 19 Jan 2021 08:38:00 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4C86D42061A
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033335; x=1642569335;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=SmRmSEecsPl0dNDxe5lwcfSlZzCbmw+NJIUAkJff7lg=;
	b=joYeBbCA45r+KHrPKPEDKQtY1FnL+BapBsURRT5h9aG5pollmB4buVO/
	Kz12EkND7Zn2r5AR04o9AwjZmesnbu8piNbsRuDtuI4a4PtPTZVA+Zsc2
	zsRbbcWrNFS8jv5NdsSr6UJch5LgUgOikS8faOo41tALYKFcSToYJ88hW
	leW0F/58Y+q2zvXek31uz8fRQhhxbr2/kBBHv2aY/fRM7eIYbFCDmIw6E
	2cxrhOvpIdf2q2qM4qQBu2DaMHR/WHbIYBLNOVFryGY9fOxEehFLP7NZc
	X0gVD3TU84+F3wZoXVTR7SkNfl6V0BoVwDmwxaiydbgTI8h5HGnXwAbE9 A==;
IronPort-SDR: rz8WnhgCkHzwykD0rZDjujBVQnbI/2m2UA7FqXY6+T4C/mBu8GwVS5fENzgNHUN1c/4ITGZUF0
	s2E9tIMJFAKhrbnqW7PIL5g8vRFwwfu9isWyZTvHGSSaskvdpL5n4PjQ0fjbwgFJl5horx3xEo
	32plfJ9Z/2qdt+GAxKqz1v1JxrjdtS3CjO/FPKReJ1Q5Df3o7qS76hWrLjlsIMHoaMBXYK/mRt
	/RRiND4/A9IujlC7L5YZG7LD5U/4lS2OTM2+ly+yBLjn7V/Tp/ujfifHRC4Hcw83vus+wKVVrw
	OsM=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940558"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:15 +0800
IronPort-SDR: ocLKsTlKD7XkkE7CT5WsozQIeaHTunxJUHlf4CBXdgRXnFXOIsmxEm4wlI/FQLkqGQ7Hg3Z2DK
	iw2ZxWlQwTjARFJUIFB/bCXrugd1x28vVEziMJdU7Do1uUzinPngWyDBYptwRgLKDWcNWvHfiZ
	GFiYYe8+T7dQqlzRlkTAuQMSiDNd/on/MvSC3v1DVqKYZAQV+rrBKt0zbuxml7FFg7TRHA8/Um
	+/7g+2j9qY3SAcd7nFqxx5ucEUN5jkQwWiqNcH3EaNLOY/oyuyoTA+FNaCTVxJjOL7SDu29GMa
	WLYUztbn6cW3Ny5d9ujYGZ/+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:50 -0800
IronPort-SDR: p1tcnYwAx/l/NVCOSE++cI0sO4XNQ+lbfc67fxaPGZ0Kwcqxhdz9+u3CPNrCwOw83oDaMA1Qjm
	ESU3xmsUtmMt60eRcgdVRVFxzLHWW7CqjKNcfNh1+RIHGbsJ3Ai97YW6MaxhVDB0yLEg9IysxE
	83VZ2vSeY/l/vgDGSUb38hhYRsZT54dyq7c3WndcswTCZVlwVMvWGE4bWezbXz6r57OZtdR1bX
	3lpkUR2AIs9h1PW1353M+8ODhhBWH9ueZ25tUnouwQQq8n8IP+3JRSYVgmwudbuVJ26I/RNNul
	ogs=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:14 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:08 -0800
Message-Id: <20210119050631.57073-15-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:53 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, darrick.wong@oracle.com,
	osandov@fb.com, kent.overstreet@gmail.com,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	tj@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
	bvanassche@acm.org, agruenba@redhat.com, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu, martin.petersen@oracle.com,
	song@kernel.org, philipp.reisner@linbit.com,
	jefflexu@linux.alibaba.com, rpeterso@redhat.com,
	lars.ellenberg@linbit.com, jth@kernel.org, asml.silence@gmail.com
Subject: [Drbd-dev] [RFC PATCH 14/37] drdb: use bio_init_fields in bitmap
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
 drivers/block/drbd/drbd_bitmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index df53dca5d02c..4fd9746af469 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1006,13 +1006,10 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
 		bm_store_page_idx(page, page_nr);
 	} else
 		page = b->bm_pages[page_nr];
-	bio_set_dev(bio, device->ldev->md_bdev);
-	bio->bi_iter.bi_sector = on_disk_sector;
+	bio_init_fields(bio, device->ldev->md_bdev, on_disk_sector, ctx, drbd_bm_endio, 0, 0);
 	/* bio_add_page of a single page to an empty bio will always succeed,
 	 * according to api.  Do we want to assert that? */
 	bio_add_page(bio, page, len, 0);
-	bio->bi_private = ctx;
-	bio->bi_end_io = drbd_bm_endio;
 	bio_set_op_attrs(bio, op, 0);
 
 	if (drbd_insert_fault(device, (op == REQ_OP_WRITE) ? DRBD_FAULT_MD_WR : DRBD_FAULT_MD_RD)) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
