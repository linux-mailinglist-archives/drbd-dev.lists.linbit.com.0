Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90B306F1C
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:26:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0164F4207D9;
	Thu, 28 Jan 2021 08:26:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4621C42061A
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818335; x=1643354335;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=NNQh//SoJS4GqMqJS7HaqIWs/nAFaMjGpU2K0hvKGW0=;
	b=cj9TkccX2vFJNueWS66yQBUmlHCGLok05pZYfttxdEcm0RhVHX3Q9GPt
	ip7VeMeNjmv0KGHyfu59VWO4W7EOXFwbp6LUOmHWk3UHx4+tX3ucJUIPI
	KAgSF/77PWO/G1foyNZiRw162N6+/hm9hfWMUr6+MxLmoC44r+ydmBWEH
	X3YQo3nfmKv+OoeTKC+JhxGxoTtGDUNS5ya7VfpQdqHYNsvZPN0bsIUdY
	uAycppqg+//GVzC/te4QObSFRBXbNYyIdcIlVdrrpz57IBZ2HisFWScko
	UWXvI8X4iop8hIaZH3tiVESaPmQTZ5405LD2bkaSof5mRxMQrCQZeZ86H Q==;
IronPort-SDR: aLJTL81vl3GZm1+seGmrD6JIx5fg2RkafwPsd7ft4Ys0lLE9bjsWBsuIptUQzvi/LjeX3E/IsQ
	8F7WYZ3lAcleHjFOJsbFaoWbTYjZ3tW8NOO9eaX9T1YIpKJDCyCTHa7FwI3v5rFKe6O8gV8F+I
	MlakDTEDNbrncIR12nUj/cYyII6R3XeCBpC8gOO7sOUyByzbUAMIjVqoZeeK1bxhZ2UU9AxjZY
	XIA1NAUBD8Oh+5wYhwMthGsdrX5lgVShpUMomvbX+AW7NDOPum7lwYo7QzYau/ZtVI5XYpz1Q0
	Kog=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158518451"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:48 +0800
IronPort-SDR: 39HbOE+CZPDleC/nKqOF4JIw+fWpggFPxjVUCeA7ertO5AdOMTXdPa3nOQnL6dNfJKggS/TNrE
	yfpqDIYjaQvddG1517kAlz1+YyP9GA+F76VGOFpPSmUNxEH6Fbxr8oMff7v4VJnr/miHJobK3f
	1UXJLroEbmn4UyXMn4XT4jZuA6aUS0VWgjXY19p0UHkMO9jL9ct7BemZRJiyoSILLGe0iMZ2st
	Kvq9pPn0GQ/Qo5QEsx7ArIASP3NAc6rxavPJASxxL6k5KnU0jfWgjRimS0lB8a4njIRzZpCb8P
	+//j4zK6S6pN9h7bcPvGFkXv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 23:00:08 -0800
IronPort-SDR: QLHAdyBGhpMGQ+9sBMvXF0omk88B/E7BRqUoQLtstkadK8XTqcLBOvZ/pjpZSQe5Fab6+IJLIs
	ck58Xl2YqFxcQH934VbGmHAxVZYNpxUZEqIAo35K+cwpiHURts0rCHDJ2TNufJwwd/0szVEfZu
	V2kbFpOqLyVucrhtvqpRhrkBznCSCkx3a3rZqsYu2xJ2ZrJKihugfXyvxYjD/F6eNL2QYyPhq5
	GySOsYgZ6Jfrk4o/qsLABBe1b7+pVB/jDQ0aaMBZEhc+3I3KzSll4D3O/V1q5DDbYD+ht9Zxf5
	kSQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:48 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:29 -0800
Message-Id: <20210128071133.60335-31-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 30/34] hfsplus: use bio_new in
	hfsplus_submit_bio()
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
 fs/hfsplus/wrapper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/hfsplus/wrapper.c b/fs/hfsplus/wrapper.c
index 0350dc7821bf..8341ee6c9b31 100644
--- a/fs/hfsplus/wrapper.c
+++ b/fs/hfsplus/wrapper.c
@@ -64,10 +64,7 @@ int hfsplus_submit_bio(struct super_block *sb, sector_t sector,
 	offset = start & (io_size - 1);
 	sector &= ~((io_size >> HFSPLUS_SECTOR_SHIFT) - 1);
 
-	bio = bio_alloc(GFP_NOIO, 1);
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, sb->s_bdev);
-	bio_set_op_attrs(bio, op, op_flags);
+	bio = bio_new(sb->s_bdev, sector, op, op_flags, 1, GFP_NOIO);
 
 	if (op != WRITE && data)
 		*data = (u8 *)buf + offset;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
