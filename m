Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C902FB32C
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 603E542063E;
	Tue, 19 Jan 2021 08:37:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56FB14202DB
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033212; x=1642569212;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=SfOR1N23M96OkPDJoP/n7nGLStD8Ilx5NPXdrP89w9Y=;
	b=ZzWl2/sxedhdWqv6r31GnTQXQg8W5NbaGWOQjDHpvfkihIYnoLynXyNx
	Kb4EK4I+PuPt+fCMaSe+WvfhAtBgvbQ4WR2MSK8pvwN2aosRwbwm0Ti7A
	9zveCnnhGUKzC1trmKSX2E6VFmDhzv5WrKsViICAPt+U76d67i3SXjAlv
	oWRvLDZZB9VVULWlOFuNRxOEfOdV9US3QvE/JSRn7g4x0Zw6TlgrSZRhu
	lt1yt0iRqQeO4GERMwI+7pBq1lJiQUqx3bRAnfLCRpcZrTGojn3b1k5eh
	KkzG5YtCa5uFNsedmpEXnjN/J0Djt/Rx89kysLRDcTgQERqZ5x+UUKG91 A==;
IronPort-SDR: Nvx2KbgWkKHtzotB/kOydnyHOZYsu98WTvblaZLg9nsfcr4PRH5lJdcWCCDFti234LsxcdlR5t
	fRAH2U3EihAvz+zGI23X9mnM24FvLyY7JE/gOr0KYaDrTF0bU732qMP/Vu3Km4DS7DcVY7Szlb
	Ns2P120I7JMP3IrPri0UQG3fjVDcpxovaY5a5v5P/zm4GTzdk4hCdIkZIHrGZa9S7z5P4BuU+t
	QJ0vHBj/pOOvQEr3SYykEA0birVtmFvEfKLDUtyBm1AAC5hHOC9HLE097Pe7rJpwyhf0wtJFgM
	A6g=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758827"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:26 +0800
IronPort-SDR: PsElM4kp2xwUVm1qha2k6jGpzt0LJnIvTbY4zf2X2hpNChhEyvbNG+rnm5Eis8qSGeeNHj1Hs7
	vx+5XosDuJyQnMkcYmil+MH9OM7TPU+w+oGTz5S5M/RdcTqcdwvf4rpZO4kvfXhgxwrvDBar4Y
	g/GBCAWP586sb5MrOjhIDzgGaQVv8+sAj1/Iro4aM8WcWtzTkP1Amf3YDfzb4uQ3ysxeVAGfwt
	WGi9g7+utEqbLv5i3AIwoO4BhABZceQEZSq3pY+8GGCxwbt/RAGas5MAkRRxrCAKvLJrf7Y/md
	VgmclOZUabZW+KKypl7pTiVj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:01 -0800
IronPort-SDR: g+cwRIOSTQKlHz0TlzGiv0v8k42MLuyBePoSPu+3wmyOXSjTG0meJZ3HNMEsZPrUSxEzx4+lF4
	FYsGsM8Atqm4KFkngm6kvE4QJEllDZ5asdg1mlTg0nU6MTigdf/l2fufhP5Dl7cUEXrLWJHA4M
	i1hr5sj5wFf0lV2dBD1wzV0FFnhC0FI0FF05HNG+z9KgIFkwL1XTF/q4l1wSPXPSYwzrtYoVOq
	9diXh4xtcenoTU75CyxNQYMQeVt6zVGgTEkE1aGBQ3BRhKLM/ozH18RVsbfAAMJYj8MbBfck/x
	vIk=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:26 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:26 -0800
Message-Id: <20210119050631.57073-33-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 32/37] eros: use bio_init_fields in zdata
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
 fs/erofs/zdata.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 6cb356c4217b..f7cdae88982a 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1236,12 +1236,9 @@ static void z_erofs_submit_queue(struct super_block *sb,
 
 			if (!bio) {
 				bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
-
-				bio->bi_end_io = z_erofs_decompressqueue_endio;
-				bio_set_dev(bio, sb->s_bdev);
-				bio->bi_iter.bi_sector = (sector_t)cur <<
-					LOG_SECTORS_PER_BLOCK;
-				bio->bi_private = bi_private;
+				bio_init_fields(bio, sb->s_bdev, (sector_t)cur <<
+					LOG_SECTORS_PER_BLOCK, bi_private,
+					z_erofs_decompressqueue_endio, 0, 0);
 				bio->bi_opf = REQ_OP_READ;
 				if (f->readahead)
 					bio->bi_opf |= REQ_RAHEAD;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
