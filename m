Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB8F2FB343
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EFA9F420833;
	Tue, 19 Jan 2021 08:38:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03B374205E5
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:16:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033376; x=1642569376;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=kVFX0znrSc+8VbzsAzlWslK9G1sWqMMHsAPd6F9G8C0=;
	b=fNfTd5oCuaId9K6ZmUCC53AIHFIWgDDOgmd6KFSaoOgl//ErbE6aTLxk
	JJ0yWb1OU0huVxGXIOS4ZLQMei6VmuEH4ytjWJcl3ojwCw8v8G+50xnXX
	9E2esb/B+si/e1gY8hcoRFaBlq1oqcrTx5fstmZM9QwjYWvPz32aStGTC
	66qTRLPQEBtM+/oaRyREUSVLvhUAKIgcuOjuhnpATFRdtCdwv2hoJdLP/
	/ZWhegHWwxmat0b2JuJOHkvibzx/BFzLSJwadBzmK6CBmiX3yoXOGAPHe
	Q1uJokOJieC3KSASQASILtav0Wy++YyWFCAYYKLu5MwpVwL5Coh1RZ8qs Q==;
IronPort-SDR: 7S+YDmgUF3Kp0n/zYoa+9pqJt1aYAskg19IMcJ+c1rrjj4SrkTHmV43VxnTyRtvBgJf1vW2mVd
	ca6P3iurKmw1m2ZONVLWz26x36KbEK7k2c/35NcBOT6iFoW2pCHR0lQiQf3JSmONcIaSE5voND
	eNaq/gyL8Wqn+o2cmsNA/hqr8lnH22TtY2iE+tcMOJkV56TXJKifPlA9b0nerKzCxKVSKKvthG
	f2VtY0cr6ux1PTImOsufMZlx5YmjsbQAhbD8UEHT7Sh3qK+KoMN9dBqL6jnirgbQ8o+4f/QHC7
	uGI=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940633"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:59 +0800
IronPort-SDR: Z0jYS4mJd3a2+//QSbIzUVSsvcMiYKW1HvBELzmqzve+NSYHEAZvSzVa81RcXI9BeWgw/0cPUq
	hwBQHBWmMsU6hC0od5ZoEVXnnbrRRFLyAtd7Gjqo7EPOpoYG5L2KPVhdyLS/5t+b0flyQkeYZZ
	EwiqLVms3svbH5RnCrB9i13puPO3WwJc70mcmmnCyKG57soH9G/Mr8hjMQDvArSyiayDJnkvV9
	uJHCecMqN4pzts0EsbFuzLTGtrrPkNdgnxVb4j9th6SWZDyDab6qFmSWXfV2C+N7bkY+aW71Wp
	MF2EFkgaN7SVkbljYSTL8heS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:36 -0800
IronPort-SDR: jlVjSrblz306Hto1pLF+Ht0EEquCddwQbUHFuCddrqoN07zLTxnOBCPrasx6QzbFI3wH8LUOM6
	f1riISJo1ZfVD8XFhKudLwqjNPGTk45UkBknW/fvY8/YSLAFyl7p/oEVvVwMk/Qs1/83QCrF4q
	ATtQzOiVpqAKtEILRicfThLBsahVfoN7j2kdMa4Kjuo9XbLFp402k/0XWqZ4GyoE/rJecEZ36T
	8WqaSeI83mvc1WGr9SQTI7cT3Gl1099yvZzXS5oMJnA3jan5x1SLdjiEGtr/xqjinEgosWxBG6
	/Qk=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:58 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:14 -0800
Message-Id: <20210119050631.57073-21-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 20/37] bcache: use bio_init_fields in
	writeback
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
 drivers/md/bcache/writeback.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.c
index a129e4d2707c..e2b769bbdb14 100644
--- a/drivers/md/bcache/writeback.c
+++ b/drivers/md/bcache/writeback.c
@@ -358,10 +358,8 @@ static void write_dirty(struct closure *cl)
 	if (KEY_DIRTY(&w->key)) {
 		dirty_init(w);
 		bio_set_op_attrs(&io->bio, REQ_OP_WRITE, 0);
-		io->bio.bi_iter.bi_sector = KEY_START(&w->key);
-		bio_set_dev(&io->bio, io->dc->bdev);
-		io->bio.bi_end_io	= dirty_endio;
-
+		bio_init_fields(&io->bio, io->dc->bdev, KEY_START(&w->key), NULL,
+				dirty_endio, 0, 0);
 		/* I/O request sent to backing device */
 		closure_bio_submit(io->dc->disk.c, &io->bio, cl);
 	}
@@ -471,10 +469,10 @@ static void read_dirty(struct cached_dev *dc)
 
 			dirty_init(w);
 			bio_set_op_attrs(&io->bio, REQ_OP_READ, 0);
-			io->bio.bi_iter.bi_sector = PTR_OFFSET(&w->key, 0);
-			bio_set_dev(&io->bio,
-				    PTR_CACHE(dc->disk.c, &w->key, 0)->bdev);
-			io->bio.bi_end_io	= read_dirty_endio;
+			bio_init_fields(&io->bio,
+				PTR_CACHE(dc->disk.c, &w->key, 0)->bdev,
+				PTR_OFFSET(&w->key, 0), NULL,
+				read_dirty_endio, 0, 0);
 
 			if (bch_bio_alloc_pages(&io->bio, GFP_KERNEL))
 				goto err_free;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
