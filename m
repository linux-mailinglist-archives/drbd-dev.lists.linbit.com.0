Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D0570306F60
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:29:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4775420814;
	Thu, 28 Jan 2021 08:29:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 244B1420632
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818374; x=1643354374;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=yNs/pnE8yDpXGswjvz9qkLYz+CA1dL9+4aNznurTKfw=;
	b=faPz+0ZFyleoVuoxfqdUDW2s1/GdUfioiW22GgsxRSRhop/cp7mRCMvZ
	zEqHUVWTbGwrIUNU++5hS90kDTHGxVDO/Do6s1lF+LE5chRYjTuj1xuzu
	RyBkIWZXaY7nKONh8svxLw8kRxvRLlvfoFwpgzdTa5qvlpfCkjCJf95U3
	KABKyvOvNgVvwfW6ZCfE8V4w5Dhj184+yuV6/L9TI2gSv77WABkNVmf/X
	dXY5TJoD8WYhyr42rS5p3ruB4ARSRBR5eipyBxi7VWBi/7aNmftUxYo7K
	abDi9HdnxIJ3vQBpNY/0WIbTKFy3/LSLg6wpm3bYb2sReRcy1lZ5VRCld w==;
IronPort-SDR: a/JRtsV4sHWy7CLj7JSfhfxw67+mDXQvVo6AFxT3Q6fHK1ozQRdbvsORfvR5iHwb3Qr/vzjHof
	pnyj2Jw7scffwGK8rKQxZg4Y8Cx7IulLsx/KiE8NAXa7KJdB4CwF+eMVBqv48i5oJKEA7nKK5u
	2r+Ai561fdjTwXT12WMbnayuTaHIFgybCtwMsZQVkCgDEawJu/qMMJoOW39VEOddzBvW0dd2s7
	KwVEJXcIkYJk849P8cydnVIJcavqkA0fRLo4bdLiFS3g873GwRLg5ouqeiR8Ko/8Ouf6J78srz
	sIw=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518068"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:26 +0800
IronPort-SDR: tKp6UI8PzruxWWHl5RICysRk6acsl/VI+sVTE/ebd9HG/R/OzXVp/adSKTmJBQurqmfQgddVfF
	rrA7C9RE9dfwlTpo33gCdSEhBd7CM518T5aCQYnOajQZeMGrVbE/3Mxw1gOsOZDcJ0rPCTVHvU
	DBK/PhuvKSBlVa4rDxukgxZydIPUi4MkP8ouX5VPGGdWNjVXFXze4FMHpL7b6NfMt8lmXGj0k7
	vDhHUud9nDgTf5lEZ9bDiEah73fGcfjLN0C1qJKvO6PWVfVqldvDuoGlgpII+oN6FBihvLX9BC
	J5z9oTKJ2zILTpVQuW9B8DIU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:54:44 -0800
IronPort-SDR: AXyfJ+0DzRblLd1C2a8i26F/p5ozSimYWSlSS31hVM9ZD6XicSUM+PrSEKfC1Dird0dpCST4jr
	RH8MY1sbvDVq5P84PowPihV3IFXmyzQNH7jhgBGPCvDUQHmJMRxTWJczw7haMsXH6G94Is8ChW
	3Thpc5BIBnKiKhlT74BApZ+91+Tr+DAOOck7bXVmzNs8yvwHiSmvLe1vToPqpHXLGvuEQ8CHDc
	wMtFD3vO2n6mQgoI8Yf56mEPo6oNIWF003bHhQMN3DD+ikOw4kJGblAZl7I7M30srcHVxOHbPk
	wqE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:26 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:04 -0800
Message-Id: <20210128071133.60335-6-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 05/34] xen-blkback: use bio_new
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

Create a wrapper on the tio of the bio_new() named get_new_bio() & use
it in the dispatch_rw_block_io().
p
Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/xen-blkback/blkback.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 9ebf53903d7b..3760278f0ee6 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1174,6 +1174,15 @@ do_block_io_op(struct xen_blkif_ring *ring, unsigned int *eoi_flags)
 
 	return more_to_do;
 }
+
+static struct bio *
+get_new_bio(struct phys_req *preq, unsigned int op, unsigned int op_flags,
+	    gfp_t gfp_mask, unsigned int nr_bvec)
+{
+	return bio_new(preq->bdev, preq->sector_number, op, op_flags, nr_bvec,
+		       gfp_mask);
+
+}
 /*
  * Transmutation of the 'struct blkif_request' to a proper 'struct bio'
  * and call the 'submit_bio' to pass it to the underlying storage.
@@ -1324,16 +1333,14 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 				     seg[i].offset) == 0)) {
 
 			int nr_iovecs = min_t(int, (nseg-i), BIO_MAX_PAGES);
-			bio = bio_alloc(GFP_KERNEL, nr_iovecs);
+			bio = get_new_bio(&preq, operation, operation_flags,
+					  GFP_KERNEL, nr_iovecs);
 			if (unlikely(bio == NULL))
 				goto fail_put_bio;
 
 			biolist[nbio++] = bio;
-			bio_set_dev(bio, preq.bdev);
 			bio->bi_private = pending_req;
 			bio->bi_end_io  = end_block_io_op;
-			bio->bi_iter.bi_sector  = preq.sector_number;
-			bio_set_op_attrs(bio, operation, operation_flags);
 		}
 
 		preq.sector_number += seg[i].nsec;
@@ -1343,15 +1350,14 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	if (!bio) {
 		BUG_ON(operation_flags != REQ_PREFLUSH);
 
-		bio = bio_alloc(GFP_KERNEL, 0);
+		bio = get_new_bio(&preq, operation, operation_flags,
+				  GFP_KERNEL, 0);
 		if (unlikely(bio == NULL))
 			goto fail_put_bio;
 
 		biolist[nbio++] = bio;
-		bio_set_dev(bio, preq.bdev);
 		bio->bi_private = pending_req;
 		bio->bi_end_io  = end_block_io_op;
-		bio_set_op_attrs(bio, operation, operation_flags);
 	}
 
 	atomic_set(&pending_req->pendcnt, nbio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
