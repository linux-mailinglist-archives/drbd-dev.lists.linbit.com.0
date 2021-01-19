Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E92FB330
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F4F64207B1;
	Tue, 19 Jan 2021 08:37:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 16AD642053E
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611034117; x=1642570117;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=L+Yd1/4O9mwEd1BMH1dhU7y2A0Eiek2poS1YnEOWuVY=;
	b=AzvwrHXO/Jh58FU+cpk8I5xtfnlmMOKLk8JTNUYS0v828u0orJQc0l44
	2csattOH3imBu+tavICn+EgX2ZalK5OWuSxb9qWiB9S4uaHgvzgG83xd7
	csrQ+5372ldy0q9UOxiIOztQHXnTVHZqLjEkhps6YxnQ8CfLhnMC4KxS3
	zSDjSrFgnD9iBg/DxOrI6maEn8M5F9GmIIbs9hY05mdFkg4fjpwVMP55n
	7orKD5vfqj6z0nabHcwcyxAE2RUL7P8Jawm0EdiYufOIJ2RiMZg670sCY
	Doa/WqJ+uNL7OVRgDUHyNnk38P8iCs6WaYgJxXbKkiTcCU8iBzR79FPRC Q==;
IronPort-SDR: y8mD6liV9SUt3Q8y9U4EVFTV6icL4HoLacUAfg6fdE9QciAREahKR0NbL5uoRLbSGBMdwTyzn3
	C84mjVctGMOgbwUTAptmf7Rz+UjCYdAp9Iqj4nM0rDKmJQREBLb7exkh9tKTOu9jBl57y2f949
	Hcq95IPqtH6XnlVL/d3s7w597f+jptGZ0h2nY06H/w9Z8uxWiGpPS3RUv1ggGLAlFkEcj2Q12y
	n8e3d0LNl1DZidTlDehdOPfmc9yK8k7xxv0elaekdnaXpSAU0BMD8dGW5sCzlh7w7BsRtNseij
	vCs=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722376"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:20:41 +0800
IronPort-SDR: T3ZrebXmhOISwp+9N1G6P6crd21d3uJBiPOxPu4G1KhRxujwokkWeHH6HQXVb8lGnYHjEstVmw
	MnGz/JYO6dxzmr5RzUARPyCQcgSJ69ZPn3FWvZPk5JzL/OY1X5hYwK5ClcR8uK6aZhcbvHHVO2
	Y+ZtYJlu/UkW/Y6YHERpH1e/pkKAhoNp9mQO7Fpe4RI3kbqO5tD7rHxrEKCDCCe1PAQhg4CVwx
	KPUfhMR4rNGKAbiva8/1FSh/96pSE9Iq94eDLdOTGvDUVVn2YYzPKZIfBCRTVn2GtWZDgQhfge
	hegQOMSZQ6GfItu2c5eWcZHA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:07 -0800
IronPort-SDR: X2W/WReUXrAfluwkD7se2dZ1819ju1OynW28uTSvDSLN2ps3wO1qXeL0GJaXlJKwpIqaALDMhb
	kimb7jLOr+gpWYj06rWyhvZYDu9+2JsUCLwbEquhMfnoBM1g23E7vbj6QE5tFPT0RXTnWA/1bR
	1HmN0UVHZv2jYDXSsFNmf+lCI3bFpzj7XxZ5y9GFacGpyfKADcPO/cyDwrim/4xYtJ4n8KmXYm
	LOaLwIRAOFVmRCvuPUSpoWyGGLooeoj1II+Syix9yI2u6Xeh/1MmoJBsJ6CUrYMQLVvvA0Jyzk
	ZqE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:29 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:18 -0800
Message-Id: <20210119050631.57073-25-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 24/37] dm-zoned: use bio_init_fields target
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
 drivers/md/dm-zoned-target.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 697f9de37355..8b232b9e3386 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -129,14 +129,11 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 	if (!clone)
 		return -ENOMEM;
 
-	bio_set_dev(clone, dev->bdev);
 	bioctx->dev = dev;
-	clone->bi_iter.bi_sector =
-		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
 	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
-	clone->bi_end_io = dmz_clone_endio;
-	clone->bi_private = bioctx;
-
+	bio_init_fields(clone, dev->bdev,
+			dmz_start_sect(dmz->metadata, zone) + dmz, bioctx,
+			dmz_clone_endio, 0, 0);
 	bio_advance(bio, clone->bi_iter.bi_size);
 
 	refcount_inc(&bioctx->ref);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
