Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1F2FB348
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E25AE420857;
	Tue, 19 Jan 2021 08:38:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC3F44202DB
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:17:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033442; x=1642569442;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=wDWv58LHKZByyePyDiVmBTfQ0E5jsIWpV0zm9LPXpkA=;
	b=HjEGV6+H3tUEY5+yTrHBP3HxIXplQKxfEmVL2ZP6o9lCmllQtEGnsq++
	AST7x48BGUMyjs6s4zjVzeBLQmCVYC6HSexJpthFj8RsNaxL/OM0Qum2e
	mziagTti3xiqHG7RkBB+xfTw3XbjnPcHraK1NIjGvOFdkzo2xWLvfz0gf
	K6a/62lgXNZQw70FLXSP4IWVmxIs69wdGzAnnCx7X7n7ay1/Z9hnv+fgy
	IZ6GSgTCoL/jiq/CkYSU0P3WlhjnAUIO0I59kZov710T8VJ4rdL4oizO/
	HEtk0newqhyXf/lZiONbJCbQV9UYVYkqS0ns1SlBhFLyTFpS1xGwY89WO Q==;
IronPort-SDR: Z1IoG53t2fiKDtbGIfXmry9ZkjrBnyeuTGiPPtoZSm3bS7f3butLi6yzgc9+SZB9ZN1b1vtQSd
	ENGj3vEGRFuQo3jAjtcwTo/bwdYOUP45/z48kP6HUztC8N3jNsTGN5U3F10Ra1OZg5j8CuqgDd
	+isTbmfkbC8o/Ue58QJoWUy++c9kzdlOfUsqmZymJp1ii4pWyfnh48fEBNLhGU/I0wu9+ZC64d
	X6xxulPFhv/sVkO6rfoQD3HVskmWeNpl02f4xj78pSd/joj6/vE+EGHZG1epHACOZkQsm9UMpu
	W8k=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157763945"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:51 +0800
IronPort-SDR: 81GnWy73cZrOlB+suPJtmQd6YSsQMuoerm5+OKtZ2Ow22nk3XELNgU1NgMdORfY4AiHbKDS2iT
	FVkmdAyNSydEb6icVi9IROt60iq8ESvuHoKwookxvY+H4j3Xey9/FwC1TbxkGdpcYnHImyPltp
	YsQo51Rw5Rcsy1iClLBSatty5GUN5sxPqhQZrdW/j2awhJ3mwXDmHmURjMYTLWlR4pBsvMuR1Q
	APvV07XLwVInAd1F4HhjNxLLB0uK01SFIyGg2CXow6RW690Ll9w94pZkPDBpurql+dRHZSixQ5
	acQISxprGndiq2asF+glUiGK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:29 -0800
IronPort-SDR: zqmdr8uNSGUFgZ7LrU0GCeEBE+HwqEp3d6yRCc4vmJxwtA/Yo4CFOUY62UCXmXuPUcpvGTrzPZ
	ZvCO6cAymIpMTiIbl4e2oge4VHFzjo0lUvlL/UEVWaUmjNMbvFL6pQOn3IbgBdVAxsKv/xFkfH
	Muc3sg0LIgVa0PCQf7zl6WshjAalrUxlLiYGPDB48hNEN7m0zho6fJXM/WqCYq7SGSNzGvX8Gl
	6TzvHwI3LTXrv+sfDj/IEWvxKvmwhi3VABVseKTOUqh9RvyxCMjwM25iJM4iyI7r5ezZ5UcdOF
	Ldg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:51 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:13 -0800
Message-Id: <20210119050631.57073-20-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 19/37] bcache: use bio_init_fields in super
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
 drivers/md/bcache/super.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index a4752ac410dc..b4ced138a0c0 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -312,9 +312,7 @@ void bch_write_bdev_super(struct cached_dev *dc, struct closure *parent)
 	closure_init(cl, parent);
 
 	bio_init(bio, dc->sb_bv, 1);
-	bio_set_dev(bio, dc->bdev);
-	bio->bi_end_io	= write_bdev_super_endio;
-	bio->bi_private = dc;
+	bio_init_fields(bio, dc->bdev, 0, dc, write_bdev_super_endio, 0, 0);
 
 	closure_get(cl);
 	/* I/O request sent to backing device */
@@ -356,9 +354,7 @@ void bcache_write_super(struct cache_set *c)
 		ca->sb.version = version;
 
 	bio_init(bio, ca->sb_bv, 1);
-	bio_set_dev(bio, ca->bdev);
-	bio->bi_end_io	= write_super_endio;
-	bio->bi_private = ca;
+	bio_init_fields(bio, ca->bdev, 0, ca, write_super_endio, 0, 0);
 
 	closure_get(cl);
 	__write_super(&ca->sb, ca->sb_disk, bio);
@@ -402,9 +398,7 @@ static void uuid_io(struct cache_set *c, int op, unsigned long op_flags,
 
 		bio->bi_opf = REQ_SYNC | REQ_META | op_flags;
 		bio->bi_iter.bi_size = KEY_SIZE(k) << 9;
-
-		bio->bi_end_io	= uuid_endio;
-		bio->bi_private = cl;
+		bio_init_fields(bio, NULL, 0, cl, uuid_endio, 0, 0);
 		bio_set_op_attrs(bio, op, REQ_SYNC|REQ_META|op_flags);
 		bch_bio_map(bio, c->uuids);
 
@@ -566,12 +560,9 @@ static void prio_io(struct cache *ca, uint64_t bucket, int op,
 
 	closure_init_stack(cl);
 
-	bio->bi_iter.bi_sector	= bucket * ca->sb.bucket_size;
-	bio_set_dev(bio, ca->bdev);
 	bio->bi_iter.bi_size	= meta_bucket_bytes(&ca->sb);
-
-	bio->bi_end_io	= prio_endio;
-	bio->bi_private = ca;
+	bio_init_fields(bio, ca->bdev, bucket * ca->sb.bucket_size, ca,
+			prio_endio, 0, 0);
 	bio_set_op_attrs(bio, op, REQ_SYNC|REQ_META|op_flags);
 	bch_bio_map(bio, ca->disk_buckets);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
