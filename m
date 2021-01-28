Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0B306F68
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:32:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A7E2420826;
	Thu, 28 Jan 2021 08:32:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D8E6F420665
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818434; x=1643354434;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=g8HJbcPmpqxtxJgQpVgZEQpuhn8q+oe36W4m3E0vxow=;
	b=YcSNoypmpgzVxHOIUuYNRbmvEvNFm43FB03ObaV+wyfy2Fll2WX57Dwn
	nn2mpWSAQ3usdkmZ6XK6sBLePchNbSMvJ5KFVj+oC7reNdMZ+PZx6VRac
	t2SkXYdptsNcfrnwGlzusRWjF16erFklMRPYD3iXqssWRSVsf6BcUZZdU
	wU9r990FKxhMty8ZLyev8bZneAIDl7WngsGxL0KppQxCND1AfICE1gnN3
	RSbzahzP72OmkG9tlf8+s57RodbMkm2uWsKLewfmdDJzuypwn287mSZSY
	zIxmvPHMVagRIWSWW1zAQriQ6VWjts35sFQ2GRMVqdpwrd+N4W66hisRm A==;
IronPort-SDR: 7oIn0xHxyq8F/SlGQ/XkNQB4L+9lbppIHyVBzP24YmrPLgtWOYMc5a/hhI1algvN8S/lb/8oVU
	yFXuKMYTO4G9b7+QFg+SDJuHVPN7DVz0h17av1KrgKvmSac/ze4wiA/bYWj8wniFydcET9ydUQ
	MTEb/dMPifcLbNTMFnUzW7t5FEe7vDIuVXBxcV4iwsr33rBUoNvb+Y+wlTgdOdps2wN/5OP0DA
	9SvSxCfyROWZNpIUbMyP9J/QkvcydcDyXBQ5HfiE469Nw4S4OAp6sl+lZ9niqt1eu/Pw6xmUYJ
	VHY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="268892448"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:23 +0800
IronPort-SDR: e7WqlO880gatD1gZN43V/SoujfxGzgpbv68QwovBGH4u4iaGrWgDb2FWiG8FYk5/+dwklOcOrX
	nb+chgsvLm+PBzAYPnKDUpd65VbyZrC5FraZhE3/jy/vWxIW7xNSyNV54GuAZimOhQKMpQt1bo
	df4JRbhGFbaJKK/5saQypRu7tbqH37dN9J8Y1SrT2bOW8O1RiymHcT7/ACcxR5t9l9wlxxO5kW
	cucmCLV/0krd5EN5MODlqr7ye4mtzl6NebtAjJFPmrq9qyP+QkRr8z4zAPvI6D76vQPOfD1pWy
	9QE/Z5xCqGYslDOEkMLVqFqc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:41 -0800
IronPort-SDR: S7K4kJLXzJBN+TtdhPMN6TP/Dffs+zSa3G/de5+S1/PIJxe5GMDYhILg7ObwZaeQtAx8NJxvkl
	nIc5LC+mPpv7TI+pptGOuvqvgXc2tzfVFCEyc5+LFgl+ipYQILMS5NCsDr+0Wgl54XSWETlfzh
	gHkg4ZggWJkUuTGFtq5ayNdqurKZ4tOlkNjJtnTH4tbAn7NSWqg+Ok++T//Bdn23FoUZxk+NbJ
	AQUU7LKb9NmxAxDMj2VCc1ROkgf8sOKgTR+MW0zxXzuua4VhN6N1CvrlPe6fa6RhDqhXPf7MuT
	aTA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:23 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:10 -0800
Message-Id: <20210128071133.60335-12-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 11/34] nvmet: use bio_new in
	nvmet_bdev_execute_rw
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
 drivers/nvme/target/io-cmd-bdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index bf6e0ac9ad28..f5fd93a796a6 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -225,6 +225,7 @@ static int nvmet_bdev_alloc_bip(struct nvmet_req *req, struct bio *bio,
 
 static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 {
+	struct block_device *bdev = req->ns->bdev;
 	int sg_cnt = req->sg_cnt;
 	struct bio *bio;
 	struct scatterlist *sg;
@@ -265,7 +266,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 	} else {
 		bio = bio_alloc(GFP_KERNEL, min(sg_cnt, BIO_MAX_PAGES));
 	}
-	bio_set_dev(bio, req->ns->bdev);
+	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = sector;
 	bio->bi_private = req;
 	bio->bi_end_io = nvmet_bio_done;
@@ -290,11 +291,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 				}
 			}
 
-			bio = bio_alloc(GFP_KERNEL, min(sg_cnt, BIO_MAX_PAGES));
-			bio_set_dev(bio, req->ns->bdev);
-			bio->bi_iter.bi_sector = sector;
-			bio->bi_opf = op;
-
+			bio = bio_new(bdev, sector, op, 0, sg_cnt, GFP_KERNEL);
 			bio_chain(bio, prev);
 			submit_bio(prev);
 		}
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
