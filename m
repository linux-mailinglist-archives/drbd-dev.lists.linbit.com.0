Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5202C306F8C
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:33:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 24DA742082D;
	Thu, 28 Jan 2021 08:33:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 272E2420636
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818448; x=1643354448;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=OdHsUuhLqy4MrzmNdd/tdpH4dcVzXnQrrHk/wuqLVYg=;
	b=O1g9zPGDen93qZnU0Urwx2IyM4O5P39kngYEHauXxV7ePc2l4DIHfVpJ
	vt66farA0fL3LRasTIt+LmegV1WmwIFEpcfdkRaEdtVIr9aQLFjh04Xd/
	HOox5zMcZKMQum/C6cl/+2A1YsuYxUd+L1gt4DQGTbPo8LwYDsOjSk5LC
	ntkOq/CIb9034EhhVja3Fo2Ldk98LUiUZ/2c+nHUDpqkkUtlLsY27RIZU
	JdYlq93JvUmbIZ+DuThWvBeoDBZkABau2xpNnrXCjzOLDsh4LRCZe32AA
	qwsxOEAWPaTu5z4PYgaSE+vHC9XrB/oAhe8E7b8+W8tP2LYS1i6tMP9+G Q==;
IronPort-SDR: uu1NleI5MLMA2Gtcw5Oeo2jxZklW6pURPhy/SxkhulLIow7NBWwoORFEvA3XnhsgwXhC3+gN9q
	BX+1nbJeVg4fRsaVGOfm3EhKx6vkbVdCKg6WnKPuQAApxIY07QKkTK5tAIZrtRzJDd2f35oWD7
	XDZxrf0vFnrp30gBLWn4KgzCHTt4YSryFq0WTELWIuJyBJFwRNax8lTUUoVZy2UxiT3ul9vyYC
	dxw/P8/hVSnZ/uMpUgOHgGPZJNYUc1ZS8p/NFKfIzoeAvXxL7Myx0EkUwGKj2JRTs21XRjAD5j
	+Q0=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518212"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:39 +0800
IronPort-SDR: 8so8/vtprGG5voU71ppv0mvUkKzvWOcMBFPfxEUIGcJ1goV5o3zW0C2n83hzdHcLNQF2q8O8KU
	couWHwDUD1UAwVKKqU6UbJM2Qmzha0cjr3M0uClLXHIo6AipBcNUpGjyxjXZgVOF3gQh59zrpi
	uZD8r7qbiWoT3fmDCT7Gr8JrSuEdv9C+lQA14bpaFWc78ZmpHZB2GQ5qiJBAMEqFaAU1EcQrX5
	1WHbOlP0BKfMFoX6HowQ8BOaHfwlAUlkycKPwpSVX81/fRPZ4nJomEz7RADmATFUfIVY/6ET19
	ypm1fBQosNbxehs3V/odeUQK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:56 -0800
IronPort-SDR: Soam0z/hZs1yuoqW7i6jx5roOoHAapZwcG8+RboeMSicIzBmOYiX0n71yThGE0I1AnlhuM1di0
	VAe/ab59Zj3d54HqeQwwCvYowNBZyfmch3v7Oy4azaqst0BpJQIg4rXG9R5IU/X7180i4BamQI
	Pdm6cEOWuqZT053sZGwqRvhtwriLsaGVJTX83nQ+r2PwZZdfIXxXkXEJoScfk1suUPevohY8gp
	ghp78Zzi9GkjGDnNvz6HqiAkBvVb/9awaEDn2T+13/9ul6gQjwyqb4x2IkJNU2l4rR1clxPnay
	0k0=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:38 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:12 -0800
Message-Id: <20210128071133.60335-14-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 13/34] block: use bio_new in
	__blkdev_direct_IO
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
 fs/block_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 9d4b1a884d76..f3e3247894d7 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -367,6 +367,8 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		return -EINVAL;
 
 	bio = bio_alloc_bioset(GFP_KERNEL, nr_pages, &blkdev_dio_pool);
+	bio_set_dev(bio, bdev);
+	bio->bi_iter.bi_sector = pos >> 9;
 
 	dio = container_of(bio, struct blkdev_dio, bio);
 	dio->is_sync = is_sync = is_sync_kiocb(iocb);
@@ -389,8 +391,6 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		blk_start_plug(&plug);
 
 	for (;;) {
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector = pos >> 9;
 		bio->bi_write_hint = iocb->ki_hint;
 		bio->bi_private = dio;
 		bio->bi_end_io = blkdev_bio_end_io;
@@ -446,7 +446,7 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		}
 
 		submit_bio(bio);
-		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		bio = bio_new(bdev, pos >> 9, 0, 0, nr_pages, GFP_KERNEL);
 	}
 
 	if (!is_poll)
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
