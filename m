Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 333A12FB32F
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E947242079D;
	Tue, 19 Jan 2021 08:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 721C2420356
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611034116; x=1642570116;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=sO8d5HxadQ7ae8msAnPJWRe2/j+HLSlO2d0uhqsgZy0=;
	b=XOa2RvBUQsv1psgd6Bu2lxdGb9RKhFCUgHTZwpAANYgkEBPXDkjnl1a3
	XSU9Wx+4PBx4jXYlQuCCKcghNlNZk7oOb/VdXtz0F2tICrpBH4UfJHMVp
	m+Ox3bhaoKN8PdK/CqI4eU38kCUdxCplTWDdUx9tFTfY6jAr9YqRm9hvV
	eZ6PWbMDP2WBlsvxVrYvFUUJlmW6t9ie1CN3LVxsvOvn1rOEI1ddR+4iz
	ZYFSxvm1oCUtxNLccwUM09G/jWpR7NA6lo6suCaj0u4LbtlLKMLCn5o6N
	B29ux6b6MuGwkOIliNTaWtu67IV5uJozyW9c1aSN157M2IKS/lPWMOdNv A==;
IronPort-SDR: 3NfsDvnoYcNpT+qvGrk4HJjTFeQyqTpc/FRESs/6zUQsm+tF8J1NojKzzqYKn4BFZwVax1/2R0
	GhKE8zGmvr5sxWSSpNNdicPPy3lnl1f7LRIFJeQyANlHXGu01FWeJ+0oX3KJHoYl7rqlIKbrpV
	JT+jEgqj17yVydecIK+5sgFn2WrEUYmjs2FbSddN6XCZV0UegTMOnetpyPZgTerM9INaF9ruR+
	aUCd2o43mSt2ALTAFxQZfRgqC80RO23iZFuq3fDB4QnBfW8IaTOj0GsWYpxCC/Z/GgBWcE6Id6
	W+c=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722369"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:20:31 +0800
IronPort-SDR: 7s5RI/1M2875rMqLNGo1AwI9DVWaD9OET7KcOdx+mq8FKPeibMq05y1Y/z6pcKcGnIEJchYq3n
	7QtrCNiUCPkyBOAv1hkygi3+zmcCWOQ0ECMpRMxV0X7+f0h6NDr8y17rrD97sNeno9tdAlnEg6
	rV3zS6EuEfSA3uEc1lPaw8xu0FAAWyEq3X7uA7RidcbXbG3PqHjHVpqX20Yr2kg+hABPGK9CyE
	BRrSvuLqk5PpoXhk7B2DHjAvkbUwJ8YvjtBpShSJnpjmRHeRcq67lQBBF4nzbjLwYIccqSAGHZ
	VT9KdojVwKyl0N0T9kUrcO0S
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:00 -0800
IronPort-SDR: WDMfO4KSjZ85dQnSqJHGqhPnau1IPWBJa7ouAx7fSY8Jjs07UadggeWCP1wGZdoVsyHikSCSBo
	NjR3hTBoDZYf083INEVXN/g/gzRcE8c69hDQ3bHF1CnrxKItq/1x7A8KFxUF9hsEZwznMnu465
	WdZoTY5ZKFKbPPmsD6E9kgpTCXMTN98PIQwHFSUfz5GsmitLQ4YX+7Kt3he3pE680JbUdUcIwc
	w3TKORGekwZavC6DFj/L4eyCUg1ECleXwXNyg9AYomurOycfkdloWjts9kBTsEWz8yA/ZIB3I9
	J7c=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:22 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:17 -0800
Message-Id: <20210119050631.57073-24-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 23/37] dm-zoned: use bio_init_fields metadata
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
 drivers/md/dm-zoned-metadata.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b298fefb022e..f114d595ce23 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -577,10 +577,8 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	spin_unlock(&zmd->mblk_lock);
 
 	/* Submit read BIO */
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
-	bio->bi_private = mblk;
-	bio->bi_end_io = dmz_mblock_bio_end_io;
+	bio_init_fields(bio, dev->bdev, dmz_blk2sect(block), mblk,
+			dmz_mblock_bio_end_io, 0, 0);
 	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
@@ -733,10 +731,8 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
-	bio->bi_private = mblk;
-	bio->bi_end_io = dmz_mblock_bio_end_io;
+	bio_init_fields(bio, dev->bdev, dmz_blk2sect(block), mblk,
+			dmz_mblock_bio_end_io, 0, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
@@ -763,8 +759,7 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
 	if (!bio)
 		return -ENOMEM;
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
+	bio_init_fields(bio, dev->bdev, dmz_blk2sect(block), NULL, NULL, 0, 0);
 	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
 	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
 	ret = submit_bio_wait(bio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
