Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BD306EE3
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:22:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 333604207BD;
	Thu, 28 Jan 2021 08:22:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B7F96420619
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818275; x=1643354275;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=3pvsXY5ThsGIWZu3d1vhsE8XvMocy29CAsL/BvlC2XE=;
	b=GTd/WPTHkyrw4+zEPhWy0C6Muvi/YlQh2w+eSBHQB7Ru2/HbnujMlojh
	JcNP9KFDHjCxcXsjbhHLXp10RIb1w2c3StnI7ltbOoXJZuMuG8ZYOQ9PY
	qAb97QbJ5mpey28D0Q1XIE9TrWRjgt5jW4em2NY2u4Gck8+y2qRwoLgW1
	yamyYXh5ubsPLjqXXtO3somiGcZjBAwwONysIfLpbSN3fSRGmu2wpo/SC
	NxyrRA410ymopH1h6WHtoAzm6yL9YxosQRhbPiMb99O6OqEmPVhCmP2l0
	0LPLxHhLXfKJX6dgAILWmejbxxWdQi/wpV2JpXsa0Jvsa2uO/gaPiIVT8 A==;
IronPort-SDR: gqdG09pAvT1HCgR6Zdy2LSjLEHoKU14WEjUm4Q3YlpuciAm8E7NyE1cE0NHoKqCvteCegg6ff1
	Sz1d1U0/kS3VmHWbRDkSI284YuJ7i+SBAV5AfNeqiXTt3WKBLv1e28ENxwiFrnGjuGOPa1Fiao
	HMeCwMgBKE1zwX3Vdpus4IXQv7HaHkWbnYTlcBe3wkfjhXwExD8lChzzeN0tH9c2HpqAC9uzUu
	P01mkOEJ1J7iNU1S7L2vsFCtQdT/2MjcZnDaTKYqA7rsHTqklqHreV9xVNCzZI0Yn0UPs5KhRU
	oRQ=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159693949"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:48 +0800
IronPort-SDR: 6BZU9fRy1bn3eIsiWB7ZKxG8FaDRpWKpk8T3Ea56yvI2vIpxfSgEsHSYtTot4rI8NEweKhXFzD
	KAN6Y3iK0jWWDab9RnyFdhCkIxdwwZ360oe8thqh2Gc+rkejs391flMNp8nLlATWzfeP0t8rjl
	Q4kThsQeRJjyLhfPbNou39s96KtDCuirS198r0bDxSKcq3KONSab5KRTJWOOCg1nFhkXAJBBnR
	o6ujrXmqKBkca5BNSH03zeNY10+xW128I38Kkz3tyzMTpB4JbUwTnvUP92KOpU75No/UiovRIH
	zzsVU754xaew4i9Ms5bwfQVd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:57:05 -0800
IronPort-SDR: /NPjYa5/vzKcQxwITziayqgew/xym2P+2wPZ/H6tqOBM0Xhb9g154b50VotcIn3s/gPeO6yJQj
	jaDu5T7BNEIYITi6TAhnovFoYzPUstLQt0EGdLi5t/kGP6Y/bNfbV9+olcDvctAzlPCNttcR2B
	XcI2j3jvNIAhA1FsWohm0Q1E2hEvaC5Uto6Y7wmXZKJ1CZQCBzspE+8o3ZgyvyjFSagVsi+kvR
	d3gH64xpw3ry94057Mia9wtqUGJtdB9qbq+w9vxtVohjFozpBIeHLdl7QNCYcftS3gwSjr5dcQ
	UPU=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:47 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:21 -0800
Message-Id: <20210128071133.60335-23-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 22/34] fs/jfs/jfs_metapage.c: use bio_new in
	metapage_readpage
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
 fs/jfs/jfs_metapage.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 3fa09d9a0b94..c7be3a2773bf 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -495,13 +495,11 @@ static int metapage_readpage(struct file *fp, struct page *page)
 			if (bio)
 				submit_bio(bio);
 
-			bio = bio_alloc(GFP_NOFS, 1);
-			bio_set_dev(bio, inode->i_sb->s_bdev);
-			bio->bi_iter.bi_sector =
-				pblock << (inode->i_blkbits - 9);
+			bio = bio_new(inode->i_sb->s_bdev,
+					pblock << (inode->i_blkbits - 9),
+					REQ_OP_READ, 0, 1, GFP_NOFS);
 			bio->bi_end_io = metapage_read_end_io;
 			bio->bi_private = page;
-			bio_set_op_attrs(bio, REQ_OP_READ, 0);
 			len = xlen << inode->i_blkbits;
 			offset = block_offset << inode->i_blkbits;
 			if (bio_add_page(bio, page, len, offset) < len)
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
