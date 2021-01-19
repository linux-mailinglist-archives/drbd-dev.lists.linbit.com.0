Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 334612FB32B
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C86C420639;
	Tue, 19 Jan 2021 08:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A2854203D1
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:13:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033191; x=1642569191;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=nnZ15L+rQ/6NXzNuwsPySOITMggjv2dpPGtghDgn/3I=;
	b=F1iT+K4upx6nSjUHOJo+7Pdrj/SBnwAzFsJnT10RM14hfL6PmiTbBn6D
	jWjt2JwyvSeCzku7sA6ZSOJfXJ1sZtNklcVYWS/nu5/atHlZ12zagp/xM
	U+AT2gl42rC91cfGEjcwpsKA8yiGckPHRLTi8dPMREaXJFNLYWJoO3i3x
	YHFkH7DajUq95hjCLe4mAcCUdz4dNYfNHfjzJkervR4+5QQJnI5vX9/o/
	EvGQck2uX4gbT4InCLujPsvHyDIPMe5/a7nBwGn+8zLCsnzw+9DUV7OSP
	/HIL7fvYCFJMu0WHqk1zRe5aUIndU6yOkAi4GJNH9/YzGLiVTiPoKICvu A==;
IronPort-SDR: ONkBM1lTL90bhbm58bVvU5qAXSlGAltOQyFwC0JQdI9zm/x2fxD0NqxseXJ/I29Ml+oqN0rJ7E
	rk+bDt3jI6JFxvLC5LJk/OA2tsWkyXixJ1YUmdBch7Ap2XA4fHcn9v9+FfMfYfeDr09wnm0RNj
	Ep2H3qk3LVMqWgity7asRut8KlQ0nT5YD1X6hIqPq9yRrhRHZ+Ozxc5wnTUZARE9M1sUg95CoY
	89XJgYUydhxzTGwM5j/w5s3s5HbIk1wR72guX4eOJIhIRpY1LQhyx38sfkVjkn0IOwNHAdpTCw
	ZSY=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201246"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:04 +0800
IronPort-SDR: F/Dy08o2FBvSI1GhnUVKkKNOXWIp8vAkUULdd7BQFKnF7j+u96RsXttsXSAhghfH/5zr6cmN4S
	OCN9IdSXmXJOPIz1/AqQq4gNkGRGOBIkJ88MOFQrbkNKNVbCTmLfPrIsJEm2TC0qTvUlPNM2Cj
	9TJRaExxDHTi4UWCYUC3dqli0WPga4K4JAc3rBHXvYSkmqd+o2TJrYT1k5NO6MtNRZN+weLzPU
	AK9bkuiRyKEkiNccqWKJid6NkSXUIJCLTr9zBGqOTI438UNhTXvzOBTkRDFd18uFVqgj2IPqzw
	FOhs3Ah563zOc83G5EtTukbb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:40 -0800
IronPort-SDR: fQMFfgdtSu8nKcxUqzclyRB9P+rBI21YWfB4xejgzd1WEdOnHm3L4SakDlfU6oc/GiImWBi40s
	xrwXfD+NR0eoiSPOERNl2yA3hT/FAiC6WXYJT29OBzUhR33jyW2a44OEEyaO8RW7lmq0Kfdbp8
	zCQCZgyL3cFPfEB3ClOgIrUgLmRSb/JHMwYFzZiPt3rsP6BzAQG3FZAe7E697plU5PyJKHWhGY
	W00r37LQP39Cea2s9M16j4CR51XnjLw+rlD/Eucyelmc2VgMjnWu4RGUyCYihZR6I9F/PiTOxm
	QL8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:04 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:23 -0800
Message-Id: <20210119050631.57073-30-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 29/37]  btrfs: use bio_init_fields in scrub
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
 fs/btrfs/scrub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 5f4f88a4d2c8..1e533966ccf1 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -1650,10 +1650,8 @@ static int scrub_add_page_to_wr_bio(struct scrub_ctx *sctx,
 			sbio->bio = bio;
 		}
 
-		bio->bi_private = sbio;
-		bio->bi_end_io = scrub_wr_bio_end_io;
-		bio_set_dev(bio, sbio->dev->bdev);
-		bio->bi_iter.bi_sector = sbio->physical >> 9;
+		bio_init_fields(bio, sbio->dev->bdev, sbio->physical >> 9,
+				sbio, scrub_wr_bio_end_io, 0, 0);
 		bio->bi_opf = REQ_OP_WRITE;
 		sbio->status = 0;
 	} else if (sbio->physical + sbio->page_count * PAGE_SIZE !=
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
