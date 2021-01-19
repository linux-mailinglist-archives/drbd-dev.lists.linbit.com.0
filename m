Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015A2FB326
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8170742061F;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB91D420356
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033169; x=1642569169;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=7vt16PAj1e5r0qMNupRL0U4T3eLDEFSlTSo46YPqSAM=;
	b=pJWUz+zJ/6UWkgUT0oyOdz8aMxf/z0DF/q8CbNQfbrVr2pA8JQP9AuNC
	WGSkZ7hZ7q3zjaw6AwTV4Q2NGelL5sdkR8+lSk2wcFtCgX4J2VDdAwHP5
	GqpTAbcjgXWVPdiiVf39zL6IeM6A37IXpaH7u6CkNIQlL2mbAHT0sMLzT
	rPgk+G2Z6y6AnTu8SOKyNxdoY+lTcYcnOd+1UjniQotGUnxbc3KqU7D++
	WF3BKdNGkJElgMni1MWbeeT+sRBaE1yxE4A+SL15ASnjMPG2KBa36O5Nx
	sdK/iKg/qrnTHQjbBmCyjQuDqDQ1Q0FVC+2+Un4QljuVcQuSYaVk0k+Am Q==;
IronPort-SDR: 7iP+/oos/IYZHHzc3yC5cmhQQ7TqHOEKffkhQPt2S8ZQBHbm0Bzq/G+NrqyPMbHwX8QaDuyGig
	ld1r+I7XLAChn7dNynL2067whI57b9g64qxE1Z4wJBstmwiGRQHDO4IRYGWD7iAo0YR8F/3ebW
	ZaadQkiFVYIhOu1AtMObAOqf9A9hgs4DNvnrvwMxJmN8XS7HE4GgXixGwh8lJ9d6S58ybQyoGS
	FNu++yWdW3qZycNl/NM04VYPKZEvY7d6B7dLBXtWbDCjySqjVbl9Ov3vRi9lT8UrMP8w5GnTiq
	04o=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201319"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:58 +0800
IronPort-SDR: a1d/lKL/Hds0XfzVCXCVoFNJuMkLG7FRg43c9nxUGNnoVjV9jsVZX3mTOPSUtgFf/WkSSxTCKh
	BESuW1cWeb3ZFGIQdsUxPlyvEE+YTxSx4RFDmWqLHHNGWt5KU7FXndnyOkm8KHTfWOremZlJBP
	qux7f5LgnuPJKX/9TL3z6XSqAyv0dig1aBBGnow+IU51xjKYqAfS4Eir8hhj/cPELYxdz1TaOZ
	E3KQc6QVmGM8JKhgd2yosSeT7ChH77nw4B8PIpGpSXPdjMxLhlKIF5Lx1vQQtDkUX5HoDb6A9v
	astzmvKVj36WUBr19xYENhyx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:34 -0800
IronPort-SDR: YVg4oetj669oXGPyen5Yz7/4lwwknpBuwOHqtYisxWomXA6swBTRl0Q6a9GaHjktx9T2m6JStb
	CDvwa7TZCZ4M9GVWSo4RbtmgfurnOujjvD4svcphbEiZT+7y+gglJ9ZlIF/tnwxqJkfJFxncIx
	g5wm4nu8oJyzJ24M9klTWymj61zMdpHfpxs6XcMjZOa3vIqm+lJQ5C0tB3xkI9dYlB+E3Ul943
	D49b5EPSkdl17MTuiUi4ULzuOqSv9X94gCd9MvAo2Xb2yDb8OLgPVo7IBgCR+uA44u4+72LP4B
	OSs=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:58 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:30 -0800
Message-Id: <20210119050631.57073-37-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 36/37] xfs: use bio_init_fields in xfs_buf
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
 fs/xfs/xfs_buf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index f8400bbd6473..1c157cfc5f8f 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1508,10 +1508,8 @@ xfs_buf_ioapply_map(
 	nr_pages = min(total_nr_pages, BIO_MAX_PAGES);
 
 	bio = bio_alloc(GFP_NOIO, nr_pages);
-	bio_set_dev(bio, bp->b_target->bt_bdev);
-	bio->bi_iter.bi_sector = sector;
-	bio->bi_end_io = xfs_buf_bio_end_io;
-	bio->bi_private = bp;
+	bio_init_fields(bio, bp->b_target->bt_bdev, sector, bp,
+			xfs_buf_bio_end_io, 0, 0);
 	bio->bi_opf = op;
 
 	for (; size && nr_pages; nr_pages--, page_index++) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
