Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C275306F1D
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:26:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43E914207DB;
	Thu, 28 Jan 2021 08:26:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 999A5420626
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818340; x=1643354340;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Y9+Mnjxua+V7f2wybPN6k7Lk3+3v11itMxG4MZ3QMkM=;
	b=D8Lf58isT4tO+ZqWCDov+/9wpJaDfthIekt4f1gcRkM7TXulFX3N66uE
	qYARWilUxfAaoRBboavkY+imFd4pSqVsr5ioZLLZSRBL6ogfzH+bzy1AV
	eqGKDPScPogvq75qKAz7BUDQKh8LinCn0zt0woZ7V2NpNpuOq/EJwZPjt
	xphH/7ftXJNjR1/aaet6yJC12KI2Jbybvc6EBHLqnwCWdH6PZMhn0/e6v
	ojHhANebRYkJwTAhmiWikL4o5fwKmJxlOsGlazICa1TizXm+PYlUkOeQK
	E5VnEvoaR9MmWSv4wox4q0Inisn3lei/lb1pKxdBkJeuIJrlVpxcR4g3D Q==;
IronPort-SDR: kf+k3XH3+M1ciSXPK/sFWOFqHj+9jYhjD6MoeppZje4u4FBWgh3gTIHYKTTcPX5odtJtZTX43q
	H7zdXM6ZM/ZDBafABQCQY2pJPuoW8jDvqRbvsjHQ9JQHYA2347NeEfFnlG0vLCVV8bbVKV683V
	asmxG8PnpfmxFvrnLKPk90lUPRLYAMKGwmUFEeTnxA7ZsLgDMmu8weCEe6BJEHwLyCsh3GamMH
	CPmiyp4ZtXIM7GyJTL+XfWMPG1E5ZVFYoXo01UgViUxDLLBIQ0YdIeNXy79QjkAfdICVi1kbOH
	w2Y=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518466"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:56 +0800
IronPort-SDR: 98R1VrmxS5hsWzrgylMyZZ6BTHbBlpdbEgN2JZlVJsuPBxVW4N2n8BnaM8FQjj5K2aYcHvmgRX
	aC+Xi4Y1irj5M3kd7BtJLC/TCSwG+nUCH/OqMUKV0B30TC9AxsARxx0miWhZSQFm8WmXiBUwe+
	fVOVtVAqBmOW2A8jf2PWKZSzJsI2Me6RQ+Y1CBV+J8h0cImXaFxCAQWu21P9BKTv6ZzJUheOTq
	oZk0T/lzFcI8ETK5HNYI4dNPp6xhRBcQZkH/Jr/gKPKUguPPY4Ktwt1vFCnU1p0bHjr9GqiSJp
	XvLDYt3QYHSHuPhfkuxRUWlk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:58:14 -0800
IronPort-SDR: MJghY7CI3VIGR5/IaW1FKfL3TP8YTcGZMlKgwb78Me3B/B/3apRuuzh9zoIBvsafPZo8P1zI7O
	tvlMLEPWxNEsao+d+OWmeAfzkHQtyrR4CezWVDYJlrvLmf+2864qvNG9WiZqHSu38lUOwqOgWr
	BwUEJ5wQyzZ3OCyeIORv7uUc6VzLa9ZZ6RiC/IlKAQuXNbiGRl7btRhvnWciISjEw6c6WHvSr7
	U7MWRK7LEz7DNkLYA3LIdhi5N4PJW+ftjhgTNZ5eyVeVGIhgT6If8NwOmXnpUTI7IymY6dp08v
	5GE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:56 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:30 -0800
Message-Id: <20210128071133.60335-32-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 31/34] iomap: use bio_new in
	iomap_readpage_actor
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
 fs/iomap/buffered-io.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 16a1e82e3aeb..08d119b62cf5 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -241,6 +241,9 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 	struct page *page = ctx->cur_page;
 	struct iomap_page *iop = iomap_page_create(inode, page);
 	bool same_page = false, is_contig = false;
+	struct block_device *bdev = iomap->bdev;
+	unsigned opf = ctx->rac ? REQ_RAHEAD : 0;
+	unsigned op = REQ_OP_READ;
 	loff_t orig_pos = pos;
 	unsigned poff, plen;
 	sector_t sector;
@@ -285,19 +288,14 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
-		ctx->bio = bio_alloc(gfp, min(BIO_MAX_PAGES, nr_vecs));
+		ctx->bio = bio_new(bdev, sector, op, opf, gfp, nr_vecs);
 		/*
 		 * If the bio_alloc fails, try it again for a single page to
 		 * avoid having to deal with partial page reads.  This emulates
 		 * what do_mpage_readpage does.
 		 */
 		if (!ctx->bio)
-			ctx->bio = bio_alloc(orig_gfp, 1);
-		ctx->bio->bi_opf = REQ_OP_READ;
-		if (ctx->rac)
-			ctx->bio->bi_opf |= REQ_RAHEAD;
-		ctx->bio->bi_iter.bi_sector = sector;
-		bio_set_dev(ctx->bio, iomap->bdev);
+			ctx->bio = bio_new(bdev, sector, op, opf, orig_gfp, 1);
 		ctx->bio->bi_end_io = iomap_read_end_io;
 	}
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
