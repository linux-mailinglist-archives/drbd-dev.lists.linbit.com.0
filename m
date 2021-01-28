Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F3306EE1
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:22:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E633D4207B1;
	Thu, 28 Jan 2021 08:22:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01B094205E5
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818266; x=1643354266;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=1876bf0CQ4oKwKjrcbLTUHkm2JuWaJTsdB558+rHPRs=;
	b=lBD0f9CUvHjvv/MiIZcAfK4btfJiDrQ8A4a91jzbA6b0hnt2ZiU1NBaP
	qddgZD/whwQCcZsKB1NyGAjDDnrAUkycB0jDyrf3Uj68ev2BZ1xzt35yG
	s2bVzHbLWq0itXYoMyGmZX2zFf8mKD1I6R1ADK4O2/Ow4jDZvnhk2Y2B8
	P2lxj1pmB5qN+03aNeCs48IXVp02z4W8237vleIZXfeG7/H+om6IH7C5O
	HFP1ywWxpM4j92L5VWw6yPYNyFTmz16Cp2XzhKFGgcHFJaW7acrRLwfuH
	hYcNjcCVPIh8FsjMKorxADFD1oSqzJmWbsH/lqpm4TY6g2zaGvefb3pL8 Q==;
IronPort-SDR: KxVWus6/eAgmZ8jjMolL76phgOM5uI3hSQHRXc5WFqPcTqnIR+1jNNCs+QDFCaKpUydfiEKb7B
	BoFUAigjg/pLUq19bC2+hTptC8V+VFe5J/egBrkR3cdnh5q3eLB310b1ivj46FTHhs53qrJpln
	i0lGV3kqjcmRUcCJkcTz3PYwIcsVSkYT7k/00l4pByDMglzan0LjVbLx7Q/EYdsZNkpdxtviet
	Zzblwm7icChV08MpE4Iv26y2lNjOHvzyzFX6mGlc+7Qxn+ZIASpvvHupKReJ1an7xZJ54mrS7y
	XU4=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517460"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:40 +0800
IronPort-SDR: wV8VCR6RhcC7k0SVtYB2RC72W3+3h65jTveOjkv3+MIVp41J0LH8npthh4FGcZjS+RjLRy/Y5c
	iqlTjY6RqizGyg44ZZVzoNJPnZzjVIT4Cid7ZcZycPKN5aTJPExHZkth0uSSK4dUX8gs2EZHsF
	mwI7eq5RdZCxJPZZcAa1s01RJOjM9q1FueUgUWfTAbf7MwvKFxQg98DsAtmjSAqgXS2KltoFFI
	qeC3oft9vZ3hSej9o7zdXagNhQtZtTAv5xjUgfeGO6YL5T4BxSDzZmYv3F7BWcymVyBI9GcuGF
	gWkzy7OiBv3Y4fqMzKs4EE4P
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:59:00 -0800
IronPort-SDR: AZlMO6gj0EkPLCOgk+c5DT4WNDhjCfw45MtadZ5/GiFEmQsvwhsbRFXpLpdTLbQmQEemYM6EDm
	tOJGHTOsUuwCnKWQp1EvZsc2vVv2mGBlVwctpi8EDm1Wy6X1cWP44qswXm3cNGjgKR2lWgrabH
	PKyOztqBt3vFXNBi+4zXssLa4rCI5pehsTeRPvX3Q8KhjR216EOs3fiNJCh3n7IcfWfe8KNrrp
	msksZa1Bq+VYcOk7PDniLMLHnLtDMI1z0ihKaVt3jNoNuACs7lGXhymeE4zWEV78rp7w4D786X
	hJ8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:40 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:20 -0800
Message-Id: <20210128071133.60335-22-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 21/34] fs/jfs/jfs_metapage.c: use bio_new in
	metapage_writepage
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
 fs/jfs/jfs_metapage.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 176580f54af9..3fa09d9a0b94 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -416,12 +416,11 @@ static int metapage_writepage(struct page *page, struct writeback_control *wbc)
 		}
 		len = min(xlen, (int)JFS_SBI(inode->i_sb)->nbperpage);
 
-		bio = bio_alloc(GFP_NOFS, 1);
-		bio_set_dev(bio, inode->i_sb->s_bdev);
-		bio->bi_iter.bi_sector = pblock << (inode->i_blkbits - 9);
+		bio = bio_new(inode->i_sb->s_bdev,
+			      pblock << (inode->i_blkbits - 9), REQ_OP_WRITE,
+			      0, 1, GFP_NOFS);
 		bio->bi_end_io = metapage_write_end_io;
 		bio->bi_private = page;
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		/* Don't call bio_add_page yet, we may add to this vec */
 		bio_offset = offset;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
