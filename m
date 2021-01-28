Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B2306EA6
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:19:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79C6C420631;
	Thu, 28 Jan 2021 08:19:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F235420341
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818236; x=1643354236;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=0nkVYESNcCP1ZuiY2joF5zZXurD0RzvJ1s1BM2N7jGA=;
	b=J8k1qeuYyaARaAGQw7kWujyl23pi7S1ngM0+YP2xOfa9OVCrqTg3HSsc
	Q0xfNN5LX+wrEWvCGWbBc1qt/e8KimJ/FC724HHlr/5wSNm2YjLMCx5MB
	hA8GA+qdls5GPGxSlRl/nuqxW5kM2Z63J+rXlKGVQ2LUF8CTXHkI0wFJd
	e21x7RT/d4bIERFculOUWtLnSoo9YUoTQon9UfoU7u6a73jrjblWGUmzA
	VtMq9GEThnS11D7bXnIKvXlFUuBscVx37faW2r1QdfuBief6CRhxMM6b5
	LBzqYnkj65rbMw9IdJ0evfjrIWSzJZO2XV3y9PUhPPSm5JYl0j1sN8T/Z A==;
IronPort-SDR: RZQUJwfcmQbvixBPbdBNahU2AYE5B7NdF1MN3pJF3S+110TzM/5WhP/rR+meWL/AE5eyYnuLKq
	q79+xEdcyjCyK8eDQygxxsvSl6Dw+lSlqGhH6uWYBtbQPgJ/UGItu5hLrEUlCr+spoCDMWeJ60
	wQY5xtbVX66k4RgqW2cj1CxTx5bjc7MSkMawys8cfDOD1t7Q6A8UHwySDyjyV/YXKPIc8+1cKu
	2ca14K8G6hfwMcGhW75P67gBVdVIIIiNsPKjyyq8nHyP1Vi3dVRM/7MiY3aTlnA/ZYatOK49kF
	ZFc=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="268892534"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:10 +0800
IronPort-SDR: D3l8/2NIrBIirWiCuqmBWN65S7DEXbHpQ+2zOH/lsMUwAv/JFlRcoTTcUQXF43I8QkeKkOvBOP
	Iom7h5PtRwwWnzRdRSzDHxO4CvKNNBKHzdzBm0DZ/NREmu33ZgFSqjy5N5EuJui5l7bIRHvT6s
	bBpJ5CcR0dLUsRdAJVxs8rdWDdBlypNIrczcMMyqCM2Er2qJD1jjuP1KL9nwwyS4d+SJJf1v2C
	r83j6txJ2g0mpbR+rKdNg24QVaUJah94HpxVsq8QV037Fg8gS2fbKaxBA5VGj+sHJ3jQIfOnJu
	1/tFEPnpasEtd/psMNN88VWc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:28 -0800
IronPort-SDR: lKKhoxaMeyOwXqrT2FSzD4wN8uVJ+mvKyFTUKLm7JjK92Do6Pp8LlRaYGgmaQWgAcNgigcbWq0
	dr8eH/C5m6jarJyZCPupuIjbqQYzS6I98zkdR7vs+3yNowqMQiZeF1CHZrTo/tpym1SjWfvRXs
	6jUItt1/GcDgh349QalPLGcjYuMZ5A1EKw0wTA/1PN33qNlegyypjYwNakr5Qt7Zi77XOTVrdO
	glPMuXb+RS4OnELTigLzoH/k3P2LKO+/yrMNDKd4LQa/txopqXKI4iyznrBVm1YJBPOgSOjnjZ
	uxk=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:10 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:16 -0800
Message-Id: <20210128071133.60335-18-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 17/34] iomap: use bio_new in iomap_dio_zero
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
 fs/iomap/direct-io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ea1e8f696076..f6c557a1bd25 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -189,15 +189,13 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
-	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, iomap->bdev);
-	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
+	bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), REQ_OP_WRITE,
+		      flags, 1, GFP_KERNEL);
 	bio->bi_private = dio;
 	bio->bi_end_io = iomap_dio_bio_end_io;
 
 	get_page(page);
 	__bio_add_page(bio, page, len, 0);
-	bio_set_op_attrs(bio, REQ_OP_WRITE, flags);
 	iomap_dio_submit_bio(dio, iomap, bio, pos);
 }
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
