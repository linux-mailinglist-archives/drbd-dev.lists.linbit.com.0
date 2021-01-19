Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF052FB33D
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B282420816;
	Tue, 19 Jan 2021 08:37:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 423CD42060D
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033313; x=1642569313;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=D5cmtnOCFRgYuXCr3qAROSsFWDMPsd6wC55oJ+RtqCY=;
	b=S1ZhKYq/2sKC7KnHDuqjLaJTfWRhYpz5uevSnbBFcQX72G3ArAidX9DW
	8B07Df5zJn6KDzhioxdHeFLzUWI6sZE5JaZaSVQou/aHOlku0mByehfFd
	b0ztULwI8ps4O0w3iId/68uvj5In6KnmVf1Nk4smdRrAUCVr6xtp/Zg9M
	Hjd3FWp9NGtAtw4liFQfLMZb68QQuhPM69FCZ9BbDB6JG/ZVxek9Mu2IY
	itXbboRKUDBjEXUWpIhvDt2CpyhS9QnxPenkM8Xk9Rd7XnR6XrcNwMzit
	pDqQPL3/H41c1TOnyvfaa20UlNoVqzaasJFqBYhcK0MMBsMZ+DJxT7gY1 Q==;
IronPort-SDR: 2ESdT2Q3lBzcrdz/KWSzQ5uQTZ9WiLUAYflT0tWJo7tP6YiVOPGnPN+0WWzNkSu088OMnGqaR7
	B5PSDMmHzV69akveBNizkBbNcmSuEd9m87xXFgHYQ7Ssa/I2jGwnL/N0NGef4vxSD/kkeoMqTQ
	FtEUgSeeArw2LekIoLW26HwB8kud/yPbSMjNRO8hK0nvug7GzztuwZEaLLYxVQ2WcstEftEdwi
	qiYpdEZYVYHLWrvUnwb8F/Kg1JGq8QzEPOj28W+p0lf1oG+THlOGiBk5FtUwimROpfVwdeToPM
	uW8=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157763778"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:04 +0800
IronPort-SDR: l77kQMhaVmAaGhXCw4DQn23JC+ETBtmuEkdIzizP7W4QbEE/FFPGpSr2oKQblxtZsFLQ54Q3AS
	IRkeTGcncpBQjAbtyj6+EDIE5J+jWTnlUZZk6QOdjxaIbKYpObVl+qjBvrDHsIYLnfkI7N2lPK
	s88Eq9xbLArFSGY08JpRHfLc3a/zZc6qAXL1uXsxDRvKoJrvU4rHsXmjr0BcCq3Jl//x9tem9v
	bNlc8dbLzlykb48fZ2xrvkZ6BBCHN02dcMhGktVSidBfWGyfDa2mqlt5FKqFub5HtnJVb1GKVU
	veGkXS9D5OgZDlrgxWyoNfye
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:42 -0800
IronPort-SDR: pxAqff3CzY6SNypEdU8pcyRF7Ycp2XDG/dFXp67ii/ClPi77Zq14dTS0/Abfh56tMQEJCZUgEv
	hp/pu5jYnyf4G6Ftz6560hm1xTauIc3+qd7iUoR92HKspQ4jIbCxp/rRkQaHksEACl6G/0Nxwk
	QZZl1HrIzXwoiE65870EG7Al72AiwGtlVjZjJc6GYoY+JOC16HDs1pPQioV4bpbAPsiE8/On0q
	zAsBgNZtal+/XzWJ5D9TE5/A5r3kkpStmQ4w13z8jL1gTn8oG9nSDXfj42gpMTqu+V2gtyTMTx
	oyE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:04 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:05:58 -0800
Message-Id: <20210119050631.57073-5-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 04/37] btrfs: use bio_init_fields in volumes
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
 fs/btrfs/volumes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index ee086fc56c30..836167212252 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -6371,14 +6371,12 @@ static void submit_stripe_bio(struct btrfs_bio *bbio, struct bio *bio,
 
 	bio->bi_private = bbio;
 	btrfs_io_bio(bio)->device = dev;
-	bio->bi_end_io = btrfs_end_bio;
-	bio->bi_iter.bi_sector = physical >> 9;
+	bio_init_fields(bio, dev->bdev, physical >> 9, bbio, btrfs_end_bio, 0, 0);
 	btrfs_debug_in_rcu(fs_info,
 	"btrfs_map_bio: rw %d 0x%x, sector=%llu, dev=%lu (%s id %llu), size=%u",
 		bio_op(bio), bio->bi_opf, bio->bi_iter.bi_sector,
 		(unsigned long)dev->bdev->bd_dev, rcu_str_deref(dev->name),
 		dev->devid, bio->bi_iter.bi_size);
-	bio_set_dev(bio, dev->bdev);
 
 	btrfs_bio_counter_inc_noblocked(fs_info);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
