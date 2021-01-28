Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489D306EDF
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:21:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4533942079D;
	Thu, 28 Jan 2021 08:21:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 347 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jan 2021 08:17:35 CET
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 988A7420356
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818500; x=1643354500;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=cXmRF2Su1ZKio9gUSME8BeoE9pXLYvn976s4DXPYmio=;
	b=kmGhfVlDlQXPADjj920RtdVCAj7j3ZwSwEzuC9njOkHA8km1KJYU21vZ
	J8wLCX0qyI4bNL5Lfb42fciBSwUAkNl54ebSXrgqXeFjzPlqVYoKQ0H+G
	cBw/n4kLEg4Gli7ejNQ+i0ot0pGKy61FL4zLIfzGxmg50ERJrcwzrQKc/
	FXAifSh95O+d0k7C9rYbD6wtTQhSIfa65Ku+HW8YBBE44xC/Ygtb7SwaL
	6OkvaPDYIm6UV/2bcP8TgN62r5VPLeyaxfbqN4og/SHRKEViVKy20gcKX
	12H5NEAGF0j2qzC2ivOyts4VEHMMQ4SgpBj+bWEjozbzIZophvQiv2ib3 w==;
IronPort-SDR: KMtXM7/t3UTYWp1ULWzUKGyBY3afWLdJ+h47wCL5XFvg2aBs3c7zqpuCJoz0P4ZzHulIj7/v43
	VVHabNmWPsT3UXVuII4SUPLcqF/LRjISB4JTXNoFRHzomZx+KVQLdLCYeWylZSw1PJYwXXqFEv
	4Dx5G5u16HyJREBpimrBfTmbAKJ2McgnKYBBv6yA+0HbG/Wc3Y9DnswKj+pqPSXxTko9Y1ija4
	XW22m+8JFRn33L73xVPvNx1yuPTom0ENrVJ3xlrLiSOfChmS/jlNPFkfeX2+vx7zbOZmH9yjQJ
	WH4=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="262549191"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:18:33 +0800
IronPort-SDR: NzDx+Wj0Y63JJIFXVqBtJGa33VMRjR2nMScYQf1Nex0F0c3LuMRiWMNnAeCP6/4wyw7Jy90br5
	KxS+etFVUaaeJuiO11e40t54Fxms8RpqIw+M2M825iqMuGB+nOLrd8dbDuazBRRu2FTaumTGc5
	l+PZ1i/4l2RI7O0JSvMqp4yNIBFBVmgqmo1aS79tvEKjOvEb4/ZcWH3vPpZ1AoLMrJdMng0Wnp
	C7f6Q6EOE6QAi9R28Cb3Lf+rfR3vABYS+4/emmkz2ZWy1QBchQsJZ1YaBX9amhT0yDXJzDRE62
	7JGJnNIErc7to2P+cVRr92xp
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:59:52 -0800
IronPort-SDR: m+UU9TJBIXCvSyFz/7O2vaYmlOCexk8ewW0e2kOKkWSuwpQEVFGI+DHENO7Q1Bf8IQzN352Mi5
	5dDETfg3/zd0aL0yHDjcbUD/eS6byN5dveWHS0JlUn01j5YdJYnuzvRhCyGEwEvsPLeiwlo6h7
	h47UPjLb7UDOPAPFC4EqcqtJYlkeHUwpVqBF6C8WUdWbiBbzIaj0jcLgB21R8kA1PJHycwAnr3
	51c0CVR8EMmKQ6pEvymjZcIoINYcADZvl3xn96JSQjk6KW59eeMqwpBFLuZiCrCp4Zkdz1bD1j
	kZU=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:32 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:27 -0800
Message-Id: <20210128071133.60335-29-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 28/34] zonefs: use bio_new
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
 fs/zonefs/super.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index ab68e27bb322..620d67965a22 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -661,6 +661,7 @@ static const struct iomap_dio_ops zonefs_write_dio_ops = {
 
 static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 {
+	unsigned int op = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct zonefs_inode_info *zi = ZONEFS_I(inode);
 	struct block_device *bdev = inode->i_sb->s_bdev;
@@ -678,15 +679,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 	if (!nr_pages)
 		return 0;
 
-	bio = bio_alloc(GFP_NOFS, nr_pages);
+	bio = bio_new(bdev, zi->i_zsector, op, 0, GFP_NOFS, nr_pages);
 	if (!bio)
 		return -ENOMEM;
 
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = zi->i_zsector;
 	bio->bi_write_hint = iocb->ki_hint;
 	bio->bi_ioprio = iocb->ki_ioprio;
-	bio->bi_opf = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
 	if (iocb->ki_flags & IOCB_DSYNC)
 		bio->bi_opf |= REQ_FUA;
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
