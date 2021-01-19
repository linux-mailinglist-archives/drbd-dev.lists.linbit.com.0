Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 874422FB334
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B524D4207D3;
	Tue, 19 Jan 2021 08:37:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 45B43420231
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:14:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033293; x=1642569293;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=B7JA06wyQJSeb+bJeyEVFkKODUviRdB86RqHthiYHdM=;
	b=omYrV9aYN8wM0fr3Sy0fQ4+p2xi7bEiQCwl/WSQOdGgIh5uOa2ovAIKL
	tkMAqsMPiLZK196+NDLo9XzVStn/cXzYyRaIq06qgiwexfN6u8q3NOYUK
	dHBquAGe7YIF8P4vrZDrQP00G7n1SManiztyTOWcqPl1J/ZldcXUg5+TH
	VWVZMEz7e/T4m/F1P5cPQ1D9woEjGW9l/QsX8Jpv+9SnLZ3jrxF7KGVZi
	xOX3o2xgjG2yJLzUI9WnGfltnJb4LgpA1VD3op6Wj89pVRTKI1tyrtMa9
	HYwtO5o/D1f0shkijmJpAldfnCa+dtUZBGdm60oHAwtTouf+a2p2AxrPY g==;
IronPort-SDR: PK/SkHJpLvUgOW4AxeZd0XYO6kJRm1GI5Bz1Li9R8xsRgCP9MEgmzqhL0KTGmhimqs72O0nbtV
	1Vj18/wR9S8s0hGgop+5j5MW38/0gh7MqkB4QSUw9NAO49tkI7Mzaglxsx92xnZ1WlkF39fz86
	ja1OpneKAh1OK5Wem+XzBzvtpHf6SHQd+cK5i5aJjuOB2RbZHQ7TbXGwrfP2uU8BWV+wykse+r
	eTlBbL9/A/xFaKwi2e3tBJ8Rgy28eANsZB+eNa9Drt7PDSHG5PdkDNJ8L9/ZxBUq02XSPs8NMb
	YBg=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758841"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:34 +0800
IronPort-SDR: GTM4NP+C5AUKnsenmHggJlqPihyDD8usSK9LQbrGL6gdWyEOSAp0fCo55YAECaE+hesJ3XKTOl
	bVimAUeV6b+FzjXcsGWOlpeiqTRFtrG+uya4xTFdM7x36qGbypdhwG9J+nkQobx3wR5XRUpa1w
	G7B/hPt/Cy7kcZBCApBXTNWtgh+RslmhNyfPEXbfimm3SEmptDJfxKPvAsNH2cqSTLbrfCpYv8
	2Yiid7DG1aA7cwyw4Pys3LWFHXzRzwg90ufufaBvlwnI9ngfSwBp31HmL0SZ2qD5w80KeGZQjf
	0IB/pYuqG0Rk7icZCHgDGGQe
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:55:11 -0800
IronPort-SDR: To60I5qpFjC/qrOYyP0e+8PtEHWn/E+IX3B/NtCL2AEGlknL6XuDdu2+0YOMCEUl9jN0+NDuzq
	dZBtHVmFs8c2MbBK6nyyqiUGvL7D/ICacqAETpUNh7sNU3jN3gr3oMEn5okCkDfyC/0Irc2Fc4
	74E8Jj0L1yozehCSNmdf8CdFJegKv/E3LC+h6Fa4Hmz/L2OxthixlGPQheihc6U0PL3qEeNS+1
	hIM5iqNNXixY/QFjQ8bMwljmNMnnwya/seW7BmRZG7IJzaltfLW+/RKR36uM7dMhYxQCE98dv2
	Nnw=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:34 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:27 -0800
Message-Id: <20210119050631.57073-34-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 33/37] jfs: use bio_init_fields in metadata
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
 fs/jfs/jfs_metapage.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 176580f54af9..5cea9c137a48 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -417,10 +417,10 @@ static int metapage_writepage(struct page *page, struct writeback_control *wbc)
 		len = min(xlen, (int)JFS_SBI(inode->i_sb)->nbperpage);
 
 		bio = bio_alloc(GFP_NOFS, 1);
-		bio_set_dev(bio, inode->i_sb->s_bdev);
-		bio->bi_iter.bi_sector = pblock << (inode->i_blkbits - 9);
-		bio->bi_end_io = metapage_write_end_io;
-		bio->bi_private = page;
+		bio_init_fields(bio, inode->i_sb->s_bdev,
+				pblock << (inode->i_blkbits - 9),
+				page, metapage_write_end_io, 0, 0);
+
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		/* Don't call bio_add_page yet, we may add to this vec */
@@ -497,11 +497,9 @@ static int metapage_readpage(struct file *fp, struct page *page)
 				submit_bio(bio);
 
 			bio = bio_alloc(GFP_NOFS, 1);
-			bio_set_dev(bio, inode->i_sb->s_bdev);
-			bio->bi_iter.bi_sector =
-				pblock << (inode->i_blkbits - 9);
-			bio->bi_end_io = metapage_read_end_io;
-			bio->bi_private = page;
+			bio_init_fields(bio, inode->i_sb->s_bdev,
+					pblock << (inode->i_blkbits - 9,
+					page, metapage_read_end_io, 0, 0);
 			bio_set_op_attrs(bio, REQ_OP_READ, 0);
 			len = xlen << inode->i_blkbits;
 			offset = block_offset << inode->i_blkbits;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
