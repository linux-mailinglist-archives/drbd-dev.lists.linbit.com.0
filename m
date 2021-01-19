Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 097DB2FB340
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E09E4420820;
	Tue, 19 Jan 2021 08:37:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B0342420331
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033335; x=1642569335;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Cfu0m5VKAuNxHu1l31PcK7nm7GIw08f0wSHX5FdYb7w=;
	b=KVFBW7FkMUDbOWcmML1O4JADv2IeBQnHw+fFKbnV9oLuRuEU/yaBq6H1
	9SLPCFZpwXvRPZEALQCpLxcBCzghEzvxs94sdEDprcHp9xXcYa1+lGA0s
	eTeVbZ+VxvPzpZpQphdddnsKF85bMdWEVPc/2nyO0/0TKxqK9EPBSxG8N
	CsbGE37uHTs94t+nFJcPtd3DtNtbqzAxaDTYTLuoVAroD0yvtejcwT6Cx
	0Is+XeyhbmNCPqgbarfJPN+uAbVq9KF7HERlkfbAvBcru89KFAQoNQla1
	WlS4IjfNhhOvkJ/koTJ/9B4hO1ly5aMbyBrZxqZUPRwlytySEcvu1m82o g==;
IronPort-SDR: i0afaCrk4lW6LTAOpnqjdAjUlgDri4bIFbEbkKRTh42eJZtI6+MWHxbhrA+TNptxcloP8vfKyk
	E8vxRD0bvdealnisTWM0wfeFEju3/isIsUNbmDLrDC6p0fV3pxgZNa40GXR46G1akGWjrQq4do
	ix5eUR+MTn8p9ceEwzILur5St77o4nOmDir7eaAglzlQ69bFf9hHtrFcF35hZMYVYUZwg7QJ2q
	he3EfJCflwqElFobUg9WxJbJTSC+aHm9x5sSrHTaE3eWFM+DBbtFkVxHi3Go/ZO9X9gI1kN6re
	Xwg=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940550"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:08 +0800
IronPort-SDR: FFSIkTqM9UPTmX0bVHJyGIuEUHvMPC7DV8rxsm00N/m52lyNY21ifiUkUH3laiW/IcYNqwb4Uy
	pM3xU4u5V2/W5kX1HZcqz7q7NqMaQZsT5QEH6ChOxp+I+fcAXpqIiRHcIfXqii0mHIyo7103t5
	xwYKliEGq+OokVZWUjRSXs7Tbxs4OoFoO+A4h9uzumoWuU2AJgFnQQ0YB7WyrwPglwPf2YQhHX
	28LYqlYI2XNTx08yP9h2nuFgQ5We9LaCBNStvHjV0wtNye/Q96bYwWUctBnkYpSf/hPYaWwC6c
	IwdBUA1xADtldvy3CGpEF3el
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:45 -0800
IronPort-SDR: BI4IRRImuMT37W/0fgUHv+jo9/cFXOLHBSkHLB71uXGRhjXdqsMAnoeLSicBDzNjCtXE6Dh3IX
	0CYkAjVxbNezhsYqTHeC7O5MKiUI+nte0sRu7g2EHJnUc9MH1BYN8otchvz0lbdHnJk4iU7F4c
	WmfRkOrAtQMZI0QoGyPGUddwOVe1ADf9CPub9wyiRWCIGto1nEeON+Wfy1+NBrAsdMrCFgxnqp
	vom68oJ4IlK86VNF+Hzp5EiJIZpEBG12SHeKkbAPc06Spul2+gAW8LkpVcP5k8qn/tXfmApHrz
	H7o=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:07 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:07 -0800
Message-Id: <20210119050631.57073-14-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 13/37] drdb: use bio_init_fields in actlog
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
 drivers/block/drbd/drbd_actlog.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index 7227fc7ab8ed..733679cf456b 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -139,13 +139,10 @@ static int _drbd_md_sync_page_io(struct drbd_device *device,
 	op_flags |= REQ_SYNC;
 
 	bio = bio_alloc_drbd(GFP_NOIO);
-	bio_set_dev(bio, bdev->md_bdev);
-	bio->bi_iter.bi_sector = sector;
+	bio_init_fields(bio, bdev->md_bdev, sector, device, drbd_md_endio, 0, 0);
 	err = -EIO;
 	if (bio_add_page(bio, device->md_io.page, size, 0) != size)
 		goto out;
-	bio->bi_private = device;
-	bio->bi_end_io = drbd_md_endio;
 	bio_set_op_attrs(bio, op, op_flags);
 
 	if (op != REQ_OP_WRITE && device->state.disk == D_DISKLESS && device->ldev == NULL)
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
