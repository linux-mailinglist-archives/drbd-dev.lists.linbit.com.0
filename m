Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA82FB339
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C2EAD420804;
	Tue, 19 Jan 2021 08:37:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE11D4205FC
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033306; x=1642569306;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=HPCbLSlGMOVA8XHM+WRUVNKbwgmkWpn/wLxwGOm9s4Q=;
	b=o+9nK52yHbwLmLA/clvoySKLTPlPxzHICCXSuRbvY9Jus4MrYqZ2xjKS
	dPb/+exvF2GOmfkZ6wCfuZTmNRAt3nD83kQbQFoHv4gIdqQ6ZJ+Co/Feo
	40apSeZISZjTgFFc7lJM5HjXvX9NZqMZVRfUJCCn+DoIQHxZUcyzQfDYo
	MkH1HvDrqc6TQijSGWgVeHFeAQ0FEjb7phwaOGcRSaum6itvrTUMTug2e
	lXBWDvOyzMsKw0uBWXoWHo2znXK6Lo0fhofZTg8RkqCrsKFW12cW2YoRr
	1nCFk0icA8kwO/sMwq3AyUYhXxx0++hnIkIEpKWokVG8gYpb6fLx2/EK4 g==;
IronPort-SDR: m6dTGj5VnId5ITgrXdDcDlr/rPQkSSntCtsxdyhJ2/lBXrszU1vWYabGMl2H6fgSCeQU63alvf
	KtkSR0CQi2psLk2a+e0ujWVtiWbzcySIUocgxGzvsPt98FPaFHj61mRrok82gdR2oB93aLiNAY
	bnsv4w2rOelrU7zHmvI/KvT1Bav4ebOAR2SwuzF8A5nFbT2km+7SB6JtB5YAItWIsDAxmBxtCn
	GfDeotjy05D3kH8ppf8VUB+qMEyQJ9S+aA//DV8jOsVRNqhQ40qSCXN6+gkimpzDthDdjfpNiu
	Y2w=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758575"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:00 +0800
IronPort-SDR: IzLMCT6xhlUGmhj2GeO0sdE4QRMe20r5EqQfyR5jWTmZJe0p8MgKviac9RJSy4O6fa2f+5Fx/1
	1sEHMw49pRlNvKV3sRsc/RKC4t8sWEN0YZXk4bpNcGDpxEPOrEM0thvMQ+n9YbGwfleDrB9/Yb
	KCOsRN2KJDGcLEAHhfo2nok4x/BT2PwXq20kZrsvQm3KCtcnhcgFhq18WqdNs4V+FVfwyC2cM2
	jG6EmMyYrenoytWa4dyTyk4VCDPo/aeSusbz4Qas2GnOBGY6MaIkvzwHZeAB+e3JCvvO32rgYY
	KIUGHfKHHl64W+hL5sMdmYcT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:36 -0800
IronPort-SDR: Cc2iHwjkEjqCebjYIHV37DmzL2JFDCj0LnxjeYf49PHxyiTP2NZ8nzuGBtZ09ViDWUZ8vTYdRm
	J7nrWhdEN+gCgWv2vDuDE922rCxDY7IuzkLO5tibQ98c7vYRFbD3A74b0I3+FCkHZc9iInjMsk
	ttUysIH9YFkoboXWQTeupwDS6z808YvuNNjY8dANldh5XCHFY3B8WggCGXLgt0OA8lWiQ/lzA1
	Zb3dL/Uummd9+zxAUamqnmJw4K9zg4dg1fijcGrmDnJua/9hMwt6DOXhCDJInxE1KS7iThFeH9
	9Eg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:01 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:06 -0800
Message-Id: <20210119050631.57073-13-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 12/37] zonefs: use bio_init_fields in append
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
 fs/zonefs/super.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index bec47f2d074b..3117a89550f6 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -682,10 +682,9 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 	if (!bio)
 		return -ENOMEM;
 
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = zi->i_zsector;
-	bio->bi_write_hint = iocb->ki_hint;
-	bio->bi_ioprio = iocb->ki_ioprio;
+	bio_init_fields(bio, bdev, zi->i_zsector, NULL, NULL, iocb->ki_ioprio,
+			iocb->ki_hint);
+
 	bio->bi_opf = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
 	if (iocb->ki_flags & IOCB_DSYNC)
 		bio->bi_opf |= REQ_FUA;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
