Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 157F1306F66
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:31:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E71C142063D;
	Thu, 28 Jan 2021 08:31:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92E1542063D
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818410; x=1643354410;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=OzcT2XWni+wbNY2uowp8HTdSyU1JsS57dIOzGLP71ak=;
	b=ZEk+zSEw7cdUO2j303nJswykhCe2VKjGrPv9fOfjbWda4RTEP7ixDo/F
	j25wKfBTvQ1e0rF2ritXi3IzRC/uXzha11hl4aS8EFWPrMk+8VMa/6zZg
	PuEeLVZsH+kiEooFfXTpTM4LiMnkLkSFR5oENmihesUnMYQkWRa7brsmr
	RO4kaKa6pYDKOtJ/Bus5AcAaPCcPmqHmnZHVCGhkfOFafk7aMDL1EGSds
	MZBLtSqmom1Sgjr0TO6m2qoBxJ1BjW5oeAGKDBLfa40S/zZ90Q3sZljYS
	RPP4z7oA8EGI6OwHsxFJFfn3JMcpAD1fQGfV0PCQVsWg/szo8EEqlwcjm w==;
IronPort-SDR: QM1dGS7kU/EOy0qI3WodRUWWBTzOnFUkxMnWP3dzAlDwfD/OL/DgSJYXYWhHiaiqtPfez9j78r
	MNfrF/fB0I9cRB3oYylVMx3qb8EAqRG+NzV3sBHXO1O1zenBCGpuXPc7kXkRCy1eBic4655Iuk
	rFUATn11Hg8N3MKvGc7uaeYAGAc4a2LgCvpKJh/iqYw6bQ5T2bbzxQrFX4iNxrtjjGO/bYzhWm
	lEBowtTQqscbBBC7QbSgh89T8FvKJwXzvC2N6I/oetdqepuwLgq+XMRG3GhfA62cfoFzXqxfY0
	kTs=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159693804"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:02 +0800
IronPort-SDR: F0TO/FNyFOQP2VzLB9RIMJnnRQYYk86s1hRnocZVkVk9artoPE7tpArDn7RZlHIsdY7pLub10f
	eNcv6/K0ft6xVggqFErB9mbNZYswgMIjH9mqBC+ZTD7egIZnNHGdolHyLWl/0i/quOv/MhUCuk
	uW+2zbSa2baqmDOBcrH66T0RSaGMXNEGbimcfN5vqDCgKMO77YCtdrNPvO6CkqwXhAEuR7mez1
	Z2WDF+xoE6moU3VPa6zSN6PGPZPgWh10QTmzQWusYZ5YDeGNJe9aI4Gy0Hn/YRR1midbJIRWGU
	+c6SgEkMW86vLYGtCzMLENjM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:20 -0800
IronPort-SDR: m8MWhLly+Q/ggpFQoQazEvRAK79hMprrsJeibomNIX1/4xtKgak83IDhV3hY33IYYgETWfckla
	12cflgJcZOLhtYF332W1ZeqMwkaZsc7uQahEN2f8ydynExvlY4KkvRqWC31LBbVv2+B3KXuSeg
	s9mXwdZWg1TGYc2w+IbnJALYEzC776WPgdLPtLGdrMUnCNPoz5WeDSYQd/QZ1Y+MzxJurZd/eC
	94O7CZ/ZfohxaTfsL58Np58+H9TOWMfDJbBI8BFZ4728SkC4ncTHu1ybMvyhjmP7gPrroYjKqQ
	UWE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:02 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:08 -0800
Message-Id: <20210128071133.60335-10-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 09/34] dm-zoned: use bio_new in
	dmz_write_mblock
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
 drivers/md/dm-zoned-metadata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index e6252f48a49c..fa0ee732c6e9 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -723,7 +723,8 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	bio = bio_new(dev->bdev, dmz_blk2sect(block), REQ_OP_WRITE,
+		      REQ_META | REQ_PRIO, 1, GFP_NOIO);
 	if (!bio) {
 		set_bit(DMZ_META_ERROR, &mblk->state);
 		return -ENOMEM;
@@ -731,11 +732,8 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
-	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
