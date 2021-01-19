Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4892FB33F
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFB2242081B;
	Tue, 19 Jan 2021 08:37:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F055B420619
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033314; x=1642569314;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=M0Lda0zS+SL7SE0DDozfWug6B1E4kFe/5QgiyTYkgeo=;
	b=V7d+JreSBwEiPoeG+G3yOWCsSXbZVVA0/TmP0F1E2XXec/fLfhRn/tf+
	n/cylpExkRkSd7meamqc0nLs/tw8pffc9fOBoOToFuJzB/PoPoBnAxnxp
	RpRMixexIYxtprfj/xRagebW5Xhl3usAvZyQU7KqXh90f1N7kxGADDNtk
	s/p40sDeGDUG39SW1eit/65GI9SvZfgs8U5lgescpDFJkLyjk06ZHaZw0
	rBxcHsCTMfHhLwyI9mrSt0fE1HOWrM8AtuoKpGhTdTUgLwCOJLmAY+GER
	4oAb8V8kY1PHd2QQVIuNdXQGgbOwntczgacIjQqYsw5kACxvsfnk2yTAK g==;
IronPort-SDR: eO5J5ANzuY0iLBX7W2KViwfV7si6ARv0Wp527kMQ1HTkq6GK/s8BaX0Nzvmz/aI+kDeUjq40Ve
	uF6jG8iCvPMUP8+LLpRqVgevrVDtGaO9PBsq0D9zLT1V2ePEgEL0Xe2XI2JgFtND1HUgG2MJwm
	7zw1vXjtx7PgJo3HHEaR+kC1Ea5tK9HP7en/ZyZl9+eW8zZ0H9U5MPyPjvcbG7Fr/3Yu5gSK99
	BpcFVwZzpJAKQtwsNL0+7C/cCgThv/E8sX5vo390dgE2ucNo02ozIFHALVEn6RwQ/71fzsiprv
	5bY=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157763814"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:19 +0800
IronPort-SDR: 280IwPawUJXh/C/NUQ0SWGK5oa56GMe25BGQK+WQHbg4dBHye2GzI6a2aaI7Sf1e1pjTtLFtXY
	CAnL2+lHbWF5yACyx1MzU1p0EHiRfBq+LRDXLFcJ6aMUJPadtvF/uTUGiKAZy0rK42blebyCVz
	qZOpk7g6seZ3QvatJLsSaSyb+yJtmkZk9ZE7UjW8MC7usGr0XsS/EeJwawiniR/Rekzy7ht24R
	Ecm9uM7ULeeueTnZOyJfOjqC78EL8PdDG4gNz2dGbS64bOhuGuYqy8fSP79Cy5wnM8ByRZqz4q
	leQUzpQPWP7gXll2Z1fx+/vS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:56 -0800
IronPort-SDR: QBnDS7DVrddQpcsFsBzx6dUP1vCou2zr2+U/E8LncZi1HXSOtDax3BLEkAh4fkXsMSmQFWPGFy
	i9c3j/giOOU39nkkPY4ax6KBgaPpzPJAoufKOchG2Ou0rmyaYFKJUhk8ZPDWpGoP3x51bQeso4
	ExxBU/jV033SF8Q+teRhuDUjl9XHjbBJkEt8Ba8a4jICbdKDHOxkWO7MzEPD0dB8h3reWZeWBh
	KVK+JCC1W+90P0+/EdNiEnUM8xRZsi0+PwhkhSGTp7e4x6m4p6jDgQlTHPkRvWkNPGtHl7ZAoZ
	Mec=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:19 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:00 -0800
Message-Id: <20210119050631.57073-7-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 06/37] gfs2: use bio_init_fields in lops
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
 fs/gfs2/lops.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3922b26264f5..9f8a9757b086 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -264,10 +264,8 @@ static struct bio *gfs2_log_alloc_bio(struct gfs2_sbd *sdp, u64 blkno,
 	struct super_block *sb = sdp->sd_vfs;
 	struct bio *bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
 
-	bio->bi_iter.bi_sector = blkno << sdp->sd_fsb2bb_shift;
-	bio_set_dev(bio, sb->s_bdev);
-	bio->bi_end_io = end_io;
-	bio->bi_private = sdp;
+	bio_init_fields(bio, sb->s_bdev, blkno << sdp->sd_fsb2bb_shift,
+			sdp, end_io, 0, 0);
 
 	return bio;
 }
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
