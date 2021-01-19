Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED322FB328
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9B5742062A;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 309 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jan 2021 06:12:54 CET
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 90129420331
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033174; x=1642569174;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=kJ/YPi2iVTGzPyZ1PMFgAIrmJoIDh2BG4oTkefPeBOY=;
	b=BDxnQV4ZL8gQCLoagaYFSRn1CGGRvpvJKqi9TdwiEYPmWutK4JH4t0lI
	k7zNySfUaOUnOiQ8jWT1S8hKcr0xqAmehIVYSEVa1VomsKK+6x83aE7yH
	22Os8Wnh8mF0BbDih9408FXsNGWaBJs3lyFdj8IWfMStsAmcFH8ZHqO3S
	ESgZAObQIU4b6RTCugY7LubOQVkLM/7k+Jz4967AYw4u+sdjACZq479pK
	/7WFt7+HEqWoseQgaJc2MDnKsl8v8ni2FiYSgflPMQ7gfjgB0/8FBNPLu
	Jah+yjBIhjz9X9YtVd+OtaJWh9hIwX9NEbYdlb9CXYVrXKqefRkXdrI1T w==;
IronPort-SDR: ozbaLXJdcMFyfFdNqMd0CX3J9m2ZBfG/xccwniuPmDU652WhkyA8GiQ9Wv0IJMHncv1bkmbMrQ
	8eZm4bHjEHPHh/Iuz6VcbISBlxY6lH8cWVoLmKT1lVehPkXxL4M0wNYiwOZqh6aNqUvwQHUhMQ
	94pAj/LWGJqyzq26YmAfwfVlTCNUMNg9qjmREvpoC1ksxNKzuRL9Gs9gXQSkgNw/x7B0eOqGgm
	ruH0ivb4vvnmNZOC+DMWUhCx1/EkopWKm5IHmaqhQF2qUmlUkYBmvYNVMhdkP5DPIsLK5CEFo2
	v/8=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940692"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:37 +0800
IronPort-SDR: vgu1k0XDuZP8auIu4CngvcM2nbWIflxNIPWE12n0fhUp1kHFtoceM29nUqel3QsMMdBUgvqenE
	eNZ3nHcu2ys1OMQpWigxkqirKn1EJHbu3EVu0qujGnxV3R0JqVTl1n1hw0m/yVhT5WdmRJH1Il
	1Moh5RjIFcza7yQu5Oi7aZWB/4gt3GeLgIDhQ+IqiQIbYVCVRFntIzVtu0rQoE45Zz0FoCE3nq
	4JMEZEyMM31OwzH+R6w4XfMlBFZbboKw7PL3Th4ufctaV22ICXftMgpz8YzxrZk4gnPJAdBQuN
	4l9u+35OvFosJTJqStQARgrp
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:11 -0800
IronPort-SDR: 82udVg0tcJR2e9Ov1+A4/XxfwUpr6AnnaaUrqXRQiZStYiKcrlpKU0DkZ5iMbm8iZTvQAtMZG/
	I8wyRE90NxZichs84bJgmmJzLP0cByQHps51BWtoql+dpr7gkHTtxNhSfv63hHFg3HLCAOwaZD
	+dt9xs8jlS8ttjdqGabgZ5alJdiHqr1V7WKaF95Pd/LIfmh9EooiqLrIPLv7qKKLiQaaSOFfaR
	3ilv2AB4rQ3+1E1OdOv6+VBj6UNe20rcRhCRm3hgKs7Kn1zftFTr7vNmUA+PXjeDeKmQalWZYt
	Kyc=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:36 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:19 -0800
Message-Id: <20210119050631.57073-26-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 25/37] dm-zoned: use bio_init_fields
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
 drivers/md/md.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index ca409428b4fc..b331c81f3a12 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1001,11 +1001,9 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
 
 	atomic_inc(&rdev->nr_pending);
 
-	bio_set_dev(bio, rdev->meta_bdev ? rdev->meta_bdev : rdev->bdev);
-	bio->bi_iter.bi_sector = sector;
 	bio_add_page(bio, page, size, 0);
-	bio->bi_private = rdev;
-	bio->bi_end_io = super_written;
+	bio_init_fields(bio, rdev->meta_bdev ? rdev->meta_bdev : rdev->bdev,
+			sector, rdev, super_written, 0, 0);
 
 	if (test_bit(MD_FAILFAST_SUPPORTED, &mddev->flags) &&
 	    test_bit(FailFast, &rdev->flags) &&
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
