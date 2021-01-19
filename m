Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4282FB331
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 473DB4207C7;
	Tue, 19 Jan 2021 08:37:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A538B420590
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611034118; x=1642570118;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=CEdgjJXFGgEM2vVXbkhgIZw1T1rq8VUMRvKmaMfgKhs=;
	b=pKGkW/8+3FsmRNnDO+zTmJKb9zEgo5GXr/9ev54GHAKFPPe1KVIPStgs
	HJDK3BYY9qBv/adkBY1H3V/7AtnHLNgcysxyok3fmCdIzExsXNqxtzwQz
	kVAbcUhAIRgenT997SaT81eWVUhRjUFZpo8mIfm/lVazORprrXPF9HG4B
	LYpXyDQu7EgsR6d8siDt0mu/qpR6IoyJqahBJSTVJ/RIYz+Z1p/IHm3x3
	1fKo7p7QQQOQxhNgBlBFS/sZ4bbY5Oaux6/8yrH03goIPxxa/5Fys+3sa
	GJegfAnQdlThFF7IQqmI7KWt8wwUH/WNO1eAEoI1IPlKjOlnEY+iM0bF9 g==;
IronPort-SDR: 8S5BhXSbe8mbZa4CAAatYaKrvzeu4/1N4JgGiE0hYYt+R9keq+vVo6jTjZltuVZzn1d1nz+hKc
	q/0/a2Z4jQU9f7PdxBpWQqWGy1HH4F0Bfhp0gI9LdivjrmjxvcmKljYtaX7YuM5tyBq2/5m9df
	R7xfnLJpXUHBZnXuJnvzLjnYxaOgC7/7AmE189jPaV0DB4EpEYKNz5MrFWGeAGIu6AOjNbNvt5
	z/vFL1xj1szvMfuP3D5RDQJxQse9+4yvBXRrSOYgOp4b8Rt/I8WoBwAPB1P54sc2e7B4yaZA4F
	xfs=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722419"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:21:24 +0800
IronPort-SDR: Mlh//1Qsj7qWugSBlZDGVB3P816ckh9ymXKCJlZeQABCpnUe9PxJyKyrN4CTV5pUxN8rD53qjc
	KBQs9ksY/npRAxAXEQLKHMBTpo4LnYiQ8Jsh+UeCnqEzuBj+NBep2YdATI+02nJPRDTx9o/Vx0
	qqnkcvLKqVX6QLzAZzZ9wNwZ3RvXD24pzeCeejWL7le26UCogwRMb+BANL+bZyJwsHD8n8CBmC
	waeP9zbiYa3yUro/vjgw3dfBzdz+DSunP6+K+EB2xVa3WWMwqKyYawcw7VtAoTQn1D9XWRhgNm
	eGun1OFYpbp47GBFGhuF0+rz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:34 -0800
IronPort-SDR: a+gnNfhBGlfndCUXu2PRYuff1boYNdHfSgVMM4QGOo0gBqok0UAFSw+CakQqID9DiHlkJTF/tk
	tfTEZKWrBtDq0dUvqYcf+WsTdC0Igy/6eIFaVKPX3skORR8vkvebU+R6xmJfb/vQkDxguYmQjy
	ooWIxSrSXOWgrTQsQSnSH8xsuNu9hFytU9enoqFYqBIe5DbNODHACUTbxgGCYD+JsMeKIy4eA6
	k/5Kfh84EPk4WfgFSkdXjOf+OkCHZJ/80U/a+Ke2lW0oT2ODaSYtQOG1ltNBLA3AQquOKSkivD
	2TA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:57 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:22 -0800
Message-Id: <20210119050631.57073-29-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 28/37] target: use bio_init_fields in iblock
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
 drivers/target/target_core_iblock.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 8ed93fd205c7..ec65a9494bee 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -324,10 +324,7 @@ iblock_get_bio(struct se_cmd *cmd, sector_t lba, u32 sg_num, int op,
 		return NULL;
 	}
 
-	bio_set_dev(bio, ib_dev->ibd_bd);
-	bio->bi_private = cmd;
-	bio->bi_end_io = &iblock_bio_done;
-	bio->bi_iter.bi_sector = lba;
+	bio_init_fields(bio, ib_dev->ibd_bd, lba, cmd, &iblock_bio_done, 0, 0);
 	bio_set_op_attrs(bio, op, op_flags);
 
 	return bio;
@@ -380,11 +377,9 @@ iblock_execute_sync_cache(struct se_cmd *cmd)
 		target_complete_cmd(cmd, SAM_STAT_GOOD);
 
 	bio = bio_alloc(GFP_KERNEL, 0);
-	bio->bi_end_io = iblock_end_io_flush;
-	bio_set_dev(bio, ib_dev->ibd_bd);
+	bio_init_fields(bio, ib_dev->ibd_bd, 0, immed ? NULL : cmd,
+			iblock_end_io_flush, 0, 0);
 	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
-	if (!immed)
-		bio->bi_private = cmd;
 	submit_bio(bio);
 	return 0;
 }
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
