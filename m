Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D32FB346
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 546B442084E;
	Tue, 19 Jan 2021 08:38:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B6CB42061C
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033413; x=1642569413;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=VllxQdSuETkut8jiQhHuy5FqGdkslwtr76oc8FFhzYc=;
	b=ZWYme6zZwrl20r0Xl9mdEO9xLgMbthLeQPQRguKC0qUIH8iC/jQI56J2
	41dUtb48822Z4TJUIU/zmkbAwRrfDzM9Fml9eKSMumZ98onu00IalwJf9
	pp84PpYy+ani6v1GXBYKvU00C+g6zVG5qcA/g5pfhRhcdYP7zprtkbYA7
	meJRaFakKjCXqcRD6DAXDhKbeknNURA+ie9h6B42tdBm5hLhVvZrfhhrx
	khSHwIkz6jQ/gq93AmYTosBD94UuAjJ4LPxsm3NzslAv1Vv3pfc/y5zp2
	Rk8C28bKytTDFkZ4hdq/1K1nznES1KIA6NfsLXwn9GABrKDzAZIWhBiIE Q==;
IronPort-SDR: 3xV49iy54ulqzBnUwYQGRrk9oogYeL2DMqHKHF+1ghac/bfgDvkWQJfQVokUgBEv6buY1nppab
	1A2HQooiL3Eg2lfN5v/RCNbSza1BSfVOruU/3nhByLiemQs9ed2doyffZzpDiT0uGabWZX4bSm
	G71mZkamDf2o6xCvcZeEbElySPdYDDAvA/KIQhwpt27R+bKrFGpvLLk6a5/1tbwNy3a3REb+2e
	8HMef7eNsfSsjHYC/dkR/HlNXPmTXUFsVq5y2Hngkec5Zjj4y1tyBHm9AfQQ13vVxWXf8W6Qnb
	86s=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201059"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:21 +0800
IronPort-SDR: VJkeVUaerRu7d47rf/AutUMpYVcAS8BXi5VNth740suf6W/idirz0HfkGiM1fUXjW7Ayi2Rfly
	g2CVUnnSxTAjF53U9/kSaiYLvIh78BV11XfGia8hTi8TsmtXWiZXYGPaHTpf2r438AWp53fAhT
	3rq7GxS6GFfdGiDeYKv3yHo7+XuW2jujRQdORVSoMYwVXSHHL5FOd1AjpSNmYVt9WgW5P6Yc/c
	sLvKM2Xokg/9OTYAV1JqnkGn1twrUg2DOgIMzrT3OJYtVPyFivEiNt0bHLX7xmbK4MyRLE20gu
	DrQ/C6H3UpUFLOFGaVOmfjpT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:59 -0800
IronPort-SDR: AukWeQ10GheUQlYR0D5EEj/feVa20cSuWNwottGMwE7opN0/I3RYtMUjQ5GxQSyfBE6/sdBk0k
	z4fxfv6aG+9JDmdOEZ65AwSHkGYtwddoOVkRqi4DvyiiLB8vtd/fOm44eFdRlx5N0V45fVA/G2
	Mrkem+bFgQ/7hMk41j/WbKXfrCn46pyu5FjaWYjPtBRdJOMYXrfOYhaNNWZEy5N5aQ3tw7GglR
	lppVbOb4m+51NXG4xiicKFxmfiLfz3Hlw8sn3kAgisMPSXvCeaKzeiNu728KKk2Lm4HPl2GKbp
	MUo=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:22 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:09 -0800
Message-Id: <20210119050631.57073-16-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 15/37] drdb: use bio_init_fields in receiver
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
 drivers/block/drbd/drbd_receiver.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 09c86ef3f0fd..2715081a4603 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1296,9 +1296,7 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 
 	octx->device = device;
 	octx->ctx = ctx;
-	bio_set_dev(bio, device->ldev->backing_bdev);
-	bio->bi_private = octx;
-	bio->bi_end_io = one_flush_endio;
+	bio_init_fields(bio, device->ldev->backing_bdev, 0, octx, one_flush_endio, 0, 0);
 	bio->bi_opf = REQ_OP_FLUSH | REQ_PREFLUSH;
 
 	device->flush_jif = jiffies;
@@ -1693,12 +1691,9 @@ int drbd_submit_peer_request(struct drbd_device *device,
 		goto fail;
 	}
 	/* > peer_req->i.sector, unless this is the first bio */
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, device->ldev->backing_bdev);
+	bio_init_fields(bio, device->ldev->backing_bdev, sector, peer_req,
+			drbd_peer_request_endio, 0, 0);
 	bio_set_op_attrs(bio, op, op_flags);
-	bio->bi_private = peer_req;
-	bio->bi_end_io = drbd_peer_request_endio;
-
 	bio->bi_next = bios;
 	bios = bio;
 	++n_bios;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
