Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9E306F19
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:25:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8973042062A;
	Thu, 28 Jan 2021 08:25:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 185A742060A
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818310; x=1643354310;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=OE6wZQGKF5NjVuNViqgkr5UqZUb/ZMMrnmgRjBTexFA=;
	b=XhRr8CfeeT34ePDNDfbA+Ri47Fws7txEEuSAXxeJpRhJxppagdtowSgB
	kcJ6VfCfTCzobY3J2QZMmWb7DR+47ZFef33O+4oWREblnQByC+aL8AI2q
	yX19WxmZ+hO2S4M+5XfVkQenus0c9V3im1FWbOmwhHZHZxAEi6pIgkooL
	EHUncr1L9GS0QdrCUedfMyZdlN/hGi/4t3qYspjq8XBxZBgSguwq7osAJ
	HFE1C1AtEvwp3d+m6oByHJ2oidGTlpBHxMpUgwSEODYi6nstT/rsNaoHr
	9Upwm8H/XtUBpu1MMQQGpacnfb5sfz0eyEHvUku3YW33/TZx4vE63SE37 A==;
IronPort-SDR: lakGkQpFhq2J4pkxeC8I7ndx6ZhuydhHlAfUXxMlB3gBzPYYts0jC5pnztn3ZdWJmIiwDZiH6J
	bqEgRYRDBeae0cxxWoaQ4qrE7dOwT8aJIalADIoQlQZK7mz+wmsbIGhYyuLgHDCleFKjJGBVK+
	voUS09fP3T5SCKvKQDE9V3GsUUbqGnvL7iwv1yjhgBvHoYPsf+H9etFCjOrH0qKFAz+dtZ0kXz
	rOfFNlciPb7xUDcft0x8cT2+bYCQRq/uYXeTb8ufxv44S7yZdPbB/pSxetic7YYT40H1fRxnvO
	S+A=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518402"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:24 +0800
IronPort-SDR: pPk4nwzHT7nes3lnCegxnTRXGul2rorIWIC8RKh4lJkh+leOrmNNsdtp35e15Kw7iSNGrx8Nsv
	xv//hPy1LBeFbXcdlVNaHO4Vhc5RTGfdlE69BuXWywMrw8NKwSMS9d1TOL9183KTQxR5bCCMoK
	KEK/NGfmSfZ++4GEzOaFSSSYj2ivgzzwT5YJvLjroMsfiCsY6cnZubOiPIw2vO32ZsUOt5ivP8
	+oAQ0egLmDzFZF/222W5+SsBV42MPoz6paAjjE3PU7WURV5Afezbks53mGSYmuzptjMAOePVzh
	X2a9dXkJKorwfW8Da2aJiGND
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:57:42 -0800
IronPort-SDR: AdKYJH34AY4CiVzOXrR15FurWGZi/qDC6z/alYko7jfVcX/SfFhaxUFqHY45DLkP4HiXq60mY4
	qy4n2aJHjpVtmV4fSh3ShuNif1qvectRI2b9x90Cd2PVCzWhg42ZluTJX4mv+bwQtY61xYcAp/
	v9bG8JoB/eY2HEcD52Jlws++S0SYBgnZiIiDuQlpbjK+vhOG1JlBdY+QSI5Hl4fkjAcjiES8aY
	m35tunBPrJVbQ/UTOrTX0lDDjwM/GyWBlapp84/HLby91yE2yFuR9fqy9YimXKC2AojA6XdL7Z
	KBU=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:24 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:26 -0800
Message-Id: <20210128071133.60335-28-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 27/34] xfs: use bio_new in xfs_buf_ioapply_map
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
index f8400bbd6473..3ff6235e4f94 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1507,12 +1507,10 @@ xfs_buf_ioapply_map(
 	atomic_inc(&bp->b_io_remaining);
 	nr_pages = min(total_nr_pages, BIO_MAX_PAGES);
 
-	bio = bio_alloc(GFP_NOIO, nr_pages);
-	bio_set_dev(bio, bp->b_target->bt_bdev);
-	bio->bi_iter.bi_sector = sector;
+	bio = bio_new(bp->b_target->bt_bdev, sector, op, 0, nr_pages,
+		      GFP_NOIO);
 	bio->bi_end_io = xfs_buf_bio_end_io;
 	bio->bi_private = bp;
-	bio->bi_opf = op;
 
 	for (; size && nr_pages; nr_pages--, page_index++) {
 		int	rbytes, nbytes = PAGE_SIZE - offset;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
