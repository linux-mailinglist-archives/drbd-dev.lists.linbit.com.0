Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23F306EE5
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:23:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 677164207C7;
	Thu, 28 Jan 2021 08:23:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E6A942037D
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818280; x=1643354280;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=XPaYjcRaIFpnYMD3YBMMFWgQznGRHjSurwf/uHFVwCI=;
	b=mlYI9x48W9/rzyMYUzqFn4rzHakLPVZ0QvFyADRqI0Nl1V5pXrfoCe1d
	wf+fz0Q2KpoUjPqn9b8weUd7tQ6xwXzyiZgheB8m/7VtJhKZsb2kXo7DQ
	Fqtub1km2TVTwqcsoPgby90VBD4l0TRg+F7yj12H0Zb52lsACEbbRgMqN
	EjU6UW3IIdZBkWzN9QY4Ry8ny9TcrvBvOahN1hNYD/9dGWA/CtE0v9Yvj
	NbTXDVzf1NStiKA52ucE0KAzj+LPWM+Liu3GC8XCGGBZYJefS0He4ZscT
	7j7zhXPPQavSUhU9OUSG2eYbKKDFlaLaJqsItiXUTjw9bapZXT0tEnS9y w==;
IronPort-SDR: l1R+Ygjy6cf4xOHv6tK/3BQIbKKBixtNmZjWWn07wbHYJ3KxqYbR/TGCBl/ndEX50XhR78T1N+
	5CmsGsLDoYCEobZBzJPGj6aqrsJNGMDxvWmB1TxlaPtzESnA6hXA8Y7wg9guMpDVCT4fI4FheN
	QISAVyHYmXsoh/OjTs38KDnLH0eswvVIBz0gBGxU7kJ8MseJRtPYo2BPgYg96yVfwrpmc2WQ/z
	p/M71ALGWRBtEkdSqbE/leZCutLqKvd9vRvs/grHs/zjlVatgTy5iB534dZVvmPa6KcpV7377Q
	4jA=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518351"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:54 +0800
IronPort-SDR: E2CmsJ2pil8jBAYVLY8F9moTtovkuNoApQ0NagKkWjOTNu0OkBJOv1r91YJmyGjjAFZKnU4zTy
	0pC8q8vauJvXEPudM3prY38Ky3i8Ysqu+3+dGEb33PvV2qWKaAD9Qco2j9YNNpqL3x3Ba7lKp/
	Qj9GfeVll7PVEbpDe6RQuSg/SOlpUrPrb4T1pv2xIm7ScOyWJHpaZ5j7fAj7yY32ch0TP3aZYv
	h7SRoMiF1OmDIrOjDujylCfXSlgMqdgiOdB/KUKmQaAiVfQjD8gdAdoKiEDO0UTFcMTr/TdyMW
	xoUVALriLdtRUlSS/L1YReLM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:59:14 -0800
IronPort-SDR: m1TZ+g0HqYnNuuEaVgIMmloDXGiOQeWVkBatefSwdP931h6/Qc9uK8rnz+JHWAn0f3QBmOsUC2
	fXJ41UlgQQnfdBQndrwCq+hQtl7mr6AQW85+ZjLVP2rPUrLfDej915AJE+NjNtCGI740sa3D8g
	UGQ9bx3fpoJbY98zSPHF13CT5IYtiyfyvVxvvVA5VfTuNLKWU4ZEgYs5jdqkUbRYa6sajX3DSU
	E+nFYRIRokBPoO+x05JGw6lqTR47HYfSK6LYXKwXfQUKv6zaLN0igntqoauBJYDwbicxGnznwF
	roE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:54 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:22 -0800
Message-Id: <20210128071133.60335-24-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 23/34] fs/mpage.c: use bio_new mpage_alloc
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
 fs/mpage.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/mpage.c b/fs/mpage.c
index 830e6cc2a9e7..01725126e81f 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -68,25 +68,21 @@ static struct bio *mpage_bio_submit(int op, int op_flags, struct bio *bio)
 }
 
 static struct bio *
-mpage_alloc(struct block_device *bdev,
-		sector_t first_sector, int nr_vecs,
-		gfp_t gfp_flags)
+mpage_alloc(struct block_device *bdev, sector_t first_sector, int nr_vecs,
+	    gfp_t gfp_flags)
 {
 	struct bio *bio;
 
 	/* Restrict the given (page cache) mask for slab allocations */
 	gfp_flags &= GFP_KERNEL;
-	bio = bio_alloc(gfp_flags, nr_vecs);
+	bio = bio_new(bdev, first_sector, 0, 0, nr_vecs, gfp_flags);
 
 	if (bio == NULL && (current->flags & PF_MEMALLOC)) {
 		while (!bio && (nr_vecs /= 2))
-			bio = bio_alloc(gfp_flags, nr_vecs);
+			bio = bio_new(bdev, first_sector, 0, 0, nr_vecs,
+					gfp_flags);
 	}
 
-	if (bio) {
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector = first_sector;
-	}
 	return bio;
 }
 
@@ -304,9 +300,7 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
 				goto out;
 		}
 		args->bio = mpage_alloc(bdev, blocks[0] << (blkbits - 9),
-					min_t(int, args->nr_pages,
-					      BIO_MAX_PAGES),
-					gfp);
+					args->nr_pages, gfp);
 		if (args->bio == NULL)
 			goto confused;
 	}
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
