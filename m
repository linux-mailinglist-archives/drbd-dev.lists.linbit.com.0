Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBF2FB336
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:16 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 157964207DF;
	Tue, 19 Jan 2021 08:37:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4D93E4205F0
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033304; x=1642569304;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=GM24flI6Tk6w3xkQ30UJmV4QFWXT/JYAetQgeL9KGII=;
	b=cTAuG3cYvBp8yKZvKrFr5icFKwGX5EOXtxXl4NzWLF2MIuHycekaCJUb
	X2vhnNaXlmeMTyw4aSPm6/FtIytFFxRJ3VJfvVXirDfuoqCcd4/UKM9pd
	HxCJ37OQd1JKDbJx/e/vT1tKAdlPWNdvxgsVjFtQ44Wm/073MSHBb/i/g
	9I87YA5uRbOioQWqi313HfNnmo5mQTFnaAT3wKMKFS6zQgG0jjyRXDsr6
	LAMAGrJOLz2gdDBtDeSGScfC+vXz64DIiADyv/uZOFW9zeEN3uslptFS6
	ojGsDnEUVw33lIuqjvIC08OpDPVZZAeyuv2Ct6OAoLiN4/swmfz10XNgx w==;
IronPort-SDR: 3Y8SqD1St9uI6xfGU3JeuQZD7gE83ZbBOlgsU0kxjAe+RqiILLskrmDT5mJmhZ76zR7Mo4UPx6
	Ff7LzsKBM/EUJRwbt0N5dxAr2GWd/9Rdb//fuVgJcd3cfKrnNQEoBHA7BsMlxggqtfB2Wv7mii
	kwehVeu3wmZhwuFqynDm+9aow2RJcRtjiWRzY386Dh3PCGo21sQRzJHyK1qjwYBBOHt2uff8I/
	1EVyKXNCu6Kxc35uBRdYg0qohpfrHNtp89cKOtxaFfutP+az5u7kqvugk4ePX2R1tTxyP83rmA
	h3I=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940509"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:48 +0800
IronPort-SDR: izRnaj1FTifANodnP7HEB0l4xx2xVJRu0uPy/F1FITgcz+lsSYdphWkZnAaIKqo11Dixk5uTz7
	Sj7n+9bhT4NCEicQ7L9vk3R8lb0z792Ny/Wufm+wNMt85C4cd3LV1kEm3Oldhbfau8fDQbWMr9
	sq7/30v9jh28rz8qLCp2teDNAJiud1cqNShf003Cd+R4VcfwJkhkEeFTw8oaDjrCpD0CnQ1V3k
	HjqZICYrJFYj4i7sk5ooqnc5oKNnGiHy4dzhUBdjwGJz/w7qRFjb7rmKU4/t+Vq+9r6Tza/JX4
	XC5QRJ7GmBZQJRs94fFCNaHz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:22 -0800
IronPort-SDR: z0ZW9dyPTLw53eARwPq8+5nuJJ+yGnb1S3afLxWS5cRMuD3GO8FzJcyb/494viUnLZ93FPHi6a
	3MdikG0yU2ucYS4a+pszMPxdsf3jMw5J2ahGcJgTTzK3LHcPj0MYZR0Q1pR6fYTjIlk5jXhiBg
	wsBVE9/ViYCXjpOk05UySgjB2d/pwdD0R6sXtZQT/+GSCaDzW5cIOqfqIiFsiuqf2/hNL4trLe
	wWdFviDzfdU8EZetm7X+/kphay2DvflOFtCnqYvJIkQCp+kSJnhyMAhfqOGFMVkkVdPhO/0qgy
	FxQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:47 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:04 -0800
Message-Id: <20210119050631.57073-11-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 10/37] iomap: use bio_init_fields in direct-io
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
 fs/iomap/direct-io.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 933f234d5bec..3756dbf51909 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -190,10 +190,8 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, iomap->bdev);
-	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
-	bio->bi_private = dio;
-	bio->bi_end_io = iomap_dio_bio_end_io;
+	bio_init_fields(bio, iomap->bdev, iomap_sector(iomap, pos), dio,
+			iomap_dio_bio_end_io, 0, 0);
 
 	get_page(page);
 	__bio_add_page(bio, page, len, 0);
@@ -272,12 +270,9 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
-		bio_set_dev(bio, iomap->bdev);
-		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
-		bio->bi_write_hint = dio->iocb->ki_hint;
-		bio->bi_ioprio = dio->iocb->ki_ioprio;
-		bio->bi_private = dio;
-		bio->bi_end_io = iomap_dio_bio_end_io;
+		bio_init_fields(bio, iomap->bdev, iomap_sector(iomap, pos), dio,
+				iomap_dio_bio_end_io, dio->iocb->ki_ioprio,
+				dio->iocb->ki_hint);
 
 		ret = bio_iov_iter_get_pages(bio, dio->submit.iter);
 		if (unlikely(ret)) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
