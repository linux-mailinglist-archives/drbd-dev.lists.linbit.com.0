Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA52FB32E
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF3BD42066A;
	Tue, 19 Jan 2021 08:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0ACC9420329
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611034055; x=1642570055;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=aM7JQIyW0SiKsSN5jKrINUGLCUPGl+Twv+vS/lM3j18=;
	b=a5BcW1awGpYrGhBiVGfgpy1xGN/EN0oPvDy8Fn3IbwqUQMl+o05ty5dk
	J4EV2iLHtik0MTTNF1XZupjuOImVVIdqjRXh0OpIX6tRFxNntuG4JO+84
	Myim9oG/T31fkYZFzUopPOBEYW0TUEUFrVJKOOz2a/W16xc+/C8b1Ig2e
	JGxq2hZ+VjIprkHzPmJ7TSnPJxCgbUBPqiLNRI6m9tDXHDp/WkZnZ4ODD
	+2jANrxvhEoHEvWpf54trtDD6IlEA3UFikCjIo4RqHHBOF7pz4dX3JpUN
	XjCBKXrfFXX3xqMZJ1idMDSJ0ZNWYzU9yXi8PVUlzl5rQxtOizxDrwLx0 w==;
IronPort-SDR: RCaTGgGLm6wn+ZAbMDG44ygVb2jOyn5D522uaie/wzgLxcY/YAq0XaFucRz7nEVvUiCnpVtUmH
	gNYgLeb4Tsd+CHerJUOOPBs1kXZMDD3fIOottZ2mvjSuDqPqvrpiOW/3VLE6vj0m4ccRkaPPSE
	8KJ2hhxCp0dD0BPhczByf2KF8gRFKsZa/QFohjRyRUzqwEXCG16pMB8g2UeDQMzAM2g8cFt6U5
	Xv2WuuQ+FX8mugr81ZWKmI2MhV2RXIzwO1E6RCVXE5GbZ8dF0Xl5NngkulHtB9WETrw1v4D5Vq
	Uh4=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722486"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:22:29 +0800
IronPort-SDR: vKYnvyF8ClO5Gg0mjGWcnhocpPQisEIK5pluAlD+rv2AWhE1g47N0YxKzND9Y5d1tDlFlbxw3x
	qgeHQJbsDw6YiMlwVZPgfhzFh569azo0zjPJ2Bj/zKq5P3DwN6cSYZBNTF9Z/0XQdOct9gjFXu
	yQ1iuC0r9EnhtUmGxI/V60+lbn/pSrQuI+jtY6Z+wx7/TStmdmhxWhXwVhRfuFwXlF98N0S85J
	AbikZvzPiIGumSpyNbLY7UDC6664PMmACv0AP/xbHTA9ZiXSPMF4MyAFhzk5BuhrexsbE0BYNT
	nvpYQ4W+eYt2UlRDm6BMNQhg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:16 -0800
IronPort-SDR: oklSZwC4T98igITkHvUN5/cFLVu1yS+dVuRFw1rj6Sypghilpv1dq004ftoRiIcXr+1cvb1C+g
	e1+GCw894PQkPu1QcGSBSC17BzbJVdUoKLEKnb23R5ToJPinuljlR2aaNZBBxuQfj4BqaudRJa
	XDGeUKlYGqrX0PkiJf+ZiBwJ6Ik8t4zeEDjdqLOFU05xrby1lNOvGG7JThAaPObtceSdxUj1c7
	/m5QwBatTkcZcWmVuIDWjsPnj5ACeHofJxm9d2p07oDQHlNegcWml37RbpxW8gEnNxSajg/OqB
	c4E=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:40 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:28 -0800
Message-Id: <20210119050631.57073-35-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 34/37] nfs: use bio_init_fields in blocklayout
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
 fs/nfs/blocklayout/blocklayout.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/nfs/blocklayout/blocklayout.c b/fs/nfs/blocklayout/blocklayout.c
index 3be6836074ae..7ac96519c8b7 100644
--- a/fs/nfs/blocklayout/blocklayout.c
+++ b/fs/nfs/blocklayout/blocklayout.c
@@ -128,12 +128,8 @@ bl_alloc_init_bio(int npg, struct block_device *bdev, sector_t disk_sector,
 			bio = bio_alloc(GFP_NOIO, npg);
 	}
 
-	if (bio) {
-		bio->bi_iter.bi_sector = disk_sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_end_io = end_io;
-		bio->bi_private = par;
-	}
+	if (bio)
+		bio_init_fields(bio, bdev, disk_sector, par, end_io, 0, 0);
 	return bio;
 }
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
