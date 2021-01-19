Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AD2FB345
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:29 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 47AB742084A;
	Tue, 19 Jan 2021 08:38:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B1B54203D1
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033412; x=1642569412;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xUOVrFleGb+eYEs5Yq2ctnwrCXH8hkiRL46tj+d0DVI=;
	b=npsesBeogzUcJ1FoXSfdCO4Mm9nYwmNJ/auyWxiREHUrF28hBo+EDpI5
	N4SGUdvrY/DQ/L37gBB3ChScharKzLlQ7g/vRjZj0UArzcPoNa6JIpdq/
	vL2VKm3PYNVsoBBLZFFgASbjgkgaQMxPqF9Rq0xz8khQQA3FFt+AvvRl1
	lmcKTwFbdTQhcVz+ijECO2S7i5Eawv2M2+/F3F/+XW90PEHQ4XlEouM3B
	uRmOCfaNBd0tsF/ShHZQ8UA0lkroUoVFbYSX/5ELCQy9Nmeozhv0vmKQK
	lRtmNSTrIEoXYTOHOxKPH2IhA4VInQqEjgVzYmhyjzOmbmYjn7de2YEDf A==;
IronPort-SDR: 7S+UKAg2JIhlw/AxOAfWoPI6g6bfz9KWM50n+ByODvVpSVX3phGCiVhqz7F8FeYCXaXj3k7/j7
	WaOmsIt/ooV6ITycRMwnzO81mgMjOzweYQK4AwF0RNVd1vsbUF4uu74iotSraVr/ReLVGaeO27
	0GE3OQ3Nxssm4yb6zS6jDczwpmERkUHGx6XKRt2wdc+zlphqQHK5n0+ahpKb+q5GqURQguhBmf
	rQejBfRLlJE81fGZ4X9cDszQw/gHqZDrz2au3fhiFGVIZi7Hy9mliAXOl0BPukhjJHT/0iFkdb
	V0c=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162200982"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:40 +0800
IronPort-SDR: YEBKG69v6ov1wGmGSgRvYCO14V91IpnefEP/jaMf/qoWsv+tK5vU4aB5xVFvRK6f6tjL3iQM2U
	8XcgG1Bvsyq94Lv3Jf6CvbEMe6kYcZyBleYQYR4yOWjJ/F6AHFr9rEDuNRqE/DalpMb8ex8WYN
	dhjbCYVk5SbRFsJRm7/yZpbljh/Br10puBi1CkqiOOsXGV1A1FRnPsgwIMY3J5DjFG+zl6paBk
	QuYZKTdHz5EcQFqcLISCE1kZ5qYhPqBOTYJOQFcAtRKNdLntu2JNNYiODgHLVl/fNHYklYKYsl
	wA6kQ9DJM75aAW6uHhffo8zs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:17 -0800
IronPort-SDR: TM9dpxhc1bBjOypQU+TCA1+JHS3X6tbyUfX7CLJp8sH85tB99xJFscHBDCLFq2/sTR23LiC3TM
	J8KKwbkNN7jjvKISe7zzGqpFWELclGi38nUt/LvFQapcIN9YFp8DZRQ2izF3uYGZWxHnRIgtO2
	WhlQFVHRjq0w2Sygnwa63xoEK9fTLJNmudOASmzr+o1zZ38TO1TOJzzBzvspEDTXWPVaZigUus
	O1/x342A0NXQzCNMPt4Ly8HseHr0drZDIxn0r08WsOUedcj3h8TiQqY/1oiIV4nQx5hppaJXgU
	55M=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:40 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:03 -0800
Message-Id: <20210119050631.57073-10-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 09/37] iomap: use bio_init_fields in
	buffered-io
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
 fs/iomap/buffered-io.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 16a1e82e3aeb..d256799569cf 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1222,10 +1222,9 @@ iomap_alloc_ioend(struct inode *inode, struct iomap_writepage_ctx *wpc,
 	struct bio *bio;
 
 	bio = bio_alloc_bioset(GFP_NOFS, BIO_MAX_PAGES, &iomap_ioend_bioset);
-	bio_set_dev(bio, wpc->iomap.bdev);
-	bio->bi_iter.bi_sector = sector;
+	bio_init_fields(bio, wpc->iomap.bdev, sector, NULL, NULL, 0,
+			inode->i_write_hint);
 	bio->bi_opf = REQ_OP_WRITE | wbc_to_write_flags(wbc);
-	bio->bi_write_hint = inode->i_write_hint;
 	wbc_init_bio(wbc, bio);
 
 	ioend = container_of(bio, struct iomap_ioend, io_inline_bio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
