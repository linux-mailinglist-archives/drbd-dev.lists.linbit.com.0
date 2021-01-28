Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EC969306EDA
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:20:06 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFD9B42063C;
	Thu, 28 Jan 2021 08:20:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B29DA4205FF
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818241; x=1643354241;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=KxHF3VRS1HdpvW1dkgXeP6+bfyoqSsbsdMU7tIvbgNk=;
	b=bALs/mSsHRYfgxMPhZSpHkUbSFtzqyKAiOx/ENsMGTRBKeRA4mkEFI4A
	G9u886gZVbGrhOEeaBDJwNae3FuUC3EE19DJGgRrVUHDGV8w5CRvZeV91
	CsVyFR+VdxWpTv1J51w9bYlf27Q5WDOLJE5KAn00uOmqsM70aT7vmb7kE
	nQe9sWTOFz2tejanmb0X9D2MOuT5RgOvfuCAL9Wsvau8/8s0oBnDjBmJZ
	pr9md7vTOEDqsFnH9OpRhERC4uXls/vzSr0umPKy9iyIeiqHtsJtD63b5
	MN/MerGLZoLNefuavKkKhsKZ9fH7lZgYptQMsj00cutLjRYN1Zmc8QoLZ w==;
IronPort-SDR: l5MKo3294TQM2qDXoQniNmgTkOgZNhFU9rrqzOIz4JXXs+skOTsB6Bv4Xg0qcj4nQVRJEL/Gh6
	lewEUqArUvB033/UieExIUMQELo0nNiS0ITT/9BXjrgk+3qXsploKVKwG5v+mRWahG7nAQURCx
	X6l3GYwr1STAF5SwZbhreX/NjOcErlCSQOO/+7/r8puDcM1z4mh2h7rC5+n31GBoT/dp8dqIpJ
	yPPPPyMBCjGjbc/ndgIIlZgFhH5MVsNBIfGIMU7ObY1Ti2/+1LALAsQlzLGRjZYHu7Aark2RBU
	Lto=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517602"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:19 +0800
IronPort-SDR: EnzsCcJ8iS+3xMv7oWnKKrvz5HU4L51wXmbxXz1oXnIHJSquY79QLy+IOBAQuIVe8J4so8oCFy
	M8DcAD0A4TA+dkK2kSIeRei3leUYW1TVaGiOlxQyegdpVMrfI2C/v+trActTjEjY2bb1p3d7EU
	ZMmO2NjwMp/KEUeS/bY1oZPo8guRFqPO4FYKaTFzYS2vdjjUuCr5sR8RVW+78InM5vcubejuWb
	SEVlDTwvbnP+BC12MrTlmBM1M/F8esesRj99dcwaXKmX41y5LWRYDvubsA0ExmkPQRvrd82Spc
	TWHPV49Rzv9PvFiJGakln6hn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:58:37 -0800
IronPort-SDR: e2VgktU8Igp+G/4kwCau3Wofn5lcroMY0YPC7tNcu39YNL7JBNMa1+cKXT86WcuzihvSj94J7W
	8sv8AfyOojzHeLFV1vgVT8Pm71/iwcQAmabu9Ufd/jwBkzWKoKpTzhJn2DWIwNp2e8mqIx3G5A
	LS7tN5JWZnYOGTkwZ/LMhdAEhsm6g9R10Edu6WiLHx+xz1R0nO/OSJcMH5j4uo+XVYn8ORNhbv
	mynrcW4WJ2Z8dThUFTylCCg25lF4TIegFSZNE+eSh2Iz0rquG/Dk4lImC2ZggxF5isWDJ8MWSG
	Bw0=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:16:19 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:33 -0800
Message-Id: <20210128071133.60335-35-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 34/34] mm: add swap_bio_new common bio helper
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
 mm/page_io.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 7579485ccb5e..cc30c9a0b0a7 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -287,6 +287,17 @@ static void bio_associate_blkg_from_page(struct bio *bio, struct page *page)
 #define bio_associate_blkg_from_page(bio, page)		do { } while (0)
 #endif /* CONFIG_MEMCG && CONFIG_BLK_CGROUP */
 
+static inline struct bio *swap_bio_new(struct block_device *dev,
+		unsigned op, unsigned opf, gfp_t gfp, struct page *p,
+		bio_end_io_t *end_io)
+{
+	struct bio *bio = bio_new(dev, swap_page_sector(p), op, opf, 1, gfp);
+
+	bio->bi_end_io = end_io;
+	bio_add_page(bio, p, thp_size(p), 0);
+	return bio;
+}
+
 int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		bio_end_io_t end_write_func)
 {
@@ -342,11 +353,9 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
-			REQ_SWAP | wbc_to_write_flags(wbc), 1, GFP_NOIO);
-	bio->bi_end_io = end_write_func;
-	bio_add_page(bio, page, thp_size(page), 0);
-
+	bio = swap_bio_new(sis->bdev, REQ_OP_WRITE,
+			REQ_SWAP | wbc_to_write_flags(wbc), GFP_KERNEL,
+			page, end_write_func);
 	bio_associate_blkg_from_page(bio, page);
 	count_swpout_vm_event(page);
 	set_page_writeback(page);
@@ -406,11 +415,8 @@ int swap_readpage(struct page *page, bool synchronous)
 	}
 
 	ret = 0;
-	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_READ, 0, 1,
-			GFP_KERNEL);
-	bio->bi_end_io = end_swap_bio_read;
-	bio_add_page(bio, page, thp_size(page), 0);
-
+	bio = swap_bio_new(sis->bdev, REQ_OP_READ, 0, GFP_KERNEL, page,
+			end_swap_bio_read);
 	disk = bio->bi_bdev->bd_disk;
 	/*
 	 * Keep this task valid during swap readpage because the oom killer may
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
