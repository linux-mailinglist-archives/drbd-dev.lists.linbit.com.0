Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F972FB32A
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 17CFE420632;
	Tue, 19 Jan 2021 08:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CE034203D0
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033190; x=1642569190;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=pIz0KlDrHBvNvxslhciWsU5/CC3PXDNM4q2bLrt7qLQ=;
	b=m2CQRB6NqB4/zfPPg4kiDzJ47jhC1+oOV9Lzwazce2yj+Q9pomgCXLk8
	ZHNiHflCWhbcQnEHDABMP3G7KoM4beINGVj/BisTl8v848BHRKumGlgRf
	CofxF0QfFZ47r5x6qC9xWM5MEwU6oH1DINI1hJnX0hyktyqeMfm5Zfwpv
	fkyaX7Cugra/ndfogury+yCaJOIeSaSMEnyAmT94C8dvguCmfTKUVg+U4
	sSR8ElmaGRWU/kqlpdwS+ZyxJ7XDF0mO4s9XzHETRH8jVuYZxWQQQ9TyG
	U2ltS/1eUaCXzA0RXUilDZvseRY3kPzDJZ9vq4oh/2WQ3yU2eAP4hYYpT Q==;
IronPort-SDR: KKXq2WaagtoYzT09zPZHX9/UwSpvsJ0rveux1GxG5s5CSBD9h9I92U9eM8poQTtlSlE6apAcxu
	+r7PsTVe0JEdchGUEHVmUhrl7S6dKcASJeOxgT14GL6DqXyKd/CALQJBak9ZXC3H/8Qw6MnH0e
	ARqLVceGeugXbDkZ9SbN2sOI/vAmyLqhJe09QefERFJAAIp12u92Ryy5iFce/jLWxX7Fc52BlX
	uDiv1/230Cje7wa9SAtd/qyTSdgwQU4tgKsBGanEHG8eE1Lybr/uf0M7j6X5Vd7IumQyWS7suZ
	ODs=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201223"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:43 +0800
IronPort-SDR: p/M68nNmUbaM6Uf1l7axATWFjQN9k0BCmWFqYOSzkskCY/fR+ORyiRSRuFEyKFqiQ0BvGiEt6L
	fVGicODg5xMBVUW+bYzr6xt42LfCczfGWRZ5veSXkev9nLMN2bibzjuXbBb+8D0oXAH+VwM9c4
	SpLGlgZ6+UUG+woVADQwh/uATEeMB249ilQtTnhXEZlhBX3en8E8i0bJKI/GkddhEsLctowIeg
	zWUfBwoZ84yHBipJkeiKAxWKV5MNZKzuMxDqYrnmQwR5OPI06Ng8rTkTkBfdqb61JFlxatHISs
	yMOuxNbhkuqKBpCfMkjd8VTa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:18 -0800
IronPort-SDR: LsIx6xfp3MuCvVUBKYFUM/JkQXB8Xd6FGJiWWFhsO5FF8FnRTeuKG7U5dD7Rejep3b07GmAUmb
	ESoAg9lczoALSnARXtAcLYU7nWTaUgdnl4QXBjjX2qbcRpBVzJgVyC4kwkSnttKMzqx1NypHun
	wXbjpdfkPHnx0tGuE/6+V9ou48OKFTaS8Hgad4KU+rvcDNespMF4OxFR14ESWKX7jCsiRaANAt
	Bb3pRfhPY9tW+eTbrNJrKLsm+FoQOnSPpDH4sOQAdptthLApRwVVLlrj3oL4F2Q0S3i/yr38QG
	rvI=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:43 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:20 -0800
Message-Id: <20210119050631.57073-27-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 26/37] dm log writes: use bio_init_fields
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
 drivers/md/dm-log-writes.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index e3d35c6c9f71..35c2e0418561 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -223,11 +223,9 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
 		goto error;
 	}
 	bio->bi_iter.bi_size = 0;
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, lc->logdev->bdev);
 	bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
 			  log_end_super : log_end_io;
-	bio->bi_private = lc;
+	bio_init_fields(bio, lc->logdev->bdev, sector, lc, NULL, 0, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 	page = alloc_page(GFP_KERNEL);
@@ -283,10 +281,8 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 		}
 
 		bio->bi_iter.bi_size = 0;
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, lc->logdev->bdev);
-		bio->bi_end_io = log_end_io;
-		bio->bi_private = lc;
+		bio_init_fields(bio, lc->logdev->bdev, sector, lc, log_end_io,
+				0, 0);
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		for (i = 0; i < bio_pages; i++) {
@@ -370,10 +366,8 @@ static int log_one_block(struct log_writes_c *lc,
 		goto error;
 	}
 	bio->bi_iter.bi_size = 0;
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, lc->logdev->bdev);
-	bio->bi_end_io = log_end_io;
-	bio->bi_private = lc;
+	bio_init_fields(bio, lc->logdev->bdev, sector, lc, log_end_io,
+			0, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 	for (i = 0; i < block->vec_cnt; i++) {
@@ -392,10 +386,7 @@ static int log_one_block(struct log_writes_c *lc,
 				goto error;
 			}
 			bio->bi_iter.bi_size = 0;
-			bio->bi_iter.bi_sector = sector;
-			bio_set_dev(bio, lc->logdev->bdev);
-			bio->bi_end_io = log_end_io;
-			bio->bi_private = lc;
+			bio_init_fields(bio, lc->logdev->bdev, sector, lc, log_end_io, 0, 0);
 			bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 			ret = bio_add_page(bio, block->vecs[i].bv_page,
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
