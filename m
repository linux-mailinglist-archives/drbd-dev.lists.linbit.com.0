Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3F306F61
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:29:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 13DF942033E;
	Thu, 28 Jan 2021 08:29:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0109F420634
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818385; x=1643354385;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=QAiSNZxQXn+fhhqJHg770cKqGnQ7j5esbXKR/QGBS14=;
	b=XmilOkFKLumLIGDNlWtjFt2HfM59ToIpJjSG5ENQ9GEcYs8sTATBsAVn
	iSOU0t7zDc1ikGifVf4/hvA4uB/bagTAyb3JswIEaTCg+DIY9+Be4XxR2
	p6JRMTQZiCpiKLQyYhbMF7gvPb7wYow1tPjqTxvQ+8x5J50Xr8hSXrIPe
	pCJCJ0CrOt3RVSsmnaS9oDjVR1cmDP9n4f78p9qKpCO78J98Z1Ly86f94
	3uoF5E4jdSLZQkjy7b4PDYsQaYI4wXm0PxW/kE3GSGA2MqxXOvXrCElqJ
	YKubfzYvFLwWTycwZW11fnnGfL074U2WPe1uupGCiFxsJezgZsRGyjQ3Q g==;
IronPort-SDR: 099DSF1KCB5MNVM7aOWVbQVGanHgDR6KYuxltsL5ipK6wyqTUSO7jpK9voZhL4T71o/8/zOJwZ
	W/raw5ief4N48kaILQhCYLTwwF72DH2t4wb50jgWrsppRu7m6Fya9pDOtMuSWS4nt9qTNQSWrB
	mpM5ACqjt56a6CEv6Fm8M/Y6UbRWuD5GEJgsiZhb73ak1I34WB0GbtEwVJ6pfOZLy9RNjX2kgT
	zQ6m2Liw6SPe5v0k5wbM0iPwLmEgFUG/WQ2VJQFsXzbY/d4rWJqHCH9OP+nNPXE090Q6/AmR6I
	urg=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517277"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:36 +0800
IronPort-SDR: 88TLvj0Qyn1QTMOQPMKKWKU3jE81qr6R2+TsYjfhVxLY6u7Qo8pb+8jTsxJqlmXrUcazxePwVi
	+eTwbox6L7g9FGsCH6zq9ICUs7yrBoh7ZmNfljeqRZBP5oGC3Xr2T5gSldUMDrAmhdfRgTA5jR
	K1JaRKvS0R+12Qzyam6OduGCCP7Iy3nZXOROcFzI2oAG/9JzBLZfvkzSHRnhfTFgvzB+IcaKVL
	iPIj4Upe2xFsVqndud+gcA7I6GLNUIzalJTLa1S1KBbOGdunfmbtgyUlarHBH7a4gWnnHoNOJG
	c9B20DyM4gv2RdiO4lYuCAk9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:56 -0800
IronPort-SDR: Luc6lg4Pa+bVHOb4HzkXJiWLGqMg6JC6Nyg0Lqb88ZIBDNylXDUPHvAGuri+ui5nWB8hV8jug9
	qFWTXFaOWHAL0oehOyPdERabJ1LaG9aVOt3b6RTgmVCVF9xZaJrmkG+mjzow98LgNG5t1Hjoni
	gqXmojTILo9AyCGo2PpCozas3remWiyjnR1rz1m7Heq2aoYdQ+f2mWDUtJhIIR3UJyQKknW4V+
	XZO06It7hG6XcBrRwkAZf9a8HSkB5bDSC1ddzu75XBYoKVtN9lipurMfP/HgqVuXVuz/kSCAwn
	InQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:36 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:05 -0800
Message-Id: <20210128071133.60335-7-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 06/34] zram: use bio_new
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
 drivers/block/zram/zram_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index d7018543842e..5d744e528d4f 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -587,12 +587,11 @@ static int read_from_bdev_async(struct zram *zram, struct bio_vec *bvec,
 {
 	struct bio *bio;
 
-	bio = bio_alloc(GFP_ATOMIC, 1);
+	bio = bio_alloc(zram->bdev, entry * (PAGE_SIZE >> 9), 0, 0,
+			1, GFP_ATOMIC);
 	if (!bio)
 		return -ENOMEM;
 
-	bio->bi_iter.bi_sector = entry * (PAGE_SIZE >> 9);
-	bio_set_dev(bio, zram->bdev);
 	if (!bio_add_page(bio, bvec->bv_page, bvec->bv_len, bvec->bv_offset)) {
 		bio_put(bio);
 		return -EIO;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
