Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDAA2FB347
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83BFA420852;
	Tue, 19 Jan 2021 08:38:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE37942061F
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033413; x=1642569413;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=w8Mrhn53C/xIBUdIFO7UKVArjHLD+jnktLncJKflGH0=;
	b=DJVrXtXQPt2v81XSi8eFLpoEr1+rmi6I9cU2rXYHJQl2zA3W0qmyXLRZ
	DhWStrBJM/9VpDPXSydJJfak0VjLHVBVeRBgldqaNyPx+DV59RZUw7TQS
	5V0bfe2jX4hj7jt1uFGBa5ZyTLgqy7bYJ8iAgJ6O0PT2qEfNxaeh0hXLB
	iA7Fig5aN+wSc+B0zwMZAmjzm+2QAPPv8X1WwOatQrL8s8npA9DX8hU5H
	/eZJSikcLC8yAOiyk0ogtBeYiCYAe364PHaAPvmOoANrgv1NCmVP5dXYT
	auziUtDlHOzqJy+I4zKnrwbMcjlwVvPisHeKh+7yVjlQxwFDAl4SyNVGj g==;
IronPort-SDR: pEwpdiAxBjnrYF0TiJTIyxT+ULlugoLHhQfjRqMbtHeBudnWBPH7UKrIIbFQvdbRdCHe5vjmzv
	yH6PfRVckArNA35z6ZUnhMFiaMbInZOTEtMHjrcvNDwjYoRKyN6haHH9GmTqUwZRk52BG5zimS
	nf9Bd5xjc/6BOgvhrKerA+ZE0QwfhSNDUoIqqeVq7ZSb7o3tgKrIQ5c+mvZOmOPInjpoOdUNEt
	YZlWQF1L4bipQxl/kxej/1Gwb+vIzJAI+7724BS1VK3qY3xiUvSTd/TntDTvtLUW4OTgsyBlDx
	lhU=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201105"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:44 +0800
IronPort-SDR: mLJsRRFKZrs0Ypz6MBFtCpGx357EtL79TE3U4FlB+vDw07mUN/C0OQIfJI7ANB5STvYI2JWAC/
	71SjeypU5rytJkdWtOwgh4fYtuX9jNEtf4O4KS4MYPGhKjzYkq7jrurtiNFWItEA2g7oa5rk4U
	BY6Xb36oDpuYSkfBsbSqekrJEVnRfWSf69nUsg/7Q4KzVuU1QexbZ9gdsnTtK0IC8XyqWiDv5E
	e5X7k1pI+CCDgDgvrVJhLWqMAh35NYXOQzOa1JAq61fF4lb6fh+tYHxnJ0jzKGeJFROkMZ/Xao
	N7xY+dYYTzOFnoSWSsxVdRbR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:20 -0800
IronPort-SDR: xHO7HSedCSnJKcraGlp7cKbNn6U0vc/h0J7EqOAnrofU3EEgY4EwjLXGgaVPQ5fUfdFd219vRC
	LbXct13YZVVN6KiDu7+byPcBbjh+W64o6mdrAGqpUIdo+laa5H7zxxeLGqJmYjiZ2ypNwYS6EG
	9RidoyBhQkvm19kb9tceoxELnw81qM1BKYuv80rD63H6aZrLZIzawrq4dPgHk7mfEo+EtG3r5z
	NCmJQgYY2IUYeXtIflYFA9t16yIX5Qq8Uqp9iDzkQXKkZabUiMynH1bRZzCY09gOJtgWn+rlXY
	Wrs=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:44 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:12 -0800
Message-Id: <20210119050631.57073-19-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 18/37] bcache: use bio_init_fields in journal
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
 drivers/md/bcache/journal.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/md/bcache/journal.c b/drivers/md/bcache/journal.c
index aefbdb7e003b..0aabcb5cf2ad 100644
--- a/drivers/md/bcache/journal.c
+++ b/drivers/md/bcache/journal.c
@@ -54,12 +54,10 @@ reread:		left = ca->sb.bucket_size - offset;
 		len = min_t(unsigned int, left, PAGE_SECTORS << JSET_BITS);
 
 		bio_reset(bio);
-		bio->bi_iter.bi_sector	= bucket + offset;
-		bio_set_dev(bio, ca->bdev);
+		bio_init_fields(bio, ca->bdev, bucket + offset,
+				&cl, journal_read_endio, 0, 0);
 		bio->bi_iter.bi_size	= len << 9;
 
-		bio->bi_end_io	= journal_read_endio;
-		bio->bi_private = &cl;
 		bio_set_op_attrs(bio, REQ_OP_READ, 0);
 		bch_bio_map(bio, data);
 
@@ -588,6 +586,7 @@ static void do_journal_discard(struct cache *ca)
 {
 	struct journal_device *ja = &ca->journal;
 	struct bio *bio = &ja->discard_bio;
+	sector_t sect;
 
 	if (!ca->discard) {
 		ja->discard_idx = ja->last_idx;
@@ -613,12 +612,10 @@ static void do_journal_discard(struct cache *ca)
 
 		bio_init(bio, bio->bi_inline_vecs, 1);
 		bio_set_op_attrs(bio, REQ_OP_DISCARD, 0);
-		bio->bi_iter.bi_sector	= bucket_to_sector(ca->set,
-						ca->sb.d[ja->discard_idx]);
-		bio_set_dev(bio, ca->bdev);
 		bio->bi_iter.bi_size	= bucket_bytes(ca);
-		bio->bi_end_io		= journal_discard_endio;
-
+		sect = bucket_to_sector(ca->set, ca->sb.d[ja->discard_idx]);
+		bio_init_fields(bio, ca->bdev, sect, NULL,
+				journal_discard_endio, 0, 0);
 		closure_get(&ca->set->cl);
 		INIT_WORK(&ja->discard_work, journal_discard_work);
 		queue_work(bch_journal_wq, &ja->discard_work);
@@ -774,12 +771,10 @@ static void journal_write_unlocked(struct closure *cl)
 		atomic_long_add(sectors, &ca->meta_sectors_written);
 
 		bio_reset(bio);
-		bio->bi_iter.bi_sector	= PTR_OFFSET(k, i);
-		bio_set_dev(bio, ca->bdev);
 		bio->bi_iter.bi_size = sectors << 9;
 
-		bio->bi_end_io	= journal_write_endio;
-		bio->bi_private = w;
+		bio_init_fields(bio, ca->bdev, PTR_OFFSET(k, i), w,
+				journal_write_endio, 0, 0);
 		bio_set_op_attrs(bio, REQ_OP_WRITE,
 				 REQ_SYNC|REQ_META|REQ_PREFLUSH|REQ_FUA);
 		bch_bio_map(bio, w->data);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
