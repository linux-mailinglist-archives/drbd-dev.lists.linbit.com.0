Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9822FB33C
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4E391420812;
	Tue, 19 Jan 2021 08:37:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A790742060C
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033312; x=1642569312;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ZpEdbwVtPI0wVPLoSXxNauBL5CtIsv1pRUC3n0RI/T8=;
	b=bnwpWM/gRZWHtwBAdInhJ/XMq33eWqoVXFSNFxMbHbBKNEQ2uE1FU1kD
	b4FDiyv7zZCHiMfuwYiwxD2RZUAeII+7nr90Mqk31YVafkrvxAUhjQ9dM
	vXA+toh8tc98qgSQkjmcQmXRg6zx7HHHqWNBbtPPeuLSDHSI7qnJxTUD6
	fXkfDZKayNYPaU5rWw/M32E74uxWPtBGPztu0GlV+IOtEvc3zoZIyQXRP
	fPrbG9TsAjwL1/PxYIj/6Oun/JhOrPhic5uJ/lbCfOUEPJX3ZDiZSzVtT
	Z9UC8sy8ehYeIK/IdNeXu+M1AO/4UOtKo5dGrgCimu316nfJ2y2DdF/Ze g==;
IronPort-SDR: xyP2oUhN9mGmY85af2yIu4/MEdhIHd8LpShMo3ZycjUuLZO2kwjNewe3vSYTs2eJ0sLJB4UZzU
	NPqBlCNEGsTEmvSQKN6dEdKJi4G89KpNVg0cFziWiTRUpKKsV4clXP+RaDnSBro5rACDLWUtIX
	6eG7TADBFkwFQqgaANHNqjL2zyqlEJzJPE1jjPQ3GPVKaSO1+gobT4aN7DXYJ5rDCcu2Hi0MzZ
	bODS3DWKtpMmsavYhZdlhfm8rUMdr6cKG3n2TaUxgiaWBhrXMxK7roRKMTxPA96UZpEtT1izRc
	0e8=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157763753"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:06:49 +0800
IronPort-SDR: V7kMM93jgzjLqj1GUy1EJPVGcmRyPgGe7q+23GDe9vJMSE/Z695aQJ0FpD5D67RvqLCggnse4m
	9QwyYtIk4nrG7l1FRlD/f4gNpn6hCQ6oh+5joUneUyoY5YbaEmy8XfvTEKc9qUUrDTQIl+Wg2c
	xhHrkwnbEAC/CN+hUfDujeZfpNap1vSlzq3WtrhBYxNqxMgECsfJCythQLVX6dmnwMH1KUKFDi
	A3sUfjOHxvDu841VmZqar63akIAj0OhE1oGHwRH0ahxYacuQyEbIkisj4iPiWkfiKoxLTNPY8x
	HFHGkrf4QDH7/tx5A/W6/v/i
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:27 -0800
IronPort-SDR: XoCPpBnEyAS0C26NACpPNr6hc2mgCkBhR/slXc8vz6d3NBxAPkngsmR+924mOBWvaQi6WZHAP1
	e4hIrlRuqs07ngks51wLmgnhqz6gvPVZzt6c/xtYGHpktVNv4G+tlyQwdXjSld+DKB31WM3e0X
	o4xJZXi1ZVzEGxYUOHxoYuaGW27b5AhyEnbnJEWPqSGnvSmb4YAK4r55aDWz+qouFqxTNJ1Ve4
	MmaSi236cQpo5ubtxkwfTjN+hUw7qXvWgQEEinw8kPT9rlOQYeg6qJM9v7qJDF5MBv1NXcWrD2
	OOA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:06:49 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:05:56 -0800
Message-Id: <20210119050631.57073-3-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 02/37] fs: use bio_init_fields in block_dev
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
 fs/block_dev.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 3e5b02f6606c..44b992976ee5 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -239,12 +239,9 @@ __blkdev_direct_IO_simple(struct kiocb *iocb, struct iov_iter *iter,
 	}
 
 	bio_init(&bio, vecs, nr_pages);
-	bio_set_dev(&bio, bdev);
-	bio.bi_iter.bi_sector = pos >> 9;
-	bio.bi_write_hint = iocb->ki_hint;
-	bio.bi_private = current;
-	bio.bi_end_io = blkdev_bio_end_io_simple;
-	bio.bi_ioprio = iocb->ki_ioprio;
+	bio_init_fields(&bio, bdev, pos >> 9, current, blkdev_bio_end_io_simple,
+			iocb->ki_ioprio, iocb->ki_hint);
+
 
 	ret = bio_iov_iter_get_pages(&bio, iter);
 	if (unlikely(ret))
@@ -390,12 +387,8 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		blk_start_plug(&plug);
 
 	for (;;) {
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector = pos >> 9;
-		bio->bi_write_hint = iocb->ki_hint;
-		bio->bi_private = dio;
-		bio->bi_end_io = blkdev_bio_end_io;
-		bio->bi_ioprio = iocb->ki_ioprio;
+		bio_init_fields(bio, bdev, pos >> 9, dio, blkdev_bio_end_io,
+				iocb->ki_ioprio, iocb->ki_hint);
 
 		ret = bio_iov_iter_get_pages(bio, iter);
 		if (unlikely(ret)) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
