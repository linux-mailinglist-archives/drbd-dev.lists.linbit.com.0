Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB5306E94
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:18:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB2CA420625;
	Thu, 28 Jan 2021 08:18:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79C874205FC
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818228; x=1643354228;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=+nCtEeEc6ftLNfXULXJD9MfOSjGF3wrLBEXOv9oezHI=;
	b=Lb5IHDefFW3p0ZnnI7GmhJsOotUge698GqT8QvXPxkNcRngRLzZND2p5
	6LRtMVgy44NhIAwDrEtUA6aW78FnujK5xCzQCSNe+8XoOFaf31KVCJ+LL
	ipywMBSlTfOlQoJ6IVI5sssBqge/IbXW6qyZxyZXLZsRn7HprGh3iGsKy
	B3aJJGBzJF0xYHQGKRr2jK0kiNm3an9/HMna3einvBOhseN73Kd5ocC2p
	7LV/s0wLJdjY1w9zNvXG4vKhg7/jz57eNNJtoNXwhhyNClgeJAm6xc9tn
	cW5OvCf/SKCeZANvPWPDMjrL/Sst/2fL/3f2rw29uGDTub19NhXbyjEta Q==;
IronPort-SDR: nS1AtAzGcBgbEQxy+sJ9UIbxTe2WMK0A/7oGb4NFToRbeWY3LQRhlPxPI1YOUV6WPDNEMJaOBQ
	0OsTNr8nvcj+UVGvrw8utjB3U0QKM0rlr4aTiTzu7eyEOgsqwEDEwCYIiIM2Z3N9vxB+5+/rSs
	wG3ruB82p8cQTGImuCgNrsdeUCKAbg/ctHa4IFMW8JaDFsFrxIXFEJAY3uuLR+Jm3uFK95buwG
	lsAdaFGNcCDU0kd3Cxrf817y/TIDAHDHQYhP/XlFms/IveTqy1BOHJ8tUZXFLi7A5pXOXlFAMt
	6Ro=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="268892523"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:02 +0800
IronPort-SDR: mk+wYTilavLuByNkNyZciuaAQk4rgSXuhjM1SqNWhDcKhIUhcwXkVZ++NsG89FqAsl/K4od9pH
	BSbNfbOvppsH5W7/QtNV+Ix2Ij7MCDzbXUmdTOUHM9c6pCx6xCBQdmrLJmhk7gVuq24OmgL+nu
	oViZ1OG6NEHdIPuYIyZSw9PxZTDabRM9GHO1mgj/czys8DR/H+fQvMX766pMcWjWRTyb7N4Cu+
	o5BTv5tignGVQwCvBtsFSZsDwvveR3U3WnsDnsArG1yIoyTE7o/oBBVDYbC/6GehA/z8chW66X
	jxLY/kEgMDCJdi7aAxLqPB+J
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:20 -0800
IronPort-SDR: bKh0CeniWKxunCNm+jG9l29yuZPN3D1Gz/JAN/nXUgFIRD0d9U6vumFzntseHSRI/MX2HRMaPA
	UMPAuzQRLKKctTclKUM2aKzz/TiMAXwUZH3o+WrBdocCIchNR3Uaqkot1vGRPosruVN9zghU/S
	4vOkqxWogelsFgsfoTKuGHPXS0UKS78L+4719OXJlLRXt4xtaxkQvpBhG3tmxGAdTiSRUPHfPH
	NMPtpPqqTRUN1CMc8PtnqpeNKU9vUEZxV6F3t4AwWzk79mqUHtn9Cp1IEV7L86NNsrAMFQsKWR
	ljI=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:02 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:15 -0800
Message-Id: <20210128071133.60335-17-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 16/34] fs/direct-io: use bio_new in
	dio_bio_alloc
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
 fs/crypto/bio.c | 2 +-
 fs/direct-io.c  | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 20dab9bdf098..28cd62ce853e 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -148,7 +148,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		return -EINVAL;
 
 	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
-	bio = bio_alloc(inode->i_sb->s_bdev, 0, REQ_OP_WRITE, 0, nr_pages,
+	bio = bio_new(inode->i_sb->s_bdev, 0, REQ_OP_WRITE, 0, nr_pages,
 			GFP_NOFS);
 
 	do {
diff --git a/fs/direct-io.c b/fs/direct-io.c
index aa1083ecd623..6aab1bd167bc 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -397,11 +397,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
 	 * we request a valid number of vectors.
 	 */
-	bio = bio_alloc(GFP_KERNEL, nr_vecs);
+	bio = bio_new(bdev, first_sector, dio->op, dio->op_flags, nr_vecs,
+		      GFP_KERNEL);
 
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = first_sector;
-	bio_set_op_attrs(bio, dio->op, dio->op_flags);
 	if (dio->is_async)
 		bio->bi_end_io = dio_bio_end_aio;
 	else
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
