Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0F306F69
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:32:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC2F442082A;
	Thu, 28 Jan 2021 08:32:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DDE1420640
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818438; x=1643354438;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=5eayPzy70EKVB5mFbuCcXtyHCS4v72l8k3GegXWivXI=;
	b=kia16EOx/6pK0JTfxfaybwccaR3/uPA4rLirSjfVjDqWD1yb8aXEm2ye
	dyzujiZYfcG+jkbYE2I4FwEbH5ozMTcIeJC9ZDoh+55EEuO/dvq/rTlRv
	LqFaGByByq9rXjzUrNuRQXNP1se1gXi2tUaMyR72rJdo22pFH+gfqUsD8
	gIOOlONYLxlwp/mDb8GNYD97H4YWp4kCUhwIGPSklmOwxBQFh+hBGbL4q
	QqP3VQwz4U/+Van3A1mv4HurU8rQil1YqPind/LEyvpHUAcmT5np6EiuQ
	GFagCRbdEjOSxOQxLhiXltL2zz1YOjw1w7cPqGW+D+7/En1Pggw2OwsjX A==;
IronPort-SDR: Qqreu+umx+2c7jLvb7GTdFhwUTjKYk8pYiJ/P95rM6EtDeG1wzl983HIVuM299LjIQDHs8fhPk
	JjfIoLm3YokMJbiXeOkmiIV/Zb7FAhW+RwVgmI4QmjvbvlB1YMDklPsuEswDXXKqbPzOGTB7rW
	nw5oCs4PDOvr9qG8XV8QppXvcrSVy39iFc72Sh6uWndJCVxIYIRGohc4z+wXINg/U4/2qeefDh
	W+sJ21wVd35/2gxMxlhAG3yZ91ZJOP7FFHFEiOu9nIRxA4jhc6uwxoTBFRzLfxdyw8LBZEt/J0
	K9c=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159693851"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:31 +0800
IronPort-SDR: x/wBrOWc8aUWNlAglexAjB6CkmVY4VcZoJPev3d8TRlCvMlCVDpcZ+glOU6H1stygq/ShVQ1nL
	Cy/8SITb7AHCO3AUtATL0q2jjJ8ZtwlbiEpFZvoRz2rKhr89P3MymbJtQj4zxF0iWlF/JtvDNl
	GZsbfGeVZHPnbQwwFwdwEJzGpGda4SnQXYc5/Xmbi2r4SjaRsVVw1kI37H0ildbJnDTudL1zR5
	mBVzIMX3xLPNtHeO1j4it8eXssCNBxFqF+PLy5alg5wzZCJFXdmgXcQ2VElgZ6g9h3kO+KrYvr
	pU6XrkquClyCWjNjWnBRtGhb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:57:51 -0800
IronPort-SDR: VOVmzSzF+PFJ5cIlwEfer9zopXRJVevtkqTAdV/vkmWi5tqY25x0d3LuGTyYENdxWXzay1z5UI
	3lglUXeUdXrgV2kjosRDVsxHgPX3JmYCMkybSp7dVFiY2NtJizGeP3Ns2Zua+ztPSx29L5AtLA
	s1r4WqMcMEF5NenjfW/yptNoTwylDj+qb8oKvyina3WsNVkg0wovZeJk89NSPRf5yUzOMPXVB7
	hd4QqToWmHIoH7o5yPqPfXS+LYwCHRus+XuP8hoEESu425XNxiI+t6Xi0EnlRBN9AYDyemp/IQ
	NGk=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:31 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:11 -0800
Message-Id: <20210128071133.60335-13-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 12/34] scsi: target/iblock: use bio_new
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
 drivers/target/target_core_iblock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 8ed93fd205c7..f1264918aee1 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -379,10 +379,9 @@ iblock_execute_sync_cache(struct se_cmd *cmd)
 	if (immed)
 		target_complete_cmd(cmd, SAM_STAT_GOOD);
 
-	bio = bio_alloc(GFP_KERNEL, 0);
+	bio = bio_new(ib_dev->ibd_bd, 0, REQ_OP_WRITE, REQ_PREFLUSH, 0,
+		      GFP_KERNEL);
 	bio->bi_end_io = iblock_end_io_flush;
-	bio_set_dev(bio, ib_dev->ibd_bd);
-	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 	if (!immed)
 		bio->bi_private = cmd;
 	submit_bio(bio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
