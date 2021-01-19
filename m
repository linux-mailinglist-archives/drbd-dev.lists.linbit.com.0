Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC212FB337
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48AA84207EF;
	Tue, 19 Jan 2021 08:37:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8ECC34205F5
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033305; x=1642569305;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=jmrSa8deAEe1LJieS4GwadhMznrvItaU1cHEcGf0nvk=;
	b=RiFctqWFZx3L6ZC3gP4ZKj6TzTMtuO9c4uDq68gNzdpMq1CS9kz4bgE2
	jQa5pl9NW3opcNWJx2jWMBiempzJvd9Fh5gTRNAEtlRMsNlYgrGsvw04N
	2EPkbwYHWgi5lMJnQw7HseqdqNiplwnZu+0+OKyNpjCig6HpGncJCP5yx
	D75bMcbxJDrcUEO6b0KXGECvWvCwUjaIxas9wwSTRa0OQSkLpHkm27r4r
	V42LzeL8CEpy25gxiXVQ1X1GO9TClwWOnj6wrA51K1D0JOAnDhVaA04C/
	6c8Blvh4SctFCptGuPvXAAZj4t+Gmgr3lX7pudKP9vqlO3r9oaIXcmxOs g==;
IronPort-SDR: 5Fm2GhqEPtjLZYJpA99pzW0UufUfi/uara/+s+1+OzveMz9+iU1V4HNG27QBS6A3PUMGwXJNj3
	87cPAhszGBBUfBv7HBT2uzNzAHX7T/2wDnckSFJ3YbVdc/IiNEeyi4fvGvd2nK15Zl8JTObXJo
	shssn9mF1WBrQ4vvluCJOQwFfgefzt7kB2BxB+6P6vfdFB6ixTch4wPoVr+6faUQZ5Vvrqh/Hq
	WUqieWQhKYWOV0W9dgdSw/p9yLMN6M7kE9dzvPm8fEyZB0I1b6xTVQQBQAVOS1feWpZwAye1Xh
	6e4=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758486"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:06:57 +0800
IronPort-SDR: vZ7ysJA0jc7SA+87G9SiVgJvMabqplfedvg13dXGSq83RI2B7qaANjxf3n8JIEbM8jL9RVCrKJ
	Y2ZQcRtgRI3EdK+P4ylKOqiofYlCI33wh8PwC97SCXYm6fjXNWkSfdEWJh6qIy5iLcD4gLMtj2
	awWxWcFZ+5M2uQ7NF4mOSz3T2BWfQLbhKWsnECSfTjExksE96F/LTLVasJBrecsHmKaOd3PH2V
	sWFheP5gAFA6YM2ozohjlMlTwz87xtFFPh9c+QFrNZ4gDCRGzDufS1aCuf6H0kWl90qbURtwHM
	TDY43lido5UQ9EFCGItHMsxV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:35 -0800
IronPort-SDR: 2QvgFwKv1l58qACx1LkMFx25aQa2SIK+nja25KW+g1fGCIsFCI2aDBEoSVRt5vd+mstvmW96a+
	737tI66XYa3YGuNZc7mhzaBx90mzE+7INtx21d/7HVJL8Fs4lXsY46xoeP6qPWvnDZ3ihPj4yc
	0PHxNbwk5lPXU8GKWjmU1O8sK8W4HyOAc9WnAAEnbKb4wGAIm+2gNrXPeVygtgzGsA4DXXJ+Yd
	mrqI036gzbWwtshapKuKgeKERGx47y7vTXELUquL2fc2urlWZF3SUiFLdWMNhtGfvEB6B//WSB
	xEk=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:06:57 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:05:57 -0800
Message-Id: <20210119050631.57073-4-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 03/37] btrfs: use bio_init_fields in disk-io
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
 fs/btrfs/disk-io.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 765deefda92b..9a65432fc5e9 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3637,10 +3637,8 @@ static int write_dev_supers(struct btrfs_device *device,
 		 * checking.
 		 */
 		bio = bio_alloc(GFP_NOFS, 1);
-		bio_set_dev(bio, device->bdev);
-		bio->bi_iter.bi_sector = bytenr >> SECTOR_SHIFT;
-		bio->bi_private = device;
-		bio->bi_end_io = btrfs_end_super_write;
+		bio_init_fields(bio, device->bdev, bytenr >> SECTOR_SHIFT,
+				device, btrfs_end_super_write, 0, 0);
 		__bio_add_page(bio, page, BTRFS_SUPER_INFO_SIZE,
 			       offset_in_page(bytenr));
 
@@ -3748,11 +3746,10 @@ static void write_dev_flush(struct btrfs_device *device)
 		return;
 
 	bio_reset(bio);
-	bio->bi_end_io = btrfs_end_empty_barrier;
-	bio_set_dev(bio, device->bdev);
 	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
 	init_completion(&device->flush_wait);
-	bio->bi_private = &device->flush_wait;
+	bio_init_fields(bio, device->bdev, 0, &device->flush_wait,
+			btrfs_end_empty_barrier, 0, 0);
 
 	btrfsic_submit_bio(bio);
 	set_bit(BTRFS_DEV_STATE_FLUSH_SENT, &device->dev_state);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
