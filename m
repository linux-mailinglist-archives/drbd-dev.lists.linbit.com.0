Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7F2FB327
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:01 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FCDA420626;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B555420231
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033170; x=1642569170;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=qoLn2/rcoIe5Xy1n1hC3Lt6hQmgoOhAQmKsRVXN2pPE=;
	b=MZaVspuVG9DX5uOHEegdOVNVxFrhyEW+0GrDU7TyiJdY4AruUyKGdr+i
	5xHFD1y66FEIfJnMbfsub4ayAkfcDHNluTa8m9ExSXI9ENN7J+2pU+Vxp
	+sXzuZaIT2EHFQUEnIjS+cxFar02zIE1xSSg/jrHBNT01HvrTxcgMdQ+B
	+QISsKOJee0wd46WF5+kr0znUHoPo5FTricr3O6wOLEVNC0psPoxmG5UF
	+TE51uHdapLxsNMb9upfrSdmRBGUPoMCtDGxIsnetmXjW5YNV6FZk7n5L
	bwD6LTbKN4XZBtPLbGmfR8wjRhUiBBELIueX4dlphH6iKHtul17bowequ A==;
IronPort-SDR: tddc8041bzFLNbiJJKAjSuqJjknGuTMlavFjRtye2010uMfnylTtNSAXkKeBMf1Ky9q7Nqp80+
	mIzonTUWDGrAJ1DCU2+/X6wVH2jARAWBmwc7/uzijfHVxQ2T0Ut3nP55h9L870xVOJ0210U8hG
	dEffyHc6dmuXjYkBDyk5eu5fRCzRjfoz2+HmojF2gZt/FEEBWp/VhXRKsyCWtJ5yJhE1rTK9ja
	LN5IkOejoagZRSeZCPO6ECuVTKYVrgtYZD6C+kDJAOXHAJ4r38kpznNZkXdxBoPTnaCZ5RDIq3
	0Cw=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201154"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:06 +0800
IronPort-SDR: H6KMdg/4ouBJVgbpiBzbXCGBxG5CmAVMTkq+lVdMxX1iwfJmHyfJG5faBHuEMvFJtRYRIO06p+
	WAMngVa60twkGyvFhEpiXWYjBXEBUWPgBNB5UAw+GnrRy6Qzbjw6MLz7sWArLRc4rr3U+Y0DKz
	gTcpS/CV3bGqzdqWnEbDfBUhZosgQYAAcjWVnNbXL/GP8nz+SNFxTOtcgScVEvljbTcQO4wBeo
	Hlz9UvFkjGMbUwWbpGifLzrQ/pEyuFcU7d8ih1LjEQFGIZnpiD07RLo19ftoI7Ht5TnoUl7q0b
	bQKiLw7KeeMb/3nXGxgSizHI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:42 -0800
IronPort-SDR: YTx2sPI+S6B3s0zwLxmE9JLYYaAYYdsBlTi/QBtBxd/WH8egWo/s2t318EELWraWDHn4aYbSz+
	GTI/c0RV1f+ot/Yyog9omiJsfpSR5vK5KT4IJoKlPtJElbAfKckX/OVaF06ki+8DfWwezcFUha
	cQceDg9EfnRtvtgEBcHMkJqbMz+Hf9lDezVT3gRBkt4FXtAK8F0+3Jw8Dlu3r3MJXdxsm4oEy7
	lej+XAjPd2ZdZGUr333NTWzmm/vXM3I7gj6chGIMLH1v36uCSVr35WYHxwt+NXTGuosML8y4Lr
	Cxg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:06 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:15 -0800
Message-Id: <20210119050631.57073-22-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 21/37] dm-bufio: use bio_init_fields
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
 drivers/md/dm-bufio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 9c1a86bde658..1295e7e33e06 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -633,11 +633,8 @@ static void use_bio(struct dm_buffer *b, int rw, sector_t sector,
 		return;
 	}
 
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, b->c->bdev);
 	bio_set_op_attrs(bio, rw, 0);
-	bio->bi_end_io = bio_complete;
-	bio->bi_private = b;
+	bio_init_fields(bio, b->c->bdev, sector, b, bio_complete, 0, 0);
 
 	ptr = (char *)b->data + offset;
 	len = n_sectors << SECTOR_SHIFT;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
