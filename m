Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 613702FB32D
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 90D1342064D;
	Tue, 19 Jan 2021 08:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 328 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jan 2021 06:13:42 CET
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C4D59420341
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033223; x=1642569223;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=UJI+K9IAfdXiGgzdG/XtuzZQkA1HDrbS/80BpuWpCHY=;
	b=RlfpaHA99XIvRPcZ3Kum9x3VnnDSfw+s5krBNIt3Y3Fp7t0+arJAqMNB
	JJGrJVRtz9VNEMQGtwxO3C4248Y5TD2AFaSVyhLl7XIJAdbAMilqKlgQ5
	MD8UnCVi+9M7AqqA9gGeSLxwz63F5gCqB3OOZ7JfVTumKiGvGp0rc4DOp
	YGx06j2nbVA/ptpblAWr1PXu8uqPR8TnIdJd+CXhWmSPeLuSPohGsF+zJ
	er1qQselijiXDFlzZwz9h1EL+6Xpmk4SNTckbKB0v09pORWO4Va9uS3h6
	7hHwVlLpf/6fnO2QveC2xwk/QXy2pewaiXUdhqeJVoVBZv48S/qKhyBZE A==;
IronPort-SDR: QtqH+XB5o54OYwyhYCEu4qJvUmr3/JTyd678ENuRINfwL/NAIVDiFx5taxgtfvM+1Nl0s9saAL
	pz7xT07pa51Gu2S7OQ2BaXd0I55xMsti8a/1OQvVuwRaf6B4aCGz5BUFpUg5BSExsb44D2njFY
	o8Az6vKd0WgV5pJTsAtI2M8b1jjOwhnN613tGHrEOT6RcEWrd0Cx1DQFrW0NJybe7qod4PWtUL
	0oonydDwoKMvYbe99qiXr+aQhvs+8CxpA241/NHM7JZHq1I8QVzc7Bg8XglkgupED8vNz4gwfj
	pxA=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="268081056"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:37 +0800
IronPort-SDR: qKqx3c7n4IggBBJyc3aSieAl1hJCEkQ3FVGnYWVHTSa5rD3MXmFj79JuY5wJ7CRRSFraAuQgAm
	zFI26xZvphcE8Vqa6VmNbVIt5SMzGUQE6BqI4+Bw2UaCNOXBbrAVOp8a9GqthZYXOdcTxWVzZP
	A04F0FFBS6Tb+VCYsJFWhXlZpL/gwZhUcuR0cuzZUTyGQlxTUZ+abITOLwTqW/QZ9mv5Qwf8w5
	fRFozildaqHZS2uvDMmk6ztZsDbUYYKrgoQZerJUCtJzxd3Ypw1DFTBjcllkxplrH/oRjV3jxp
	pNnqHDRJEY1iXSZZJk3jmU3Y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:12 -0800
IronPort-SDR: JlGfCHshT1mK+XacVyirUo0rFyjPWt2f31VZ3z2J1Z+1bAsxbYaQqDfkpztEmemcjkFKSqFtBW
	eEHx4MKVO6uhGP44oLoJjur9xUH9E+nf+FFdLDlrYS2WxbXcD7sJerBxjAL9tpVS6iMx+k6Ygk
	O6RIIA/q4UYqrDznEz4/cneeqCBOoZihS6qjthtpQtFPN4aYc3uvtGPOTbAR+UEONOX62l4CZO
	swheoC8AcejSmyN7MaD5wpht27eshQMMdBz4TnpekpmQcRnvSAFWabxuH6D+W4HdmuEhyRgLHS
	mSA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:37 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:11 -0800
Message-Id: <20210119050631.57073-18-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 17/37] pktcdvd: use bio_init_fields
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
 drivers/block/pktcdvd.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index b8bb8ec7538d..47eb4e0bd4c3 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -1028,10 +1028,8 @@ static void pkt_gather_data(struct pktcdvd_device *pd, struct packet_data *pkt)
 
 		bio = pkt->r_bios[f];
 		bio_reset(bio);
-		bio->bi_iter.bi_sector = pkt->sector + f * (CD_FRAMESIZE >> 9);
-		bio_set_dev(bio, pd->bdev);
-		bio->bi_end_io = pkt_end_io_read;
-		bio->bi_private = pkt;
+		bio_init_fields(bio, pd->bdev, pkt->sector + f * (CD_FRAMESIZE >> 9), pkt,
+				pkt_end_io_read, 0, 0);
 
 		p = (f * CD_FRAMESIZE) / PAGE_SIZE;
 		offset = (f * CD_FRAMESIZE) % PAGE_SIZE;
@@ -1208,10 +1206,8 @@ static void pkt_start_write(struct pktcdvd_device *pd, struct packet_data *pkt)
 	int f;
 
 	bio_reset(pkt->w_bio);
-	pkt->w_bio->bi_iter.bi_sector = pkt->sector;
-	bio_set_dev(pkt->w_bio, pd->bdev);
-	pkt->w_bio->bi_end_io = pkt_end_io_packet_write;
-	pkt->w_bio->bi_private = pkt;
+	bio_init_fields(pkt->w_bio, pd->bdev, pkt->sector, pkt,
+			pkt_end_io_packet_write, 0, 0);
 
 	/* XXX: locking? */
 	for (f = 0; f < pkt->frames; f++) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
