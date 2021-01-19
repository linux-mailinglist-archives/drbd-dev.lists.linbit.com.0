Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79C2FB332
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 829A24207CF;
	Tue, 19 Jan 2021 08:37:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E98C4205A5
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033286; x=1642569286;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=BdkhQGouvUAsTue8hQMttohkdblbLZM4YtE7j1r1v9I=;
	b=DI+feJUBAQS6vE4rpvR9r1FUtOKBfyrfEbh7uBIGSPMlvUesKMXcSzEf
	sGIxvbu02NaT71WVFIjEKT15gdMhwvfc/DWSx2YRgdCm1RY+48mv5xXI9
	iQDRg/0LKdWEgGYc7IJkbv1U+h3utnTcbIZYZVemi138EBLfWMP0Cn4up
	qy6pbguxsrMuDzhHb0tXgSyBFzHsLlZtvGjPGUmTtZ7LSGZHqnutRiSGU
	PNkUBlJycOxhvPw51UAx6tyQ5nTnj7Y2Yi1mgMaq7gb0rCF9l8yRk5nKu
	RV+EQnMaig5TkPMS1IZ3lwq8rQAi0ZH31rMN8xuM9CZBdsST4M+rg/1SJ A==;
IronPort-SDR: ND0V0OSfbtRPg24YVEdxdBy+v9YEtaQ0+7IvYEXnttCT8yU1ax4X/ZokNkdlnPDcPsWO4YKJ9U
	xnLfm5Nf7KgNlp6DD4aC8jxs/XTQT/uXtT/g5QSPr36/mRW7yrnj55vrlntn3e2FDGncicfGDR
	oA0JCTyKgTISWabtSB9cBGnL5+AyUp9UGnF7tuTSzM3w4XHpmdaMcaexxIe7/XOxlyzDR70CDY
	OR++w2PxpgN4I4qiR0rjRd1jAb7FuCJTfL7vRm29MdzTRFURUTALamQemHISlNpD1hvykbZZhd
	3Rc=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162200956"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:26 +0800
IronPort-SDR: zrhofEXlrGEnEEH1eif72gcyi7uyz2QUajDS4NSxQc/emKnvtaDcPTKl164HqqUoToL+VO4/DN
	tTJC2ZpAEE/U2WdMCYATn+dJL2GuFC+AFJeNaBGRCA3StXO9TNFiN2NNb1krZDL0r5z+0vCTmL
	uNP6qkWfiG4eEYa3paAkD9WYdzwq4Xv6/wglbMmFS4vl8K3OieBBFqiU2WcG3kYPL5mp3H+Kxu
	UKGF7gRljz2bWUWQGytVKd4khqliUq18EBcDwF4whu+wuQZtDNEi8me8WFtoYqCVTIi05GxLzZ
	iRqQEOkhXumrW5e70DS5Dax5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:01 -0800
IronPort-SDR: RfcxC1FWYGpS0fNCrOs8BtNtAvGS3Soo9XuKQebXkTCgbWAqTp1EKLrasZ0evXuMWoITBnHtNY
	2oxDBYpgHVdIOlbC//vNMX0StFZhGCaZIsKA9cFY7fNqh1OY5fcl3ycEabv+HgHkEc/CXDDC1y
	fzmKDnwNyp8ppyfiLjfpBXI3+rhzN33czQz3Cn2qnuTvExV9IqScOwNt057FA/Z+bR+5w8O/JO
	uiXUS8DdnaYj0tdtbLaCu8GXso9K+bCVoTPbDi0BV1XABhEY6VgIhePNhopNBAIoFyoLyU4M28
	AtU=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:26 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:01 -0800
Message-Id: <20210119050631.57073-8-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 07/37] gfs2: use bio_init_fields in meta_io
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
 fs/gfs2/meta_io.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 2db573e31f78..822489b10aec 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -217,8 +217,8 @@ static void gfs2_submit_bhs(int op, int op_flags, struct buffer_head *bhs[],
 		struct bio *bio;
 
 		bio = bio_alloc(GFP_NOIO, num);
-		bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
-		bio_set_dev(bio, bh->b_bdev);
+		bio_init_fields(bio, bh->b_bdev, bh->b_blocknr * (bh->b_size >> 9), NULL,
+				gfs2_meta_read_endio, 0, 0);
 		while (num > 0) {
 			bh = *bhs;
 			if (!bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh))) {
@@ -228,7 +228,6 @@ static void gfs2_submit_bhs(int op, int op_flags, struct buffer_head *bhs[],
 			bhs++;
 			num--;
 		}
-		bio->bi_end_io = gfs2_meta_read_endio;
 		bio_set_op_attrs(bio, op, op_flags);
 		submit_bio(bio);
 	}
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
