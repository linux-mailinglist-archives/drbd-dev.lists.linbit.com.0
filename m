Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 827CE306F5D
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:28:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6C47A420621;
	Thu, 28 Jan 2021 08:28:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CEC65420621
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818368; x=1643354368;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=H5WYNiBvrNWIzR/dDsyAI0RzKPxZxlDuB4vWYUDlMrE=;
	b=X/Bfnym70YJ+Kdv+E0VAeWyWH4qjnDQf9IT3RzSc3UGDJsyKu6Uq3hOG
	q8AHJI3HeExY7gwpAeQlymPw8GXFmO6uJOkXB2zzWkBmHODfxTDTHY0ER
	xAA15leE62XB2C/LgPdXysngOzfDQ2qb+LlVxc8soW4ayncefjYow8XSQ
	jhokPYSaR4hAhIXzSxZhd9s01x7IoMxMRcbiY5pLYX8Iuqrx1KxkqqqM3
	a4N6xZMimLbVHTSOLXYzPOquo/93fMdTa8D3Df6FN0/EhrQKMBpD+yoFx
	1WO3f33QyYXYUp0A/AEwTt9ev3wRk9IA0xwY/4nEWcpDM7IV702XRlbMb g==;
IronPort-SDR: Wm6iEcJI8repOo++DrPWDobNbCAe4TWYHEM3QeByFCKiLWFM/1shgkbUKzqUmXojy8qILHGQfA
	jhRkGLjk7WwsZy+7gpUghqkRTneQ+gUl5BncfX4vwV/DbFoBIF5jzJbTk8KOxlHG7pwn31YAQd
	oyggmaxsQqyuPOfd+j1f4oIjYPnSQmy78uPFS6IyyhNvT0EDJbWITMlTQe3c2MEsrms49RZkmr
	JzNZm2uhkogDL5n3/oNpqarUrB0LoYMcyZI2Di6D+eREZHsSEwPi3eiBj4C5eJKS49bpJCAGis
	1K0=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="162963141"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:16 +0800
IronPort-SDR: w6l7rVjpejHBI8xBLIowY5yN2lVuTDaBOyNrnJdy97TmoBM02YmO/D09cP7BWUiB59KH3MSS2i
	WOS1n53ukq0AgUt13kz4IfSXfhiqq8bV56QC0cKc+eXI8gIs47FONHXFyQeg3nRA2Tnnx1LWU+
	Fo+9s98f4G6Cn+iT9dSbdjg6Hrdkx6gEmSJ4ru0SPhoccHdpcrhuEDORgjjTPQCRkb2mt/7viT
	jN2XdbJzgoGg6x9nb1AlppVnC5xkWt5t6TTENwG/z8uezAU4vDC4GQfvGF8kJmOofdZ7p9D3da
	SlNLeB2lUH0/7C+UN3vNCnTv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:36 -0800
IronPort-SDR: sJ1sB4+NIXrk86BqB2mBiNRkLb2CtaUtTUjLUptuVolKqncgiWgms0hBmEnyXBHOe2LGJgTWAc
	Mtkqx7/Ji/KEF3P2zVgoCc4AZmvUpaw07sB7pwwqNDwBZIjeJgdIawB6xDKz7hKZuinbJ6FPFN
	v+digmuqEID+qvvg+Pvdb6mLkPbYX8es6TqyRNtA6iTBnQbrstI0JA9CgrvLf0RhQ0DnF83KdI
	QwpSDAYi/vWthDgyxzldo4sKChZfQfmY/MjRYeTOvpJG4q5JRSujoZAO3KJfZIMHz0OJMVK9L1
	YPQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:16 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:03 -0800
Message-Id: <20210128071133.60335-5-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 04/34] drdb: use bio_new() in submit_one_flush
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
 drivers/block/drbd/drbd_receiver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e1cd3427b28b..b86bbf725cbd 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1277,8 +1277,10 @@ static void one_flush_endio(struct bio *bio)
 
 static void submit_one_flush(struct drbd_device *device, struct issue_flush_context *ctx)
 {
-	struct bio *bio = bio_alloc(GFP_NOIO, 0);
+	struct block_device *bdev = device->ldev->backing_bdev;
+	struct bio *bio = bio_new(bdev, 0, REQ_OP_FLUSH, REQ_PREFLUSH, 0, GFP_NOIO);
 	struct one_flush_context *octx = kmalloc(sizeof(*octx), GFP_NOIO);
+
 	if (!bio || !octx) {
 		drbd_warn(device, "Could not allocate a bio, CANNOT ISSUE FLUSH\n");
 		/* FIXME: what else can I do now?  disconnecting or detaching
@@ -1296,10 +1298,8 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 
 	octx->device = device;
 	octx->ctx = ctx;
-	bio_set_dev(bio, device->ldev->backing_bdev);
 	bio->bi_private = octx;
 	bio->bi_end_io = one_flush_endio;
-	bio->bi_opf = REQ_OP_FLUSH | REQ_PREFLUSH;
 
 	device->flush_jif = jiffies;
 	set_bit(FLUSH_PENDING, &device->flags);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
